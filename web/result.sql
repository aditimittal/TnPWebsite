-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 29, 2018 at 01:12 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_2015`
--

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `enrollment_number` varchar(11) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `total_marks_credits` int(11) NOT NULL,
  `total_credits` int(11) NOT NULL,
  `percentage` float NOT NULL,
  `percentage_credits` float NOT NULL,
  `semester` int(11) NOT NULL,
  `Dead_Backs` int(11) NOT NULL,
  `Active_Backs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`enrollment_number`, `total_marks`, `total_marks_credits`, `total_credits`, `percentage`, `percentage_credits`, `semester`, `Dead_Backs`, `Active_Backs`) VALUES
('02301032014', 100, 400, 4, 100, 100, 8, 0, 0),
('02001032014', 98, 392, 4, 98, 98, 8, 0, 0),
('00701032015', 35, 140, 8, 17.5, 17.5, 2, 0, 0),
('00701032015', 220, 880, 16, 55, 55, 5, 0, 3),
('00701032015', 90, 360, 8, 45, 45, 6, 0, 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
