<?php

namespace Dao\Pulperia\Historial;

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
            "orderjson" => json_encode($datos['orderjson'])
        ];

        return self::executeNonQuery($sql, $params);
    }
}
