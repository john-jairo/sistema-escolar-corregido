-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-07-2021 a las 18:22:31
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema-escolar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

DROP TABLE IF EXISTS `actividad`;
CREATE TABLE IF NOT EXISTS `actividad` (
  `actividad_id` int NOT NULL AUTO_INCREMENT,
  `nombre_actividad` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`actividad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`actividad_id`, `nombre_actividad`, `estado`) VALUES
(4, 'Evaluacion 1', 1),
(5, 'Evaluacion 2', 0),
(6, 'evaluación 3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `alumno_id` int NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `edad` int NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cedula` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` bigint NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `u_acceso` datetime DEFAULT NULL,
  PRIMARY KEY (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`alumno_id`, `nombre_alumno`, `edad`, `direccion`, `cedula`, `clave`, `telefono`, `correo`, `fecha_nac`, `fecha_registro`, `estado`, `u_acceso`) VALUES
(5, 'andres parra', 10, 'Venezuela', '20111111', '$2y$10$02kyIX0bKbUT2ejIT9y2AuXgJSfvYKLMXUKSWqVIs.GuH2IdMTAXm', 123456789, 'andres@andres.com', '2010-02-10', '2020-11-03', 1, '2021-07-14 07:27:03'),
(6, 'Moises Perez', 12, 'Venezuela', '20222222', '', 123456789, 'moises@moises.com', '2008-11-02', '2020-11-12', 1, NULL),
(7, 'Victor Gamarra', 12, 'Venezuela', '20333333', '', 123456789, 'victor@victor.com', '2008-09-20', '2020-11-12', 1, NULL),
(8, 'prueba', 10, 'Venezuela', '13131313', '$2y$10$cFMvx7Vc7mz7cIGU4IUUx.Mo.9LxmVJrhkThVJgB/AFZlCacaEY52', 123456789, 'prueba@prueba.com', '2020-11-13', '2020-11-13', 1, '2021-07-15 12:51:04'),
(9, 'edgar', 12, 'diagonal', '9202', '$2y$10$90kfVHdYt9TvH9QqDBB7LeHdNANRMG49UgBqt2zFncSIrnrw4oIby', 3124567897, 'edgar@edgar', '2021-03-01', '2021-05-12', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_profesor`
--

DROP TABLE IF EXISTS `alumno_profesor`;
CREATE TABLE IF NOT EXISTS `alumno_profesor` (
  `ap_id` int NOT NULL AUTO_INCREMENT,
  `alumno_id` int NOT NULL,
  `pm_id` int NOT NULL,
  `periodo_id` int NOT NULL,
  `estadop` int NOT NULL,
  PRIMARY KEY (`ap_id`),
  KEY `alumno_id` (`alumno_id`),
  KEY `proceso_id` (`pm_id`),
  KEY `periodo_id` (`periodo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno_profesor`
--

INSERT INTO `alumno_profesor` (`ap_id`, `alumno_id`, `pm_id`, `periodo_id`, `estadop`) VALUES
(10, 8, 19, 6, 0),
(11, 6, 17, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE IF NOT EXISTS `aulas` (
  `aula_id` int NOT NULL AUTO_INCREMENT,
  `nombre_aula` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`aula_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`aula_id`, `nombre_aula`, `estado`) VALUES
(27, 'A', 1),
(28, 'B', 1),
(29, 'C', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos`
--

DROP TABLE IF EXISTS `contenidos`;
CREATE TABLE IF NOT EXISTS `contenidos` (
  `contenido_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `material` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pm_id` int NOT NULL,
  PRIMARY KEY (`contenido_id`),
  KEY `pm_id` (`pm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `contenidos`
--

INSERT INTO `contenidos` (`contenido_id`, `titulo`, `descripcion`, `material`, `pm_id`) VALUES
(11, 'base de datos ', 'realizar la normalización de la base ', '../../../uploads/6308/sistema-escolar.sql', 17),
(13, 'PRUEBA EVALUACION ', 'DESCRIPCION PRUEBA EVALUACION ', '../../../uploads/7961/sistema-escolar.sql', 19),
(14, 'landing page', 'realizar una landing page del proyecto estudiantil', '../../../uploads/6206/sistema-escolar.sql', 17),
(15, 'base de datos ', 'realizar ajustes', '../../../uploads/2109/sistema-escolar.sql', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

DROP TABLE IF EXISTS `evaluaciones`;
CREATE TABLE IF NOT EXISTS `evaluaciones` (
  `evaluacion_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `porcentaje` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `contenido_id` int NOT NULL,
  PRIMARY KEY (`evaluacion_id`),
  KEY `contenido_id` (`contenido_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `evaluaciones`
--

INSERT INTO `evaluaciones` (`evaluacion_id`, `titulo`, `descripcion`, `fecha`, `porcentaje`, `contenido_id`) VALUES
(16, 'base de datos ', 'subir la base de datos ya normalizada', '2021-07-28', '20%', 11),
(19, 'PRUEBA EVALUACION II', 'DESCRIPCION PRUEBA EVALUACION ', '2021-07-22', '20%', 13),
(20, 'programación 1', 'landing', '2021-07-16', '20%', 14),
(21, 'base de datos', 'realizar normalización ', '2021-07-16', '20%', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ev_entregadas`
--

DROP TABLE IF EXISTS `ev_entregadas`;
CREATE TABLE IF NOT EXISTS `ev_entregadas` (
  `ev_entregada_id` int NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int NOT NULL,
  `alumno_id` int NOT NULL,
  `material_alumno` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `observacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ev_entregada_id`),
  KEY `evaluacion_id` (`evaluacion_id`),
  KEY `alumno_id` (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ev_entregadas`
--

INSERT INTO `ev_entregadas` (`ev_entregada_id`, `evaluacion_id`, `alumno_id`, `material_alumno`, `observacion`) VALUES
(8, 19, 8, '../../../uploads/6470/sistema-escolar.sql', 'Descripción de la actividad entregada '),
(9, 21, 8, '../../../uploads/9031/Formato Bitacora - abril 15.docx', 'r');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

DROP TABLE IF EXISTS `grados`;
CREATE TABLE IF NOT EXISTS `grados` (
  `grado_id` int NOT NULL AUTO_INCREMENT,
  `nombre_grado` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`grado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`grado_id`, `nombre_grado`, `estado`) VALUES
(19, 'Pre - jardín ', 1),
(20, 'jardín ', 1),
(21, 'Transición ', 1),
(22, 'Primero ', 1),
(23, 'Segundo', 1),
(24, 'Tercero ', 1),
(25, 'Cuarto', 1),
(26, 'Quinto ', 1),
(27, 'Sexto', 1),
(28, 'Séptimo ', 1),
(30, 'Octavo ', 1),
(31, 'Noveno', 1),
(32, 'Decimo', 1),
(33, 'Once', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

DROP TABLE IF EXISTS `materias`;
CREATE TABLE IF NOT EXISTS `materias` (
  `materia_id` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`materia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`materia_id`, `nombre_materia`, `estado`) VALUES
(20, 'Matematica', 1),
(21, 'Fisica', 1),
(22, 'Ciencias ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `nota_id` int NOT NULL AUTO_INCREMENT,
  `ev_entregada_id` int NOT NULL,
  `valor_nota` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nota_id`),
  KEY `ev_entregada_id` (`ev_entregada_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`nota_id`, `ev_entregada_id`, `valor_nota`, `fecha`) VALUES
(21, 8, 50, '2021-07-15 12:53:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

DROP TABLE IF EXISTS `periodos`;
CREATE TABLE IF NOT EXISTS `periodos` (
  `periodo_id` int NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`periodo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`periodo_id`, `nombre_periodo`, `estado`) VALUES
(6, '2020-2021', 1),
(7, '2022', 0),
(8, '2023', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `profesor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cedula` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` bigint NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nivel_est` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`profesor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`profesor_id`, `nombre`, `direccion`, `cedula`, `clave`, `telefono`, `correo`, `nivel_est`, `estado`) VALUES
(4, 'Jose Mendoza', 'Venezuelaaaa', '121212', '$2y$10$pVAxavcLuckUeRpr.sYHgOoHjisv1T67alBtRjq19Uq/32lwbOdSu', 123456789, 'jose@jose.com', 'Ing de Sistemas', 1),
(5, 'Robert Morales', 'Venezuela', '131313', '$2y$10$7FASKAzyYzs.MBEeJgnJ.u0LFjITKHS3NofUZ3Nwm2ei39FQeMVSK', 123456789, 'robert@robert.com', 'Licenciado en Educacion', 0),
(6, 'john', 'calle 182 con 7', '1014176844', '$2y$10$uPJzr/RMkDT.trJFOH4ayORKld1X8l2zlSoMksW93pVOKBBN8pc52', 3202197508, 'j@j', 'tegnologo', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor_materia`
--

DROP TABLE IF EXISTS `profesor_materia`;
CREATE TABLE IF NOT EXISTS `profesor_materia` (
  `pm_id` int NOT NULL AUTO_INCREMENT,
  `grado_id` int NOT NULL,
  `aula_id` int NOT NULL,
  `profesor_id` int NOT NULL,
  `materia_id` int NOT NULL,
  `periodo_id` int NOT NULL,
  `estadopm` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`pm_id`),
  KEY `grado_id` (`grado_id`),
  KEY `aula_id` (`aula_id`),
  KEY `profesor_id` (`profesor_id`),
  KEY `materia_id` (`materia_id`),
  KEY `periodo_id` (`periodo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesor_materia`
--

INSERT INTO `profesor_materia` (`pm_id`, `grado_id`, `aula_id`, `profesor_id`, `materia_id`, `periodo_id`, `estadopm`) VALUES
(17, 19, 28, 4, 20, 6, 1),
(18, 19, 27, 4, 21, 6, 0),
(19, 33, 27, 4, 20, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Asistente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rol` int NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`usuario_id`),
  KEY `rol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `usuario`, `clave`, `rol`, `estado`) VALUES
(1, 'Luis Nogueraa', 'admin', '$2y$10$0R6PdfuRSnsORi1WtYlTAuxZcEHS2t0b97OuhmTBDbf2c6zNphFhC', 1, 1),
(2, 'Jesus Mireles', 'jesus1', '$2y$10$542r4iZksjzAHiwKPiv8N.CeEPdSLgvBy1kHvzO7XXL3Hy3ZE91RO', 2, 0),
(3, 'Andres', 'andres1', '$2y$10$JxgE22yI3FkXxLpQ7NF6hucjJ2Cx.7J68.nn/JxiMUIVr3n8zUeRC', 1, 1),
(4, 'ggg', 'gg', '$2y$10$lzOoggNTmLN9vel3KgybzuR7VmBdpKeC0V7sKdO89DXLcLjqTZoVG', 1, 0),
(5, 'jair', 'jair', '$2y$10$u6vP8/lH241dju6tl3Q6dOn35IYtNQYC0jTLC4Xg9ncDw1emk5bl.', 2, 1),
(6, 'm', 'm', '$2y$10$JVRjHFUwuJbSlxoMrQk1Rua30Q0T5awwwFoZ/d7Tl60ivFDM.oRIW', 1, 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno_profesor`
--
ALTER TABLE `alumno_profesor`
  ADD CONSTRAINT `alumno_profesor_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_profesor_ibfk_2` FOREIGN KEY (`pm_id`) REFERENCES `profesor_materia` (`pm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_profesor_ibfk_3` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`periodo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contenidos`
--
ALTER TABLE `contenidos`
  ADD CONSTRAINT `contenidos_ibfk_1` FOREIGN KEY (`pm_id`) REFERENCES `profesor_materia` (`pm_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `evaluaciones_ibfk_3` FOREIGN KEY (`contenido_id`) REFERENCES `contenidos` (`contenido_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ev_entregadas`
--
ALTER TABLE `ev_entregadas`
  ADD CONSTRAINT `ev_entregadas_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ev_entregadas_ibfk_2` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluaciones` (`evaluacion_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`ev_entregada_id`) REFERENCES `ev_entregadas` (`ev_entregada_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesor_materia`
--
ALTER TABLE `profesor_materia`
  ADD CONSTRAINT `profesor_materia_ibfk_1` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`aula_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profesor_materia_ibfk_2` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`grado_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profesor_materia_ibfk_3` FOREIGN KEY (`profesor_id`) REFERENCES `profesor` (`profesor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profesor_materia_ibfk_5` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`materia_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profesor_materia_ibfk_6` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`periodo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
