CREATE TABLE `ordenes` (
    `ordenId` INT AUTO_INCREMENT PRIMARY KEY,
    `usercod` BIGINT(10) NOT NULL,
    `fechaOrden` DATETIME DEFAULT NOW(),
    `estado` ENUM('Pendiente', 'Completado', 'Cancelado', 'Enviado') DEFAULT 'Pendiente',
    `montoTotal` DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (`usercod`) REFERENCES `usuario`(`usercod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `pedidos` (
    `pedidoId` INT AUTO_INCREMENT PRIMARY KEY,
    `ordenId` INT NOT NULL,
    `productoId` INT NOT NULL,
    `cantidad` INT NOT NULL,
    `precioUnitario` DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (`ordenId`) REFERENCES `ordenes`(`ordenId`),
    FOREIGN KEY (`productoId`) REFERENCES `productos`(`productoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `transacciones` (
    `transaccionId` INT AUTO_INCREMENT PRIMARY KEY,
    `ordenId` INT NOT NULL,
    `fechaTransaccion` DATETIME DEFAULT NOW(),
    `orderjson` JSON COMMENT 'Aqui va almacenado el orderJSON de la transacccion para fines de referencia contable.',
    FOREIGN KEY (`ordenId`) REFERENCES `ordenes`(`ordenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;