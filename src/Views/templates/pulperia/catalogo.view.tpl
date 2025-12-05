<section>
    <h2>Catálogo de Productos</h2>
    <p>{{mensaje}}</p>

    <form method="GET" style="margin-bottom: 20px; text-align: center;">
        <label for="categoria">Filtrar por categoría:</label>
        <select name="categoria" id="categoria" onchange="this.form.submit()" style="padding: 5px 10px; margin-left: 10px;">
            <option value="" {{selected_categoria_null}}>Todas</option>
            {{foreach categorias}}
                <option value="{{id}}" {{selected}}>{{nombre}}</option>
            {{endfor categorias}}
        </select>
        <input type="hidden" name="page" value="Pulperia_Catalogo">
    </form>

    <!-- Tarjetas de productos -->
    <div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">
        {{foreach productos}}
        <div style="border: 1px solid #ccc; border-radius: 10px; width: 280px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); overflow: hidden;">
            <img src="{{productoImgUrl}}" alt="Imagen del producto" style="width: 100%; height: 180px; object-fit: cover;">
            <div style="padding: 15px;">
                <h3 style="margin: 0 0 10px 0;">{{productoNombre}}</h3>
                <p><strong>Descripción:</strong> {{productoDescripcion}}</p>
                <p><strong>Categoría:</strong> {{productoCategoria}}</p>
                <p><strong>Precio:</strong> L {{productoPrecio}}</p>
                <p><strong>Stock:</strong> {{productoStock}}</p>
                <p><strong>Estado:</strong> {{productoEstado}}</p>
                <p style="font-size: 0.8em; color: #888;">ID: {{productoid}}</p>
            </div>
        </div>
        {{endfor productos}}
    </div>
</section>
