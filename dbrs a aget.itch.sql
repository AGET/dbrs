-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-07-2016 a las 01:18:09
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbrs`
--
/*
CREATE DATABASE IF NOT EXISTS `dbrs` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbrs`;
*/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador_sistema`
--

CREATE TABLE `administrador_sistema` (
  `administrador_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `ap_paterno` varchar(150) DEFAULT NULL,
  `ap_materno` varchar(150) DEFAULT NULL,
  `correo` varchar(150) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrase_na` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordenadas`
--

CREATE TABLE `coordenadas` (
  `coordenadas_id` int(11) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `detalle_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `coordenadas`
--

INSERT INTO `coordenadas` (`coordenadas_id`, `longitud`, `latitud`, `detalle_id`) VALUES
(1, 56456, 321231, 1),
(2, 564546, 564654, 1),
(3, 564546, 564564, 2),
(4, 545454543, 5546645546, 2),
(5, 5465656, 231231, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `departamento_id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`departamento_id`, `nombre`, `telefono`, `correo`, `direccion`, `empresa_id`) VALUES
(1, 'Atención al cliente', '1-889-496-4002', 'dictum.Phasellus.in@inlobortis.org', '8115 Eu, Av.', 1),
(2, 'Finanzas', '1-706-861-9644', 'ornare@at.com', 'Apdo.:173-5697 Vehicula C/', 1),
(3, 'Publicidad', '1-637-740-4813', 'Proin@dui.ca', '9588 Magna. Ctra.', 3),
(4, 'Recursos humanos', '1-562-760-7737', 'vitae@mattisvelitjusto.co.uk', 'Apdo.:128-6701 Egestas. Avenida', 3),
(5, 'Publicidad', '1-948-605-4920', 'ultricies.ligula.Nullam@euaugue.org', 'Apdo.:753-9118 Egestas. Calle', 3),
(6, 'Gestión de activos', '1-121-546-9843', 'lectus.rutrum@Pellentesquehabitantmorbi.org', 'Apartado núm.: 307, 4489 Nibh. C/', 3),
(7, 'Relaciones públicas', '1-430-255-0364', 'diam@interdumfeugiat.com', 'Apartado núm.: 959, 7140 Penatibus C/', 1),
(8, 'Relaciones públicas', '1-178-447-3434', 'vehicula.aliquet@vestibulumneceuismod.org', '596-6166 Fermentum Avda.', 3),
(9, 'Atención al cliente', '1-779-987-0182', 'a@aliquetodioEtiam.co.uk', 'Apdo.:575-3907 A Carretera', 2),
(10, 'Gestión de activos', '1-285-343-6921', 'turpis.vitae@maurissapien.org', '533-907 Vitae ', 1),
(11, 'Atención al cliente', '1-889-496-4002', 'dictum.Phasellus.in@inlobortis.org', '8115 Eu, Av.', 2),
(12, 'Finanzas', '1-706-861-9644', 'ornare@at.com', 'Apdo.:173-5697 Vehicula C/', 1),
(13, 'Publicidad', '1-637-740-4813', 'Proin@dui.ca', '9588 Magna. Ctra.', 3),
(14, 'Recursos humanos', '1-562-760-7737', 'vitae@mattisvelitjusto.co.uk', 'Apdo.:128-6701 Egestas. Avenida', 3),
(15, 'Publicidad', '1-948-605-4920', 'ultricies.ligula.Nullam@euaugue.org', 'Apdo.:753-9118 Egestas. Calle', 3),
(16, 'Gestión de activos', '1-121-546-9843', 'lectus.rutrum@Pellentesquehabitantmorbi.org', 'Apartado núm.: 307, 4489 Nibh. C/', 3),
(17, 'Relaciones públicas', '1-430-255-0364', 'diam@interdumfeugiat.com', 'Apartado núm.: 959, 7140 Penatibus C/', 1),
(18, 'Relaciones públicas', '1-178-447-3434', 'vehicula.aliquet@vestibulumneceuismod.org', '596-6166 Fermentum Avda.', 3),
(19, 'Atención al cliente', '1-779-987-0182', 'a@aliquetodioEtiam.co.uk', 'Apdo.:575-3907 A Carretera', 2),
(20, 'Gestión de activos', '1-285-343-6921', 'turpis.vitae@maurissapien.org', '533-907 Vitae ', 1);

--
-- Disparadores `departamento`
--
DELIMITER $$
CREATE TRIGGER `eliminarDepartamento_BD_TRIGGER` BEFORE DELETE ON `departamento` FOR EACH ROW BEGIN
DELETE FROM gps WHERE gps.departamento_id = OLD.departamento_id;
DELETE FROM usuarios WHERE usuarios.departamento_id = OLD.departamento_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `detalle_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `enlace_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`detalle_id`, `fecha`, `enlace_id`) VALUES
(1, '0000-00-00 00:00:00', 1),
(2, '0000-00-00 00:00:00', 2);

--
-- Disparadores `detalle`
--
DELIMITER $$
CREATE TRIGGER `eliminarDetalle_BD_TRIGGER` BEFORE DELETE ON `detalle` FOR EACH ROW BEGIN
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
  `status` varchar(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa_cliente`
--

INSERT INTO `empresa_cliente` (`empresa_id`, `nombre`, `telefono`, `correo`, `status`) VALUES
(1, 'S.A de C.V.', '7471222313', 'sucorreo|@g.com', '1'),
(2, 'S.A. de R.L.', '7471222314', 'sucorreo2@g.com', '1'),
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
CREATE TRIGGER `eliminarEmpresa_cliente_BD_TRIGGER` BEFORE DELETE ON `empresa_cliente` FOR EACH ROW BEGIN
DELETE FROM departamento WHERE departamento.empresa_id = OLD.empresa_id;
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
(2, 2, 2),
(3, 1, 1),
(4, 2, 3),
(5, 1, 3),
(6, 2, 1),
(7, 1, 1),
(8, 2, 1),
(9, 1, 1),
(10, 2, 1),
(11, 1, 3);

--
-- Disparadores `enlace`
--
DELIMITER $$
CREATE TRIGGER `eliminarEnlace_BD_TRIGGER` BEFORE DELETE ON `enlace` FOR EACH ROW BEGIN
DELETE FROM detalle WHERE detalle.enlace_id = OLD.enlace_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gps`
--

CREATE TABLE `gps` (
  `gps_id` int(11) NOT NULL,
  `imei` varchar(100) DEFAULT NULL,
  `numero` varchar(25) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `autorastreo` varchar(50) DEFAULT 'nofix' COMMENT 'este campo sera llenado con la informacion que se requiere para poder rastrear el dispositivo cada cierto tiempo y en ciertas cantidades\nfix030s5n+password\nnofix+password',
  `departamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gps`
--

INSERT INTO `gps` (`gps_id`, `imei`, `numero`, `descripcion`, `autorastreo`, `departamento_id`) VALUES
(1, '000000000000000', '7471212313', 'un gps', 'nofix', 1),
(2, '100184351997449', '1-312-795-4469', 'dolor sit amet, consectetuer', 'nofix', 2),
(3, '111111111111111', '7471212314', 'otro gps', 'nofix', 1),
(4, '216950486740097', '1-621-355-8159', 'libero lacus, varius et,', 'nofix', 2),
(5, '568026148201897', '1-257-608-0553', 'dis parturient montes, nascetur', 'nofix', 1),
(6, '644554683938622', '1-665-503-4628', 'ornare egestas ligula. Nullam', 'nofix', 2),
(7, '812124402588233', '1-980-983-6980', 'dui. Fusce diam nunc,', 'nofix', 1),
(8, '908258133567869', '1-331-377-7778', 'Cras vehicula aliquet libero.', 'nofix', 2),
(9, '909181318059563', '1-449-475-1736', 'mauris, rhoncus id, mollis', 'nofix', 1),
(10, '932643502624705', '1-276-933-4170', 'Phasellus at augue id', 'nofix', 2),
(11, '961823153914883', '1-411-695-8780', 'eget, volutpat ornare, facilisis', 'nofix', 1),
(12, '974630529293790', '1-745-248-3465', 'a tortor. Nunc commodo', 'nofix', 2);

--
-- Disparadores `gps`
--
DELIMITER $$
CREATE TRIGGER `eliminarGps_BD_TRIGGER` BEFORE DELETE ON `gps` FOR EACH ROW BEGIN
DELETE FROM enlace WHERE enlace.gps_id = OLD.gps_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `ap_paterno` varchar(150) DEFAULT NULL,
  `ap_materno` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrase_na` varchar(200) NOT NULL,
  `departamento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `ap_paterno`, `ap_materno`, `telefono`, `correo`, `usuario`, `contrase_na`, `departamento_id`) VALUES
(1, 'Aldo', 'Estrada', 'Tepec', '4711956', 'aldo_get@hotmail.com', 'aget', '123', 1),
(2, 'william', 'est', 'tep', '4711957', 'alas_bet@hotmail.com', 'wito', '123', 2),
(3, 'Adele', 'Clarke', 'Hopper', '1-509-878-3332', 'amet.lorem@ipsum.co.uk', 'ornare,', '6299', 17),
(4, 'Thor', 'Lang', 'Farrell', '1-858-526-7878', 'ut.sem@sit.com', 'mauris.', '3968', 12),
(5, 'Kendall', 'Weiss', 'Pace', '1-579-681-0940', 'ipsum.leo@tellus.ca', 'egestas.', '9977', 7),
(6, 'Fiona', 'Franklin', 'Boyd', '1-750-817-0628', 'pede.sagittis@vitae.com', 'auctor', '2760', 10),
(7, 'Alexis', 'Bruce', 'Mcdaniel', '1-285-735-4142', 'gravida.Praesent.eu@rutrummagnaCras.co.uk', 'diam', '7455', 19),
(8, 'Phillip', 'Stout', 'Riddle', '1-634-150-2212', 'mollis.dui@placerat.net', 'eu', '3222', 11),
(9, 'Preston', 'Mays', 'Buck', '1-795-423-5856', 'urna.Nunc.quis@vel.net', 'tincidunt', '3413', 9),
(10, 'Aileen', 'Medina', 'Mcguire', '1-379-179-0856', 'Proin.sed@Aliquamgravidamauris.co.uk', 'arcu.', '9998', 1),
(11, 'Raymond', 'Huff', 'Livingston', '1-543-276-7583', 'nec@a.net', 'elit', '5266', 3),
(12, 'Elmo', 'Walls', 'Russell', '1-517-531-0915', 'condimentum.Donec.at@musDonecdignissim.edu', 'mauris', '1980', 18);

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `eliminarUsuarios_BD_TRIGGER` BEFORE DELETE ON `usuarios` FOR EACH ROW BEGIN
DELETE FROM enlace WHERE enlace.usuario_id = OLD.usuario_id;
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
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`departamento_id`),
  ADD KEY `idx_departamento` (`empresa_id`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `idx_detalle` (`enlace_id`);

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
  ADD KEY `idx_gps` (`departamento_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `idx_usuarios` (`departamento_id`);

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
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `departamento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`empresa_id`) REFERENCES `empresa_cliente` (`empresa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `fk_detalle` FOREIGN KEY (`enlace_id`) REFERENCES `enlace` (`enlace_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_gps` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`departamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
