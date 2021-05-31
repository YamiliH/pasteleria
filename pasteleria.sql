-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.6.41-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para pasteleria
CREATE DATABASE IF NOT EXISTS `pasteleria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pasteleria`;

-- Volcando estructura para tabla pasteleria.category
CREATE TABLE IF NOT EXISTS `category` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pasteleria.direccion
CREATE TABLE IF NOT EXISTS `direccion` (
  `iDdireccion` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `distrito` varchar(255) DEFAULT NULL,
  `provicia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iDdireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pasteleria.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idPersona` (`idPersona`),
  CONSTRAINT `fk_idPersona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pasteleria.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_idProduct` (`idProduct`),
  KEY `fk_idCliente` (`idCliente`),
  CONSTRAINT `fk_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `fk_idProduct` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pasteleria.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `edad` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `idDirecion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `fk_idDirecion` (`idDirecion`),
  CONSTRAINT `fk_idDirecion` FOREIGN KEY (`idDirecion`) REFERENCES `direccion` (`iDdireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pasteleria.price
CREATE TABLE IF NOT EXISTS `price` (
  `idPrice` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`idPrice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla pasteleria.product
CREATE TABLE IF NOT EXISTS `product` (
  `idProduct` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idPrice` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `fk_idPrice` (`idPrice`),
  KEY `fk_idCategory` (`idCategory`),
  CONSTRAINT `fk_idCategory` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`),
  CONSTRAINT `fk_idPrice` FOREIGN KEY (`idPrice`) REFERENCES `price` (`idPrice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
