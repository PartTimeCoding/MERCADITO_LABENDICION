<?php

namespace Dao\Pulperia;

class Ordenes extends \Dao\Table
{
    public static function crearOrden($datos)
    {
        $sql = "INSERT INTO ordenes 
                (usercod, montoTotal, estado) 
                VALUES 
                (:usercod, :montoTotal, :estado)";

        $params = [
            "usercod" => $datos['usercod'],
            "montoTotal" => $datos['montoTotal'],
            "estado" => $datos['estado']
        ];

        self::executeNonQuery($sql, $params);

        $sqlGet = "SELECT ordenId FROM ordenes 
                   WHERE usercod = :usercod 
                   ORDER BY fechaOrden DESC 
                   LIMIT 1";

        $orden = self::obtenerUnRegistro($sqlGet, ["usercod" => $datos['usercod']]);

        return $orden['ordenId'] ?? null;
    }

    public static function obtenerOrdenesPorUsuario($usercod)
    {
        $sql = "SELECT o.* FROM ordenes o
                WHERE o.usercod = :usercod
                ORDER BY o.fechaOrden DESC";

        return self::obtenerRegistros($sql, ["usercod" => $usercod]);
    }

    public static function obtenerPedidosPorOrden($ordenId)
    {
        $sql = "SELECT p.*, pr.productoNombre, pr.productoImgUrl 
                FROM pedidos p
                JOIN productos pr ON p.productoId = pr.productoId
                WHERE p.ordenId = :ordenId";

        return self::obtenerRegistros($sql, ["ordenId" => $ordenId]);
    }
}
