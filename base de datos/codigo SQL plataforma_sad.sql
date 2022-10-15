-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.11 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para plataforma_sad
CREATE DATABASE IF NOT EXISTS `plataforma_sad` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `plataforma_sad`;

-- Volcando estructura para tabla plataforma_sad.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cli` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion_cli` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono_cli` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla plataforma_sad.cliente: ~0 rows (aproximadamente)

-- Volcando estructura para tabla plataforma_sad.cliente_pedido
CREATE TABLE IF NOT EXISTS `cliente_pedido` (
  `id_cliente` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`,`id_pedido`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `cliente_pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `cliente_pedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla plataforma_sad.cliente_pedido: ~0 rows (aproximadamente)

-- Volcando estructura para tabla plataforma_sad.mensajero
CREATE TABLE IF NOT EXISTS `mensajero` (
  `id_mensajero` int(11) NOT NULL,
  `nombre_men` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono_mens` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mensajero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla plataforma_sad.mensajero: ~0 rows (aproximadamente)

-- Volcando estructura para tabla plataforma_sad.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL,
  `productos` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `valor_fact` int(11) DEFAULT NULL,
  `cliente` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `mensajero` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla plataforma_sad.pedido: ~0 rows (aproximadamente)

-- Volcando estructura para tabla plataforma_sad.pedido_mensajero
CREATE TABLE IF NOT EXISTS `pedido_mensajero` (
  `id_pedido` int(11) NOT NULL,
  `id_mensajero` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`,`id_mensajero`),
  KEY `id_mensajero` (`id_mensajero`),
  CONSTRAINT `pedido_mensajero_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `pedido_mensajero_ibfk_2` FOREIGN KEY (`id_mensajero`) REFERENCES `mensajero` (`id_mensajero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla plataforma_sad.pedido_mensajero: ~0 rows (aproximadamente)

-- Volcando estructura para tabla plataforma_sad.pedido_productos
CREATE TABLE IF NOT EXISTS `pedido_productos` (
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `pedido_productos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `pedido_productos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla plataforma_sad.pedido_productos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla plataforma_sad.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_prod` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla plataforma_sad.productos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla plataforma_sad.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `contrseña` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla plataforma_sad.usuario: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
