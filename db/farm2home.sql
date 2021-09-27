-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2021 at 03:04 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farm2home`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `Id` int(4) NOT NULL,
  `description` varchar(30) NOT NULL,
  `city_id` int(3) NOT NULL,
  `distance` int(3) NOT NULL,
  `delflag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`Id`, `description`, `city_id`, `distance`, `delflag`) VALUES
(1, 'Rishali', 4, 0, 0),
(2, 'Nehru nagar', 4, 12, 0),
(3, 'Vesu', 2, 0, 0),
(4, 'Gandhi Nagar', 3, 0, 0),
(5, 'Pal', 2, 10, 0),
(6, 'Aashish Nagar', 4, 5, 0),
(7, 'Chakradhar Nagar', 5, 0, 0),
(8, 'Nehru Nagar', 5, 3, 0),
(9, 'Vinoba Nagar', 1, 0, 0),
(10, 'BSP Market', 1, 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `Id` int(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Branch` varchar(50) NOT NULL,
  `Acc_no` int(20) NOT NULL,
  `card_no` int(15) NOT NULL,
  `Expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Id` int(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  `image` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `delflag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Id`, `name`, `image`, `description`, `delflag`) VALUES
(1, 'Vegetable', '1.jpg', 'Rich in fiber. Green, yellow, red you can get any. ', 0),
(2, 'Fruit', '2.jpg', 'Good for health. Rich in vitamins. ', 0),
(3, 'milk', '3.jpg', 'Great source of calcium and protien. Use me for variety of dishes. ', 0),
(4, 'grain', '4.jpg', 'Select me if you want dal , rice or wheat.\r\n', 0),
(5, 'Prashant', '', 'Software developer', 0),
(6, 'Prashant', '', 'adcjnferj', 0);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `Id` int(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  `state_Id` int(2) NOT NULL,
  `delflag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`Id`, `name`, `state_Id`, `delflag`) VALUES
(1, 'Raipur', 1, 0),
(2, 'Surat', 2, 0),
(3, 'Vapi', 2, 0),
(4, 'Bhilai', 1, 0),
(5, 'Raigarh', 1, 0),
(6, 'Durg', 1, 0),
(8, 'Pune', 3, 0),
(12, 'Mumbai', 3, 0),
(15, 'Champa', 1, 0),
(16, 'Bilaspur', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Id` varchar(6) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `Last_name` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Phone_no` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_partners`
--

CREATE TABLE `delivery_partners` (
  `Id` int(4) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `phone_no` int(10) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmers`
--

CREATE TABLE `farmers` (
  `Id` int(3) NOT NULL,
  `image` varchar(10) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `area_id` int(5) NOT NULL,
  `delflag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `farmer_product`
--

CREATE TABLE `farmer_product` (
  `Id` int(2) NOT NULL,
  `Farmer_id` int(2) NOT NULL,
  `product_id` int(2) NOT NULL,
  `rate` int(3) NOT NULL,
  `quantity` int(10) NOT NULL,
  `delflag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id` tinyint(1) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `image` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `categories` int(3) NOT NULL,
  `tag` text NOT NULL,
  `delflag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `Id` int(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  `delflag` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`Id`, `name`, `delflag`) VALUES
(1, 'Chhattisgarh', 0),
(2, 'Gujarat', 0),
(3, 'Maharastara', 0),
(4, 'Odisa', 0),
(5, 'djnqwej', 0),
(6, 'UttarPradesh', 0),
(7, 'Panjab', 0),
(8, 'MP', 0),
(9, 'Tamilnadu', 0),
(10, 'JammuKashmir', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `cityFK` (`city_id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `unique` (`card_no`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `cityStateIndex` (`name`,`state_Id`),
  ADD KEY `stateFK` (`state_Id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `unique` (`Email`);

--
-- Indexes for table `delivery_partners`
--
ALTER TABLE `delivery_partners`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `unique` (`phone_no`);

--
-- Indexes for table `farmers`
--
ALTER TABLE `farmers`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `areaFK` (`area_id`);

--
-- Indexes for table `farmer_product`
--
ALTER TABLE `farmer_product`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Unique` (`Name`),
  ADD KEY `categoryFK` (`categories`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `nameIndex` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `delivery_partners`
--
ALTER TABLE `delivery_partners`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmers`
--
ALTER TABLE `farmers`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmer_product`
--
ALTER TABLE `farmer_product`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id` tinyint(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `cityFK` FOREIGN KEY (`city_id`) REFERENCES `city` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `stateFK` FOREIGN KEY (`state_Id`) REFERENCES `state` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `farmers`
--
ALTER TABLE `farmers`
  ADD CONSTRAINT `areaFK` FOREIGN KEY (`area_id`) REFERENCES `area` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `categoryFK` FOREIGN KEY (`categories`) REFERENCES `category` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
