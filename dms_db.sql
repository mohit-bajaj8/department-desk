-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2025 at 02:08 PM
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
  `pass` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`login`, `pass`, `name`) VALUES
(123, 'moh', 'Test1');

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
  `pass` varchar(30) DEFAULT NULL,
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
(23114, 'q', 'q', 'mohit@gm.com', 9991991919, '2020-02-12', 'mca', '2020', '2023'),
(23115, 'test', 'test', 'test@gmail.com', 9876543210, '2006-06-09', 'msc', '2020', '2023');

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
  `pass` varchar(30) DEFAULT NULL,
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
(1, 'qwe', 'Mohit', 'mohit@gm.com', 9991991919, '2001-02-12', 'professor', '2020-11-01'),
(125, 'q', 'q', 'mohit@gm.com', 9991991919, '2025-06-10', 'a', '2025-06-20');

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
