-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sistema
CREATE DATABASE IF NOT EXISTS `sistema` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `sistema`;

-- Volcando estructura para tabla sistema.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sistema.cliente: ~6 rows (aproximadamente)
INSERT INTO `cliente` (`idcliente`, `nombre`, `telefono`, `direccion`) VALUES
	(7, 'Rosa Chata Maquera', '931895623', 'Vista Alegre Mz 25 lt 23'),
	(8, 'Roberto Ccalli Ramos', '984785612', 'Alto de la Alianza Mz F lt 23'),
	(9, 'Erick Javier Salina Condori', '987125623', 'Viñani Promuvi Mz 23 lt 15'),
	(10, 'Fiorela Midaly Ticahuanca Maquera', '945561245', 'Pocollay Mz F lt 23'),
	(11, 'Marjiory Llantay ', '978124523', 'Ciudad Nueva - Los Delfines Mz 23 lt 45'),
	(12, 'Tell Ivan Casilla Maquera', '945568912', 'Leguia Para Chico 512'),
	(13, 'Joel Robert Ccalli Chata', '931296031', 'Av. San martin 548');

-- Volcando estructura para tabla sistema.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sistema.configuracion: ~0 rows (aproximadamente)
INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
	(1, 'Sistema TACNA CELL', '931296031', 'joel.ccalli@gmail.com', 'Tacna');

-- Volcando estructura para tabla sistema.detalle_permisos
CREATE TABLE IF NOT EXISTS `detalle_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_permiso` (`id_permiso`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `detalle_permisos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_permisos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema.detalle_permisos: ~10 rows (aproximadamente)
INSERT INTO `detalle_permisos` (`id`, `id_permiso`, `id_usuario`) VALUES
	(35, 3, 9),
	(36, 4, 9),
	(37, 5, 9),
	(38, 6, 9),
	(48, 1, 12),
	(49, 2, 12),
	(50, 3, 12),
	(51, 4, 12),
	(52, 5, 12),
	(53, 6, 12);

-- Volcando estructura para tabla sistema.detalle_temp
CREATE TABLE IF NOT EXISTS `detalle_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_temp_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sistema.detalle_temp: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema.detalle_venta: ~14 rows (aproximadamente)
INSERT INTO `detalle_venta` (`id`, `id_producto`, `id_venta`, `cantidad`, `descuento`, `precio`, `total`) VALUES
	(17, 7, 9, 2, 0.00, 9500.00, 19000.00),
	(18, 9, 9, 1, 0.00, 150.00, 150.00),
	(19, 8, 10, 1, 0.00, 500.00, 500.00),
	(20, 11, 10, 1, 0.00, 200.00, 200.00),
	(21, 17, 11, 1, 0.00, 2500.00, 2500.00),
	(22, 9, 11, 1, 0.00, 150.00, 150.00),
	(23, 11, 12, 1, 0.00, 200.00, 200.00);

-- Volcando estructura para tabla sistema.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema.permisos: ~6 rows (aproximadamente)
INSERT INTO `permisos` (`id`, `nombre`) VALUES
	(1, 'configuración'),
	(2, 'usuarios'),
	(3, 'clientes'),
	(4, 'productos'),
	(5, 'ventas'),
	(6, 'nueva_venta');

-- Volcando estructura para tabla sistema.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `codproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  PRIMARY KEY (`codproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sistema.producto: ~9 rows (aproximadamente)
INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`) VALUES
	(7, '789123456', 'Iphone 15 Pro Max 1TB', 9500.00, 13),
	(8, '789453321485', 'Xiaomi Redmi note 9', 500.00, 19),
	(9, '456421231545', 'Cargador Iphone 20W', 150.00, 17),
	(10, '456488784651', 'Samsung Galaxy S23 Ultra', 4500.00, 10),
	(11, '456121354546', 'Cargador Xiaomi 120W', 200.00, 28),
	(12, '4564651321385', 'POCO X5 PRO', 800.00, 20),
	(13, '1231854984561', 'Xiaomi Redmi Note 12 PRO PLUS', 1200.00, 30),
	(14, '4564623123', 'Samsung Galaxy S22 ULTRA', 3500.00, 10),
	(15, '45646513212', 'Samsung Galaxy S21 ULTRA', 2500.00, 15),
	(16, '456465456165', 'Iphone XS MAX 512GB', 1500.00, 10),
	(17, '4561521321545', 'Iphone 12 PRO MAX 256GB', 2500.00, 11),
	(18, '485465135154', 'Iphone 13 PRO MAX 512GB', 4500.00, 10),
	(19, '45615616516', 'Iphone 14 PRO MAX 256GB', 5500.00, 4),
	(20, '45123132122', 'Apple Watch Series 4 45ml.', 1500.00, 10),
	(21, '451512125451', 'Xiaomi 11 T PRO 256GB', 1500.00, 10),
	(22, '451231321', 'Xiaomi 12 T PRO 256GB', 2500.00, 12),
	(23, '45465152132132', 'Xiaomi 13 T PRO 256GB', 3500.00, 5),
	(24, '456465132132', 'Cargador Samsung 45W', 120.00, 13);

-- Volcando estructura para tabla sistema.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sistema.usuario: ~2 rows (aproximadamente)
INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`) VALUES
	(9, 'Maria Sanchez', 'maria@gmail.com', 'maria', '263bce650e68ab4e23f28263760b9fa5'),
	(12, 'Joel Robert Ccalli Chata', 'joel.ccalli@gmail.com', 'joelccalli123', '34918e71989c561dd3873c2dbcaddd55'),
	(13, 'Erick Javier Salinas Condori', 'erick.salinas@gmail.com', 'erick123', 'e10adc3949ba59abbe56e057f20f883e'),
	(14, 'Marjiory Llantay', 'marjiory.llantay@gmail.com', 'marjiory123', 'e10adc3949ba59abbe56e057f20f883e'),
	(15, 'Fiorela Midaly Ticahuanca', 'fiorela.ticahuanca@gmail.com', 'fiorela123', 'e10adc3949ba59abbe56e057f20f883e'),
	(16, 'Tell Ivan Casilla Maquera', 'tell.casilla@gmail.com', 'kaneki123', 'e10adc3949ba59abbe56e057f20f883e');

-- Volcando estructura para tabla sistema.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema.ventas: ~0 rows (aproximadamente)
INSERT INTO `ventas` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`) VALUES
	(9, 12, 19150.00, 12, '2023-09-28 20:02:45'),
	(10, 11, 700.00, 12, '2023-09-28 20:04:44'),
	(11, 13, 2650.00, 12, '2023-09-28 20:07:24'),
	(12, 10, 200.00, 12, '2023-09-28 20:07:49');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
