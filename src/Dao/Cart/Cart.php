<?php

namespace Dao\Cart;

class Cart extends \Dao\Table
{
    public static function getProductosDisponibles()
    {
        $sqlAllProductosActivos = "SELECT * from libros where libroEstado in ('ACT');";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array());

        //Sacar el stock de productos con carretilla autorizada
        $deltaAutorizada = \Utilities\Cart\CartFns::getAuthTimeDelta();
        $sqlCarretillaAutorizada = "select libroId, sum(crrctd) as reserved
            from carretilla where TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by libroId;";
        $prodsCarretillaAutorizada = self::obtenerRegistros(
            $sqlCarretillaAutorizada,
            array("delta" => $deltaAutorizada)
        );
        //Sacar el stock de productos con carretilla no autorizada
        $deltaNAutorizada = \Utilities\Cart\CartFns::getUnAuthTimeDelta();
        $sqlCarretillaNAutorizada = "select libroId, sum(crrctd) as reserved
            from carretillaanon where TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by libroId;";
        $prodsCarretillaNAutorizada = self::obtenerRegistros(
            $sqlCarretillaNAutorizada,
            array("delta" => $deltaNAutorizada)
        );
        $productosCurados = array();
        foreach ($productosDisponibles as $producto) {
            if (!isset($productosCurados[$producto["libroId"]])) {
                $productosCurados[$producto["libroId"]] = $producto;
            }
        }
        foreach ($prodsCarretillaAutorizada as $producto) {
            if (isset($productosCurados[$producto["libroId"]])) {
                $productosCurados[$producto["libroId"]]["libroStock"] -= $producto["reserved"];
            }
        }
        foreach ($prodsCarretillaNAutorizada as $producto) {
            if (isset($productosCurados[$producto["libroId"]])) {
                $productosCurados[$producto["libroId"]]["libroStock"] -= $producto["reserved"];
            }
        }
        $productosDisponibles = null;
        $prodsCarretillaAutorizada = null;
        $prodsCarretillaNAutorizada = null;
        return $productosCurados;
    }

    public static function getProductoDisponible($libroId)
    {
        $sqlAllProductosActivos = "SELECT * from libros where libroEstado in ('ACT') and libroId=:libroId;";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array("libroId" => $libroId));

        //Sacar el stock de productos con carretilla autorizada
        $deltaAutorizada = \Utilities\Cart\CartFns::getAuthTimeDelta();
        $sqlCarretillaAutorizada = "select libroId, sum(crrctd) as reserved
            from carretilla where libroId=:libroId and TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by libroId;";
        $prodsCarretillaAutorizada = self::obtenerRegistros(
            $sqlCarretillaAutorizada,
            array("libroId" => $libroId, "delta" => $deltaAutorizada)
        );
        //Sacar el stock de productos con carretilla no autorizada
        $deltaNAutorizada = \Utilities\Cart\CartFns::getUnAuthTimeDelta();
        $sqlCarretillaNAutorizada = "select libroId, sum(crrctd) as reserved
            from carretillaanon where libroId = :libroId and TIME_TO_SEC(TIMEDIFF(now(), crrfching)) <= :delta
            group by libroId;";
        $prodsCarretillaNAutorizada = self::obtenerRegistros(
            $sqlCarretillaNAutorizada,
            array("libroId" => $libroId, "delta" => $deltaNAutorizada)
        );
        $productosCurados = array();
        foreach ($productosDisponibles as $producto) {
            if (!isset($productosCurados[$producto["libroId"]])) {
                $productosCurados[$producto["libroId"]] = $producto;
            }
        }
        foreach ($prodsCarretillaAutorizada as $producto) {
            if (isset($productosCurados[$producto["libroId"]])) {
                $productosCurados[$producto["libroId"]]["libroStock"] -= $producto["reserved"];
            }
        }
        foreach ($prodsCarretillaNAutorizada as $producto) {
            if (isset($productosCurados[$producto["libroId"]])) {
                $productosCurados[$producto["libroId"]]["libroStock"] -= $producto["reserved"];
            }
        }
        $productosDisponibles = null;
        $prodsCarretillaAutorizada = null;
        $prodsCarretillaNAutorizada = null;
        return $productosCurados[$libroId];
    }

    public static function addToAnonCart(
        int $libroId,
        string $anonCod,
        int $amount,
        float $price
    ) {
        $validateSql = "SELECT * from carretillaanon where anoncod = :anoncod and libroId = :libroId";
        $producto = self::obtenerUnRegistro($validateSql, ["anoncod" => $anonCod, "libroId" => $libroId]);
        if ($producto) {
            if ($producto["crrctd"] + $amount <= 0) {
                $deleteSql = "DELETE from carretillaanon where anoncod = :anoncod and libroId = :libroId;";
                return self::executeNonQuery($deleteSql, ["anoncod" => $anonCod, "libroId" => $libroId]);
            } else {
                $updateSql = "UPDATE carretillaanon set crrctd = crrctd + :amount where anoncod = :anoncod and libroId = :libroId";
                return self::executeNonQuery($updateSql, ["anoncod" => $anonCod, "amount" => $amount, "libroId" => $libroId]);
            }
        } else {
            return self::executeNonQuery(
                "INSERT INTO carretillaanon (anoncod, libroId, crrctd, crrprc, crrfching) VALUES (:anoncod, :libroId, :crrctd, :crrprc, NOW());",
                ["anoncod" => $anonCod, "libroId" => $libroId, "crrctd" => $amount, "crrprc" => $price]
            );
        }
    }

    public static function getAnonCart(string $anonCod)
    {
        return self::obtenerRegistros("SELECT a.*, b.crrctd, b.crrprc, b.crrfching FROM libros a inner join carretillaanon b on a.libroId = b.libroId where b.anoncod=:anoncod;", ["anoncod" => $anonCod]);
    }

    public static function getAuthCart(int $usercod)
    {
        return self::obtenerRegistros("SELECT a.*, b.crrctd, b.crrprc, b.crrfching FROM libros a inner join carretilla b on a.libroId = b.libroId where b.usercod=:usercod;", ["usercod" => $usercod]);
    }

    public static function addToAuthCart(
        int $libroId,
        int $usercod,
        int $amount,
        float $price
    ) {
        $validateSql = "SELECT * from carretilla where usercod = :usercod and libroId = :libroId";
        $producto = self::obtenerUnRegistro($validateSql, ["usercod" => $usercod, "libroId" => $libroId]);
        if ($producto) {
            if ($producto["crrctd"] + $amount <= 0) {
                $deleteSql = "DELETE from carretilla where usercod = :usercod and libroId = :libroId;";
                return self::executeNonQuery($deleteSql, ["usercod" => $usercod, "libroId" => $libroId]);
            } else {
                $updateSql = "UPDATE carretilla set crrctd = crrctd + :amount where usercod = :usercod and libroId = :libroId";
                return self::executeNonQuery($updateSql, ["usercod" => $usercod, "amount" => $amount, "libroId" => $libroId]);
            }
        } else {
            return self::executeNonQuery(
                "INSERT INTO carretilla (usercod, libroId, crrctd, crrprc, crrfching) VALUES (:usercod, :libroId, :crrctd, :crrprc, NOW());",
                ["usercod" => $usercod, "libroId" => $libroId, "crrctd" => $amount, "crrprc" => $price]
            );
        }
    }

    public static function moveAnonToAuth(
        string $anonCod,
        int $usercod
    ) {
        $sqlstr = "INSERT INTO carretilla (usercod, libroId, crrctd, crrprc, crrfching)
        SELECT :usercod, libroId, crrctd, crrprc, NOW() FROM carretillaanon where anoncod = :anoncod
        ON DUPLICATE KEY UPDATE carretilla.crrctd = carretilla.crrctd + carretillaanon.crrctd;";

        $deleteSql = "DELETE FROM carretillaanon where anoncod = :anoncod;";
        self::executeNonQuery($sqlstr, ["anoncod" => $anonCod, "usercod" => $usercod]);
        self::executeNonQuery($deleteSql, ["anoncod" => $anonCod]);
    }

    public static function getProducto($libroId)
    {
        $sqlAllProductosActivos = "SELECT * from libros where libroId=:libroId;";
        $productosDisponibles = self::obtenerRegistros($sqlAllProductosActivos, array("libroId" => $libroId));
        return $productosDisponibles;
    }

    public static function obtenerLibrosFiltrados(?string $categoriaNombre = null): array
    {
        $sql = "SELECT * FROM libros";
        $params = [];

        if (!empty($categoriaNombre)) {
            $sql .= " WHERE libroGenero = :categoria";
            $params['categoria'] = $categoriaNombre;
        }

        return self::obtenerRegistros($sql, $params);
    }


    public static function obtenerCategoriasDisponibles(): array
    {
        $sql = "SELECT DISTINCT libroGenero FROM libros ORDER BY libroGenero ASC";
        $result = self::obtenerRegistros($sql, []);
        return array_column($result, 'libroGenero');
    }
}
