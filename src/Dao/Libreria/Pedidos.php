<?php

namespace Dao\Libreria;

class Pedidos extends \Dao\Table
{
    public static function crearPedido($datos)
    {
        $sql = "INSERT INTO pedidos 
                (ordenId, libroId, cantidad, precioUnitario) 
                VALUES 
                (:ordenId, :libroId, :cantidad, :precioUnitario)";

        $params = [
            "ordenId" => $datos['ordenId'],
            "libroId" => $datos['libroId'],
            "cantidad" => $datos['cantidad'],
            "precioUnitario" => $datos['precioUnitario']
        ];

        return self::executeNonQuery($sql, $params);
    }
}
