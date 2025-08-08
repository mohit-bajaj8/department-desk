-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 12:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `login` int(11) NOT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`login`, `pass`, `name`) VALUES
(120, 'scrypt:32768:8:1$i9wfhzZ23774Q0iW$aa684036a561b41cec243b79414d4f6ff87f06ba1e153b9a8a8505a0a4b867ab1b743a8bfe3c9be12b19dd66d5889d14f361f5c2e75536888d35249fba63b630', 'Mohit'),
(130, 'scrypt:32768:8:1$shXLC5LF1EcuOaXm$f233fc13605fa0d0154e6b51160531a560dcc5ff6c12b3a356006476fdf95078900d45f30dbaa0672a916d37792ab798b74e139971415fabc71a0d65d7d6391a', 'Mohit');

-- --------------------------------------------------------

--
-- Table structure for table `annoucment`
--

CREATE TABLE `annoucment` (
  `id` int(11) NOT NULL,
  `filename` varchar(300) DEFAULT NULL,
  `filepath` varchar(100) DEFAULT NULL,
  `filetitle` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `annoucment`
--

INSERT INTO `annoucment` (`id`, `filename`, `filepath`, `filetitle`) VALUES
(1, 'Time_table (1).pdf', 'uploads/annoucments\\Time_table (1).pdf', 'New interface notification issued by mohit bajaj'),
(2, 'Time_table (1).pdf', 'uploads/annoucments\\Time_table (1).pdf', 'Annoucement regarding new event organised by department'),
(3, 'Handwritten notes Introduction to Programming Languages (1).pdf', 'uploads/annoucments\\Handwritten notes Introduction to Programming Languages (1).pdf', 'Annoucement regarding mid term sessional test');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `name`, `email`, `message`) VALUES
(1, 'mohit', 'mohit@gm.com', 'Test message.'),
(2, 'jogi', 'jigi@fgmail.com', 'Alt +a'),
(3, 'Mohit', 'Mohit@gmail.com', 'This is final test message.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `roll_no` int(11) NOT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `dob` date NOT NULL,
  `course` varchar(30) DEFAULT NULL,
  `startyear` year(4) DEFAULT NULL,
  `endyear` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`roll_no`, `pass`, `name`, `email`, `mobile_no`, `dob`, `course`, `startyear`, `endyear`) VALUES
(23116, 'scrypt:32768:8:1$VX84BpShyuESU', 'Mohit', 'moh@gmailc.o', 99, '2000-09-12', 'mca', '2023', '2025'),
(23117, 'scrypt:32768:8:1$sVRrUdSVkbfHIT3d$b7596a05a673c6525f2efc3a9a797eb01f95bdd728cd4234b61f9c7b2d5fa3376c9151017085746eec8a199de5bce0e09878e21d61b65bf8ad141485da63b7b8', 'Mohit', 'moh@gmailc.o', 99, '2025-08-16', 'mca', '2023', '2025');

-- --------------------------------------------------------

--
-- Table structure for table `student_messages`
--

CREATE TABLE `student_messages` (
  `id` int(11) NOT NULL,
  `roll_no` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_messages`
--

INSERT INTO `student_messages` (`id`, `roll_no`, `subject`, `message`) VALUES
(1, 23114, 'test 1', 'This is test message.'),
(2, 23114, 'test 2', 'This is test message 2.');

-- --------------------------------------------------------

--
-- Table structure for table `studymat`
--

CREATE TABLE `studymat` (
  `id` int(11) NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `filepath` varchar(120) DEFAULT NULL,
  `filetitle` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studymat`
--

INSERT INTO `studymat` (`id`, `filename`, `filepath`, `filetitle`) VALUES
(1, 'Handwritten notes Introduction to Programming Languages (1).pdf', 'uploads/studymaterial\\Handwritten notes Introduction to Programming Languages (1).pdf', 'Introduction to C# programming by mohit'),
(2, '3. ML APPLICATION AREAS unit-1 (2).pdf', 'uploads/studymaterial\\3. ML APPLICATION AREAS unit-1 (2).pdf', 'Introduction to java programming by mohit'),
(3, 'Handwritten notes Introduction to Programming Languages (1).pdf', 'uploads/studymaterial\\Handwritten notes Introduction to Programming Languages (1).pdf', 'Introduction to python programming by teacher 1'),
(4, 'frontpage part1.docx', 'uploads/studymaterial\\frontpage part1.docx', 'Notes of python prog.');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `staff_id` int(11) NOT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `dob` date NOT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `doj` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`staff_id`, `pass`, `name`, `email`, `mobile_no`, `dob`, `designation`, `doj`) VALUES
(130, 'scrypt:32768:8:1$shXLC5LF1EcuOaXm$f233fc13605fa0d0154e6b51160531a560dcc5ff6c12b3a356006476fdf95078900d45f30dbaa0672a916d37792ab798b74e139971415fabc71a0d65d7d6391a', 'Mohit', 'moh@gmailc.o', 9898967208, '1989-10-10', 'Asst. Professor', '2001-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filetitle` varchar(300) NOT NULL,
  `filepath` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `filename`, `filetitle`, `filepath`) VALUES
(1, 'Time_table.pdf', 'Time Table', 'uploads/timetable\\Time_table.pdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`login`);

--
-- Indexes for table `annoucment`
--
ALTER TABLE `annoucment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`roll_no`);

--
-- Indexes for table `student_messages`
--
ALTER TABLE `student_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `studymat`
--
ALTER TABLE `studymat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annoucment`
--
ALTER TABLE `annoucment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_messages`
--
ALTER TABLE `student_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `studymat`
--
ALTER TABLE `studymat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
