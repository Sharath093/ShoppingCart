-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2017 at 07:13 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `BID` int(11) NOT NULL,
  `BrandName` varchar(30) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`BID`, `BrandName`, `Description`, `CID`) VALUES
(1, 'Cera', 'Kitchen items', 1),
(2, 'Jaguar', 'Kitchen items', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CID` int(11) NOT NULL,
  `CatName` varchar(30) NOT NULL,
  `Description` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CID`, `CatName`, `Description`) VALUES
(1, 'Kitchen', 'Kitchen items'),
(2, 'Laptops', 'Notepad computers');

-- --------------------------------------------------------

--
-- Table structure for table `custcredentials`
--

CREATE TABLE IF NOT EXISTS `custcredentials` (
  `SID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `CustID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custcredentials`
--

INSERT INTO `custcredentials` (`SID`, `Username`, `Password`, `CustID`) VALUES
(1, 'shashankbrgowda', '12345', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `CustID` int(11) NOT NULL,
  `CustName` varchar(30) NOT NULL,
  `EmailID` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustID`, `CustName`, `EmailID`, `DOB`, `Phone`, `address`) VALUES
(1, 'Shashank B R', 'shashank.b.r.gowda45587@gmail.com', '0000-00-00', '+919900810351', 'Hosabudanuru, Mandya');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `OID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `PID` int(11) DEFAULT NULL,
  `BID` int(11) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `CustID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OID`, `Quantity`, `UnitPrice`, `PID`, `BID`, `CID`, `CustID`) VALUES
(1, 2, 20000, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `PID` int(11) NOT NULL,
  `ProductName` varchar(30) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Image` varchar(200) NOT NULL,
  `Price` float NOT NULL,
  `BID` int(11) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`PID`, `ProductName`, `Description`, `Image`, `Price`, `BID`, `CID`) VALUES
(1, 'Jaguar taps', 'Jaguar taps', 'https://cdn.pixabay.com/photo/2016/03/28/12/35/cat-1285634_960_720.png', 20000, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `CID` (`CID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `custcredentials`
--
ALTER TABLE `custcredentials`
  ADD PRIMARY KEY (`SID`),
  ADD KEY `CustID` (`CustID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `BID` (`BID`),
  ADD KEY `CID` (`CID`),
  ADD KEY `CustID` (`CustID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `BID` (`BID`),
  ADD KEY `CID` (`CID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `custcredentials`
--
ALTER TABLE `custcredentials`
  MODIFY `SID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `category` (`CID`);

--
-- Constraints for table `custcredentials`
--
ALTER TABLE `custcredentials`
  ADD CONSTRAINT `custcredentials_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `customers` (`CustID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `products` (`PID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `brand` (`BID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`CID`) REFERENCES `category` (`CID`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`CustID`) REFERENCES `customers` (`CustID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`BID`) REFERENCES `brand` (`BID`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `category` (`CID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
