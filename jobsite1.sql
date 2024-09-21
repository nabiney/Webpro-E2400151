-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2024 at 11:43 AM
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
-- Database: `jobsite1`
--

-- --------------------------------------------------------

--
-- Table structure for table `employers`
--

CREATE TABLE `employers` (
  `employer_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `company_location` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`employer_id`, `company_name`, `email`, `contact_number`, `company_location`, `password`) VALUES
(1, 'ABC Pvt Ltd', 'abcorporation@gmail.com', '97123456778', 'Kathmandu', 'abc123'),
(2, 'MNOrg', 'mn123@gmail.com', '9712464637', 'Kathmandu', 'mno123'),
(3, 'ZX Corporation', 'zx987@gmail.com', '9883478347', 'Pokhara', 'zx4321'),
(4, 'xyz Hub', 'xyz@123', '9812345678', 'Kathmandu', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `job_postings`
--

CREATE TABLE `job_postings` (
  `job_id` int(11) NOT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `job_title` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `job_location` varchar(255) NOT NULL,
  `qualifications` text NOT NULL,
  `experience_requirements` varchar(255) NOT NULL,
  `key_skills` text NOT NULL,
  `salary_range` varchar(100) NOT NULL,
  `job_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_seekers`
--

CREATE TABLE `job_seekers` (
  `jobseeker_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_seekers`
--

INSERT INTO `job_seekers` (`jobseeker_id`, `name`, `email`, `mobile`, `username`, `password`) VALUES
(1, 'nabin', 'nabin.tamang.2024@midvalley.edu.np', '9869218898', 'nabin', 'nabiney'),
(2, 'bishal', 'bishal12@gmail.com', '9812345678', 'bishalll', 'bishal'),
(3, 'roman', 'roman34@gmail.com', '9887654321', 'romannn', 'romann'),
(4, 'sujata', 'sujata24@gmail.com', '9812873465', 'suzu', 'sujata'),
(6, 'abiral', 'aaa@gmail.com', '9876543113', 'aaa12', '123456789'),
(7, 'swostika', 'swostika12@gmail.com', '9863271837', 'swostiii', 'swostiii'),
(8, 'sampada', 'samm42@gmail.com', '9876543d215', 'sammii1', 'samm12'),
(9, 'anurodh', 'anurodh@gmail.com', '9841001100', 'anuuuu', 'anu123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`employer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `employer_id` (`employer_id`);

--
-- Indexes for table `job_seekers`
--
ALTER TABLE `job_seekers`
  ADD PRIMARY KEY (`jobseeker_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employers`
--
ALTER TABLE `employers`
  MODIFY `employer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE `job_postings`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_seekers`
--
ALTER TABLE `job_seekers`
  MODIFY `jobseeker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD CONSTRAINT `job_postings_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`employer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
