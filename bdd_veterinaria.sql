-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2026 a las 22:38:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdd_veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_consultas`
--

CREATE TABLE `tb_consultas` (
  `id_consulta` int(11) NOT NULL,
  `fecha_consulta` date DEFAULT NULL,
  `hora_consulta` time DEFAULT NULL,
  `motivo_consulta` varchar(100) DEFAULT NULL,
  `diagnostico` varchar(200) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `id_mascota` int(11) NOT NULL,
  `id_veterinario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_tratamiento`
--

CREATE TABLE `tb_detalle_tratamiento` (
  `id_detalle` int(11) NOT NULL,
  `dosis` varchar(50) DEFAULT NULL,
  `frecuencia` varchar(50) DEFAULT NULL,
  `duracion` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_tratamiento` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_dueños`
--

CREATE TABLE `tb_dueños` (
  `id_dueño` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_mascotas`
--

CREATE TABLE `tb_mascotas` (
  `id_mascota` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `raza` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `peso` decimal(6,2) DEFAULT NULL,
  `sexo` varchar(15) DEFAULT NULL,
  `id_dueño` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_medicamentos`
--

CREATE TABLE `tb_medicamentos` (
  `id_medicamento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `laboratorio` varchar(50) DEFAULT NULL,
  `presentacion` varchar(50) DEFAULT NULL,
  `concentracion` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tratamientos`
--

CREATE TABLE `tb_tratamientos` (
  `id_tratamiento` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `indicaciones` varchar(200) DEFAULT NULL,
  `id_consulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_veterinaria`
--

CREATE TABLE `tb_veterinaria` (
  `id_veterinaria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_veterinarios`
--

CREATE TABLE `tb_veterinarios` (
  `id_veterinario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `id_veterinaria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_consultas`
--
ALTER TABLE `tb_consultas`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `fk_mascota_consulta` (`id_mascota`),
  ADD KEY `fk_veterinario_consulta` (`id_veterinario`);

--
-- Indices de la tabla `tb_detalle_tratamiento`
--
ALTER TABLE `tb_detalle_tratamiento`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `fk_tratamiento_detalle` (`id_tratamiento`),
  ADD KEY `fk_medicamento_detalle` (`id_medicamento`);

--
-- Indices de la tabla `tb_dueños`
--
ALTER TABLE `tb_dueños`
  ADD PRIMARY KEY (`id_dueño`);

--
-- Indices de la tabla `tb_mascotas`
--
ALTER TABLE `tb_mascotas`
  ADD PRIMARY KEY (`id_mascota`),
  ADD KEY `fk_dueño_mascota` (`id_dueño`);

--
-- Indices de la tabla `tb_medicamentos`
--
ALTER TABLE `tb_medicamentos`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indices de la tabla `tb_tratamientos`
--
ALTER TABLE `tb_tratamientos`
  ADD PRIMARY KEY (`id_tratamiento`),
  ADD KEY `fk_consulta_tratamiento` (`id_consulta`);

--
-- Indices de la tabla `tb_veterinaria`
--
ALTER TABLE `tb_veterinaria`
  ADD PRIMARY KEY (`id_veterinaria`);

--
-- Indices de la tabla `tb_veterinarios`
--
ALTER TABLE `tb_veterinarios`
  ADD PRIMARY KEY (`id_veterinario`),
  ADD KEY `fk_veterinaria_veterinario` (`id_veterinaria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_consultas`
--
ALTER TABLE `tb_consultas`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_detalle_tratamiento`
--
ALTER TABLE `tb_detalle_tratamiento`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_dueños`
--
ALTER TABLE `tb_dueños`
  MODIFY `id_dueño` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_mascotas`
--
ALTER TABLE `tb_mascotas`
  MODIFY `id_mascota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_medicamentos`
--
ALTER TABLE `tb_medicamentos`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_tratamientos`
--
ALTER TABLE `tb_tratamientos`
  MODIFY `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_veterinaria`
--
ALTER TABLE `tb_veterinaria`
  MODIFY `id_veterinaria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_veterinarios`
--
ALTER TABLE `tb_veterinarios`
  MODIFY `id_veterinario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_consultas`
--
ALTER TABLE `tb_consultas`
  ADD CONSTRAINT `fk_mascota_consulta` FOREIGN KEY (`id_mascota`) REFERENCES `tb_mascotas` (`id_mascota`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_veterinario_consulta` FOREIGN KEY (`id_veterinario`) REFERENCES `tb_veterinarios` (`id_veterinario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_detalle_tratamiento`
--
ALTER TABLE `tb_detalle_tratamiento`
  ADD CONSTRAINT `fk_medicamento_detalle` FOREIGN KEY (`id_medicamento`) REFERENCES `tb_medicamentos` (`id_medicamento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tratamiento_detalle` FOREIGN KEY (`id_tratamiento`) REFERENCES `tb_tratamientos` (`id_tratamiento`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_mascotas`
--
ALTER TABLE `tb_mascotas`
  ADD CONSTRAINT `fk_dueño_mascota` FOREIGN KEY (`id_dueño`) REFERENCES `tb_dueños` (`id_dueño`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_tratamientos`
--
ALTER TABLE `tb_tratamientos`
  ADD CONSTRAINT `fk_consulta_tratamiento` FOREIGN KEY (`id_consulta`) REFERENCES `tb_consultas` (`id_consulta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_veterinarios`
--
ALTER TABLE `tb_veterinarios`
  ADD CONSTRAINT `fk_veterinaria_veterinario` FOREIGN KEY (`id_veterinaria`) REFERENCES `tb_veterinaria` (`id_veterinaria`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
