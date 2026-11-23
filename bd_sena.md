[bdd_sena.sql](https://github.com/user-attachments/files/35297763/bdd_sena.sql)
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2026 a las 21:20:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdd_sena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_aprendices`
--

CREATE TABLE `tb_aprendices` (
  `id_aprendiz` int(11) NOT NULL,
  `nombre_ap` varchar(50) DEFAULT NULL,
  `tipo_doc` varchar(12) DEFAULT NULL,
  `No_doc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_competencias`
--

CREATE TABLE `tb_competencias` (
  `id_competencia` int(11) NOT NULL,
  `competencia` varchar(100) DEFAULT NULL,
  `cod_competencia` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `campo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ficha_grupos`
--

CREATE TABLE `tb_ficha_grupos` (
  `id_ficha` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `numero_ficha` int(11) DEFAULT NULL,
  `programa` varchar(30) DEFAULT NULL,
  `estado` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_instructores`
--

CREATE TABLE `tb_instructores` (
  `id_instructor` int(11) NOT NULL,
  `nombre` varchar(55) DEFAULT NULL,
  `tipo_de_doc` varchar(30) DEFAULT NULL,
  `No_de_doc` int(11) DEFAULT NULL,
  `especialidad` varchar(45) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_aprendices`
--
ALTER TABLE `tb_aprendices`
  ADD PRIMARY KEY (`id_aprendiz`);

--
-- Indices de la tabla `tb_competencias`
--
ALTER TABLE `tb_competencias`
  ADD PRIMARY KEY (`id_competencia`);

--
-- Indices de la tabla `tb_ficha_grupos`
--
ALTER TABLE `tb_ficha_grupos`
  ADD PRIMARY KEY (`id_ficha`);

--
-- Indices de la tabla `tb_instructores`
--
ALTER TABLE `tb_instructores`
  ADD PRIMARY KEY (`id_instructor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_aprendices`
--
ALTER TABLE `tb_aprendices`
  MODIFY `id_aprendiz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_competencias`
--
ALTER TABLE `tb_competencias`
  MODIFY `id_competencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_ficha_grupos`
--
ALTER TABLE `tb_ficha_grupos`
  MODIFY `id_ficha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_instructores`
--
ALTER TABLE `tb_instructores`
  MODIFY `id_instructor` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
