<?php

namespace Controllers\Pulperia;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Pulperia\Catalogo as CatalogoDAO;

class Catalogo extends PublicController
{
    private string $HolaMessage;

    public function run(): void
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        // Leer categoría seleccionada del GET
        $categoriaSeleccionada = isset($_GET['categoria']) && $_GET['categoria'] !== ''
            ? $_GET['categoria']
            : null;

        // Obtener productos filtrados (o todos si no hay categoría)
        $productos = CatalogoDAO::obtenerProductosFiltrados($categoriaSeleccionada);

        // Obtener categorías disponibles para el filtro
        $categoriasDisponibles = CatalogoDAO::obtenerCategoriasDisponibles();

        // Preparar arreglo para el select (marcando seleccionado)
        $categoriasRender = [];
        foreach ($categoriasDisponibles as $categoria) {
            $categoriasRender[] = [
                "id" => $categoria,
                "nombre" => $categoria,
                "selected" => ($categoria === $categoriaSeleccionada) ? "selected" : ""
            ];
        }

        // Contar productos en carrito (si usas carrito en sesión)
        $carritoCount = 0;
        if (isset($_SESSION['carrito']) && is_array($_SESSION['carrito'])) {
            foreach ($_SESSION['carrito'] as $item) {
                $carritoCount += $item['cantidad'] ?? 0;
            }
        }

        // Preparar datos para la vista
        $viewData = [
            "mensaje" => "pulpería",
            "productos" => $productos,
            "categorias" => $categoriasRender,
            "selected_categoria_null" => ($categoriaSeleccionada === null) ? "selected" : "",
            "carrito_count" => $carritoCount
        ];

        // Renderizar vista con datos
        Renderer::render("pulperia/catalogo", $viewData);
    }
}
