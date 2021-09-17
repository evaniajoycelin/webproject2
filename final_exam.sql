-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2021 at 06:14 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cartID` int(11) NOT NULL,
  `foodID` int(11) NOT NULL,
  `cartQty` int(11) NOT NULL,
  `cartName` varchar(255) NOT NULL,
  `cartPrice` int(11) NOT NULL,
  `cartTotalPrice` int(11) NOT NULL,
  `transID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cartID`, `foodID`, `cartQty`, `cartName`, `cartPrice`, `cartTotalPrice`, `transID`) VALUES
(1, 1, 1, 'Sushi Salmon', 89000, 89000, 1),
(2, 2, 1, 'Chicken Ramen', 100000, 100000, 1),
(3, 3, 1, 'Shrimp Gyoza', 50000, 50000, 2),
(4, 5, 1, 'Tempura', 15000, 15000, 2),
(8, 1, 1, 'Sushi Salmon', 89000, 89000, 3),
(9, 1, 1, 'Sushi Salmon', 89000, 89000, 3),
(10, 3, 1, 'Shrimp Gyoza', 50000, 50000, 4),
(11, 8, 1, 'Mochi', 15000, 15000, 4),
(12, 2, 1, 'Chicken Ramen', 100000, 100000, NULL),
(13, 5, 1, 'Tempura', 15000, 15000, NULL),
(14, 3, 1, 'Shrimp Gyoza', 50000, 50000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `foodID` int(11) NOT NULL,
  `foodName` varchar(255) NOT NULL,
  `foodStock` int(11) NOT NULL,
  `foodPrice` int(11) NOT NULL,
  `foodImg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`foodID`, `foodName`, `foodStock`, `foodPrice`, `foodImg`) VALUES
(1, 'Sushi Salmon', 7, 89000, 'http://s2.cerpen.co.id/idimgs/201902/14/7/15501434872038.jpg'),
(2, 'Chicken Ramen', 9, 100000, 'https://asset.kompas.com/crops/vIeK9AWW9_ZospMlPG098XIjX4E=/0x0:739x493/750x500/data/photo/2020/04/14/5e958f08a5e51.jpg'),
(3, 'Shrimp Gyoza', 9, 50000, 'https://static01.nyt.com/images/2019/09/16/dining/kwr-gyoza/merlin_160427046_9e2ab11e-f937-4f2e-a268-4f46b8480c73-articleLarge.jpg'),
(4, 'Shoyu Udon', 11, 80000, 'https://www.justonecookbook.com/wp-content/uploads/2021/02/Beef-Udon-Niku-Udon-0050-I.jpg'),
(5, 'Tempura', 5, 15000, 'https://d12man5gwydfvl.cloudfront.net/wp-content/uploads/2017/05/HappyFresh_cara_membuat_tempura_udang-940x700.jpg'),
(6, 'Ocha', 50, 10000, 'https://cdn-2.tstatic.net/travel/foto/bank/images/ocha_20170816_121043.jpg'),
(7, 'Mineral Water', 0, 3000, 'https://images.tokopedia.net/img/cache/500-square/product-1/2020/4/1/batch-upload/batch-upload_656dee17-f184-4b6a-8195-6ad86e39484e.jpg?ect=4g'),
(8, 'Mochi', 49, 15000, 'https://asset.kompas.com/crops/gxph647iM0KcH_UQ23lZ82-yJZ8=/0x0:1000x667/750x500/data/photo/2020/06/14/5ee6083ca6463.jpg'),
(9, 'Chicken Curry', 20, 70000, 'https://www.justonecookbook.com/wp-content/uploads/2020/03/Japanese-Chicken-Curry-2417-I.jpg'),
(10, 'Oyakodon', 30, 55000, 'https://www.justonecookbook.com/wp-content/uploads/2011/02/Oyakodon-w600-500x375.jpg'),
(16, 'Yakitori', 20, 40000, 'https://www.dinneratthezoo.com/wp-content/uploads/2019/12/yakitori-5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transID` int(11) NOT NULL,
  `transDate` date NOT NULL,
  `tableNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transID`, `transDate`, `tableNumber`) VALUES
(1, '2021-07-26', NULL),
(2, '2021-07-26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userName`, `userPassword`) VALUES
(1, 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cartID`),
  ADD KEY `foodID` (`foodID`) USING BTREE;

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`foodID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `foodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`foodID`) REFERENCES `foods` (`foodID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
