-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2024 at 10:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookndine`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booked_by` varchar(255) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `num_persons` int(11) NOT NULL,
  `special_items` varchar(255) NOT NULL,
  `special_requests` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `booking_time` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `booking_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`booking_id`, `user_id`, `booked_by`, `hotel_id`, `booking_date`, `num_persons`, `special_items`, `special_requests`, `status`, `total_amount`, `created_at`, `booking_time`, `mobile_number`, `hotel_name`, `booking_status`) VALUES
(41, 104, 'vicky', 27, '2024-03-19', 4, 'Temple City Delight x 1, ', 'nill\n', 'Accepted', 4120, '2024-03-19 07:00:23', '9:00 AM', '8919370200', 'Temple City Spices', 1),
(42, 104, 'abc', 4, '2024-03-30', 3, '', 'none', '', 0, '2024-03-30 04:44:09', '7:00 PM', '123456789', 'Flavors of Chennai', 1),
(43, 104, 'vicky', 27, '2024-04-17', 3, '', 'none', 'Accepted', 2550, '2024-04-02 05:00:18', '12:00 PM', '3456789024', 'Temple City Spices', 1),
(44, 104, 'aswini', 3, '2024-04-04', 4, '', 'nothing', 'Rejected', 3400, '2024-04-02 05:08:29', '12:00 PM', '1234678890', 'Urban Bites', 1),
(45, 107, 'lenora', 4, '2024-04-03', 4, 'null', 'none', 'Accepted', 4700, '2024-04-02 09:42:08', '7:00 PM', '3456789024', 'Flavors of Chennai', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_details`
--

CREATE TABLE `hotel_details` (
  `hotel_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `price_per_person` decimal(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `address` varchar(255) DEFAULT NULL,
  `table_count` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_details`
--

INSERT INTO `hotel_details` (`hotel_id`, `location_id`, `hotel_name`, `price_per_person`, `created_at`, `address`, `table_count`) VALUES
(3, 1, 'Urban Bites', 850.00, '2023-11-29 02:59:32', '789, Urban Plaza, Chennai', 9),
(4, 1, 'Flavors of Chennai', 900.00, '2023-11-29 08:29:32', '321, Chennai Central Road, Chennai', 11),
(5, 1, 'Curry House', 950.00, '2023-11-29 08:29:32', '654, Curry Lane, Chennai', 20),
(6, 1, 'Sizzling Saffron', 1000.00, '2023-11-29 08:29:32', '987, Saffron Tower, Chennai', 20),
(7, 1, 'South Spice Treat', 1050.00, '2023-11-29 08:29:32', '210, South Spice Street, Chennai', 30),
(8, 1, 'Chennai Fusion Grill', 1100.00, '2023-11-29 08:29:32', '543, Fusion Plaza, Chennai', 10),
(10, 3, 'Temple Tastes', 800.00, '2023-11-29 08:38:23', '456, Temple Road, Madurai', 20),
(11, 3, 'Chettinad Spice Delight', 850.00, '2023-11-29 08:38:23', '789, Chettinad Nagar, Madurai', 12),
(12, 3, 'Madurai Masala Junction', 900.00, '2023-11-29 08:38:23', '321, Masala Lane, Madurai', 20),
(13, 3, 'Heritage Diner', 950.00, '2023-11-29 08:38:23', '654, Heritage Street, Madurai', 15),
(14, 3, 'Royal Chola Feast', 1000.00, '2023-11-29 08:38:23', '987, Chola Palace Road, Madurai', 18),
(15, 3, 'Thirumalai Thalapakatti Treat', 1050.00, '2023-11-29 08:38:23', '210, Thirumalai Nagar, Madurai', 12),
(16, 3, 'Madurai Mutton Magic', 1100.00, '2023-11-29 08:38:23', '543, Mutton Street, Madurai', 20),
(17, 2, 'Kovai Kitchen', 750.00, '2023-11-29 09:23:33', '123, R.S. Puram Street, Coimbatore', 10),
(18, 2, 'Nilgiri Nectar', 800.00, '2023-11-29 09:23:33', '456, Brookefields Avenue, Coimbatore', 20),
(19, 2, 'TexMex Treats', 850.00, '2023-11-29 09:23:33', '789, Peelamedu Road, Coimbatore', 22),
(20, 2, 'Peelamedu Palate', 900.00, '2023-11-29 09:23:33', '321, Gandhipuram Lane, Coimbatore', 12),
(21, 2, 'Siruvani Spice Haven', 950.00, '2023-11-29 09:23:33', '654, Siruvani Nagar, Coimbatore', 30),
(22, 2, 'Gandhipuram Grills', 1000.00, '2023-11-29 09:23:33', '987, Cross-Cut Road, Gandhipuram, Coimbatore', 30),
(23, 2, 'Ukkadam Urban Bites', 1050.00, '2023-11-29 09:23:33', '210, Ukkadam Street, Coimbatore', 40),
(24, 2, 'Singanallur Savors', 1150.00, '2023-11-29 09:23:33', '876, Singanallur Street, Coimbatore', 14),
(27, 4, 'Temple City Spices', 850.00, '2023-11-29 09:34:26', '789, Temple Street, Thiruvallur', 15),
(28, 4, 'Thiruvallur Delights Plaza', 900.00, '2023-11-29 09:34:26', '321, Delightful Avenue, Thiruvallur', 12),
(29, 4, 'Mango Tree Bites', 950.00, '2023-11-29 09:34:26', '654, Mango Grove, Thiruvallur', 18),
(30, 4, 'Royal Thiruvallur Feast', 1000.00, '2023-11-29 09:34:26', '987, Royal Road, Thiruvallur', 10),
(31, 4, 'Spicy Haven', 1050.00, '2023-11-29 09:34:26', '210, Spice Lane, Thiruvallur', 0),
(32, 4, 'Thiruvallur Fusion Grill', 1100.00, '2023-11-29 09:34:26', '543, Fusion Street, Thiruvallur', 0),
(33, 5, 'Kanchipuram Spice Palace', 750.00, '2023-12-07 06:44:47', '123, Temple Street, Kanchipuram', 0),
(34, 5, 'Silk Route Bites', 800.00, '2023-11-29 09:37:40', '456, Silk Road, Kanchipuram', 0),
(35, 5, 'Golden Temples Diner', 850.00, '2023-11-29 09:37:40', '789, Temple View Avenue, Kanchipuram', 0),
(36, 5, 'Kanchi Delights Plaza', 900.00, '2023-11-29 09:37:40', '321, Delightful Lane, Kanchipuram', 0),
(37, 5, 'Saree Savor', 950.00, '2023-11-29 09:37:40', '654, Saree Street, Kanchipuram', 0),
(38, 5, 'Royal Kanchipuram Feast', 1000.00, '2023-11-29 09:37:40', '987, Royal View Road, Kanchipuram', 0),
(39, 5, 'Silk Haven', 1050.00, '2023-11-29 09:37:40', '210, Silk Lane, Kanchipuram', 0),
(40, 5, 'Kanchipuram Fusion Grill', 1100.00, '2023-11-29 09:37:40', '543, Fusion Road, Kanchipuram', 0),
(41, 6, 'Trichy Spice Oasis', 750.00, '2023-11-29 09:41:00', '123, Oasis Street, Trichy', 0),
(42, 6, 'Rock Fort Bites', 800.00, '2023-11-29 09:41:00', '456, Rock Fort Road, Trichy', 0),
(43, 6, 'Golden Temple City Diner', 850.00, '2023-11-29 09:41:00', '789, Temple City View Avenue, Trichy', 0),
(44, 6, 'Trichy Delights Plaza', 900.00, '2023-11-29 09:41:00', '321, Delightful Fort Lane, Trichy', 0),
(45, 6, 'Cauvery Savor', 950.00, '2023-11-29 09:41:00', '654, Cauvery Street, Trichy', 0),
(46, 6, 'Royal Trichy Feast', 1000.00, '2023-11-29 09:41:00', '987, Royal Fort Road, Trichy', 0),
(47, 6, 'Fort Haven', 1050.00, '2023-11-29 09:41:00', '210, Fort Lane, Trichy', 0),
(48, 6, 'Trichy Fusion Grill', 1100.00, '2023-11-29 09:41:00', '543, Fusion Fort Road, Trichy', 0),
(53, 1, 'Delicous Barbeque ', 950.00, '2023-12-08 15:46:16', 'mohar nombu pottal road kattupillayar kovil street', 0),
(54, 4, 'Sennetta Restaurent', 850.00, '2023-12-08 15:53:48', 'Diwan narayana street', 0),
(55, 5, 'Junior Kuppana', 1050.00, '2023-12-11 03:04:01', 'Brevery Road, Anna Nagar', 0),
(56, 1, 'Ibrizz Kitchen', 950.00, '2023-12-11 18:37:02', 'Anna Salai, Madurai', 0),
(57, 1, 'Junior Karruvapillai', 950.00, '2023-12-14 06:30:12', 'Anna nagar, Chennai', 0),
(59, 1, 'Junior Karruvapillai', 950.00, '2023-12-14 06:50:42', 'Anna nagar, Chennai', 0),
(62, 1, 'food bites', 200.00, '2024-03-13 05:51:57', 'chennai', 0),
(63, 4, 'hello', 400.00, '2024-03-22 06:20:49', 'diwan narayana swammy,Thiruvallur ', 0),
(64, 4, 'hello', 400.00, '2024-03-22 06:25:37', 'diwan narayana swammy,Thiruvallur ', 0),
(65, 3, 'helloMadurai', 400.00, '2024-03-22 06:30:06', 'diwan narayana swammy,Thiruvallur ', 0),
(66, 3, 'helloMadurai', 400.00, '2024-03-22 06:30:43', 'diwan narayana swammy,Thiruvallur ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location_name`) VALUES
(1, 'Chennai'),
(2, 'Coimbatore'),
(3, 'Madurai'),
(4, 'Thiruvallur'),
(5, 'Kanchipuram'),
(6, 'Trichy'),
(7, 'Erode'),
(8, 'Salem');

-- --------------------------------------------------------

--
-- Table structure for table `special_items`
--

CREATE TABLE `special_items` (
  `special_item_id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `item_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_items`
--

INSERT INTO `special_items` (`special_item_id`, `hotel_id`, `item_name`, `item_price`, `created_at`, `item_description`) VALUES
(15, 3, 'Urban Sizzler', 530.00, '2023-11-30 12:23:14', 'A sizzling delight from Urban Bites'),
(16, 3, 'Flavorsome Surprise', 570.00, '2023-11-30 12:23:14', 'A flavorsome surprise from Chennai'),
(17, 4, 'Chennai Palate Pleaser', 540.00, '2023-11-30 17:53:14', 'A pleasing dish for the Chennai palate'),
(18, 4, 'Central Road Gourmet', 560.00, '2023-11-30 17:53:14', 'A gourmet experience from Chennai Central Road'),
(19, 5, 'Spicy Curry Surprise', 550.00, '2023-11-30 17:53:14', 'A spicy surprise from Curry House'),
(20, 5, 'Chennai Curry Delight', 590.00, '2023-11-30 17:53:14', 'A delightful curry specialty from Chennai'),
(21, 6, 'Saffron Spice Surprise', 560.00, '2023-11-30 17:53:14', 'A surprising spicy saffron treat'),
(22, 6, 'Chennai Saffron Delight', 540.00, '2023-11-30 17:53:14', 'A delightful saffron specialty from Chennai'),
(23, 7, 'South Spice Surprise', 550.00, '2023-11-30 17:53:14', 'A surprising spicy treat from South Spice'),
(24, 7, 'Chennai Spice Fusion', 590.00, '2023-11-30 17:53:14', 'A fusion of spices from Chennai South'),
(25, 8, 'Chennai Fusion Sizzler', 570.00, '2023-11-30 17:53:14', 'A sizzling fusion from Chennai'),
(26, 8, 'Fusion Plaza Delight', 580.00, '2023-11-30 17:53:14', 'A delightful fusion from Chennai Plaza'),
(29, 10, 'Temple Spice Delight', 520.00, '2023-11-30 17:54:24', 'A delightful spice from Temple Tastes'),
(30, 10, 'Madurai Temple Treat', 580.00, '2023-11-30 17:54:24', 'A treat with temple flavors from Madurai'),
(31, 11, 'Chettinad Surprise', 530.00, '2023-11-30 17:54:24', 'A surprising delight from Chettinad Spice Delight'),
(32, 11, 'Spicy Chettinad Fusion', 570.00, '2023-11-30 17:54:24', 'A fusion of spices from Chettinad'),
(33, 12, 'Masala Delight', 540.00, '2023-11-30 17:54:24', 'A delightful masala treat from Madurai Masala Junction'),
(34, 12, 'Madurai Masala Fusion', 560.00, '2023-11-30 17:54:24', 'A fusion of masala flavors from Madurai'),
(35, 13, 'Heritage Spice Surprise', 550.00, '2023-11-30 17:54:24', 'A surprising spicy heritage delight'),
(36, 13, 'Madurai Heritage Fusion', 590.00, '2023-11-30 17:54:24', 'A fusion of heritage flavors from Madurai'),
(37, 14, 'Royal Chola Surprise', 560.00, '2023-11-30 17:54:24', 'A surprising royal delight from Royal Chola Feast'),
(38, 14, 'Chola Palace Fusion', 540.00, '2023-11-30 17:54:24', 'A fusion of flavors from Chola Palace'),
(39, 15, 'Thalapakatti Spice Delight', 570.00, '2023-11-30 17:54:24', 'A delightful spice from Thirumalai Thalapakatti Treat'),
(40, 15, 'Madurai Thalapakatti Fusion', 580.00, '2023-11-30 17:54:24', 'A fusion of Thalapakatti flavors from Madurai'),
(41, 16, 'Mutton Magic Delight', 590.00, '2023-11-30 17:54:24', 'A delightful mutton magic from Madurai'),
(42, 16, 'Madurai Magic Fusion', 560.00, '2023-11-30 17:54:24', 'A fusion of magic flavors from Madurai'),
(43, 17, 'Kovai Kitchen Delight', 600.00, '2023-11-30 17:55:19', 'A delightful kitchen treat from Kovai Kitchen'),
(44, 17, 'Coimbatore Fusion Special', 620.00, '2023-11-30 17:55:19', 'A special fusion from Coimbatore'),
(45, 18, 'Nilgiri Nectar Surprise', 610.00, '2023-11-30 17:55:19', 'A surprising nectar delight from Nilgiri Nectar'),
(46, 18, 'Coimbatore Nectar Fusion', 630.00, '2023-11-30 17:55:19', 'A fusion of nectar flavors from Coimbatore'),
(47, 19, 'TexMex Delight', 620.00, '2023-11-30 17:55:19', 'A delightful TexMex treat from TexMex Treats'),
(48, 19, 'Coimbatore TexMex Fusion', 640.00, '2023-11-30 17:55:19', 'A fusion of TexMex flavors from Coimbatore'),
(49, 20, 'Peelamedu Spice Surprise', 630.00, '2023-11-30 17:55:19', 'A surprising spicy delight from Peelamedu Palate'),
(50, 20, 'Coimbatore Palate Fusion', 650.00, '2023-11-30 17:55:19', 'A fusion of palate flavors from Coimbatore'),
(51, 21, 'Siruvani Spice Delight', 640.00, '2023-11-30 17:55:19', 'A delightful spice from Siruvani Spice Haven'),
(52, 21, 'Coimbatore Spice Fusion', 660.00, '2023-11-30 17:55:19', 'A fusion of spice flavors from Coimbatore'),
(53, 22, 'Gandhipuram Grill Delight', 650.00, '2023-11-30 17:55:19', 'A delightful grill treat from Gandhipuram Grills'),
(54, 22, 'Coimbatore Grill Fusion', 670.00, '2023-11-30 17:55:19', 'A fusion of grill flavors from Coimbatore'),
(55, 23, 'Ukkadam Urban Delight', 660.00, '2023-11-30 17:55:19', 'A delightful urban treat from Ukkadam Urban Bites'),
(56, 23, 'Coimbatore Urban Fusion', 680.00, '2023-11-30 17:55:19', 'A fusion of urban flavors from Coimbatore'),
(57, 24, 'Singanallur Spice Delight', 670.00, '2023-11-30 17:55:19', 'A delightful spice from Singanallur Savors'),
(58, 24, 'Coimbatore Spice Fusion', 690.00, '2023-11-30 17:55:19', 'A fusion of spice flavors from Coimbatore'),
(63, 27, 'Temple City Delight', 720.00, '2023-11-30 17:55:19', 'A delightful temple treat from Temple City Spices'),
(64, 27, 'Thiruvallur Temple Fusion', 740.00, '2023-11-30 17:55:19', 'A fusion of temple flavors from Thiruvallur'),
(65, 28, 'Thiruvallur Plaza Special', 730.00, '2023-11-30 17:55:19', 'A special plaza treat from Thiruvallur Delights Plaza'),
(66, 28, 'Thiruvallur Plaza Fusion', 750.00, '2023-11-30 17:55:19', 'A fusion of plaza flavors from Thiruvallur'),
(67, 29, 'Mango Tree Delight', 740.00, '2023-11-30 17:55:19', 'A delightful mango treat from Mango Tree Bites'),
(68, 29, 'Thiruvallur Mango Fusion', 760.00, '2023-11-30 17:55:19', 'A fusion of mango flavors from Thiruvallur'),
(69, 30, 'Royal Thiruvallur Surprise', 750.00, '2023-11-30 17:55:19', 'A surprising royal delight from Royal Thiruvallur Feast'),
(70, 30, 'Thiruvallur Royal Fusion', 770.00, '2023-11-30 17:55:19', 'A fusion of royal flavors from Thiruvallur'),
(71, 31, 'Spicy Haven Delight', 760.00, '2023-11-30 17:55:19', 'A delightful spice from Spicy Haven'),
(72, 31, 'Thiruvallur Spicy Fusion', 780.00, '2023-11-30 17:55:19', 'A fusion of spicy flavors from Thiruvallur'),
(73, 32, 'Thiruvallur Grill Delight', 770.00, '2023-11-30 17:55:19', 'A delightful grill treat from Thiruvallur Fusion Grill'),
(74, 32, 'Thiruvallur Grill Fusion', 790.00, '2023-11-30 17:55:19', 'A fusion of grill flavors from Thiruvallur Fusion Grill'),
(77, 34, 'Silk Route Surprise', 810.00, '2023-11-30 17:57:07', 'A surprising silk delight from Silk Route Bites'),
(78, 34, 'Kanchipuram Silk Fusion', 830.00, '2023-11-30 17:57:07', 'A fusion of silk flavors from Kanchipuram'),
(79, 35, 'Golden Temples Delight', 820.00, '2023-11-30 17:57:07', 'A delightful temple treat from Golden Temples Diner'),
(80, 35, 'Kanchipuram Temple Fusion', 840.00, '2023-11-30 17:57:07', 'A fusion of temple flavors from Kanchipuram'),
(81, 36, 'Kanchipuram Plaza Special', 830.00, '2023-11-30 17:57:07', 'A special plaza treat from Kanchi Delights Plaza'),
(82, 36, 'Kanchipuram Plaza Fusion', 850.00, '2023-11-30 17:57:07', 'A fusion of plaza flavors from Kanchipuram'),
(83, 37, 'Saree Savor Delight', 840.00, '2023-11-30 17:57:07', 'A delightful saree treat from Saree Savor'),
(84, 37, 'Kanchipuram Saree Fusion', 860.00, '2023-11-30 17:57:07', 'A fusion of saree flavors from Kanchipuram'),
(85, 38, 'Royal Kanchipuram Surprise', 850.00, '2023-11-30 17:57:07', 'A surprising royal delight from Royal Kanchipuram Feast'),
(86, 38, 'Kanchipuram Royal Fusion', 870.00, '2023-11-30 17:57:07', 'A fusion of royal flavors from Kanchipuram'),
(87, 39, 'Silk Haven Delight', 860.00, '2023-11-30 17:57:07', 'A delightful silk treat from Silk Haven'),
(88, 39, 'Kanchipuram Silk Fusion', 880.00, '2023-11-30 17:57:07', 'A fusion of silk flavors from Kanchipuram'),
(89, 40, 'Kanchipuram Grill Delight', 870.00, '2023-11-30 17:57:07', 'A delightful grill treat from Kanchipuram Fusion Grill'),
(90, 40, 'Kanchipuram Grill Fusion', 890.00, '2023-11-30 17:57:07', 'A fusion of grill flavors from Kanchipuram Fusion Grill'),
(91, 41, 'Trichy Oasis Delight', 880.00, '2023-11-30 17:57:07', 'A delightful oasis treat from Trichy Spice Oasis'),
(92, 41, 'Trichy Oasis Fusion', 900.00, '2023-11-30 17:57:07', 'A fusion of oasis flavors from Trichy'),
(93, 42, 'Rock Fort Surprise', 890.00, '2023-11-30 17:57:07', 'A surprising rock fort delight from Rock Fort Bites'),
(94, 42, 'Trichy Rock Fort Fusion', 910.00, '2023-11-30 17:57:07', 'A fusion of rock fort flavors from Trichy'),
(95, 43, 'Golden Temple City Delight', 900.00, '2023-11-30 17:57:07', 'A delightful temple city treat from Golden Temple City Diner'),
(96, 43, 'Trichy Temple City Fusion', 920.00, '2023-11-30 17:57:07', 'A fusion of temple city flavors from Trichy'),
(97, 44, 'Trichy Plaza Special', 910.00, '2023-11-30 17:57:07', 'A special plaza treat from Trichy Delights Plaza'),
(98, 44, 'Trichy Plaza Fusion', 930.00, '2023-11-30 17:57:07', 'A fusion of plaza flavors from Trichy'),
(99, 45, 'Cauvery Savor Delight', 920.00, '2023-11-30 17:57:07', 'A delightful savor treat from Cauvery Savor'),
(100, 45, 'Trichy Cauvery Fusion', 940.00, '2023-11-30 17:57:07', 'A fusion of Cauvery flavors from Trichy'),
(101, 46, 'Royal Trichy Surprise', 930.00, '2023-11-30 17:57:07', 'A surprising royal delight from Royal Trichy Feast'),
(102, 46, 'Trichy Royal Fusion', 950.00, '2023-11-30 17:57:07', 'A fusion of royal flavors from Trichy'),
(103, 47, 'Fort Haven Delight', 940.00, '2023-11-30 17:57:07', 'A delightful fort treat from Fort Haven'),
(104, 47, 'Trichy Fort Fusion', 960.00, '2023-11-30 17:57:07', 'A fusion of fort flavors from Trichy'),
(105, 48, 'Trichy Grill Delight', 950.00, '2023-11-30 17:57:07', 'A delightful grill treat from Trichy Fusion Grill'),
(106, 48, 'Trichy Grill Fusion', 970.00, '2023-11-30 17:57:07', 'A fusion of grill flavors from Trichy Fusion Grill'),
(107, 53, 'Masala Prawn Fry', 180.00, '2023-12-08 15:46:16', 'A sizzling delight from Urban Bites'),
(108, 53, 'Royal chettinad Fusion', 200.00, '2023-12-08 15:46:16', 'A pleasing dish for the Delicious barbeque.'),
(109, 54, 'Litti chokha', 150.00, '2023-12-08 15:53:48', 'A spicy dish from Bihar that can be eaten at any time of day'),
(110, 54, 'Rogan Josh', 180.00, '2023-12-08 15:53:48', 'A snack from Gujarat made from gram flour and chana d'),
(111, 55, 'Coastal Spicy Bliss', 200.00, '2023-12-11 03:04:01', 'A blissful delight with coastal flavors from Kuppanna.'),
(112, 55, 'Royal chettinad Chicken fry', 250.00, '2023-12-11 03:04:01', 'A delightful curry specialty from Kanchipuram'),
(113, 56, 'Masala Heritage Spices', 180.00, '2023-12-11 18:37:02', 'Spices from Cettinad'),
(114, 56, 'Royal Heritage Fusion', 280.00, '2023-12-11 18:37:02', 'Fusion Plaza Delight with spices'),
(116, 57, 'Dragon Prawn Fry', 200.00, '2023-12-14 06:30:12', 'Delicious prawn with spicy'),
(117, 57, 'Royal Heritage Chicken', 260.00, '2023-12-14 06:30:12', 'Royal fusion from singaara chennai'),
(120, 59, 'Dragon Prawn Fry', 200.00, '2023-12-14 06:50:42', 'Delicious prawn with spicy'),
(121, 59, 'Royal Heritage Chicken', 260.00, '2023-12-14 06:50:42', 'Royal fusion from singaara chennai'),
(126, 62, 'juice', 50.00, '2024-03-13 05:51:57', 'fruit juices'),
(127, 62, 'sauce', 20.00, '2024-03-13 05:51:57', 'ketchup'),
(128, 63, 'Chicken Grill thandoori', 420.00, '2024-03-22 06:20:49', 'choclate with milkshake chicken'),
(129, 63, 'Pasta chicken', 366.00, '2024-03-22 06:20:49', 'spicy yummy yummy'),
(130, 64, 'Chicken Grill thandoori', 420.00, '2024-03-22 06:25:37', 'choclate with milkshake chicken'),
(131, 64, 'Pasta chicken', 366.00, '2024-03-22 06:25:37', 'spicy yummy yummy'),
(132, 65, 'Chicken Grill masala', 420.00, '2024-03-22 06:30:06', 'spicy yummy food'),
(133, 65, 'Pasta chicken fry', 123.00, '2024-03-22 06:30:06', 'yummy crispy chicken'),
(134, 66, 'Chicken Grill masala', 420.00, '2024-03-22 06:30:43', 'spicy yummy food'),
(135, 66, 'Pasta chicken fry', 123.00, '2024-03-22 06:30:43', 'yummy crispy chicken');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `gender` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `full_name`, `email`, `mobile`, `password_hash`, `role`, `created_at`, `gender`, `hotel_id`) VALUES
(3, 'Pradeep', 'pradeep2001eee@gmail.com', '8766876876', '$2y$10$nxcjmDgrnrSqmT98B6hkUOh5.3bwsG3fQr4Py1I3dARjHkIJLAio.', 0, '2023-11-26 05:56:00', 0, NULL),
(4, 'DeepaG', 'deeps360sugu@gmail.com', '8220743791', '$2y$10$.OdhwuIKDCGyCtGq1M8cbeQa5PkwJCZFEssUUGF5Dj1OPGQTxJzqO', 0, '2023-11-28 05:11:49', 1, NULL),
(5, 'Admin', 'admin0123@gmail.com', '9442858973', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 2, '2023-12-03 06:44:52', 0, NULL),
(54, 'Spice Haven', 'admin1@gmail.com', '1234567890', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 1, 1),
(55, 'Coastal Delight', 'admin2@gmail.com', '9876543210', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 2),
(56, 'Urban Bites', 'admin3@gmail.com', '1112223333', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 1, 3),
(57, 'Flavors of Chennai', 'admin4@gmail.com', '4445556666', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 4),
(58, 'Curry House', 'admin5@gmail.com', '7778889999', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 1, 5),
(59, 'Sizzling Saffron', 'admin6@gmail.com', '1231231234', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 6),
(60, 'South Spice Treat', 'admin7@gmail.com', '4564564567', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 7),
(61, 'Chennai Fusion Grill', 'admin8@gmail.com', '7897897890', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 1, 8),
(62, 'Meenakshi Bites', 'admin9@gmail.com', '9876543210', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 9),
(63, 'Temple Tastes', 'admin10@gmail.com', '1112223333', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 1, 10),
(64, 'Chettinad Spice Delight', 'admin11@gmail.com', '4445556666', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 11),
(65, 'Madurai Masala Junction', 'admin12@gmail.com', '7778889999', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 12),
(66, 'Heritage Diner', 'admin13@gmail.com', '1231231234', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 13),
(67, 'Royal Chola Feast', 'admin14@gmail.com', '4564564567', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 14),
(68, 'Thirumalai Thalapakatti Treat', 'admin15@gmail.com', '7897897890', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 15),
(69, 'Madurai Mutton Magic', 'admin16@gmail.com', '9876543210', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 16),
(70, 'Kovai Kitchen', 'admin17@gmail.com', '1112223333', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 17),
(71, 'Nilgiri Nectar', 'admin18@gmail.com', '4445556666', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 18),
(72, 'TexMex Treats', 'admin19@gmail.com', '7778889999', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 19),
(73, 'Peelamedu Palate', 'admin20@gmail.com', '1231231234', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 20),
(74, 'Siruvani Spice Haven', 'admin21@gmail.com', '4564564567', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 21),
(75, 'Gandhipuram Grills', 'admin22@gmail.com', '7897897890', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 22),
(76, 'Ukkadam Urban Bites', 'admin23@gmail.com', '9876543210', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 23),
(77, 'Singanallur Savors', 'admin24@gmail.com', '1112223333', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 24),
(78, 'Thiruvallur Taste Haven', 'admin25@gmail.com', '4445556666', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 25),
(79, 'Golden Grains Diner', 'admin26@gmail.com', '7778889999', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 26),
(80, 'Temple City Spices', 'admin27@gmail.com', '1110002222', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 27),
(81, 'Thiruvallur Delights Plaza', 'admin28@gmail.com', '3334445555', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 28),
(82, 'Mango Tree Bites', 'admin29@gmail.com', '5556667777', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 29),
(83, 'Royal Thiruvallur Feast', 'admin30@gmail.com', '8889990000', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 30),
(84, 'Spicy Haven', 'admin31@gmail.com', '1231231234', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 31),
(85, 'Thiruvallur Fusion Grill', 'admin32@gmail.com', '4564564567', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 32),
(86, 'Kanchipuram Spice Palace', 'admin33@gmail.com', '7897897890', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 33),
(87, 'Silk Route Bites', 'admin34@gmail.com', '9876543210', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 34),
(88, 'Golden Temples Diner', 'admin35@gmail.com', '1112223333', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 35),
(89, 'Kanchi Delights Plaza', 'admin36@gmail.com', '4445556666', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 36),
(90, 'Saree Savor', 'admin37@gmail.com', '7778889999', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 37),
(91, 'Royal Kanchipuram Feast', 'admin38@gmail.com', '1231231234', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 38),
(92, 'Silk Haven', 'admin39@gmail.com', '4564564567', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 39),
(93, 'Kanchipuram Fusion Grill', 'admin40@gmail.com', '7897897890', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 40),
(94, 'Trichy Spice Oasis', 'admin41@gmail.com', '9876543210', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 41),
(95, 'Rock Fort Bites', 'admin42@gmail.com', '1112223333', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 42),
(96, 'Golden Temple City Diner', 'admin43@gmail.com', '4445556666', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 43),
(97, 'Trichy Delights Plaza', 'admin44@gmail.com', '7778889999', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 1, 44),
(98, 'Cauvery Savor', 'admin45@gmail.com', '1231231234', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 45),
(99, 'Royal Trichy Feast', 'admin46@gmail.com', '4564564567', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 1, 46),
(100, 'Fort Haven', 'admin47@gmail.com', '7897897890', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 0, 47),
(101, 'Trichy Fusion Grill', 'admin48@gmail.com', '9876543210', '$2y$10$uVFRMtHlhfPbsRWRDVuibuNioEJ3RSOhjtBk1oUNpuYZhJzb3R7SO', 1, '2023-12-10 07:26:33', 1, 48),
(102, 'Vikas', 'bhanwarvikaskumar@gmail.com', '4538485908', '$2y$10$AXgNb5xilvvEgR0dWSHLhOT5RCsPkrF8NAsQZSDDo0p3TotHDuq5S', 0, '2023-12-11 08:03:50', 0, NULL),
(104, 'ashu', 'vikas0123@gmail.com', '8723456787', '$2y$10$kc8nvYw8FKRF415KhshXZu2.GR0RR8/yqPixLpgBrE4HckmmCxJ2y', 0, '2023-12-12 06:26:34', 1, NULL),
(105, 'Aswini', 'aswini123@gmail.com', '9573864524', '$2y$10$eCxrbR0n3rWlZ1mmDv3bFOlbbPe6ZyChv6PsCD4PAX3JFFrCNfpVy', 0, '2024-01-09 05:35:05', 1, NULL),
(107, 'lenora samuel', 'lenora@gmail.com', '12345678', '$2y$10$grUVlVXOTd/Zqx7aaeeUEOSp10z.rWQXQ86.FZplig89f6XwTjI1.', 0, '2024-04-02 09:40:03', 1, NULL),
(108, 'pavi', 'pavi@gmail.com', '9573864524', '$2y$10$dzNBcs3KGlAreNCFga7PyOcOxdIKDh1RV8Hd7NrsQaCZ9sRlwzAiy', 0, '2024-04-03 06:41:07', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `hotel_details`
--
ALTER TABLE `hotel_details`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `special_items`
--
ALTER TABLE `special_items`
  ADD PRIMARY KEY (`special_item_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `hotel_details`
--
ALTER TABLE `hotel_details`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `special_items`
--
ALTER TABLE `special_items`
  MODIFY `special_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_details_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_details` (`hotel_id`) ON DELETE CASCADE;

--
-- Constraints for table `hotel_details`
--
ALTER TABLE `hotel_details`
  ADD CONSTRAINT `hotel_details_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE;

--
-- Constraints for table `special_items`
--
ALTER TABLE `special_items`
  ADD CONSTRAINT `special_items_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_details` (`hotel_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
