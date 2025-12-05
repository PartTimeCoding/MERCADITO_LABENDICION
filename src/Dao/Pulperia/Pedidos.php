<?php

namespace Dao\Pulperia;

class Pedidos extends \Dao\Table
{
    public static function crearPedido($datos)
    {
        $sql = "INSERT INTO pedidos 
                (ordenId, productoId, cantidad, precioUnitario) 
                VALUES 
                (:ordenId, :productoId, :cantidad, :precioUnitario)";

        $params = [
            "ordenId" => $datos['ordenId'],
            "productoId" => $datos['productoId'],
            "cantidad" => $datos['cantidad'],
            "precioUnitario" => $datos['precioUnitario']
        ];

        return self::executeNonQuery($sql, $params);
    }
}
