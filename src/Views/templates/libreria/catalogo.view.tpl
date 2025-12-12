<section>
    <h2>Catalogos de Libros</h2>
    <p>{{mensaje}}</p>

 <form method="GET" style="margin-bottom: 20px; text-align: center;">
    <label for="categoria">Filtrar por categoría:</label>
    <select name="categoria" id="categoria" onchange="this.form.submit()" style="padding: 5px 10px; margin-left: 10px;">
        <option value="" {{selected_categoria_null}}>Todas</option>
        {{foreach categorias}}
            <option value="{{id}}" {{selected}}>{{nombre}}</option>
        {{endfor categorias}}
    </select>
    <input type="hidden" name="page" value="Libreria_Catalogo">
</form>


    <!-- Tarjetas de libros -->
    <div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">
        {{foreach libros}}
        <div style="border: 1px solid #ccc; border-radius: 10px; width: 280px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); overflow: hidden;">
            <img src="{{libroImgUrl}}" alt="Portada del libro" style="width: 100%; height: 180px; object-fit: cover;">
            <div style="padding: 15px;">
                <h3 style="margin: 0 0 10px 0;">{{libroNombre}}</h3>
                <p><strong>Descripción:</strong> {{libroDescripcion}}</p>
                <p><strong>Año:</strong> {{libroAñoPublicacion}}</p>
                <p><strong>Autor ID:</strong> {{autorId}}</p>
                <p><strong>Editorial ID:</strong> {{editorialId}}</p>
                <p><strong>Género:</strong> {{libroGenero}}</p>
                <p><strong>Precio:</strong> ${{libroPrecio}}</p>
                <p><strong>Stock:</strong> {{libroStock}}</p>
                <p><strong>Estado:</strong> {{libroEstado}}</p>
                <p style="font-size: 0.8em; color: #888;">ID: {{libroid}}</p>
            </div>
        </div>
        {{endfor libros}}
    </div>
</section>
