-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2026 at 04:10 PM
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
-- Database: `infomensch`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `studentid` varchar(20) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `program` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `studentid`, `fullname`, `program`, `email`, `hobbies`, `bio`) VALUES
(7, '20230001', 'Aisyah Rahman', 'CS230', 'aisyah@example.com', 'Badminton, Reading', 'A passionate computer science student who loves building web apps.'),
(8, '20230002', 'Daniel Lee', 'CS240', 'daniel@example.com', 'Gaming, Coding', 'Enjoys solving algorithm problems and playing competitive games.'),
(9, '20230003', 'Siti Nurhaliza', 'IT220', 'siti@example.com', 'Photography, Travel', 'Loves capturing moments and exploring new places around the world.'),
(10, '20230004', 'Muhammad Faris', 'SE210', 'faris@example.com', 'Football, Music', 'Software engineering student who enjoys teamwork and building apps.'),
(11, '20230005', 'Nurul Hidayah', 'CS250', 'nurul@example.com', 'Drawing, Movies', 'Creative student who loves UI design and watching tech documentaries.'),
(13, '939293923', 'HAPIZ PADU', 'CS230', 'hapiz@example.com', 'ROBLOX', 'roblox is life');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `studentid` (`studentid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
