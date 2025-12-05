<?php

namespace Dao\Pulperia;

use Dao\Table;

class Catalogo extends Table {

    public const categorias = [
        'Snacks',
        'Bebidas',
        'Limpieza',
        'Abarrotes'
    ];

    public static function ObtenerProductos(): array
    {
        return [
            [
                "id" => 1,
                "nombreProducto" => "Coca Cola 1L",
                "precio" => "L. 45",
                "stock" => 50,
                "categoria" => "Bebidas",
                "descripcion" => "Bebida gaseosa refrescante",
                "image_url" => "https://via.placeholder.com/300x180?text=Coca+Cola+1L"
            ],
            [
                "id" => 2,
                "nombreProducto" => "Churros Yummies",
                "precio" => "L. 12",
                "stock" => 200,
                "categoria" => "Snacks",
                "descripcion" => "Churros de maíz sabor a queso",
                "image_url" => "https://via.placeholder.com/300x180?text=Yummies"
            ],
            [
                "id" => 3,
                "nombreProducto" => "Arroz Diana 5lb",
                "precio" => "L. 85",
                "stock" => 80,
                "categoria" => "Abarrotes",
                "descripcion" => "Arroz blanco de alta calidad",
                "image_url" => "https://via.placeholder.com/300x180?text=Arroz+Diana"
            ],
            [
                "id" => 4,
                "nombreProducto" => "Aceite Mazola 750ml",
                "precio" => "L. 65",
                "stock" => 60,
                "categoria" => "Abarrotes",
                "descripcion" => "Aceite vegetal para cocinar",
                "image_url" => "https://via.placeholder.com/300x180?text=Mazola"
            ],
            [
                "id" => 5,
                "nombreProducto" => "Cloro Magia Blanca 1L",
                "precio" => "L. 35",
                "stock" => 90,
                "categoria" => "Limpieza",
                "descripcion" => "Cloro multiusos para limpieza del hogar",
                "image_url" => "https://via.placeholder.com/300x180?text=Cloro"
            ],
            [
                "id" => 6,
                "nombreProducto" => "Pan Blanco Bimbo",
                "precio" => "L. 50",
                "stock" => 40,
                "categoria" => "Abarrotes",
                "descripcion" => "Pan fresco para sándwiches",
                "image_url" => "https://via.placeholder.com/300x180?text=Bimbo"
            ],
            [
                "id" => 7,
                "nombreProducto" => "Gatorade 600ml",
                "precio" => "L. 32",
                "stock" => 70,
                "categoria" => "Bebidas",
                "descripcion" => "Bebida hidratante deportiva",
                "image_url" => "https://via.placeholder.com/300x180?text=Gatorade"
            ],
            [
                "id" => 8,
                "nombreProducto" => "Jabón Zix líquido 500ml",
                "precio" => "L. 28",
                "stock" => 100,
                "categoria" => "Limpieza",
                "descripcion" => "Jabón antibacterial para manos",
                "image_url" => "https://via.placeholder.com/300x180?text=Zix"
            ],
            [
                "id" => 9,
                "nombreProducto" => "Azúcar Suliván 2lb",
                "precio" => "L. 32",
                "stock" => 150,
                "categoria" => "Abarrotes",
                "descripcion" => "Azúcar blanca refinada",
                "image_url" => "https://via.placeholder.com/300x180?text=Azucar"
            ],
            [
                "id" => 10,
                "nombreProducto" => "Pepsi 500ml",
                "precio" => "L. 20",
                "stock" => 120,
                "categoria" => "Bebidas",
                "descripcion" => "Bebida gaseosa",
                "image_url" => "https://via.placeholder.com/300x180?text=Pepsi"
            ]
        ];
    }

    public static function ObtenerProductosFiltrados(?string $categoria = null): array {
        $todos = self::ObtenerProductos();
        $filtrados = [];

        $categoria = $categoria !== '' ? $categoria : null;

        foreach ($todos as $producto) {
            if ($categoria === null || $producto['categoria'] === $categoria) {
                $filtrados[] = $producto;
            }
        }

        return $filtrados;
    }

    public static function ObtenerCategoriasDisponibles(): array {
        $todos = self::ObtenerProductos();
        $categorias = [];

        foreach ($todos as $producto) {
            if (!in_array($producto['categoria'], $categorias)) {
                $categorias[] = $producto['categoria'];
            }
        }

        return $categorias;
    }
}
