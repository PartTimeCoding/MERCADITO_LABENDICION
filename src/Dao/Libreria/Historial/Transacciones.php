<?php

namespace Dao\Libreria\Historial;

class Transacciones extends \Dao\Table
{
    public static function crearTransaccion($datos)
    {
        $sql = "INSERT INTO transacciones 
                (ordenId, orderjson) 
                VALUES 
                (:ordenId, :orderjson)";

        $params = [
            "ordenId" => $datos['ordenId'],
            "orderjson" => json_encode($datos['orderjson'])  // Convertir objeto a JSON aquí
        ];

        return self::executeNonQuery($sql, $params);
    }

    public static function obtenerTransaccionPorOrden($ordenId)
    {
        $sql = "SELECT * FROM transacciones WHERE ordenId = :ordenId";
        return self::obtenerUnRegistro($sql, ["ordenId" => $ordenId]);
    }
}
