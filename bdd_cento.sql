-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2026 a las 22:38:45
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
-- Base de datos: `bdd_cento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_aulas`
--

CREATE TABLE `tb_aulas` (
  `id_aula` int(11) NOT NULL,
  `nombre_aula` varchar(50) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `tipo_aula` varchar(50) DEFAULT NULL,
  `id_centro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_calificaciones`
--

CREATE TABLE `tb_calificaciones` (
  `id_calificacion` int(11) NOT NULL,
  `nota` decimal(5,2) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `fecha_evaluacion` date DEFAULT NULL,
  `tipo_evaluacion` varchar(50) DEFAULT NULL,
  `id_matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_centro_formacion`
--

CREATE TABLE `tb_centro_formacion` (
  `id_centro` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cursos`
--

CREATE TABLE `tb_cursos` (
  `id_curso` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `duracion_horas` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_programa` int(11) NOT NULL,
  `id_instructor` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_estudiantes`
--

CREATE TABLE `tb_estudiantes` (
  `id_estudiante` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_instructores`
--

CREATE TABLE `tb_instructores` (
  `id_instructor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `profesion` varchar(100) DEFAULT NULL,
  `id_centro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_matriculas`
--

CREATE TABLE `tb_matriculas` (
  `id_matricula` int(11) NOT NULL,
  `fecha_matricula` date DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `periodo_academico` varchar(30) DEFAULT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_programas`
--

CREATE TABLE `tb_programas` (
  `id_programa` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `duracion_meses` int(11) DEFAULT NULL,
  `nivel_formacion` varchar(50) DEFAULT NULL,
  `modalidad` varchar(50) DEFAULT NULL,
  `id_centro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_aulas`
--
ALTER TABLE `tb_aulas`
  ADD PRIMARY KEY (`id_aula`),
  ADD KEY `fk_centro_aula` (`id_centro`);

--
-- Indices de la tabla `tb_calificaciones`
--
ALTER TABLE `tb_calificaciones`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD KEY `fk_matricula_calificacion` (`id_matricula`);

--
-- Indices de la tabla `tb_centro_formacion`
--
ALTER TABLE `tb_centro_formacion`
  ADD PRIMARY KEY (`id_centro`);

--
-- Indices de la tabla `tb_cursos`
--
ALTER TABLE `tb_cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `fk_programa_curso` (`id_programa`),
  ADD KEY `fk_instructor_curso` (`id_instructor`),
  ADD KEY `fk_aula_curso` (`id_aula`);

--
-- Indices de la tabla `tb_estudiantes`
--
ALTER TABLE `tb_estudiantes`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `tb_instructores`
--
ALTER TABLE `tb_instructores`
  ADD PRIMARY KEY (`id_instructor`),
  ADD KEY `fk_centro_instructor` (`id_centro`);

--
-- Indices de la tabla `tb_matriculas`
--
ALTER TABLE `tb_matriculas`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `fk_estudiante_matricula` (`id_estudiante`),
  ADD KEY `fk_curso_matricula` (`id_curso`);

--
-- Indices de la tabla `tb_programas`
--
ALTER TABLE `tb_programas`
  ADD PRIMARY KEY (`id_programa`),
  ADD KEY `fk_centro_programa` (`id_centro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_aulas`
--
ALTER TABLE `tb_aulas`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_calificaciones`
--
ALTER TABLE `tb_calificaciones`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_centro_formacion`
--
ALTER TABLE `tb_centro_formacion`
  MODIFY `id_centro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_cursos`
--
ALTER TABLE `tb_cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_estudiantes`
--
ALTER TABLE `tb_estudiantes`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_instructores`
--
ALTER TABLE `tb_instructores`
  MODIFY `id_instructor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_matriculas`
--
ALTER TABLE `tb_matriculas`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_programas`
--
ALTER TABLE `tb_programas`
  MODIFY `id_programa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_aulas`
--
ALTER TABLE `tb_aulas`
  ADD CONSTRAINT `fk_centro_aula` FOREIGN KEY (`id_centro`) REFERENCES `tb_centro_formacion` (`id_centro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_calificaciones`
--
ALTER TABLE `tb_calificaciones`
  ADD CONSTRAINT `fk_matricula_calificacion` FOREIGN KEY (`id_matricula`) REFERENCES `tb_matriculas` (`id_matricula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_cursos`
--
ALTER TABLE `tb_cursos`
  ADD CONSTRAINT `fk_aula_curso` FOREIGN KEY (`id_aula`) REFERENCES `tb_aulas` (`id_aula`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_instructor_curso` FOREIGN KEY (`id_instructor`) REFERENCES `tb_instructores` (`id_instructor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_programa_curso` FOREIGN KEY (`id_programa`) REFERENCES `tb_programas` (`id_programa`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_instructores`
--
ALTER TABLE `tb_instructores`
  ADD CONSTRAINT `fk_centro_instructor` FOREIGN KEY (`id_centro`) REFERENCES `tb_centro_formacion` (`id_centro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_matriculas`
--
ALTER TABLE `tb_matriculas`
  ADD CONSTRAINT `fk_curso_matricula` FOREIGN KEY (`id_curso`) REFERENCES `tb_cursos` (`id_curso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estudiante_matricula` FOREIGN KEY (`id_estudiante`) REFERENCES `tb_estudiantes` (`id_estudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_programas`
--
ALTER TABLE `tb_programas`
  ADD CONSTRAINT `fk_centro_programa` FOREIGN KEY (`id_centro`) REFERENCES `tb_centro_formacion` (`id_centro`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
