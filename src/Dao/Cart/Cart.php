<?php

namespace Dao\Cart;

class Cart extends \Dao\Table
{
    public static function getProductosDisponibles()
    {
        $sqlAllProductosActivos = "SELECT * from productos where productoEstado in ('ACT');";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array());

        //Sacar el stock de productos con carretilla autorizada
        $deltaAutorizada = \Utilities\Cart\CartFns::getAuthTimeDelta();
        $sqlCarretillaAutorizada = "select productoId, sum(crrctd) as reserved
            from carretilla where TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by productoId;";
        $prodsCarretillaAutorizada = self::obtenerRegistros(
            $sqlCarretillaAutorizada,
            array("delta" => $deltaAutorizada)
        );
        //Sacar el stock de productos con carretilla no autorizada
        $deltaNAutorizada = \Utilities\Cart\CartFns::getUnAuthTimeDelta();
        $sqlCarretillaNAutorizada = "select productoId, sum(crrctd) as reserved
            from carretillaanon where TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by productoId;";
        $prodsCarretillaNAutorizada = self::obtenerRegistros(
            $sqlCarretillaNAutorizada,
            array("delta" => $deltaNAutorizada)
        );
        $productosCurados = array();
        foreach ($productosDisponibles as $producto) {
            if (!isset($productosCurados[$producto["productoId"]])) {
                $productosCurados[$producto["productoId"]] = $producto;
            }
        }
        foreach ($prodsCarretillaAutorizada as $producto) {
            if (isset($productosCurados[$producto["productoId"]])) {
                $productosCurados[$producto["productoId"]]["productoStock"] -= $producto["reserved"];
            }
        }
        foreach ($prodsCarretillaNAutorizada as $producto) {
            if (isset($productosCurados[$producto["productoId"]])) {
                $productosCurados[$producto["productoId"]]["productoStock"] -= $producto["reserved"];
            }
        }
        $productosDisponibles = null;
        $prodsCarretillaAutorizada = null;
        $prodsCarretillaNAutorizada = null;
        return $productosCurados;
    }

    public static function getProductoDisponible($productoId)
    {
        $sqlAllProductosActivos = "SELECT * from productos where productoEstado in ('ACT') and productoId=:productoId;";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array("productoId" => $productoId));

        //Sacar el stock de productos con carretilla autorizada
        $deltaAutorizada = \Utilities\Cart\CartFns::getAuthTimeDelta();
        $sqlCarretillaAutorizada = "select productoId, sum(crrctd) as reserved
            from carretilla where productoId=:productoId and TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by productoId;";
        $prodsCarretillaAutorizada = self::obtenerRegistros(
            $sqlCarretillaAutorizada,
            array("productoId" => $productoId, "delta" => $deltaAutorizada)
        );
        //Sacar el stock de productos con carretilla no autorizada
        $deltaNAutorizada = \Utilities\Cart\CartFns::getUnAuthTimeDelta();
        $sqlCarretillaNAutorizada = "select productoId, sum(crrctd) as reserved
            from carretillaanon where productoId = :productoId and TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by productoId;";
        $prodsCarretillaNAutorizada = self::obtenerRegistros(
            $sqlCarretillaNAutorizada,
            array("productoId" => $productoId, "delta" => $deltaNAutorizada)
        );
        $productosCurados = array();
        foreach ($productosDisponibles as $producto) {
            if (!isset($productosCurados[$producto["productoId"]])) {
                $productosCurados[$producto["productoId"]] = $producto;
            }
        }
        foreach ($prodsCarretillaAutorizada as $producto) {
            if (isset($productosCurados[$producto["productoId"]])) {
                $productosCurados[$producto["productoId"]]["productoStock"] -= $producto["reserved"];
            }
        }
        foreach ($prodsCarretillaNAutorizada as $producto) {
            if (isset($productosCurados[$producto["productoId"]])) {
                $productosCurados[$producto["productoId"]]["productoStock"] -= $producto["reserved"];
            }
        }
        $productosDisponibles = null;
        $prodsCarretillaAutorizada = null;
        $prodsCarretillaNAutorizada = null;
        return $productosCurados[$productoId];
    }

    public static function addToAnonCart(
        int $productoId,
        string $anonCod,
        int $amount,
        float $price
    ) {
        $validateSql = "SELECT * from carretillaanon where anoncod = :anoncod and productoId = :productoId";
        $producto = self::obtenerUnRegistro($validateSql, ["anoncod" => $anonCod, "productoId" => $productoId]);
        if ($producto) {
            if ($producto["crrctd"] + $amount <= 0) {
                $deleteSql = "DELETE from carretillaanon where anoncod = :anoncod and productoId = :productoId;";
                return self::executeNonQuery($deleteSql, ["anoncod" => $anonCod, "productoId" => $productoId]);
            } else {
                $updateSql = "UPDATE carretillaanon set crrctd = crrctd + :amount where anoncod = :anoncod and productoId = :productoId";
                return self::executeNonQuery($updateSql, ["anoncod" => $anonCod, "amount" => $amount, "productoId" => $productoId]);
            }
        } else {
            return self::executeNonQuery(
                "INSERT INTO carretillaanon (anoncod, productoId, crrctd, crrprc, crrfching) VALUES (:anoncod, :productoId, :crrctd, :crrprc, NOW());",
                ["anoncod" => $anonCod, "productoId" => $productoId, "crrctd" => $amount, "crrprc" => $price]
            );
        }
    }

    public static function getAnonCart(string $anonCod)
    {
        return self::obtenerRegistros("SELECT a.*, b.crrctd, b.crrprc, b.crrfching FROM productos a inner join carretillaanon b on a.productoId = b.productoId where b.anoncod=:anoncod;", ["anoncod" => $anonCod]);
    }

    public static function getAuthCart(int $usercod)
    {
        return self::obtenerRegistros("SELECT a.*, b.crrctd, b.crrprc, b.crrfching FROM productos a inner join carretilla b on a.productoId = b.productoId where b.usercod=:usercod;", ["usercod" => $usercod]);
    }

    public static function addToAuthCart(
        int $productoId,
        int $usercod,
        int $amount,
        float $price
    ) {
        $validateSql = "SELECT * from carretilla where usercod = :usercod and productoId = :productoId";
        $producto = self::obtenerUnRegistro($validateSql, ["usercod" => $usercod, "productoId" => $productoId]);
        if ($producto) {
            if ($producto["crrctd"] + $amount <= 0) {
                $deleteSql = "DELETE from carretilla where usercod = :usercod and productoId = :productoId;";
                return self::executeNonQuery($deleteSql, ["usercod" => $usercod, "productoId" => $productoId]);
            } else {
                $updateSql = "UPDATE carretilla set crrctd = crrctd + :amount where usercod = :usercod and productoId = :productoId";
                return self::executeNonQuery($updateSql, ["usercod" => $usercod, "amount" => $amount, "productoId" => $productoId]);
            }
        } else {
            return self::executeNonQuery(
                "INSERT INTO carretilla (usercod, productoId, crrctd, crrprc, crrfching) VALUES (:usercod, :productoId, :crrctd, :crrprc, NOW());",
                ["usercod" => $usercod, "productoId" => $productoId, "crrctd" => $amount, "crrprc" => $price]
            );
        }
    }

    public static function moveAnonToAuth(
        string $anonCod,
        int $usercod
    ) {
        $sqlstr = "INSERT INTO carretilla (usercod, productoId, crrctd, crrprc, crrfching)
        SELECT :usercod, productoId, crrctd, crrprc, NOW() FROM carretillaanon where anoncod = :anoncod
        ON DUPLICATE KEY UPDATE carretilla.crrctd = carretilla.crrctd + carretillaanon.crrctd;";

        $deleteSql = "DELETE FROM carretillaanon where anoncod = :anoncod;";
        self::executeNonQuery($sqlstr, ["anoncod" => $anonCod, "usercod" => $usercod]);
        self::executeNonQuery($deleteSql, ["anoncod" => $anonCod]);
    }

    public static function getProducto($productoId)
    {
        $sqlAllProductosActivos = "SELECT * from productos where productoId=:productoId;";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array("productoId" => $productoId));
        return $productosDisponibles;
    }

    public static function obtenerproductosFiltrados(?string $categoriaNombre = null): array
    {
        $sql = "SELECT * FROM productos";
        $params = [];

        if (!empty($categoriaNombre)) {
            $sql .= " WHERE productoGenero = :categoria";
            $params['categoria'] = $categoriaNombre;
        }

        return self::obtenerRegistros($sql, $params);
    }


    public static function obtenerCategoriasDisponibles(): array
    {
        $sql = "SELECT DISTINCT productoGenero FROM productos ORDER BY productoGenero ASC";
        $result = self::obtenerRegistros($sql, []);
        return array_column($result, 'productoGenero');
    }
}
