INSERT INTO autores (autorId, nombreAutor) VALUES
(1, 'Antoine de Saint-Exupéry'),
(2, 'Gabriel García Márquez'),
(3, 'Miguel de Cervantes'),
(4, 'George Orwell'),
(5, 'J.K. Rowling'),
(6, 'J.R.R. Tolkien'),
(7, 'Jane Austen'),
(8, 'Homero'),
(9, 'Julio Cortázar'),
(10, 'Paulo Coelho'),
(11, 'Ray Bradbury'),
(12, 'Harper Lee'),
(13, 'Bram Stoker'),
(14, 'Suzanne Collins'),
(15, 'Carlos Ruiz Zafón');
INSERT INTO editoriales (editorialId, nombreEditorial) VALUES
(1, 'HCH'),
(2, 'Sudamericana'),
(3, 'Francisco de Robles'),
(4, 'Secker & Warburg'),
(5, 'Bloomsbury'),
(6, 'Allen & Unwin'),
(7, 'T. Egerton'),
(8, 'Clásicos Griegos'),
(9, 'Rocco'),
(10, 'Ballantine Books'),
(11, 'J.B. Lippincott & Co.'),
(12, 'Archibald Constable'),
(13, 'Scholastic'),
(14, 'Planeta');

INSERT INTO libros (
    libroNombre, libroDescripcion, libroAñoPublicacion,
    autorId, editorialId, libroGenero, libroPrecio,
    libroImgUrl, libroStock, libroEstado
) VALUES
('El Principito', 'Libro animado para niños', 2000, 1, 1, 'Fantasía', 350.00, 'https://via.placeholder.com/300x180?text=El+Principito', 100, 'ACT'),
('Cien Años de Soledad', 'Obra maestra del realismo mágico', 1967, 2, 2, 'Terror', 500.00, 'https://via.placeholder.com/300x180?text=Cien+Anios+Soledad', 200, 'ACT'),
('Don Quijote de la Mancha', 'Clásico de la literatura española', 1605, 3, 3, 'Terror', 420.00, 'https://via.placeholder.com/300x180?text=Don+Quijote', 80, 'ACT'),
('1984', 'Distopía política sobre vigilancia y control', 1949, 4, 4, 'Ciencia Ficción', 310.00, 'https://via.placeholder.com/300x180?text=1984', 60, 'ACT'),
('Harry Potter y la piedra filosofal', 'Inicio de la saga del joven mago', 1997, 5, 5, 'Fantasía', 600.00, 'https://via.placeholder.com/300x180?text=Harry+Potter+1', 150, 'ACT'),
('El Hobbit', 'Aventura fantástica en la Tierra Media', 1937, 6, 6, 'Fantasía', 470.00, 'https://via.placeholder.com/300x180?text=El+Hobbit', 75, 'ACT'),
('Orgullo y Prejuicio', 'Novela romántica clásica inglesa', 1813, 7, 7, 'Terror', 320.00, 'https://via.placeholder.com/300x180?text=Orgullo+Prejuicio', 90, 'ACT'),
('La Odisea', 'Viaje épico del héroe Odiseo', -800, 8, 8, 'Terror', 290.00, 'https://via.placeholder.com/300x180?text=La+Odisea', 50, 'ACT'),
('Rayuela', 'Novela experimental e innovadora', 1963, 9, 2, 'Terror', 540.00, 'https://via.placeholder.com/300x180?text=Rayuela', 60, 'ACT'),
('El Alquimista', 'Fábula sobre seguir los sueños', 1988, 10, 9, 'Terror', 400.00, 'https://via.placeholder.com/300x180?text=El+Alquimista', 110, 'ACT'),
('Fahrenheit 451', 'Crítica a la censura y quema de libros', 1953, 11, 10, 'Ciencia Ficción', 360.00, 'https://via.placeholder.com/300x180?text=Fahrenheit+451', 85, 'ACT'),
('Matar a un ruiseñor', 'Novela sobre justicia y racismo', 1960, 12, 11, 'Terror', 430.00, 'https://via.placeholder.com/300x180?text=Matar+Ruise%C3%B1or', 70, 'ACT'),
('Drácula', 'Clásico de la literatura gótica', 1897, 13, 12, 'Terror', 380.00, 'https://via.placeholder.com/300x180?text=Dracula', 60, 'ACT'),
('Los juegos del hambre', 'Distopía juvenil de supervivencia', 2008, 14, 13, 'Ciencia Ficción', 550.00, 'https://via.placeholder.com/300x180?text=Juegos+Hambre', 100, 'ACT'),
('La sombra del viento', 'Misterio literario en Barcelona', 2001, 15, 14, 'Terror', 470.00, 'https://via.placeholder.com/300x180?text=Sombra+Viento', 95, 'ACT');

