CREATE TABLE
    `libros` (
        `libroId` int(11) NOT NULL AUTO_INCREMENT,
        `libroNombre` varchar(255) NOT NULL,
        `libroDescripcion` text NOT NULL,
        `libroAñoPublicacion` int(4) NOT NULL,
        `autorId` INT NOT NULL,
        `editorialId` INT NOT NULL,
        `libroGenero` varchar(100) NOT NULL,
        `libroPrecio` decimal(10, 2) NOT NULL,
        `libroImgUrl` varchar(1000) NOT NULL,
        `libroStock` int(11) NOT NULL DEFAULT 0,
        `libroEstado` char(3) NOT NULL,
        PRIMARY KEY (`libroId`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    `carretilla` (
        `usercod` BIGINT(10) NOT NULL,
         `libroId` int(11) NOT NULL,
        `crrctd` INT(5) NOT NULL COMMENT 'Cantidad del libro',
        `crrprc` DECIMAL(12, 2) NOT NULL COMMENT 'Precio del libro',
        `crrfching` DATETIME NOT NULL COMMENT 'Fecha cuando se agregó',
        PRIMARY KEY (`usercod`, `libroId`),
        INDEX `libroId_idx` (`libroId` ASC),
        CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE TABLE
    `carretillaanon` (
        `anoncod` varchar(128) NOT NULL,
        `libroId` int(11) NOT NULL,
        `crrctd` int(5) NOT NULL,
        `crrprc` decimal(12, 2) NOT NULL,
        `crrfching` datetime NOT NULL,
        PRIMARY KEY (`anoncod`, `libroId`),
        KEY `libroId_idx` (`libroId`),
        CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`libroId`) REFERENCES `libros` (`libroId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );