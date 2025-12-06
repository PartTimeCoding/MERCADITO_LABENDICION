CREATE TABLE
    `productos` (
        `productoId` int(11) NOT NULL AUTO_INCREMENT,
        `productoNombre` varchar(255) NOT NULL,
        `productoDescripcion` text NOT NULL,
        `productoPrecio` decimal(10, 2) NOT NULL,
        `productoImgUrl` varchar(255) NOT NULL,
        `productoStock` int(11) NOT NULL DEFAULT 0,
        `productoEstado` char(3) NOT NULL,
        PRIMARY KEY (`productoId`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    `carretilla` (
        `usercod` BIGINT(10) NOT NULL,
         `productoId` int(11) NOT NULL,
        `crrctd` INT(5) NOT NULL COMMENT 'Cantidad de producto',
        `crrprc` DECIMAL(12, 2) NOT NULL COMMENT 'Precio del producto',
        `crrfching` DATETIME NOT NULL COMMENT 'Fecha cuando se agregó',
        PRIMARY KEY (`usercod`, `productoId`),
        INDEX `productoId_idx` (`productoId` ASC),
        CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`productoId`) REFERENCES `productos` (`productoId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE TABLE
    `carretillaanon` (
        `anoncod` varchar(128) NOT NULL,
        `productoId` int(11) NOT NULL,
        `crrctd` int(5) NOT NULL,
        `crrprc` decimal(12, 2) NOT NULL,
        `crrfching` datetime NOT NULL,
        PRIMARY KEY (`anoncod`, `productoId`),
        KEY `productoId_idx` (`productoId`),
        CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`productoId`) REFERENCES `productos` (`productoId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );