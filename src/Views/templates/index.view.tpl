<style>
  .product-list {
    display: flex;
    flex-wrap: wrap;
    gap: 2rem;
    justify-content: center;
    padding: 2rem;
  }

  .product {
    width: 260px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px #ccc;
    padding: 1rem;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  .product img {
    max-width: 100%;
    max-height: 200px;
    object-fit: contain;
    border-radius: 8px;
    margin-bottom: 1rem;
  }

  .product h2 {
    font-size: 1.3rem;
    margin: 0.5rem 0;
    font-weight: bold;
  }

  .product p {
    font-size: 1rem;
    color: #333;
    margin-bottom: 1rem;
  }

  .product .info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 4rem;  /* <-- MÁS separación desde la descripción */
  margin-bottom: 1rem;
}

  .product .price {
    color: red;
    font-weight: bold;
    font-size: 1.1rem;
  }

  .product .stock {
    color: green;
    font-size: 0.9rem;
  }

  .add-to-cart {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 0.6rem;
    font-size: 0.9rem;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.2s;
  }

  .add-to-cart:hover {
    background-color: #0056b3;
  }
</style>

<div class="product-list">
  {{foreach libros}}
  <div class="product" data-libroId="{{libroId}}">
    <img src="{{libroImgUrl}}" alt="{{libroNombre}}">
    <h2>{{libroNombre}}</h2>
    <p>{{libroDescripcion}}</p>

    <div class="info">
      <span class="price">${{libroPrecio}}</span>
      <span class="stock">Disponible {{libroStock}}</span>
    </div>

    <form action="index.php?page=index" method="post">
      <input type="hidden" name="libroId" value="{{libroId}}">
      <button type="submit" name="addToCart" class="add-to-cart">
        <i class="fa-solid fa-cart-plus"></i> Agregar al Carrito
      </button>
    </form>
  </div>
  {{endfor libros}}
</div>
