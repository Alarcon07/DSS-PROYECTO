-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-03-2025 a las 03:17:49
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_libros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `calificacion` float DEFAULT NULL,
  `estado` enum('disponible','prestado') DEFAULT 'disponible',
  `fecha_publicacion` date DEFAULT NULL,
  `reseña` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `categoria`, `calificacion`, `estado`, `fecha_publicacion`, `reseña`) VALUES
(1, 'Cien años de soledad', 'Gabriel García Márquez', 'Novela', 4.8, 'disponible', NULL, NULL),
(2, 'El gran Gatsby', 'F. Scott Fitzgerald', 'Novela', 4.5, 'disponible', NULL, NULL),
(3, '1984', 'George Orwell', 'Distopía', 4.7, 'disponible', NULL, NULL),
(4, 'Orgullo y prejuicio', 'Jane Austen', 'Romance', 4.6, 'disponible', NULL, NULL),
(5, 'El alquimista', 'Paulo Coelho', 'Ficción', 4.4, 'disponible', NULL, NULL),
(6, 'Moby Dick', 'Herman Melville', 'Aventura', 4.2, 'disponible', NULL, NULL),
(7, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Clásico', 4.9, 'disponible', NULL, NULL),
(8, 'La sombra del viento', 'Carlos Ruiz Zafón', 'Misterio', 4.8, 'disponible', NULL, NULL),
(9, 'El código Da Vinci', 'Dan Brown', 'Thriller', 4.3, 'disponible', NULL, NULL),
(10, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Fantasía', 4.9, 'disponible', NULL, NULL),
(11, 'Cien años de soledad', 'Gabriel García Márquez', 'Novela', 4.8, 'disponible', NULL, NULL),
(12, 'El gran Gatsby', 'F. Scott Fitzgerald', 'Novela', 4.5, 'disponible', NULL, NULL),
(13, '1984', 'George Orwell', 'Distopía', 4.7, 'disponible', NULL, NULL),
(14, 'Orgullo y prejuicio', 'Jane Austen', 'Romance', 4.6, 'disponible', NULL, NULL),
(15, 'El alquimista', 'Paulo Coelho', 'Ficción', 4.4, 'disponible', NULL, NULL),
(16, 'Moby Dick', 'Herman Melville', 'Aventura', 4.2, 'disponible', NULL, NULL),
(17, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Clásico', 4.9, 'disponible', NULL, NULL),
(18, 'La sombra del viento', 'Carlos Ruiz Zafón', 'Misterio', 4.8, 'disponible', NULL, NULL),
(19, 'El código Da Vinci', 'Dan Brown', 'Thriller', 4.3, 'disponible', NULL, NULL),
(20, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Fantasía', 4.9, 'disponible', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
CREATE TABLE IF NOT EXISTS `prestamos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libro_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `libro_id` (`libro_id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `libros_prestados` int DEFAULT '0',
  `mora` float DEFAULT '0',
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `libros_prestados`, `mora`, `email`, `password`) VALUES
(1, 'Alarcon', 4, 0, 'alarconoscar150@gmail.com', '$2y$10$hdshICccbDkq/EnNUikKFubqsJxwf7i9tUbbuWRIecFXIIKcOaXrS'),
(2, 'Juan', 0, 0, 'Juanpedro@gmail.com', '$2y$10$RD0Lm9wYR10yYIIHrJxEUuprBC.yyqfYsAxzaJkW9dKAbBJNaY/LK');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
