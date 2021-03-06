-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2020 at 11:33 AM
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
  `car_description` varchar(255) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `model` varchar(20) NOT NULL,
  `manufacturer` varchar(20) NOT NULL,
  `year` int(4) NOT NULL,
  `plate_number` varchar(10) NOT NULL,
  `RentPerDay` double(18,2) NOT NULL,
  `Capacity` int(2) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`Id`, `car_description`, `code_name`, `model`, `manufacturer`, `year`, `plate_number`, `RentPerDay`, `Capacity`, `file_name`, `Is_Active`) VALUES
(40, 'Toyota Grandia', 'Toyota Grandia Radiant', 'Grandia', 'Toyota', 1990, 'TBS-7634', 5000.00, 4, '1586654715-Capture.PNG', b'1'),
(49, 'Hyundai Tucson (Yellow)', 'Radiant Hyundai', 'Tucson', 'Hyundai', 1990, 'XTR-3425', 4800.00, 4, 'v1starex1.jpg', b'1'),
(50, 'BMW M3 (Silver)', 'BMW M3 Radiant', 'M3', 'BMW', 1990, 'TRX-0987', 10000.00, 7, '1586954874-.jpg', b'1'),
(51, 'BMW Z4 (Silver)', 'BMW Z4 Radiant', 'Z4', 'BMW', 1990, 'TBS-7764', 20000.00, 2, '1586955163-Capture.PNG', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `clientbookings`
--

CREATE TABLE `clientbookings` (
  `BookingId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `carId` int(11) NOT NULL,
  `reference_number` varchar(25) NOT NULL,
  `start_date` date NOT NULL,
  `pick_up_datetime` datetime NOT NULL,
  `number_of_days` int(2) NOT NULL,
  `add_driver` bit(1) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `driver_fee_current` decimal(10,0) NOT NULL,
  `rental_fee_current` decimal(10,0) NOT NULL,
  `rental_discount` decimal(10,0) DEFAULT NULL,
  `end_date` date NOT NULL,
  `return_datetime` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL,
  `statusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientbookings`
--

INSERT INTO `clientbookings` (`BookingId`, `clientId`, `carId`, `reference_number`, `start_date`, `pick_up_datetime`, `number_of_days`, `add_driver`, `driver_name`, `driver_fee_current`, `rental_fee_current`, `rental_discount`, `end_date`, `return_datetime`, `created_by`, `updated_by`, `created_date`, `updated_date`, `statusId`) VALUES
(34, 97, 40, 'VRS-20041BQ2T', '2020-04-21', '0000-00-00 00:00:00', 2, b'1', '', '1000', '5000', '0', '2020-04-23', '0000-00-00 00:00:00', 12, 0, '2020-04-21 20:44:31', '0000-00-00 00:00:00', 1),
(35, 99, 49, 'VRS-2004CMLZG', '2020-04-21', '0000-00-00 00:00:00', 1, b'1', 'Jan Hope', '1000', '4800', '50', '2020-04-22', '0000-00-00 00:00:00', 12, 0, '2020-04-21 21:11:30', '0000-00-00 00:00:00', 1),
(36, 100, 50, 'VRS-2004EOG26', '2020-04-21', '0000-00-00 00:00:00', 1, b'1', '', '1000', '10000', '200', '2020-04-22', '0000-00-00 00:00:00', 12, 0, '2020-04-21 21:16:47', '0000-00-00 00:00:00', 3),
(37, 99, 51, 'VRS-2004W795F', '2020-04-21', '0000-00-00 00:00:00', 2, b'1', '', '1000', '20000', '0', '2020-04-23', '0000-00-00 00:00:00', 12, 0, '2020-04-21 21:18:30', '0000-00-00 00:00:00', 1),
(38, 99, 49, 'VRS-2004SETNI', '2020-04-23', '0000-00-00 00:00:00', 2, b'1', 'Jan Hope', '1000', '4800', '500', '2020-04-25', '0000-00-00 00:00:00', 12, 0, '2020-04-21 22:32:27', '0000-00-00 00:00:00', 1),
(39, 98, 50, 'VRS-2004ZRQGQ', '2020-04-23', '0000-00-00 00:00:00', 1, b'0', '', '1000', '10000', '0', '2020-04-24', '0000-00-00 00:00:00', 12, 0, '2020-04-21 22:38:49', '0000-00-00 00:00:00', 1),
(40, 97, 40, 'VRS-20047VXT8', '2020-04-24', '0000-00-00 00:00:00', 1, b'0', '', '1000', '5000', '0', '2020-04-25', '0000-00-00 00:00:00', 12, 0, '2020-04-21 22:41:17', '0000-00-00 00:00:00', 2),
(41, 99, 40, 'VRS-2004Q4CZQ', '2020-04-30', '0000-00-00 00:00:00', 2, b'1', '', '1000', '5000', '250', '2020-05-02', '0000-00-00 00:00:00', 12, 0, '2020-04-22 00:00:19', '0000-00-00 00:00:00', 1),
(44, 97, 51, 'VRS-20042TC4V', '2020-04-24', '0000-00-00 00:00:00', 1, b'1', 'Jan Hope', '1000', '20000', '300', '2020-04-25', '0000-00-00 00:00:00', 12, 0, '2020-04-22 11:37:26', '0000-00-00 00:00:00', 1),
(45, 99, 40, 'VRS-2004ZCOKE', '2020-05-07', '0000-00-00 00:00:00', 3, b'1', '', '1000', '5000', '0', '2020-05-10', '0000-00-00 00:00:00', 12, 0, '2020-04-22 23:19:55', '0000-00-00 00:00:00', 1),
(46, 0, 50, 'VRS-200479L18', '2020-04-30', '0000-00-00 00:00:00', 3, b'0', '', '1000', '10000', '0', '2020-05-03', '0000-00-00 00:00:00', 12, 0, '2020-04-23 21:17:59', '0000-00-00 00:00:00', 1),
(47, 0, 51, 'VRS-2004HNPJC', '2020-04-30', '0000-00-00 00:00:00', 1, b'0', '', '1000', '20000', '0', '2020-05-01', '0000-00-00 00:00:00', 12, 0, '2020-04-23 21:20:00', '0000-00-00 00:00:00', 1),
(48, 97, 49, 'VRS-2004KGFWH', '2020-04-29', '0000-00-00 00:00:00', 3, b'1', 'Jan Hope F. Cajelo', '1000', '4800', '0', '2020-05-02', '0000-00-00 00:00:00', 12, 0, '2020-04-23 23:51:45', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clientbookingslogs`
--

CREATE TABLE `clientbookingslogs` (
  `Id` int(11) NOT NULL,
  `clientbookings_id` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clientbookingslogs`
--

INSERT INTO `clientbookingslogs` (`Id`, `clientbookings_id`, `remarks`, `created_date`, `created_by`) VALUES
(3, 34, NULL, '2020-04-21 12:44:32', 12),
(4, 35, NULL, '2020-04-21 13:11:30', 12),
(5, 36, NULL, '2020-04-21 13:16:47', 12),
(6, 37, 'client paid 500 for reservation', '2020-04-21 13:18:30', 12),
(7, 38, 'Created this booking', '2020-04-21 14:32:28', 12),
(8, 38, 'client paid 1,000 for this reservation. Please see attached file', '2020-04-21 14:32:28', 12),
(9, 39, 'Created this booking', '2020-04-21 14:38:49', 12),
(10, 39, '', '2020-04-21 14:38:49', 12),
(11, 40, 'Created this booking', '2020-04-21 14:41:17', 12),
(12, 41, 'Created this booking', '2020-04-21 16:00:19', 12),
(13, 41, 'client did not pay', '2020-04-21 16:00:19', 12),
(14, 41, 'applied a discount amount of 250', '2020-04-21 16:00:19', 12),
(21, 44, 'Created this booking', '2020-04-22 03:37:26', 12),
(22, 44, 'client paid 2500 as downpayment', '2020-04-22 03:37:26', 12),
(23, 44, 'applied a discount amount of 300', '2020-04-22 03:37:26', 12),
(24, 45, 'Created this booking', '2020-04-22 15:19:55', 12),
(25, 46, 'Created this booking', '2020-04-23 13:17:59', 12),
(26, 47, 'Created this booking', '2020-04-23 13:20:00', 12),
(27, 48, 'Created this booking', '2020-04-23 15:51:46', 12);

-- --------------------------------------------------------

--
-- Table structure for table `clientbookingspayments`
--

CREATE TABLE `clientbookingspayments` (
  `PaymentId` int(11) NOT NULL,
  `Booking_Id` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `payment_remarks` text NOT NULL,
  `attachment_path` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clientbookingspayments`
--

INSERT INTO `clientbookingspayments` (`PaymentId`, `Booking_Id`, `amount`, `payment_remarks`, `attachment_path`, `created_date`, `created_by`) VALUES
(1, 44, '2500', 'added downpayment', '1587473071-CHARM.png', '2020-04-22 03:37:26', 12),
(2, 45, '500', 'added downpayment', '', '2020-04-22 15:19:55', 12),
(3, 48, '1000', 'downpayment', '', '2020-04-24 08:41:32', 12),
(4, 48, '2000', 'payment', '1587718662-paper-receipt-icon-simple-style-vector-26801158.jpg', '2020-04-24 08:57:42', 12),
(5, 48, '5000', 'Client transferred via BDO', '1587719956-profile-icon-female-user-person-avatar-symbol-vector-20910834.jpg', '2020-04-24 09:19:16', 12),
(6, 48, '5000', 'paid via palawan', '1587720026-download.png', '2020-04-24 09:20:26', 12);

-- --------------------------------------------------------

--
-- Table structure for table `clientbookingsphotos`
--

CREATE TABLE `clientbookingsphotos` (
  `Id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clientbookingsphotos`
--

INSERT INTO `clientbookingsphotos` (`Id`, `booking_id`, `file_name`, `created_date`, `Is_Active`) VALUES
(20, 34, '1587473071-CHARM.PNG', '2020-04-21 20:44:31', b'1'),
(21, 35, '1587474690-ESCS_SCMC.PNG', '2020-04-21 21:11:30', b'1'),
(22, 38, '1587479547-CHARM.PNG', '2020-04-21 22:32:27', b'1'),
(25, 44, '1587526646-ESCS_SCMC.PNG', '2020-04-22 11:37:26', b'1'),
(26, 48, '1587657105-download.png', '2020-04-23 23:51:46', b'1');

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
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` date NOT NULL,
  `Is_Active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`Id`, `name`, `email_address`, `contact_number`, `address`, `created_date`, `updated_date`, `Is_Active`) VALUES
(97, 'Jeffry Manhulad', 'jcmanhulad@up.edu.ph', '09268406884', 'Musuan, Dologon, Maramag, Bukidnon', '2020-04-13 10:00:47', '0000-00-00', b'1'),
(98, 'Arvin Reyes', 'jbbatedio@up.edu.ph', '0912321312', 'Cavite City', '2020-04-13 12:26:00', '0000-00-00', b'1'),
(99, 'Jym Bartolaba Batedio', 'jbbatedio@up.edu.ph', '091231231231', 'Barra Opol Misamis Oriental', '2020-04-13 13:24:10', '0000-00-00', b'1'),
(100, 'Mary Jeziel Cavan', 'johndue@gmail.com', '34324242', 'Musuan', '2020-04-13 21:54:53', '0000-00-00', b'1'),
(101, 'MJ Cavan', 'admin@webdamn.com', '34534534', 'Address', '2020-04-15 19:13:12', '0000-00-00', b'1'),
(104, 'Marcelito Caparida', 'test@fakemail.com', '09262626', 'Busco, Butong, Quezon, Bukidnon', '2020-04-23 00:38:15', '0000-00-00', b'1');

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
(77, 99, '1586755450-unnamed.jpg', '2020-04-13 13:24:10', b'1'),
(84, 103, '1586966723-SAM_0745.JPG', '2020-04-16 00:05:23', b'1'),
(85, 103, '1586966723-lbO17hkK_400x400.jpg', '2020-04-16 00:05:23', b'1'),
(86, 98, '1587572647-download.jpg', '2020-04-23 00:24:07', b'1'),
(87, 98, '1587572696-paper-receipt-icon-simple-style-vector-26801158.jpg', '2020-04-23 00:24:56', b'1'),
(88, 98, '1587572844-download.png', '2020-04-23 00:27:24', b'1'),
(89, 98, '1587572893-money-receipt-icon-simple-style-vector-26801184.jpg', '2020-04-23 00:28:13', b'1'),
(90, 98, '1587572957-profile-icon-female-user-person-avatar-symbol-vector-20910834.jpg', '2020-04-23 00:29:17', b'1'),
(91, 104, '1587573495-download.png', '2020-04-23 00:38:15', b'1'),
(92, 104, '1587573495-download.jpg', '2020-04-23 00:38:15', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`Id`, `name`, `value`, `type`, `Is_Active`) VALUES
(6, 'Driver_Per_Day', '1000', 'system', b'1'),
(7, 'telephone', '+63 917 638 1707', 'contact', b'1'),
(8, 'Email Address', 'inquiry@carrental.com / customer@carrental.com', 'contact', b'1'),
(9, 'Address', 'Poblacion Hagkol Sayre Highway (infront of new bus terminal), Valencia City, Bukidnon 8709', 'contact', b'1'),
(11, 'Mobile phone', '09268406884', 'contact', b'1'),
(15, 'Rental_Pickup_Time', '10:00', 'system', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `Id` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `bootstrap_bg_color` varchar(100) NOT NULL,
  `Is_Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`Id`, `label`, `bootstrap_bg_color`, `Is_Active`) VALUES
(1, 'Reserved', 'success', b'1'),
(2, 'In Progress', 'danger', b'1'),
(3, 'Returned', 'primary', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `fullname` varchar(255) NOT NULL,
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

INSERT INTO `users` (`id`, `firstname`, `lastname`, `fullname`, `email`, `username`, `password`, `user_type`, `created_at`, `Is_Active`) VALUES
(4, 'Enzo', 'Cerbas', 'Enzo Cerbas', 'bvcerbas@up.edu.ph', 'enzo', 'd41d8cd98f00b204e9800998ecf8427e', 'user', '2020-02-01 05:18:35', b'1'),
(12, 'Arvin', 'Reyes', 'Arvin Reyes', 'arvin@gmail.com', 'arvinreyes', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', '2020-04-14 15:38:23', b'1'),
(13, 'Admin', 'Carrental', 'Admin Carrental', 'johndue@gmail.com', 'admin', '25d55ad283aa400af464c76d713c07ad', 'admin', '2020-04-14 15:45:03', b'1'),
(14, 'Admin', 'Admin 2', 'Admin Admin 2', 'test@fakemail.com', 'admin2', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', '2020-04-23 21:49:55', b'1');

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
  ADD PRIMARY KEY (`BookingId`);

--
-- Indexes for table `clientbookingslogs`
--
ALTER TABLE `clientbookingslogs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `clientbookingspayments`
--
ALTER TABLE `clientbookingspayments`
  ADD PRIMARY KEY (`PaymentId`);

--
-- Indexes for table `clientbookingsphotos`
--
ALTER TABLE `clientbookingsphotos`
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `clientbookings`
--
ALTER TABLE `clientbookings`
  MODIFY `BookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `clientbookingslogs`
--
ALTER TABLE `clientbookingslogs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `clientbookingspayments`
--
ALTER TABLE `clientbookingspayments`
  MODIFY `PaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clientbookingsphotos`
--
ALTER TABLE `clientbookingsphotos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `clientsphotos`
--
ALTER TABLE `clientsphotos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
