-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2020 at 04:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `model` varchar(20) NOT NULL,
  `manufacturer` varchar(20) NOT NULL,
  `year` int(4) NOT NULL,
  `plate_number` varchar(10) NOT NULL,
  `RentPerDay` double(18,2) NOT NULL,
  `Capacity` int(2) NOT NULL,
  `image_id` int(11) NOT NULL,
  `car_image_path` varchar(255) NOT NULL,
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`Id`, `name`, `code_name`, `model`, `manufacturer`, `year`, `plate_number`, `RentPerDay`, `Capacity`, `image_id`, `car_image_path`, `Is_Active`) VALUES
(5, 'Toyota Innova', 'Radiant Innova', 'Innova', 'Toyota', 2019, 'MIS-2020', 3500.00, 6, 4, 'no-image.jpg', b'1'),
(9, '', 'Makoy Vios', 'Vios', 'Toyota', 2000, 'LAX-2020', 2500.00, 4, 3, 'no-image.jpg', b'1'),
(13, '', 'Radiant Vios', 'Vios', 'Toyota', 2000, 'MBS-2020', 2500.00, 4, 3, 'no-image.jpg', b'1'),
(40, 'Toyota Grandia', 'Toyota Grandia Radiant', 'Grandia', 'Toyota', 1990, 'TBS-7634', 1232131.00, 4, 0, '1586654715-Capture.PNG', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `clientbookings`
--

CREATE TABLE `clientbookings` (
  `Id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `carId` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `pick_up_time` time NOT NULL,
  `number_of_days` int(2) NOT NULL,
  `end_date` date NOT NULL,
  `return_time` time NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL,
  `statusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientbookings`
--

INSERT INTO `clientbookings` (`Id`, `clientId`, `carId`, `start_date`, `pick_up_time`, `number_of_days`, `end_date`, `return_time`, `created_date`, `updated_date`, `statusId`) VALUES
(5, 1, 5, '2020-01-29', '00:00:00', 0, '2020-01-31', '00:00:00', '2020-01-26 19:56:08', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `Id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `government_id_1_path` varchar(255) NOT NULL,
  `government_id_2_path` varchar(255) NOT NULL,
  `attachment_1_path` varchar(255) NOT NULL,
  `attachment_2_path` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` date NOT NULL,
  `Is_Active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`Id`, `name`, `email_address`, `contact_number`, `address`, `government_id_1_path`, `government_id_2_path`, `attachment_1_path`, `attachment_2_path`, `created_date`, `updated_date`, `Is_Active`) VALUES
(97, 'Jeffry Manhulad', 'jcmanhulad@up.edu.ph', '09268406884', 'Musuan, Dologon, Maramag, Bukidnon', '', '', '', '', '2020-04-13 10:00:47', '0000-00-00', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `clientsphotos`
--

CREATE TABLE `clientsphotos` (
  `Id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clientsphotos`
--

INSERT INTO `clientsphotos` (`Id`, `client_id`, `file_name`, `created_date`, `Is_Active`) VALUES
(73, 97, '1586743247-Capture.PNG', '2020-04-13 10:00:47', b'1'),
(74, 97, '1586743247-Manhulad_Jeffry_CMSC208_Assignment2.png', '2020-04-13 10:00:47', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `Id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_extension` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Is_deleted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`Id`, `file_path`, `file_extension`, `description`, `type`, `created_date`, `Is_deleted`) VALUES
(1, 'images/user_image_data/starex', '.jpg', 'this is the image of the government id', 'id', '2020-04-05 15:33:02', b'0'),
(2, 'images/user_image_data/no-image', '.jpg', 'the default image if no image', 'default image', '2020-04-05 15:33:02', b'0'),
(3, 'images/user_image_data/toyota-vios-g', '.png', 'toyota', 'car', '2020-04-05 15:33:02', b'0'),
(4, 'images/user_image_data/toyota-innova', '.jpg', 'innova', 'car', '2020-04-05 15:33:02', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`Id`, `name`, `value`, `Is_Active`) VALUES
(6, 'Driver_Per_Day', '800', b'1'),
(7, 'telephone', '+63 917 638 1707', b'1'),
(8, 'Email Address', 'inquiry@carrental.com', b'1'),
(9, 'Address', 'Poblacion Hagkol Sayre Highway (infront of new bus terminal), Valencia City, Bukidnon 8709', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `Id` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`Id`, `label`, `Is_Active`) VALUES
(2, 'In Progress', b'1'),
(3, 'Done', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(5) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `username`, `password`, `user_type`, `created_at`, `Is_Active`) VALUES
(4, 'Enzo', 'Cerbas', 'bvcerbas@up.edu.ph', '', 'e10adc3949ba59abbe56e057f20f883e', 'user', '2020-02-01 05:18:35', b'0'),
(9, 'Admin', 'Car Rental', 'admin@carrental.com', '', '25d55ad283aa400af464c76d713c07ad', 'admin', '2020-02-08 03:15:32', b'0'),
(11, 'Jeffry', 'Manhulad', 'jeff.manhulad@gmail.com', 'jeffman', 'd41d8cd98f00b204e9800998ecf8427e', 'admin', '2020-04-12 14:37:28', b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `clientbookings`
--
ALTER TABLE `clientbookings`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `clientsphotos`
--
ALTER TABLE `clientsphotos`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `clientbookings`
--
ALTER TABLE `clientbookings`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `clientsphotos`
--
ALTER TABLE `clientsphotos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;