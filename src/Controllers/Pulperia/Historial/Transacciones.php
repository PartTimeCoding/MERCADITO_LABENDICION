<?php

namespace Controllers\Pulperia\Historial;

use Controllers\PublicController;
use Dao\Pulperia\Ordenes;
use Utilities\Security;

class Transacciones extends PublicController
{
    public function run(): void
    {
        $userId = Security::getUserId();
        $ordenes = Ordenes::obtenerOrdenesPorUsuario($userId);

        $transacciones = [];
        foreach ($ordenes as $orden) {
            $orden['pedidos'] = Ordenes::obtenerPedidosPorOrden($orden['ordenId']);
            $transacciones[] = $orden;
        }

        \Views\Renderer::render(
            "pulperia/historial/transacciones",
            ['transacciones' => $transacciones]
        );
    }
}
