<section class="container-l">
  <section class="depth-4">
    <h1>Mi Historial de Compras</h1>
  </section>

  {{foreach transacciones}}
  
    <!-- Encabezado de la orden -->
    <div class="row border-b" style="padding: 0.5rem 1rem; align-items:center; background: #f4f4f4;">
      <span class="col-4"><strong>Orden #{{ordenId}}</strong></span>
      <span class="col-4">Fecha: {{fechaOrden}}</span>
      <span class="col-4 right">Estado: {{estado}}</span>
    </div>

    <!-- Encabezado de productos -->
    <div class="row border-b" style="padding: 0.5rem 1rem; align-items:center; font-weight: bold;">
      <span class="col-5">Libro</span>
      <span class="col-2 right">Precio</span>
      <span class="col-2 center">Cantidad</span>
      <span class="col-3 right">Subtotal</span>
    </div>

    <!-- Productos de la orden -->
    {{foreach pedidos}}
    <div class="row border-b" style="padding: 0.5rem 1rem; align-items:center;">
      <span class="col-5">
        {{libroNombre}} <small>(ID: {{libroId}})</small>
      </span>
      <span class="col-2 right">${{precioUnitario}}</span>
      <span class="col-2 center">{{cantidad}}</span>
      <span class="col-3 right">${{subtotal}}</span>
    </div>
    {{endfor pedidos}}

    <!-- Total de la orden -->
    <div class="row" style="padding: 0.5rem 1rem; align-items:center; font-weight: bold;">
      <span class="col-9 right">Total Orden</span>
      <span class="col-3 right">${{montoTotal}}</span>
    </div>

    <hr>

  {{endfor transacciones}}

  <!-- Mensaje cuando no hay historial -->
  <div class="row" style="padding: 1rem;">
    <span class="col-12">No hay transacciones registradas.</span>
  </div>

</section>
