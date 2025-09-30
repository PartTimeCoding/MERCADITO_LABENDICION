<?php

/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */

namespace Controllers;

use Dao\Cart\Cart;
use Utilities\Site;
use Utilities\Cart\CartFns;
use Utilities\Security;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    /**
     * Index run method
     *
     * @return void
     */
    public function run(): void
    {
        Site::addLink("public/css/products.css");

        if ($this->isPostBack()) {
            if (Security::isLogged()) {
                $usercod = Security::getUserId();
                $libroId = intval($_POST["libroId"]);
                $libro = Cart::getProductoDisponible($libroId);
                if ($libro["libroStock"] - 1 >= 0) {
                    Cart::addToAuthCart(
                        intval($_POST["libroId"]),
                        $usercod,
                        1,
                        $libro["libroPrecio"]
                    );
                }
            } else {
                $cartAnonCod = CartFns::getAnnonCartCode();
                if (isset($_POST["addToCart"])) {

                    $libroId = intval($_POST["libroId"]);
                    $libro = Cart::getProductoDisponible($libroId);
                    if ($libro["libroStock"] - 1 >= 0) {
                        Cart::addToAnonCart(
                            intval($_POST["libroId"]),
                            $cartAnonCod,
                            1,
                            $libro["libroPrecio"]
                        );
                    }
                }
            }
            $this->getCartCounter();
        }

        $libros = Cart::getProductosDisponibles();
        $viewData = [
            "libros" => $libros,
        ];
        \Views\Renderer::render("index", $viewData);
    }
}
