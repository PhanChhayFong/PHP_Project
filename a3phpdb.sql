-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 04, 2023 at 01:04 AM
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
  `cg_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cg_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cg_dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`cg_id`, `cg_name`, `cg_icon`, `cg_dateCreated`) VALUES
(1, 'Citrus ', '2023-03-27_04-03-26pm_citrus_fruit.png', '2023-03-27 14:03:26'),
(2, 'Tropical', '2023-03-27_04-03-40pm_tropical_fruit.png', '2023-03-27 14:03:40'),
(3, 'Berries', '2023-03-27_04-03-56pm_berry_fruit.png', '2023-03-27 14:03:56'),
(4, 'Melons', '2023-03-27_04-04-08pm_melon_fruit.png', '2023-03-27 14:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `tb_company`
--

DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE IF NOT EXISTS `tb_company` (
  `cp_id` int NOT NULL AUTO_INCREMENT,
  `cp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_telegram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_miniLogo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_company`
--

INSERT INTO `tb_company` (`cp_id`, `cp_name`, `cp_email`, `cp_phone`, `cp_telegram`, `cp_facebook`, `cp_twitter`, `cp_instagram`, `cp_address`, `cp_logo`, `cp_miniLogo`, `cp_icon`) VALUES
(1, 'Fresh Food Box', 'freshfoodbox@gmail.com', '+855 23 999 9999', 't.me/freshfoodbox', 'www.facebook.com/freshfoodbox', 'www.twitter.com/freshfoodbox', 'www.instagram.com/freshfoodbox', 'Street 143\r\nCity Sangkat Boeng Keng Kang Ti Bei\r\nStatePhnom Penh\r\nLatitude11.5470792\r\nZipcode120104\r\nLongitude104.9159494\r\nCounty Cambodia', '2023-04-20_05-44-37am_Fresh-Food-Box.png', '2023-04-20_05-44-37am_Fresh-Food-Box - Copy.png', '2023-04-20_05-44-37am_Fresh-Food-Box - Copy (2).png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE IF NOT EXISTS `tb_order` (
  `od_id` int NOT NULL AUTO_INCREMENT,
  `us_id` int NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shippingAddress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Phnom Penh',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Cambodia',
  `status` enum('ordered','delivering','delivered') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `tax` int DEFAULT NULL,
  `subTotal` float DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `dateOrdered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateDelivered` datetime DEFAULT NULL,
  `dateSuccess` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`od_id`),
  KEY `us_id` (`us_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`od_id`, `us_id`, `firstname`, `lastname`, `phone`, `email`, `shippingAddress`, `city`, `country`, `status`, `tax`, `subTotal`, `totalPrice`, `dateOrdered`, `dateDelivered`, `dateSuccess`, `created_at`, `updated_at`) VALUES
(1, 4, 'Vanneth', 'You', '012 456 7893', 'you.vanneth@gmail.com', 'H2100, St3200, Sangkat Metaverse, Khan Facebook, Phnom Penh, Cambodia', 'Phnom Penh', 'Cambodia', 'delivered', 19, 186, 204.6, '2023-04-12 02:22:34', '2023-05-02 06:45:55', '2023-05-02 13:46:08', '2023-04-12 02:22:34', '2023-04-12 02:22:34'),
(2, 4, 'Sreypich ', 'San', '010 523 7465', 'san.sreypich@gmail.com', 'H2222, St3333, Sangkat Boeung Kok II, Khan Toul Kork, Phnom Penh, Cambodia', 'Phnom Penh', 'Cambodia', 'delivering', 8, 82.6, 90.86, '2023-04-12 02:26:36', '2023-05-02 12:52:33', '2023-04-13 15:52:07', '2023-04-12 02:26:36', '2023-04-12 02:26:36'),
(4, 4, 'Udom ', 'Nget', '0123659485', 'nget.udom@gmail.com', 'H111, St 222, Sangkat Boeung Kak II, Khan Toul Kork, Phnom Penh, Cambodia', 'Phnom Penh', 'Cambodia', 'ordered', 35, 353.8, 389.18, '2023-04-13 09:40:06', '0000-00-00 00:00:00', NULL, '2023-04-13 09:40:06', '2023-04-13 09:40:06'),
(5, 4, 'Sreypich', 'San', '0125469352', 'san.sreypich@gmail.com', 'H111, St 222, Sangkat Boeung Kak II, Khan Toul Kork, Phnom Penh, Cambodia', 'Phnom Penh', 'Cambodia', 'ordered', 9, 89.5, 98.45, '2023-04-13 09:41:05', '0000-00-00 00:00:00', NULL, '2023-04-13 09:41:05', '2023-04-13 09:41:05'),
(6, 4, 'Sopanharith', 'Ren', '012 365 9485', 'ren.sopanharith@gmail.com', 'H111, St 222, Sangkat Boeung Kak II, Khan Toul Kork, Phnom Penh, Cambodia', 'Phnom Penh', 'Cambodia', 'ordered', 105, 1046, 1150.6, '2023-04-13 09:57:31', NULL, NULL, '2023-04-13 09:57:31', '2023-04-13 09:57:31'),
(7, 4, 'Sreypich', 'San', '012 546 9352', 'san.sreypich@gmail.com', 'H111, St 222, Sangkat Boeung Kak II, Khan Toul Kork, Phnom Penh, Cambodia', 'Phnom Penh', 'Cambodia', 'ordered', 90, 900, 990, '2023-04-13 10:00:03', NULL, NULL, '2023-04-13 10:00:03', '2023-04-13 10:00:03'),
(8, 2, 'Putheara', 'Koeun', '0962862940', 'putheara768@gmail.com', 'H111, St 222, Sangkat Boeung Kak II, Khan Toul Kork, Phnom Penh, Cambodia', 'Phnom Penh', 'Cambodia', 'ordered', 7, 67, 73.7, '2023-04-18 13:36:09', NULL, NULL, '2023-04-18 13:36:09', '2023-04-18 13:36:09'),
(10, 1, 'phan', 'chhayfong', '010886578', 'phanchhayfong168@gmail.com', '143\r\n137', 'Phnom Penh', 'Cambodia', 'ordered', 55, 546, 600.6, '2023-05-02 08:03:30', NULL, NULL, '2023-05-02 08:03:30', '2023-05-02 08:03:30'),
(11, 1, 'phan', 'chhayfong', '010886578', 'phanchhayfong168@gmail.com', '143\r\n137', 'Phnom Penh', 'Cambodia', 'delivered', 17, 170, 187, '2023-05-02 09:22:56', '2023-05-02 09:24:46', '2023-05-02 16:25:52', '2023-05-02 09:22:56', '2023-05-02 09:22:56');

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`odt_id`),
  KEY `od_id` (`od_id`),
  KEY `pd_id` (`pd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_orderdetail`
--

INSERT INTO `tb_orderdetail` (`odt_id`, `od_id`, `pd_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 1, '2023-04-12 02:22:34', '2023-04-12 02:22:34'),
(2, 1, 15, 1, '2023-04-12 02:22:34', '2023-04-12 02:22:34'),
(3, 1, 9, 1, '2023-04-12 02:22:34', '2023-04-12 02:22:34'),
(4, 1, 3, 2, '2023-04-12 02:22:34', '2023-04-12 02:22:34'),
(5, 2, 1, 1, '2023-04-12 02:26:36', '2023-04-12 02:26:36'),
(6, 2, 10, 2, '2023-04-12 02:26:36', '2023-04-12 02:26:36'),
(7, 3, 5, 1, '2023-04-13 08:13:56', '2023-04-13 08:13:56'),
(8, 3, 12, 1, '2023-04-13 08:13:56', '2023-04-13 08:13:56'),
(9, 3, 13, 1, '2023-04-13 08:13:56', '2023-04-13 08:13:56'),
(10, 4, 7, 1, '2023-04-13 09:40:06', '2023-04-13 09:40:06'),
(11, 4, 14, 1, '2023-04-13 09:40:06', '2023-04-13 09:40:06'),
(12, 4, 12, 1, '2023-04-13 09:40:06', '2023-04-13 09:40:06'),
(13, 4, 10, 11, '2023-04-13 09:40:06', '2023-04-13 09:40:06'),
(14, 5, 4, 1, '2023-04-13 09:41:05', '2023-04-13 09:41:05'),
(15, 5, 12, 1, '2023-04-13 09:41:05', '2023-04-13 09:41:05'),
(16, 5, 11, 1, '2023-04-13 09:41:05', '2023-04-13 09:41:05'),
(17, 6, 10, 20, '2023-04-13 09:57:31', '2023-04-13 09:57:31'),
(18, 6, 15, 15, '2023-04-13 09:57:31', '2023-04-13 09:57:31'),
(19, 7, 9, 25, '2023-04-13 10:00:03', '2023-04-13 10:00:03'),
(20, 8, 7, 1, '2023-04-18 13:36:09', '2023-04-18 13:36:09'),
(21, 8, 5, 1, '2023-04-18 13:36:09', '2023-04-18 13:36:09'),
(22, 9, 13, 1, '2023-04-19 10:09:20', '2023-04-19 10:09:20'),
(23, 10, 9, 1, '2023-05-02 08:03:30', '2023-05-02 08:03:30'),
(24, 10, 14, 15, '2023-05-02 08:03:30', '2023-05-02 08:03:30'),
(25, 11, 14, 5, '2023-05-02 09:22:56', '2023-05-02 09:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE IF NOT EXISTS `tb_product` (
  `pd_id` int NOT NULL,
  `pd_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pd_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pd_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pd_regularPrice` float NOT NULL,
  `pd_salePrice` float NOT NULL,
  `pd_sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cg_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pd_countInStock` int NOT NULL,
  `pd_dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pd_id`),
  KEY `cg_id` (`cg_id`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_product`
--

INSERT INTO `tb_product` (`pd_id`, `pd_name`, `pd_description`, `pd_image`, `pd_regularPrice`, `pd_salePrice`, `pd_sku`, `cg_id`, `pd_countInStock`, `pd_dateCreated`) VALUES
(2, 'Watermelon', 'The most favorite fruit in Asia', '2023-03-27_04-06-42pm_fruit9.png', 25, 0, 'FF-0002', '4', 45, '2023-03-27 14:06:43'),
(3, 'Avocado', 'The most flavor fruit', '2023-03-27_04-09-07pm_fruit10.png', 38.5, 37, 'FF-0003', '2', 94, '2023-03-27 14:09:08'),
(4, 'Longan', 'The most sweetest fruit', '2023-03-27_04-12-00pm_fruit35.png', 30, 28.5, 'FF-0004', '2', 500, '2023-03-27 14:12:01'),
(5, 'Orange', 'The most popular fruit', '2023-03-27_04-13-10pm_fruit3.png', 32, 0, 'FF-0005', '1', 95, '2023-03-27 14:13:10'),
(6, 'Guava', 'Guava Fruit', '2023-03-27_04-14-15pm_fruit8.png', 16, 0, 'FF-0006', '4', 248, '2023-03-27 14:14:17'),
(7, 'Passion', 'Passion Fruit', '2023-03-27_04-16-51pm_fruit20.png', 35, 0, 'FF-0007', '1', 44, '2023-03-27 14:16:51'),
(8, 'Starwberry', 'Starwberry Fruit', '2023-03-27_04-18-43pm_fruit7.png', 36.5, 34, 'FF-0008', '3', 144, '2023-03-27 14:18:45'),
(9, 'Blueberry', 'Blueberry Fruit', '2023-03-27_04-20-45pm_fruit14.png', 36, 0, 'FF-0009', '3', 22, '2023-03-27 14:20:45'),
(10, 'Dragon Fruit', 'Dragon Fruit', '2023-03-27_04-28-47pm_fruit21.png', 25, 23.8, 'FF-0010', '2', 280, '2023-03-27 14:28:49'),
(11, 'Lychee', 'Lychee Fruit', '2023-03-27_04-30-14pm_fruit32.png', 38, 0, 'FF-0011', '3', 40, '2023-03-27 14:30:14'),
(12, 'Pineapple', 'Pineapple Fruit', '2023-03-27_04-46-37pm_fruit15.png', 25, 23, 'FF-0012', '4', 143, '2023-03-27 14:46:39'),
(13, 'Rambutan', 'Rambutan Fruit', '2023-03-27_04-52-40pm_fruit33.png', 20, 18, 'FF-0013', '3', 54, '2023-03-27 14:52:42'),
(14, 'Blackberry', 'Blackberry', '2023-03-27_05-05-09pm_fruit30.png', 35, 34, 'FF-0014', '3', 3, '2023-03-27 15:05:11'),
(15, 'Raspberry', 'Raspberry ', '2023-03-27_05-06-45pm_fruit18.png', 38, 0, 'FF-0015', '3', 22, '2023-03-27 15:06:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_slideshow`
--

DROP TABLE IF EXISTS `tb_slideshow`;
CREATE TABLE IF NOT EXISTS `tb_slideshow` (
  `ss_id` int NOT NULL,
  `ss_event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ss_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ss_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ss_enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `ss_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ss_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ss_order` int NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_slideshow`
--

INSERT INTO `tb_slideshow` (`ss_id`, `ss_event`, `ss_title`, `ss_description`, `ss_enable`, `ss_image`, `ss_url`, `ss_order`, `date_created`) VALUES
(13, 'Khmer New Year', '25%', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '1', '2023-03-28_04-27-41am_slide3.jpg', '/shop', 13, '0000-00-00'),
(12, 'Big Promotion', ' Tropical Fruits', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '1', '2023-03-28_04-27-31am_slide1.jpg', '/shop', 12, '0000-00-00'),
(15, 'Autumn Season', 'Fruit, Make you healthy', 'asdf', '1', '2023-03-28_04-27-51am_slide5.png', '/shop', 17, '0000-00-00'),
(16, 'Summer Vocation', 'Get Fruit, Gain your beauty', 'asdf', '1', '2023-03-28_04-28-00am_slide8.png', '/shop', 16, '0000-00-00'),
(17, 'Khmer New Year', '100% Fresh Fruit ', 'asdf', '1', '2023-03-28_04-28-17am_slide2.jpg', '/shop', 15, '0000-00-00'),
(18, 'New Arrival Berries', 'Come First, Get the Fresh Berries', '123', '1', '2023-03-28_04-28-41am_slide6.png', '/shop', 18, '0000-00-00');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(7, 4, 7, 'card', 'approved', '2023-04-13 10:00:05', '2023-04-13 10:00:05'),
(8, 2, 8, 'card', 'approved', '2023-04-18 13:36:12', '2023-04-18 13:36:12'),
(9, 2, 9, 'cash_on_delivery', 'pending', '2023-04-19 10:09:20', '2023-04-19 10:09:20'),
(10, 1, 10, 'card', 'approved', '2023-05-02 08:03:33', '2023-05-02 08:03:33'),
(11, 1, 11, 'card', 'approved', '2023-05-02 09:22:59', '2023-05-02 09:22:59');

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
(1, 'Phan ChhayFong', 'phanchhayfong168@gmail.com', '$2y$10$rnaQHWqmZGqZMcLFfeRqYuobWIrJS88YMyQ/5MpNs7RsRlP8QrTHS', '010 886 578', '137AE0, 143, BKK III, BKK, PP', '2001-05-23', 'Cambodian', '1', '2023-04-18_07-12-59am_photo_2021-04-21_10-54-10.jpg', '2023-03-19 07:12:20'),
(3, 'Ren Sopanharith', 'rensopanharith@gmail.com', '$2y$10$wgd/DmAAFKw0q034si699OwmjKmQyBwHjnm3NGwqHJTRKOUxoJeXe', '085 401 444', '#124, st 148, KKK, KKKK, PP', '2023-04-14', 'Cambodian', '1', '2023-03-20_02-29-34am_photo_2022-11-21_08-52-15.jpg', '2023-03-20 02:29:34'),
(4, 'Sea Chan', 'chan.sea999@gmail.com', '$2y$10$Mt7fJk23jISPcBXwnv.X1.RkIPIPObxueU.gP389LfXvTpL2i4IBi', '096 718 7093', 'Siem Reap, Phnom Penh, Cambodia.', '2023-03-02', 'Cambodian', '1', '2023-03-20_02-31-59am_1675841957126.jpeg', '2023-03-20 02:31:59'),
(8, 'Ang Soksreykim', 'sreykimangsok@gmail.com', '$2y$10$upyJ7XV5.A2zWsxA35v1.ej6eLGU5x13jVRR2jm/t.AWYeKk.Qawu', '061 997 661', 'asf32r12', '2022-11-10', 'Cambodian', '0', '2023-04-20_11-39-38am_DSC_0238 copy.jpg', '2023-04-20 11:39:38'),
(2, 'Koeun Putheara', 'koeunputheara@gmail.com', '$2y$10$Arbb3uJyPMe59GRF0JYVjOMQoKka4BXQ2zp3nNsj0eXflrOAg.Fau', '096 286 2940', '137,143', '2023-04-01', 'Cambodian', '1', '2023-04-19_02-51-36am_pic.png', '2023-04-19 02:51:36'),
(7, 'Chheang Kuyky', 'chheangkuyky@gmail.com', '$2y$10$sJvH0lP9l.c5Z31M.dQNfu.3PdD6PIkFrlLK1Q0N4VV3ZPRdeDzJO', '097 600 0133', 'asf1242f', '2022-11-11', 'Cambodian', '0', '2023-04-20_11-38-40am_KuyKy.jpg', '2023-04-20 11:38:40'),
(5, 'You Vanneth', 'youvannethzzz@gmail.com', '$2y$10$akWqdzIMo6s7.gxNCNeo5u1hT/yLr7nN9g5etkiSYI2cssrFNBPEm', '010 986 707', '145, St 123', '2022-08-10', 'Cambodian', '0', '2023-04-20_11-36-26am_vannthe - Copy.jpg', '2023-04-20 11:29:36'),
(6, 'Heng Sokna', 'hengsokna@gmail.com', '$2y$10$Zx8ZVMCDwDEwYsWiNZV8hO.p7x9djw087w/MhGHIBWgcatmPcT/xK', '096 774 2164', 'sadfec2131', '2014-06-10', 'Cambodian', '0', '2023-04-20_11-37-45am_photo_2023-03-24_07-30-11.jpg', '2023-04-20 11:37:46'),
(9, 'San SreyPich', 'sansreypich@gmail.com', '$2y$10$ZOlcVo2KzBfjCl9aHC0gKedmuV3692EeHkDpFEnYo/i/4/Pfj3Noi', '010886578', 'saf134', '2023-04-06', 'Cambodian', '0', '2023-04-20_11-43-23am_photo_2023-03-21_10-43-07.jpg', '2023-04-20 11:43:23');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
