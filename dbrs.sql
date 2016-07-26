-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2016 a las 05:52:02
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbrs`
--
CREATE DATABASE IF NOT EXISTS `dbrs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbrs`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador_sistema`
--

CREATE TABLE `administrador_sistema` (
  `administrador_id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `ap_paterno` varchar(150) DEFAULT NULL,
  `ap_materno` varchar(150) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contrase_na` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordenadas`
--

CREATE TABLE `coordenadas` (
  `coordenadas_id` int(11) NOT NULL,
  `longitud` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `detalle_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `coordenadas`
--

INSERT INTO `coordenadas` (`coordenadas_id`, `longitud`, `latitud`, `fecha`, `detalle_id`) VALUES
(1, 56456, 321231, '2016-06-14 00:00:00', 1),
(2, 564546, 564654, '2016-06-22 00:00:00', 1),
(3, 564546, 564564, '2016-06-28 00:00:00', 2),
(4, 545454543, 5546645546, '2016-06-08 00:00:00', 2),
(5, 5465656, 231231, '2016-06-14 00:00:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `detalle_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `gps_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`detalle_id`, `usuario_id`, `gps_id`) VALUES
(1, 1, 1),
(2, 2, 3);

--
-- Disparadores `detalle`
--
DELIMITER $$
CREATE TRIGGER `detalle_BD_TRIGGER` BEFORE DELETE ON `detalle` FOR EACH ROW BEGIN
  DELETE FROM coordenadas WHERE coordenadas.detalle_id = OLD.detalle_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_cliente`
--

CREATE TABLE `empresa_cliente` (
  `empresa_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT "0"
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa_cliente`
--

INSERT INTO `empresa_cliente` (`empresa_id`, `nombre`, `telefono`, `correo`, `status`) VALUES
(1, 'S.A de C.V.', '7471222313', 'sucorreo|@g.com', 1),
(2, 'S.A. de R.L.', '7471222314', 'sucorreo2@g.com', 1),
(3, 'Mi Institute', '1-364-837-7778', 'egestas.Duis@massaSuspendisseeleifend.com', '1'),
(4, 'Natoque Penatibus Company', '1-628-458-3862', 'sagittis.lobortis.mauris@pedeSuspendissedui.com', '0'),
(5, 'Nunc Sit Company', '1-881-485-8366', 'et.nunc@luctuslobortisClass.com', '0'),
(6, 'In Corp.', '1-197-862-1603', 'lacus.Etiam.bibendum@Curae.org', '1'),
(7, 'Cursus Nunc Institute', '1-987-833-4224', 'et@quamelementumat.net', '0'),
(8, 'Vulputate Limited', '1-490-342-2320', 'Sed@aliquam.com', '0'),
(9, 'Lorem Ut Aliquam Corp.', '1-900-646-7405', 'Maecenas.libero.est@laoreet.co.uk', '0'),
(10, 'Eros Nam Consequat Limited', '1-139-540-8633', 'posuere.cubilia@sitamet.ca', '1'),
(11, 'Ut Nisi A Foundation', '1-673-383-0528', 'Cras@Proinnon.co.uk', '1'),
(12, 'Rhoncus Donec Est PC', '1-612-849-9718', 'ornare@leo.com', '0');

--
-- Disparadores `empresa_cliente`
--
DELIMITER $$
CREATE TRIGGER `eliminarEmpresa_BD_TRIGGER` BEFORE DELETE ON `empresa_cliente` FOR EACH ROW BEGIN
DELETE FROM usuarios WHERE usuarios.empresa_id = OLD.empresa_id;
DELETE FROM gps WHERE gps.empresa_id = OLD.empresa_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enlace`
--

CREATE TABLE `enlace` (
  `enlace_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `gps_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `enlace`
--

INSERT INTO `enlace` (`enlace_id`, `usuario_id`, `gps_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 3),
(5, 2, 3),
(6, 3, 1),
(7, 4, 1),
(8, 5, 1),
(9, 6, 1),
(10, 7, 1),
(11, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gps`
--

CREATE TABLE `gps` (
  `gps_id` int(11) NOT NULL,
  `imei` varchar(100) DEFAULT NULL,
  `numero` varchar(25) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gps`
--

INSERT INTO `gps` (`gps_id`, `imei`, `numero`, `descripcion`, `empresa_id`) VALUES
(1, '000000000000000', '7471212313', 'un gps', 1),
(2, '100184351997449', '1-312-795-4469', 'dolor sit amet, consectetuer', NULL),
(3, '111111111111111', '7471212314', 'otro gps', 1),
(4, '216950486740097', '1-621-355-8159', 'libero lacus, varius et,', NULL),
(5, '568026148201897', '1-257-608-0553', 'dis parturient montes, nascetur', NULL),
(6, '644554683938622', '1-665-503-4628', 'ornare egestas ligula. Nullam', NULL),
(7, '812124402588233', '1-980-983-6980', 'dui. Fusce diam nunc,', NULL),
(8, '908258133567869', '1-331-377-7778', 'Cras vehicula aliquet libero.', NULL),
(9, '909181318059563', '1-449-475-1736', 'mauris, rhoncus id, mollis', NULL),
(10, '932643502624705', '1-276-933-4170', 'Phasellus at augue id', 1),
(11, '961823153914883', '1-411-695-8780', 'eget, volutpat ornare, facilisis', 1),
(12, '974630529293790', '1-745-248-3465', 'a tortor. Nunc commodo', NULL);

--
-- Disparadores `gps`
--
DELIMITER $$
CREATE TRIGGER `bajaGpsDeEmpresa_BU_TRIGGER` BEFORE UPDATE ON `gps` FOR EACH ROW BEGIN
   IF OLD.empresa_id IS NOT NULL THEN
 DELETE FROM enlace WHERE enlace.gps_id = OLD.gps_id;
 DELETE FROM detalle WHERE detalle.gps_id = OLD.gps_id;
 END IF;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `eliminarGps_BD_TRIGGER` BEFORE DELETE ON `gps` FOR EACH ROW BEGIN
DELETE FROM enlace WHERE enlace.gps_id = OLD.gps_id;
DELETE FROM detalle WHERE detalle.gps_id = OLD.gps_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `ap_paterno` varchar(150) DEFAULT NULL,
  `ap_materno` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrase_na` varchar(200) NOT NULL,
  `empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `ap_paterno`, `ap_materno`, `telefono`, `correo`, `usuario`, `contrase_na`, `empresa_id`) VALUES
(1, 'Aldo', 'Estrada', 'Tepec', '4711956', 'aldo_get@hotmail.com', 'aget', '123', 1),
(2, 'william', 'est', 'tep', '4711957', 'alas_bet@hotmail.com', 'wito', '123', 1),
(3, 'Adele', 'Clarke', 'Hopper', '1-509-878-3332', 'amet.lorem@ipsum.co.uk', 'ornare,', '6299', 1),
(4, 'Thor', 'Lang', 'Farrell', '1-858-526-7878', 'ut.sem@sit.com', 'mauris.', '3968', 1),
(5, 'Kendall', 'Weiss', 'Pace', '1-579-681-0940', 'ipsum.leo@tellus.ca', 'egestas.', '9977', 1),
(6, 'Fiona', 'Franklin', 'Boyd', '1-750-817-0628', 'pede.sagittis@vitae.com', 'auctor', '2760', 1),
(7, 'Alexis', 'Bruce', 'Mcdaniel', '1-285-735-4142', 'gravida.Praesent.eu@rutrummagnaCras.co.uk', 'diam', '7455', 1),
(8, 'Phillip', 'Stout', 'Riddle', '1-634-150-2212', 'mollis.dui@placerat.net', 'eu', '3222', 5),
(9, 'Preston', 'Mays', 'Buck', '1-795-423-5856', 'urna.Nunc.quis@vel.net', 'tincidunt', '3413', 4),
(10, 'Aileen', 'Medina', 'Mcguire', '1-379-179-0856', 'Proin.sed@Aliquamgravidamauris.co.uk', 'arcu.', '9998', 8),
(11, 'Raymond', 'Huff', 'Livingston', '1-543-276-7583', 'nec@a.net', 'elit', '5266', 4),
(12, 'Elmo', 'Walls', 'Russell', '1-517-531-0915', 'condimentum.Donec.at@musDonecdignissim.edu', 'mauris', '1980', 8);

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `usuarios_BD_TRIGGER` BEFORE DELETE ON `usuarios` FOR EACH ROW BEGIN
  DELETE FROM enlace WHERE enlace.usuario_id = OLD.usuario_id;
  DELETE FROM detalle WHERE detalle.usuario_id = OLD.usuario_id;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador_sistema`
--
ALTER TABLE `administrador_sistema`
  ADD PRIMARY KEY (`administrador_id`);

--
-- Indices de la tabla `coordenadas`
--
ALTER TABLE `coordenadas`
  ADD PRIMARY KEY (`coordenadas_id`),
  ADD KEY `idx_coordenadas` (`detalle_id`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `idx_detalle` (`gps_id`),
  ADD KEY `idx_detalle_0` (`usuario_id`);

--
-- Indices de la tabla `empresa_cliente`
--
ALTER TABLE `empresa_cliente`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indices de la tabla `enlace`
--
ALTER TABLE `enlace`
  ADD PRIMARY KEY (`enlace_id`),
  ADD KEY `idx_enlace` (`gps_id`),
  ADD KEY `idx_enlace_0` (`usuario_id`);

--
-- Indices de la tabla `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`gps_id`),
  ADD KEY `idx_gps` (`empresa_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `idx_usuarios` (`empresa_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador_sistema`
--
ALTER TABLE `administrador_sistema`
  MODIFY `administrador_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `coordenadas`
--
ALTER TABLE `coordenadas`
  MODIFY `coordenadas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `empresa_cliente`
--
ALTER TABLE `empresa_cliente`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `enlace`
--
ALTER TABLE `enlace`
  MODIFY `enlace_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `gps`
--
ALTER TABLE `gps`
  MODIFY `gps_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `coordenadas`
--
ALTER TABLE `coordenadas`
  ADD CONSTRAINT `fk_coordenadas` FOREIGN KEY (`detalle_id`) REFERENCES `detalle` (`detalle_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `fk_detalle` FOREIGN KEY (`gps_id`) REFERENCES `gps` (`gps_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_0` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `enlace`
--
ALTER TABLE `enlace`
  ADD CONSTRAINT `fk_enlace` FOREIGN KEY (`gps_id`) REFERENCES `gps` (`gps_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enlace_0` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gps`
--
ALTER TABLE `gps`
  ADD CONSTRAINT `fk_gps` FOREIGN KEY (`empresa_id`) REFERENCES `empresa_cliente` (`empresa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios` FOREIGN KEY (`empresa_id`) REFERENCES `empresa_cliente` (`empresa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
