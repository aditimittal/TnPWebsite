-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 22, 2018 at 04:53 PM
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
-- Database: `db_2017`
--

-- --------------------------------------------------------

--
-- Table structure for table `backs`
--

CREATE TABLE `backs` (
  `Eno` varchar(20) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `program_code` varchar(20) NOT NULL,
  `branch_code` varchar(20) NOT NULL,
  `sem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backs`
--

INSERT INTO `backs` (`Eno`, `subject_code`, `program_code`, `branch_code`, `sem`) VALUES
('00701032015', 'BCS-304', '01', '03', 6),
('00701032015', 'BAS-104', '01', '03', 2),
('00701032015', 'BAS-106', '01', '03', 2),
('00701032015', 'BIT-303', '01', '03', 5);

-- --------------------------------------------------------

--
-- Table structure for table `branch_codes`
--

CREATE TABLE `branch_codes` (
  `Branch_Name` varchar(40) NOT NULL,
  `Branch_Code` varchar(40) NOT NULL,
  `Programme_Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_codes`
--

INSERT INTO `branch_codes` (`Branch_Name`, `Branch_Code`, `Programme_Name`) VALUES
('IT', '03', 'BTech'),
('CSE', '02', 'MTech'),
('Mechanical', '01', 'MCA'),
('ECE', '04', 'BTech');

-- --------------------------------------------------------

--
-- Table structure for table `company_branch`
--

CREATE TABLE `company_branch` (
  `company_id` int(11) NOT NULL,
  `department` varchar(30) DEFAULT NULL,
  `course` varchar(30) NOT NULL,
  `batch` varchar(4) NOT NULL,
  `elig_tenth` float NOT NULL,
  `elig_twelfth` float NOT NULL,
  `elig_grad` float NOT NULL,
  `elig_pgrad` float NOT NULL,
  `active_backs` int(11) NOT NULL,
  `dead_backs` int(11) NOT NULL,
  `package_limit` double NOT NULL,
  `offers_count` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_branch`
--

INSERT INTO `company_branch` (`company_id`, `department`, `course`, `batch`, `elig_tenth`, `elig_twelfth`, `elig_grad`, `elig_pgrad`, `active_backs`, `dead_backs`, `package_limit`, `offers_count`) VALUES
(32, '01', '01', '', 0, 0, 0, 0, 0, 0, 0, 0),
(32, '03', '01', '', 0, 0, 0, 0, 0, 0, 0, 0),
(32, NULL, '03', '', 0, 0, 0, 0, 0, 0, 0, 0),
(33, '03', '01', '2014', 70, 70, 70, 0, 5, 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `company_type` varchar(50) NOT NULL,
  `type` varchar(80) NOT NULL,
  `company_description` text NOT NULL,
  `industry` varchar(80) NOT NULL,
  `job_location` varchar(80) NOT NULL,
  `profile_type` varchar(50) NOT NULL,
  `profile` varchar(80) NOT NULL,
  `ctc_last_year` int(11) DEFAULT NULL,
  `ctc_current_year` int(11) DEFAULT NULL,
  `ctc_breakup` text NOT NULL,
  `student_poc` varchar(100) DEFAULT NULL,
  `company_poc` varchar(100) DEFAULT NULL,
  `contact_no` varchar(11) DEFAULT NULL,
  `email_addr` varchar(100) DEFAULT NULL,
  `interview_location` varchar(80) NOT NULL,
  `online_test_date` date DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `day_visiting` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`company_id`, `company_name`, `company_type`, `type`, `company_description`, `industry`, `job_location`, `profile_type`, `profile`, `ctc_last_year`, `ctc_current_year`, `ctc_breakup`, `student_poc`, `company_poc`, `contact_no`, `email_addr`, `interview_location`, `online_test_date`, `visit_date`, `day_visiting`) VALUES
(32, 'Morgan Stanley', 'Regular Recruiter', 'Internship', 'Financial company', 'Cloud', 'Banglore/Pune', 'Technical', 'software developer', 0, 4000000, 'Basic : 1500000 RSU : 2000000 Joining bonus : 500000', 'navya', 'Amar', '9456578978', 'amar@mg_stanley.com', 'College Campus', '0000-00-00', '0000-00-00', NULL),
(33, 'amazon', 'Regular Recruiter', 'FTE', '', 'sales', 'gurgaon', 'Technical', 'software developer', 2400000, 2800000, '', 'navya', 'mr.job', '1234567890', 'asdfg@gmail.com', 'College Campus', '0000-00-00', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `Eno_num` varchar(20) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `marks` int(100) NOT NULL,
  `semester` int(15) NOT NULL,
  `programCode` varchar(50) NOT NULL,
  `branchCode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`Eno_num`, `subject_name`, `subject_code`, `marks`, `semester`, `programCode`, `branchCode`) VALUES
('00701032015', 'evs', 'BAS-106', 8, 2, '01', '03'),
('00701032015', 'physics', 'BAS-104', 8, 2, '01', '03'),
('00701032015', 'RET', 'BIT 305', 80, 5, '01', '03'),
('00701032015', 'CGM', 'BIT-303', 8, 5, '01', '03'),
('00701032015', 'DWDM', 'BIT-309', 90, 5, '01', '03'),
('00701032015', 'Theory of computation', 'BCS-301', 60, 5, '01', '03'),
('00701032015', 'CD', 'BCS-304', 0, 6, '01', '03'),
('00701032015', 'NP', 'BCS-306', 90, 6, '01', '03');

-- --------------------------------------------------------

--
-- Table structure for table `personal_details`
--

CREATE TABLE `personal_details` (
  `Enrollment_Number` varchar(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Aadhar_Number` bigint(20) DEFAULT NULL,
  `Category` varchar(10) NOT NULL,
  `Temp_Address` varchar(100) DEFAULT NULL,
  `Permanent_Address` varchar(100) NOT NULL,
  `Alt_Email_Id` varchar(100) DEFAULT NULL,
  `Father_Name` varchar(50) NOT NULL,
  `Father_Occupation` varchar(50) DEFAULT NULL,
  `Father_Office_Address` varchar(100) DEFAULT NULL,
  `Father_Contact_Number` varchar(20) DEFAULT NULL,
  `Mother_Name` varchar(50) NOT NULL,
  `Mother_Occupation` varchar(50) DEFAULT NULL,
  `Mother_Office_Address` varchar(100) DEFAULT NULL,
  `Mother_Contact_Number` varchar(20) DEFAULT NULL,
  `Class_X_School` varchar(100) NOT NULL,
  `Class_X_Passing_Year` int(11) NOT NULL,
  `Class_XII_or_Diploma` varchar(10) NOT NULL,
  `Class_XII_Board` varchar(4) DEFAULT NULL,
  `Class_XII_School` varchar(100) DEFAULT NULL,
  `Programme_Code` varchar(2) NOT NULL,
  `Branch_Code` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placementrecord`
--

CREATE TABLE `placementrecord` (
  `Enrollment_number` varchar(11) NOT NULL,
  `company_id` int(6) NOT NULL,
  `profile_offered` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `year` varchar(5) NOT NULL,
  `Branch_Code` varchar(3) NOT NULL,
  `Programme_Code` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `placementrecord`
--

INSERT INTO `placementrecord` (`Enrollment_number`, `company_id`, `profile_offered`, `type`, `year`, `Branch_Code`, `Programme_Code`) VALUES
('02201032015', 33, 'software developer', 'Internship', '2015', '03', '01');

-- --------------------------------------------------------

--
-- Table structure for table `postgraduatetable`
--

CREATE TABLE `postgraduatetable` (
  `Enrollment_Number` varchar(11) NOT NULL,
  `Programme_Code` varchar(2) NOT NULL,
  `Branch_Code` varchar(2) NOT NULL,
  `Department` varchar(30) NOT NULL,
  `Course` varchar(30) NOT NULL,
  `Institute_Name` varchar(6) NOT NULL DEFAULT 'IGDTUW',
  `Gender` varchar(6) NOT NULL DEFAULT 'Female',
  `DOB` date NOT NULL,
  `Contact_Number` varchar(20) DEFAULT NULL,
  `Alt_Contact_Number` varchar(20) DEFAULT NULL,
  `EmailId` varchar(100) NOT NULL,
  `Class_X_Board` varchar(4) NOT NULL,
  `Class_X_Percentage` double DEFAULT NULL,
  `Class_XII_or_Diploma_Percentage` double DEFAULT NULL,
  `Class_XII_or_Diploma_Passing_Year` int(11) NOT NULL,
  `GraduationUniversity` varchar(50) NOT NULL,
  `GraduationCollege` varchar(50) NOT NULL,
  `Graduation_Stream` varchar(50) NOT NULL,
  `Graduation_Percentage` double DEFAULT NULL,
  `Graduation_Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `programme_codes`
--

CREATE TABLE `programme_codes` (
  `Programme_Name` varchar(40) NOT NULL,
  `Programme_Code` varchar(40) NOT NULL,
  `Programme_Type` varchar(40) NOT NULL,
  `Programme_Duration` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programme_codes`
--

INSERT INTO `programme_codes` (`Programme_Name`, `Programme_Code`, `Programme_Type`, `Programme_Duration`) VALUES
('BArch', '03', 'UNDERGRADUATE', 3),
('BCA', '04', 'UNDERGRADUATE', 3),
('BTech', '01', 'UNDERGRADUATE', 4),
('MCA', '05', 'POSTGRADUATE', 3),
('MTech', '02', 'POSTGRADUATE', 2),
('PHd', '06', 'POSTGRADUATE', 2);

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

-- --------------------------------------------------------

--
-- Table structure for table `student_offers`
--

CREATE TABLE `student_offers` (
  `Eno` varchar(15) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `Accept` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `Subject_code` varchar(20) NOT NULL,
  `Subject_name` varchar(50) NOT NULL,
  `Semester` int(10) NOT NULL,
  `credits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`Subject_code`, `Subject_name`, `Semester`, `credits`) VALUES
('BAS-102', 'Maths', 2, 4),
('BAS-104', 'physics', 2, 4),
('BAS-106', 'EVS', 2, 4),
('BCS-301', 'Theory of computation', 5, 4),
('BCS-304', 'CD', 6, 4),
('BCS-306', 'NP', 6, 4),
('BIT 305', 'RET', 5, 4),
('BIT-302', 'WMT', 6, 4),
('BIT-303', 'CGM', 5, 4),
('BIT-309', 'DWDM', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `subject_codes`
--

CREATE TABLE `subject_codes` (
  `Subject_code` varchar(20) NOT NULL,
  `branch_code` varchar(20) NOT NULL,
  `programme_code` varchar(20) NOT NULL,
  `sem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_codes`
--

INSERT INTO `subject_codes` (`Subject_code`, `branch_code`, `programme_code`, `sem`) VALUES
('BCS-301', '03', '01', 5),
('BCS-304', '03', '01', 6),
('BCS-306', '03', '01', 6),
('BAS-102', '03', '01', 2),
('BAS-104', '03', '01', 2),
('BAS-106', '03', '01', 2),
('BIT 305', '03', '01', 5),
('BIT-303', '03', '01', 5),
('BIT-309', '03', '01', 5);

-- --------------------------------------------------------

--
-- Table structure for table `undergraduatetable`
--

CREATE TABLE `undergraduatetable` (
  `Enrollment_Number` varchar(11) NOT NULL,
  `Programme_Code` varchar(2) NOT NULL,
  `Branch_Code` varchar(2) NOT NULL,
  `Department` varchar(30) NOT NULL,
  `Course` varchar(30) NOT NULL,
  `Institute_Name` varchar(6) NOT NULL DEFAULT 'IGDTUW',
  `Gender` varchar(6) NOT NULL DEFAULT 'Female',
  `DOB` date NOT NULL,
  `Contact_Number` varchar(20) DEFAULT NULL,
  `Alt_Contact_Number` varchar(20) DEFAULT NULL,
  `EmailId` varchar(100) NOT NULL,
  `Class_X_Board` varchar(4) NOT NULL,
  `Class_X_Percentage` double DEFAULT NULL,
  `Class_XII_or_Diploma_Percentage` double DEFAULT NULL,
  `Class_XII_or_Diploma_Passing_Year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `undergraduatetable`
--

INSERT INTO `undergraduatetable` (`Enrollment_Number`, `Programme_Code`, `Branch_Code`, `Department`, `Course`, `Institute_Name`, `Gender`, `DOB`, `Contact_Number`, `Alt_Contact_Number`, `EmailId`, `Class_X_Board`, `Class_X_Percentage`, `Class_XII_or_Diploma_Percentage`, `Class_XII_or_Diploma_Passing_Year`) VALUES
('02101032018', '01', '03', 'IT', 'BTech', 'IGDTUW', 'Female', '2001-03-15', '2355555555', '6678888888', 'ghjl@gmail.com', '2016', 93, 92.4, 2018);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backs`
--
ALTER TABLE `backs`
  ADD KEY `backs` (`subject_code`);

--
-- Indexes for table `branch_codes`
--
ALTER TABLE `branch_codes`
  ADD KEY `Programme_Name` (`Programme_Name`);

--
-- Indexes for table `company_branch`
--
ALTER TABLE `company_branch`
  ADD KEY `company_id_constraint` (`company_id`),
  ADD KEY `company_id_constraint1` (`company_id`);

--
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD KEY `subject_code` (`subject_code`),
  ADD KEY `Eno_num` (`Eno_num`);

--
-- Indexes for table `personal_details`
--
ALTER TABLE `personal_details`
  ADD PRIMARY KEY (`Enrollment_Number`);

--
-- Indexes for table `placementrecord`
--
ALTER TABLE `placementrecord`
  ADD UNIQUE KEY `mykey` (`company_id`,`type`,`Enrollment_number`,`profile_offered`);

--
-- Indexes for table `postgraduatetable`
--
ALTER TABLE `postgraduatetable`
  ADD PRIMARY KEY (`Enrollment_Number`);

--
-- Indexes for table `programme_codes`
--
ALTER TABLE `programme_codes`
  ADD PRIMARY KEY (`Programme_Name`);

--
-- Indexes for table `student_offers`
--
ALTER TABLE `student_offers`
  ADD KEY `Eno` (`Eno`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`Subject_code`);

--
-- Indexes for table `subject_codes`
--
ALTER TABLE `subject_codes`
  ADD KEY `FK` (`Subject_code`);

--
-- Indexes for table `undergraduatetable`
--
ALTER TABLE `undergraduatetable`
  ADD PRIMARY KEY (`Enrollment_Number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `backs`
--
ALTER TABLE `backs`
  ADD CONSTRAINT `backs` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`Subject_code`);

--
-- Constraints for table `branch_codes`
--
ALTER TABLE `branch_codes`
  ADD CONSTRAINT `branch_codes_ibfk_1` FOREIGN KEY (`Programme_Name`) REFERENCES `programme_codes` (`Programme_Name`) ON DELETE CASCADE;

--
-- Constraints for table `company_branch`
--
ALTER TABLE `company_branch`
  ADD CONSTRAINT `company_id_constraint` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`subject_code`) REFERENCES `subjects` (`Subject_code`);

--
-- Constraints for table `student_offers`
--
ALTER TABLE `student_offers`
  ADD CONSTRAINT `student_offers_ibfk_1` FOREIGN KEY (`Eno`) REFERENCES `personal_details` (`Enrollment_Number`);

--
-- Constraints for table `subject_codes`
--
ALTER TABLE `subject_codes`
  ADD CONSTRAINT `FK` FOREIGN KEY (`Subject_code`) REFERENCES `subjects` (`Subject_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
