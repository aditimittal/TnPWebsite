-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 22, 2018 at 04:56 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tnp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `rights` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `designation`, `department`, `rights`, `password`) VALUES
(21, 'Avinash', 'avinash@gmail.com', 'student coord', 'CSE', 'full', '253e5622d84655b836d7cd31b3b1898f29bc3601'),
(23, 'admin', 'tpo@gmail.com', 'TPO', 'IT', 'full', '84b0a7f6c85a947c00bf0156f97d47ee3f92eead'),
(24, 'Navya Singh', 'navya@gmail.com', 'student coordinator', 'IT', 'full', 'addc85187b52679c5e6918652557265596e0a322'),
(25, 'admin', 'admin1@gmail.com', 'TPO', 'IT', 'full', '84b0a7f6c85a947c00bf0156f97d47ee3f92eead');

-- --------------------------------------------------------

--
-- Table structure for table `admin_rights`
--

CREATE TABLE `admin_rights` (
  `user_id` int(11) NOT NULL,
  `rights` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_sentbox`
--

CREATE TABLE `admin_sentbox` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `recipient` varchar(50) NOT NULL,
  `postdate` date NOT NULL,
  `time` varchar(20) NOT NULL,
  `email` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `calID` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `month_` int(11) NOT NULL,
  `year_` int(11) NOT NULL,
  `deptCode` varchar(40) NOT NULL,
  `courseCode` varchar(40) NOT NULL,
  `yearOfDegree` int(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  `eventInfo` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deadline`
--

CREATE TABLE `deadline` (
  `did` int(11) NOT NULL,
  `start_date` varchar(11) DEFAULT NULL,
  `end_date` varchar(11) DEFAULT NULL,
  `course` varchar(10) NOT NULL,
  `Department` varchar(50) NOT NULL,
  `Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deadline`
--

INSERT INTO `deadline` (`did`, `start_date`, `end_date`, `course`, `Department`, `Year`) VALUES
(12, '2017-12-26', '2018-08-27', '01', '03', 4),
(13, '2018-01-01', '2018-08-09', '01', '03', 1),
(14, '2018-01-02', '2018-12-18', '01', '01', 1),
(17, '2018-01-16', '2018-01-26', '03', 'null', 1),
(18, '2018-01-09', '2018-08-26', '02', '03', 4),
(19, '2018-01-26', '2018-08-31', '02', '04', 4);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `s_no` int(11) NOT NULL,
  `eno` char(11) DEFAULT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`s_no`, `eno`, `pass`) VALUES
(6, '02301032014', 'addc85187b52679c5e6918652557265596e0a322'),
(7, '03201032014', 'efc2735e188710d8e1788b9fda5d87908306b0b6'),
(8, '00401012015', 'd7daeb56a368daf9933dfe74a6c81ca7be5b2f00');

-- --------------------------------------------------------

--
-- Table structure for table `logtable`
--

CREATE TABLE `logtable` (
  `id` int(11) NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `CONTENT` varchar(100) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  `msg` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logtable`
--

INSERT INTO `logtable` (`id`, `user`, `CONTENT`, `update_date`, `update_time`, `msg`) VALUES
(1, 'Ashima', 'Rights added for New Coordinator', '2017-09-20', '10:19:09', 'Rights added for Avinash (student coord) of ECE dept'),
(2, 'Avinash', 'Rights added for New Coordinator', '2017-09-20', '23:56:25', 'Rights added for Shreya (assistant proff) of CSE dept'),
(3, 'Avinash', 'Mail Sent to 03201032014', '2017-09-22', '23:54:15', 'Subject: important\nContent: \r\nmeeting tomorrow at 11 AM in seminar hall'),
(4, 'null', 'Mail Sent to avinash', '2017-10-02', '17:57:27', 'Subject: hi\nContent: abcd'),
(5, 'Avinash', 'Notification Board Updated', '2017-10-09', '11:06:16', 'New Notifcation Sent with \n Subject: hello\n Content: hi hi '),
(6, 'Avinash', 'Notification Board Updated', '2017-10-09', '16:41:35', 'New Notifcation Sent with \n Subject: hgjhgjgj\n Content: jhgjgjgjhgjgh'),
(7, 'Avinash', 'Mail Sent to ashima.wadhwa.1996@gmail.com', '2017-10-12', '22:58:21', 'Subject: hi\nContent: hello'),
(8, 'Avinash', 'Mail Sent to ashima.wadhwa.1996@gmail.com', '2017-10-13', '19:43:22', 'Subject: Enter Subject Line\nContent: hi'),
(9, 'Avinash', 'Mail Sent to ashima.wadhwa.1996@gmail.com', '2017-10-13', '19:43:44', 'Subject: Enter Subject Line\nContent: hkjhj'),
(10, 'Avinash', 'Mail Sent to ashima.wadhwa.1996@gmail.com', '2017-10-13', '19:45:14', 'Subject: Enter Subject Line\nContent: hkjhj'),
(11, 'Avinash', 'Mail Sent to ashima.wadhwa.1996@gmail.com', '2017-10-13', '19:45:25', 'Subject: Enter Subject Line\nContent: hkjhj'),
(12, 'Avinash', 'Rights added for New Coordinator', '2017-10-13', '20:31:03', 'Rights added for admin (TPO) of IT dept'),
(13, 'Avinash', 'Rights Updated', '2017-10-13', '20:31:10', 'Rights Deleted for Shreya (assistant proff) of CSE dept'),
(14, 'Avinash', 'Deadline Set', '2017-10-13', '20:31:47', 'Deadline set for BTech IT 1 year from 2017-10-26 to 2017-10-29'),
(15, 'Avinash', 'Deadline Deleted', '2017-10-13', '20:32:10', 'Deadline deleted for BTech IT 1 year from 2017-10-26 to 2017-10-29'),
(16, 'Avinash', 'Notification Board Updated', '2017-10-13', '20:53:09', 'New Notifcation Sent with \n Subject: hgj\n Content: hgjgjgjgjhgjg'),
(17, 'Avinash', 'Notification Board Updated', '2017-10-13', '20:54:37', 'New Notifcation Sent with \n Subject: important\n Content: hella'),
(18, 'Avinash', 'Notification Board Updated', '2017-10-29', '20:24:50', 'New Notifcation Sent with \n Subject: hi\n Content: bye bye'),
(19, 'Avinash', 'Notification Board Updated', '2017-10-30', '11:09:18', 'New Notifcation Sent with \n Subject: hello\n Content: this is me'),
(20, 'Avinash', 'Rights added for New Coordinator', '2017-10-30', '11:18:58', 'Rights added for Navya Singh (student coordinator) of IT dept'),
(21, 'Avinash', 'Rights Edited', '2017-10-30', '11:19:13', 'Rights Edited for Navya Singh (student coordinator) of IT dept'),
(22, 'Avinash', 'Notification Board Updated', '2017-11-01', '12:13:17', 'New Notifcation Sent with \n Subject: amazon\n Content: visit 0n 2 nov.'),
(23, 'avinash', 'Rights added for New Coordinator', '2017-11-20', '21:51:05', 'Rights added for admin@gmail.com (TPO) of IT dept'),
(24, 'avinash', 'Rights Edited', '2017-11-20', '22:01:16', 'Rights Edited for admin1@gmail.com (TPO) of IT dept'),
(25, 'avinash', 'Rights Edited', '2017-11-20', '22:04:03', 'Rights Edited for admin1@gmail.com (TPO) of IT dept'),
(26, 'avinash', 'Rights Edited', '2017-11-20', '22:04:45', 'Rights Edited for admin1@gmail.com (TPO) of IT dept'),
(27, 'admin1@gmail.com', 'Company Added ', '2017-11-21', '00:13:09', 'Offer set for gfhgfhgfh 2018 876868 and gfhfhgfhf'),
(28, 'admin1@gmail.com', 'Deadline Set', '2017-11-28', '00:24:52', 'Deadline set for BTech IT 1 year from 2017-11-29 to 2017-11-30'),
(29, 'admin1@gmail.com', 'Rights added for New Coordinator', '2017-11-29', '16:01:10', 'Rights added for tnp@gmail.com (TPO) of IT dept'),
(30, 'tnp@gmail.com', 'Company Added ', '2017-11-29', '16:51:08', 'Offer set for Amazon 2018 2250000 and Software Engineer'),
(31, 'admin1@gmail.com', 'Branch Added', '2018-01-11', '20:45:47', 'Branch added for year 2018  Branch_Name : MAE, Branch_Code : 04  For Programme Code : 02, Programme_Name : Mtech'),
(32, 'admin1@gmail.com', 'Database created', '2018-02-19', '19:35:32', 'Database created for year 2018 as db_2018'),
(33, 'admin1@gmail.com', 'Database deleted', '2018-02-21', '15:20:41', 'Database deleted for year 2018 (db_2018) '),
(34, 'admin1@gmail.com', 'Database created', '2018-02-21', '15:20:58', 'Database created for year 2018 as db_2018');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `info` varchar(2000) NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filedata` longblob,
  `postdate` date NOT NULL,
  `posttime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `subject`, `info`, `filename`, `filedata`, `postdate`, `posttime`) VALUES
(1, 'hi', 'bye bye', NULL, NULL, '2017-10-29', '20:24:49'),
(2, 'amazon', 'visit 0n 2 nov.', NULL, NULL, '2017-11-01', '12:13:17'),
(3, 'hgj', 'hgjgjgjgjhgjg', NULL, NULL, '2017-10-13', '20:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `othercalendar`
--

CREATE TABLE `othercalendar` (
  `ocalID` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `month_` int(11) NOT NULL,
  `year_` int(11) NOT NULL,
  `eventtype` varchar(400) DEFAULT NULL,
  `eventInfo` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stu_mail`
--

CREATE TABLE `stu_mail` (
  `id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `postdate` date DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `enrollmentno` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_rights`
--
ALTER TABLE `admin_rights`
  ADD KEY `user_id_constraint` (`user_id`);

--
-- Indexes for table `deadline`
--
ALTER TABLE `deadline`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`s_no`),
  ADD UNIQUE KEY `eno` (`eno`);

--
-- Indexes for table `logtable`
--
ALTER TABLE `logtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stu_mail`
--
ALTER TABLE `stu_mail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `deadline`
--
ALTER TABLE `deadline`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `logtable`
--
ALTER TABLE `logtable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_rights`
--
ALTER TABLE `admin_rights`
  ADD CONSTRAINT `user_id_constraint` FOREIGN KEY (`user_id`) REFERENCES `admins` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
