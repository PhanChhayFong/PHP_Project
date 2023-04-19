-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 19, 2023 at 05:21 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `a3phpdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE IF NOT EXISTS `tb_category` (
  `cg_id` int NOT NULL AUTO_INCREMENT,
  `cg_name` varchar(255) NOT NULL,
  `cg_icon` varchar(255) NOT NULL,
  `cg_dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`cg_id`, `cg_name`, `cg_icon`, `cg_dateCreated`) VALUES
(3, 'Core', '2023-03-16_03-23-32am_Charizard.png', '2023-03-16 01:44:15'),
(4, 'Citrus Fruits', '2023-03-16_03-23-38am_Ancient-Greek-Mosaic-Tray-By-Birsenmahmutoglu-On-DeviantArt.jpg', '2023-03-16 01:44:24'),
(1, 'Berries', '2023-03-16_01-34-45am_Dragon 1.png', '2023-03-16 01:22:56'),
(2, 'Pits', '2023-03-16_01-36-55am_imagees.jpeg (1).jpg', '2023-03-16 01:36:55'),
(5, 'Tropical Fruits', '2023-03-16_03-23-51am_greek-art.jpg', '2023-03-16 01:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `tb_company`
--

DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE IF NOT EXISTS `tb_company` (
  `cp_id` int NOT NULL AUTO_INCREMENT,
  `cp_name` varchar(255) NOT NULL,
  `cp_email` varchar(255) NOT NULL,
  `cp_phone` varchar(255) NOT NULL,
  `cp_telegram` varchar(255) NOT NULL,
  `cp_facebook` varchar(255) NOT NULL,
  `cp_twitter` varchar(255) NOT NULL,
  `cp_instagram` varchar(255) NOT NULL,
  `cp_address` text NOT NULL,
  `cp_logo` varchar(255) NOT NULL,
  `cp_miniLogo` varchar(255) NOT NULL,
  PRIMARY KEY (`cp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_company`
--

INSERT INTO `tb_company` (`cp_id`, `cp_name`, `cp_email`, `cp_phone`, `cp_telegram`, `cp_facebook`, `cp_twitter`, `cp_instagram`, `cp_address`, `cp_logo`, `cp_miniLogo`) VALUES
(1, 'Fresh Fruit Store', 'freshfruitstore@gmail.com', '+855 123456', '#', '#', '#', '#', 'Street 143\r\nCity Sangkat Boeng Keng Kang Ti Bei\r\nStatePhnom Penh\r\nLatitude11.5470792\r\nZipcode120104\r\nLongitude104.9159494\r\nCounty Cambodia', '2023-03-16_02-29-11pm_hamster loading cooler.gif', '2023-03-16_02-29-26pm_preloader.gif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE IF NOT EXISTS `tb_order` (
  `od_id` int NOT NULL AUTO_INCREMENT,
  `us_id` int NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `shippingAddress` text NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Phnom Penh',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Cambodia',
  `status` varchar(50) NOT NULL DEFAULT 'Ordered',
  `tax` int DEFAULT NULL,
  `subTotal` float DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `dateOrdered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateDelivered` datetime DEFAULT NULL,
  `dateSuccess` date DEFAULT NULL,
  `Tmode` char(1) DEFAULT '0',
  `Tstatus` char(1) DEFAULT '0',
  `TDate` date DEFAULT NULL,
  PRIMARY KEY (`od_id`),
  KEY `us_id` (`us_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`od_id`, `us_id`, `firstname`, `lastname`, `phone`, `email`, `shippingAddress`, `city`, `country`, `status`, `tax`, `subTotal`, `totalPrice`, `dateOrdered`, `dateDelivered`, `dateSuccess`, `Tmode`, `Tstatus`, `TDate`) VALUES
(1, 4, 'Sea', 'Chan', '1', '1', '1', 'Phnom Penh', 'Cambodia', 'Ordered', 1, 50, 55, '2023-03-27 03:34:15', '0000-00-00 00:00:00', NULL, '0', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_orderdetail`
--

DROP TABLE IF EXISTS `tb_orderdetail`;
CREATE TABLE IF NOT EXISTS `tb_orderdetail` (
  `odt_id` int NOT NULL AUTO_INCREMENT,
  `od_id` int NOT NULL,
  `pd_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`odt_id`),
  KEY `od_id` (`od_id`),
  KEY `pd_id` (`pd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_orderdetail`
--

INSERT INTO `tb_orderdetail` (`odt_id`, `od_id`, `pd_id`, `quantity`) VALUES
(1, 1, 1, 4),
(2, 1, 3, 5),
(3, 1, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE IF NOT EXISTS `tb_product` (
  `pd_id` int NOT NULL,
  `pd_name` varchar(255) NOT NULL,
  `pd_description` text NOT NULL,
  `pd_image` varchar(255) NOT NULL,
  `pd_regularPrice` float NOT NULL DEFAULT '0',
  `pd_salePrice` float NOT NULL DEFAULT '0',
  `pd_sku` varchar(255) NOT NULL,
  `cg_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pd_countInStock` int NOT NULL,
  `pd_dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pd_id`),
  KEY `cg_id` (`cg_id`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_product`
--

INSERT INTO `tb_product` (`pd_id`, `pd_name`, `pd_description`, `pd_image`, `pd_regularPrice`, `pd_salePrice`, `pd_sku`, `cg_id`, `pd_countInStock`, `pd_dateCreated`) VALUES
(3, '1asdf', '123', '2023-03-28_03-23-14am_preloader.gif', 23, 123, 'sadf', '1', 0, '2023-03-16 01:08:12'),
(1, '1', '1', '2023-03-17_06-34-01am_Charizard.png', 3, 1, '3', '3', 30, '2023-03-15 23:29:18'),
(2, '2', 'asd', '2023-03-16_01-07-55am_Flower.png', 2, 3, '2', '6', 2, '2023-03-15 23:29:32'),
(4, 'asdf', 'asdf', '2023-03-16_02-20-17am_1.gif', 0, 0, 'asdf', '2', 6, '2023-03-16 02:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `tb_shopping_cart`
--

DROP TABLE IF EXISTS `tb_shopping_cart`;
CREATE TABLE IF NOT EXISTS `tb_shopping_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `instance` enum('cart','wishlist') NOT NULL DEFAULT 'cart',
  `quantity` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_slideshow`
--

DROP TABLE IF EXISTS `tb_slideshow`;
CREATE TABLE IF NOT EXISTS `tb_slideshow` (
  `ss_id` int NOT NULL,
  `ss_event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ss_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ss_description` text NOT NULL,
  `ss_enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  `ss_image` varchar(255) NOT NULL,
  `ss_url` varchar(255) NOT NULL,
  `ss_order` int NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_slideshow`
--

INSERT INTO `tb_slideshow` (`ss_id`, `ss_event`, `ss_title`, `ss_description`, `ss_enable`, `ss_image`, `ss_url`, `ss_order`, `date_created`) VALUES
(13, 'Khmer New Year', '25% Off', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '1', '2023-03-15_03-11-45am_ZZ.png', '#', 13, '0000-00-00'),
(12, 'Chinese New Year', '45% Off', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '1', '2023-03-15_02-11-46am_E.jpg', '#', 12, '0000-00-00'),
(15, 'asdf', 'asdf', 'asdf', '1', '2023-03-15_03-19-47am_A.jpg', 'asdf', 15, '0000-00-00'),
(16, 'asdf', 'asdf', 'asdf', '1', '2023-03-16_01-06-08am_ZC.png', 'asdf', 16, '0000-00-00'),
(17, 'Chinese New Year', '30% Off', 'asdf', '1', '2023-03-15_10-05-06am_ZK.png', 'asdf', 17, '0000-00-00'),
(18, 'Chinese New Year', '30% Off', '123', '1', '2023-03-16_01-07-34am_double-dragon-drachen-2-oz-silber-munze-2-tuvalu-2019.jpg', 'asdf', 18, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaction`
--

DROP TABLE IF EXISTS `tb_transaction`;
CREATE TABLE IF NOT EXISTS `tb_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `us_id` bigint NOT NULL,
  `od_id` bigint NOT NULL,
  `tmode` enum('cash_on_delivery','card','paypal') NOT NULL DEFAULT 'cash_on_delivery',
  `tstatus` enum('pending','approved') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_transaction`
--

INSERT INTO `tb_transaction` (`id`, `us_id`, `od_id`, `tmode`, `tstatus`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'card', 'approved', '2023-04-12 02:22:36', '2023-04-12 02:22:36'),
(2, 4, 2, 'cash_on_delivery', 'pending', '2023-04-12 02:26:36', '2023-04-12 02:26:36'),
(3, 4, 3, 'card', 'approved', '2023-04-13 08:13:59', '2023-04-13 08:13:59'),
(4, 4, 4, 'card', 'approved', '2023-04-13 09:40:10', '2023-04-13 09:40:10'),
(5, 4, 5, 'cash_on_delivery', 'pending', '2023-04-13 09:41:05', '2023-04-13 09:41:05'),
(6, 4, 6, 'card', 'approved', '2023-04-13 09:57:34', '2023-04-13 09:57:34'),
(7, 4, 7, 'card', 'approved', '2023-04-13 10:00:05', '2023-04-13 10:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE IF NOT EXISTS `tb_user` (
  `us_id` int NOT NULL,
  `us_name` varchar(255) NOT NULL,
  `us_email` varchar(255) NOT NULL,
  `us_passwordHash` text NOT NULL,
  `us_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `us_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `us_DOB` date DEFAULT NULL,
  `us_nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `us_isAdmin` char(1) NOT NULL DEFAULT '0',
  `us_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `us_dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`us_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`us_id`, `us_name`, `us_email`, `us_passwordHash`, `us_phone`, `us_address`, `us_DOB`, `us_nationality`, `us_isAdmin`, `us_image`, `us_dateCreated`) VALUES
(1, 'Phan ChhayFong', 'phanchhayfong168@gmail.com', '$2y$10$gECasYVJ56aHRdCTr5LFTeojFn8iVKUXLPFYoacnnlW.E0OQqc3Vi', '010 886 578', '137AE0, 143, BKK III, BKK, PP', '2001-05-22', 'Cambodian', '1', '2023-04-18_07-12-59am_photo_2021-04-21_10-54-10.jpg', '2023-03-19 07:12:20'),
(3, 'Ren Sopanharith', 'rensopanharith@gmail.com', '$2y$10$wgd/DmAAFKw0q034si699OwmjKmQyBwHjnm3NGwqHJTRKOUxoJeXe', '085 401 444', '#124, st 148, KKK, KKKK, PP', '2023-04-14', 'Cambodian', '1', '2023-03-20_02-29-34am_photo_2022-11-21_08-52-15.jpg', '2023-03-20 02:29:34'),
(4, 'Sea Chan', 'chan.sea999@gmail.com', '$2y$10$Mt7fJk23jISPcBXwnv.X1.RkIPIPObxueU.gP389LfXvTpL2i4IBi', '096 718 7093', 'Siem Reap, Phnom Penh, Cambodia.', '2023-03-02', 'Cambodian', '0', '2023-03-20_02-31-59am_1675841957126.jpeg', '2023-03-20 02:31:59'),
(5, 'ChhayFong Phan ', 'chhayfong100@gmail.com', '$2y$10$C.cbTEzjXuz32AesH65/duFuU8JOHev0bhLCiXtC52VehGGO0Qig2', '010 88 65 78', '137AEo, 143, BKKIII, BKK, Phnom Penh', '2019-02-05', 'Japanese', '1', '2023-04-08_02-48-15am_IMG_6530.JPG', '2023-04-08 02:26:05'),
(2, 'Koeun Putheara', 'koeunputheara@gmail.com', '$2y$10$Arbb3uJyPMe59GRF0JYVjOMQoKka4BXQ2zp3nNsj0eXflrOAg.Fau', '096 286 2940', '137,143', '2023-04-01', 'Cambodian', '1', '2023-04-19_02-51-36am_pic.png', '2023-04-19 02:51:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
