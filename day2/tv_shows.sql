-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 09, 2022 at 07:20 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tv_shows`
--

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `nr_show` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`id`, `name`, `birth_date`, `nr_show`) VALUES
(1, 'Garth Jennings', '1972-03-04', 1),
(2, 'Matthew Bob-Waksberg', '1984-08-17', 1),
(3, 'Quentin Tarantino', '1963-03-27', 2);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `genre`, `info`) VALUES
(1, 'Comedy', 'It puts you in a good mood'),
(2, 'Science fiction', 'futuristic concepts'),
(3, 'Adventure', 'series of actions outside the usual happenings '),
(4, 'Comedy drama ', 'dramatic works that combines elements of comedy'),
(5, 'Black comedy', 'a style of comedy that makes light of subject matter that is generally considered taboo'),
(6, 'Drama', 'A category or genre of narrative fiction intended to be more serious than humorous in tone'),
(7, 'Thriller ', 'Giving viewers heightened feelings of suspense, excitement, surprise, anticipation and anxiety.'),
(8, 'Military Movies', 'With combat scenes');

-- --------------------------------------------------------

--
-- Table structure for table `genre_show`
--

DROP TABLE IF EXISTS `genre_show`;
CREATE TABLE IF NOT EXISTS `genre_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_show` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genre` (`genre`),
  KEY `_show` (`_show`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre_show`
--

INSERT INTO `genre_show` (`id`, `_show`, `genre`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 4),
(6, 2, 5),
(7, 3, 6),
(8, 3, 7),
(9, 3, 1),
(10, 4, 3),
(11, 4, 8);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `streaming_platform`
--

INSERT INTO `streaming_platform` (`id`, `name`, `domain`) VALUES
(1, 'HBO Max', 'https://www.hbomax.com/'),
(2, 'Netflix', 'https://www.netflix.com\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `_show`
--

DROP TABLE IF EXISTS `_show`;
CREATE TABLE IF NOT EXISTS `_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director` int(11) NOT NULL,
  `streaming_platform` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rating` float NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `director` (`director`),
  KEY `streaming_platform` (`streaming_platform`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_show`
--

INSERT INTO `_show` (`id`, `director`, `streaming_platform`, `name`, `rating`, `release_date`) VALUES
(1, 1, 1, 'The Hitchhiker\'s Guide', 7.7, '2005-04-28'),
(2, 2, 2, 'BoJack Horseman', 9.8, '2014-08-22'),
(3, 3, 2, 'Pulp Fiction', 9.7, '1994-05-12'),
(4, 3, 2, 'Ungrateful bastards', 8.3, '2009-09-04');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `genre_show`
--
ALTER TABLE `genre_show`
  ADD CONSTRAINT `genre_show_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `genre_show_ibfk_2` FOREIGN KEY (`_show`) REFERENCES `_show` (`id`);

--
-- Constraints for table `_show`
--
ALTER TABLE `_show`
  ADD CONSTRAINT `_show_ibfk_2` FOREIGN KEY (`director`) REFERENCES `director` (`id`),
  ADD CONSTRAINT `_show_ibfk_3` FOREIGN KEY (`streaming_platform`) REFERENCES `streaming_platform` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
