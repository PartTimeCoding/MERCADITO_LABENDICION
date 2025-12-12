<?php

namespace Dao\Libreria;

use Dao\Table;

class Catalogo extends Table
{
    public const generos = [
        'Fantasía',
        'Terror',
        'Ciencia Ficción'
    ];

    public static function ObtenerLibros(): array
    {
        return [];
    }

    public static function ObtenerLibrosFiltrados(?string $generoNombre = null): array
    {
        $todosLosLibros = self::ObtenerLibros();
        $librosFiltrados = [];

        $generoNombre = $generoNombre !== '' ? $generoNombre : null;

        foreach ($todosLosLibros as $libro) {
            if ($generoNombre === null || $libro['genero'] === $generoNombre) {
                $librosFiltrados[] = $libro;
            }
        }
        return $librosFiltrados;
    }

    public static function ObtenerGenerosDisponibles(): array
    {
        $todosLosLibros = self::ObtenerLibros();
        $generos = [];
        foreach ($todosLosLibros as $libro) {
            if (!in_array($libro['genero'], $generos)) {
                $generos[] = $libro['genero'];
            }
        }
        return $generos;
    }
}
