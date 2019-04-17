-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2019 at 10:21 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbacdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `actionId` int(20) NOT NULL,
  `actionName` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`actionId`, `actionName`) VALUES
(71, 'read'),
(72, 'write'),
(73, 'update'),
(74, 'delete');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `resourceId` int(20) NOT NULL,
  `resourceName` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`resourceId`, `resourceName`) VALUES
(41, 'html-files'),
(42, 'php-files'),
(43, 'design-files'),
(44, 'test-files');

-- --------------------------------------------------------

--
-- Table structure for table `roleactions`
--

CREATE TABLE `roleactions` (
  `roleId` int(20) NOT NULL,
  `actionId` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roleactions`
--

INSERT INTO `roleactions` (`roleId`, `actionId`) VALUES
(22, 71),
(22, 73),
(21, 71),
(21, 74),
(23, 72);

-- --------------------------------------------------------

--
-- Table structure for table `roleresources`
--

CREATE TABLE `roleresources` (
  `roleId` int(20) NOT NULL,
  `resourceId` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roleresources`
--

INSERT INTO `roleresources` (`roleId`, `resourceId`) VALUES
(22, 41),
(22, 44),
(21, 41),
(21, 43),
(23, 43);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleId` int(20) NOT NULL,
  `roleName` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleId`, `roleName`) VALUES
(21, 'frontend'),
(22, 'backend'),
(23, 'uiux');

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `userId` int(20) NOT NULL,
  `roleId` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`userId`, `roleId`) VALUES
(2, 22),
(2, 23),
(3, 23),
(4, 22),
(5, 21),
(5, 23);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(20) NOT NULL,
  `userName` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `userName`) VALUES
(1, 'siddharth'),
(2, 'abha'),
(3, 'sneha'),
(4, 'ravi'),
(5, 'ravina'),
(6, 'shruti'),
(7, 'tanya'),
(8, 'surya'),
(9, 'reyaz'),
(10, 'gagan'),
(11, 'suraj'),
(12, 'himanil'),
(13, 'prateek');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`actionId`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resourceId`);

--
-- Indexes for table `roleactions`
--
ALTER TABLE `roleactions`
  ADD KEY `fk3` (`roleId`),
  ADD KEY `fk4` (`actionId`);

--
-- Indexes for table `roleresources`
--
ALTER TABLE `roleresources`
  ADD KEY `fk1` (`roleId`),
  ADD KEY `fk2` (`resourceId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD KEY `fk5` (`userId`),
  ADD KEY `fk6` (`roleId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `roleactions`
--
ALTER TABLE `roleactions`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk4` FOREIGN KEY (`actionId`) REFERENCES `actions` (`actionId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roleresources`
--
ALTER TABLE `roleresources`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`resourceId`) REFERENCES `resources` (`resourceId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `fk5` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk6` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
