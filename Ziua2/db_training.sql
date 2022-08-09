-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 09, 2022 at 11:49 AM
-- Server version: 5.7.36-log
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_training`
--

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `no_shows` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`id`, `name`, `birth_date`, `no_shows`) VALUES
(1, 'Stanley Kubrick', '1928-06-26', 2),
(2, 'David Benioff', '1970-09-25', 2),
(3, 'Eric Kripke', '1974-04-24', 1),
(4, 'Taika Waititi', '1875-08-16', 2),
(5, 'Jon Finn', '1992-08-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(2048) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`, `description`) VALUES
(1, 'horror', 'Scares you... or something'),
(2, 'Romance', 'Movies that either make you feel more single than you are or glad that you are that way'),
(3, 'comedy', 'Makes you haha'),
(4, 'thriller', 'Keeps you on edge of your seat'),
(5, 'drama', 'Just no...'),
(6, 'fantasy', 'Science fiction but like... with no technology');

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
CREATE TABLE IF NOT EXISTS `shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rating` float NOT NULL,
  `release_date` date NOT NULL,
  `director_id` int(11) NOT NULL,
  `streaming_platform_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_show_director` (`director_id`),
  KEY `fk_streaming_platform` (`streaming_platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`id`, `name`, `rating`, `release_date`, `director_id`, `streaming_platform_id`) VALUES
(2, 'Game of Thrones', 9.2, '2011-04-17', 2, 3),
(3, 'The shining', 8.5, '1980-05-23', 1, 2),
(4, 'The boys', 8.7, '2019-07-26', 3, 2),
(5, 'Jojo Rabbit', 8.9, '2019-10-18', 4, 1),
(6, 'Eyes Wide Shut', 8, '1999-10-03', 1, 3),
(7, 'Winx fate saga', 5.9, '2019-08-01', 5, 1),
(8, 'Some random series', 3.3, '2021-08-04', 4, 1),
(9, 'Some other bad show', 2.2, '2014-08-06', 2, 1);

--
-- Triggers `shows`
--
DROP TRIGGER IF EXISTS `update_shows_number`;
DELIMITER $$
CREATE TRIGGER `update_shows_number` AFTER INSERT ON `shows` FOR EACH ROW UPDATE director SET no_shows = no_shows+1 WHERE director.id = NEW.director_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `shows_genre`
--

DROP TABLE IF EXISTS `shows_genre`;
CREATE TABLE IF NOT EXISTS `shows_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_show_id` (`show_id`),
  KEY `fk_genre_id` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shows_genre`
--

INSERT INTO `shows_genre` (`id`, `show_id`, `genre_id`) VALUES
(1, 4, 5),
(2, 6, 4),
(3, 5, 3),
(4, 5, 5),
(5, 3, 4),
(6, 3, 1),
(7, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `streaming_platform`
--

DROP TABLE IF EXISTS `streaming_platform`;
CREATE TABLE IF NOT EXISTS `streaming_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `streaming_platform`
--

INSERT INTO `streaming_platform` (`id`, `name`, `domain`) VALUES
(1, 'Netflix', 'netflix.com'),
(2, 'Amazon prime', 'primevideo.com'),
(3, 'HBO Max', 'hbomax.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `fk_show_director` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_streaming_platform` FOREIGN KEY (`streaming_platform_id`) REFERENCES `streaming_platform` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shows_genre`
--
ALTER TABLE `shows_genre`
  ADD CONSTRAINT `fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_show_id` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
