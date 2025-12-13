<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Libreria\Ordenes;
use Dao\Libreria\Pedidos;
use Dao\Libreria\Historial\Transacciones;
use Dao\Cart\Cart;
use Utilities\Security;

class Accept extends PublicController
{
    public function run(): void
    {
        $viewData = [];
        $token = $_GET["token"] ?? "";
        $session_token = $_SESSION["orderid"] ?? "";

        if ($token && $token === $session_token) {
            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
            );

            $orderJson = $PayPalRestApi->captureOrder($session_token);

            // VERIFICAR QUE PAYPAL COMPLETÓ EL PAGO
            if (!isset($orderJson->status) || $orderJson->status !== "COMPLETED") {
                $viewData['mensaje'] = "El pago no fue completado. Estado: " . ($orderJson->status ?? "Desconocido");
                \Views\Renderer::render("paypal/accept", $viewData);
                return;
            }

            $userId = Security::getUserId();
            $carretilla = Cart::getAuthCart($userId);

            // VERIFICAR STOCK ANTES DE PROCESAR
            foreach ($carretilla as $item) {
                $productoDisponible = Cart::getProductoDisponible($item['libroId']);
                if (!$productoDisponible || $productoDisponible['libroStock'] < $item['crrctd']) {
                    $viewData['mensaje'] = "Stock insuficiente para: " .
                        ($productoDisponible['libroNombre'] ?? 'ID: ' . $item['libroId']);
                    \Views\Renderer::render("paypal/accept", $viewData);
                    return;
                }
            }

            // Calcular total
            $total = array_reduce($carretilla, function ($sum, $item) {
                return $sum + ($item['crrprc'] * $item['crrctd']);
            }, 0);

            // Crear orden con parámetros explícitos
            $ordenId = Ordenes::crearOrden([
                'usercod' => $userId,
                'montoTotal' => $total,
                'estado' => 'Completado'
            ]);

            if (!$ordenId) {
                $viewData['mensaje'] = "Error al crear la orden";
                \Views\Renderer::render("paypal/accept", $viewData);
                return;
            }

            // Crear pedidos y REDUCIR STOCK
            foreach ($carretilla as $item) {
                $resultado = Cart::reducirStock($item['libroId'], $item['crrctd']);

                // Verificar si se redujo el stock (rowCount > 0)
                if ($resultado === 0) {
                    // Si no se afectaron filas, puede ser que no haya suficiente stock
                    // Aunque ya verificamos antes, esto es una doble verificación
                    $viewData['mensaje'] = "No se pudo reducir el stock para el producto ID: " . $item['libroId'];
                    \Views\Renderer::render("paypal/accept", $viewData);
                    return;
                }

                // Crear pedidos con parámetros explícitos
                Pedidos::crearPedido([
                    'ordenId' => $ordenId,
                    'libroId' => $item['libroId'],
                    'cantidad' => $item['crrctd'],
                    'precioUnitario' => $item['crrprc']
                ]);
            }

            // Registrar transacción con parámetros explícitos
            Transacciones::crearTransaccion([
                'ordenId' => $ordenId,
                'orderjson' => $orderJson
            ]);

            // Limpiar el carrito
            Cart::clearAuthCart($userId);

            // Limpiar sesión
            unset($_SESSION["orderid"]);

            $viewData['status'] = 'success';
            $viewData['mensaje'] = "¡Compra realizada con éxito!";
            $viewData['ordenId'] = $ordenId;
            $viewData['total'] = number_format($total, 2);
        } else {
            $viewData['status'] = 'error';
            $viewData['mensaje'] = "Error al procesar el pago";
        }

        \Views\Renderer::render("paypal/accept", $viewData);
    }
}
