-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2017 a las 19:51:22
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

CREATE TABLE `aula` (
  `IdAula` char(4) NOT NULL,
  `edificio` char(1) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `estado` binary(1) DEFAULT NULL,
  `IdTipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `IdClase` char(6) NOT NULL,
  `nomClase` char(30) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `IdTipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `IdPeriodo` char(1) NOT NULL,
  `año` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `seccion` char(4) NOT NULL,
  `Nseccionesç` char(1) DEFAULT NULL,
  `nalumnos` int(11) DEFAULT NULL,
  `Lunes` binary(1) DEFAULT NULL,
  `IdAula` char(4) DEFAULT NULL,
  `IdPeriodo` char(1) DEFAULT NULL,
  `IdClase` char(6) DEFAULT NULL,
  `hora` char(2) DEFAULT NULL,
  `Martes` binary(1) DEFAULT NULL,
  `Miercoles` binary(1) DEFAULT NULL,
  `Jueves` binary(1) DEFAULT NULL,
  `Viernes` binary(1) DEFAULT NULL,
  `Sabado` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_aula`
--

CREATE TABLE `tipo_aula` (
  `IdTipo` int(11) NOT NULL,
  `tipo` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`IdAula`),
  ADD KEY `R_3` (`IdTipo`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`IdClase`),
  ADD KEY `R_7` (`IdTipo`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`IdPeriodo`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`seccion`),
  ADD KEY `R_4` (`IdAula`),
  ADD KEY `R_5` (`IdPeriodo`),
  ADD KEY `R_6` (`IdClase`);

--
-- Indices de la tabla `tipo_aula`
--
ALTER TABLE `tipo_aula`
  ADD PRIMARY KEY (`IdTipo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `R_3` FOREIGN KEY (`IdTipo`) REFERENCES `tipo_aula` (`IdTipo`);

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `R_7` FOREIGN KEY (`IdTipo`) REFERENCES `tipo_aula` (`IdTipo`);

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `R_4` FOREIGN KEY (`IdAula`) REFERENCES `aula` (`IdAula`),
  ADD CONSTRAINT `R_5` FOREIGN KEY (`IdPeriodo`) REFERENCES `periodo` (`IdPeriodo`),
  ADD CONSTRAINT `R_6` FOREIGN KEY (`IdClase`) REFERENCES `clase` (`IdClase`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
