<section>
    <h2>Inventario</h2>
    <p>{{mensaje}}</p>

    <!-- Tarjetas de productos -->
    <div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">
        {{foreach productos}}
        <div style="border: 1px solid #ccc; border-radius: 10px; width: 280px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); overflow: hidden;">
            <img src="{{productoImgUrl}}" alt="Imagen del producto" style="width: 100%; height: 180px; object-fit: cover;">
            <div style="padding: 15px;">
                <h3 style="margin: 0 0 10px 0;">{{productoNombre}}</h3>
                <p><strong>Descripción:</strong> {{productoDescripcion}}</p>
                <p><strong>Precio:</strong> ${{productoPrecio}}</p>
                <p><strong>Stock:</strong> {{productoStock}}</p>
                <p><strong>Estado:</strong> {{productoEstado}}</p>
                <p style="font-size: 0.8em; color: #888;">ID: {{productoId}}</p>
            </div>
        </div>
        {{endfor productos}}
    </div>
</section>
