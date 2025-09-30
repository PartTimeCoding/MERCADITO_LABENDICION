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
            $userId = Security::getUserId();
            $carretilla = Cart::getAuthCart($userId);

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

            // Crear pedidos con parámetros explícitos
            foreach ($carretilla as $item) {
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

            $viewData['mensaje'] = "¡Compra realizada con éxito!";
        } else {
            $viewData['mensaje'] = "Error al procesar el pago";
        }

        \Views\Renderer::render("paypal/accept", $viewData);
    }
}
