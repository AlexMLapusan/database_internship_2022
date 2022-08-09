-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 09, 2022 at 08:34 AM
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
-- Database: `day2`
--

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `no_of_shows` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`ID`, `name`, `birth_date`, `no_of_shows`) VALUES
(1, 'Tom Sam', '1973-08-22', 5),
(3, 'Fred Flinstone', '1963-03-20', 20),
(4, 'Sarah Pretty', '2002-07-16', 2),
(5, 'Mike Trent', '2022-05-10', 3);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`ID`, `name`, `description`) VALUES
(1, 'Comedy', 'Very funny and laughable'),
(2, 'Drama', 'Will make you cry and regret watching it'),
(3, 'Thriller', 'Will haunt you for 2 weeks'),
(4, 'Romance', 'Makes you love everyone'),
(5, 'Mistery', 'Challenges you');

-- --------------------------------------------------------

--
-- Table structure for table `show_genre`
--

DROP TABLE IF EXISTS `show_genre`;
CREATE TABLE IF NOT EXISTS `show_genre` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `showID` int(11) NOT NULL,
  `genreID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `showID` (`showID`),
  KEY `genreID` (`genreID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `show_genre`
--

INSERT INTO `show_genre` (`ID`, `showID`, `genreID`) VALUES
(1, 5, 2),
(2, 7, 5),
(3, 9, 1),
(4, 3, 3),
(5, 8, 1),
(6, 2, 5),
(7, 6, 1),
(8, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `streaming_platform`
--

DROP TABLE IF EXISTS `streaming_platform`;
CREATE TABLE IF NOT EXISTS `streaming_platform` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `streaming_platform`
--

INSERT INTO `streaming_platform` (`ID`, `name`, `domain`) VALUES
(1, 'Netflix', 'netflix.com'),
(2, 'HBO MAX', 'hbo.com'),
(3, 'Disney PLUS', 'disneyplus.com'),
(4, 'Voyo', 'protv.voyo.com');

-- --------------------------------------------------------

--
-- Table structure for table `tv_show`
--

DROP TABLE IF EXISTS `tv_show`;
CREATE TABLE IF NOT EXISTS `tv_show` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rating` float DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `directorID` int(11) NOT NULL,
  `streaming_platformID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `directorID` (`directorID`),
  KEY `streaming_platformID` (`streaming_platformID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tv_show`
--

INSERT INTO `tv_show` (`ID`, `name`, `rating`, `release_date`, `directorID`, `streaming_platformID`) VALUES
(2, 'The Good Place', 8.5, '2017-06-12', 1, 1),
(3, 'Strnger Things', 8.7, '2018-10-13', 4, 1),
(5, 'Lion King', 7.8, '2005-07-04', 3, 3),
(6, 'Two and A Half Men', 7.2, '2002-08-14', 5, 2),
(7, 'Manifest', 7.9, '2019-08-22', 1, 1),
(8, 'The Big Bang Theory', 7.2, '2002-07-15', 3, 2),
(9, 'Romanii au talent', 5.9, '2012-05-07', 3, 4),
(10, 'Exam', 8.2, '2013-06-06', 5, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `show_genre`
--
ALTER TABLE `show_genre`
  ADD CONSTRAINT `show_genre_ibfk_1` FOREIGN KEY (`showID`) REFERENCES `tv_show` (`ID`),
  ADD CONSTRAINT `show_genre_ibfk_2` FOREIGN KEY (`genreID`) REFERENCES `genre` (`ID`);

--
-- Constraints for table `tv_show`
--
ALTER TABLE `tv_show`
  ADD CONSTRAINT `tv_show_ibfk_1` FOREIGN KEY (`directorID`) REFERENCES `director` (`ID`),
  ADD CONSTRAINT `tv_show_ibfk_2` FOREIGN KEY (`streaming_platformID`) REFERENCES `streaming_platform` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
