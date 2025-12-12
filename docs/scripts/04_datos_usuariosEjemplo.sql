-- Estos son los roles principales para la pagina
INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
('ADMIN', 'Administrador del sistmea', 'ACT'),
('CLIENTE', 'Usuario cliente', 'ACT');

-- Estas son las funciones para el ADMIN
INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('GEST_USUARIOS', 'Gestión de usuarios', 'ACT', 'SIS'),
('GEST_LIBROS', 'Gestión de productos', 'ACT', 'NEG'),
('GEST_PEDIDOS', 'Gestión de pedidos', 'ACT', 'NEG'),
('VER_HISTORIAL', 'Ver historial completo', 'ACT', 'REP'),
('MOD_ESTADOS', 'Modificar estados de pedidos', 'ACT', 'NEG');

-- Estas son las funciones para el CLIENTE
INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('COMPRAR', 'Realizar compras', 'ACT', 'NEG'),
('VER_PEDIDOS', 'Ver sus pedidos', 'ACT', 'NEG'),
('GEST_CARRITO', 'Gestionar carrito', 'ACT', 'NEG');

-- Relacion entre funciones y roles del ADMIN
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`) VALUES
('ADMIN', 'GEST_USUARIOS', 'ACT'),
('ADMIN', 'GEST_PRODUCTOS', 'ACT'),
('ADMIN', 'GEST_PEDIDOS', 'ACT'),
('ADMIN', 'VER_HISTORIAL', 'ACT'),
('ADMIN', 'MOD_ESTADOS', 'ACT');

--  Relacion entre funciones y roles del CLIENTE
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`) VALUES
('CLIENTE', 'COMPRAR', 'ACT'),
('CLIENTE', 'VER_PEDIDOS', 'ACT'),
('CLIENTE', 'GEST_CARRITO', 'ACT');

-- Usuarios
INSERT INTO `usuario` (`useremail`, `username`, `userpswd`, `userfching`, `userest`, `usertipo`) VALUES 
('admin@libreria.com', 'Administrador', 'admin123', NOW(), 'ACT', 'ADM');

INSERT INTO `usuario` (`useremail`, `username`, `userpswd`, `userfching`, `userest`, `usertipo`) VALUES 
('cliente@libreria.com', 'Cliente', 'cliente123', NOW(), 'ACT', 'CLI');

-- Asignacion de roles a los Usuarios

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserfch`) VALUES (1, 'ADMIN', NOW());

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserfch`) VALUES (2, 'CLIENTE', NOW());