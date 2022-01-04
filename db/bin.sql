-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 01:11 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bin`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `id` int(11) NOT NULL,
  `house_number` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `h_owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `house_owner`
--

CREATE TABLE `house_owner` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house_owner`
--

INSERT INTO `house_owner` (`id`, `name`, `phone`, `email`, `password`) VALUES
(1, 'SHABANI', 'O718800422', 's@gmail.com', '12345'),
(2, 'SAMUEL MALWA', '0745681617', 'm@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `recipient` varchar(50) NOT NULL DEFAULT '',
  `content` varchar(10000) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `sender`, `recipient`, `content`, `status`, `created_at`) VALUES
(1, 1, '0718800422', 'Hello uchafu umejaaa', 'Sent', '2021-07-11 03:28:32'),
(2, 2, '0745681617', 'New services will be available soon', 'Sent', '2021-07-11 03:28:34'),
(3, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 03:35:13'),
(84, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:01:25'),
(85, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:01:36'),
(86, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:07:50'),
(87, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:07:52'),
(88, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:08:27'),
(89, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:08:32'),
(90, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:10:47'),
(91, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:10:51'),
(92, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:10:57'),
(93, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:11:01'),
(94, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:11:35'),
(95, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:11:38'),
(96, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:11:49'),
(114, 1, '0718800422', 'Waste is fully Come to collect them', 'Sent', '2021-07-11 04:18:02'),
(115, 1, '0745681617', 'classic sheby', 'Sent', '2021-07-11 04:43:35'),
(116, 1, '0718800422', 'sa itakuaje???????', 'Sent', '2021-07-11 04:45:02'),
(117, 1, '0745681617', 'Garbade level is 52%', 'Sent', '2021-07-11 04:59:35'),
(118, 1, '0745681617', 'Garbade level is 52%', 'Sent', '2021-07-11 04:59:36'),
(119, 1, '0745681617', 'Garbage level is 100%', 'Sent', '2021-07-11 05:03:22'),
(120, 1, '0745681617', 'Garbage level is 69%', 'Sent', '2021-07-11 05:15:24'),
(121, 1, '0745681617', 'Garbage level is 69%', 'Sent', '2021-07-11 05:17:55'),
(122, 1, '0745681617', 'Garbage level is 69%', 'Sent', '2021-07-11 05:20:34'),
(123, 1, '0745681617', 'Garbage level is 64%', 'Sent', '2021-07-11 16:12:18');

-- --------------------------------------------------------

--
-- Table structure for table `waste_level`
--

CREATE TABLE `waste_level` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `waste_level`
--

INSERT INTO `waste_level` (`id`, `level`) VALUES
(1, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `h_owner_id` (`h_owner_id`);

--
-- Indexes for table `house_owner`
--
ALTER TABLE `house_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`);

--
-- Indexes for table `waste_level`
--
ALTER TABLE `waste_level`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_owner`
--
ALTER TABLE `house_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `waste_level`
--
ALTER TABLE `waste_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `house`
--
ALTER TABLE `house`
  ADD CONSTRAINT `house_ibfk_1` FOREIGN KEY (`h_owner_id`) REFERENCES `house_owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `house_owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
