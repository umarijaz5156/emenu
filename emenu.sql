-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 14, 2024 at 08:05 AM
-- Server version: 8.0.36
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emenu`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint UNSIGNED NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint UNSIGNED NOT NULL,
  `apartment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intercom` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` int NOT NULL DEFAULT '0' COMMENT '0 - Vendor, 1 - Blog',
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `page_id` bigint UNSIGNED DEFAULT NULL,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_storage`
--

CREATE TABLE `cart_storage` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `type` int NOT NULL,
  `receipt_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kds_finished` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restorant_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_index` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `restorant_id`, `created_at`, `updated_at`, `order_index`, `active`, `deleted_at`) VALUES
(95, '{\"en\":\"Grilled Chicken\"}', 61, '2023-12-17 16:47:27', '2023-12-20 16:08:28', 1, 1, '2023-12-20 16:08:28'),
(96, '{\"en\":\"Roasted Chicken\"}', 61, '2023-12-17 16:47:36', '2023-12-20 16:08:33', 2, 1, '2023-12-20 16:08:33'),
(97, '{\"en\":\"Chicken Wings\"}', 61, '2023-12-17 16:47:45', '2023-12-20 16:08:39', 3, 1, '2023-12-20 16:08:39'),
(98, '{\"en\":\"Classic Burgers\"}', 62, '2023-12-17 16:55:16', '2023-12-20 17:02:35', 1, 1, '2023-12-20 17:02:35'),
(99, '{\"en\":\"Gourmet Burgers\"}', 62, '2023-12-17 16:55:24', '2023-12-20 17:02:39', 2, 1, '2023-12-20 17:02:39'),
(100, '{\"en\":\"Classic Italian Favorites\"}', 63, '2023-12-17 17:02:45', '2023-12-20 18:21:39', 1, 1, '2023-12-20 18:21:39'),
(101, '{\"en\":\"Gourmet Pasta Creations\"}', 63, '2023-12-17 17:02:54', '2023-12-20 18:21:43', 2, 1, '2023-12-20 18:21:43'),
(102, '{\"en\":\"Vegetarian Delights\"}', 63, '2023-12-17 17:03:00', '2023-12-20 18:21:54', 3, 1, '2023-12-20 18:21:54'),
(103, '{\"en\":\"Classic Cocktails\"}', 64, '2023-12-17 17:05:24', '2023-12-20 19:06:21', 1, 1, '2023-12-20 19:06:21'),
(104, '{\"en\":\"Craft Beer Selection\"}', 64, '2023-12-17 17:05:33', '2023-12-20 19:06:26', 2, 1, '2023-12-20 19:06:26'),
(106, '{\"en\":\"Appetizers\",\"fr\":\"Appetizers\",\"eo\":\"Appetizers\",\"ga\":\"Appetizers\"}', 61, '2023-12-20 16:11:50', '2024-02-06 19:00:24', 2, 1, NULL),
(107, '{\"en\":\"Main Courses\",\"fr\":\"Main Courses\",\"eo\":\"Main Courses\",\"ga\":\"Main Courses\"}', 61, '2023-12-20 16:18:43', '2024-02-06 19:00:24', 1, 1, NULL),
(108, '{\"en\":\"Sides\",\"fr\":\"Sides\",\"eo\":\"Sides\",\"ga\":\"Sides\"}', 61, '2023-12-20 16:34:54', '2024-02-06 19:00:25', 3, 1, NULL),
(109, '{\"en\":\"Desserts\",\"fr\":\"Desserts\",\"eo\":\"Desserts\",\"ga\":\"Desserts\"}', 61, '2023-12-20 16:43:27', '2024-02-06 19:00:25', 4, 1, NULL),
(110, '{\"en\":\"Beverages\",\"fr\":\"Beverages\",\"eo\":\"Beverages\",\"ga\":\"Beverages\"}', 61, '2023-12-20 16:48:48', '2024-02-06 19:00:25', 5, 1, NULL),
(111, '{\"en\":\"Appetizers\"}', 62, '2023-12-20 17:03:24', '2023-12-20 17:03:24', 1, 1, NULL),
(112, '{\"en\":\"Main Courses\"}', 62, '2023-12-20 17:37:52', '2023-12-20 17:37:52', 2, 1, NULL),
(113, '{\"en\":\"Sides\"}', 62, '2023-12-20 17:51:22', '2023-12-20 17:51:22', 3, 1, NULL),
(114, '{\"en\":\"Desserts\"}', 62, '2023-12-20 18:06:49', '2023-12-20 18:06:49', 4, 1, NULL),
(115, '{\"en\":\"Beverages\"}', 62, '2023-12-20 18:11:06', '2023-12-20 18:11:06', 5, 1, NULL),
(116, '{\"en\":\"Antipasti\"}', 63, '2023-12-20 18:22:16', '2023-12-20 18:22:16', 1, 1, NULL),
(117, '{\"en\":\"Pasta Dishes\"}', 63, '2023-12-20 18:26:02', '2023-12-20 18:26:02', 2, 1, NULL),
(118, '{\"en\":\"Specialty Pastas\"}', 63, '2023-12-20 18:43:03', '2023-12-20 18:43:03', 3, 1, NULL),
(119, '{\"en\":\"Sides\"}', 63, '2023-12-20 18:46:13', '2023-12-20 18:46:13', 4, 1, NULL),
(120, '{\"en\":\"Desserts\"}', 63, '2023-12-20 18:49:56', '2023-12-20 18:49:56', 5, 1, NULL),
(121, '{\"en\":\"Beverages\"}', 63, '2023-12-20 18:53:35', '2023-12-20 18:53:35', 6, 1, NULL),
(122, '{\"en\":\"Classic Cocktails\"}', 64, '2023-12-20 19:06:41', '2023-12-20 19:06:41', 1, 1, NULL),
(123, '{\"en\":\"Special Cocktails\"}', 64, '2023-12-20 19:10:01', '2023-12-20 19:10:01', 2, 1, NULL),
(124, '{\"en\":\"Premium Spirits\"}', 64, '2023-12-20 19:14:08', '2024-01-29 04:30:02', 3, 1, '2024-01-29 04:30:02'),
(125, '{\"en\":\"Beers\"}', 64, '2023-12-20 19:17:47', '2024-01-29 04:30:32', 4, 1, NULL),
(126, '{\"en\":\"Non-Alcoholic Beverages\"}', 64, '2023-12-20 19:20:40', '2024-01-29 04:36:27', 6, 1, NULL),
(136, '{\"en\":\"Wine Selection\"}', 64, '2024-01-29 04:36:19', '2024-01-29 04:36:27', 5, 1, NULL),
(137, '{\"en\":\"Snacks and Appetizers\"}', 64, '2024-01-29 04:38:00', '2024-01-29 04:38:00', 7, 1, NULL),
(140, '{\"en\":\"MENUS\",\"fr\":\"MENUS\"}', 187, '2024-03-18 22:59:57', '2024-04-11 21:39:34', 1, 1, NULL),
(141, '{\"en\":\"ACCOMPAGNEMENTS\",\"fr\":\"ACCOMPAGNEMENTS\"}', 187, '2024-03-18 23:31:48', '2024-04-11 21:39:34', 5, 1, NULL),
(142, '{\"en\":\"GALETTES NAAN\",\"fr\":\"GALETTES NAAN\"}', 187, '2024-03-18 23:53:24', '2024-04-11 21:39:34', 2, 1, NULL),
(143, '{\"en\":\"PLATS TRADI\",\"fr\":\"PLATS TRADI\"}', 187, '2024-03-19 00:02:56', '2024-04-11 21:39:34', 3, 1, NULL),
(144, '{\"en\":\"PLATS VEGAN\",\"fr\":\"PLATS VEGAN\"}', 187, '2024-03-19 00:22:55', '2024-04-11 21:39:34', 4, 1, NULL),
(145, '{\"en\":\"BOISSONS\",\"fr\":\"BOISSONS\"}', 187, '2024-03-19 00:47:41', '2024-04-11 21:39:34', 6, 1, NULL),
(146, '{\"en\":\"DESSERTS\",\"fr\":\"DESSERTS\"}', 187, '2024-03-19 00:54:03', '2024-04-11 21:39:34', 7, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `name`, `alias`, `image`, `header_title`, `header_subtitle`, `deleted_at`) VALUES
(1, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Bronx', 'bx', 'https://foodtiger.mobidonia.com/uploads/settings/177686e2-8597-46e0-bf70-daa8d5ff0085_large.jpg', 'Food Delivery from<br /><strong>Bronx</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(2, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Brooklyn', 'br', 'https://foodtiger.mobidonia.com/uploads/settings/6d001b6c-2ba1-499e-9f57-09b7dc46ace3_large.jpg', 'Food Delivery from<br /><strong>Brooklyn</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(3, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Queens', 'qe', 'https://foodtiger.mobidonia.com/uploads/settings/492b78df-1756-4c30-910a-d3923b66aa97_large.jpg', 'Food Delivery from<br /><strong>Queens</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(4, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Manhattn', 'mh', 'https://foodtiger.mobidonia.com/uploads/settings/01f41f56-1acf-44f0-8e8d-fedceb5267cf_large.jpg', 'Food Delivery from<br /><strong>Manhattn</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(5, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Richmond', 'ri', 'https://foodtiger.mobidonia.com/uploads/settings/fe6c500b-3410-41ff-9734-94c58351ba60_large.jpg', 'Food Delivery from<br /><strong>Richmond</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(6, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Buffalo', 'bf', 'https://foodtiger.mobidonia.com/uploads/settings/0c3c8fb0-c252-4758-9699-6851b15796ef_large.jpg', 'Food Delivery from<br /><strong>Buffalo</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(7, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Rochester', 'rh', 'https://foodtiger.mobidonia.com/uploads/settings/c7f21267-7149-4311-9fd9-4a08904f67a3_large.jpg', 'Food Delivery from<br /><strong>Rochester</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(8, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Yonkers', 'yo', 'https://foodtiger.mobidonia.com/uploads/settings/8c65269a-3bbc-4899-be13-75d1bc35e9cd_large.jpg', 'Food Delivery from<br /><strong>Yonkers</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(9, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Syracuse', 'sy', 'https://foodtiger.mobidonia.com/uploads/settings/1e5fcde5-5dc0-4c29-8f49-314658836fb8_large.jpg', 'Food Delivery from<br /><strong>Syracuse</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(10, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Albany', 'al', 'https://foodtiger.mobidonia.com/uploads/settings/b521e77f-1d3e-4695-b871-bac8262c85dc_large.jpg', 'Food Delivery from<br /><strong>Albany</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(11, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'New Rochelle', 'nr', 'https://foodtiger.mobidonia.com/uploads/settings/8b3ebb83-2e2e-43dd-8747-4f9c6f451199_large.jpg', 'Food Delivery from<br /><strong>New Rochelle</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(12, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Mount Vernon', 'mv', 'https://foodtiger.mobidonia.com/uploads/settings/daecfb93-677f-43a9-9e7e-4cf109194399_large.jpg', 'Food Delivery from<br /><strong>Mount Vernon</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(13, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Schenectady', 'sc', 'https://foodtiger.mobidonia.com/uploads/settings/177686e2-8597-46e0-bf70-daa8d5ff0085_large.jpg', 'Food Delivery from<br /><strong>Schenectady</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(14, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Utica', 'ut', 'https://foodtiger.mobidonia.com/uploads/settings/507847c5-1896-4ecf-bfe8-9c5f198ce41e_large.jpg', 'Food Delivery from<br /><strong>Utica</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(15, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'White Plains', 'wp', 'https://foodtiger.mobidonia.com/uploads/settings/a8e96a74-dc3a-403c-8fd0-b4528838e98c_large.jpg', 'Food Delivery from<br /><strong>White Plains</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(16, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 'Niagara Falls', 'nf', 'https://foodtiger.mobidonia.com/uploads/settings/99d5b4c3-0bb4-428a-96cf-0e510bc3ab57_large.jpg', 'Food Delivery from<br /><strong>Niagara Falls</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subdomain` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cover` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint UNSIGNED NOT NULL,
  `lat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fee` double(8,2) NOT NULL DEFAULT '0.00',
  `static_fee` double(8,2) NOT NULL DEFAULT '0.00',
  `radius` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `city_id` int DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `can_pickup` int NOT NULL DEFAULT '1',
  `can_deliver` int NOT NULL DEFAULT '1',
  `self_deliver` int NOT NULL DEFAULT '0',
  `free_deliver` int NOT NULL DEFAULT '0',
  `whatsapp_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `do_covertion` int NOT NULL DEFAULT '1',
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_info` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mollie_payment_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `can_dinein` int NOT NULL DEFAULT '1',
  `show_price` int NOT NULL DEFAULT '1',
  `badge_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badge_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badge_3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badge_4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badge_5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GoogleReview` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TripAdvisor` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_count` int DEFAULT NULL,
  `staff_count` int DEFAULT NULL,
  `delivery_area_tax` double(8,2) NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `created_at`, `updated_at`, `name`, `subdomain`, `logo`, `cover`, `active`, `user_id`, `lat`, `lng`, `phone`, `minimum`, `description`, `fee`, `static_fee`, `radius`, `is_featured`, `city_id`, `views`, `can_pickup`, `can_deliver`, `self_deliver`, `free_deliver`, `whatsapp_phone`, `fb_username`, `do_covertion`, `currency`, `payment_info`, `mollie_payment_key`, `deleted_at`, `can_dinein`, `show_price`, `badge_1`, `badge_2`, `badge_3`, `badge_4`, `badge_5`, `GoogleReview`, `TripAdvisor`, `qr_count`, `staff_count`, `delivery_area_tax`, `address`, `city`, `zipcode`) VALUES
(32, '2023-09-14 17:47:19', '2023-09-15 18:50:27', 'helloworld', NULL, '', '', 0, 60, '0', '0', '+1023456789', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2023-09-15 18:50:27', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(61, '2023-12-17 16:45:27', '2024-04-18 22:28:04', 'Poultry Delight', 'demo1', '6c59d8e2-fe89-486a-8563-30a912381153', '22647f34-9ef6-4ebf-b549-fbaf81c659f5', 1, 88, '22.8004889', '89.5609739', '+1123456789', '10', 'Delight in Poultry Delight\'s succulent chicken and tantalizing turkey specialties.', 0.00, 0.00, '{}', 0, NULL, 426, 1, 1, 0, 0, NULL, NULL, 1, 'USD', '', '', NULL, 1, 1, 'badge_1_1710864150.png', 'badge_2_1710864150.jpg', 'badge_3_1710864210.png', NULL, NULL, 'https://business.google.com/reviews', 'https://www.tripadvisor.com/', 0, NULL, 0.00, NULL, NULL, NULL),
(62, '2023-12-17 16:54:10', '2024-04-18 18:18:52', 'Gastronomic Pleasures', 'demo2', '05973108-6345-45cc-be2a-5e26ea94367d', '51bb59b0-4ecc-46ad-a7b9-23223645e940', 1, 89, '22.8004889', '89.5609739', '+1123456789', '10', 'Savor the Symphony: Where Culinary Excellence Meets Artful Taste.', 0.00, 0.00, '{}', 0, NULL, 354, 1, 1, 0, 0, NULL, NULL, 1, 'EUR', '', '', NULL, 1, 1, 'badge_1_1710863811.jpg', 'badge_2_1710863811.png', 'badge_3_1710863811.jpg', NULL, NULL, 'https://business.google.com/reviews', 'https://www.tripadvisor.com/', 0, NULL, 0.00, NULL, NULL, NULL),
(63, '2023-12-17 17:01:21', '2024-04-24 05:26:45', 'Pasta Narrative', 'demo3', 'f7324ab0-2a41-4aa5-9c34-a56b43cdaa71', 'd0607c10-62a3-4e96-9314-f30f29227f00', 1, 90, '22.793638683999674', '89.56353617330329', '+1123456789', '0', 'Experience Italian authenticity food', 2.00, 0.20, '{}', 0, NULL, 362, 1, 1, 0, 0, NULL, NULL, 0, 'USD', '', '', NULL, 1, 1, 'badge_1_1710864115.png', 'badge_2_1710864115.png', NULL, NULL, NULL, NULL, NULL, 8, NULL, 0.00, NULL, NULL, NULL),
(64, '2023-12-17 17:04:08', '2024-04-18 18:19:20', 'The Old Crown Inn', 'demo4', '049424e6-fbc6-4220-bb1c-153ba713bcc1', '27c8fc6c-5954-46eb-9c3e-74b2b089e792', 1, 91, '22.8004889', '89.5609739', '+1123456789', '5', 'Step into history', 0.00, 0.00, '{}', 0, NULL, 284, 1, 1, 0, 0, NULL, NULL, 1, 'GBP', '', '', NULL, 1, 1, 'badge_1_1710861272.png', 'badge_2_1710862853.png', 'badge_3_1710864072.jpg', NULL, NULL, 'https://business.google.com/reviews', NULL, 3, NULL, 0.00, NULL, NULL, NULL),
(183, '2024-03-18 20:29:26', '2024-03-18 20:30:44', 'ditrahetri', 'ditrahetri', '', '', 1, 221, '0', '0', '1121132132132132', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(184, '2024-03-18 21:08:58', '2024-03-18 21:09:34', 'dfsgdfsg', 'dfsgdfsg', '', '', 1, 222, '0', '0', '12015550123', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(185, '2024-03-18 21:47:03', '2024-03-18 21:47:36', 'sfadkljlkfsda', 'sfadkljlkfsda', '', '', 1, 223, '0', '0', '12015550123', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(186, '2024-03-18 22:25:52', '2024-03-25 15:39:14', 'gdfsgds', 'gdfsgds', '', '', 0, 224, '0', '0', '12015550123', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-03-25 15:39:14', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(187, '2024-03-18 22:30:30', '2024-05-12 06:44:52', 'Lanka', 'lanka', '8821166c-c8e9-4354-9b6c-602bec1146be', '0d375d43-7611-48e7-a163-6878b19ca259', 1, 225, '13.747689', '107.657315', '+33478340169', '10', 'Good Indian Food', 5.25, 0.25, '{}', 1, NULL, 533, 1, 1, 0, 0, '+33652334244', NULL, 1, 'EUR', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 10.70, '34', 'Lyon', '69009'),
(188, '2024-03-19 16:29:12', '2024-03-25 15:39:09', 'test branding', 'testbranding', '', '', 0, 226, '0', '0', '11213123132123', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-03-25 15:39:09', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(189, '2024-03-22 16:17:09', '2024-03-25 15:39:06', 'ksjadfbfsadjkl', 'ksjadfbfsadjkl', '', '', 0, 227, '0', '0', '15616515454545', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-03-25 15:39:06', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(190, '2024-03-22 16:23:40', '2024-03-25 15:39:03', 'fdgsfgdsfg', 'fdgsfgdsfg', '', '', 0, 228, '0', '0', '16546546546546544', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-03-25 15:39:03', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(191, '2024-03-22 17:41:25', '2024-03-25 15:38:59', 'sadfsadf', 'sadfsadf', '', '', 0, 229, '0', '0', '380504751256', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-03-25 15:38:59', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(192, '2024-03-22 17:44:10', '2024-03-22 20:15:01', 'sadfsfafasd', 'sadfsfafasd', '', '', 0, 230, '0', '0', '+380977777777', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-03-22 20:15:01', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(193, '2024-04-18 17:08:50', '2024-04-18 17:08:50', 'Paypal Subscription test', 'paypalsubscriptiontest', '', '', 0, 232, '0', '0', '+330653334244', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL),
(194, '2024-04-27 11:10:35', '2024-04-27 11:10:35', 'himel bikodfgdfgn', 'himelbikodfgdfgn', '', '', 0, 233, '0', '0', '+88001457583450', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(195, '2024-04-27 12:57:31', '2024-05-06 11:55:31', 'himewerwerkon', 'himewerwerkon', '', '', 0, 234, '0', '0', '+88001735447580', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-05-06 11:55:31', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(196, '2024-04-28 05:58:00', '2024-04-28 05:58:00', 'himel bikonertert', 'himelbikonertert', '', '', 0, 235, '0', '0', '+88001735447456580', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(197, '2024-04-28 06:05:43', '2024-05-02 10:44:01', 'SK Himel Haqueffff', 'skhimelhaqueffff', '', '', 0, 236, '0', '0', '+88001972025117', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-05-02 10:44:01', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(198, '2024-04-28 06:06:58', '2024-04-28 06:06:58', 'himel bikonfghfgh', 'himelbikonfghfgh', '', '', 0, 237, '0', '0', '+88001735447564560', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(199, '2024-04-28 06:08:01', '2024-04-28 06:08:01', 'hfrty5r6u5hfghfggfbikon', 'hfrty5r6u5hfghfggfbikon', '', '', 0, 238, '0', '0', '+88001735447580', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(200, '2024-04-28 06:09:30', '2024-05-08 03:50:43', 'himel bikon4yerg14528fdg', 'himelbikon4yerg14528fdg', '', '', 0, 239, '0', '0', '+88001737567567566580', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-05-08 03:50:43', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(201, '2024-04-28 06:09:48', '2024-04-29 05:55:59', 'himel bikonrtuyrtyutyu', 'himelbikonrtuyrtyutyu', '', '', 0, 240, '0', '0', '+8801735-447560', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-04-29 05:55:59', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(202, '2024-04-28 06:21:59', '2024-04-29 05:55:52', 'himel bikon234y', 'himelbikon234y', '', '', 0, 241, '0', '0', '+88001735453580', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-04-29 05:55:52', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(203, '2024-04-30 10:31:30', '2024-05-06 11:55:46', 'himel biko897n', 'himelbiko897n', '', '', 0, 242, '0', '0', '+88001735447686', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-05-06 11:55:46', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL),
(204, '2024-05-02 06:22:00', '2024-05-06 11:55:38', 'himel bikondfgdfgdfgfgh', 'himelbikondfgdfgdfgfgh', '', '', 0, 243, '0', '0', '+88001735678447580', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL, NULL, 1, '', '', '', '2024-05-06 11:55:38', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `compare_plan_name`
--

CREATE TABLE `compare_plan_name` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_saving_eco` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `no_setup_cost` tinyint(1) NOT NULL,
  `eco_friendly` tinyint(1) NOT NULL,
  `boost_your_business` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cut_opt_cost` tinyint(1) NOT NULL,
  `detailed_reports` tinyint(1) NOT NULL,
  `increase_sales` tinyint(1) NOT NULL,
  `savings_foh` tinyint(1) NOT NULL,
  `order_limit` tinyint(1) NOT NULL DEFAULT '0',
  `unlimited_product` tinyint(1) NOT NULL,
  `order_management` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delivery_pick_dine` tinyint(1) NOT NULL,
  `payments_gateway` tinyint(1) NOT NULL,
  `data_analytics` tinyint(1) NOT NULL,
  `engage_delight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `connect_customers` tinyint(1) NOT NULL,
  `control_presence` tinyint(1) NOT NULL,
  `customer_supports` tinyint(1) NOT NULL,
  `collect_reviews` tinyint(1) NOT NULL,
  `elevate_dining` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_items` int NOT NULL DEFAULT '0',
  `browse_menu` tinyint(1) NOT NULL,
  `call_waiter` tinyint(1) NOT NULL,
  `create_dining_experience` tinyint(1) NOT NULL,
  `dynamic_pricing` tinyint(1) NOT NULL,
  `qr_code_menu` tinyint(1) NOT NULL,
  `quick_search` tinyint(1) NOT NULL,
  `unique_qr_code` int NOT NULL,
  `expand_your_service` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expand_features` tinyint(1) NOT NULL,
  `globalize_business` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom_domain` tinyint(1) NOT NULL,
  `menu_generator` tinyint(1) NOT NULL,
  `translation_languages` int NOT NULL,
  `menu_control` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `allergens` tinyint(1) NOT NULL,
  `menu_management` tinyint(1) NOT NULL,
  `operational_change` tinyint(1) NOT NULL,
  `adaptable_support` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `multiple_accounts` int NOT NULL,
  `support_tickets` tinyint(1) NOT NULL,
  `priority_support` tinyint(1) NOT NULL,
  `qr_scans` int NOT NULL,
  `design` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `suitable_business` tinyint(1) NOT NULL,
  `add_images` tinyint(1) NOT NULL,
  `add_logo` tinyint(1) NOT NULL,
  `customizable_design` tinyint(1) NOT NULL,
  `free_themes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Default',
  `instants_updates` tinyint(1) NOT NULL,
  `personalise_menu` tinyint(1) NOT NULL,
  `view_from_device` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compare_plan_name`
--

INSERT INTO `compare_plan_name` (`id`, `created_at`, `updated_at`, `plan_name`, `cost_saving_eco`, `no_setup_cost`, `eco_friendly`, `boost_your_business`, `cut_opt_cost`, `detailed_reports`, `increase_sales`, `savings_foh`, `order_limit`, `unlimited_product`, `order_management`, `delivery_pick_dine`, `payments_gateway`, `data_analytics`, `engage_delight`, `connect_customers`, `control_presence`, `customer_supports`, `collect_reviews`, `elevate_dining`, `add_items`, `browse_menu`, `call_waiter`, `create_dining_experience`, `dynamic_pricing`, `qr_code_menu`, `quick_search`, `unique_qr_code`, `expand_your_service`, `expand_features`, `globalize_business`, `custom_domain`, `menu_generator`, `translation_languages`, `menu_control`, `allergens`, `menu_management`, `operational_change`, `adaptable_support`, `multiple_accounts`, `support_tickets`, `priority_support`, `qr_scans`, `design`, `suitable_business`, `add_images`, `add_logo`, `customizable_design`, `free_themes`, `instants_updates`, `personalise_menu`, `view_from_device`) VALUES
(1, '0000-00-00 00:00:00', '2024-01-03 16:31:25', 'basic_plan', '[value-5]', 1, 1, '[value-8]', 1, 1, 1, 1, 0, 1, '[value-15]', 1, 1, 1, '[value-19]', 0, 1, 1, 0, '[value-24]', 0, 1, 1, 1, 1, 1, 1, 0, '[value-33]', 0, '[value-35]', 0, 1, 0, '[value-39]', 0, 1, 1, '[value-43]', 0, 1, 0, 0, '[value-48]', 1, 1, 1, 1, '', 1, 1, 1),
(2, '0000-00-00 00:00:00', '2024-01-03 16:31:25', 'premium_plan', '[value-5]', 1, 1, '[value-8]', 1, 1, 1, 1, 0, 1, '[value-15]', 1, 1, 1, '[value-19]', 1, 1, 1, 1, '[value-24]', 0, 1, 1, 1, 1, 1, 1, 0, '[value-33]', 0, '[value-35]', 1, 1, 0, '[value-39]', 0, 1, 1, '[value-43]', 0, 1, 1, 0, '[value-48]', 1, 1, 1, 1, '', 1, 1, 1),
(3, '0000-00-00 00:00:00', '2024-01-03 16:31:25', 'enterprise_plan', '[value-5]', 1, 1, '[value-8]', 1, 1, 1, 1, 0, 1, '[value-15]', 1, 1, 1, '[value-19]', 1, 1, 1, 1, '[value-24]', 0, 1, 1, 1, 1, 1, 1, 0, '[value-33]', 1, '[value-35]', 1, 1, 0, '[value-39]', 1, 1, 1, '[value-43]', 0, 1, 1, 0, '[value-48]', 1, 1, 1, 1, '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` bigint UNSIGNED NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `value`, `key`, `model_type`, `model_id`, `created_at`, `updated_at`) VALUES
(14, '[\"allergens\",\"coupons\",\"deliveryqr\",\"detrack\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"staff\",\"stock\",\"themeswitcher\",\"timezone\",\"webhooks\"]', 'plugins', 'App\\Plans', 1, '2023-06-30 14:22:07', '2024-04-11 21:38:57'),
(15, '[\"allergens\",\"clients\",\"coupons\",\"defaulttax\",\"deliveryqr\",\"detrack\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"orderdatetime\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"staff\",\"stock\",\"stripelinks\",\"timezone\",\"webhooks\"]', 'plugins', 'App\\Plans', 2, '2023-06-30 14:22:36', '2024-01-30 19:55:15'),
(16, '[\"allergenss\",\"clients\",\"coupons\",\"defaulttax\",\"deliveryqr\",\"detrack\",\"domain\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"orderdatetime\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"socialplatforms\",\"staff\",\"stock\",\"stripelinks\",\"themeswitcher\",\"timezone\",\"webhooks\"]', 'plugins', 'App\\Plans', 3, '2023-06-30 14:23:24', '2023-08-31 14:38:40'),
(28, NULL, 'dertack_app_id', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(29, NULL, 'domain', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(34, NULL, 'gt_list', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(36, NULL, 'impressum_value', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(38, NULL, 'manager_email', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(41, NULL, 'print_node_key', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(42, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(43, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(44, NULL, 'print_node_standard_id', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(48, NULL, 'print_templ_key', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(49, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(50, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(51, NULL, 'print_templ_standard_id', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(55, NULL, 'SendStatusTemplate1', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(56, NULL, 'SendStatusTemplate2', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(57, NULL, 'SendStatusTemplate3', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(58, NULL, 'SendStatusTemplate4', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(59, NULL, 'SendStatusTemplate5', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(60, NULL, 'facebook', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(61, NULL, 'twitter', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(62, NULL, 'youtube', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(63, NULL, 'instagram', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(64, NULL, 'website', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(68, NULL, 'webhook_url_by_admin', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(69, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 16, '2023-07-03 22:06:08', '2023-07-03 22:06:08'),
(80, NULL, 'dertack_app_id', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(81, NULL, 'domain', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 21:48:47'),
(86, NULL, 'gt_list', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(88, NULL, 'impressum_value', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(90, NULL, 'manager_email', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-25 14:39:50'),
(93, NULL, 'print_node_key', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(94, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(95, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(96, NULL, 'print_node_standard_id', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(100, NULL, 'print_templ_key', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(101, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(102, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(103, NULL, 'print_templ_standard_id', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(107, NULL, 'SendStatusTemplate1', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(108, NULL, 'SendStatusTemplate2', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(109, NULL, 'SendStatusTemplate3', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(110, NULL, 'SendStatusTemplate4', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(111, NULL, 'SendStatusTemplate5', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(114, NULL, 'youtube', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-07 19:13:16'),
(121, NULL, 'webhook_url_by_admin', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(122, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 17, '2023-07-04 19:18:16', '2023-07-04 19:18:16'),
(136, NULL, 'dertack_app_id', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(137, NULL, 'domain', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(142, NULL, 'gt_list', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(144, NULL, 'impressum_value', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(146, NULL, 'manager_email', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(149, NULL, 'print_node_key', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(150, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(151, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(152, NULL, 'print_node_standard_id', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(156, NULL, 'print_templ_key', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(157, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(158, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(159, NULL, 'print_templ_standard_id', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(163, NULL, 'SendStatusTemplate1', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(164, NULL, 'SendStatusTemplate2', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(165, NULL, 'SendStatusTemplate3', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(166, NULL, 'SendStatusTemplate4', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(167, NULL, 'SendStatusTemplate5', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(168, NULL, 'facebook', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(169, NULL, 'twitter', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(170, NULL, 'youtube', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(171, NULL, 'instagram', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(172, NULL, 'website', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(177, NULL, 'webhook_url_by_admin', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(178, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 18, '2023-07-05 15:36:46', '2023-07-05 15:36:46'),
(194, '[\"allergenss\",\"clients\",\"coupons\",\"defaulttax\",\"deliveryqr\",\"detrack\",\"domain\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"orderdatetime\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"socialplatforms\",\"staff\",\"stock\",\"stripelinks\",\"themeswitcher\",\"timezone\",\"webhooks\"]', 'plugins', 'App\\Plans', 4, '2023-08-07 17:31:20', '2023-08-31 14:40:06'),
(205, NULL, 'domain', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(208, NULL, 'gt_list', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(210, NULL, 'impressum_value', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(212, NULL, 'manager_email', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(215, NULL, 'SendStatusTemplate1', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(216, NULL, 'SendStatusTemplate2', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(217, NULL, 'SendStatusTemplate3', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(218, NULL, 'SendStatusTemplate4', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(219, NULL, 'SendStatusTemplate5', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(220, NULL, 'facebook', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(221, NULL, 'twitter', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(222, NULL, 'youtube', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(223, NULL, 'instagram', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(224, NULL, 'website', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(225, NULL, 'TripAdvisor', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(226, NULL, 'GoogleReview', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(229, NULL, 'webhook_url_by_admin', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(230, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 27, '2023-08-31 00:35:25', '2023-08-31 00:35:25'),
(233, '[\"allergens\",\"clients\",\"coupons\",\"defaulttax\",\"deliveryqr\",\"detrack\",\"domain\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"socialplatforms\",\"staff\",\"stock\",\"stripelinks\",\"themeswitcher\",\"timezone\",\"twilio\",\"webhooks\"]', 'plugins', 'App\\Plans', 5, '2023-08-31 14:41:46', '2024-03-20 17:16:38'),
(234, '[\"allergens\",\"clients\",\"coupons\",\"defaulttax\",\"deliveryqr\",\"detrack\",\"domain\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"orderdatetime\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"socialplatforms\",\"staff\",\"stock\",\"stripelinks\",\"themeswitcher\",\"timezone\",\"webhooks\"]', 'plugins', 'App\\Plans', 6, '2023-08-31 14:42:48', '2024-03-19 15:55:19'),
(235, '[\"allergens\",\"clients\",\"coupons\",\"defaulttax\",\"deliveryqr\",\"detrack\",\"domain\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"orderdatetime\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"socialplatforms\",\"staff\",\"stock\",\"stripelinks\",\"themeswitcher\",\"timezone\",\"webhooks\"]', 'plugins', 'App\\Plans', 7, '2023-08-31 14:44:59', '2024-03-11 21:38:07'),
(236, '[\"allergenss\",\"clients\",\"coupons\",\"defaulttax\",\"deliveryqr\",\"detrack\",\"domain\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"orderdatetime\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"socialplatforms\",\"staff\",\"stock\",\"stripelinks\",\"themeswitcher\",\"timezone\",\"webhooks\"]', 'plugins', 'App\\Plans', 8, '2023-08-31 14:47:28', '2023-08-31 14:47:28'),
(250, NULL, 'dertack_app_id', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(260, NULL, 'manager_email', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(263, NULL, 'print_node_key', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(264, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(265, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(266, NULL, 'print_node_standard_id', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(270, NULL, 'print_templ_key', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(271, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(272, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(273, NULL, 'print_templ_standard_id', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(292, NULL, 'webhook_url_by_admin', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(293, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 29, '2023-08-31 16:03:03', '2023-08-31 16:03:03'),
(297, 'LYON', 'delivery_area_name', 'App\\Order', 636, '2023-09-13 13:34:40', '2023-09-13 13:34:40'),
(298, 'LYON', 'delivery_area_name', 'App\\Order', 638, '2023-09-13 13:44:35', '2023-09-13 13:44:35'),
(299, 'LYON', 'delivery_area_name', 'App\\Order', 639, '2023-09-13 13:44:53', '2023-09-13 13:44:53'),
(300, 'LYON', 'delivery_area_name', 'App\\Order', 640, '2023-09-13 18:42:59', '2023-09-13 18:42:59'),
(301, 'LYON', 'delivery_area_name', 'App\\Order', 641, '2023-09-13 18:43:13', '2023-09-13 18:43:13'),
(302, 'LYON', 'delivery_area_name', 'App\\Order', 645, '2023-09-13 18:49:44', '2023-09-13 18:49:44'),
(303, 'LYON', 'delivery_area_name', 'App\\Order', 649, '2023-09-13 20:56:29', '2023-09-13 20:56:29'),
(304, 'LYON', 'delivery_area_name', 'App\\Order', 650, '2023-09-13 20:56:39', '2023-09-13 20:56:39'),
(307, 'LYON', 'delivery_area_name', 'App\\Order', 654, '2023-09-14 16:58:39', '2023-09-14 16:58:39'),
(312, 'LYON', 'delivery_area_name', 'App\\Order', 655, '2023-09-14 17:50:00', '2023-09-14 17:50:00'),
(313, 'villeurbanne', 'delivery_area_name', 'App\\Order', 656, '2023-09-14 17:56:55', '2023-09-14 17:56:55'),
(314, 'LYON', 'delivery_area_name', 'App\\Order', 659, '2023-09-15 13:25:12', '2023-09-15 13:25:12'),
(315, 'villeurbanne', 'delivery_area_name', 'App\\Order', 665, '2023-09-16 20:22:09', '2023-09-16 20:22:09'),
(316, 'villeurbanne', 'delivery_area_name', 'App\\Order', 669, '2023-09-16 20:41:58', '2023-09-16 20:41:58'),
(317, 'LYON', 'delivery_area_name', 'App\\Order', 675, '2023-09-17 18:16:23', '2023-09-17 18:16:23'),
(332, NULL, 'dertack_app_id', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(333, NULL, 'domain', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(338, NULL, 'gt_list', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(340, NULL, 'impressum_value', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(342, NULL, 'manager_email', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(345, NULL, 'print_node_key', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(346, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(347, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(348, NULL, 'print_node_standard_id', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(352, NULL, 'print_templ_key', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(353, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(354, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(355, NULL, 'print_templ_standard_id', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(359, NULL, 'SendStatusTemplate1', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(360, NULL, 'SendStatusTemplate2', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(361, NULL, 'SendStatusTemplate3', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(362, NULL, 'SendStatusTemplate4', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(363, NULL, 'SendStatusTemplate5', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(364, NULL, 'facebook', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(365, NULL, 'twitter', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(366, NULL, 'youtube', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(367, NULL, 'instagram', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(368, NULL, 'website', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(369, NULL, 'TripAdvisor', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(370, NULL, 'GoogleReview', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(374, NULL, 'webhook_url_by_admin', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(375, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 35, '2023-09-17 23:59:59', '2023-09-17 23:59:59'),
(376, 'LYON', 'delivery_area_name', 'App\\Order', 680, '2023-09-19 16:07:53', '2023-09-19 16:07:53'),
(377, 'LYON', 'delivery_area_name', 'App\\Order', 683, '2023-09-19 16:21:00', '2023-09-19 16:21:00'),
(378, 'villeurbanne (free area)', 'delivery_area_name', 'App\\Order', 684, '2023-09-19 18:53:55', '2023-09-19 18:53:55'),
(379, 'villeurbanne (free area)', 'delivery_area_name', 'App\\Order', 685, '2023-09-19 18:54:16', '2023-09-19 18:54:16'),
(380, 'villeurbanne (free area)', 'delivery_area_name', 'App\\Order', 686, '2023-09-19 19:01:29', '2023-09-19 19:01:29'),
(381, 'LYON', 'delivery_area_name', 'App\\Order', 696, '2023-09-21 03:06:43', '2023-09-21 03:06:43'),
(413, '[\"allergenss\",\"clients\",\"coupons\",\"defaulttax\",\"deliveryqr\",\"detrack\",\"domain\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"orderdatetime\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"socialplatforms\",\"staff\",\"stock\",\"stripelinks\",\"themeswitcher\",\"timezone\",\"webhooks\"]', 'plugins', 'App\\Plans', 9, '2023-11-10 17:56:37', '2023-11-10 17:57:02'),
(430, NULL, 'dertack_app_id', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(431, NULL, 'domain', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(436, NULL, 'gt_list', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(438, NULL, 'impressum_value', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(440, NULL, 'manager_email', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(443, NULL, 'print_node_key', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(444, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(445, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(446, NULL, 'print_node_standard_id', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(450, NULL, 'print_templ_key', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(451, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(452, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(453, NULL, 'print_templ_standard_id', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(457, NULL, 'SendStatusTemplate1', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(458, NULL, 'SendStatusTemplate2', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(459, NULL, 'SendStatusTemplate3', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(460, NULL, 'SendStatusTemplate4', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(461, NULL, 'SendStatusTemplate5', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(462, NULL, 'facebook', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(463, NULL, 'twitter', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(464, NULL, 'youtube', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(465, NULL, 'instagram', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(466, NULL, 'website', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(467, NULL, 'TripAdvisor', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(468, NULL, 'GoogleReview', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(472, NULL, 'webhook_url_by_admin', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(473, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 54, '2023-12-07 12:55:32', '2023-12-07 12:55:32'),
(502, NULL, 'dertack_app_id', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(503, NULL, 'domain', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(508, NULL, 'gt_list', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(510, NULL, 'impressum_value', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(512, NULL, 'manager_email', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(515, NULL, 'print_node_key', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(516, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(517, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(518, NULL, 'print_node_standard_id', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(522, NULL, 'print_templ_key', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(523, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(524, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(525, NULL, 'print_templ_standard_id', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(529, NULL, 'SendStatusTemplate1', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(530, NULL, 'SendStatusTemplate2', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(531, NULL, 'SendStatusTemplate3', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(532, NULL, 'SendStatusTemplate4', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(533, NULL, 'SendStatusTemplate5', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(534, 'https://www.facebook.com/', 'facebook', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2024-03-19 17:10:44'),
(535, NULL, 'twitter', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(536, 'https://www.youtube.com/', 'youtube', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2024-03-19 17:10:44'),
(537, 'https://www.instagram.com/', 'instagram', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2024-03-19 17:10:44'),
(538, NULL, 'website', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(539, 'https://www.tripadvisor.com/', 'TripAdvisor', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2024-03-19 17:10:44'),
(540, 'https://business.google.com/reviews', 'GoogleReview', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2024-03-19 17:10:44'),
(544, NULL, 'webhook_url_by_admin', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(545, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 61, '2023-12-17 16:50:17', '2023-12-17 16:50:17'),
(550, '10', 'delivery_interval_in_minutes', 'App\\Restorant', 62, '2023-12-17 16:54:54', '2023-12-17 17:09:16'),
(554, '5', 'time_to_prepare_order_in_minutes', 'App\\Restorant', 63, '2023-12-17 17:02:01', '2023-12-17 17:02:01'),
(559, '25', 'time_to_prepare_order_in_minutes', 'App\\Restorant', 64, '2023-12-17 17:05:02', '2023-12-17 17:05:02'),
(569, NULL, 'dertack_app_id', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(570, NULL, 'domain', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(575, NULL, 'gt_list', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(577, NULL, 'impressum_value', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(579, NULL, 'manager_email', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(582, NULL, 'print_node_key', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(583, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(584, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(585, NULL, 'print_node_standard_id', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(589, NULL, 'print_templ_key', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(590, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(591, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(592, NULL, 'print_templ_standard_id', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(596, NULL, 'SendStatusTemplate1', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(597, NULL, 'SendStatusTemplate2', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(598, NULL, 'SendStatusTemplate3', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(599, NULL, 'SendStatusTemplate4', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(600, NULL, 'SendStatusTemplate5', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(601, 'https://www.facebook.com/', 'facebook', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2024-03-19 17:05:29'),
(602, 'https://twitter.com/?lang=en', 'twitter', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2024-03-19 17:05:29'),
(603, 'https://www.youtube.com/', 'youtube', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2024-03-19 17:05:29'),
(604, 'https://www.instagram.com/', 'instagram', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2024-03-19 17:05:29'),
(605, NULL, 'website', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2024-04-13 15:57:29'),
(606, NULL, 'TripAdvisor', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(607, NULL, 'GoogleReview', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2024-04-13 15:57:29'),
(611, NULL, 'webhook_url_by_admin', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(612, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 63, '2023-12-17 17:07:26', '2023-12-17 17:07:26'),
(637, NULL, 'dertack_app_id', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(638, NULL, 'domain', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(643, NULL, 'gt_list', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(645, NULL, 'impressum_value', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(647, NULL, 'manager_email', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(650, NULL, 'print_node_key', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(651, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(652, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(653, NULL, 'print_node_standard_id', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(657, NULL, 'print_templ_key', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(658, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(659, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(660, NULL, 'print_templ_standard_id', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(664, NULL, 'SendStatusTemplate1', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(665, NULL, 'SendStatusTemplate2', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(666, NULL, 'SendStatusTemplate3', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(667, NULL, 'SendStatusTemplate4', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(668, NULL, 'SendStatusTemplate5', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(669, NULL, 'facebook', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(670, NULL, 'twitter', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(671, NULL, 'youtube', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(672, NULL, 'instagram', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(673, NULL, 'website', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(674, NULL, 'TripAdvisor', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(675, NULL, 'GoogleReview', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(679, NULL, 'account_sid', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(680, NULL, 'auth_token', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(681, NULL, 'from_number', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(682, NULL, 'webhook_url_by_admin', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(683, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 72, '2023-12-18 17:35:09', '2023-12-18 17:35:09'),
(692, NULL, 'dertack_app_id', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(693, NULL, 'domain', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(698, NULL, 'gt_list', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(700, NULL, 'impressum_value', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(702, NULL, 'manager_email', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(705, 'f-GgmOGK_R0Ys-bls7AqqCRSjl5Pi9H7Ze58eXL6EMQ', 'print_node_key', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2024-03-28 14:19:43'),
(706, '73047695', 'print_node_main_thermal_id', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2024-03-28 14:19:43'),
(707, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(708, NULL, 'print_node_standard_id', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(712, NULL, 'print_templ_key', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(713, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(714, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(715, NULL, 'print_templ_standard_id', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(719, NULL, 'SendStatusTemplate1', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(720, NULL, 'SendStatusTemplate2', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(721, NULL, 'SendStatusTemplate3', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(722, NULL, 'SendStatusTemplate4', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(723, NULL, 'SendStatusTemplate5', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(724, 'https://www.facebook.com/', 'facebook', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2024-03-19 15:56:55'),
(725, 'https://twitter.com/?lang=en', 'twitter', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2024-03-19 15:56:55'),
(726, 'https://www.youtube.com/', 'youtube', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2024-03-19 15:56:55'),
(727, 'https://www.instagram.com/', 'instagram', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2024-03-19 15:56:55'),
(728, 'www.poultrydemosolutions.com', 'website', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2024-03-19 17:11:46'),
(729, NULL, 'TripAdvisor', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(730, 'https://business.google.com/reviews', 'GoogleReview', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2024-03-19 17:11:46'),
(734, NULL, 'webhook_url_by_admin', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(735, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 64, '2023-12-18 18:04:40', '2023-12-18 18:04:40'),
(736, NULL, 'account_sid', 'App\\Restorant', 29, '2023-12-18 18:09:54', '2023-12-18 18:09:54'),
(737, NULL, 'auth_token', 'App\\Restorant', 29, '2023-12-18 18:09:54', '2023-12-18 18:09:54'),
(738, NULL, 'from_number', 'App\\Restorant', 29, '2023-12-18 18:09:54', '2023-12-18 18:09:54'),
(758, NULL, 'dertack_app_id', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(764, NULL, 'gt_list', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(766, NULL, 'impressum_value', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(768, NULL, 'manager_email', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(774, NULL, 'print_node_standard_id', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2024-02-08 20:42:04'),
(778, NULL, 'print_templ_key', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(779, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(780, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(781, NULL, 'print_templ_standard_id', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(785, NULL, 'SendStatusTemplate1', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(786, NULL, 'SendStatusTemplate2', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(787, NULL, 'SendStatusTemplate3', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(788, NULL, 'SendStatusTemplate4', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(789, NULL, 'SendStatusTemplate5', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(790, NULL, 'facebook', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-26 00:54:07'),
(791, NULL, 'twitter', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-26 00:54:07'),
(792, NULL, 'youtube', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(794, NULL, 'website', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(795, NULL, 'TripAdvisor', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(796, NULL, 'GoogleReview', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(800, NULL, 'webhook_url_by_admin', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(801, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 76, '2023-12-21 21:29:56', '2023-12-21 21:29:56'),
(828, NULL, 'account_sid', 'App\\Restorant', 76, '2023-12-26 02:15:04', '2023-12-26 02:15:04'),
(829, NULL, 'auth_token', 'App\\Restorant', 76, '2023-12-26 02:15:04', '2023-12-26 02:15:04'),
(830, NULL, 'from_number', 'App\\Restorant', 76, '2023-12-26 02:15:04', '2023-12-26 02:15:04'),
(850, '83a02c09-4747-4ad9-890a-8d7de6dfd06e', 'resto_wide_logo', 'App\\Restorant', 61, '2024-01-29 00:38:57', '2024-03-29 18:03:28'),
(851, 'Europe/London', 'time_zone', 'App\\Restorant', 61, '2024-01-29 01:25:13', '2024-03-18 16:29:36'),
(859, NULL, 'dertack_app_id', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(864, NULL, 'gt_list', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(866, NULL, 'impressum_value', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(868, NULL, 'manager_email', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(871, NULL, 'print_node_key', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(872, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(873, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(874, NULL, 'print_node_standard_id', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(878, NULL, 'print_templ_key', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(879, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(880, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(881, NULL, 'print_templ_standard_id', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(885, NULL, 'SendStatusTemplate1', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(886, NULL, 'SendStatusTemplate2', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(887, NULL, 'SendStatusTemplate3', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(888, NULL, 'SendStatusTemplate4', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(889, NULL, 'SendStatusTemplate5', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(893, NULL, 'webhook_url_by_admin', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(894, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 62, '2024-01-29 01:37:02', '2024-01-29 01:37:02'),
(895, '0413c627-bea5-4242-96e9-4138b926e75d', 'resto_wide_logo', 'App\\Restorant', 62, '2024-01-29 01:37:46', '2024-04-09 20:07:46'),
(896, '4d878d7a-1f60-4c78-9cb0-4ef9924839df', 'resto_wide_logo_dark', 'App\\Restorant', 62, '2024-01-29 01:37:46', '2024-04-09 20:07:46'),
(897, '1df603f8-a14a-414f-895f-966b325c6cb5', 'resto_wide_logo', 'App\\Restorant', 63, '2024-01-29 02:04:05', '2024-03-29 18:22:39'),
(898, '7d0c23a9-92fc-4f13-b240-bc4e5942de83', 'resto_wide_logo_dark', 'App\\Restorant', 63, '2024-01-29 02:04:05', '2024-03-29 18:22:39'),
(899, '69b0c44a-0fb4-4331-ac89-88c2ee12a190', 'resto_wide_logo', 'App\\Restorant', 64, '2024-01-29 04:48:09', '2024-03-29 17:56:32'),
(900, 'f93a6216-2b59-4df1-9b79-7f238a3c7b28', 'resto_wide_logo_dark', 'App\\Restorant', 64, '2024-01-29 04:48:09', '2024-03-29 17:56:32'),
(901, 'Europe/London', 'time_zone', 'App\\Restorant', 64, '2024-01-29 04:49:53', '2024-01-29 04:49:53'),
(929, NULL, 'flutterwave_public_key', 'App\\Restorant', 63, '2024-02-01 14:10:33', '2024-02-01 14:10:33'),
(931, NULL, 'flutterwave_public_key', 'App\\Restorant', 76, '2024-02-01 15:35:02', '2024-02-01 15:35:02'),
(938, NULL, 'plugins', 'App\\Plans', 11, '2024-02-01 21:32:17', '2024-02-01 21:32:17'),
(1009, NULL, 'flutterwave_public_key', 'App\\Restorant', 29, '2024-02-09 18:36:50', '2024-02-09 18:36:50'),
(1023, 'Central District', 'delivery_area_name', 'App\\Order', 755, '2024-02-14 20:41:46', '2024-02-14 20:41:46'),
(1024, 'Central District', 'delivery_area_name', 'App\\Order', 756, '2024-02-14 20:49:51', '2024-02-14 20:49:51'),
(1025, 'Central District', 'delivery_area_name', 'App\\Order', 759, '2024-02-15 22:35:15', '2024-02-15 22:35:15'),
(1064, '[\"allergens\"]', 'plugins', 'App\\Plans', 12, '2024-02-29 19:37:06', '2024-02-29 19:37:06'),
(1065, '[\"allergens\"]', 'plugins', 'App\\Plans', 13, '2024-02-29 20:56:48', '2024-02-29 20:56:48'),
(1096, NULL, 'flutterwave_public_key', 'App\\Restorant', 64, '2024-03-08 17:45:22', '2024-03-08 17:45:22'),
(1111, 'glow', 'menu_template', 'App\\Restorant', 64, '2024-03-08 17:45:22', '2024-03-26 16:20:20'),
(1121, NULL, 'flutterwave_public_key', 'App\\Restorant', 62, '2024-03-08 17:50:04', '2024-03-08 17:50:04'),
(1136, 'glow', 'menu_template', 'App\\Restorant', 62, '2024-03-08 17:50:04', '2024-03-08 17:50:04'),
(1149, '[\"allergens\"]', 'plugins', 'App\\Plans', 14, '2024-03-11 12:11:16', '2024-03-11 12:12:02'),
(1196, NULL, 'flutterwave_public_key', 'App\\Restorant', 61, '2024-03-18 16:29:36', '2024-03-18 16:29:36'),
(1210, 'glow', 'menu_template', 'App\\Restorant', 61, '2024-03-18 16:29:36', '2024-03-20 23:01:45'),
(1247, '0', 'disable_callwaiter', 'App\\Restorant', 183, '2024-03-18 20:29:26', '2024-03-18 20:29:26'),
(1248, '0', 'disable_ordering', 'App\\Restorant', 183, '2024-03-18 20:29:26', '2024-03-18 20:29:26'),
(1249, '0', 'disable_callwaiter', 'App\\Restorant', 184, '2024-03-18 21:08:58', '2024-03-18 21:08:58'),
(1250, '0', 'disable_ordering', 'App\\Restorant', 184, '2024-03-18 21:08:58', '2024-03-18 21:08:58'),
(1251, '0', 'disable_callwaiter', 'App\\Restorant', 185, '2024-03-18 21:47:03', '2024-03-18 21:47:03'),
(1252, '0', 'disable_ordering', 'App\\Restorant', 185, '2024-03-18 21:47:03', '2024-03-18 21:47:03'),
(1253, '0', 'disable_callwaiter', 'App\\Restorant', 186, '2024-03-18 22:25:52', '2024-03-18 22:25:52'),
(1254, '0', 'disable_ordering', 'App\\Restorant', 186, '2024-03-18 22:25:52', '2024-03-18 22:25:52'),
(1255, '1', 'disable_callwaiter', 'App\\Restorant', 187, '2024-03-18 22:30:30', '2024-03-20 23:15:39'),
(1256, '0', 'disable_ordering', 'App\\Restorant', 187, '2024-03-18 22:30:30', '2024-03-18 22:30:30'),
(1257, '1', 'disable_continues_ordering', 'App\\Restorant', 187, '2024-03-18 22:57:53', '2024-03-18 22:57:53'),
(1258, '5da7fd5b-d81c-48c1-82f2-88e62ff79803', 'resto_wide_logo', 'App\\Restorant', 187, '2024-03-18 22:57:53', '2024-03-31 01:34:24'),
(1259, '0', 'time_to_prepare_order_in_minutes', 'App\\Restorant', 187, '2024-03-18 22:57:54', '2024-03-18 22:57:54'),
(1260, '10', 'delivery_interval_in_minutes', 'App\\Restorant', 187, '2024-03-18 22:57:54', '2024-03-22 16:49:28'),
(1261, 'true', 'allergens_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1262, 'false', 'clients_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1263, 'true', 'couons_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1264, '10', 'default_tax_value', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1265, 'false', 'hide_tax_input', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1266, 'true', 'deliveryaeras_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1267, 'false', 'detrack_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1268, 'true', 'detrack_public', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1269, NULL, 'dertack_app_id', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1270, NULL, 'domain', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-27 14:36:04'),
(1271, 'true', 'drivers_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1272, 'true', 'expenses_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1273, 'false', 'flutterwave_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1274, NULL, 'flutterwave_public_key', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1275, 'false', 'gt_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1276, 'true', 'gt_all', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1277, NULL, 'gt_list', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1278, 'Impressum', 'impressum_title', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1279, NULL, 'impressum_value', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1280, 'true', 'kds_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1281, NULL, 'manager_email', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1282, 'false', 'order_date_time_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-05-08 07:45:12'),
(1283, 'true', 'always_order_date_time_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-21 19:19:27'),
(1284, NULL, 'print_node_key', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-04-21 11:27:08'),
(1285, NULL, 'print_node_main_thermal_id', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-04-21 11:27:08'),
(1286, NULL, 'print_node_kitchen_thermal_id', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1287, NULL, 'print_node_standard_id', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1288, 'restaurant_approve', 'printnode_print_afour_when', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-21 21:50:53'),
(1289, 'order_received', 'printnode_print_main_thermal_when', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-21 21:50:53'),
(1290, 'order_received', 'printnode_print_kitchen_thermal_when', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-22 19:38:05'),
(1291, NULL, 'print_templ_key', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1292, NULL, 'print_templ_main_thermal_id', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1293, NULL, 'print_templ_kitchen_thermal_id', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1294, NULL, 'print_templ_standard_id', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1295, 'order_received', 'printtempl_print_afour_when', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1296, 'order_received', 'printtempl_print_main_thermal_when', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-22 17:00:38'),
(1297, 'order_received', 'printtempl_print_kitchen_thermal_when', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-22 19:38:05'),
(1298, NULL, 'SendStatusTemplate1', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1299, NULL, 'SendStatusTemplate2', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1300, NULL, 'SendStatusTemplate3', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1301, NULL, 'SendStatusTemplate4', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1302, NULL, 'SendStatusTemplate5', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1303, 'true', 'staff_enable', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1304, 'false', 'stock_enabled', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1305, 'glow', 'menu_template', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-05-12 03:17:22'),
(1306, NULL, 'webhook_url_by_admin', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1307, NULL, 'webhook_url_by_vendor', 'App\\Restorant', 187, '2024-03-18 23:33:16', '2024-03-18 23:33:16'),
(1308, 'true', 'allergens_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1309, 'false', 'clients_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1310, 'true', 'couons_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1311, '18', 'default_tax_value', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1312, 'false', 'hide_tax_input', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1313, 'true', 'deliveryaeras_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1314, 'false', 'detrack_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1315, 'true', 'detrack_public', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1316, 'true', 'drivers_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1317, 'true', 'expenses_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1318, 'false', 'flutterwave_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1319, 'true', 'gt_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-20 14:45:31'),
(1320, 'true', 'gt_all', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55');
INSERT INTO `configs` (`id`, `value`, `key`, `model_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1321, 'Impressum', 'impressum_title', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1322, 'true', 'kds_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1323, 'true', 'order_date_time_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-28 14:15:19'),
(1324, 'true', 'always_order_date_time_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-28 14:15:19'),
(1325, 'order_received', 'printnode_print_afour_when', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1326, 'restaurant_approve', 'printnode_print_main_thermal_when', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1327, 'restaurant_approve', 'printnode_print_kitchen_thermal_when', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1328, 'order_received', 'printtempl_print_afour_when', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1329, 'restaurant_approve', 'printtempl_print_main_thermal_when', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1330, 'restaurant_approve', 'printtempl_print_kitchen_thermal_when', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1331, 'true', 'staff_enable', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1332, 'false', 'stock_enabled', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1333, NULL, 'account_sid', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1334, NULL, 'auth_token', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1335, NULL, 'from_number', 'App\\Restorant', 64, '2024-03-19 15:56:55', '2024-03-19 15:56:55'),
(1336, '0', 'disable_callwaiter', 'App\\Restorant', 188, '2024-03-19 16:29:12', '2024-03-19 16:29:12'),
(1337, '0', 'disable_ordering', 'App\\Restorant', 188, '2024-03-19 16:29:12', '2024-03-19 16:29:12'),
(1338, 'true', 'allergens_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1339, 'false', 'clients_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1340, 'true', 'couons_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1341, '18', 'default_tax_value', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1342, 'false', 'hide_tax_input', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1343, 'true', 'deliveryaeras_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1344, 'false', 'detrack_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1345, 'true', 'detrack_public', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1346, 'true', 'drivers_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1347, 'true', 'expenses_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1348, 'false', 'flutterwave_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1349, 'true', 'gt_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-20 14:45:54'),
(1350, 'true', 'gt_all', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1351, 'Impressum', 'impressum_title', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1352, 'true', 'kds_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1353, 'true', 'order_date_time_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-22 19:17:42'),
(1354, 'true', 'always_order_date_time_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-22 19:17:42'),
(1355, 'order_received', 'printnode_print_afour_when', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1356, 'restaurant_approve', 'printnode_print_main_thermal_when', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1357, 'restaurant_approve', 'printnode_print_kitchen_thermal_when', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1358, 'order_received', 'printtempl_print_afour_when', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1359, 'restaurant_approve', 'printtempl_print_main_thermal_when', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1360, 'restaurant_approve', 'printtempl_print_kitchen_thermal_when', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1361, 'true', 'staff_enable', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1362, 'false', 'stock_enabled', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1363, 'defaulttemplate', 'menu_template', 'App\\Restorant', 63, '2024-03-19 17:05:29', '2024-03-19 17:05:29'),
(1364, 'true', 'allergens_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1365, 'false', 'clients_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1366, 'true', 'couons_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1367, '18', 'default_tax_value', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1368, 'false', 'hide_tax_input', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1369, 'true', 'deliveryaeras_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1370, 'false', 'detrack_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1371, 'true', 'detrack_public', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1372, NULL, 'domain', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1373, 'true', 'drivers_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1374, 'true', 'expenses_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1375, 'false', 'flutterwave_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1376, 'true', 'gt_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-20 14:46:46'),
(1377, 'true', 'gt_all', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1378, 'Impressum', 'impressum_title', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1379, 'true', 'kds_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-19 17:08:53'),
(1380, 'true', 'order_date_time_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-22 19:23:03'),
(1381, 'true', 'always_order_date_time_enable', 'App\\Restorant', 62, '2024-03-19 17:08:53', '2024-03-22 19:23:03'),
(1382, 'order_received', 'printnode_print_afour_when', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1383, 'restaurant_approve', 'printnode_print_main_thermal_when', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1384, 'restaurant_approve', 'printnode_print_kitchen_thermal_when', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1385, 'order_received', 'printtempl_print_afour_when', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1386, 'restaurant_approve', 'printtempl_print_main_thermal_when', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1387, 'restaurant_approve', 'printtempl_print_kitchen_thermal_when', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1388, 'https://www.facebook.com/', 'facebook', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1389, 'https://twitter.com/?lang=en', 'twitter', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1390, 'https://www.youtube.com/', 'youtube', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1391, 'https://www.instagram.com/', 'instagram', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1392, NULL, 'website', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1393, 'https://www.tripadvisor.com/', 'TripAdvisor', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1394, 'https://business.google.com/reviews', 'GoogleReview', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1395, 'true', 'staff_enable', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1396, 'false', 'stock_enabled', 'App\\Restorant', 62, '2024-03-19 17:08:54', '2024-03-19 17:08:54'),
(1397, 'true', 'allergens_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1398, 'false', 'clients_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1399, 'true', 'couons_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1400, '18', 'default_tax_value', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1401, 'false', 'hide_tax_input', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1402, 'true', 'deliveryaeras_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1403, 'false', 'detrack_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1404, 'true', 'detrack_public', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1405, 'true', 'drivers_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1406, 'true', 'expenses_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1407, 'false', 'flutterwave_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1408, 'true', 'gt_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-20 14:47:13'),
(1409, 'true', 'gt_all', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-20 23:00:50'),
(1410, 'Impressum', 'impressum_title', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1411, 'true', 'kds_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1412, 'true', 'order_date_time_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-22 19:23:45'),
(1413, 'true', 'always_order_date_time_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-22 19:23:45'),
(1414, 'order_received', 'printnode_print_afour_when', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1415, 'restaurant_approve', 'printnode_print_main_thermal_when', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1416, 'restaurant_approve', 'printnode_print_kitchen_thermal_when', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1417, 'order_received', 'printtempl_print_afour_when', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1418, 'restaurant_approve', 'printtempl_print_main_thermal_when', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1419, 'restaurant_approve', 'printtempl_print_kitchen_thermal_when', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1420, 'true', 'staff_enable', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1421, 'false', 'stock_enabled', 'App\\Restorant', 61, '2024-03-19 17:10:44', '2024-03-19 17:10:44'),
(1422, '0', 'disable_callwaiter', 'App\\Restorant', 61, '2024-03-19 22:02:32', '2024-03-19 22:02:32'),
(1423, '0', 'disable_ordering', 'App\\Restorant', 61, '2024-03-19 22:02:32', '2024-03-19 22:02:32'),
(1424, '0', 'disable_continues_ordering', 'App\\Restorant', 61, '2024-03-19 22:02:32', '2024-03-19 22:02:32'),
(1425, '0', 'time_to_prepare_order_in_minutes', 'App\\Restorant', 61, '2024-03-19 22:02:32', '2024-03-19 22:02:32'),
(1426, '30', 'delivery_interval_in_minutes', 'App\\Restorant', 61, '2024-03-19 22:02:32', '2024-03-19 22:02:32'),
(1427, NULL, 'facebook', 'App\\Restorant', 187, '2024-03-20 14:58:02', '2024-03-20 14:58:02'),
(1428, NULL, 'twitter', 'App\\Restorant', 187, '2024-03-20 14:58:02', '2024-03-20 14:58:02'),
(1429, NULL, 'youtube', 'App\\Restorant', 187, '2024-03-20 14:58:02', '2024-03-20 14:58:02'),
(1430, NULL, 'instagram', 'App\\Restorant', 187, '2024-03-20 14:58:02', '2024-03-20 14:58:02'),
(1431, 'https://lanka-food.com/', 'website', 'App\\Restorant', 187, '2024-03-20 14:58:02', '2024-03-21 16:29:44'),
(1432, NULL, 'TripAdvisor', 'App\\Restorant', 187, '2024-03-20 14:58:02', '2024-03-20 14:58:02'),
(1433, NULL, 'GoogleReview', 'App\\Restorant', 187, '2024-03-20 14:58:02', '2024-03-20 14:58:02'),
(1434, NULL, 'account_sid', 'App\\Restorant', 187, '2024-03-20 15:13:41', '2024-03-20 15:13:41'),
(1435, NULL, 'auth_token', 'App\\Restorant', 187, '2024-03-20 15:13:41', '2024-03-20 15:13:41'),
(1436, NULL, 'from_number', 'App\\Restorant', 187, '2024-03-20 15:13:41', '2024-03-20 15:13:41'),
(1437, '0', 'disable_callwaiter', 'App\\Restorant', 62, '2024-03-20 15:49:26', '2024-03-20 15:49:26'),
(1438, '0', 'disable_ordering', 'App\\Restorant', 62, '2024-03-20 15:49:26', '2024-03-20 15:49:26'),
(1439, '0', 'disable_continues_ordering', 'App\\Restorant', 62, '2024-03-20 15:49:26', '2024-03-20 15:49:26'),
(1440, '0', 'time_to_prepare_order_in_minutes', 'App\\Restorant', 62, '2024-03-20 15:49:27', '2024-03-20 15:49:27'),
(1441, '[\"allergens\",\"clients\",\"coupons\",\"deliveryqr\",\"detrack\",\"domain\",\"drivers\",\"expenses\",\"flutterwave\",\"googletranslate\",\"impressum\",\"iyzico\",\"kitchendisplay\",\"manager\",\"mercadopago\",\"mollie\",\"paddle-subscribe\",\"payfast\",\"paypal\",\"paypal-subscribe\",\"paystack\",\"pdf-invoice\",\"print-node\",\"print-templ\",\"razorpay\",\"sendstatus\",\"socialplatforms\",\"staff\",\"stock\",\"stripelinks\",\"themeswitcher\",\"timezone\",\"twilio\",\"webhooks\"]', 'plugins', 'App\\Plans', 15, '2024-03-20 15:53:46', '2024-04-11 21:39:12'),
(1442, '0', 'disable_callwaiter', 'App\\Restorant', 63, '2024-03-20 16:07:39', '2024-03-20 16:07:39'),
(1443, '0', 'disable_ordering', 'App\\Restorant', 63, '2024-03-20 16:07:39', '2024-03-20 16:07:39'),
(1444, '0', 'disable_continues_ordering', 'App\\Restorant', 63, '2024-03-20 16:07:39', '2024-03-20 16:07:39'),
(1445, '30', 'delivery_interval_in_minutes', 'App\\Restorant', 63, '2024-03-20 16:07:39', '2024-03-20 16:07:39'),
(1446, NULL, 'account_sid', 'App\\Restorant', 61, '2024-03-20 22:20:03', '2024-03-20 22:20:03'),
(1447, NULL, 'auth_token', 'App\\Restorant', 61, '2024-03-20 22:20:03', '2024-03-20 22:20:03'),
(1448, NULL, 'from_number', 'App\\Restorant', 61, '2024-03-20 22:20:03', '2024-03-20 22:20:03'),
(1449, 'a4aef858-71c5-4133-b1a3-9bb7a5ef6f91', 'resto_wide_logo_dark', 'App\\Restorant', 187, '2024-03-20 23:23:32', '2024-03-31 01:34:24'),
(1450, 'Europe/Amsterdam', 'time_zone', 'App\\Restorant', 187, '2024-03-20 23:30:56', '2024-03-20 23:30:56'),
(1451, '0', 'disable_callwaiter', 'App\\Restorant', 189, '2024-03-22 16:17:09', '2024-03-22 16:17:09'),
(1452, '0', 'disable_ordering', 'App\\Restorant', 189, '2024-03-22 16:17:09', '2024-03-22 16:17:09'),
(1453, '0', 'disable_callwaiter', 'App\\Restorant', 190, '2024-03-22 16:23:40', '2024-03-22 16:23:40'),
(1454, '0', 'disable_ordering', 'App\\Restorant', 190, '2024-03-22 16:23:40', '2024-03-22 16:23:40'),
(1455, '0', 'disable_callwaiter', 'App\\Restorant', 191, '2024-03-22 17:41:25', '2024-03-22 17:41:25'),
(1456, '0', 'disable_ordering', 'App\\Restorant', 191, '2024-03-22 17:41:25', '2024-03-22 17:41:25'),
(1457, '0', 'disable_callwaiter', 'App\\Restorant', 192, '2024-03-22 17:44:10', '2024-03-22 17:44:10'),
(1458, '0', 'disable_ordering', 'App\\Restorant', 192, '2024-03-22 17:44:10', '2024-03-22 17:44:10'),
(1459, '0', 'disable_callwaiter', 'App\\Restorant', 64, '2024-03-26 16:19:29', '2024-03-26 16:19:29'),
(1460, '0', 'disable_ordering', 'App\\Restorant', 64, '2024-03-26 16:19:29', '2024-03-26 16:19:29'),
(1461, '0', 'disable_continues_ordering', 'App\\Restorant', 64, '2024-03-26 16:19:29', '2024-03-26 16:19:29'),
(1462, '30', 'delivery_interval_in_minutes', 'App\\Restorant', 64, '2024-03-26 16:19:30', '2024-03-26 16:19:30'),
(1463, '7341db04-c209-4899-ba4c-01b93e7feffe', 'resto_wide_logo_dark', 'App\\Restorant', 61, '2024-03-29 18:03:28', '2024-03-29 18:03:28'),
(1464, 'lyon 7', 'delivery_area_name', 'App\\Order', 902, '2024-04-04 17:17:35', '2024-04-04 17:17:35'),
(1465, 'lyon 7', 'delivery_area_name', 'App\\Order', 903, '2024-04-04 17:29:58', '2024-04-04 17:29:58'),
(1466, 'Test', 'delivery_area_name', 'App\\Order', 905, '2024-04-06 18:08:48', '2024-04-06 18:08:48'),
(1467, 'Test', 'delivery_area_name', 'App\\Order', 922, '2024-04-09 01:16:36', '2024-04-09 01:16:36'),
(1468, 'Test', 'delivery_area_name', 'App\\Order', 923, '2024-04-09 01:27:51', '2024-04-09 01:27:51'),
(1469, 'Test', 'delivery_area_name', 'App\\Order', 925, '2024-04-09 13:32:25', '2024-04-09 13:32:25'),
(1470, NULL, 'account_sid', 'App\\Restorant', 63, '2024-04-13 15:57:29', '2024-04-13 15:57:29'),
(1471, NULL, 'auth_token', 'App\\Restorant', 63, '2024-04-13 15:57:29', '2024-04-13 15:57:29'),
(1472, NULL, 'from_number', 'App\\Restorant', 63, '2024-04-13 15:57:29', '2024-04-13 15:57:29'),
(1473, 'Test', 'delivery_area_name', 'App\\Order', 941, '2024-04-17 16:51:00', '2024-04-17 16:51:00'),
(1474, 'Test', 'delivery_area_name', 'App\\Order', 943, '2024-04-18 14:26:16', '2024-04-18 14:26:16'),
(1475, '5', 'delivery_area_cost', 'App\\Order', 943, '2024-04-18 14:26:16', '2024-04-18 14:26:16'),
(1476, 'Test', 'delivery_area_name', 'App\\Order', 944, '2024-04-18 14:28:37', '2024-04-18 14:28:37'),
(1477, '5', 'delivery_area_cost', 'App\\Order', 944, '2024-04-18 14:28:37', '2024-04-18 14:28:37'),
(1478, 'Test', 'delivery_area_name', 'App\\Order', 945, '2024-04-18 14:39:03', '2024-04-18 14:39:03'),
(1479, '5', 'delivery_area_cost', 'App\\Order', 945, '2024-04-18 14:39:03', '2024-04-18 14:39:03'),
(1480, 'lyon 7', 'delivery_area_name', 'App\\Order', 946, '2024-04-18 14:41:42', '2024-04-18 14:41:42'),
(1481, '10', 'delivery_area_cost', 'App\\Order', 946, '2024-04-18 14:41:42', '2024-04-18 14:41:42'),
(1482, '0', 'disable_callwaiter', 'App\\Restorant', 193, '2024-04-18 17:08:50', '2024-04-18 17:08:50'),
(1483, '0', 'disable_ordering', 'App\\Restorant', 193, '2024-04-18 17:08:50', '2024-04-18 17:08:50'),
(1484, NULL, 'phonenumber', 'App\\Restorant', 187, '2024-04-21 11:27:08', '2024-04-21 11:27:08'),
(1485, '0', 'disable_callwaiter', 'App\\Restorant', 194, '2024-04-27 11:10:35', '2024-04-27 11:10:35'),
(1486, '0', 'disable_ordering', 'App\\Restorant', 194, '2024-04-27 11:10:35', '2024-04-27 11:10:35'),
(1487, '0', 'disable_callwaiter', 'App\\Restorant', 195, '2024-04-27 12:57:31', '2024-04-27 12:57:31'),
(1488, '0', 'disable_ordering', 'App\\Restorant', 195, '2024-04-27 12:57:31', '2024-04-27 12:57:31'),
(1489, '0', 'disable_callwaiter', 'App\\Restorant', 196, '2024-04-28 05:58:00', '2024-04-28 05:58:00'),
(1490, '0', 'disable_ordering', 'App\\Restorant', 196, '2024-04-28 05:58:01', '2024-04-28 05:58:01'),
(1491, '0', 'disable_callwaiter', 'App\\Restorant', 197, '2024-04-28 06:05:43', '2024-04-28 06:05:43'),
(1492, '0', 'disable_ordering', 'App\\Restorant', 197, '2024-04-28 06:05:43', '2024-04-28 06:05:43'),
(1493, '0', 'disable_callwaiter', 'App\\Restorant', 198, '2024-04-28 06:06:58', '2024-04-28 06:06:58'),
(1494, '0', 'disable_ordering', 'App\\Restorant', 198, '2024-04-28 06:06:58', '2024-04-28 06:06:58'),
(1495, '0', 'disable_callwaiter', 'App\\Restorant', 199, '2024-04-28 06:08:01', '2024-04-28 06:08:01'),
(1496, '0', 'disable_ordering', 'App\\Restorant', 199, '2024-04-28 06:08:01', '2024-04-28 06:08:01'),
(1497, '0', 'disable_callwaiter', 'App\\Restorant', 200, '2024-04-28 06:09:30', '2024-04-28 06:09:30'),
(1498, '0', 'disable_ordering', 'App\\Restorant', 200, '2024-04-28 06:09:30', '2024-04-28 06:09:30'),
(1499, '0', 'disable_callwaiter', 'App\\Restorant', 201, '2024-04-28 06:09:48', '2024-04-28 06:09:48'),
(1500, '0', 'disable_ordering', 'App\\Restorant', 201, '2024-04-28 06:09:48', '2024-04-28 06:09:48'),
(1501, '0', 'disable_callwaiter', 'App\\Restorant', 202, '2024-04-28 06:21:59', '2024-04-28 06:21:59'),
(1502, '0', 'disable_ordering', 'App\\Restorant', 202, '2024-04-28 06:21:59', '2024-04-28 06:21:59'),
(1503, '0', 'disable_callwaiter', 'App\\Restorant', 203, '2024-04-30 10:31:30', '2024-04-30 10:31:30'),
(1504, '0', 'disable_ordering', 'App\\Restorant', 203, '2024-04-30 10:31:30', '2024-04-30 10:31:30'),
(1505, '0', 'disable_callwaiter', 'App\\Restorant', 204, '2024-05-02 06:22:00', '2024-05-02 06:22:00'),
(1506, '0', 'disable_ordering', 'App\\Restorant', 204, '2024-05-02 06:22:00', '2024-05-02 06:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `full_name`, `restaurant_name`, `phone_number`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Paul', 'chez paul', '06422123215', 'price adivce', 'hello need help on', '2023-12-30 16:55:38', '2023-12-30 16:55:38'),
(2, 'vsvsvff', 'vvgefeafaef', 'fefefqc', 'zdqefqgvfcc', 'fezfgbsfdvdsf', '2024-01-19 18:24:15', '2024-01-19 18:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '0 - Fixed, 1 - Percentage',
  `price` double NOT NULL,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL,
  `limit_to_num_uses` int NOT NULL,
  `used_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `restaurant_id`, `type`, `price`, `active_from`, `active_to`, `limit_to_num_uses`, `used_count`, `created_at`, `updated_at`) VALUES
(8, 'AS908', 'GAM9GDXB', 62, 1, 5, '2024-01-01', '2024-01-31', 5, 0, '2024-01-17 17:29:31', '2024-01-17 17:29:31'),
(14, 'happyhourslanka', 'LAMTR6ES', 187, 1, 20, '2024-03-22', '2024-05-30', 35, 39, '2024-03-22 14:25:14', '2024-04-29 07:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int UNSIGNED NOT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`id`, `domain`, `tenant_id`, `created_at`, `updated_at`) VALUES
(2, 'rest.acosppc.com', '8609dc41-307c-4ee2-8462-16c6d61071f1', '2024-02-27 20:25:48', '2024-02-27 20:25:48'),
(3, 'fast.acosppc.com', '4d16e8bf-3215-4ddd-a410-546d12e82cb7', '2024-02-27 20:31:38', '2024-02-27 20:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_prices`
--

CREATE TABLE `dynamic_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `expenses_category_id` bigint UNSIGNED DEFAULT NULL,
  `expenses_vendor_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_category`
--

CREATE TABLE `expenses_category` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_vendor`
--

CREATE TABLE `expenses_vendor` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `extra_for_all_variants` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `item_id`, `price`, `name`, `created_at`, `updated_at`, `deleted_at`, `extra_for_all_variants`) VALUES
(524, 393, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 15:47:50', '2023-12-18 15:47:50', NULL, 1),
(525, 393, 0.40, '{\"en\":\"Extra 2\"}', '2023-12-18 15:48:00', '2023-12-18 15:48:00', NULL, 1),
(526, 395, 1.99, '{\"en\":\"Extra 1\"}', '2023-12-18 15:50:17', '2023-12-18 15:50:17', NULL, 1),
(527, 395, 0.99, '{\"en\":\"Extra 2\"}', '2023-12-18 15:50:27', '2023-12-18 15:50:27', NULL, 1),
(528, 395, 1.20, '{\"en\":\"Extra 3\"}', '2023-12-18 15:50:45', '2023-12-18 15:50:45', NULL, 1),
(529, 397, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 15:55:17', '2023-12-18 15:55:17', NULL, 1),
(530, 397, 0.50, '{\"en\":\"Extra 2\"}', '2023-12-18 15:55:25', '2023-12-18 15:55:25', NULL, 1),
(531, 396, 0.50, '{\"en\":\"Extra A\"}', '2023-12-18 15:55:52', '2023-12-18 15:55:52', NULL, 1),
(532, 398, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 16:02:56', '2023-12-18 16:02:56', NULL, 1),
(533, 398, 0.50, '{\"en\":\"Extra 2\"}', '2023-12-18 16:03:06', '2023-12-18 16:03:06', NULL, 1),
(534, 399, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 16:04:33', '2023-12-18 16:04:33', NULL, 1),
(535, 399, 0.50, '{\"en\":\"Extra 2\"}', '2023-12-18 16:04:40', '2023-12-18 16:04:40', NULL, 1),
(536, 401, 0.90, '{\"en\":\"Extra A\"}', '2023-12-18 16:08:06', '2023-12-18 16:08:06', NULL, 1),
(537, 402, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 16:29:32', '2023-12-18 16:29:32', NULL, 1),
(538, 402, 0.50, '{\"en\":\"Extra 2\"}', '2023-12-18 16:29:40', '2023-12-18 16:29:40', NULL, 1),
(539, 403, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 16:30:55', '2023-12-18 16:30:55', NULL, 1),
(540, 404, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 16:32:44', '2023-12-18 16:32:44', NULL, 1),
(541, 405, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 16:34:03', '2023-12-18 16:34:03', NULL, 1),
(542, 405, 0.50, '{\"en\":\"Extra 2\"}', '2023-12-18 16:34:11', '2023-12-18 16:34:11', NULL, 1),
(543, 406, 0.50, '{\"en\":\"Extra 1\"}', '2023-12-18 16:55:43', '2023-12-18 16:55:43', NULL, 1),
(544, 406, 0.50, '{\"en\":\"Extra 2\"}', '2023-12-18 16:55:50', '2023-12-18 16:55:50', NULL, 1),
(550, 407, 2.99, '{\"en\":\"Truffle Parmesan\",\"fr\":\"Truffle Parmesan\",\"eo\":\"Truffle Parmesan\",\"ga\":\"Truffle Parmesan\"}', '2024-01-29 01:09:00', '2024-02-06 19:00:24', NULL, 1),
(551, 407, 1.49, '{\"en\":\"Double Dipping\",\"fr\":\"Double Dipping\",\"eo\":\"Double Dipping\",\"ga\":\"Double Dipping\"}', '2024-01-29 01:09:23', '2024-02-06 19:00:24', NULL, 1),
(552, 407, 1.99, '{\"en\":\"Sweet Heat Glaze\",\"fr\":\"Sweet Heat Glaze\",\"eo\":\"Sweet Heat Glaze\",\"ga\":\"Sweet Heat Glaze\"}', '2024-01-29 01:09:39', '2024-02-06 19:00:24', NULL, 1),
(553, 410, 1.79, '{\"en\":\"Balsamic Glaze Drizzle\",\"fr\":\"Balsamic Glaze Drizzle\",\"eo\":\"Balsamic Glaze Drizzle\",\"ga\":\"Balsamic Glaze Drizzle\"}', '2024-01-29 01:10:39', '2024-02-06 19:00:24', NULL, 1),
(554, 410, 2.99, '{\"en\":\"Mediterranean Quinoa Salad\",\"fr\":\"Mediterranean Quinoa Salad\",\"eo\":\"Mediterranean Quinoa Salad\",\"ga\":\"Mediterranean Quinoa Salad\"}', '2024-01-29 01:10:50', '2024-02-06 19:00:24', NULL, 1),
(556, 509, 4.99, '{\"en\":\"Pine Ridge Pale Ale\"}', '2024-03-18 16:49:10', '2024-03-18 16:49:27', '2024-03-18 16:49:27', 1),
(557, 527, 1.50, '{\"en\":\"SAMOSSA (1 pi\\u00e8ce)\",\"fr\":\"SAMOSSA (1 pi\\u00e8ce)\"}', '2024-03-18 23:20:40', '2024-04-11 21:39:34', NULL, 1),
(558, 526, 3.50, '{\"en\":\"VERSION XL (Suppl\\u00e9ment riz + garnitures)\",\"fr\":\"VERSION XL (Suppl\\u00e9ment riz + garnitures)\"}', '2024-03-18 23:21:29', '2024-04-11 21:39:34', NULL, 1),
(559, 528, 3.50, '{\"en\":\"Version XL (Suppl\\u00e9ment riz + garniture)\",\"fr\":\"Version XL (Suppl\\u00e9ment riz + garniture)\"}', '2024-03-18 23:29:13', '2024-04-11 21:39:34', NULL, 1),
(560, 544, 2.80, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:29:21', '2024-04-11 21:39:34', NULL, 1),
(561, 544, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:29:34', '2024-04-11 21:39:34', NULL, 1),
(562, 546, 2.80, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:30:51', '2024-04-11 21:39:34', NULL, 1),
(563, 546, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:31:03', '2024-04-11 21:39:34', NULL, 1),
(564, 547, 2.80, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:31:52', '2024-04-11 21:39:34', NULL, 1),
(565, 547, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:32:03', '2024-04-11 21:39:34', NULL, 1),
(566, 548, 2.80, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:32:25', '2024-04-11 21:39:34', NULL, 1),
(567, 548, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:32:44', '2024-04-11 21:39:34', NULL, 1),
(568, 537, 3.50, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:36:04', '2024-04-11 21:39:34', NULL, 1),
(569, 537, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:36:20', '2024-04-11 21:39:34', NULL, 1),
(570, 538, 3.50, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:37:59', '2024-04-11 21:39:34', NULL, 1),
(571, 538, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:38:12', '2024-04-11 21:39:34', NULL, 1),
(572, 541, 3.50, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:40:53', '2024-04-11 21:39:34', NULL, 1),
(573, 541, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:41:04', '2024-04-11 21:39:34', NULL, 1),
(574, 542, 3.50, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:42:09', '2024-04-11 21:39:34', NULL, 1),
(575, 542, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:42:20', '2024-04-11 21:39:34', NULL, 1),
(576, 539, 3.50, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:43:57', '2024-04-11 21:39:34', NULL, 1),
(577, 539, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:44:07', '2024-04-11 21:39:34', NULL, 1),
(578, 540, 3.50, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:45:30', '2024-04-11 21:39:34', NULL, 1),
(579, 540, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:45:43', '2024-04-11 21:39:34', NULL, 1),
(580, 543, 3.50, '{\"en\":\"Version XL\",\"fr\":\"Version XL\"}', '2024-03-19 00:46:52', '2024-04-11 21:39:34', NULL, 1),
(581, 543, 3.90, '{\"en\":\"Cheese Naan\",\"fr\":\"Cheese Naan\"}', '2024-03-19 00:47:03', '2024-04-11 21:39:34', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'b43c7a7b-eaf6-4b95-8e47-e7f25867c2f4', 'database', 'default', '{\"uuid\":\"b43c7a7b-eaf6-4b95-8e47-e7f25867c2f4\",\"displayName\":\"App\\\\Events\\\\CallWaiter\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":12:{s:5:\\\"event\\\";O:21:\\\"App\\\\Events\\\\CallWaiter\\\":3:{s:5:\\\"table\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:10:\\\"App\\\\Tables\\\";s:2:\\\"id\\\";i:274;s:9:\\\"relations\\\";a:2:{i:0;s:9:\\\"restoarea\\\";i:1;s:10:\\\"restaurant\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"msg\\\";s:24:\\\"You have new customer on\\\";s:6:\\\"socket\\\";N;}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Tables]. in /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php:527\nStack trace:\n#0 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(57): App\\Events\\CallWaiter->restoreModel()\n#2 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(122): App\\Events\\CallWaiter->getRestoredPropertyValue()\n#3 [internal function]: App\\Events\\CallWaiter->__unserialize()\n#4 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(97): unserialize()\n#5 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->getCommand()\n#6 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#7 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#9 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#10 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#11 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#12 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#15 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#16 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#17 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#18 /var/www/emenusolutions.com/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#19 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#20 /var/www/emenusolutions.com/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#21 /var/www/emenusolutions.com/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#22 /var/www/emenusolutions.com/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#23 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#24 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#25 /var/www/emenusolutions.com/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#26 {main}', '2024-03-25 14:58:50'),
(2, '5651a1c4-ef3b-4717-8ed9-7a82dfb4df11', 'database', 'default', '{\"uuid\":\"5651a1c4-ef3b-4717-8ed9-7a82dfb4df11\",\"displayName\":\"App\\\\Events\\\\NewOrder\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":12:{s:5:\\\"event\\\";O:19:\\\"App\\\\Events\\\\NewOrder\\\":4:{s:5:\\\"order\\\";a:1:{s:2:\\\"id\\\";i:701;}s:3:\\\"msg\\\";s:26:\\\"You have new order with ID\\\";s:5:\\\"owner\\\";i:103;s:6:\\\"socket\\\";N;}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Broadcasting\\BroadcastException: Failed to connect to Pusher. in /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Broadcasting/Broadcasters/PusherBroadcaster.php:142\nStack trace:\n#0 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Broadcasting/BroadcastEvent.php(77): Illuminate\\Broadcasting\\Broadcasters\\PusherBroadcaster->broadcast()\n#1 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Broadcasting\\BroadcastEvent->handle()\n#2 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#4 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#5 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#6 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#7 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#8 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#10 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#11 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#12 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#14 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#15 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#16 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#18 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#19 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#20 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#21 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#24 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#25 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#26 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#27 /var/www/emenusolutions.com/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#28 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#29 /var/www/emenusolutions.com/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#30 /var/www/emenusolutions.com/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#31 /var/www/emenusolutions.com/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#32 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#33 /var/www/emenusolutions.com/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#34 /var/www/emenusolutions.com/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#35 {main}', '2024-03-25 14:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `0_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `0_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `1_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `1_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `2_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `2_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `3_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `3_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `4_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `4_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `5_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `5_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `6_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `6_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restorant_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`id`, `created_at`, `updated_at`, `0_from`, `0_to`, `1_from`, `1_to`, `2_from`, `2_to`, `3_from`, `3_to`, `4_from`, `4_to`, `5_from`, `5_to`, `6_from`, `6_to`, `restorant_id`) VALUES
(35, '2023-09-14 17:47:19', '2023-09-14 17:47:19', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 32),
(63, '2023-12-17 16:45:27', '2024-03-18 16:28:46', '09:00', '23:00', '09:00', '23:00', '09:00', '23:00', '09:00', '23:00', '09:00', '23:00', '09:00', '23:00', '09:00', '23:00', 61),
(64, '2023-12-17 16:54:10', '2023-12-17 16:54:10', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 62),
(65, '2023-12-17 17:01:21', '2023-12-17 17:01:21', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 63),
(66, '2023-12-17 17:04:08', '2023-12-17 17:04:08', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 64),
(186, '2024-03-18 20:29:26', '2024-03-18 20:29:26', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 183),
(187, '2024-03-18 21:08:58', '2024-03-18 21:08:58', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 184),
(188, '2024-03-18 21:47:03', '2024-03-18 21:47:03', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 185),
(189, '2024-03-18 22:25:52', '2024-03-18 22:25:52', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 186),
(190, '2024-03-18 22:30:30', '2024-05-08 07:45:42', '11:50', '11:35', '11:30', '14:30', '11:30', '14:32', '11:30', '14:30', '11:30', '14:30', '11:30', '14:30', NULL, NULL, 187),
(191, '2024-03-18 23:10:19', '2024-05-06 14:00:43', '18:30', '23:31', '18:30', '23:30', '18:30', '23:30', '18:30', '23:30', '18:30', '23:30', '18:30', '23:30', '18:30', '23:30', 187),
(192, '2024-03-19 16:29:12', '2024-03-19 16:29:12', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 188),
(193, '2024-03-22 16:17:09', '2024-03-22 16:17:09', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 189),
(194, '2024-03-22 16:23:40', '2024-03-22 16:23:40', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 190),
(195, '2024-03-22 17:41:25', '2024-03-22 17:41:25', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 191),
(196, '2024-03-22 17:44:10', '2024-03-22 17:44:10', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 192),
(197, '2024-04-18 17:08:50', '2024-04-18 17:08:50', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 193),
(198, '2024-04-27 11:10:35', '2024-04-27 11:10:35', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 194),
(199, '2024-04-27 12:57:31', '2024-04-27 12:57:31', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 195),
(200, '2024-04-28 05:58:00', '2024-04-28 05:58:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 196),
(201, '2024-04-28 06:05:43', '2024-04-28 06:05:43', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 197),
(202, '2024-04-28 06:06:58', '2024-04-28 06:06:58', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 198),
(203, '2024-04-28 06:08:01', '2024-04-28 06:08:01', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 199),
(204, '2024-04-28 06:09:30', '2024-04-28 06:09:30', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 200),
(205, '2024-04-28 06:09:48', '2024-04-28 06:09:48', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 201),
(206, '2024-04-28 06:21:59', '2024-04-28 06:21:59', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 202),
(207, '2024-04-30 10:31:30', '2024-04-30 10:31:30', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 203),
(208, '2024-05-02 06:22:00', '2024-05-02 06:22:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', '09:00', '17:00', 204);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` int NOT NULL DEFAULT '1',
  `has_variants` int NOT NULL DEFAULT '0',
  `vat` double(8,2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `enable_system_variants` int NOT NULL DEFAULT '0',
  `discounted_price` double NOT NULL DEFAULT '0',
  `qty` int NOT NULL DEFAULT '1',
  `qty_management` int NOT NULL DEFAULT '1',
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `price`, `category_id`, `created_at`, `updated_at`, `available`, `has_variants`, `vat`, `deleted_at`, `enable_system_variants`, `discounted_price`, `qty`, `qty_management`, `youtube`) VALUES
(390, '{\"en\":\"dfg\"}', '{\"en\":\"dfg\"}', '', 3, 98, '2023-12-17 16:55:35', '2023-12-18 16:01:20', 1, 0, 0.00, '2023-12-18 16:01:20', 0, 0, 1, 1, NULL),
(392, '{\"en\":\"Grilled Chicken Breast\"}', '{\"en\":\"test\"}', '186c5701-ff3f-4e13-8146-22114383ae47', 1, 95, '2023-12-17 19:28:25', '2023-12-17 19:28:38', 1, 0, 18.00, '2023-12-17 19:28:38', 0, 0, 1, 1, NULL),
(393, '{\"en\":\"Grilled Chicken Breast\"}', '{\"en\":\"Grilled Chicken Breast: Succulent chicken breast marinated in a blend of spices, perfectly grilled to achieve a smoky flavor and tender texture\"}', '57eabdc6-5df3-473e-9f44-839ae23f625d', 9.99, 95, '2023-12-18 15:47:03', '2023-12-18 15:47:03', 1, 0, 18.00, NULL, 0, 0, 1, 1, NULL),
(394, '{\"en\":\"Grilled Chicken Breast\"}', '{\"en\":\"Grilled Chicken Breast: Succulent chicken breast marinated in a blend of spices, perfectly grilled to achieve a smoky flavor and tender texture\"}', '4f6a419b-e59e-44aa-913a-e1d8c31f2701', 9.99, 95, '2023-12-18 15:47:04', '2023-12-18 15:47:29', 1, 0, 18.00, '2023-12-18 15:47:29', 0, 0, 1, 1, NULL),
(395, '{\"en\":\"Fried Chicken\"}', '{\"en\":\"Southern Fried Chicken: Crispy on the outside, juicy on the inside, this classic dish features chicken pieces coated in a seasoned flour mix and deep-fried to golden perfection.\"}', '0482698c-c487-4b2e-99ff-f87520228748', 29.99, 95, '2023-12-18 15:49:46', '2023-12-18 15:50:07', 1, 0, 18.00, NULL, 0, 24.99, 1, 0, NULL),
(396, '{\"en\":\"Chicken Sandwiches\"}', '{\"en\":\"Classic Chicken Club Sandwich: Layers of grilled chicken, crispy bacon, lettuce, and tomato, stacked between slices of toasted bread and dressed with mayo for a timeless and satisfying sandwich\"}', 'e4364605-3a6d-4315-9d98-f87cdc39578f', 12, 96, '2023-12-18 15:52:01', '2023-12-18 15:52:33', 1, 0, 18.00, NULL, 0, 9.99, 1, 0, NULL),
(397, '{\"en\":\"Classic Buffalo Chicken Wings\"}', '{\"en\":\"Crispy chicken wings drenched in the iconic buffalo sauce, a perfect balance of tangy and spicy flavors that is sure to satisfy your wing cravings.\"}', '2daf3330-bae5-4796-9853-4540f0d7c0a2', 8.99, 97, '2023-12-18 15:54:07', '2023-12-18 15:54:26', 1, 0, 18.00, NULL, 0, 7.99, 1, 0, NULL),
(398, '{\"en\":\"Classic Cheeseburger\"}', '{\"en\":\"Juicy beef patty topped with melted cheese, lettuce, tomato, and pickles, nestled in a soft sesame seed bun.\"}', 'a250ba7a-e800-4f02-acb3-65e2650534cd', 5.99, 98, '2023-12-18 16:02:25', '2023-12-18 16:02:46', 1, 0, 0.00, NULL, 0, 4.99, 1, 0, NULL),
(399, '{\"en\":\"Bacon and Onion Burger\"}', '{\"en\":\"A flavorful twist on the classic, featuring a beef patty with crispy bacon, caramelized onions, and your choice of condiments.\"}', 'a2ac3386-e695-4092-a936-59ab21f2cca6', 14.99, 98, '2023-12-18 16:04:10', '2023-12-18 16:04:24', 1, 0, 0.00, NULL, 0, 11.99, 1, 0, NULL),
(400, '{\"en\":\"Truffle Mushroom Burger\"}', '{\"en\":\"A gourmet delight with a juicy patty, saut\\u00e9ed truffle-infused mushrooms, Swiss cheese, and a truffle aioli on a brioche bun.\"}', '7e3efec9-36f0-44fb-803b-489346d34f04', 9.99, 99, '2023-12-18 16:06:08', '2023-12-18 16:06:25', 1, 0, 0.00, NULL, 0, 7.99, 1, 0, NULL),
(401, '{\"en\":\"Blue Cheese and Fig Burge\"}', '{\"en\":\"An upscale creation featuring a beef patty topped with creamy blue cheese, arugula, and a fig jam, all served on a toasted artisan bun.\"}', '96882a34-a90d-45da-94cd-4efe42767062', 3.99, 99, '2023-12-18 16:07:31', '2023-12-18 16:07:52', 1, 0, 0.00, NULL, 0, 2.99, 1, 0, NULL),
(402, '{\"en\":\"Spaghetti Bolognese\"}', '{\"en\":\"Traditional spaghetti served with a rich and savory Bolognese sauce made with ground meat, tomatoes, and herbs.\"}', '5c0d2c2f-699a-4c5c-9fa6-11fe51b76039', 5.99, 100, '2023-12-18 16:29:09', '2023-12-18 16:29:24', 1, 0, 18.00, NULL, 0, 4.99, 1, 0, NULL),
(403, '{\"en\":\"Fettuccine Alfredo\"}', '{\"en\":\"Thick fettuccine pasta coated in a creamy Alfredo sauce, typically made with butter, heavy cream, and Parmesan cheese.\"}', 'f6ef9c42-1450-45d7-96c8-3e0eada09de1', 7.99, 100, '2023-12-18 16:30:40', '2023-12-18 16:30:40', 1, 0, 18.00, NULL, 0, 0, 1, 1, NULL),
(404, '{\"en\":\"Lobster Ravioli with Tomato Cream Sauce\"}', '{\"en\":\"Ravioli stuffed with succulent lobster meat, served in a luscious tomato cream sauce.\"}', 'bf7ff50d-485d-4c8b-869a-f19c0e724e57', 12.99, 101, '2023-12-18 16:32:24', '2023-12-18 16:32:36', 1, 0, 18.00, NULL, 0, 11.99, 1, 0, NULL),
(405, '{\"en\":\"Pesto Primavera Linguine\"}', '{\"en\":\"Linguine pasta tossed with a vibrant pesto sauce and a medley of fresh, seasonal vegetables.\"}', '8bd24b26-c365-4af1-a1cf-0e5bb381bac6', 6.99, 102, '2023-12-18 16:33:39', '2023-12-18 16:33:53', 1, 0, 18.00, NULL, 0, 4.99, 1, 0, NULL),
(406, '{\"en\":\"Martini\"}', '{\"en\":\"A timeless cocktail made with gin or vodka and vermouth, garnished with an olive or a twist of lemon.\"}', '6c2fbd1d-0f6c-48ff-8b7d-7f55dcda89f1', 1.99, 103, '2023-12-18 16:55:20', '2023-12-18 16:55:32', 1, 0, 0.00, NULL, 0, 1.5, 1, 0, NULL),
(407, '{\"en\":\"Parmesan Chicken Wings\",\"fr\":\"Parmesan Chicken Wings\",\"eo\":\"Parmesan Chicken Wings\",\"ga\":\"Parmesan Chicken Wings\"}', '{\"en\":\"Parmesan Perfection: Crispy Wings with Zesty Marinara or Creamy Garlic Sauce\",\"fr\":\"Parmesan Perfection: Crispy Wings with Zesty Marinara or Creamy Garlic Sauce\",\"eo\":\"Parmesan Perfection: Crispy Wings with Zesty Marinara or Creamy Garlic Sauce\",\"ga\":\"Parmesan Perfection: Crispy Wings with Zesty Marinara or Creamy Garlic Sauce\"}', '2b84127a-7c7a-494f-93db-ab6cd043566b', 9.99, 107, '2023-12-20 16:13:56', '2024-03-22 19:24:42', 1, 1, 18.00, NULL, 0, 0, 0, 0, NULL),
(408, '{\"en\":\"Caprese Salad\",\"fr\":\"Caprese Salad\",\"eo\":\"Caprese Salad\",\"ga\":\"Caprese Salad\"}', '{\"en\":\"Caprese Harmony: A Fresh Symphony from Garden to Plate.\",\"fr\":\"Caprese Harmony: A Fresh Symphony from Garden to Plate.\",\"eo\":\"Caprese Harmony: A Fresh Symphony from Garden to Plate.\",\"ga\":\"Caprese Harmony: A Fresh Symphony from Garden to Plate.\"}', '4e7eeeab-12ac-49e2-87fd-27e7281fe024', 8.49, 106, '2023-12-20 16:16:55', '2024-02-06 19:00:24', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(409, '{\"en\":\"Loaded Potato Skins\",\"fr\":\"Loaded Potato Skins\",\"eo\":\"Loaded Potato Skins\",\"ga\":\"Loaded Potato Skins\"}', '{\"en\":\"Savory Summit: The Ultimate Adventure of Loaded Potato Skins.\",\"fr\":\"Savory Summit: The Ultimate Adventure of Loaded Potato Skins.\",\"eo\":\"Savory Summit: The Ultimate Adventure of Loaded Potato Skins.\",\"ga\":\"Savory Summit: The Ultimate Adventure of Loaded Potato Skins.\"}', '169b321d-0ed0-490a-9ce0-72a6f8350920', 7.99, 106, '2023-12-20 16:18:22', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(410, '{\"en\":\"Grilled Chicken Breast\",\"fr\":\"Grilled Chicken Breast\",\"eo\":\"Grilled Chicken Breast\",\"ga\":\"Grilled Chicken Breast\"}', '{\"en\":\"Simplicity Elevated: Signature Grilled Chicken Breast Deligh\",\"fr\":\"Simplicity Elevated: Signature Grilled Chicken Breast Deligh\",\"eo\":\"Simplicity Elevated: Signature Grilled Chicken Breast Deligh\",\"ga\":\"Simplicity Elevated: Signature Grilled Chicken Breast Deligh\"}', 'b213d8b2-f217-4faf-95c6-d45fe72b8559', 12.99, 107, '2023-12-20 16:20:32', '2024-02-06 19:00:24', 1, 0, 18.00, NULL, 0, 0, 0, 0, NULL),
(411, '{\"en\":\"Crispy Fried Chicken\",\"fr\":\"Crispy Fried Chicken\",\"eo\":\"Crispy Fried Chicken\",\"ga\":\"Crispy Fried Chicken\"}', '{\"en\":\"Crispy Symphony: Irresistible Perfection in Every Bite of Fried Chicken\",\"fr\":\"Crispy Symphony: Irresistible Perfection in Every Bite of Fried Chicken\",\"eo\":\"Crispy Symphony: Irresistible Perfection in Every Bite of Fried Chicken\",\"ga\":\"Crispy Symphony: Irresistible Perfection in Every Bite of Fried Chicken\"}', '7090d207-e058-4edf-9fcd-fb51baff7d11', 11.99, 107, '2023-12-20 16:23:30', '2024-02-06 19:00:24', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(412, '{\"en\":\"Chicken Alfredo Pasta\",\"fr\":\"Chicken Alfredo Pasta\",\"eo\":\"Chicken Alfredo Pasta\",\"ga\":\"Chicken Alfredo Pasta\"}', '{\"en\":\"Alfredo Elegance: A Symphony of Creamy Indulgence and Savory Perfection in Every Bite.\",\"fr\":\"Alfredo Elegance: A Symphony of Creamy Indulgence and Savory Perfection in Every Bite.\",\"eo\":\"Alfredo Elegance: A Symphony of Creamy Indulgence and Savory Perfection in Every Bite.\",\"ga\":\"Alfredo Elegance: A Symphony of Creamy Indulgence and Savory Perfection in Every Bite.\"}', '3291b11b-4021-41a3-90c8-b77e32e7259f', 14.49, 107, '2023-12-20 16:25:32', '2024-02-06 19:00:24', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(413, '{\"en\":\"French Fries\",\"fr\":\"French Fries\",\"eo\":\"French Fries\",\"ga\":\"French Fries\"}', '{\"en\":\"Golden Bliss: Crispy Perfection in Every Bite of Our French Fries.\",\"fr\":\"Golden Bliss: Crispy Perfection in Every Bite of Our French Fries.\",\"eo\":\"Golden Bliss: Crispy Perfection in Every Bite of Our French Fries.\",\"ga\":\"Golden Bliss: Crispy Perfection in Every Bite of Our French Fries.\"}', '0988d5d6-de0e-48eb-aa20-d416c9068d01', 5.4, 108, '2023-12-20 16:36:22', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 0, 0, NULL),
(414, '{\"en\":\"Onion Rings\",\"fr\":\"Onion Rings\",\"eo\":\"Onion Rings\",\"ga\":\"Onion Rings\"}', '{\"en\":\"Crispy Symphony: Golden Perfection in Every Bite of Our Onion Rings.\",\"fr\":\"Crispy Symphony: Golden Perfection in Every Bite of Our Onion Rings.\",\"eo\":\"Crispy Symphony: Golden Perfection in Every Bite of Our Onion Rings.\",\"ga\":\"Crispy Symphony: Golden Perfection in Every Bite of Our Onion Rings.\"}', '4f64bcc4-8bb3-4130-bd81-b9338acd4324', 4.49, 108, '2023-12-20 16:38:11', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(415, '{\"en\":\"Side Salad\",\"fr\":\"Side Salad\",\"eo\":\"Side Salad\",\"ga\":\"Side Salad\"}', '{\"en\":\"Garden Symphony: Freshness Unveiled in Our Vibrant Side Salad.\",\"fr\":\"Garden Symphony: Freshness Unveiled in Our Vibrant Side Salad.\",\"eo\":\"Garden Symphony: Freshness Unveiled in Our Vibrant Side Salad.\",\"ga\":\"Garden Symphony: Freshness Unveiled in Our Vibrant Side Salad.\"}', 'b99036c9-05af-4dc1-892e-93cafbfb6c0b', 4.99, 108, '2023-12-20 16:39:41', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(416, '{\"en\":\"New York Cheesecake\",\"fr\":\"New York Cheesecake\",\"eo\":\"New York Cheesecake\",\"ga\":\"New York Cheesecake\"}', '{\"en\":\"Velvet Elegance: Decadent Bliss in Every Slice of New York Cheesecake.\",\"fr\":\"Velvet Elegance: Decadent Bliss in Every Slice of New York Cheesecake.\",\"eo\":\"Velvet Elegance: Decadent Bliss in Every Slice of New York Cheesecake.\",\"ga\":\"Velvet Elegance: Decadent Bliss in Every Slice of New York Cheesecake.\"}', '0ca46f5f-22fd-4674-a953-776ed2059067', 6.99, 109, '2023-12-20 16:45:02', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(417, '{\"en\":\"Warm Chocolate Brownie\",\"fr\":\"Warm Chocolate Brownie\",\"eo\":\"Warm Chocolate Brownie\",\"ga\":\"Warm Chocolate Brownie\"}', '{\"en\":\"Gooey Delight: Warm Chocolate Brownie Bliss.\",\"fr\":\"Gooey Delight: Warm Chocolate Brownie Bliss.\",\"eo\":\"Gooey Delight: Warm Chocolate Brownie Bliss.\",\"ga\":\"Gooey Delight: Warm Chocolate Brownie Bliss.\"}', '27321cf0-d288-4ab9-b66e-8410ee429d03', 5.99, 109, '2023-12-20 16:47:09', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(418, '{\"en\":\"Fruit Tart\",\"fr\":\"Fruit Tart\",\"eo\":\"Fruit Tart\",\"ga\":\"Fruit Tart\"}', '{\"en\":\"Orchard Symphony: Sweet Bliss in Every Bite of our Fruit Tart.\",\"fr\":\"Orchard Symphony: Sweet Bliss in Every Bite of our Fruit Tart.\",\"eo\":\"Orchard Symphony: Sweet Bliss in Every Bite of our Fruit Tart.\",\"ga\":\"Orchard Symphony: Sweet Bliss in Every Bite of our Fruit Tart.\"}', 'b795009e-9862-439d-b37d-b74da61fe304', 7.49, 109, '2023-12-20 16:48:26', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(419, '{\"en\":\"Non-Alcoholic Drinks\",\"fr\":\"Non-Alcoholic Drinks\",\"eo\":\"Non-Alcoholic Drinks\",\"ga\":\"Non-Alcoholic Drinks\"}', '{\"en\":\"Sip of Symphony: Elevate Refreshment with Our Non-Alcoholic Drink.\",\"fr\":\"Sip of Symphony: Elevate Refreshment with Our Non-Alcoholic Drink.\",\"eo\":\"Sip of Symphony: Elevate Refreshment with Our Non-Alcoholic Drink.\",\"ga\":\"Sip of Symphony: Elevate Refreshment with Our Non-Alcoholic Drink.\"}', '24873bac-7f61-470d-8e16-10734f1d2616', 4.49, 110, '2023-12-20 16:50:10', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(420, '{\"en\":\"Iced Tea\",\"fr\":\"Iced Tea\",\"eo\":\"Iced Tea\",\"ga\":\"Iced Tea\"}', '{\"en\":\"Cool Quencher: Timeless Refreshment with Our Invigorating Iced Tea.\",\"fr\":\"Cool Quencher: Timeless Refreshment with Our Invigorating Iced Tea.\",\"eo\":\"Cool Quencher: Timeless Refreshment with Our Invigorating Iced Tea.\",\"ga\":\"Cool Quencher: Timeless Refreshment with Our Invigorating Iced Tea.\"}', 'aa83e582-3354-4948-9611-d80cd3c42b81', 3.99, 110, '2023-12-20 16:51:11', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(421, '{\"en\":\"Freshly Brewed Coffee\",\"fr\":\"Freshly Brewed Coffee\",\"eo\":\"Freshly Brewed Coffee\",\"ga\":\"Freshly Brewed Coffee\"}', '{\"en\":\"Caffeine Elegance: Indulge in the Aromatic Richness of Our Freshly Brewed Coffee.\",\"fr\":\"Caffeine Elegance: Indulge in the Aromatic Richness of Our Freshly Brewed Coffee.\",\"eo\":\"Caffeine Elegance: Indulge in the Aromatic Richness of Our Freshly Brewed Coffee.\",\"ga\":\"Caffeine Elegance: Indulge in the Aromatic Richness of Our Freshly Brewed Coffee.\"}', '4e04497d-ede7-4f95-8367-55c99cb02e50', 3.49, 110, '2023-12-20 16:52:26', '2024-02-06 19:00:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(422, '{\"en\":\"Juices\",\"fr\":\"Juices\",\"eo\":\"Juices\",\"ga\":\"Juices\"}', '{\"en\":\"Juicy Revival: Elevate Your Day with Our Refreshing Selection of Juices.\",\"fr\":\"Juicy Revival: Elevate Your Day with Our Refreshing Selection of Juices.\",\"eo\":\"Juicy Revival: Elevate Your Day with Our Refreshing Selection of Juices.\",\"ga\":\"Juicy Revival: Elevate Your Day with Our Refreshing Selection of Juices.\"}', '0286dcfa-e8b0-499c-bcbf-5c4c661854f0', 3.99, 110, '2023-12-20 16:53:29', '2024-02-06 19:00:25', 1, 1, 18.00, NULL, 1, 0, 0, 0, NULL),
(423, '{\"en\":\"Garlic Snails\"}', '{\"en\":\"Escargot Rhapsody in Luscious Butter\"}', 'e39ac8fe-5f34-497f-a74c-f735f8c43e62', 12.99, 111, '2023-12-20 17:05:37', '2024-01-29 01:40:56', 1, 1, 0.00, NULL, 1, 0, 0, 0, NULL),
(424, '{\"en\":\"Onion Soup\"}', '{\"en\":\"Caramelized Onion Symphony in Swiss Broth\"}', 'eb1233a5-65b6-48ab-964d-e1f67702b8a9', 8.49, 111, '2023-12-20 17:08:19', '2024-02-05 16:53:07', 1, 0, 0.00, NULL, 0, 0, -1, 0, NULL),
(425, '{\"en\":\"Barbecue Chicken Wings\"}', '{\"en\":\"Signature BBQ Wings, a Harmony of Sweet and Savory\"}', 'f416f3cd-ae00-43ec-8bbd-c21c7b73f6aa', 8.99, 111, '2023-12-20 17:37:35', '2024-03-18 16:40:49', 1, 0, 0.00, NULL, 0, 0, 0, 0, NULL),
(426, '{\"en\":\"Grilled Beef Fillet\"}', '{\"en\":\"Succulent Symphony in our Premium Beef Fillet\"}', 'c08b5b75-ecc6-4f78-9a41-9d8c4a791608', 24.99, 112, '2023-12-20 17:40:03', '2024-01-29 01:42:27', 1, 0, 0.00, NULL, 0, 0, 1, 0, NULL),
(427, '{\"en\":\"Grilled Lemongrass Salmon\"}', '{\"en\":\"Grilled Salmon Elegance on Your Plate\"}', 'f3786b4a-fc59-4d7c-b0f5-88cf36e72365', 18.99, 112, '2023-12-20 17:45:06', '2024-02-05 15:22:29', 1, 0, 0.00, NULL, 0, 0, 0, 0, NULL),
(428, '{\"en\":\"Mushroom Risotto\"}', '{\"en\":\"Mushroom Risotto Symphony on Your Palate\"}', 'ceebf492-6651-4be8-ad71-2c93b4dd860a', 16.49, 112, '2023-12-20 17:48:10', '2024-02-05 15:22:29', 1, 0, 0.00, NULL, 0, 0, 0, 0, NULL),
(429, '{\"en\":\"Mashed Potatoes\"}', '{\"en\":\"Velvety Mashed Potatoes, Homestyle Goodness\"}', 'b4406c9e-2fe0-4659-8dae-7ddcc9ab3495', 5.49, 113, '2023-12-20 17:55:11', '2024-01-29 01:44:00', 1, 0, 0.00, NULL, 0, 0, 1, 0, NULL),
(430, '{\"en\":\"Grilled Vegetables\"}', '{\"en\":\"Vibrant Medley of Farm-Fresh Vegetables\"}', '992a2657-bcc2-453c-a417-32d72851ebd6', 6.49, 113, '2023-12-20 17:56:24', '2024-01-29 01:44:22', 1, 0, 0.00, NULL, 0, 0, 1, 0, NULL),
(431, '{\"en\":\"Mixed Salad\"}', '{\"en\":\"Delight in the crisp and colorful symphony of our Mixed Salad, a refreshing ensemble that celebrates the bounty of the season. Crisp lettuce leaves, vibrant cherry tomatoes, crunchy cucumbers, and a medley of garden-fresh vegetables come together to create a visual and flavorful feast. Tossed with our signature dressing, each forkful is a journey through a garden of textures and tastes, capturing the essence of freshness on your plate. Whether enjoyed as a light starter or a refreshing side, our Mixed Salad is a delightful invitation to savor the wholesome goodness of nature in every refreshing bite. Join us for a vibrant culinary experience where health meets indulgence in our perfectly crafted Mixed Salad.\"}', '499b3e28-8366-48d3-a3dd-9bdeff3031b7', 7.99, 113, '2023-12-20 18:06:40', '2024-01-29 01:46:33', 1, 0, 0.00, '2024-01-29 01:46:33', 0, 0, 1, 1, NULL),
(432, '{\"en\":\"Cr\\u00e8me Br\\u00fbl\\u00e9e\"}', '{\"en\":\"Cr\\u00e8me Br\\u00fbl\\u00e9e Symphony of Luxury and Sophistication\"}', '06e1a597-3d83-466e-a62a-96a7e5bbcf31', 9.99, 114, '2023-12-20 18:07:56', '2024-01-29 01:46:55', 1, 0, 0.00, NULL, 0, 0, 1, 0, NULL),
(433, '{\"en\":\"Homemade Tiramisu\"}', '{\"en\":\"Homemade Tiramisu, a Symphony of Italian Indulgence\"}', '7fd9fdc4-aeb0-4b20-92db-bc911deb81a1', 8.99, 114, '2023-12-20 18:09:32', '2024-01-29 01:47:16', 1, 0, 0.00, NULL, 0, 0, 1, 0, NULL),
(434, '{\"en\":\"White Cheese Cake\"}', '{\"en\":\"White Cheese Cake, a Slice of Pure Culinary Indulgence\"}', '02286efb-107e-4b4c-8d02-b0d9e63242ac', 7.49, 114, '2023-12-20 18:10:56', '2024-01-29 01:47:35', 1, 0, 0.00, NULL, 0, 0, 1, 0, NULL),
(435, '{\"en\":\"Wine Selection\"}', '{\"en\":\"Explore Our Curated Wine Selection, a Toast to Culinary Artistry.\"}', '99ef3553-6dd3-461d-9914-9b6090d4c618', 0, 115, '2023-12-20 18:12:23', '2024-03-18 16:44:09', 1, 1, 0.00, NULL, 0, 0, 1, 0, NULL),
(436, '{\"en\":\"Special Cocktails\"}', '{\"en\":\"Indulge in Our Mixology Mastery, a Celebration of Special Cocktails\"}', 'a9262423-6b60-4ad0-8ba3-91f24f091916', 12.99, 115, '2023-12-20 18:13:24', '2024-01-29 01:53:03', 1, 0, 0.00, NULL, 0, 0, 1, 0, NULL),
(437, '{\"en\":\"Craft Beers\"}', '{\"en\":\"Explore Our Craft Beer Collection, a Journey Through Artisanal Brewing\"}', '4fd993dd-4fb6-4a05-af85-a802cea08f44', 7.99, 115, '2023-12-20 18:14:21', '2024-01-29 01:53:55', 1, 0, 0.00, '2024-01-29 01:53:55', 0, 0, 1, 0, NULL),
(438, '{\"en\":\"Quality Spirits\"}', '{\"en\":\"Immerse Yourself in Quality Spirits, a Celebration of Craftsmanship and Superior Taste\"}', '4593533f-b801-43f3-b79c-3c09af405866', 10.99, 115, '2023-12-20 18:15:28', '2024-01-29 01:54:25', 1, 0, 0.00, NULL, 0, 0, 1, 0, NULL),
(439, '{\"en\":\"Bruschetta\"}', '{\"en\":\"Fresh Tomato Basil Bruschetta on Artisan Toast\"}', 'fb8276a1-74d8-4767-b2f0-bf9424917897', 7.99, 116, '2023-12-20 18:23:41', '2024-01-31 17:57:32', 1, 0, 18.00, NULL, 0, 0, -2, 0, NULL),
(440, '{\"en\":\"Beef Carpaccio\"}', '{\"en\":\"Premium Beef Carpaccio with Zesty Lemon and Parmesan Shavings\"}', 'fb732e64-2029-4840-bcd5-d27428a43783', 10.49, 116, '2023-12-20 18:24:49', '2024-01-29 02:05:48', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(441, '{\"en\":\"Fried Calamari\"}', '{\"en\":\"Golden Fried Calamari with Zesty Marinara or Aioli\"}', 'a77c9ffd-6957-48f5-b9dc-e8155bfc46f2', 9.99, 116, '2023-12-20 18:25:51', '2024-01-29 02:06:08', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(442, '{\"en\":\"Spaghetti Carbonara\"}', '{\"en\":\"paghetti Carbonara, a Timeless Symphony of Velvety Flavors\"}', '8493cfa2-1627-4b9b-92e6-86c23f7a0177', 13.99, 117, '2023-12-20 18:26:56', '2024-01-31 17:53:56', 1, 0, 18.00, NULL, 0, 0, -1, 0, NULL),
(443, '{\"en\":\"Homemade Lasagna\"}', '{\"en\":\"Homemade Lasagna, Layers of Comfort and Italian Tradition\"}', 'ceb5b6df-8567-49d9-8e18-21bab61ad7f6', 15.49, 117, '2023-12-20 18:27:58', '2024-01-29 02:06:52', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(444, '{\"en\":\"Mushroom Tagliatelle\"}', '{\"en\":\"Tagliatelle Elegance with Saut\\u00e9ed Mushrooms and Aromatic Herbs\"}', '432bf3ee-af49-4b0b-8faf-d6b7ef13117e', 14.99, 117, '2023-12-20 18:28:57', '2024-01-29 02:07:13', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(445, '{\"en\":\"Gnocchi with Gorgonzola\"}', '{\"en\":\"Pillowy Gnocchi in Velvety Gorgonzola Sauce, a Culinary Masterpiece\"}', '1b21370c-2e19-40e0-b0ac-29302dac7063', 16.99, 118, '2023-12-20 18:44:09', '2024-01-29 02:07:41', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(446, '{\"en\":\"Seafood Linguine\"}', '{\"en\":\"Seafood Linguine, a Harmony of Ocean-Inspired Flavors\"}', 'fff16918-cabb-44ab-ad0b-c2ab130cffc3', 18.49, 118, '2023-12-20 18:45:07', '2024-01-29 02:08:02', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(447, '{\"en\":\"Ricotta and Spinach Tortellini\"}', '{\"en\":\"Ricotta and Spinach Filled Pasta Pockets, a Culinary Masterpiece\"}', '81b3a10d-16c3-411e-826f-a3eb799ed2d4', 17.99, 118, '2023-12-20 18:46:06', '2024-01-29 02:08:27', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(448, '{\"en\":\"Garlic Bread\"}', '{\"en\":\"Crispy and Buttery Garlic Bread, a Timeless Ode to Simplicity\"}', 'dd08a66a-79a8-4e4b-95a9-5f1f85d6cb24', 4.99, 119, '2023-12-20 18:47:08', '2024-01-29 02:08:48', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(449, '{\"en\":\"Saut\\u00e9ed Vegetables\"}', '{\"en\":\"Saut\\u00e9ed Vegetables, a Colorful Medley Celebrating Nature\'s Bounty\"}', '1fc43199-f53e-4569-a19e-11577ed49fae', 6.49, 119, '2023-12-20 18:48:07', '2024-01-29 02:09:08', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(450, '{\"en\":\"Saut\\u00e9ed Vegetables\"}', '{\"en\":\"Experience the vibrant freshness of our Saut\\u00e9ed Vegetables, a colorful medley that celebrates the bounty of nature. Meticulously prepared and lightly saut\\u00e9ed, a diverse selection of crisp vegetables, including bell peppers, zucchini, and cherry tomatoes, come together in a harmonious dance of flavors and textures. Enhanced with a touch of aromatic herbs and olive oil, our Saut\\u00e9ed Vegetables deliver a palate-pleasing experience that captures the essence of wholesome goodness. Join us for a dining experience where every forkful of our Saut\\u00e9ed Vegetables becomes a journey through the garden, offering a delightful symphony of natural flavors.\"}', '7a219b48-ed2a-46ca-afa6-4a63026e1b96', 6.49, 119, '2023-12-20 18:48:07', '2023-12-20 18:48:38', 1, 0, 18.00, '2023-12-20 18:48:38', 0, 0, 1, 1, NULL),
(451, '{\"en\":\"Green Salad\"}', '{\"en\":\"Refresh your palate with our Green Salad, a vibrant ensemble that celebrates the crisp goodness of garden-fresh greens. A medley of tender lettuce leaves, crisp cucumber slices, and juicy cherry tomatoes come together in a delightful harmony of colors and textures. Tossed with our signature dressing, each bite is a celebration of simplicity and freshness. Whether enjoyed as a light starter or a refreshing side, our Green Salad is an invitation to savor the natural beauty of greens at their peak. Join us for a dining experience where our Green Salad becomes a refreshing and wholesome prelude to the culinary delights that await.\"}', 'fd16f4eb-91a3-4bd9-b5d4-258d29e6faaa', 5.99, 119, '2023-12-20 18:49:46', '2024-01-29 02:09:19', 1, 0, 18.00, '2024-01-29 02:09:19', 0, 0, 1, 1, NULL),
(452, '{\"en\":\"Classic Tiramisu\"}', '{\"en\":\"Classic Layers of Delicate Ladyfingers and Velvety Mascarpone\"}', '2d686f05-9165-4dcf-b701-5d191c126c24', 8.99, 120, '2023-12-20 18:50:52', '2024-01-29 02:09:44', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(453, '{\"en\":\"Red Berry Panna Cotta\"}', '{\"en\":\"Vanilla-Infused Panna Cotta with Fresh Red Berry Symphony\"}', 'c8b3fc29-35f9-4210-9215-4f7ac174ea38', 7.49, 120, '2023-12-20 18:51:49', '2024-03-22 19:21:12', 1, 0, 18.00, NULL, 0, 0, 0, 0, NULL),
(454, '{\"en\":\"Sicilian Cannoli\"}', '{\"en\":\"Crispy Cannoli with Velvety Ricotta Filling and Pistachio Elegance\"}', '329c6d18-5ed2-421a-9ef0-a139c1568e32', 6.99, 120, '2023-12-20 18:53:18', '2024-01-29 02:10:35', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(455, '{\"en\":\"Italian Wines\"}', '{\"en\":\"Explore the Vast Terroirs and Rich Traditions from Tuscany to Piedmont\"}', '3fa8961f-35c6-4da8-94b3-b178ee7714e5', 0, 121, '2023-12-20 18:55:41', '2024-02-01 15:19:41', 1, 1, 18.00, NULL, 0, 0, 0, 0, NULL),
(456, '{\"en\":\"Specialty Cocktails\"}', '{\"en\":\"Elevate Your Experience with Unique Flavors in Our Specialty Cocktails\"}', 'ac58aeb2-5844-41c2-91ca-664876cee50f', 11.99, 121, '2023-12-20 18:57:05', '2024-01-29 02:11:28', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(457, '{\"en\":\"Homemade Lemonades\"}', '{\"en\":\"Refresh Your Palate with Handcrafted Homemade Lemonades\"}', '89f0e57f-83e0-41c9-b13d-48fdf2e1af73', 3.99, 121, '2023-12-20 18:58:01', '2024-01-29 02:11:56', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(458, '{\"en\":\"Mineral Waters\"}', '{\"en\":\"Elevate Your Experience with Premium Mineral Waters\"}', '187f81c0-e0a9-4e36-9fa3-7a105bafb2d4', 2.49, 121, '2023-12-20 18:58:56', '2024-01-29 02:12:25', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(459, '{\"en\":\"Mojito\"}', '{\"en\":\"Embark on a refreshing journey with our Mojito, a quintessential cocktail that captures the essence of tropical bliss. Muddled fresh mint leaves, zesty lime wedges, and a touch of sugar create the perfect foundation for this iconic drink. Expertly shaken with premium white rum and topped with sparkling soda, our Mojito is a symphony of crispness and citrusy delight. Served over ice and garnished with a sprig of mint, each sip is a revitalizing escape to the vibrant flavors of summer. Join us for a Mojito experience that invigorates the senses and transports you to a place of pure, chilled indulgence.\"}', '8d7bb483-9d5d-48d2-8c04-78d65f38fefb', 9.99, 122, '2023-12-20 19:08:03', '2024-01-29 04:22:55', 1, 0, 18.00, '2024-01-29 04:22:55', 0, 0, 1, 1, NULL),
(460, '{\"en\":\"Dry Martini\"}', '{\"en\":\"Indulge in the timeless sophistication of our Dry Martini, a classic cocktail that transcends trends. Expertly crafted with premium gin and a whisper of dry vermouth, this iconic drink is stirred to perfection and garnished with a twist of lemon or an olive. The result is a libation of sheer elegance, where the botanical notes of the gin and the subtle herbal hints of vermouth create a harmonious balance. Served in a chilled glass, our Dry Martini is an invitation to savor the refined simplicity of a drink that has stood the test of time. Join us for a Martini experience that defines the epitome of chic and timeless cocktail culture.\"}', 'd8227030-1c3b-4e12-913f-410dd53f17d9', 11.49, 122, '2023-12-20 19:08:55', '2024-01-29 04:23:01', 1, 0, 18.00, '2024-01-29 04:23:01', 0, 0, 1, 1, NULL),
(461, '{\"en\":\"Margarita\"}', '{\"en\":\"Transport your taste buds to the sun-drenched beaches with our Margarita, a classic cocktail that embodies the spirit of celebration. Crafted with top-shelf tequila, fresh-squeezed lime juice, and a hint of orange liqueur, each sip is a harmonious blend of citrusy zing and smooth tequila warmth. Served over ice and rimmed with salt, our Margarita is a refreshing and invigorating experience. Whether you prefer it shaken or blended, our Margarita is a perfect companion for those seeking a taste of laid-back luxury. Join us for a Margarita moment and let the vibrant flavors of this iconic cocktail transport you to a state of pure, tropical bliss.\"}', '1d64dc74-ad2a-453d-8938-a9dfa6aea778', 10.99, 122, '2023-12-20 19:09:55', '2024-01-29 04:23:06', 1, 0, 18.00, '2024-01-29 04:23:06', 0, 0, 1, 1, NULL),
(462, '{\"en\":\"Passion Cosmopolitan\"}', '{\"en\":\"Immerse yourself in the tantalizing allure of our Passion Cosmopolitan, a contemporary twist on the classic cocktail that adds a burst of exotic flair. Crafted with premium vodka, triple sec, fresh cranberry juice, and a splash of passion fruit puree, each sip is a vibrant fusion of sweet and tangy sophistication. Shaken to perfection and served in a chilled martini glass, our Passion Cosmopolitan is a visual and flavorful masterpiece. Join us for a cocktail experience that combines the elegance of a Cosmo with the exotic allure of passion fruit, inviting you to indulge in a drink that is as stylish as it is delicious.\"}', 'c2a2f2f6-d156-40b2-9d9d-ff9108c35578', 12.99, 123, '2023-12-20 19:11:14', '2024-01-29 04:28:33', 1, 0, 18.00, '2024-01-29 04:28:33', 0, 0, 1, 1, NULL),
(463, '{\"en\":\"Smoky Old Fashioned\"}', '{\"en\":\"Experience the allure of nostalgia with our Smoky Old Fashioned, a modern interpretation of the timeless classic. Crafted with meticulous attention to detail, this distinguished cocktail features premium bourbon infused with the subtle warmth of demerara syrup and aromatic bitters. What sets our Old Fashioned apart is the infusion of smoky sophistication, achieved through the delicate embrace of cherry wood smoke. Served over a large ice cube and garnished with an orange twist, our Smoky Old Fashioned is a tribute to tradition with a contemporary twist. Join us for a refined and smoldering experience, where each sip is a journey through the rich and complex notes of this iconic libation.\"}', '108e4a3a-e3ab-4e71-a860-912ecd65a7d1', 14.49, 123, '2023-12-20 19:12:54', '2024-01-29 04:28:46', 1, 0, 18.00, '2024-01-29 04:28:46', 0, 0, 1, 1, NULL),
(464, '{\"en\":\"Sparkling Spritz\"}', '{\"en\":\"Elevate your moments with our Sparkling Spritz, a bubbly and effervescent cocktail that embodies the spirit of celebration. Crafted with finesse, this delightful concoction features your choice of premium sparkling wine or prosecco, blended with a splash of vibrant Aperol or Campari and a touch of soda. Served over ice and garnished with a slice of orange, our Sparkling Spritz is a refreshing symphony of citrus and bubbles, perfect for toasting to life\'s special moments. Join us for a Spritz experience that sparkles with effervescence and style, inviting you to indulge in the effervescent joy of this Italian-inspired classic.\"}', 'd8c9937a-60c1-49a1-9eb5-1657ce88c432', 11.99, 123, '2023-12-20 19:13:59', '2024-01-29 04:28:54', 1, 0, 18.00, '2024-01-29 04:28:54', 0, 0, 1, 1, NULL),
(465, '{\"en\":\"Single Malt Whisky starting from $15.99\"}', '{\"en\":\"Savor the distinguished character of our Single Malt Whisky collection, starting from $15.99. Immerse yourself in the rich nuances of each pour, where craftsmanship and heritage converge in a glass. Our curated selection showcases a variety of single malts, each distinguished by its unique flavor profile and regional influence. From the smoky depths of Islay to the heather-kissed highlands, our Single Malt Whiskies invite you to embark on a journey through the finest expressions of this revered spirit. Join us for a whisky experience where every sip becomes a moment to appreciate the artistry and complexity of single malt craftsmanship.\"}', '3f874240-7136-49bb-89ec-b64c10af9661', 15.99, 124, '2023-12-20 19:15:12', '2023-12-20 19:15:12', 1, 0, 18.00, NULL, 0, 0, 1, 1, NULL),
(466, '{\"en\":\"Premium Rum starting from $12.49\"}', '{\"en\":\"Indulge in the smooth sophistication of our Premium Rum collection, starting from $12.49. Elevate your spirits with each sip as you explore the rich and nuanced flavors of our curated selection. From the Caribbean\'s sun-soaked plantations to the amber hues of aged varieties, our Premium Rums promise a journey through the diverse terroirs and craftsmanship that define this beloved spirit. Join us for a rum experience where affordability meets excellence, inviting you to savor the artistry of our carefully selected offerings and discover the rich tapestry of flavors in every glass.\"}', '8f3bccbd-faee-4d4b-891e-3cd883304c33', 12.49, 124, '2023-12-20 19:16:22', '2023-12-20 19:16:22', 1, 0, 18.00, NULL, 0, 0, 1, 1, NULL),
(467, '{\"en\":\"Artisanal Gin starting from $13.99\"}', '{\"en\":\"Discover the craft and complexity of our Artisanal Gin collection, starting from $13.99. Immerse yourself in the world of small-batch distillation, where botanicals are carefully chosen to create a symphony of flavors. From the citrusy bursts to the herbal undertones, our curated selection of Artisanal Gins promises a spirited journey through the art of gin-making. Crafted by passionate distillers, these gins invite you to elevate your cocktail experience or enjoy them neat. Join us for a gin adventure where affordability meets the artisanal touch, and each pour becomes a celebration of the craft and creativity within your glass.\"}', '1015ae9c-412c-4b88-b3fd-48e463d89dbe', 13.99, 124, '2023-12-20 19:17:36', '2023-12-20 19:17:36', 1, 0, 18.00, NULL, 0, 0, 1, 1, NULL),
(468, '{\"en\":\"Wine Selection starting from $35.99\"}', '{\"en\":\"Explore the elevated world of our Wine Selection, starting from $35.99. Each bottle in our carefully curated collection is a masterpiece that encapsulates the essence of fine winemaking. From the velvety reds to the crisp whites, our wines hail from renowned vineyards around the world, promising an exquisite journey for your palate. Join us for a wine experience where affordability meets excellence, inviting you to savor the rich flavors and nuanced aromas in every pour. Raise your glass to a symphony of taste and indulge in the artistry that defines our thoughtfully selected Wine Selection.\"}', '125083e6-f285-4720-ae92-34d8541119ba', 35.99, 125, '2023-12-20 19:18:49', '2024-01-29 04:30:40', 1, 0, 18.00, '2024-01-29 04:30:40', 0, 0, 1, 1, NULL),
(469, '{\"en\":\"Local Craft Beers starting from $8.99\"}', '{\"en\":\"Embrace the local spirit with our selection of Local Craft Beers, starting from $8.99. Celebrate the vibrant flavors and craftsmanship of our community\'s breweries, where passion and creativity converge in every bottle. From hop-forward ales to smooth lagers, our curated collection promises a taste of the unique and the familiar. Join us for a craft beer experience that supports local brewers and invites you to savor the distinct personality of each brew. Raise your glass to the community\'s brewing artistry, where every sip becomes a tribute to the rich and diverse world of Local Craft Beers.\"}', '6bb2d9a4-e51e-40b4-a4c9-507172a84bfc', 8.99, 125, '2023-12-20 19:19:46', '2024-01-29 04:30:45', 1, 0, 18.00, '2024-01-29 04:30:45', 0, 0, 1, 1, NULL),
(470, '{\"en\":\"Artisanal Ciders starting from $10.49\"}', '{\"en\":\"Embark on a crisp and refreshing journey with our Artisanal Ciders, starting from $10.49. Crafted with precision and care, each cider in our collection captures the essence of orchard-fresh apples and the artistry of small-batch production. From the semi-dry to the sparkling varieties, our curated selection promises a delightful exploration of nuanced flavors. Join us for a cider experience that marries tradition with innovation, inviting you to savor the crisp effervescence and authentic taste of our thoughtfully chosen Artisanal Ciders. Raise your glass to the refreshing spirit of the orchard in every refreshing sip.\"}', '495633a9-a97f-44f0-bfa6-7499704042d0', 10.49, 125, '2023-12-20 19:20:34', '2024-01-29 04:30:55', 1, 0, 18.00, '2024-01-29 04:30:55', 0, 0, 1, 1, NULL),
(471, '{\"en\":\"Refreshing Mocktails starting from $7.99\"}', '{\"en\":\"Quench your thirst with our selection of Refreshing Mocktails, starting from $7.99. Crafted with the same dedication and creativity as our cocktails, these non-alcoholic delights promise a symphony of flavors without the spirits. From fruity fusions to herbal infusions, our curated collection invites you to indulge in the refreshing world of mocktails. Join us for a beverage experience where affordability meets flavor, and each sip becomes a celebration of vibrant and delightful moments. Whether you\'re looking for a non-alcoholic alternative or simply exploring new tastes, our Refreshing Mocktails are a perfect choice for a flavorful and uplifting experience.\"}', 'a049358a-9aea-465e-b995-d968cf6171bd', 7.99, 126, '2023-12-20 19:21:39', '2024-01-29 04:34:10', 1, 0, 18.00, '2024-01-29 04:34:10', 0, 0, 1, 1, NULL),
(472, '{\"en\":\"Fresh Fruit Juices starting from $4.49\"}', '{\"en\":\"Revitalize your senses with our Fresh Fruit Juices, starting from $4.49. Experience the pure essence of nature in every sip as we present a medley of handpicked fruits transformed into refreshing elixirs. From the zing of citrus to the sweet embrace of tropical fruits, our curated selection promises a vibrant journey for your taste buds. Join us for a juice experience where affordability meets freshness, and each glass becomes a celebration of the bountiful flavors nature has to offer. Raise your glass to the wholesome goodness of our Fresh Fruit Juices, crafted to invigorate and delight.\"}', 'bf06885d-cf6f-4f04-878a-43f789e06c4d', 4.49, 126, '2023-12-20 19:22:26', '2024-01-29 04:34:15', 1, 0, 18.00, '2024-01-29 04:34:15', 0, 0, 1, 1, NULL),
(473, '{\"en\":\"Sparkling Waters starting from $3.99\"}', '{\"en\":\"Quench your thirst with sophistication with our Sparkling Waters, starting from $3.99. Bubbling with effervescence, each bottle in our curated collection offers a crisp and refreshing alternative to still water. From the gentle fizz to the pure, clean taste, our Sparkling Waters are sourced from pristine springs to elevate your hydration experience. Join us for a water journey where affordability meets effervescence, and each sip becomes a celebration of the pure and invigorating qualities of Sparkling Waters. Raise your bottle to a bubbly and refined moment of hydration.\"}', '052699b0-00be-4cb4-8ebb-ddf60f4d3981', 3.99, 126, '2023-12-20 19:23:42', '2024-01-29 04:34:21', 1, 0, 18.00, '2024-01-29 04:34:21', 0, 0, 1, 1, NULL),
(499, '{\"en\":\"Classic Martini\"}', '{\"en\":\"Gin or Vodka, Dry Vermouth, Lemon Twist or Olive\"}', 'eccc9d9d-a349-425e-9e99-09eff02b3f64', 12, 122, '2024-01-29 04:23:58', '2024-03-28 14:20:17', 1, 0, 18.00, NULL, 0, 0, -2, 0, NULL),
(500, '{\"en\":\"Margarita\"}', '{\"en\":\"Tequila, Triple Sec, Lime Juice, Salted Rim\"}', '9e6867e7-1e37-41f4-a48c-8c855a0deb30', 11, 122, '2024-01-29 04:25:04', '2024-03-26 12:42:23', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(501, '{\"en\":\"Old Fashioned\"}', '{\"en\":\"Bourbon, Sugar Cube, Angostura Bitters, Orange Twist\"}', '3d07cd54-817a-401a-b3e4-40b6d00fe393', 12, 122, '2024-01-29 04:25:18', '2024-03-26 12:56:27', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(502, '{\"en\":\"Mojito\"}', '{\"en\":\"White Rum, Lime, Mint, Simple Syrup, Soda\"}', 'd92cbcdf-1c34-45be-af57-c43a9f45404d', 10.99, 122, '2024-01-29 04:25:30', '2024-03-26 12:42:41', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(503, '{\"en\":\"Cosmopolitan\"}', '{\"en\":\"Vodka, Triple Sec, Cranberry Juice, Lime Twist\"}', 'bae8d00a-46d1-4bcd-ae1c-970e8547635b', 13, 122, '2024-01-29 04:26:04', '2024-03-28 14:17:41', 1, 0, 18.00, NULL, 0, 0, 0, 0, NULL),
(504, '{\"en\":\"Pina Colada\"}', '{\"en\":\"Rum, Coconut Cream, Pineapple Juice, Pineapple Wedge\"}', '1a41ceae-e3ff-43e0-bb7a-c9331fe882a9', 9, 122, '2024-01-29 04:26:21', '2024-03-26 12:49:56', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(505, '{\"en\":\"Espresso Martini\"}', '{\"en\":\"Vodka, Coffee Liqueur, Freshly Brewed Espresso\"}', '984c3f4a-64b8-4d30-8330-14753810c993', 12, 122, '2024-01-29 04:26:36', '2024-03-26 12:50:04', 1, 0, 18.00, '2024-03-26 12:50:04', 0, 0, 1, 0, NULL),
(506, '{\"en\":\"Elderflower Sage Spritz\"}', '{\"en\":\"A refreshing blend of Elderflower Liqueur, Gin, and Fresh Lemon Juice, topped with soda and garnished with fragrant sage leaves and a lemon wheel\"}', '45028542-3ec5-4f8c-b952-73ef9b246d8f', 13.99, 123, '2024-01-29 04:29:09', '2024-03-26 13:01:58', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(507, '{\"en\":\"Berry Basil Smash\"}', '{\"en\":\"A delightful mix of Bourbon, Fresh Lime Juice, and Simple Syrup muddled with fresh strawberries and basil. Served over ice and garnished with a strawberry slice and basil sprig.\"}', '9a62c51d-4e25-46a4-b8c6-b75b34957173', 15.2, 123, '2024-01-29 04:29:28', '2024-03-26 13:02:15', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(508, '{\"en\":\"Smoke & Citrus Margarita\"}', '{\"en\":\"Experience the smoky allure of Mezcal combined with the zesty notes of Triple Sec, Fresh Lime Juice, and Agave Syrup. Finished with a smoked sea salt rim and an orange twist garnish.\"}', '25e1fefe-8b9b-4fa5-be01-6d3c8431b29e', 14.99, 123, '2024-01-29 04:29:46', '2024-03-26 13:02:28', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(509, '{\"en\":\"Local Craft Beer\"}', '{\"en\":\"more than 20 crafts beers\"}', 'b3fb5bb7-892f-47d0-ae76-21b918f3dbd9', 0, 125, '2024-01-29 04:31:52', '2024-03-26 17:13:58', 1, 1, 18.00, NULL, 0, 0, 1, 0, NULL),
(510, '{\"en\":\"Imported Lager\"}', '{\"en\":\"A selection of international favorites\"}', '1358d266-0817-4b30-b20f-ac304d4fcb47', 6, 125, '2024-01-29 04:32:35', '2024-03-26 17:25:24', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(511, '{\"en\":\"Pale Ale\"}', '{\"en\":\"Hoppy and flavorful\"}', 'e81c6d16-d2fa-4890-bb54-e9af15b38ffd', 6.2, 125, '2024-01-29 04:33:19', '2024-03-26 13:15:29', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(512, '{\"en\":\"Virgin Mojito\"}', '{\"en\":\"Lime, Mint, Simple Syrup, Soda\"}', '99a94d58-e63f-4282-9b63-4d5c9b6aa972', 8, 126, '2024-01-29 04:34:48', '2024-03-26 16:43:22', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(513, '{\"en\":\"Fruit Punch\"}', '{\"en\":\"A blend of tropical fruit juices\"}', '4ee6d1f3-ee83-4031-9204-7dcf02810378', 5, 126, '2024-01-29 04:35:08', '2024-03-26 16:43:34', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(514, '{\"en\":\"Iced Tea\"}', '{\"en\":\"Classic or flavored\"}', 'd1137364-3298-4aa6-ab62-9b70b5011a81', 4, 126, '2024-01-29 04:35:30', '2024-03-26 16:43:49', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(515, '{\"en\":\"Soda Selection\"}', '{\"en\":\"Cola, Ginger Ale, Tonic Water\"}', 'cb2a44c2-6f9b-45b8-a30b-7a45caf9ec10', 4, 126, '2024-01-29 04:35:54', '2024-03-26 16:44:00', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(516, '{\"en\":\"Red Wine\"}', '{\"en\":\"Cabernet Sauvignon, Merlot, Pinot Noir...\"}', '063f7acf-a3f7-4c90-9013-fd7b6d256f01', 0, 136, '2024-01-29 04:36:59', '2024-03-26 17:02:14', 1, 1, 18.00, NULL, 1, 0, 0, 0, NULL),
(517, '{\"en\":\"White Wines\"}', '{\"en\":\"Chardonnay, Sauvignon Blanc, Pinot Grigio...\"}', '2b329cc5-0a88-4f74-b119-d7b2359488fa', 0, 136, '2024-01-29 04:37:18', '2024-03-26 17:07:06', 1, 1, 18.00, NULL, 0, 0, 1, 0, NULL),
(518, '{\"en\":\"Ros\\u00e9\"}', '{\"en\":\"A refreshing choice for a lighter option\"}', 'bb96b144-45fb-464d-993e-f20304e5f87d', 0, 136, '2024-01-29 04:37:40', '2024-03-26 13:35:16', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(519, '{\"en\":\"Nachos\"}', '{\"en\":\"Loaded with cheese, salsa, guacamole, and sour cream\"}', 'ae94cb7c-464b-45b8-9e05-2313dcf94a97', 7.99, 137, '2024-01-29 04:40:41', '2024-03-26 16:58:48', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(520, '{\"en\":\"Chicken Wings\"}', '{\"en\":\"Choose your favorite sauce: Buffalo, BBQ, or Teriyaki\"}', '0b74cc4e-c707-40ae-a3fc-080603a95d75', 9, 137, '2024-01-29 04:41:09', '2024-03-26 16:59:00', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(521, '{\"en\":\"Bruschetta\"}', '{\"en\":\"Tomato, Basil, Garlic, Olive Oil on Toasted Baguette\"}', 'd3e92f74-91e4-4151-a580-5f0cfb41a9ed', 7, 137, '2024-01-29 04:41:32', '2024-03-26 17:00:12', 1, 0, 18.00, '2024-03-26 17:00:12', 0, 0, 1, 0, NULL),
(522, '{\"en\":\"Cheese Platter\"}', '{\"en\":\"Assorted cheeses, crackers, and fruit\"}', 'ee442132-a462-47ca-a457-f6c56a33c924', 24, 137, '2024-01-29 04:41:56', '2024-03-26 17:01:50', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(523, '{\"en\":\"Spinach Artichoke Sandwich\"}', '{\"en\":\"Served with tortilla chips\"}', '0dfaf3ab-cfc0-428b-b16a-32ace46e81ea', 12, 137, '2024-01-29 04:42:27', '2024-03-26 17:01:38', 1, 0, 18.00, NULL, 0, 0, 1, 0, NULL),
(526, '{\"en\":\"Menu Tradi\'\",\"fr\":\"Menu Tradi\'\"}', '{\"en\":\"Tous nos plats sont servis avec du riz cuit \\u00e0 l\\u2019\\u00e9tuv\\u00e9e. Choisissez votre recette pr\\u00e9f\\u00e9r\\u00e9e parmi nos sp\\u00e9cialit\\u00e9s sri-lankaises ! S\\u00e9lectionnez ensuite votre garniture, votre naan ainsi que votre boisson pour composer votre menu id\\u00e9al !\\r\\n\\r\\n1 Recette + 1 Garniture + 1 Naan + 1 Boisson 33cl au choix, servi avec du riz.\",\"fr\":\"Tous nos plats sont servis avec du riz cuit \\u00e0 l\\u2019\\u00e9tuv\\u00e9e. Choisissez votre recette pr\\u00e9f\\u00e9r\\u00e9e parmi nos sp\\u00e9cialit\\u00e9s sri-lankaises ! S\\u00e9lectionnez ensuite votre garniture, votre naan ainsi que votre boisson pour composer votre menu id\\u00e9al !\\r\\n\\r\\n1 Recette + 1 Garniture + 1 Naan + 1 Boisson 33cl au choix, servi avec du riz.\"}', '0f8c9a1f-66e7-4f20-88a3-a2e308e30381', 16.5, 140, '2024-03-18 23:01:07', '2024-05-12 11:21:25', 1, 1, 10.00, NULL, 0, 0, -134, 0, 'https://www.youtube.com/watch?v=toQmgWrfiOw'),
(527, '{\"en\":\"Menu NAANWICH\",\"fr\":\"Menu NAANWICH\"}', '{\"en\":\"Une recette de votre choix  roul\\u00e9e dans une galette naan ! Choisissez pour l\\u2019accompagner votre garniture, votre samoussa ainsi que votre boisson pour composer votre menu id\\u00e9al !\\r\\n\\r\\n1 Recette roul\\u00e9e dans une galette naan + 1 Samoussa + 1 Boisson 33cl au choix.\",\"fr\":\"Une recette de votre choix  roul\\u00e9e dans une galette naan ! Choisissez pour l\\u2019accompagner votre garniture, votre samoussa ainsi que votre boisson pour composer votre menu id\\u00e9al !\\r\\n\\r\\n1 Recette roul\\u00e9e dans une galette naan + 1 Samoussa + 1 Boisson 33cl au choix.\"}', 'bff27c78-de9a-47c5-841e-ec4732a29288', 11.5, 140, '2024-03-18 23:14:11', '2024-04-18 16:23:36', 1, 1, 10.00, NULL, 0, 0, -11, 0, NULL),
(528, '{\"en\":\"MENU VEGAN\",\"fr\":\"MENU VEGAN\"}', '{\"en\":\"Tous nos plats sont servis avec du riz cuit \\u00e0 l\\u2019\\u00e9tuv\\u00e9e. Choisissez votre recette pr\\u00e9f\\u00e9r\\u00e9e parmi nos sp\\u00e9cialit\\u00e9s sri-lankaises ! S\\u00e9lectionnez ensuite votre naan ainsi que votre boisson pour composer votre menu id\\u00e9al !\\r\\n\\r\\n1 Recette + 1 Naan + 1 Soft 33cl au choix, servi avec du riz.\",\"fr\":\"Tous nos plats sont servis avec du riz cuit \\u00e0 l\\u2019\\u00e9tuv\\u00e9e. Choisissez votre recette pr\\u00e9f\\u00e9r\\u00e9e parmi nos sp\\u00e9cialit\\u00e9s sri-lankaises ! S\\u00e9lectionnez ensuite votre naan ainsi que votre boisson pour composer votre menu id\\u00e9al !\\r\\n\\r\\n1 Recette + 1 Naan + 1 Soft 33cl au choix, servi avec du riz.\"}', 'c8ed8b4a-399d-4cf7-bc87-be1bf9c366b3', 14.5, 140, '2024-03-18 23:23:57', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, -12, 0, NULL),
(529, '{\"en\":\"ROLLS (2 pi\\u00e8ces)\",\"fr\":\"ROLLS (2 pi\\u00e8ces)\"}', '{\"en\":\"Sp\\u00e9cialit\\u00e9 de street-food du sud de l\\u2019Inde. Une cr\\u00eape roul\\u00e9e farcie d\\u2019une pr\\u00e9paration de votre choix et de pommes de terre parfum\\u00e9e aux \\u00e9pices.\\r\\n\\r\\nGo\\u00fbt : \\u00c9pic\\u00e9e et sucr\\u00e9e\\r\\nIngr\\u00e9dients : Tomates | Oignons | L\\u00e9gumes\",\"fr\":\"Sp\\u00e9cialit\\u00e9 de street-food du sud de l\\u2019Inde. Une cr\\u00eape roul\\u00e9e farcie d\\u2019une pr\\u00e9paration de votre choix et de pommes de terre parfum\\u00e9e aux \\u00e9pices.\\r\\n\\r\\nGo\\u00fbt : \\u00c9pic\\u00e9e et sucr\\u00e9e\\r\\nIngr\\u00e9dients : Tomates | Oignons | L\\u00e9gumes\"}', '813d273c-6f0b-4ea6-ba92-aac8995bb70c', 4.9, 141, '2024-03-18 23:32:46', '2024-04-12 16:12:08', 1, 1, 10.00, NULL, 0, 0, -17, 0, NULL),
(530, '{\"en\":\"SAMOSSA (2 Pi\\u00e8ces)\",\"fr\":\"SAMOSSA (2 Pi\\u00e8ces)\"}', '{\"en\":\"Un snack originaire du nord de l\\u2019Inde de forme triangulaire. Un beignet compos\\u00e9 d\\u2019une fine p\\u00e2te de bl\\u00e9 qui enrobe une farce de votre choix.\\r\\nGo\\u00fbt : \\u00c9pic\\u00e9e et sucr\\u00e9e\\r\\nIngr\\u00e9dients : Tomates | Oignons | L\\u00e9gumes\",\"fr\":\"Un snack originaire du nord de l\\u2019Inde de forme triangulaire. Un beignet compos\\u00e9 d\\u2019une fine p\\u00e2te de bl\\u00e9 qui enrobe une farce de votre choix.\\r\\nGo\\u00fbt : \\u00c9pic\\u00e9e et sucr\\u00e9e\\r\\nIngr\\u00e9dients : Tomates | Oignons | L\\u00e9gumes\"}', '1abcf995-281e-4670-a5f1-4bdd79e868e2', 4.9, 141, '2024-03-18 23:41:19', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, -1, 0, NULL),
(531, '{\"en\":\"BHAJJIS (5 pi\\u00e8ces)\",\"fr\":\"BHAJJIS (5 pi\\u00e8ces)\"}', '{\"en\":\"L\\u00e9gumes au choix enrob\\u00e9s de p\\u00e2te \\u00e0 beignet \\u00e0 base de farine de pois chiche et d\\u2019\\u00e9pices puis frits.\\r\\n\\r\\n    Go\\u00fbt : Gourmand et veggie\\r\\n    Ingr\\u00e9dients : \\u00c9pices | Gluten-free | L\\u00e9gumes\",\"fr\":\"L\\u00e9gumes au choix enrob\\u00e9s de p\\u00e2te \\u00e0 beignet \\u00e0 base de farine de pois chiche et d\\u2019\\u00e9pices puis frits.\\r\\n\\r\\n    Go\\u00fbt : Gourmand et veggie\\r\\n    Ingr\\u00e9dients : \\u00c9pices | Gluten-free | L\\u00e9gumes\"}', 'b634f5f2-47b1-4830-ad33-3c6facc1ba39', 4.9, 141, '2024-03-18 23:44:34', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, -3, 0, NULL),
(532, '{\"en\":\"Naan\",\"fr\":\"Naan\"}', '{\"en\":\"Le naan est un pain plat \\u00e0 base de farine de bl\\u00e9 et cuit sur la paroi br\\u00fblante d\\u2019un four tandoor.\",\"fr\":\"Le naan est un pain plat \\u00e0 base de farine de bl\\u00e9 et cuit sur la paroi br\\u00fblante d\\u2019un four tandoor.\"}', '22fffccb-1e8a-4280-b655-ff292175023c', 3, 141, '2024-03-18 23:46:35', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, -6, 0, NULL);
INSERT INTO `items` (`id`, `name`, `description`, `image`, `price`, `category_id`, `created_at`, `updated_at`, `available`, `has_variants`, `vat`, `deleted_at`, `enable_system_variants`, `discounted_price`, `qty`, `qty_management`, `youtube`) VALUES
(533, '{\"en\":\"Tikkas\",\"fr\":\"Tikkas\"}', '{\"en\":\"Morceaux de viande au choix marin\\u00e9s dans des \\u00e9pices et du yaourt puis cuits au four tandoor.\\r\\n\\r\\n    Saveur : \\u00c9pic\\u00e9e et parfum\\u00e9e\\r\\n    \\u00c9pice : \\ud83c\\udf36\\ufe0f\\r\\n    Ingr\\u00e9dients : Yaourt | Tomates | Curry | Curcuma | Gingembre | Citron | A\\u00efl | Soja\",\"fr\":\"Morceaux de viande au choix marin\\u00e9s dans des \\u00e9pices et du yaourt puis cuits au four tandoor.\\r\\n\\r\\n    Saveur : \\u00c9pic\\u00e9e et parfum\\u00e9e\\r\\n    \\u00c9pice : \\ud83c\\udf36\\ufe0f\\r\\n    Ingr\\u00e9dients : Yaourt | Tomates | Curry | Curcuma | Gingembre | Citron | A\\u00efl | Soja\"}', '425469b3-0f27-40e7-aee0-241bd29837c4', 5.9, 141, '2024-03-18 23:48:20', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, -1, 0, NULL),
(534, '{\"en\":\"Galette Naan - Boeuf Lanka\",\"fr\":\"Galette Naan - Boeuf Lanka\"}', '{\"en\":\"Une galette naan maison roul\\u00e9e. Viande de boeuf pr\\u00e9par\\u00e9e (hach\\u00e9e\\/assaisonn\\u00e9e) sur place et cuite au four traditionnel tandoor. Servi avec des crudit\\u00e9s.\\r\\n\\r\\n    Go\\u00fbt : Gourmand et \\u00e9pic\\u00e9\\r\\n    Crudit\\u00e9s : Salade verte | Oignons frais | Poivrons massala | Sauce lanka\",\"fr\":\"Une galette naan maison roul\\u00e9e. Viande de boeuf pr\\u00e9par\\u00e9e (hach\\u00e9e\\/assaisonn\\u00e9e) sur place et cuite au four traditionnel tandoor. Servi avec des crudit\\u00e9s.\\r\\n\\r\\n    Go\\u00fbt : Gourmand et \\u00e9pic\\u00e9\\r\\n    Crudit\\u00e9s : Salade verte | Oignons frais | Poivrons massala | Sauce lanka\"}', '833f4dc1-0203-40a6-a9aa-9b22fbda99e8', 7.5, 142, '2024-03-18 23:56:07', '2024-04-23 10:11:41', 1, 1, 10.00, NULL, 0, 0, -11, 0, NULL),
(535, '{\"en\":\"Galette Naan \\u2013 Poulet Tikka\",\"fr\":\"Galette Naan \\u2013 Poulet Tikka\"}', '{\"en\":\"Une galette naan maison roul\\u00e9e. Blancs de poulet marin\\u00e9s et cuit au four traditionnel tandoor. Servi avec des crudit\\u00e9s.\\r\\n\\r\\n        Go\\u00fbt : Frais, doucx et \\u00e9pic\\u00e9\\r\\n        Crudit\\u00e9s : Salade verte | Oignons frais | Poivrons massala | Sauce lanka\",\"fr\":\"Une galette naan maison roul\\u00e9e. Blancs de poulet marin\\u00e9s et cuit au four traditionnel tandoor. Servi avec des crudit\\u00e9s.\\r\\n\\r\\n        Go\\u00fbt : Frais, doucx et \\u00e9pic\\u00e9\\r\\n        Crudit\\u00e9s : Salade verte | Oignons frais | Poivrons massala | Sauce lanka\"}', 'ea0ae689-02c5-4b36-bb16-db41a31610fc', 7.5, 142, '2024-03-18 23:56:45', '2024-04-25 04:11:28', 1, 1, 10.00, NULL, 0, 0, -15, 0, NULL),
(536, '{\"en\":\"Galette Naan \\u2013 L\\u00e9gumes Massala\",\"fr\":\"Galette Naan \\u2013 L\\u00e9gumes Massala\"}', '{\"en\":\"Une galette naan maison roul\\u00e9e. Mix de l\\u00e9gumes de saison marin\\u00e9s fa\\u00e7on massala. Servi avec des crudit\\u00e9s.\\r\\n\\r\\n        Go\\u00fbt : Doux et \\u00e9pic\\u00e9\\r\\n        Crudit\\u00e9s : Salade verte | Oignons frais | Poivrons massala | Sauce lanka\",\"fr\":\"Une galette naan maison roul\\u00e9e. Mix de l\\u00e9gumes de saison marin\\u00e9s fa\\u00e7on massala. Servi avec des crudit\\u00e9s.\\r\\n\\r\\n        Go\\u00fbt : Doux et \\u00e9pic\\u00e9\\r\\n        Crudit\\u00e9s : Salade verte | Oignons frais | Poivrons massala | Sauce lanka\"}', 'dcaf107a-8914-47e1-81ba-a474e3ed58e9', 6.5, 142, '2024-03-18 23:57:17', '2024-04-25 04:11:28', 1, 1, 10.00, NULL, 0, 0, -6, 0, NULL),
(537, '{\"en\":\"BIRYANI\",\"fr\":\"BIRYANI\"}', '{\"en\":\"Riz cuit \\u00e0 l\\u02bc\\u00e9tuv\\u00e9e, issu des traditions familiales indiennes, saut\\u00e9 avec une sauce parfum\\u00e9e d\\u02bcherbes fra\\u00eeches. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Parfum\\u00e9 et herbac\\u00e9\\r\\n    Ingr\\u00e9dients : Cardamome | Gingembre | Ail | Laurier | Tomates | Oignons | Yaourt | Cannelle | Clous de girofle | Menthe | Coriandre\",\"fr\":\"Riz cuit \\u00e0 l\\u02bc\\u00e9tuv\\u00e9e, issu des traditions familiales indiennes, saut\\u00e9 avec une sauce parfum\\u00e9e d\\u02bcherbes fra\\u00eeches. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Parfum\\u00e9 et herbac\\u00e9\\r\\n    Ingr\\u00e9dients : Cardamome | Gingembre | Ail | Laurier | Tomates | Oignons | Yaourt | Cannelle | Clous de girofle | Menthe | Coriandre\"}', 'fbb3270c-bf56-4de7-ba14-f4c85b3c34b1', 12, 143, '2024-03-19 00:05:52', '2024-04-23 10:11:41', 1, 1, 10.00, NULL, 0, 0, -5, 0, NULL),
(538, '{\"en\":\"BUTTER\",\"fr\":\"BUTTER\"}', '{\"en\":\"Une sauce tomat\\u00e9e aux notes sucr\\u00e9es avec une pr\\u00e9dominante de cardamome et de cannelle. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : \\u00c9pic\\u00e9 et sucr\\u00e9\\r\\n    Ingr\\u00e9dients : Tomates | Oignons | Beurre | Paprika | Massala | \\u00c9pices indiennes | Amandes | Noix de cajoux\",\"fr\":\"Une sauce tomat\\u00e9e aux notes sucr\\u00e9es avec une pr\\u00e9dominante de cardamome et de cannelle. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : \\u00c9pic\\u00e9 et sucr\\u00e9\\r\\n    Ingr\\u00e9dients : Tomates | Oignons | Beurre | Paprika | Massala | \\u00c9pices indiennes | Amandes | Noix de cajoux\"}', 'a3068292-fc5d-4e1b-a512-c98e491d0431', 13, 143, '2024-03-19 00:07:12', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, -1, 0, NULL),
(539, '{\"en\":\"COCO\",\"fr\":\"COCO\"}', '{\"en\":\"Un incontournable de la cuisine indienne avec toute la fra\\u00eecheur du lait de coco. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Doux et frais\\r\\n    Ingr\\u00e9dients : Curry | Lait de coco | Oignons | Gingembre | A\\u00efl\",\"fr\":\"Un incontournable de la cuisine indienne avec toute la fra\\u00eecheur du lait de coco. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Doux et frais\\r\\n    Ingr\\u00e9dients : Curry | Lait de coco | Oignons | Gingembre | A\\u00efl\"}', '65cbd2fa-a9a6-48c4-98c4-d336f92199ab', 13, 143, '2024-03-19 00:14:39', '2024-04-29 07:08:27', 1, 1, 10.00, NULL, 0, 0, -3, 0, NULL),
(540, '{\"en\":\"CURRY\",\"fr\":\"CURRY\"}', '{\"en\":\"Sauce tomat\\u00e9e aux notes d\\u02bcagrumes r\\u00e9hauss\\u00e9e d\\u02bc\\u00e9pices s\\u00e8ches. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Parfum\\u00e9 et \\u00e9pices chaudes\\r\\n    Ingr\\u00e9dients : Paprika | Curry | Gingembre | Ail | Massala | Curcuma | Coriandre | Cannelle | Cardamome\",\"fr\":\"Sauce tomat\\u00e9e aux notes d\\u02bcagrumes r\\u00e9hauss\\u00e9e d\\u02bc\\u00e9pices s\\u00e8ches. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Parfum\\u00e9 et \\u00e9pices chaudes\\r\\n    Ingr\\u00e9dients : Paprika | Curry | Gingembre | Ail | Massala | Curcuma | Coriandre | Cannelle | Cardamome\"}', '821b0282-51ff-4390-9411-ef0dbecfdda6', 13, 143, '2024-03-19 00:18:53', '2024-04-18 16:30:45', 1, 1, 10.00, NULL, 0, 0, -1, 0, NULL),
(541, '{\"en\":\"DEWALLS\",\"fr\":\"DEWALLS\"}', '{\"en\":\"Une sauce \\u00e0 base de poivrons aux notes aigres douces. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Sucr\\u00e9 \\/ sal\\u00e9\\r\\n    Ingr\\u00e9dients : Poivrons | Oignons | Gingembre | Ail | Sweet chilli | Soja\",\"fr\":\"Une sauce \\u00e0 base de poivrons aux notes aigres douces. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Sucr\\u00e9 \\/ sal\\u00e9\\r\\n    Ingr\\u00e9dients : Poivrons | Oignons | Gingembre | Ail | Sweet chilli | Soja\"}', 'a31eb876-02e6-4458-833f-1a158c8f7e5f', 13, 143, '2024-03-19 00:19:24', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, 1, 0, NULL),
(542, '{\"en\":\"KORMA\",\"fr\":\"KORMA\"}', '{\"en\":\"Cette sauce vous rapellera la douceur et la rondeur d\\u02bcun velout\\u00e9 d\\u02bcamandes. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Doux\\r\\n    Ingr\\u00e9dients : Cr\\u00e8me | Poudre d\\u2019amande | Noix de cajoux | Raisins secs\",\"fr\":\"Cette sauce vous rapellera la douceur et la rondeur d\\u02bcun velout\\u00e9 d\\u02bcamandes. 1 garniture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Doux\\r\\n    Ingr\\u00e9dients : Cr\\u00e8me | Poudre d\\u2019amande | Noix de cajoux | Raisins secs\"}', '7ed90667-b437-48d1-a7f4-f8e2bdadfe9f', 13, 143, '2024-03-19 00:20:14', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, -1, 0, NULL),
(543, '{\"en\":\"TIKKA MASSALA\",\"fr\":\"TIKKA MASSALA\"}', '{\"en\":\"Sauce tomat\\u00e9e ronde et relev\\u00e9e d\\u02bcun m\\u00e9lange d\\u02bc\\u00e9pices. 1 garnture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Parfum\\u00e9 et exotique\\r\\n    Ingr\\u00e9dients : Poivrons | Gingembre | A\\u00efl | Paprika | Curry | Massala | Curcuma | Coriandre | Cannelle | Cardamome\",\"fr\":\"Sauce tomat\\u00e9e ronde et relev\\u00e9e d\\u02bcun m\\u00e9lange d\\u02bc\\u00e9pices. 1 garnture au choix, servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Parfum\\u00e9 et exotique\\r\\n    Ingr\\u00e9dients : Poivrons | Gingembre | A\\u00efl | Paprika | Curry | Massala | Curcuma | Coriandre | Cannelle | Cardamome\"}', 'c6d69f24-f35c-4642-aebb-2e95cc1ea67b', 13, 143, '2024-03-19 00:20:48', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, 0, 0, NULL),
(544, '{\"en\":\"COCO AUBERGINES\",\"fr\":\"COCO AUBERGINES\"}', '{\"en\":\"Plat v\\u00e9gan incontournable de la cuisine indienne avec toute la fra\\u00eecheur du lait de coco. Servi avec du riz.\\r\\n\\r\\n    Saveur : Doux et parfum\\u00e9\\r\\n    Ingr\\u00e9dients : Aubergines | Tomates | Oignons | Safran | Gingembre | A\\u00efl | Lait de coco\",\"fr\":\"Plat v\\u00e9gan incontournable de la cuisine indienne avec toute la fra\\u00eecheur du lait de coco. Servi avec du riz.\\r\\n\\r\\n    Saveur : Doux et parfum\\u00e9\\r\\n    Ingr\\u00e9dients : Aubergines | Tomates | Oignons | Safran | Gingembre | A\\u00efl | Lait de coco\"}', '504a7c15-d39a-4e9d-b600-8d5812f1ed0c', 11, 144, '2024-03-19 00:24:20', '2024-04-11 21:39:34', 1, 0, 10.00, NULL, 0, 0, -5, 1, NULL),
(545, '{\"en\":\"COCO AUBERGINES\"}', '{\"en\":\"Plat v\\u00e9gan incontournable de la cuisine indienne avec toute la fra\\u00eecheur du lait de coco. Servi avec du riz.\\r\\n\\r\\n    Saveur : Doux et parfum\\u00e9\\r\\n    Ingr\\u00e9dients : Aubergines | Tomates | Oignons | Safran | Gingembre | A\\u00efl | Lait de coco\"}', 'ca384168-8fb8-4416-a10c-0882c4ed957f', 11, 144, '2024-03-19 00:24:25', '2024-03-19 00:24:52', 1, 0, 10.00, '2024-03-19 00:24:52', 0, 0, 1, 1, NULL),
(546, '{\"en\":\"DAHL LENTILLES CORAIL\",\"fr\":\"DAHL LENTILLES CORAIL\"}', '{\"en\":\"Plat traditionnel v\\u00e9gan parfum\\u00e9, \\u00e0 base de lentilles corail, pr\\u00e9par\\u00e9 en rago\\u00fbt au lait de coco. Servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Doux et parfum\\u00e9\\r\\n    Ingr\\u00e9dients : Lentilles | \\u00c9pices | Lait de coco | Tomates | Oignons |\",\"fr\":\"Plat traditionnel v\\u00e9gan parfum\\u00e9, \\u00e0 base de lentilles corail, pr\\u00e9par\\u00e9 en rago\\u00fbt au lait de coco. Servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Doux et parfum\\u00e9\\r\\n    Ingr\\u00e9dients : Lentilles | \\u00c9pices | Lait de coco | Tomates | Oignons |\"}', '2c3e392d-6bd2-417d-9323-a8c331ab0d8c', 11, 144, '2024-03-19 00:25:24', '2024-04-11 21:39:34', 1, 0, 10.00, NULL, 0, 0, 0, 1, NULL),
(547, '{\"en\":\"PALAK EPINARDS\",\"fr\":\"PALAK EPINARDS\"}', '{\"en\":\"Plat v\\u00e9gan fin et d\\u00e9licat \\u00e0 base d\\u02bc\\u00e9pinards fondants, napp\\u00e9s de lait de coco. Servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : V\\u00e9g\\u00e9tal et gourmand\\r\\n    Ingr\\u00e9dients : \\u00c9pinards | Lait de coco | \\u00c9pices | Tomates | Oignons\",\"fr\":\"Plat v\\u00e9gan fin et d\\u00e9licat \\u00e0 base d\\u02bc\\u00e9pinards fondants, napp\\u00e9s de lait de coco. Servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : V\\u00e9g\\u00e9tal et gourmand\\r\\n    Ingr\\u00e9dients : \\u00c9pinards | Lait de coco | \\u00c9pices | Tomates | Oignons\"}', '851c7b8a-3905-479d-a4dd-85de3866c526', 11, 144, '2024-03-19 00:25:56', '2024-04-11 21:39:34', 1, 0, 10.00, NULL, 0, 0, 1, 1, NULL),
(548, '{\"en\":\"DEWALLS POIVRONS AUBERGINES\",\"fr\":\"DEWALLS POIVRONS AUBERGINES\"}', '{\"en\":\"Plat v\\u00e9gan color\\u00e9 et parfum\\u00e9, \\u00e0 base de poivrons et d\\u02bcaubergines, pr\\u00e9par\\u00e9 en rago\\u00fbt au massala. Servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Aigre doux\\r\\n    Ingr\\u00e9dients : Poivrons | Aubergines | \\u00c9pices | Tomates | Oignons\",\"fr\":\"Plat v\\u00e9gan color\\u00e9 et parfum\\u00e9, \\u00e0 base de poivrons et d\\u02bcaubergines, pr\\u00e9par\\u00e9 en rago\\u00fbt au massala. Servi avec du riz.\\r\\n\\r\\n    Go\\u00fbt : Aigre doux\\r\\n    Ingr\\u00e9dients : Poivrons | Aubergines | \\u00c9pices | Tomates | Oignons\"}', '1de3a191-b767-46f0-b103-db8209c594c2', 11, 144, '2024-03-19 00:26:32', '2024-04-17 16:51:00', 1, 0, 10.00, NULL, 0, 0, 0, 0, NULL),
(549, '{\"en\":\"SOFTS 33CL\",\"fr\":\"SOFTS 33CL\"}', '{\"en\":\"Coca-cola, Coca-z\\u00e9ro, Eau plate, Eau gazeuse....\",\"fr\":\"Coca-cola, Coca-z\\u00e9ro, Eau plate, Eau gazeuse....\"}', 'a77e5c9c-37f5-48aa-a70d-4cd855de8001', 2.9, 145, '2024-03-19 00:48:26', '2024-04-17 16:46:02', 1, 1, 10.00, NULL, 0, 0, -13, 0, NULL),
(550, '{\"en\":\"LASSI (Fait maison)\",\"fr\":\"LASSI (Fait maison)\"}', '{\"en\":\"Boisson traditionnelle \\u00e0 base de lait \\u00e9cr\\u00e9m\\u00e9 et de yahourt aromatis\\u00e9.\",\"fr\":\"Boisson traditionnelle \\u00e0 base de lait \\u00e9cr\\u00e9m\\u00e9 et de yahourt aromatis\\u00e9.\"}', '180eb689-3ed8-4dc3-96c6-10cde9887e58', 4.9, 145, '2024-03-19 00:51:24', '2024-04-11 21:39:34', 1, 1, 10.00, NULL, 0, 0, -11, 0, NULL),
(551, '{\"en\":\"HALWA\",\"fr\":\"HALWA\"}', '{\"en\":\"G\\u00e2teau de semoule au lait de coco servis avec cr\\u00e8me anglaise \\u00e0 la vanille et amandes effil\\u00e9es.\",\"fr\":\"G\\u00e2teau de semoule au lait de coco servis avec cr\\u00e8me anglaise \\u00e0 la vanille et amandes effil\\u00e9es.\"}', '63c90fde-99dd-49a2-872c-9f5d6a5673e5', 3.5, 146, '2024-03-19 00:54:44', '2024-04-16 15:54:23', 1, 0, 10.00, NULL, 0, 0, -23, 1, NULL),
(552, '{\"en\":\"GULAB JAMUN\",\"fr\":\"GULAB JAMUN\"}', '{\"en\":\"Petites boules de p\\u00e2te \\u00e0 beignet sucr\\u00e9e frites et imbib\\u00e9es dans un sirop parfum\\u00e9e \\u00e0 la cardamone. Un peu comme un Baba.\",\"fr\":\"Petites boules de p\\u00e2te \\u00e0 beignet sucr\\u00e9e frites et imbib\\u00e9es dans un sirop parfum\\u00e9e \\u00e0 la cardamone. Un peu comme un Baba.\"}', 'c92c396d-e3b8-46a8-8c48-2636363e3cce', 3.5, 146, '2024-03-19 00:55:12', '2024-04-17 16:46:02', 1, 0, 10.00, NULL, 0, 0, -3, 1, NULL),
(553, '{\"en\":\"Test Classic Buffalo Chicken Wings\"}', '{\"en\":\"dddddddddddddddd\"}', '1abb4672-0cef-4805-b6d0-097af16b09f5', 45, 107, '2024-03-19 15:05:57', '2024-03-19 15:06:07', 1, 0, 0.00, '2024-03-19 15:06:07', 0, 0, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_has_allergens`
--

CREATE TABLE `item_has_allergens` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED DEFAULT NULL,
  `allergen_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_has_allergens`
--

INSERT INTO `item_has_allergens` (`id`, `item_id`, `allergen_id`, `created_at`, `updated_at`) VALUES
(1, 344, 2, NULL, NULL),
(2, 344, 10, NULL, NULL),
(3, 344, 12, NULL, NULL),
(4, 364, 2, NULL, NULL),
(5, 364, 7, NULL, NULL),
(6, 367, 4, NULL, NULL),
(7, 367, 5, NULL, NULL),
(8, 367, 6, NULL, NULL),
(9, 367, 35, NULL, NULL),
(10, 378, 2, NULL, NULL),
(11, 378, 37, NULL, NULL),
(12, 376, 2, NULL, NULL),
(13, 376, 3, NULL, NULL),
(14, 376, 4, NULL, NULL),
(15, 374, 4, NULL, NULL),
(16, 374, 5, NULL, NULL),
(17, 374, 6, NULL, NULL),
(18, 374, 3, NULL, NULL),
(19, 374, 33, NULL, NULL),
(20, 374, 34, NULL, NULL),
(21, 374, 51, NULL, NULL),
(22, 389, 2, NULL, NULL),
(23, 393, 3, NULL, NULL),
(24, 393, 11, NULL, NULL),
(25, 393, 18, NULL, NULL),
(26, 395, 8, NULL, NULL),
(27, 395, 24, NULL, NULL),
(28, 397, 2, NULL, NULL),
(29, 397, 13, NULL, NULL),
(30, 397, 23, NULL, NULL),
(31, 396, 5, NULL, NULL),
(32, 396, 9, NULL, NULL),
(33, 396, 21, NULL, NULL),
(34, 398, 6, NULL, NULL),
(35, 398, 8, NULL, NULL),
(36, 398, 12, NULL, NULL),
(37, 399, 23, NULL, NULL),
(38, 399, 30, NULL, NULL),
(39, 399, 41, NULL, NULL),
(40, 400, 17, NULL, NULL),
(41, 400, 18, NULL, NULL),
(42, 400, 29, NULL, NULL),
(43, 401, 3, NULL, NULL),
(44, 401, 17, NULL, NULL),
(45, 401, 50, NULL, NULL),
(46, 402, 5, NULL, NULL),
(47, 402, 8, NULL, NULL),
(48, 402, 32, NULL, NULL),
(49, 403, 7, NULL, NULL),
(50, 403, 21, NULL, NULL),
(51, 403, 29, NULL, NULL),
(52, 404, 2, NULL, NULL),
(53, 404, 4, NULL, NULL),
(54, 404, 6, NULL, NULL),
(55, 405, 20, NULL, NULL),
(56, 405, 34, NULL, NULL),
(57, 405, 35, NULL, NULL),
(58, 406, 13, NULL, NULL),
(59, 406, 17, NULL, NULL),
(60, 474, 3, NULL, NULL),
(61, 474, 8, NULL, NULL),
(62, 474, 10, NULL, NULL),
(63, 476, 3, NULL, NULL),
(64, 476, 4, NULL, NULL),
(66, 476, 21, NULL, NULL),
(67, 477, 10, NULL, NULL),
(68, 483, 2, NULL, NULL),
(69, 483, 3, NULL, NULL),
(70, 483, 4, NULL, NULL),
(71, 407, 2, NULL, NULL),
(72, 407, 3, NULL, NULL),
(73, 407, 5, NULL, NULL),
(74, 476, 16, NULL, NULL),
(75, 379, 2, NULL, NULL),
(76, 379, 3, NULL, NULL),
(77, 379, 4, NULL, NULL),
(78, 411, 2, NULL, NULL),
(79, 411, 5, NULL, NULL),
(80, 411, 11, NULL, NULL),
(81, 416, 2, NULL, NULL),
(82, 416, 3, NULL, NULL),
(83, 416, 4, NULL, NULL),
(84, 416, 45, NULL, NULL),
(85, 416, 46, NULL, NULL),
(86, 423, 4, NULL, NULL),
(87, 423, 20, NULL, NULL),
(88, 423, 41, NULL, NULL),
(89, 426, 23, NULL, NULL),
(90, 426, 25, NULL, NULL),
(91, 426, 41, NULL, NULL),
(92, 434, 3, NULL, NULL),
(93, 434, 41, NULL, NULL),
(94, 434, 45, NULL, NULL),
(95, 434, 46, NULL, NULL),
(96, 434, 49, NULL, NULL),
(97, 441, 3, NULL, NULL),
(98, 441, 9, NULL, NULL),
(99, 441, 30, NULL, NULL),
(100, 439, 6, NULL, NULL),
(101, 443, 23, NULL, NULL),
(102, 443, 46, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `created_at`, `updated_at`, `slug`, `name`, `table_name`) VALUES
(1, '0000-00-00 00:00:00', '2023-12-20 21:21:10', 'compare_plan_name_cost_saving_eco', 'COST-SAVING  & ECO- FRIENDLY', 'compare_plan_name'),
(2, NULL, '2023-11-22 12:08:28', 'compare_plan_name_no_setup_cost', 'No set-up cost', 'compare_plan_name'),
(4, NULL, '2023-11-22 08:17:20', 'compare_plan_name_eco_friendly', 'Eco-friendly', 'compare_plan_name'),
(5, NULL, '2023-12-20 14:53:31', 'compare_plan_name_boost_your_business', 'Boost Your Business Efficiency', 'compare_plan_name'),
(6, NULL, '2023-11-17 12:47:54', 'compare_plan_name_features', 'Features', 'compare_plan_name'),
(7, NULL, '2023-11-22 12:33:18', 'compare_plan_name_cut_opt_cost', 'Cut operational cost', 'compare_plan_name'),
(8, NULL, '2023-12-21 15:37:40', 'compare_plan_name_detailed_reports', 'Detailed Reports', 'compare_plan_name'),
(9, NULL, '2024-01-01 13:12:08', 'compare_plan_name_increase_sales', 'Increase sales by 10% - 15% using our offers section', 'compare_plan_name'),
(10, NULL, '2023-12-20 15:25:28', 'compare_plan_name_saving_foh', 'Savings on FOH labour costs', 'compare_plan_name'),
(11, NULL, '2023-12-21 15:38:36', 'compare_plan_name_order_limit', 'Order limit', 'compare_plan_name'),
(12, NULL, NULL, 'compare_plan_name_unlimited_product', 'Unlimited product', 'compare_plan_name'),
(13, NULL, '2023-12-21 15:38:50', 'compare_plan_name_order_management', 'ORDER MANAGEMENT (POS as to be integrated)', 'compare_plan_name'),
(14, NULL, '2023-11-19 13:15:05', 'compare_plan_name_delivery_pick_dine', 'Delivery, Pick-up and Dine in Experience', 'compare_plan_name'),
(15, NULL, '2023-12-21 15:39:09', 'compare_plan_name_payments_gateway', 'Payments gateway get your money fast from you customer', 'compare_plan_name'),
(16, NULL, NULL, 'compare_plan_name_data_analytics', 'Data Analytics to increase\n                    more sales', 'compare_plan_name'),
(17, NULL, NULL, 'compare_plan_name_engage', 'ENGAGE & DELIGHT YOUR CUSTOMERS', 'compare_plan_name'),
(18, NULL, '2023-11-19 13:15:23', 'compare_plan_name_connect_customers', 'Connect with customers  on Social Media', 'compare_plan_name'),
(19, NULL, NULL, 'compare_plan_name_control_presence', 'Control your online\n                    presence', 'compare_plan_name'),
(20, NULL, '2023-11-19 13:13:05', 'compare_plan_name_customer_support', 'Get excellent customer                    support', 'compare_plan_name'),
(21, NULL, '2023-12-21 15:39:52', 'compare_plan_name_collect_reviews', 'Collect reviews from customers (Google reviews, TripAdvisor)', 'compare_plan_name'),
(22, NULL, '2023-12-21 15:40:01', 'compare_plan_name_elevate_dining_experience', 'Elevate Dining Experience', 'compare_plan_name'),
(23, NULL, '2024-01-01 13:14:29', 'compare_plan_name_add_items', 'Unlimited product', 'compare_plan_name'),
(24, NULL, NULL, 'compare_plan_name_browse_menu', 'Browse the Menu', 'compare_plan_name'),
(25, NULL, NULL, 'compare_plan_name_call_waiter', 'Call Your Waiter', 'compare_plan_name'),
(26, NULL, '2023-12-21 15:40:36', 'compare_plan_name_create_dining_experience', 'Create the dine-in experience', 'compare_plan_name'),
(27, NULL, '2024-01-01 13:14:47', 'compare_plan_name_dynamic_pricing', 'Dynamic pricing (changes automatically according to time)', 'compare_plan_name'),
(28, NULL, '2024-01-01 13:14:50', 'compare_plan_name_qr_code_menu', 'QR-code menu', 'compare_plan_name'),
(29, NULL, NULL, 'compare_plan_name_quick_search', 'Quick search by name', 'compare_plan_name'),
(30, NULL, NULL, 'compare_plan_name_unique_qr_code', 'Unique QR code for each\n                    table', 'compare_plan_name'),
(31, NULL, NULL, 'compare_plan_name_expand', 'EXPAND YOUR SERVICE', 'compare_plan_name'),
(32, NULL, '2023-12-21 15:54:48', 'compare_plan_name_expand_features', 'Expand with extra features (POS, delivery, Pickup, and Takeaway)', 'compare_plan_name'),
(33, NULL, NULL, 'compare_plan_name_globalize', 'GLOBALIZE YOUR BUSINESS', 'compare_plan_name'),
(34, NULL, NULL, 'compare_plan_name_custom_domain', 'Custom domain name', 'compare_plan_name'),
(35, NULL, '2023-12-21 15:55:03', 'compare_plan_name_menu_generator', 'Menu generator (PDF)', 'compare_plan_name'),
(36, NULL, NULL, 'compare_plan_name_translation', 'Translation into 7 languages', 'compare_plan_name'),
(37, NULL, NULL, 'compare_plan_name_effortless_menu_control', 'EFFORTLESS MENU CONTROL', 'compare_plan_name'),
(38, NULL, NULL, 'compare_plan_name_allergens', 'Allergens', 'compare_plan_name'),
(39, NULL, NULL, 'compare_plan_name_menu_management', 'Easy menu management', 'compare_plan_name'),
(40, NULL, NULL, 'compare_plan_name_optional_change', 'No operational change', 'compare_plan_name'),
(41, NULL, NULL, 'compare_plan_name_support', 'ADAPTABLE SUPPORT FOR ALL SIZES', 'compare_plan_name'),
(42, NULL, '2023-12-21 15:55:43', 'compare_plan_name_multiple_accounts', 'Multiple accounts (staff)', 'compare_plan_name'),
(43, NULL, NULL, 'compare_plan_name_support_tickets', 'General support tickets', 'compare_plan_name'),
(44, NULL, '2024-01-03 16:31:25', 'compare_plan_name_priority_support', 'Priority support', 'compare_plan_name'),
(45, NULL, NULL, 'compare_plan_name_qr_scans', 'Unlimited QR scans', 'compare_plan_name'),
(46, NULL, '2024-01-01 13:15:48', 'compare_plan_name_suitable_business', 'Suitable for small, medium, and large businesses (café, restaurant, bar, pub, night club, foodtruck and more)', 'compare_plan_name'),
(47, NULL, NULL, 'compare_plan_name_add_images', 'Add images', 'compare_plan_name'),
(48, NULL, '2024-01-01 13:15:49', 'compare_plan_name_add_logo', 'Add logo', 'compare_plan_name'),
(49, NULL, NULL, 'compare_plan_name_customizable_design', 'Customizable design', 'compare_plan_name'),
(50, NULL, NULL, 'compare_plan_name_free_themes', 'Free Themes', 'compare_plan_name'),
(51, NULL, '2023-12-21 15:56:50', 'compare_plan_name_instant_updates', 'Instant updates', 'compare_plan_name'),
(52, NULL, NULL, 'compare_plan_name_personalise_menu', 'Personalise your menu', 'compare_plan_name'),
(53, NULL, NULL, 'compare_plan_name_view_from_device', 'View from any device', 'compare_plan_name'),
(54, NULL, NULL, 'compare_plan_name_design_it_your_way', 'DESIGN IT YOUR WAY', 'compare_plan_name');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localmenus`
--

CREATE TABLE `localmenus` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `languageName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` int NOT NULL DEFAULT '0' COMMENT '0 - No, 1 - Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `localmenus`
--

INSERT INTO `localmenus` (`id`, `created_at`, `updated_at`, `restaurant_id`, `language`, `languageName`, `default`) VALUES
(27, '2024-02-06 19:00:15', '2024-03-20 22:22:22', 61, 'eo', 'Esperanto', 1),
(31, '2024-03-20 23:19:30', '2024-03-20 23:19:30', 187, 'en', 'en', 1),
(32, '2024-04-11 21:39:34', '2024-04-11 21:39:34', 187, 'fr', 'French', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_29_200844_create_languages_table', 1),
(4, '2018_08_29_205156_create_translations_table', 1),
(5, '2019_05_03_000001_create_customer_columns', 1),
(6, '2019_05_03_000002_create_subscriptions_table', 1),
(7, '2019_05_03_000003_create_subscription_items_table', 1),
(8, '2020_02_06_010033_create_permission_tables', 1),
(9, '2020_02_06_022212_create_restorants_table', 1),
(10, '2020_02_09_015116_create_status_table', 1),
(11, '2020_02_09_152551_create_categories_table', 1),
(12, '2020_02_09_152656_create_items_table', 1),
(13, '2020_02_11_052117_create_address_table', 1),
(14, '2020_02_11_054259_create_orders_table', 1),
(15, '2020_02_20_094727_create_settings_table', 1),
(16, '2020_03_25_134914_create_pages_table', 1),
(17, '2020_04_03_143518_update_settings_table', 1),
(18, '2020_04_10_202027_create_payments_table', 1),
(19, '2020_04_11_165819_update_table_orders', 1),
(20, '2020_04_22_105556_update_items_table', 1),
(21, '2020_04_23_212320_update_restorants_table', 1),
(22, '2020_04_23_212502_update_orders_table', 1),
(23, '2020_04_28_112519_update_address_table', 1),
(24, '2020_05_07_122727_create_hours_table', 1),
(25, '2020_05_09_012646_update_orders_add_delivery_table', 1),
(26, '2020_05_09_024507_add_options_to_settings_table', 1),
(27, '2020_05_20_232204_create_notifications_table', 1),
(28, '2020_06_03_134258_change_radius_to_delivery_area_restorants_table', 1),
(29, '2020_06_26_131803_create_sms_verifications_table', 1),
(30, '2020_07_12_182829_create_extras_table', 1),
(31, '2020_07_14_155509_create_plan_table', 1),
(32, '2020_07_23_183000_update_restorants_with_featured', 1),
(33, '2020_07_28_131511_update_users_sms_verification', 1),
(34, '2020_07_30_102916_change_json_to_string', 1),
(35, '2020_08_01_014851_create_variants', 1),
(36, '2020_08_14_003718_create_ratings_table', 1),
(37, '2020_08_18_035731_update_table_plans', 1),
(38, '2020_08_18_053012_update_user_add_plan', 1),
(39, '2020_09_02_131604_update_orders_time_to_prepare', 1),
(40, '2020_09_09_080747_create_cities_table', 1),
(41, '2020_09_28_131250_update_item_softdelete', 1),
(42, '2020_10_24_150254_create_tables_table', 1),
(43, '2020_10_25_021321_create_visits_table', 1),
(44, '2020_10_26_004421_update_orders_client_nullable', 1),
(45, '2020_10_26_104351_update_restorant_table', 1),
(46, '2020_10_26_190049_update_plan', 1),
(47, '2020_10_27_180123_create_stripe_payment', 1),
(48, '2020_11_01_190615_update_user_table', 1),
(49, '2020_11_05_081140_create_paths_table', 1),
(50, '2020_11_14_111220_create_phone_in_orders', 1),
(51, '2020_11_17_211252_update_logo_in_settings', 1),
(52, '2020_11_25_182453_create_paypal_payment', 1),
(53, '2020_11_25_225536_update_user_for_paypal_subsc', 1),
(54, '2020_11_27_102829_update_restaurants_for_delivery_pickup', 1),
(55, '2020_11_27_165901_create_coupons_table', 1),
(56, '2020_12_02_192213_update_for_whatsapp_order', 1),
(57, '2020_12_02_195333_update_for_mollie_payment', 1),
(58, '2020_12_07_142304_create_banners_table', 1),
(59, '2020_12_10_155335_wp_address', 1),
(60, '2020_12_14_195627_update_for_paystack_sub', 1),
(61, '2020_12_15_130511_update_paystack_verification', 1),
(62, '2020_12_27_155822_create_restaurant_multilanguage', 1),
(63, '2020_12_27_162902_update_restaurant_with_currency', 1),
(64, '2021_01_16_093708_update_restorant_with_pay_link', 1),
(65, '2021_01_22_142723_create_crud_for_whatsapp_landing', 1),
(66, '2021_02_16_065037_create_configs_table', 2),
(67, '2021_02_18_140330_allow_null_on_config_value', 2),
(68, '2021_02_22_135519_update_settinga_table', 2),
(69, '2021_02_26_113854_order_fee_update', 2),
(70, '2021_03_23_135952_update_config_table', 2),
(71, '2021_04_17_002457_update_restables', 2),
(72, '2021_04_17_231310_update_restablesagain', 2),
(73, '2021_04_22_184249_update_user_with_staff', 2),
(74, '2021_04_26_190410_create_cart_storage_table', 2),
(75, '2021_05_19_032734_update_order_with_employee_id', 2),
(76, '2021_05_19_124342_create_simple_delivery_areas', 2),
(77, '2021_05_28_070715_create_expenses', 2),
(78, '2021_07_01_084847_make_restaurant_soft_delete', 2),
(79, '2021_07_16_170627_make_user_soft_delete', 2),
(80, '2021_07_16_172430_make_user_email_not_unique', 2),
(81, '2021_07_21_153807_rename_to_company', 2),
(82, '2021_08_04_073843_add_md_to_orders', 2),
(83, '2021_09_03_131601_update_with_default_variants', 2),
(84, '2021_09_04_091444_cat_sd', 2),
(85, '2021_10_09_162446_update_order_with_coupons', 2),
(86, '2021_11_06_104921_create_item_has_allergens', 2),
(87, '2022_01_26_085729_update_item_desc_to_text', 2),
(88, '2022_02_26_234212_update_users_with_expotoken', 2),
(89, '2022_04_06_224707_update_items_with_discount_price', 2),
(90, '2022_04_14_082828_update_companies_with_can_dinein', 2),
(91, '2022_04_14_091003_update_delivery_areas_with_phone', 2),
(92, '2022_05_19_071840_compatible_with_stripe', 2),
(93, '2022_07_23_081211_kds', 2),
(94, '2022_08_03_170522_user_has_categories', 2),
(95, '2022_12_23_100529_update_orders_with_id_per_vendor', 2),
(96, '2022_12_27_012420_update_posts_description_table', 2),
(97, '2023_01_23_175344_large_numbers', 2),
(98, '2025_07_21_162114_make_pure_saas', 2),
(99, '2023_05_22_203323_update_order__table_with_tips', 3),
(100, '2023_05_23_212332_update_items_with_stock', 3),
(101, '2023_05_26_162559_vendor_has_categories', 3),
(102, '2023_05_24_113124_update_plan_with_razorpay', 4),
(103, '2023_08_30_185056_add_column_to_companies_table', 5),
(104, '2023_08_30_190206_add_column_to_plan_table', 5),
(105, '2019_09_15_000010_create_tenants_table', 6),
(106, '2019_09_15_000020_create_domains_table', 6),
(107, '2023_10_23_142310_create_period_discounts_table', 6),
(108, '2023_10_28_205029_create_contact_messages_table', 6),
(109, '2023_11_02_140451_create_period_discount_for_restourant_table', 6),
(110, '2023_11_02_161007_create_compare_plan_name', 6),
(111, '2023_11_06_180603_change_unique_field_in_table', 6),
(112, '2023_11_14_185300_create_labels_table', 7),
(113, '2023_11_14_190533_make_slug_unique_in_labels', 7),
(114, '2023_11_14_192004_add_table_name_to_labels', 7),
(115, '2023_12_06_120611_add_monthly_price_to_plan', 7),
(116, '2023_12_15_083819_create_plan_coupons_table', 8),
(117, '2023_12_20_154533_change_order_limit_type_in_compare_plan_name', 9),
(118, '2023_12_24_021528_create_jobs_table', 10),
(119, '2023_12_22_092602_add_lang_limit_to_plan', 11),
(120, '2023_12_22_160030_create_jobs_table', 11),
(121, '2023_12_25_121502_add_show_price_to_user_table', 12),
(122, '2023_12_26_070530_create_limits_table', 12),
(123, '2023_12_31_074257_create_plan_coupons_table', 11),
(126, '2023_12_31_082442_change_code_size_in_plan_coupon_table', 13),
(127, '2024_01_25_045834_create_payment_histories_table', 14),
(128, '2024_01_31_134254_create_failed_jobs_table', 15),
(129, '2024_04_04_101815_add_delivery_area_tax_to_companies_table', 16),
(130, '2024_04_22_155559_create_temp_orders_table', 17),
(131, '2024_04_25_150252_add_new_address_columns_and_remove_old_address_column_from_companies_table', 18),
(132, '2024_04_25_170308_remove_address_column_from_companies_table', 19),
(133, '2024_04_27_165607_rename_address_1_column_in_companies_table', 20),
(134, '2024_04_28_094925_remove_address_2_column_from_companies_table', 21),
(135, '2024_05_09_134404_add_column_to_plan_coupons_table', 22),
(136, '2024_05_10_072836_create_dynamic_prices_table', 22),
(137, '2024_05_11_074529_drop_column_from_plan_coupons_table', 22),
(138, '2024_05_12_103824_add_youtube_to_items_table', 23);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(5, 'App\\User', 3),
(5, 'App\\User', 4),
(5, 'App\\User', 5),
(5, 'App\\User', 6),
(5, 'App\\User', 7),
(5, 'App\\User', 8),
(5, 'App\\User', 9),
(5, 'App\\User', 10),
(5, 'App\\User', 11),
(5, 'App\\User', 12),
(5, 'App\\User', 13),
(5, 'App\\User', 14),
(5, 'App\\User', 15),
(5, 'App\\User', 16),
(5, 'App\\User', 17),
(5, 'App\\User', 18),
(5, 'App\\User', 19),
(5, 'App\\User', 20),
(5, 'App\\User', 21),
(5, 'App\\User', 22),
(5, 'App\\User', 23),
(5, 'App\\User', 24),
(5, 'App\\User', 25),
(5, 'App\\User', 26),
(5, 'App\\User', 27),
(5, 'App\\User', 28),
(5, 'App\\User', 29),
(5, 'App\\User', 30),
(5, 'App\\User', 31),
(5, 'App\\User', 32),
(5, 'App\\User', 33),
(5, 'App\\User', 34),
(2, 'App\\User', 35),
(5, 'App\\User', 36),
(6, 'App\\User', 37),
(2, 'App\\User', 38),
(5, 'App\\User', 39),
(2, 'App\\User', 40),
(2, 'App\\User', 41),
(2, 'App\\User', 42),
(6, 'App\\User', 43),
(2, 'App\\User', 44),
(2, 'App\\User', 45),
(5, 'App\\User', 46),
(2, 'App\\User', 47),
(2, 'App\\User', 48),
(2, 'App\\User', 49),
(2, 'App\\User', 50),
(2, 'App\\User', 51),
(2, 'App\\User', 52),
(5, 'App\\User', 53),
(5, 'App\\User', 54),
(3, 'App\\User', 55),
(5, 'App\\User', 56),
(5, 'App\\User', 57),
(2, 'App\\User', 58),
(2, 'App\\User', 59),
(2, 'App\\User', 60),
(2, 'App\\User', 61),
(2, 'App\\User', 62),
(2, 'App\\User', 63),
(2, 'App\\User', 64),
(2, 'App\\User', 65),
(2, 'App\\User', 66),
(2, 'App\\User', 67),
(2, 'App\\User', 68),
(2, 'App\\User', 69),
(2, 'App\\User', 70),
(2, 'App\\User', 71),
(2, 'App\\User', 72),
(2, 'App\\User', 73),
(2, 'App\\User', 74),
(2, 'App\\User', 75),
(2, 'App\\User', 76),
(2, 'App\\User', 77),
(2, 'App\\User', 78),
(2, 'App\\User', 79),
(2, 'App\\User', 80),
(2, 'App\\User', 81),
(2, 'App\\User', 82),
(2, 'App\\User', 83),
(2, 'App\\User', 84),
(2, 'App\\User', 85),
(2, 'App\\User', 86),
(2, 'App\\User', 87),
(2, 'App\\User', 88),
(2, 'App\\User', 89),
(2, 'App\\User', 90),
(2, 'App\\User', 91),
(2, 'App\\User', 92),
(2, 'App\\User', 93),
(2, 'App\\User', 94),
(2, 'App\\User', 95),
(2, 'App\\User', 96),
(2, 'App\\User', 97),
(2, 'App\\User', 98),
(2, 'App\\User', 99),
(2, 'App\\User', 100),
(2, 'App\\User', 101),
(2, 'App\\User', 102),
(2, 'App\\User', 103),
(5, 'App\\User', 104),
(5, 'App\\User', 105),
(5, 'App\\User', 106),
(2, 'App\\User', 107),
(2, 'App\\User', 108),
(2, 'App\\User', 109),
(2, 'App\\User', 110),
(2, 'App\\User', 111),
(2, 'App\\User', 112),
(2, 'App\\User', 113),
(2, 'App\\User', 114),
(2, 'App\\User', 115),
(2, 'App\\User', 116),
(2, 'App\\User', 117),
(2, 'App\\User', 118),
(2, 'App\\User', 119),
(2, 'App\\User', 120),
(3, 'App\\User', 121),
(5, 'App\\User', 122),
(5, 'App\\User', 123),
(2, 'App\\User', 124),
(2, 'App\\User', 125),
(2, 'App\\User', 126),
(5, 'App\\User', 127),
(2, 'App\\User', 128),
(2, 'App\\User', 129),
(2, 'App\\User', 130),
(2, 'App\\User', 131),
(2, 'App\\User', 132),
(2, 'App\\User', 133),
(2, 'App\\User', 134),
(2, 'App\\User', 135),
(2, 'App\\User', 136),
(2, 'App\\User', 137),
(2, 'App\\User', 138),
(2, 'App\\User', 139),
(2, 'App\\User', 140),
(2, 'App\\User', 141),
(2, 'App\\User', 142),
(2, 'App\\User', 143),
(2, 'App\\User', 144),
(2, 'App\\User', 145),
(2, 'App\\User', 146),
(2, 'App\\User', 147),
(2, 'App\\User', 148),
(2, 'App\\User', 149),
(2, 'App\\User', 150),
(2, 'App\\User', 151),
(2, 'App\\User', 152),
(2, 'App\\User', 153),
(2, 'App\\User', 154),
(2, 'App\\User', 155),
(2, 'App\\User', 156),
(2, 'App\\User', 157),
(2, 'App\\User', 158),
(3, 'App\\User', 159),
(3, 'App\\User', 160),
(2, 'App\\User', 161),
(2, 'App\\User', 162),
(2, 'App\\User', 163),
(2, 'App\\User', 164),
(2, 'App\\User', 165),
(2, 'App\\User', 166),
(2, 'App\\User', 167),
(2, 'App\\User', 168),
(2, 'App\\User', 169),
(2, 'App\\User', 170),
(2, 'App\\User', 171),
(2, 'App\\User', 172),
(2, 'App\\User', 173),
(2, 'App\\User', 174),
(2, 'App\\User', 175),
(2, 'App\\User', 176),
(2, 'App\\User', 177),
(2, 'App\\User', 178),
(2, 'App\\User', 179),
(2, 'App\\User', 180),
(2, 'App\\User', 181),
(2, 'App\\User', 182),
(2, 'App\\User', 183),
(2, 'App\\User', 184),
(2, 'App\\User', 185),
(2, 'App\\User', 186),
(2, 'App\\User', 187),
(2, 'App\\User', 188),
(2, 'App\\User', 189),
(2, 'App\\User', 190),
(2, 'App\\User', 191),
(2, 'App\\User', 192),
(6, 'App\\User', 193),
(2, 'App\\User', 194),
(5, 'App\\User', 195),
(2, 'App\\User', 196),
(2, 'App\\User', 197),
(2, 'App\\User', 198),
(2, 'App\\User', 199),
(2, 'App\\User', 200),
(2, 'App\\User', 201),
(2, 'App\\User', 202),
(2, 'App\\User', 203),
(2, 'App\\User', 204),
(2, 'App\\User', 205),
(2, 'App\\User', 206),
(2, 'App\\User', 207),
(2, 'App\\User', 208),
(2, 'App\\User', 209),
(2, 'App\\User', 210),
(2, 'App\\User', 211),
(2, 'App\\User', 212),
(2, 'App\\User', 213),
(2, 'App\\User', 214),
(2, 'App\\User', 215),
(2, 'App\\User', 216),
(2, 'App\\User', 217),
(2, 'App\\User', 218),
(2, 'App\\User', 219),
(2, 'App\\User', 220),
(2, 'App\\User', 221),
(2, 'App\\User', 222),
(2, 'App\\User', 223),
(2, 'App\\User', 224),
(2, 'App\\User', 225),
(2, 'App\\User', 226),
(2, 'App\\User', 227),
(2, 'App\\User', 228),
(2, 'App\\User', 229),
(2, 'App\\User', 230),
(5, 'App\\User', 231),
(2, 'App\\User', 232),
(2, 'App\\User', 233),
(2, 'App\\User', 234),
(2, 'App\\User', 235),
(2, 'App\\User', 236),
(2, 'App\\User', 237),
(2, 'App\\User', 238),
(2, 'App\\User', 239),
(2, 'App\\User', 240),
(2, 'App\\User', 241),
(2, 'App\\User', 242),
(2, 'App\\User', 243);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00809bce-a9eb-4c60-966a-0de57b77c8ab', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-19 18:45:51', '2024-01-19 18:45:51'),
('011c1beb-8889-4068-af64-92b193d8e8a5', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:38:06', '2023-09-11 14:38:06'),
('0152070c-746e-4090-928c-ec6462bc78de', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:49:01', '2023-09-13 13:49:01'),
('01a505f2-5d73-4af8-b41f-f846ce2a13c2', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 09:11:11', '2024-01-31 09:11:11'),
('0225dd28-ff33-4e72-8f2e-ba7d563b88cc', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-25 04:12:27', '2024-04-25 04:12:27'),
('02401ce7-8a3d-482a-9bb6-53c59dbdeddd', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:38:47', '2023-09-04 15:38:47'),
('024b3c75-ea4f-4475-bb5e-cf80e1bba798', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:58:39', '2023-09-09 22:58:39'),
('0261c51a-5e72-4455-8900-77edec6ee3d0', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-11 18:43:43', '2024-04-11 18:43:43'),
('02fb7861-5cd4-4e2c-aaea-7a37313b2690', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck B - Wheel C\"}', NULL, '2023-09-04 16:19:31', '2023-09-04 16:19:31'),
('02fbd5a4-c77a-4b75-a58d-fc47824a6304', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 16:56:25', '2024-03-22 16:56:25'),
('03e79430-b69c-4a74-97e8-c2613f8b6d25', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 03:26:18', '2023-12-30 03:26:18'),
('03ff6684-6ea3-4a1d-9978-ce9a6412bc1a', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 19:11:31', '2024-03-26 19:11:31'),
('04819156-0da8-4876-8a61-0f12a6898993', 'App\\Notifications\\OrderNotification', 'App\\User', 2, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-06-28 14:46:38', '2023-06-28 14:46:38'),
('05075f36-33fa-467e-b226-6dfba34bd55c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:14:51', '2023-09-09 22:14:51'),
('0522fc31-63e8-4c6e-a7ac-1b016f3a9ee5', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 16:22:07', '2023-09-04 16:22:07'),
('056943bb-769d-467d-845b-c00ffe4aa1c7', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-19 18:48:10', '2024-01-19 18:48:10'),
('076eb7df-f149-45b6-8fda-d05c1295e6d6', 'App\\Notifications\\OrderNotification', 'App\\User', 91, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-08 18:15:36', '2024-03-08 18:15:36'),
('07b5fba3-a42e-401e-a7a2-495d69f02e15', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 18:54:16', '2023-09-19 18:54:16'),
('07c23221-3235-49be-ae81-d3e92931b6c0', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-07 20:00:01', '2024-04-07 20:00:01'),
('07d4927f-377b-45cf-9391-e80d30ee55ab', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:36:17', '2024-03-26 21:36:17'),
('085d8180-8279-4658-9648-a5a55ae21bf7', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-27 21:13:36', '2023-12-27 21:13:36'),
('08705fc1-fdd9-4b98-ac9d-358d58d40f4e', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-14 22:41:45', '2024-02-14 22:41:45'),
('08bf190e-8082-4563-9003-4869eb3c39c4', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 18:28:04', '2023-08-31 18:28:04'),
('08cdec0a-7941-4ee8-8752-73dabc65ad89', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 07:51:04', '2024-01-31 07:51:04'),
('096fafda-9cdc-4d41-9a54-a24c3c9b468d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 15:41:06', '2024-03-27 15:41:06'),
('09974aef-3115-4e9d-afd1-8dbf886b7ee7', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-28 20:13:50', '2023-12-28 20:13:50'),
('09e8d13d-eda2-4124-8b69-84ee5e3cae7d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:10:33', '2023-09-16 20:10:33'),
('0a0f9869-a7a0-4a96-91e4-31159913f40c', 'App\\Notifications\\CallWaiter', 'App\\User', 91, '{\"title\":\"You have new customer on\",\"body\":\"Elegance & Flavors Bar - Flavors Bar 10\"}', NULL, '2024-01-29 05:52:15', '2024-01-29 05:52:15'),
('0a5feca5-7805-4da1-8118-d36325c087e0', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:01:09', '2024-03-22 17:01:09'),
('0ac26632-9eee-4b6e-9c99-01727f9610c3', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"Appel serveur - \",\"body\":\"SALON - A3\"}', NULL, '2023-12-30 15:37:13', '2023-12-30 15:37:13'),
('0aea8475-c2bc-46c6-ad53-267a7806191b', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:50:30', '2023-09-13 13:50:30'),
('0b286857-e5df-4aa4-8e5d-c6e8a1ad1db2', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-18 20:17:27', '2023-09-18 20:17:27'),
('0b42e8f1-cb88-496d-a92f-6129da706527', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:41:12', '2023-09-09 22:41:12'),
('0b4b8aa5-e6e9-4490-99d7-9944c14aa7ba', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 00:51:58', '2024-04-09 00:51:58'),
('0b7d26b4-b5a0-43d7-a229-d433af750887', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-06 18:04:26', '2024-03-06 18:04:26'),
('0bb200f8-005d-43d8-8ef9-4ded1dd4d203', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:58:39', '2023-09-13 18:58:39'),
('0bcf6beb-df3b-439a-b85e-235782d1e57d', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-13 20:15:16', '2024-03-13 20:15:16'),
('0c1e7871-0d2e-4785-bdc5-5ba6905196b8', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 19:31:21', '2024-03-22 19:31:21'),
('0de9bebd-0469-42ff-8ed4-3dfa90a9c3ab', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-21 06:45:18', '2024-04-21 06:45:18'),
('0e2cf09f-85a7-44a7-ace0-a3fdf6d84656', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"You have new customer on\",\"body\":\"SALON - A2\"}', NULL, '2024-01-19 17:54:42', '2024-01-19 17:54:42'),
('0ea91698-1d05-4b84-a75c-71dca9cba6ba', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 17:16:31', '2024-02-29 17:16:31'),
('0f134ac2-e089-4dff-a453-d299e66ea817', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 18:18:28', '2024-02-29 18:18:28'),
('0f58507f-de5a-4d5f-8af6-2f54cb0f6c3b', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 19:24:28', '2024-03-26 19:24:28'),
('10d89dfd-90d5-431a-819e-3e4c4e786710', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 22:46:24', '2023-07-05 22:46:24'),
('11bbd138-1dae-4f02-8d44-ee9a0c64a3c4', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 05:20:39', '2024-03-28 05:20:39'),
('12096ab0-65f2-4195-a27c-1ab326b37fb0', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 16:29:09', '2023-09-20 16:29:09'),
('12f65e07-8396-43d4-a523-d6abdd96d81d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-21 06:42:50', '2024-04-21 06:42:50'),
('13f75604-96dc-4894-b067-7f98cca69c99', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:18:15', '2023-09-16 20:18:15'),
('140b42db-b15e-4389-b724-1365183a1024', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 15:44:55', '2023-12-30 15:44:55'),
('141d8b79-325d-41a9-9636-1e2895c1ff60', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 16:22:51', '2023-09-04 16:22:51'),
('1542a704-0b21-4b6f-8f9f-8a1224b89608', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 00:05:40', '2024-02-20 00:05:40'),
('15437bf2-bbbb-4ad4-92c7-e0ce8fe8b9b5', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck B - Wheel C\"}', NULL, '2023-08-31 18:50:07', '2023-08-31 18:50:07'),
('157c566b-49f2-431b-a6b3-3cef8ac88f20', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 18:48:21', '2024-03-22 18:48:21'),
('15a91aca-4bdc-4bb4-86d3-0265da2069c2', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 14:09:59', '2024-03-13 14:09:59'),
('1647fa54-1a7e-4e6c-8941-fa76fec4b5d5', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 14:58:10', '2023-09-20 14:58:10'),
('16a61c05-068a-43a4-9906-fecec63bd2e1', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-10 19:08:27', '2024-02-10 19:08:27'),
('180e7f8d-cb3c-408f-a3f6-27a5c957bd6c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 19:26:51', '2024-02-29 19:26:51'),
('187a73dc-c096-4c20-8647-d4e0584d8716', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 19:01:17', '2024-02-29 19:01:17'),
('187c769f-d1f5-4959-9281-d91f0eb7dee5', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:47:48', '2023-09-09 22:47:48'),
('199c62c0-542f-4a9f-9522-782ed60b45dc', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL B\"}', NULL, '2023-10-26 01:08:38', '2023-10-26 01:08:38'),
('1a06cccf-8540-4b6b-a757-14fdeb3d5a80', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 16:38:31', '2024-03-30 16:38:31'),
('1a21e9d7-01bc-41f1-850e-1d43aeb859cb', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 16:56:03', '2023-08-31 16:56:03'),
('1a5750be-25fb-495e-887b-278cd4cd1362', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-06 00:26:36', '2023-07-06 00:26:36'),
('1adc769f-b3fb-47ee-bae8-f781adb1130a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:42:13', '2023-09-11 14:42:13'),
('1ae281ec-578d-4030-ba46-4bf5f070c6c8', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK B - GEAR 1\"}', NULL, '2023-09-19 16:16:44', '2023-09-19 16:16:44'),
('1be4438b-8b34-47ed-8e05-42e6b77f17a3', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-19 22:57:43', '2024-02-19 22:57:43'),
('1ca2acc3-2505-4e96-b794-146168cec4fe', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:24:45', '2024-03-22 17:24:45'),
('1cc456dd-b338-4c04-ae4d-31a05c32e136', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-19 18:48:52', '2024-01-19 18:48:52'),
('1cd49a36-8873-492a-a85c-1fae231a15a6', 'App\\Notifications\\CallWaiter', 'App\\User', 88, '{\"title\":\"You have new customer on\",\"body\":\"Table - Table 1\"}', NULL, '2024-02-02 17:18:20', '2024-02-02 17:18:20'),
('1cd57c89-452f-46a5-96bc-32e60bb55ccc', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-17 19:55:32', '2024-04-17 19:55:32'),
('1d7ad82b-a086-423f-bec1-b65762fcc20c', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-13 19:10:31', '2024-03-13 19:10:31'),
('1ea8db11-19f9-4b8b-b175-8aad546b52a0', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 20:56:39', '2023-09-13 20:56:39'),
('202fb95f-8f56-41e3-9c88-bea7b2532700', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-08 13:58:16', '2024-03-08 13:58:16'),
('20a78bbf-5b6f-4a2b-aa47-e836377ae91a', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 14:03:19', '2024-03-13 14:03:19'),
('20cad5dc-0179-4f6c-965e-2074488cb9c0', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 14:57:43', '2023-09-17 14:57:43'),
('20dbc43f-80f0-4bbd-a2cc-47f0c559ab59', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 14:16:46', '2024-01-31 14:16:46'),
('210f8b02-7b79-4b24-8ff3-06b3e35a205c', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 22:47:56', '2023-07-05 22:47:56'),
('216f2166-1e2a-43d0-9bd6-ded42ce04176', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-04 19:34:57', '2023-07-04 19:34:57'),
('2354eddc-c56a-4055-8259-8083d2588692', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"Il y a une nouvelle commande\",\"body\":\"Vous venez de recevoir une commande\"}', NULL, '2024-02-08 17:56:40', '2024-02-08 17:56:40'),
('246f1252-58b7-4362-9592-11f441271a05', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck B - Wheel C\"}', NULL, '2023-08-31 19:36:00', '2023-08-31 19:36:00'),
('248a6dac-ea73-40c0-bce6-e2e5a18652d2', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:32:47', '2023-09-11 14:32:47'),
('24c51056-2139-425d-908e-e8375f4aab6f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-08 13:33:47', '2024-04-08 13:33:47'),
('25490f9f-60e7-44d5-ae57-5a321c74d726', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-21 02:56:55', '2023-09-21 02:56:55'),
('25ee7634-da62-487f-be6e-2c821c93e3de', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-18 14:39:03', '2024-04-18 14:39:03'),
('26e648a2-1422-42c3-84dd-bd043976dd25', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 13:23:18', '2024-01-31 13:23:18'),
('286bf1a5-e943-4b22-b0d7-650394c7a686', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-16 15:54:23', '2024-04-16 15:54:23'),
('28a32648-ccf0-4297-a1d6-f52ec5645741', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:48:12', '2023-09-13 18:48:12'),
('28a409cf-203d-47ac-95b5-9374a3f71336', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 14:59:19', '2023-09-20 14:59:19'),
('28edeeb2-fea8-4955-bede-3ab3978bb5f1', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck A - Wheel B\"}', NULL, '2023-08-31 16:04:29', '2023-08-31 16:04:29'),
('28f1104a-c325-479d-96d1-5d26520381b7', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-22 21:24:52', '2023-08-22 21:24:52'),
('2905381f-ea48-409d-b350-aaf7d47410f9', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:33:28', '2023-09-13 13:33:28'),
('298b85f9-3656-4c2a-ae59-338e201b7fe2', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:34:27', '2023-09-09 22:34:27'),
('2ba6b8a4-99d3-49bc-9e71-be9136bdc234', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-16 20:10:14', '2024-04-16 20:10:14'),
('2be47ccb-4d50-4116-97de-fd8bbd05fe6d', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"You have new customer on\",\"body\":\"SALON - A2\"}', NULL, '2023-12-31 00:19:35', '2023-12-31 00:19:35'),
('2c0e81b2-a563-4c9d-a97b-f71103d06f0b', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 16:56:41', '2023-08-31 16:56:41'),
('2ddb83ed-b974-4052-857a-4ae943a70e4b', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 16:11:58', '2023-09-19 16:11:58'),
('2e9b394f-fabb-4662-9829-2d06e20f75fa', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 16:21:26', '2023-09-11 16:21:26'),
('2fb7777e-6b02-4450-a03b-cfe8759f42ed', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck A - Wheel B\"}', NULL, '2023-09-09 22:43:00', '2023-09-09 22:43:00'),
('3041f9bd-c519-4492-97d0-35c0266ec978', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-07 19:58:00', '2024-04-07 19:58:00'),
('30793a54-488f-409d-b3a4-c7784d5d6fc8', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-01 17:20:58', '2024-02-01 17:20:58'),
('31837f1c-f58b-4a16-a2af-7c51bcab4aac', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-01 20:26:30', '2024-02-01 20:26:30'),
('31980818-3037-400b-9c79-b76aeae7c959', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 20:46:19', '2024-02-29 20:46:19'),
('31e2340e-06c7-410e-8db4-aa4c1be5de7b', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:11:34', '2024-03-22 17:11:34'),
('3230e95c-7114-4105-a114-0412318fc44e', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 1\"}', NULL, '2023-08-01 14:31:31', '2023-08-01 14:31:31'),
('32b23a86-94a8-4d21-ba4a-0f6ad965ccbe', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:09:26', '2024-03-22 17:09:26'),
('32d82832-e196-4be3-9eb7-a8cf00f6c4ee', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 15:14:17', '2024-03-13 15:14:17'),
('330d224b-223c-4fe0-a294-9bbc63dad073', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL B\"}', NULL, '2023-09-20 15:10:39', '2023-09-20 15:10:39'),
('33395843-a0d1-4657-b0f1-07a2fbfcd430', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 00:52:04', '2024-03-13 00:52:04'),
('33bbe49f-ba3d-46ab-9742-e6d7ace70efe', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-21 06:23:33', '2024-04-21 06:23:33'),
('33da9add-b579-43e2-91e1-2260a2834cd9', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-08 13:44:36', '2024-04-08 13:44:36'),
('33fdc119-369b-4a81-bfcd-80affdb13c11', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 16:01:14', '2023-07-05 16:01:14'),
('3404f1c4-5d44-44a0-8ee2-c963d5eec696', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 23:46:14', '2023-09-17 23:46:14'),
('34209146-20e8-4df2-af64-c9bd8f8ea68d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:00:33', '2023-09-16 20:00:33'),
('353770ee-adcf-4458-91ed-11e7518b48f0', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 14:53:17', '2024-03-22 14:53:17'),
('36057c40-4cce-455d-9927-f04af94251ed', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:04:11', '2024-03-22 17:04:11'),
('362972e4-0347-4bff-822e-19c8fb8630d3', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 14:04:39', '2024-03-13 14:04:39'),
('3645fdd3-90d3-4f43-83d6-5bf54336eb7d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 19:38:39', '2024-03-22 19:38:39'),
('36d49526-84b9-4f0f-ab8f-3e5b613021db', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 16:03:10', '2023-07-05 16:03:10'),
('36e5e716-e379-47b6-8b2e-326acb60da69', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:22:58', '2024-03-26 21:22:58'),
('377fe945-fe60-44cf-9f77-1dcc9f167361', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 00:41:33', '2024-03-13 00:41:33'),
('37f94854-bb9c-40c1-9944-69d2b26ac191', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-14 18:17:09', '2023-09-14 18:17:09'),
('38575eaa-69fe-4333-9945-6b4518d777b2', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-05 18:57:56', '2024-03-05 18:57:56'),
('3888bb77-88da-4d22-b9ef-6f18450659f1', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 16:48:06', '2024-03-22 16:48:06'),
('38928b55-4230-47a8-9637-6d51ffaad5f2', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-15 17:58:39', '2023-09-15 17:58:39'),
('38fe2ab4-aa3d-490d-96f1-7b7b2766d368', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:16:42', '2023-09-04 15:16:42'),
('3a4b5603-9ef4-4768-a065-ed555a67abe4', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck A - Wheel B\"}', NULL, '2023-08-31 18:49:56', '2023-08-31 18:49:56'),
('3a5deaa5-8fa1-48e8-84bc-a3c6567409e9', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 19:38:45', '2024-03-28 19:38:45'),
('3ad71387-ed68-4d04-b3f9-6cccf473bf24', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 17:46:42', '2023-09-17 17:46:42'),
('3b3fed9b-999d-4e34-b1b5-ab450b92edc4', 'App\\Notifications\\OrderNotification', 'App\\User', 90, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 17:57:32', '2024-01-31 17:57:32'),
('3b57f58c-f12c-4df6-9b11-3297bd1eb22c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-14 17:53:00', '2024-02-14 17:53:00'),
('3bab3d2f-0cb1-4d9e-a2eb-8e604dd4edd5', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 08:56:23', '2023-12-30 08:56:23'),
('3c833c08-1ba7-4ae0-b051-ed7e35c528f3', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-22 19:49:29', '2023-09-22 19:49:29'),
('3cd0b6ff-b357-404a-bd16-ae80e132b2c9', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-17 16:21:06', '2024-04-17 16:21:06'),
('3ceb090f-6e71-458c-929c-06d669afb9bc', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"You have new customer on\",\"body\":\"Z2 - Z2 3\"}', NULL, '2024-03-03 16:43:02', '2024-03-03 16:43:02'),
('3df3c175-81f1-4963-a24d-8ed35b963e7e', 'App\\Notifications\\OrderNotification', 'App\\User', 90, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 17:55:59', '2024-01-31 17:55:59'),
('3e0546ee-2962-4cc6-a640-37bb75062f9e', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 14:51:23', '2023-09-04 14:51:23'),
('3e2e1962-a43f-4260-9a79-d6b1fb3186c1', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:10:42', '2024-03-26 21:10:42'),
('3e39b926-bd82-4d65-a8a6-0feeb81d7155', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-14 22:41:24', '2024-02-14 22:41:24'),
('3e3a5f53-f41e-4935-b73d-8801136b88ed', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-14 20:49:51', '2024-02-14 20:49:51'),
('3e4b0480-8841-41db-8790-2290f3ef35f3', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 16:21:01', '2023-09-19 16:21:01'),
('3e9c37ad-303b-4755-a514-f605561dba15', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 14:45:06', '2024-03-22 14:45:06'),
('3ec144a9-4bad-420b-bb07-840bd51b24ee', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 22:45:42', '2023-07-05 22:45:42'),
('3ecfed14-88f0-4abc-b8f2-bf6626b7c87c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:39:38', '2023-09-13 13:39:38'),
('417fb918-be42-462f-a9f6-e87c5c73dc23', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:05:38', '2024-03-26 21:05:38'),
('41dff5f4-00a3-4789-98c2-84a06f3d58d1', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 16:18:02', '2024-01-31 16:18:02'),
('42521403-8336-417f-a0c2-4b0e86f2c0ee', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 14:58:13', '2023-09-17 14:58:13'),
('42869c14-c08c-4096-8507-e5833120c54e', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 19:27:17', '2024-03-30 19:27:17'),
('4311146d-ee7e-4a3d-9a6d-1ace25af1e26', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 19:34:21', '2023-08-31 19:34:21'),
('43638ae3-a5e0-49b0-91eb-48d1006aea46', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-18 14:28:37', '2024-04-18 14:28:37'),
('43f2b82c-83a1-4aab-91b8-3d35604c4f1a', 'App\\Notifications\\OrderNotification', 'App\\User', 90, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-01 15:19:41', '2024-02-01 15:19:41'),
('44311364-07ac-4dcd-b3f5-c05ae989d4ac', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-30 20:23:57', '2024-01-30 20:23:57'),
('4452b09c-5587-4f6e-9c1c-b9631c86154f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 16:43:09', '2024-03-30 16:43:09'),
('450c5919-aa9a-4b30-aca0-f431ce01079c', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 22:44:37', '2023-07-05 22:44:37'),
('46041536-8324-415d-8f79-caac9b6ee162', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck A - Wheel B\"}', NULL, '2023-09-03 16:45:19', '2023-09-03 16:45:19'),
('462a0c84-6f77-474a-9413-527b2ce92bc3', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 1\"}', NULL, '2023-07-05 16:04:15', '2023-07-05 16:04:15'),
('463c307a-1f5b-40eb-84a9-14b7fd03f8c1', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 16:25:05', '2023-09-20 16:25:05'),
('474c83d8-f2e0-4d60-b070-d88fad805136', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 18:56:24', '2023-08-31 18:56:24'),
('47eef24f-fbcb-4477-9d59-ff08f7d03999', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck A - Wheel B\"}', NULL, '2023-08-31 20:42:46', '2023-08-31 20:42:46'),
('48a788c3-74e9-496f-b4fe-b1240bb2a5ed', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 00:07:26', '2024-02-20 00:07:26'),
('4927538d-7b02-4d43-980d-5837cb1a3c6d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-06 17:55:04', '2024-04-06 17:55:04'),
('4a7a8f57-af90-453d-bc62-c579113ad21f', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:38:45', '2023-09-13 13:38:45'),
('4a942248-7727-4609-9e40-1952b9fc2104', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:26:50', '2023-09-13 13:26:50'),
('4aee97e6-c33e-4bce-b755-5a41d183546c', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 00:05:09', '2024-02-20 00:05:09'),
('4b31bc6c-252a-48aa-8038-e99c17842a12', 'App\\Notifications\\OrderNotification', 'App\\User', 90, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 17:51:50', '2024-01-31 17:51:50'),
('4c0552db-ba58-4430-9432-3c6cd2d256cd', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:41:50', '2023-09-20 15:41:50'),
('4c08e423-093e-450e-9149-25be92c621b1', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-04 17:29:58', '2024-04-04 17:29:58'),
('4c20b3e7-9443-49db-b07b-414e1514fea0', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL B\"}', NULL, '2023-12-20 01:27:20', '2023-12-20 01:27:20'),
('4c4b541a-9389-40dd-adad-c501da38a13b', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-20 15:02:54', '2024-03-20 15:02:54'),
('4c4c50fb-514d-4a92-a90c-4163f4867e8f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-31 00:29:21', '2024-03-31 00:29:21'),
('4c574cbf-a235-4c05-a3a9-06e4a65df48d', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"notifications_notification_callwaiter\",\"body\":\"Z2 - Z2 2\"}', NULL, '2024-02-01 20:21:14', '2024-02-01 20:21:14'),
('4c90c2db-4892-4859-82fc-621471193a0a', 'App\\Notifications\\CallWaiter', 'App\\User', 91, '{\"title\":\"You have new customer on\",\"body\":\"Elegance & Flavors Bar - Flavors Bar 10\"}', NULL, '2024-01-29 05:52:17', '2024-01-29 05:52:17'),
('4cef96d8-c0ef-4d43-90f2-b0fb4bf510ef', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"You have new customer on\",\"body\":\"SALON - A1\"}', NULL, '2023-12-21 21:29:10', '2023-12-21 21:29:10'),
('4e435baa-621d-4924-9a1e-f5ce8d769724', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"Il y a une nouvelle commande\",\"body\":\"Vous venez de recevoir une commande\"}', NULL, '2024-02-08 20:42:42', '2024-02-08 20:42:42'),
('4fbd0a7e-8d09-4689-91b4-2c8027362cf8', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 15:46:41', '2024-03-27 15:46:41'),
('50064e08-73f9-4f02-87c0-71f021d4609f', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck A - Wheel B\"}', NULL, '2023-08-31 18:53:32', '2023-08-31 18:53:32'),
('5066b509-e9dd-4ccc-acf0-0f56e9501610', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-12 16:31:13', '2024-03-12 16:31:13'),
('50723864-b31d-46fe-a50d-60300cb448c0', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 19:53:01', '2024-03-28 19:53:01'),
('519f67fb-bc4f-42e8-8cbe-d2f13cde292b', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:46:07', '2023-09-13 18:46:07'),
('521c893c-94e5-46fe-9e72-651bf48955fb', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:58:14', '2023-09-13 18:58:14'),
('5220f08b-e90b-42eb-a2a0-9fc4132bd752', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:52:51', '2023-09-13 13:52:51'),
('522b7a3f-2e02-4a29-9493-328c3183f878', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-01 18:39:07', '2023-09-01 18:39:07'),
('5380dd08-2779-4835-aed4-50b9de81ca13', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 17:25:04', '2024-02-20 17:25:04'),
('53837cd5-dc6a-4f2b-a1c0-7797116de994', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:44:54', '2023-09-13 13:44:54'),
('53ea4948-df4c-4570-b13a-242b9e6e32c5', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-07 20:06:42', '2024-04-07 20:06:42'),
('5447dab9-d22e-41ff-af5e-477e2c63b749', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:22:09', '2023-09-16 20:22:09'),
('54d3edb2-41a3-4c4f-8364-2b6ee987a0ac', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-14 00:17:15', '2024-03-14 00:17:15'),
('54fd02c3-8209-427c-a6b6-e623c4a57241', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-30 21:35:09', '2024-01-30 21:35:09'),
('5518482f-c876-415d-8d3d-5f522bf2051f', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck C - Wheel D\"}', NULL, '2023-09-04 14:50:42', '2023-09-04 14:50:42'),
('554540d8-2eb4-4b03-9300-344fef2625de', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-20 23:34:47', '2024-03-20 23:34:47'),
('554ce29d-e6a5-47c9-bad6-202087973b0c', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 14:28:34', '2024-03-27 14:28:34'),
('55695fe2-fedc-47c8-952f-36d6b2fac49f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:03:11', '2024-03-22 17:03:11'),
('57d0ee59-e9c3-4265-9f0d-964ce74a79e4', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 18:45:08', '2023-09-19 18:45:08'),
('57edc9cb-97b1-4854-b533-e6eb6fb1e26e', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 03:35:06', '2023-12-30 03:35:06'),
('57f1eda6-e250-4a05-a7c7-41ef8ea463fa', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 03:37:29', '2023-12-30 03:37:29'),
('58cb81e2-bba4-4d45-a105-bf6b9aca8f6f', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2023-09-14 17:36:43', '2023-09-14 17:36:43'),
('58d1a8f6-ee65-41a6-8683-248418f3ed99', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-10-19 16:18:34', '2023-10-19 16:18:34'),
('594c675c-fc59-4f64-bcf8-669082591b8b', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck C - Wheel E\"}', NULL, '2023-08-31 18:42:12', '2023-08-31 18:42:12'),
('59ebe5d2-5aa8-491c-87bd-40df6fa831f4', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 16:16:58', '2024-03-27 16:16:58'),
('5af38209-c3a9-4d08-8c19-52f87b2a84f3', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:37:41', '2023-09-20 15:37:41'),
('5af784fb-719b-45e1-977f-fc2cadb3e767', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-01 18:59:38', '2023-09-01 18:59:38'),
('5b45192c-28fb-4767-9c23-92346b280af0', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-12 16:12:08', '2024-04-12 16:12:08'),
('5b9b071f-c772-4a61-bffc-1e576d0ad6b7', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-07 20:02:10', '2024-04-07 20:02:10'),
('5c9d200b-61fd-44a6-9faa-49542a016e25', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-14 01:57:30', '2023-07-14 01:57:30'),
('5cc9ddc8-035c-4002-a4dc-17c64fc3a1c1', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-12 16:24:55', '2024-03-12 16:24:55'),
('5d509d7e-c1b4-4e93-a7db-0189ad13c739', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:37:17', '2023-09-16 20:37:17'),
('5d683409-4ffa-4485-86d5-3eb16a180fe5', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck B - Wheel\"}', NULL, '2023-09-08 11:34:44', '2023-09-08 11:34:44'),
('5ed34421-d5c8-401d-9a5d-9719db42a71f', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-05 18:54:36', '2024-03-05 18:54:36'),
('5f277cbd-2aef-4225-a157-dc4611eceb77', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-10 19:05:12', '2024-02-10 19:05:12'),
('5f9700e6-ef19-4d30-b739-4c1475b97756', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:53:53', '2023-09-13 18:53:53'),
('6074fde2-44ce-4a9a-a981-0deac4738401', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck C - Wheel E\"}', NULL, '2023-09-09 23:01:58', '2023-09-09 23:01:58'),
('6088f4e8-74f5-4259-8f3b-54c4df9e0e78', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck B - Wheel C\"}', NULL, '2023-09-03 16:47:41', '2023-09-03 16:47:41'),
('60bdc2a3-e75c-49a1-963a-088be4aa9834', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:26:03', '2023-09-13 13:26:03'),
('611f70f5-57ef-46e0-9bed-5c7600728cfd', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 15:41:33', '2024-03-22 15:41:33'),
('6224019d-1700-4148-b91f-19e0a82af79c', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2023-09-20 15:10:59', '2023-09-20 15:10:59'),
('630d364b-7b03-405b-926f-19b8cbabdc9b', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 16:30:15', '2023-09-20 16:30:15'),
('63146082-2f72-4bc3-91da-4698175cdad9', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-04 16:49:58', '2023-07-04 16:49:58');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('63bd908b-3bea-43d3-885e-86ded45e7688', 'App\\Notifications\\OrderNotification', 'App\\User', 91, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 14:17:41', '2024-03-28 14:17:41'),
('646ab574-525d-4ba6-804a-7613453b8de4', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 22:45:08', '2023-07-05 22:45:08'),
('64bfa0ef-b995-4c2d-b865-575eb4e8e8c4', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 15:36:38', '2023-12-30 15:36:38'),
('6544c541-7cda-40d1-9ded-56628a5f6078', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-14 00:16:14', '2024-03-14 00:16:14'),
('659ce045-e8e7-4257-8102-5328a3d28832', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:49:41', '2023-09-13 13:49:41'),
('6682877b-8121-4459-a0ee-2bf89fa60438', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 03:45:16', '2023-12-30 03:45:16'),
('66a00a2d-3cbf-4ee4-8884-4456e78faf0d', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 07:02:45', '2024-01-31 07:02:45'),
('66c3bc1c-a3f4-4564-a002-62c6bf9b238a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:31:11', '2023-09-11 14:31:11'),
('672904d2-1d55-4601-9347-3aad2c13190d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-24 04:01:35', '2024-04-24 04:01:35'),
('67568b0b-377a-4d68-bfd5-e339ce86416e', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 2\"}', NULL, '2023-07-05 22:30:07', '2023-07-05 22:30:07'),
('6774cced-6113-47f0-b307-0f993b7f1979', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-08 13:30:47', '2024-04-08 13:30:47'),
('685cdd87-4a78-49de-a54f-d72eeddf38f9', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK B - GEAR 1\"}', NULL, '2023-09-20 14:57:42', '2023-09-20 14:57:42'),
('68f2d0a9-b635-48b9-970a-d5b56258bd46', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-01 19:02:07', '2023-09-01 19:02:07'),
('690b39cf-ff66-42b5-ade7-33aa3f724e94', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 16:12:17', '2023-09-19 16:12:17'),
('6947fbed-d9ce-4cf3-9fbb-ab0e05231467', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 17:39:38', '2024-03-30 17:39:38'),
('69b6b3ef-0b16-493f-b206-a5e638e92d2c', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 19:48:52', '2024-03-28 19:48:52'),
('6aa7da48-4287-4ad5-a2e6-b94ec334a2f1', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:25:46', '2023-09-13 13:25:46'),
('6c0fdabc-69d3-4b52-8667-8559e9f9bf52', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-06 00:29:48', '2023-07-06 00:29:48'),
('6cfaa345-863e-4257-ab10-25537e8dd73f', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"Il y a une nouvelle commande\",\"body\":\"Vous venez de recevoir une commande\"}', NULL, '2024-02-08 20:44:25', '2024-02-08 20:44:25'),
('6e98f5c3-5dd1-45f7-877a-54a23813eaff', 'App\\Notifications\\OrderNotification', 'App\\User', 90, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 19:21:13', '2024-03-22 19:21:13'),
('6f5a4ac0-57cb-4f8a-86e2-af046d8c82db', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 2\"}', NULL, '2023-07-05 16:05:34', '2023-07-05 16:05:34'),
('70001c37-7030-49df-9de4-e0081949fe2e', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 16:29:35', '2023-09-20 16:29:35'),
('7167eec5-1562-4e64-b9f5-eeeb86b0eb0d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 02:00:13', '2024-04-09 02:00:13'),
('71735a72-98aa-4f54-a9a5-c7f9d16af383', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-12 19:05:22', '2023-09-12 19:05:22'),
('71eb37c4-dc6b-4c39-ba5c-b24e96864d15', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-21 03:06:43', '2023-09-21 03:06:43'),
('72fb6ad5-878c-4078-9ed6-1a56da87e3d5', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-21 11:25:03', '2024-04-21 11:25:03'),
('73a514d7-b2e4-4428-aa04-caf2abc1aa9a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 16:55:42', '2023-08-31 16:55:42'),
('73cc5197-2579-4c2b-8ef5-74c96c9f87c2', 'App\\Notifications\\CallWaiter', 'App\\User', 89, '{\"title\":\"You have new customer on\",\"body\":\"Gastro Table A - Gastro Table B\"}', NULL, '2024-03-28 05:15:04', '2024-03-28 05:15:04'),
('75a5d988-a746-4af0-bf55-e41f4c30c603', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:54:15', '2023-09-13 18:54:15'),
('76aea2cd-628c-443d-976c-db1b1bb85728', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 14:53:10', '2023-09-17 14:53:10'),
('77533fe6-aa13-4ddc-ab3b-05c8c216d193', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 20:34:13', '2024-02-29 20:34:13'),
('776e84f1-306c-41bf-91b0-ae3b0fa130a5', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck B - Wheel\"}', NULL, '2023-09-09 22:38:44', '2023-09-09 22:38:44'),
('779f5c1d-3178-4b88-b251-94c25c233454', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:59:01', '2023-09-09 22:59:01'),
('77ecc183-f0e6-4e3d-8786-2d0c83cede7c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 20:04:06', '2023-09-19 20:04:06'),
('78001bdf-8968-439b-a144-89289f29a4ab', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:39:24', '2024-03-22 17:39:24'),
('788d2c33-dd3f-4a97-bc42-ee0096838218', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:14:33', '2024-03-26 21:14:33'),
('78d5fed2-5c29-4a1f-9f4d-d1f181507352', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:45:49', '2023-09-13 18:45:49'),
('78e353b1-5d72-44da-91a4-cd05654a049e', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 18:10:45', '2024-03-30 18:10:45'),
('790f28f5-9c2b-4e1a-a847-bd919ec7c109', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 20:46:04', '2024-03-26 20:46:04'),
('79a9f10f-700a-4ab1-8c3e-f8a7a54e7c09', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 18:51:51', '2024-03-27 18:51:51'),
('79f42e18-0402-4f80-8010-e677edb7c953', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 2\"}', NULL, '2023-07-05 16:06:20', '2023-07-05 16:06:20'),
('7aa7e51a-e54b-42a8-85a6-b6b0f26851e4', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 20:01:13', '2024-03-28 20:01:13'),
('7aea672b-a663-4639-b987-d331dfbd3fe2', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-29 18:47:38', '2024-03-29 18:47:38'),
('7aeedf42-5332-4122-b660-be6a28189209', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 17:19:21', '2023-09-17 17:19:21'),
('7aff1886-aae5-4859-972f-ad0d1a2f51fe', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 19:15:23', '2024-03-26 19:15:23'),
('7b59992d-bc85-40bb-84c4-6ee451479223', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-19 05:25:54', '2024-04-19 05:25:54'),
('7b5dd2d9-3672-422d-a21e-e08939f16c8e', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-28 20:10:46', '2023-12-28 20:10:46'),
('7b9c8b96-9bb7-4c0c-bc67-9e9de21f3f65', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 18:16:24', '2023-09-17 18:16:24'),
('7bd32856-4da2-4500-81c0-416b95ac4f38', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 20:55:04', '2024-03-26 20:55:04'),
('7bf6dded-db59-4789-a1d4-18846b56d358', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-24 10:20:23', '2024-04-24 10:20:23'),
('7c845ef6-087e-41a1-a4d4-f86b6af9179c', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 18:49:21', '2024-03-22 18:49:21'),
('7c9de1e8-5bce-48d3-a461-f42212a61f2c', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-27 20:51:11', '2023-12-27 20:51:11'),
('7da605af-ae7a-4baf-a4d6-e9598c8d825d', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck C - Wheel E\"}', NULL, '2023-08-31 16:09:03', '2023-08-31 16:09:03'),
('7da83765-1a33-4a8b-89c4-4b77567cdc7c', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"Il y a une nouvelle commande\",\"body\":\"Vous venez de recevoir une commande\"}', NULL, '2024-02-08 17:48:51', '2024-02-08 17:48:51'),
('7dd6e2c2-d8d1-4bbd-a73d-c827158ad463', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-14 00:14:29', '2024-03-14 00:14:29'),
('7e350ed2-7754-4ed8-97e7-30b6ac3737e1', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 15:00:06', '2024-03-22 15:00:06'),
('7e45655e-7785-40b8-8117-0560c40bd03e', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-25 04:11:29', '2024-04-25 04:11:29'),
('7f31d9a9-794c-4c49-828b-c89066b288f3', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-04 19:35:11', '2023-07-04 19:35:11'),
('7f72942e-0d1b-4eea-a7ce-3f6b67818ba2', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-07 19:47:35', '2023-07-07 19:47:35'),
('7f81a00b-a0bd-4354-8cab-7cd3f68d4bd1', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"You have new customer on\",\"body\":\"SALON - A2\"}', NULL, '2023-12-30 22:12:22', '2023-12-30 22:12:22'),
('7fb5c38c-eeac-470b-bd04-ef94c0652f7e', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-05 16:27:53', '2023-07-05 16:27:53'),
('7fff4776-d5ab-49cf-82e6-d552000ac819', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 20:32:31', '2024-03-22 20:32:31'),
('805b90f9-4112-4f30-8b5b-dc605616cfbe', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 14:15:05', '2024-04-09 14:15:05'),
('8125e78d-a36f-42ae-879d-326cdfffa164', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 17:55:18', '2024-03-30 17:55:18'),
('816b6382-09ab-4308-8733-8b0a15847d31', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-12 16:10:33', '2024-04-12 16:10:33'),
('8269e419-b57c-4b50-a6b4-8349ef2be3b3', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL B\"}', NULL, '2023-09-21 02:55:09', '2023-09-21 02:55:09'),
('82bae328-1ce4-4771-98f5-634add5ae6f2', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 03:44:26', '2023-12-30 03:44:26'),
('836c554c-d6e5-42b0-a540-26518c92f40b', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 14:51:05', '2024-03-22 14:51:05'),
('84a8cdaa-c556-42b6-80a5-e226209f4fd3', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-26 19:45:00', '2023-12-26 19:45:00'),
('8654613e-db70-459e-b15b-24678e4ddff3', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-07 20:01:11', '2024-04-07 20:01:11'),
('866390dc-17b3-4e58-a889-4c9f73800e8c', 'App\\Notifications\\OrderNotification', 'App\\User', 89, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-05 15:22:29', '2024-02-05 15:22:29'),
('86ccd729-9f91-4d0b-9c1b-a6254fc9feb0', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 19:11:12', '2024-03-28 19:11:12'),
('86d9d1f3-6d47-4104-a4f5-e7d268f2455c', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-31 00:28:42', '2024-03-31 00:28:42'),
('888edd71-1f35-4eff-94af-068271f1ce59', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-05 16:27:14', '2023-07-05 16:27:14'),
('88bef18e-59c3-45e3-a80a-fca85f34cf23', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-21 02:56:20', '2023-09-21 02:56:20'),
('89f991c5-dd8e-4b78-8ac4-85434cc3ac19', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 13:03:59', '2023-09-11 13:03:59'),
('8a2754a2-0a4b-4941-8eca-d29a98ac7da7', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 16:50:33', '2024-03-22 16:50:33'),
('8ab20e7c-e659-49f2-8b7f-286c43779710', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck A - Wheel A\"}', NULL, '2023-09-04 16:18:13', '2023-09-04 16:18:13'),
('8ac1d8dc-54c9-4863-b7ab-89380bd83567', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-24 10:15:30', '2024-04-24 10:15:30'),
('8ad752ab-fd3c-44f4-b550-7f69e1330a86', 'App\\Notifications\\CallWaiter', 'App\\User', 91, '{\"title\":\"You have new customer on\",\"body\":\"Elegance & Flavors Bar - Flavors Bar 10\"}', NULL, '2024-04-10 14:08:23', '2024-04-10 14:08:23'),
('8c0f733f-1f27-487d-b407-185175484620', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-16 16:47:32', '2024-04-16 16:47:32'),
('8d24f8f9-f7ac-4071-9143-a9badb5ef155', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:29:46', '2023-09-11 14:29:46'),
('8d8cf536-ba33-4db9-8635-4a455e0c6a51', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:41:58', '2023-09-16 20:41:58'),
('8e251e9f-de8f-4ca5-a110-9b0f5651fc3a', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck C - Wheel D\"}', NULL, '2023-08-31 20:44:58', '2023-08-31 20:44:58'),
('8ebc8ede-5223-416f-b9c2-d623004c85b8', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:25:48', '2023-09-16 20:25:48'),
('8ec7608b-2e6d-4bc3-8298-a996098007df', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-24 03:29:18', '2024-04-24 03:29:18'),
('8ef16fa4-5333-488d-967e-79923fc3d61f', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 17:26:06', '2024-02-20 17:26:06'),
('8fcc83e4-ee53-4f34-a5bf-d7ea03f15ed1', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-14 16:52:27', '2023-09-14 16:52:27'),
('8fef19b0-a0d0-43a1-8c50-6adc7d6a6ef3', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 19:00:12', '2023-09-13 19:00:12'),
('9006ae21-a313-49bc-9389-45fa283a5670', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 13:39:23', '2024-01-31 13:39:23'),
('904a1f7f-5a5a-45d8-a006-8c187634100c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-01 18:31:47', '2023-09-01 18:31:47'),
('922420a4-11cb-4d74-894d-a6919441ec8b', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:04:16', '2023-09-04 15:04:16'),
('925b0900-f8d2-4fbb-b4d5-d994c755f85d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 16:22:25', '2023-09-04 16:22:25'),
('92a4e0dd-02f9-4034-b1bb-df5193e213cf', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL B\"}', NULL, '2023-09-20 15:10:28', '2023-09-20 15:10:28'),
('9375e86e-cb88-4c6e-bda7-e422fc7e33ac', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"Il y a une nouvelle commande\",\"body\":\"Vous venez de recevoir une commande\"}', NULL, '2024-02-08 20:51:33', '2024-02-08 20:51:33'),
('9408c4cc-0a3e-4f7f-9373-46fd25011664', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-21 06:27:11', '2024-04-21 06:27:11'),
('94727c52-212c-43f8-9be3-57c6810d2159', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck A - Wheel A\"}', NULL, '2023-08-31 16:03:59', '2023-08-31 16:03:59'),
('94b691cf-7e7f-43d1-8a84-f2b585847b29', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 21:35:34', '2023-09-16 21:35:34'),
('9505f4fd-4b7b-44b8-8e8b-07354bdd96e4', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-05 18:10:15', '2023-07-05 18:10:15'),
('956c4b90-a629-4a60-b64f-f10cdfe0ffdb', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 23:00:13', '2023-09-09 23:00:13'),
('95ba3eee-9efb-4df5-b79e-365ab828e42f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 19:18:03', '2024-03-26 19:18:03'),
('968c9b88-7b09-44a8-aa1b-952dce845104', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 20:31:03', '2024-03-22 20:31:03'),
('970188f8-5a2e-4dcf-897e-4a524668b850', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-07 20:00:11', '2024-04-07 20:00:11'),
('99611481-3b8a-4408-a212-e51c4eaab3b6', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:37:26', '2024-03-26 21:37:26'),
('9afbb1dc-6f5b-4cc4-81df-64b3a39cb0bf', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck A - Wheel B\"}', NULL, '2023-09-13 13:38:26', '2023-09-13 13:38:26'),
('9b8044cf-ee43-4ac9-876b-0987afeaa3e2', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 1\"}', NULL, '2023-07-05 16:00:58', '2023-07-05 16:00:58'),
('9b9b0a91-8430-45d2-a045-f582707e7e0f', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 14:25:19', '2024-01-31 14:25:19'),
('9bbcbc6b-724e-427d-b1ac-b0d6269b80c7', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 2\"}', NULL, '2023-07-05 16:06:43', '2023-07-05 16:06:43'),
('9c440977-9512-4934-a842-a73eae25b883', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-03 16:43:43', '2023-09-03 16:43:43'),
('9c9e0ec5-0112-4dff-85e2-5adb96cda88e', 'App\\Notifications\\OrderNotification', 'App\\User', 63, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 23:57:25', '2023-09-17 23:57:25'),
('9d1d1225-3abc-4e98-840c-2df329c31613', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 01:00:21', '2024-04-09 01:00:21'),
('9df63efb-3b72-4661-9a48-53364900852a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:39:46', '2023-09-16 20:39:46'),
('9e096b35-0b83-4be7-bd5f-c9ea6a328288', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 01:27:51', '2024-04-09 01:27:51'),
('9e0a7b7b-f238-4c6d-a2fa-338b6851b4a7', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-24 10:37:06', '2024-04-24 10:37:06'),
('9fc744c5-49d3-4f68-b50f-fcea55ff7136', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:39:00', '2023-09-11 14:39:00'),
('a005ba3c-adc1-4d9a-96c7-6611f66dccaa', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-12 16:34:05', '2024-03-12 16:34:05'),
('a0263aa0-39d5-4a2e-b444-dd2f1eb6ef14', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:08:57', '2023-09-20 15:08:57'),
('a03dfcc5-cf9d-4993-8165-680b408d298a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:19:03', '2023-09-20 15:19:03'),
('a0568845-f0b9-486d-905d-42f6b69863d1', 'App\\Notifications\\OrderNotification', 'App\\User', 90, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 17:52:10', '2024-01-31 17:52:10'),
('a057c351-0fb0-4bd6-8f0a-3441045ff9b6', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 16:02:57', '2023-07-05 16:02:57'),
('a0af80e8-e980-4291-b17e-3f7ac17a3ede', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-17 16:31:43', '2024-04-17 16:31:43'),
('a0e76f33-b46a-4c29-ba4e-556b8da55d96', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 01:00:08', '2024-04-09 01:00:08'),
('a1533897-329c-4727-a8fd-031d37da4b07', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 18:46:33', '2024-03-22 18:46:33'),
('a222c2c5-0c0b-441d-a414-8fcdd8f6adac', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck B - Wheel\"}', NULL, '2023-09-11 16:22:15', '2023-09-11 16:22:15'),
('a2350506-2019-4239-a4bd-c6552b828afe', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 16:13:01', '2023-08-31 16:13:01'),
('a2cfcf38-22db-4401-80a3-62049a1658c8', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-24 10:39:55', '2024-04-24 10:39:55'),
('a305ac33-58d6-4d26-b55f-d682d2863791', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-21 21:47:31', '2024-03-21 21:47:31'),
('a30866f7-c634-497a-82f2-85b224e786f3', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"You have new customer on\",\"body\":\"SALON - A4\"}', NULL, '2023-12-30 22:12:05', '2023-12-30 22:12:05'),
('a3214ea7-9535-4628-9e81-ed0b8cae9806', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 16:08:45', '2023-09-19 16:08:45'),
('a332f9d3-9609-4cf8-aefd-ed0a5969340d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:42:34', '2023-09-11 14:42:34'),
('a385033a-63df-4bec-97ef-4cb31ae764cb', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-01 18:59:03', '2023-09-01 18:59:03'),
('a3d0259d-d493-4398-a3f5-b0638cf5a793', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-15 20:34:39', '2023-09-15 20:34:39'),
('a4039031-8bf0-400a-9120-bbe1a910672f', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 14:02:36', '2024-03-13 14:02:36'),
('a451cad9-4fba-4924-995e-5a2c1f686200', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:26:58', '2024-03-22 17:26:58'),
('a4f16cd9-3db0-4a50-8e59-2fafba1ea287', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"Il y a une nouvelle commande\",\"body\":\"Vous venez de recevoir une commande\"}', NULL, '2024-02-08 17:40:45', '2024-02-08 17:40:45'),
('a55c3e79-bfe5-4741-b7f5-570cf66c891e', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:40:55', '2023-09-04 15:40:55'),
('a561cfef-7226-4baf-8d96-e0583abd2b1f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-18 16:23:36', '2024-04-18 16:23:36'),
('a60e5a74-e935-4268-805b-5fbdbfb4647d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:31:57', '2023-09-11 14:31:57'),
('a647c3c0-e000-40a9-8e30-2de151a60996', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-06 18:08:49', '2024-04-06 18:08:49'),
('a65e1ab5-61b3-49fb-8e07-63c3f58287d7', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-11 17:50:11', '2024-04-11 17:50:11'),
('a66db5d7-f5b3-44d6-b7bf-f065168ea556', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:59:19', '2023-09-09 22:59:19'),
('a70976d3-f500-4d2c-9686-4062c2eb8b13', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-21 12:08:52', '2024-04-21 12:08:52'),
('a7268726-91dd-47ff-b552-d90964894655', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:16:45', '2023-09-09 22:16:45'),
('a8eaa5a4-5581-4fc3-aa3b-5de9430dda6f', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 00:41:57', '2024-03-13 00:41:57'),
('a913ed42-1309-493d-a5c3-56b9125633c8', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-08 15:03:29', '2024-03-08 15:03:29'),
('a919e42f-ae1a-4cdd-b4bf-2ffa572b92f9', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-07 20:05:25', '2024-04-07 20:05:25'),
('a99674ef-57fb-415f-8b3b-8bc95d846c94', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 18:42:02', '2024-03-22 18:42:02'),
('a9d50bb9-3025-46a9-962a-0ea8927aa3f0', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 16:14:28', '2023-08-31 16:14:28'),
('aa1a7fef-b7ec-4178-9461-d0bd404c7531', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-21 06:07:02', '2024-04-21 06:07:02'),
('aa1b3d5e-b36d-4e2b-b69c-28bde58f9cc5', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 20:54:50', '2023-09-13 20:54:50'),
('aa87484d-2707-4810-b71f-88aff03a4745', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck A - Wheel A\"}', NULL, '2023-09-11 14:41:55', '2023-09-11 14:41:55'),
('ab53a042-bff2-47a6-808b-c5660d1f359f', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-12 16:23:22', '2024-03-12 16:23:22'),
('ab5fb09a-e191-4dd6-910d-818c357c9a27', 'App\\Notifications\\CallWaiter', 'App\\User', 91, '{\"title\":\"You have new customer on\",\"body\":\"Elegance & Flavors Bar - Flavors Bar 10\"}', NULL, '2024-03-08 18:14:56', '2024-03-08 18:14:56'),
('ab7fc69b-d018-4ae8-a91a-fb82fda63cc6', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:45:28', '2023-09-04 15:45:28'),
('abc948a4-4b1a-4a48-b62c-b52718f8838b', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-14 16:58:39', '2023-09-14 16:58:39'),
('abf71b70-047d-4391-b2c1-797af6dd6637', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-17 16:51:00', '2024-04-17 16:51:00'),
('acd13894-8303-4bd0-8564-8142b2237f27', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-24 02:06:37', '2023-12-24 02:06:37'),
('ad4276ad-3b4f-42d5-a787-9aed71e69d4c', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 01:00:20', '2024-04-09 01:00:20'),
('ad792774-c8c5-45a0-b730-0db70c05f03b', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck B - Wheel\"}', NULL, '2023-09-11 14:36:40', '2023-09-11 14:36:40'),
('ad8f2e20-7cff-467a-9782-cfd42aedddb2', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 00:06:32', '2024-02-20 00:06:32'),
('adde6500-4f41-4339-9908-e72745e4730d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-12 16:36:24', '2024-03-12 16:36:24'),
('ae0c379d-f6fa-4a11-b5a9-7981395d3194', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 22:44:36', '2023-09-09 22:44:36'),
('aebee1c2-c019-4cfa-90fc-e715a288d23d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 16:53:04', '2024-03-30 16:53:04'),
('aee037a0-2bd2-49a2-8166-9910f5c12b88', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 23:46:48', '2024-02-29 23:46:48'),
('af28afbb-f78b-43fa-876b-807b332e279c', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-20 20:44:09', '2024-03-20 20:44:09'),
('b012a9b6-204f-4bb6-a69f-5c357221f91c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:34:41', '2023-09-13 13:34:41'),
('b0a53f2f-2ae6-49ba-99a9-02c38817eb7c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-14 16:55:49', '2023-09-14 16:55:49'),
('b0d66a24-4fb5-4cfe-9fac-60416ff122cb', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 19:33:20', '2024-03-26 19:33:20'),
('b2935f1c-7e97-456f-8201-7851f3f5ab94', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-14 00:09:58', '2024-03-14 00:09:58'),
('b2be581f-7d1b-4c60-8728-20fc72849e9e', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 00:10:24', '2024-02-20 00:10:24'),
('b3785b0c-5d89-46d4-88f9-f0937f3977d7', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 16:37:38', '2023-08-31 16:37:38'),
('b3b1df5f-84fe-477a-81a2-ce03c124773c', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 22:46:40', '2023-07-05 22:46:40'),
('b3fa1ee3-2e54-4062-a7b8-602792482ff2', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-16 15:38:23', '2024-04-16 15:38:23'),
('b40724f9-5042-4b96-bd30-be80bbcabd48', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:43:14', '2023-09-13 18:43:14'),
('b4b4cc0d-11a3-4a9f-9d9b-969e61f9d0ec', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:20:58', '2023-09-20 15:20:58'),
('b4d56597-9778-402a-bce7-983b91dc2780', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-10 18:57:34', '2024-02-10 18:57:34'),
('b55a8ab8-e14a-45db-8823-cfce10cd7801', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-05 19:24:39', '2024-03-05 19:24:39'),
('b5f59816-aada-400f-9c41-1f3634b0c2dc', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-05 17:59:43', '2023-07-05 17:59:43'),
('b5fa52f6-c746-4880-8ed2-9068d6ab4431', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-18 16:04:31', '2024-04-18 16:04:31'),
('b6124f36-74d3-4f12-8502-15b385cd579f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-18 16:30:45', '2024-04-18 16:30:45'),
('b63f9b4d-43ae-4cd5-99bb-8e5a73794b88', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 1\"}', NULL, '2023-07-05 16:01:32', '2023-07-05 16:01:32'),
('b6977a0d-b61f-4347-b989-79fb23402c16', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-11 19:47:50', '2024-03-11 19:47:50'),
('b7234a0c-55d1-4a5c-9aa0-41984a5eadfb', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-14 17:56:55', '2023-09-14 17:56:55'),
('b84351fe-ae93-4c0a-b5d7-495b279f0640', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-01 15:24:07', '2024-02-01 15:24:07'),
('b84f663d-be6e-4470-8f39-cada99c6636f', 'App\\Notifications\\OrderNotification', 'App\\User', 90, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 17:53:56', '2024-01-31 17:53:56'),
('b9142587-7cc5-43f6-bfe6-1a163ab6a99e', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:39:33', '2023-09-11 14:39:33'),
('b9b829a5-6e76-4af1-aeee-39ebe7091176', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-10 21:31:20', '2024-02-10 21:31:20'),
('b9d9c4f1-4bb6-40db-8bf4-50d0f3059b7d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:15:40', '2024-03-26 21:15:40'),
('b9da2b29-2807-45a1-a678-44254599e28c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:49:44', '2023-09-13 18:49:44'),
('b9ec0234-f691-46ce-a41f-4820ac7f4068', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-15 13:25:12', '2023-09-15 13:25:12'),
('ba53b3d7-5bb7-4c90-8132-b870ea0c323c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 16:25:49', '2023-09-20 16:25:49'),
('bb3c6742-dfcd-4e92-b5a6-6c7b3a63ce62', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-28 20:09:41', '2023-12-28 20:09:41'),
('bb427b5f-b2f4-4011-8730-ca98487afa3f', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck C - Wheel D\"}', NULL, '2023-09-09 22:42:42', '2023-09-09 22:42:42'),
('bb48d968-9432-4aae-87be-e8b363b96632', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck B - Wheel\"}', NULL, '2023-09-11 14:36:40', '2023-09-11 14:36:40'),
('bcb41177-f690-48c9-b9eb-a908eaad264e', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 19:01:01', '2024-03-22 19:01:01'),
('bdd2facf-43db-44ad-9891-c6ccc6d7b3d7', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:40:42', '2023-09-04 15:40:42'),
('be9b2cdd-1b94-4905-8e7e-ea8491cb5768', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-16 13:23:27', '2024-04-16 13:23:27'),
('bec56b52-f72f-4e9b-b42a-95cf13d3144f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-21 21:52:20', '2024-03-21 21:52:20'),
('bf368f81-1e64-4d71-b1e4-a8e785f90e99', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-19 17:20:55', '2024-01-19 17:20:55'),
('bf516b72-a100-492f-bfb0-6483400d95d5', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-31 15:53:26', '2024-03-31 15:53:26'),
('bfcb13ae-8292-4a0c-9642-175a0e626842', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:38:49', '2023-09-20 15:38:49'),
('c0017c30-7171-4d30-9f5e-88560eddc22f', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-14 16:54:18', '2023-09-14 16:54:18'),
('c0f6d21f-4146-4ef5-b8d7-4e78abba58a1', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-17 16:46:02', '2024-04-17 16:46:02'),
('c14d133f-909d-41db-aac6-5fa7b9ff74c4', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 19:01:30', '2023-09-19 19:01:30'),
('c19c917c-5af5-489e-a480-7406c980856f', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:46:33', '2023-09-04 15:46:33'),
('c28f4dc4-1c34-4407-9e6b-4e76cd3c64cc', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 23:42:21', '2023-09-17 23:42:21'),
('c31d1ee6-1c2d-43a2-be3d-ee7b8138c5cf', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 01:16:36', '2024-04-09 01:16:36'),
('c3c074a4-34dd-4a87-87cc-5a3bc22db303', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 18:18:43', '2024-03-28 18:18:43'),
('c4256540-db32-4482-833a-7f824182701f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 20:26:46', '2024-03-22 20:26:46'),
('c4a6dd45-e55b-4a4f-8b31-70e390f621b1', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 16:05:15', '2023-07-05 16:05:15'),
('c4b3e733-431a-4b07-9376-6b028d13d7f7', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-17 16:37:26', '2024-04-17 16:37:26'),
('c4bb3ae0-67c7-491c-9a5f-1196c2d467ca', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 18:56:58', '2023-08-31 18:56:58'),
('c63f79a7-aa8e-49f6-824c-7221027206c9', 'App\\Notifications\\OrderNotification', 'App\\User', 89, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-05 16:53:07', '2024-02-05 16:53:07'),
('c649c6d3-9fce-4d68-868e-e99f5a2d5d04', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"Il y a une nouvelle commande\",\"body\":\"Vous venez de recevoir une commande\"}', NULL, '2024-02-08 17:39:25', '2024-02-08 17:39:25'),
('c758b06a-2e5d-4bc2-a122-20cdb43ed7da', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck C - Wheel G\"}', NULL, '2023-09-09 22:42:24', '2023-09-09 22:42:24');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('c75fe819-6cdd-4f5b-9e5d-c6f17092444c', 'App\\Notifications\\OrderNotification', 'App\\User', 88, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-02 17:21:42', '2024-02-02 17:21:42'),
('c769261b-d75c-4126-91cc-605344749b33', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck C - Wheel E\"}', NULL, '2023-09-09 22:44:06', '2023-09-09 22:44:06'),
('c7ff573f-b885-493a-bd3f-128a16666abc', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 17:55:11', '2024-03-30 17:55:11'),
('c841ed77-5eec-4d54-87a3-531967f81c9d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-18 16:06:59', '2024-04-18 16:06:59'),
('c8ba1d86-c1cd-4df4-9e28-bc00db91c078', 'App\\Notifications\\OrderNotification', 'App\\User', 2, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-06-29 14:59:05', '2023-06-29 14:59:05'),
('c91640cc-b184-4929-b731-0943b01376e4', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 18:57:24', '2023-08-31 18:57:24'),
('c9dbe3c6-4708-49fb-8521-ac0dbf30abfa', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-30 21:39:59', '2024-01-30 21:39:59'),
('cb95a991-0f60-442f-a0e5-8211bb390b34', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-21 21:42:59', '2024-03-21 21:42:59'),
('cbe22683-6a8b-4aaf-bfda-3892a1a0d174', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 3\"}', NULL, '2023-07-05 22:45:17', '2023-07-05 22:45:17'),
('cc16e4bb-d5ef-4b39-ba45-35c808e5714a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:46:48', '2023-09-04 15:46:48'),
('cca06e97-d1f1-4aa2-abc2-db13cdc10dea', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-10-22 22:00:43', '2023-10-22 22:00:43'),
('cd6f571b-6ada-46c5-a002-bca8f65ea84b', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-04 15:44:59', '2023-09-04 15:44:59'),
('cd82c5ad-aa49-48e4-be00-0f500b4d3c06', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:31:28', '2023-09-11 14:31:28'),
('cdf16f5b-b32e-4866-a311-e7b119d6d993', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-03 16:43:15', '2023-09-03 16:43:15'),
('ce044e50-6f31-4144-96c0-44f8443d307d', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 15:31:36', '2024-03-27 15:31:36'),
('ce427dab-f852-4427-b21a-f540e0670a44', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-11 13:51:10', '2024-03-11 13:51:10'),
('ce6a84d9-32a0-45cb-8a15-f4b9387e3f86', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-08 13:44:36', '2024-04-08 13:44:36'),
('cf07bce8-d076-4aa3-8605-fbfe2e5603b2', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 14:41:14', '2024-03-27 14:41:14'),
('cf0ad7bc-44dc-4e37-aeed-94fddfedcf06', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-29 18:50:41', '2024-03-29 18:50:41'),
('cf22779a-97a9-4bb0-80e6-e7736a777a79', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-18 14:41:42', '2024-04-18 14:41:42'),
('cf3d96d1-0f9f-4099-b203-21500b79b49f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 16:00:20', '2024-03-27 16:00:20'),
('cfb6496a-328b-4848-a678-0e72b8b19e5e', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-14 18:16:02', '2023-09-14 18:16:02'),
('cfde7277-f1a7-4c6c-a08b-859a866ffa85', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 18:52:32', '2023-09-19 18:52:32'),
('d0e89bc4-1bd8-4803-bdff-ad98a5593428', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 20:42:26', '2024-03-22 20:42:26'),
('d0f0bc07-dce5-40ad-b41b-c4346edfcf04', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 20:25:09', '2024-03-22 20:25:09'),
('d152f711-9f98-45a0-996c-f2a3d59cf555', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:50:48', '2023-09-13 18:50:48'),
('d1bc677c-4a0f-466e-bddd-00acdeb6629d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:43:37', '2023-09-11 14:43:37'),
('d296c5aa-e17b-43eb-8109-303de12ecebe', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:53:53', '2023-09-13 13:53:53'),
('d37757b4-4ae2-4eb9-9828-a869e40373a4', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:36:13', '2023-09-11 14:36:13'),
('d3a350a2-71f8-4bdb-979e-c4f883a61fa9', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 1\"}', NULL, '2023-07-05 16:05:39', '2023-07-05 16:05:39'),
('d3cba414-5d2b-4676-a191-7c49593810ab', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 15:14:36', '2024-03-13 15:14:36'),
('d4e6c23a-12af-4c6e-b6de-0369d834c644', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"Il y a une nouvelle commande\",\"body\":\"Vous venez de recevoir une commande\"}', NULL, '2024-02-08 20:39:31', '2024-02-08 20:39:31'),
('d56dce54-500c-4e2d-9f34-b1e4a7dca3fe', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 17:24:34', '2024-02-20 17:24:34'),
('d5bc84b9-3554-489e-89e8-a643d0596578', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-23 10:11:42', '2024-04-23 10:11:42'),
('d6b497c0-ad87-4ef2-a183-c61a8e77661a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 16:29:57', '2023-09-20 16:29:57'),
('d75c5f20-4d64-4ff1-b935-a948df8fb9d1', 'App\\Notifications\\CallWaiter', 'App\\User', 88, '{\"title\":\"You have new customer on\",\"body\":\"Table - Table 3\"}', NULL, '2024-02-02 17:18:46', '2024-02-02 17:18:46'),
('d797e557-8968-4b2f-a574-ceaf78707859', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 03:41:44', '2023-12-30 03:41:44'),
('d7f16d79-fad4-47ef-a017-f2251b7aeacf', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-12 18:22:12', '2024-03-12 18:22:12'),
('d84a4d5f-217c-4fbe-9e32-edad225be15c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 15:12:45', '2023-09-17 15:12:45'),
('d87ddc57-b5e5-4181-837e-a09d770034c6', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-28 20:06:53', '2023-12-28 20:06:53'),
('d8a7bf33-ec5e-4911-876a-93bcb83281a3', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:51:42', '2023-09-13 18:51:42'),
('d8ede719-54ca-46db-aabb-0297059277a3', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"Appel serveur - \",\"body\":\"Truck B - Wheel C\"}', NULL, '2023-09-09 22:14:28', '2023-09-09 22:14:28'),
('daa544b5-9ff0-4f0d-b7bc-c7646d7b38d7', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 20:44:35', '2024-02-29 20:44:35'),
('dbf55750-fb8b-4fe6-a98a-68df8c237f82', 'App\\Notifications\\OrderNotification', 'App\\User', 35, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-07-05 16:32:08', '2023-07-05 16:32:08'),
('dcdf9ebf-3e99-42bc-8eb9-1ef5e4487ef0', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 18:22:06', '2024-03-28 18:22:06'),
('dd35d842-7df9-477a-9cbe-400151875631', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-03 16:43:56', '2023-09-03 16:43:56'),
('dd6d4fe7-0162-4de5-a70b-924af1b6bfb8', 'App\\Notifications\\OrderNotification', 'App\\User', 91, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 14:20:17', '2024-03-28 14:20:17'),
('df48a812-759b-4824-95e9-0b7da86caf36', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:17:28', '2023-09-16 20:17:28'),
('dfee6baa-92d3-4118-94a7-38149fc4cf51', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-01 19:00:23', '2023-09-01 19:00:23'),
('e1510ae3-d127-4275-9af0-e5059e982ad8', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-11 14:42:58', '2023-09-11 14:42:58'),
('e29a36a0-20d0-437a-a1c6-dbdf9be6a26d', 'App\\Notifications\\OrderNotification', 'App\\User', 88, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 19:24:42', '2024-03-22 19:24:42'),
('e3872ab0-bdb4-46f9-9e5d-24ae30e26064', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-24 03:30:09', '2024-04-24 03:30:09'),
('e4580c2b-56e7-46fd-b1ed-0e5c211c67b6', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:13:50', '2024-03-26 21:13:50'),
('e48a2784-7fe0-4d5e-8f50-2b9b5bf30341', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 16:51:52', '2024-03-22 16:51:52'),
('e4a8db4b-4859-4559-9cf9-d49037c0934f', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 2\"}', NULL, '2023-07-14 02:03:07', '2023-07-14 02:03:07'),
('e4e24b36-a7de-476e-8331-b6998c544321', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-01 22:36:00', '2024-04-01 22:36:00'),
('e57adaa5-632a-4ddc-acc4-d6cd50021069', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:07:07', '2024-03-26 21:07:07'),
('e5b6c65f-16dd-45c0-b8a9-6819500190e2', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-20 00:09:42', '2024-02-20 00:09:42'),
('e60f9730-3e13-41db-99f3-15de37e99bf8', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-29 20:34:52', '2024-02-29 20:34:52'),
('e6a6bd9f-ba13-49ff-8606-0df6ed4dd0be', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:23:40', '2023-09-20 15:23:40'),
('e75886f0-736b-4bcf-a2a7-f258398b374d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-09 23:00:36', '2023-09-09 23:00:36'),
('e791b89b-b5ab-449d-9eb0-9bb26c1b9adc', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 01:05:32', '2024-04-09 01:05:32'),
('e7b3029d-1746-4648-ba81-bb3a54b5048e', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-22 10:04:40', '2023-12-22 10:04:40'),
('e7e6c065-0efb-4962-a80b-72cd976e2b7a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-10 18:56:57', '2024-02-10 18:56:57'),
('e83f03ca-4fa0-4656-95d0-313a0203e9c1', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-18 14:26:16', '2024-04-18 14:26:16'),
('e8a86f35-47a4-420a-af96-a994ec407631', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:07:54', '2023-09-20 15:07:54'),
('e8a97dcc-cdc1-46fe-afbd-41b9cca1787b', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-04 17:17:36', '2024-04-04 17:17:36'),
('e8af0938-725f-4724-948e-855aa466718c', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 19:09:02', '2023-09-13 19:09:02'),
('e93f5e8b-d21d-459c-95ce-a48a733d20bc', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-20 19:49:24', '2024-03-20 19:49:24'),
('e9966f62-8ebd-4a3c-b277-ff3510fe6efb', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-21 11:28:40', '2024-04-21 11:28:40'),
('e99bf851-5f3b-48ef-9f1c-1602acad8054', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck B - Wheel C\"}', NULL, '2023-08-31 19:36:21', '2023-08-31 19:36:21'),
('e9a3a5b0-09e7-483a-9cae-1720b44554c4', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-08 14:00:35', '2024-03-08 14:00:35'),
('e9c72472-23ca-4445-895f-a18ac88bc878', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:08:24', '2023-09-16 20:08:24'),
('ebd01d3b-ce6c-46c6-a70b-f629a66a52b7', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 16:45:08', '2024-01-31 16:45:08'),
('ebf1ce5a-49e3-4de0-b79b-43a992535dc9', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-09 13:32:25', '2024-04-09 13:32:25'),
('ec249b68-9e62-4f35-ac24-b341570588f4', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 23:45:00', '2023-09-17 23:45:00'),
('ec544c7e-a697-4eda-84cc-2c5332de7557', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 14:22:27', '2023-09-17 14:22:27'),
('edbefcab-b049-402d-8ddb-07d3be602c9f', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 16:12:52', '2023-09-19 16:12:52'),
('ee29419d-3958-4645-bfac-ef0eacac1a0f', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 08:18:08', '2024-01-31 08:18:08'),
('ee7ab7e7-5f6d-4a0f-a75c-6e4735582dfe', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-12 18:12:42', '2024-03-12 18:12:42'),
('efc3d9e2-a384-4a8a-ba4c-36a43d2f60a5', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 15:24:27', '2023-09-20 15:24:27'),
('f0e2a958-3e38-46c1-8641-dcc8212de888', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 13:26:57', '2024-01-31 13:26:57'),
('f14e48ae-746a-44ee-bf92-0cf44b7c8cb5', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 1\"}', NULL, '2023-07-05 22:24:42', '2023-07-05 22:24:42'),
('f1b08ee7-b7a0-4134-8323-1968cbd88081', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-13 19:57:50', '2024-03-13 19:57:50'),
('f1df3388-2d85-4a90-9d0c-231d6e39437a', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK B - GEAR 1\"}', NULL, '2023-09-19 16:16:22', '2023-09-19 16:16:22'),
('f1fb7cbb-7356-4b17-ac81-c544c98ddac4', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-11 18:30:14', '2024-03-11 18:30:14'),
('f226763f-2446-4310-856c-39db6ccf9367', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 16:02:26', '2023-09-19 16:02:26'),
('f24131ec-3754-453a-9a9c-a0d061436852', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-31 16:56:32', '2024-03-31 16:56:32'),
('f246a3b8-e269-43a6-9d98-4494ff5a807f', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 20:15:33', '2024-03-26 20:15:33'),
('f2b2a9ae-ffc4-46a7-ad1e-e077ef6100df', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 17:22:57', '2024-03-22 17:22:57'),
('f3095fd7-71cf-4d93-9d8d-4a324c968f61', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 15:19:49', '2023-09-17 15:19:49'),
('f3c8863a-5e87-47a4-a6e1-a71e19bb3938', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-20 16:26:27', '2023-09-20 16:26:27'),
('f48e1f25-b37b-4a16-bbae-b2e4f0b08d29', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-01-31 16:38:04', '2024-01-31 16:38:04'),
('f4a50bd3-8714-47fe-b1c7-7e35f2751158', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 18:01:35', '2023-08-31 18:01:35'),
('f4b15bdc-e559-422f-85f6-de3f651e57da', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 18:44:59', '2023-09-13 18:44:59'),
('f6144571-457a-4345-bd69-f7c422c633cc', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-28 19:12:46', '2024-03-28 19:12:46'),
('f66504b7-d12b-4528-8f1e-dbca21ba31a8', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-24 10:40:49', '2024-04-24 10:40:49'),
('f6e30a5a-cca3-4c7c-859f-5356e4ddd17b', 'App\\Notifications\\CallWaiter', 'App\\User', 35, '{\"title\":\"You have new customer on\",\"body\":\"MAIN RECEPTION - TABLE 1\"}', NULL, '2023-07-05 22:26:20', '2023-07-05 22:26:20'),
('f70bab3a-b495-427d-ab88-7b2cd3311107', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-27 20:04:33', '2024-03-27 20:04:33'),
('f748a976-f5c0-4bdc-8447-b4d45b9d0c34', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-11 18:46:46', '2024-04-11 18:46:46'),
('f7b2e803-41f0-4a3b-b9a4-94c701bb4bfc', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-04-29 07:08:28', '2024-04-29 07:08:28'),
('f7c1ad59-1837-4808-8e61-b0d6ea7a5ad1', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL\"}', NULL, '2024-03-13 00:43:35', '2024-03-13 00:43:35'),
('f7c4786a-03a1-494f-a8d5-650db043e032', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-03 16:42:26', '2023-09-03 16:42:26'),
('f7da8fbc-36b4-43f8-8842-295c95554f6f', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-17 14:06:07', '2023-09-17 14:06:07'),
('f7fe5aea-69d7-4f40-9fe0-2bb224fc9b92', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-15 23:06:21', '2024-02-15 23:06:21'),
('f882c8df-ccb3-41ef-b8c5-a42586fa9c99', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-30 20:04:40', '2024-03-30 20:04:40'),
('f93d11a1-d6ff-48d4-b377-77390a8bb2f5', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 19:26:40', '2023-09-19 19:26:40'),
('f9a59802-c07a-4b5b-b9ed-83c5ad652e17', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"TRUCK A - WHEEL B\"}', NULL, '2023-09-14 16:51:33', '2023-09-14 16:51:33'),
('f9e2249b-932c-4406-8987-b5c66f028735', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-15 20:35:11', '2023-09-15 20:35:11'),
('fa95faf2-b5aa-4ca1-81e5-556662976039', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-10 19:28:46', '2024-02-10 19:28:46'),
('faa2d0ac-ff2c-4b9f-8f43-92518abba44d', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-13 20:10:29', '2024-03-13 20:10:29'),
('fbbb15cf-0b40-46c6-a128-3bef1e78f52c', 'App\\Notifications\\CallWaiter', 'App\\User', 103, '{\"title\":\"You have new customer on\",\"body\":\"SALON - A2\"}', NULL, '2023-12-26 19:49:01', '2023-12-26 19:49:01'),
('fbe4b844-eba8-45c3-9540-714d570ae4d2', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 19:56:27', '2023-09-19 19:56:27'),
('fbff8f4e-3f72-452e-ae8f-a904f9608e51', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-13 20:18:40', '2024-03-13 20:18:40'),
('fca39e48-1fc2-4387-8206-0a1bb069f854', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-15 23:07:15', '2024-02-15 23:07:15'),
('fcacf010-6bf7-4cdd-970b-d732ab6cd7c4', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:11:31', '2024-03-26 21:11:31'),
('fd025ef5-33fe-4195-bd72-05ee12b7a641', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 20:28:05', '2024-03-22 20:28:05'),
('fd06e8a7-1f6c-4bcc-a861-630019b15f17', 'App\\Notifications\\OrderNotification', 'App\\User', 50, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-08-31 12:53:20', '2023-08-31 12:53:20'),
('fd17d136-422f-4b76-984a-0ebc261d1f1b', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 03:36:00', '2023-12-30 03:36:00'),
('fd7db8d8-8f41-407f-a76a-f16b2257394a', 'App\\Notifications\\CallWaiter', 'App\\User', 91, '{\"title\":\"You have new customer on\",\"body\":\"Elegance & Flavors Bar - Flavors Bar 10\"}', NULL, '2024-03-08 18:14:56', '2024-03-08 18:14:56'),
('fd82d239-3e54-4808-a79f-1b73776b5f6a', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-22 18:59:19', '2024-03-22 18:59:19'),
('fdfc002e-6f85-44c7-b680-8297b8bd168c', 'App\\Notifications\\CallWaiter', 'App\\User', 52, '{\"title\":\"You have new customer on\",\"body\":\"Truck B - Wheel C\"}', NULL, '2023-09-03 16:47:41', '2023-09-03 16:47:41'),
('fdfe07f4-60ba-436b-bed1-53387a8cd15e', 'App\\Notifications\\CallWaiter', 'App\\User', 91, '{\"title\":\"You have new customer on\",\"body\":\"Elegance & Flavors Bar - Flavors Bar 11\"}', NULL, '2024-02-05 15:19:56', '2024-02-05 15:19:56'),
('fe1956ed-29e5-4ae2-998a-283735443129', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-02-15 22:35:15', '2024-02-15 22:35:15'),
('fe902ef4-050a-4913-9e49-71be3e592a61', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-11 18:22:26', '2024-03-11 18:22:26'),
('ff26d0c8-250b-4d82-b50f-009806a34473', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-13 13:50:02', '2023-09-13 13:50:02'),
('ff298dbc-76dd-48b4-971c-4d761c249aff', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-19 16:07:53', '2023-09-19 16:07:53'),
('ff408127-965b-4519-8d35-cec33c99ad4a', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-30 22:19:06', '2023-12-30 22:19:06'),
('ff7f7208-bf8d-46d5-9d1b-a13b66fcb28a', 'App\\Notifications\\OrderNotification', 'App\\User', 52, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-09-16 20:36:57', '2023-09-16 20:36:57'),
('ffa407b0-e522-45f0-a2d8-8d15402250ce', 'App\\Notifications\\OrderNotification', 'App\\User', 103, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2023-12-28 20:11:30', '2023-12-28 20:11:30'),
('ffbb9217-e14d-4c6e-8573-a469484ba2c2', 'App\\Notifications\\OrderNotification', 'App\\User', 225, '{\"title\":\"There is new order\",\"body\":\"You have just received an order\"}', NULL, '2024-03-26 21:24:35', '2024-03-26 21:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `item_id`, `name`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(196, 423, '{\"en\":\"asdsd\"}', '{\"en\":\"sadsd +sadsd\\u20ac\"}', '2024-01-17 17:00:23', '2024-04-24 10:13:52', '2024-01-17 17:02:02'),
(197, 423, '{\"en\":\"asdsadasdsad\"}', '{\"en\":\"new itemsdsad \"}', '2024-01-17 17:00:40', '2024-04-24 10:13:52', '2024-01-17 17:02:04'),
(198, 423, '{\"en\":\"sdfsdf\"}', '{\"en\":\"new itzxcsdem \"}', '2024-01-17 17:01:49', '2024-04-24 10:13:52', '2024-01-17 17:02:06'),
(199, 422, '{\"en\":\"Juicy Revival\",\"fr\":\"Juicy Revival\",\"eo\":\"Juicy Revival\",\"ga\":\"Juicy Revival\"}', '{\"en\":\"Berry Bliss Burst,Citrus Sunrise Splash,Tropical Mango Tango +2EUR,Green Goddess Reviver +2EUR,Watermelon Wave Quencher +2EUR\"}', '2024-01-29 01:16:07', '2024-04-24 10:13:52', NULL),
(200, 435, '{\"en\":\"White Wines\"}', '{\"en\":\"Chardonnay - Domaine Blanc +25,Sauvignon Blanc - Vineyard Breeze +28,Pinot Grigio - Bella Vista +22,no white wine\"}', '2024-01-29 01:49:24', '2024-04-24 10:13:52', '2024-01-29 21:56:39'),
(201, 435, '{\"en\":\"Red Wines\"}', '{\"en\":\"Merlot - Velvet Charm +30EUR,Cabernet Sauvignon - Reserve Oak +35EUR,Malbec - Mountain Majesty +40EUR\"}', '2024-01-29 01:50:07', '2024-04-24 10:13:52', NULL),
(202, 435, '{\"en\":\"Sparkling Wines\"}', '{\"en\":\"Prosecco - Bubbling Elegance +28EUR,Champagne - Grand Celebration +50EUR\"}', '2024-01-29 01:50:38', '2024-04-24 10:13:52', '2024-01-29 21:56:42'),
(203, 455, '{\"en\":\"Italian wines\"}', '{\"en\":\"Chianti Classico Riserva +30EUR,Barolo +60EUR,Amarone della Valpolicella +80EUR,Brunello di Montalcino +100EUR,Super Tuscan Blend +120EUR,Franciacorta Brut (Sparkling) +40EUR,Gavi di Gavi +25EUR,Vermentino +25EUR,Pinot Grigio +20EUR\"}', '2024-01-29 02:15:14', '2024-04-24 10:13:52', NULL),
(204, 516, '{\"en\":\"Red wine\"}', '{\"en\":\"25cl +8,33cl +15,Bottle (75ml) +29EUR\"}', '2024-02-01 15:27:56', '2024-04-24 10:13:52', '2024-03-26 17:05:02'),
(206, 509, '{\"en\":\"Pale Ales & IPAs\"}', '{\"en\":\"Pine Ridge Pale Ale +6.99EUR,Oak Hollow IPA +7.49EUR,Harbor Haze IPA +8.99EUR\"}', '2024-03-18 16:50:59', '2024-04-24 10:13:52', '2024-03-18 16:56:23'),
(207, 509, '{\"en\":\"Lagers & Pilsners\"}', '{\"en\":\"Golden Gate Lager +6.49EUR,Prairie Plains Pilsner +6.99EUR,Urban Wheat +5.99EUR\"}', '2024-03-18 16:51:35', '2024-04-24 10:13:52', '2024-03-18 16:56:24'),
(208, 509, '{\"en\":\"Ales & Stouts\"}', '{\"en\":\"Riverfront Red Ale +7.29EUR,Valley View Porter +7.99EUR,Creekside Cream Ale +6.79EUR,Canyon Creek Amber Ale +7.49EUR,Summit Stout +8.49EUR\"}', '2024-03-18 16:52:26', '2024-04-24 10:13:52', '2024-03-18 16:56:26'),
(209, 509, '{\"en\":\"Pale Ales & IPAs\"}', '{\"en\":\"Pine Ridge Pale Ale +6EUR,Oak Hollow IPA +7EUR,Harbor Haze IPA +8.99EUR\"}', '2024-03-18 16:59:08', '2024-04-24 10:13:52', '2024-03-26 17:09:09'),
(210, 526, '{\"en\":\"RECETTE\",\"fr\":\"RECETTE\"}', '{\"en\":\"Biryani,Butter,Coco,Curry,Dewalls,Korma,Tikka Massala\"}', '2024-03-18 23:02:51', '2024-04-24 10:13:52', NULL),
(211, 526, '{\"en\":\"GARNITURE\",\"fr\":\"GARNITURE\"}', '{\"en\":\"Poulet,B\\u0153uf,L\\u00e9gumes,Crevette +2EUR,Agneau +2EUR\"}', '2024-03-18 23:04:06', '2024-04-24 10:13:52', NULL),
(212, 526, '{\"en\":\"NAAN\",\"fr\":\"NAAN\"}', '{\"en\":\"Nature,Cheese Naan +0.9EUR,Ail,Piment,newitem +0.2EUR\"}', '2024-03-18 23:04:37', '2024-04-24 10:13:52', NULL),
(213, 526, '{\"en\":\"BOISSON\",\"fr\":\"BOISSON\"}', '{\"en\":\"Coca cola 33cl,Coca z\\u00e9ro 33cl,Ice tea 33 cl,Eau plate 50cl,Eau gazeuse 50cl,Lassi nature 33cl +2EUR,Lassi mangue 33cl +2EUR,Lassi rose 33cl +2EUR,Lassi coco 33cl +2EUR\"}', '2024-03-18 23:06:56', '2024-04-24 10:13:52', NULL),
(214, 526, '{\"en\":\"SUPPLEMENT\"}', '{\"en\":\"Version XL (suppl\\u00e9ment riz + garniture) +3.50EUR\"}', '2024-03-18 23:07:40', '2024-04-24 10:13:52', '2024-03-18 23:20:51'),
(215, 526, '{\"en\":\"COUVERTS\",\"fr\":\"COUVERTS\"}', '{\"en\":\"AVEC COUVERTS,SANS COUVERTS\"}', '2024-03-18 23:08:13', '2024-04-24 10:13:52', NULL),
(216, 527, '{\"en\":\"RECETTE\",\"fr\":\"RECETTE\"}', '{\"en\":\"Poulet Tikka,Boeuf Lanka,Poivrons Massala\"}', '2024-03-18 23:15:26', '2024-04-24 10:13:52', NULL),
(217, 527, '{\"en\":\"Naan\",\"fr\":\"Naan\"}', '{\"en\":\"Nature,Cheese Naan +0.90EUR,Ail +0.90EUR,Piment +0.90EUR\"}', '2024-03-18 23:16:30', '2024-04-24 10:13:53', NULL),
(218, 527, '{\"en\":\"SAMOSSA (1 pi\\u00e8ce)\",\"fr\":\"SAMOSSA (1 pi\\u00e8ce)\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes\"}', '2024-03-18 23:17:10', '2024-04-24 10:13:53', NULL),
(219, 527, '{\"en\":\"BOISSON\",\"fr\":\"BOISSON\"}', '{\"en\":\"Coca cola 33cl,Coca z\\u00e9ro 33cl,Ice tea 33 cl,Eau plate 50cl,Eau gazeuse 50cl,Lassi nature 33cl +2EUR,Lassi mangue 33cl +2EUR,Lassi rose 33cl +2EUR,Lassi coco 33cl +2EUR\"}', '2024-03-18 23:18:22', '2024-04-24 10:13:53', NULL),
(220, 527, '{\"en\":\"SUPPLEMENTS\"}', '{\"en\":\"SAMOSSA (1 pi\\u00e8ce) +1.50EUR\"}', '2024-03-18 23:19:06', '2024-04-24 10:13:53', '2024-03-18 23:19:59'),
(221, 528, '{\"en\":\"RECETTE\",\"fr\":\"RECETTE\"}', '{\"en\":\"Dal lentilles corails,Coco aubergines,Palak \\u00e9pinards,Dewalls poivrons\"}', '2024-03-18 23:25:42', '2024-04-24 10:13:53', NULL),
(222, 528, '{\"en\":\"NAAN\",\"fr\":\"NAAN\"}', '{\"en\":\"Nature,Cheese Naan +0.90EUR,Ail +0.90EUR,Piment +0.90EUR\"}', '2024-03-18 23:26:25', '2024-04-24 10:13:53', NULL),
(223, 528, '{\"en\":\"BOISSON\",\"fr\":\"BOISSON\"}', '{\"en\":\"Coca cola 33cl,Coca cola 33cl,Ice tea 33 cl,Eau plate 50cl,Eau gazeuse 50cl,Lassi nature 33cl +2EUR,Lassi mangue 33cl +2EUR,Lassi rose 33cl +2EUR,Lassi coco 33cl +2EUR\"}', '2024-03-18 23:27:42', '2024-04-24 10:13:53', NULL),
(224, 528, '{\"en\":\"COUVERTS\",\"fr\":\"COUVERTS\"}', '{\"en\":\"Oui,Non\"}', '2024-03-18 23:28:32', '2024-04-24 10:13:53', NULL),
(225, 529, '{\"en\":\"Rolls (2 pi\\u00e8ces)\",\"fr\":\"Rolls (2 pi\\u00e8ces)\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes\"}', '2024-03-18 23:33:55', '2024-04-24 10:13:53', NULL),
(226, 530, '{\"en\":\"Samossas (2 pi\\u00e8ces)\",\"fr\":\"Samossas (2 pi\\u00e8ces)\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes\"}', '2024-03-18 23:42:51', '2024-04-24 10:13:53', NULL),
(227, 531, '{\"en\":\"Bhajjis (5 pi\\u00e8ces)\",\"fr\":\"Bhajjis (5 pi\\u00e8ces)\"}', '{\"en\":\"Aubergine,Piment,Pomme de terre,Oignon\"}', '2024-03-18 23:45:33', '2024-04-24 10:13:53', NULL),
(228, 532, '{\"en\":\"Naan\",\"fr\":\"Naan\"}', '{\"en\":\"Nature,Cheese Naan +0.90EUR,Ail +0.90EUR,Piment +0.90EUR\"}', '2024-03-18 23:47:18', '2024-04-24 10:13:53', NULL),
(229, 533, '{\"en\":\"Tikkas (4 pi\\u00e8ces)\",\"fr\":\"Tikkas (4 pi\\u00e8ces)\"}', '{\"en\":\"Poulet,Boeuf\"}', '2024-03-18 23:49:05', '2024-04-24 10:13:53', NULL),
(230, 534, '{\"en\":\"Naan\",\"fr\":\"Naan\"}', '{\"en\":\"Nature,Cheese Naan +0.90EUR,Ail +0.90EUR,Piment +0.90EUR\"}', '2024-03-18 23:58:35', '2024-04-24 10:13:53', NULL),
(231, 535, '{\"en\":\"Naan\",\"fr\":\"Naan\"}', '{\"en\":\"Nature,Cheese Naan +0.90EUR,Ail +0.90EUR,Piment +0.90EUR\"}', '2024-03-18 23:59:34', '2024-04-24 10:13:53', NULL),
(232, 536, '{\"en\":\"Naan\",\"fr\":\"Naan\"}', '{\"en\":\"Nature,Cheese Naan +0.90EUR,Ail +0.90EUR,Piment +0.90EUR\"}', '2024-03-19 00:00:25', '2024-04-24 10:13:53', NULL),
(233, 537, '{\"en\":\"GARNITURE\",\"fr\":\"GARNITURE\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes,Agneau +2EUR,Crevette +2EUR\"}', '2024-03-19 00:34:55', '2024-04-24 10:13:53', NULL),
(234, 538, '{\"en\":\"GARNITURE\",\"fr\":\"GARNITURE\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes,Agneau +2EUR,Crevette +2EUR\"}', '2024-03-19 00:37:45', '2024-04-24 10:13:53', NULL),
(235, 539, '{\"en\":\"GARNITURE\",\"fr\":\"GARNITURE\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes,Agneau +2EUR,Crevette +2EUR\"}', '2024-03-19 00:39:05', '2024-04-24 10:13:53', NULL),
(236, 541, '{\"en\":\"GARNITURE\",\"fr\":\"GARNITURE\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes,Agneau +2EUR,Crevette +2EUR\"}', '2024-03-19 00:40:34', '2024-04-24 10:13:53', NULL),
(237, 542, '{\"en\":\"GARNITURE\",\"fr\":\"GARNITURE\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes,Agneau +2EUR,Crevette +2EUR\"}', '2024-03-19 00:41:49', '2024-04-24 10:13:53', NULL),
(238, 543, '{\"en\":\"GARNITURE\",\"fr\":\"GARNITURE\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes,Agneau +2EUR,Crevette +2EUR\"}', '2024-03-19 00:43:02', '2024-04-24 10:13:53', NULL),
(239, 540, '{\"en\":\"GARNITURE\",\"fr\":\"GARNITURE\"}', '{\"en\":\"Poulet,Boeuf,L\\u00e9gumes,Agneau +2EUR,Crevette +2EUR\"}', '2024-03-19 00:45:14', '2024-04-24 10:13:53', NULL),
(240, 549, '{\"en\":\"Boissons soft\",\"fr\":\"Boissons soft\"}', '{\"en\":\"Coca-cola,Coca-z\\u00e9ro,Ice tea,Eau plate,Eau gazeuse,Soda Indien +0.4EUR\"}', '2024-03-19 00:50:13', '2024-04-24 10:13:53', NULL),
(241, 550, '{\"en\":\"Lassi\",\"fr\":\"Lassi\"}', '{\"en\":\"Nature,Mangue,Rose,Coco\"}', '2024-03-19 00:52:16', '2024-04-24 10:13:53', NULL),
(242, 516, '{\"en\":\"Wine\"}', '{\"en\":\"Cabarnet Sauvignon,Merlot,Pinot\"}', '2024-03-26 17:04:57', '2024-04-24 10:13:53', NULL),
(243, 516, '{\"en\":\"ml\"}', '{\"en\":\"250ml +8EUR,330ml +15EUR,Bottle (750ml) +29EUR\"}', '2024-03-26 17:05:56', '2024-04-24 10:13:53', NULL),
(244, 517, '{\"en\":\"Wine\"}', '{\"en\":\"Chardonnay,Sauvignon blanc,Pinot\"}', '2024-03-26 17:07:50', '2024-04-24 10:13:53', NULL),
(245, 517, '{\"en\":\"ml\"}', '{\"en\":\"250ml +7EUR,330ml +13EUR,Bottle (750ml) +25EUR\"}', '2024-03-26 17:08:27', '2024-04-24 10:13:53', NULL),
(246, 509, '{\"en\":\"Craft beer selection\"}', '{\"en\":\"Hop Haven IPA,Amber Ale Trailblazer,Stout Summit Porter,Citrus Cascade Pale Ale\"}', '2024-03-26 17:10:38', '2024-04-24 10:13:53', NULL),
(247, 509, '{\"en\":\"sizes\"}', '{\"en\":\"330ml,500ml +3EUR\"}', '2024-03-26 17:11:30', '2024-04-24 10:13:53', NULL),
(248, 526, '{\"en\":null}', '{\"en\":\",,,,\"}', '2024-04-16 15:39:24', '2024-04-24 10:13:53', '2024-04-17 16:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED DEFAULT NULL,
  `restorant_id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `delivery_price` double NOT NULL,
  `order_price` double NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `srtipe_payment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` double(8,2) NOT NULL DEFAULT '0.00',
  `fee_value` double NOT NULL DEFAULT '0',
  `static_fee` double NOT NULL DEFAULT '0',
  `delivery_method` int NOT NULL DEFAULT '1' COMMENT '1- Delivery, 2- Pickup',
  `delivery_pickup_interval` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vatvalue` double DEFAULT '0',
  `payment_processor_fee` double(8,2) NOT NULL DEFAULT '0.00',
  `time_to_prepare` int DEFAULT NULL,
  `table_id` bigint UNSIGNED DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `md` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `coupon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `kds_finished` int NOT NULL DEFAULT '0',
  `id_per_vendor` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tip` double(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`, `payment_link`, `employee_id`, `deleted_at`, `md`, `coupon`, `discount`, `kds_finished`, `id_per_vendor`, `tip`) VALUES
(742, '2024-02-05 15:22:29', '2024-02-05 15:23:27', NULL, 1, 62, NULL, 0, 43.97, 'cod', 'paid', ' not too spicy', NULL, NULL, NULL, 0.00, 0, 0, 3, '', 0, 0.00, 15, 292, NULL, NULL, '', NULL, NULL, 'e94550c93cd70fe748e6982b3439ad3b', NULL, 0, 0, '000002', 0.00),
(786, '2024-03-08 18:15:36', '2024-03-28 14:17:41', NULL, NULL, 64, NULL, 0, 21.25, 'cod', 'unpaid', '  No creme', NULL, NULL, NULL, 0.00, 0, 0, 3, '', 5.08, 0.00, NULL, 300, NULL, NULL, '', NULL, NULL, '61b4a64be663682e8cb037d9719ad8cd', NULL, 0, 0, '000002', 0.00),
(807, '2024-03-20 15:02:54', '2024-03-20 15:20:09', NULL, 1, 187, NULL, 0, 11.5, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-20T13:00', 1.05, 0.00, 5, NULL, '12015550123', NULL, '', NULL, NULL, '6e7b33fdea3adc80ebd648fffb665bb8', NULL, 0, 0, '000002', 0.00),
(808, '2024-03-20 19:49:24', '2024-03-20 20:28:23', NULL, 1, 187, NULL, 0, 5.9, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-20T14:48', 0.54, 0.00, 5, NULL, '1112112123123', NULL, '', NULL, NULL, 'a8ecbabae151abacba7dbde04f761c37', NULL, 0, 0, '000003', 0.00),
(809, '2024-03-20 20:44:08', '2024-03-20 23:35:30', NULL, 1, 187, NULL, 0, 4.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-20T16:44', 0.45, 0.00, NULL, NULL, '112123123123', NULL, '', NULL, NULL, '32b30a250abd6331e03a2a1f16466346', NULL, 0, 0, '000004', 0.00),
(810, '2024-03-20 23:34:47', '2024-03-20 23:35:53', NULL, 1, 187, NULL, 0, 3.5, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '1115_1120', 0.32, 0.00, 5, NULL, '330625121425', NULL, '', NULL, NULL, 'b6edc1cd1f36e45daf6d7824d7bb2283', NULL, 0, 0, '000005', 0.00),
(811, '2024-03-21 21:42:59', '2024-03-21 21:46:35', NULL, 225, 187, NULL, 0, 3.3, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-21T16:43', 0.26, 0.00, NULL, NULL, '330678787878', NULL, '', NULL, NULL, '670e8a43b246801ca1eaca97b3e19189', NULL, 0, 0, '000006', 0.00),
(812, '2024-03-21 21:47:31', '2024-03-22 15:31:54', NULL, 225, 187, NULL, 0, 3.3, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-21T16:48', 0.26, 0.00, 5, NULL, '330679787878', NULL, '', NULL, NULL, '81e74d678581a3bb7a720b019f4f1a93', NULL, 0, 0, '000007', 0.00),
(813, '2024-03-21 21:52:20', '2024-03-22 14:23:31', NULL, 225, 187, NULL, 0, 48, 'cod', '', ' No tomatoes please', NULL, NULL, NULL, 0.00, 0, 0, 2, ' 2024-03-21T17:55', 3.64, 0.00, NULL, NULL, '330674757677', NULL, '', NULL, NULL, 'e0cf1f47118daebc5b16269099ad7347', NULL, 0, 0, '000008', 0.00),
(814, '2024-03-22 14:45:06', '2024-03-22 14:49:20', NULL, 1, 187, NULL, 0, 58.3, 'cod', 'paid', ' with oignons please', NULL, NULL, NULL, 0.00, 0, 0, 2, 'Select Day 12:00 - 12:30', 4.96, 0.00, 5, NULL, '10607070708', NULL, '', NULL, NULL, '96b9bff013acedfb1d140579e2fbeb63', NULL, 0, 0, '000009', 2.00),
(815, '2024-03-22 14:51:04', '2024-03-22 14:58:07', NULL, 1, 187, NULL, 0, 50, 'cod', '', ' no oignoins please', NULL, NULL, NULL, 0.00, 0, 0, 2, 'Select Day 12:30 - 13:00', 3.64, 0.00, NULL, NULL, '330607070708', NULL, '', NULL, NULL, '71ad16ad2c4d81f348082ff6c4b20768', NULL, 0, 0, '000010', 2.00),
(816, '2024-03-22 14:53:17', '2024-03-22 14:58:13', NULL, 1, 187, NULL, 0, 18.5, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, 'Select Day 12:00 - 12:30', 1.5, 0.00, 10, NULL, '1120212125112', NULL, '', NULL, NULL, '43fa7f58b7eac7ac872209342e62e8f1', NULL, 0, 0, '000011', 0.00),
(817, '2024-03-22 15:00:06', '2024-03-22 15:02:06', NULL, 1, 187, NULL, 0, 51.8, 'cod', '', ' NO OIGNONS PLEASE', NULL, NULL, NULL, 0.00, 0, 0, 2, 'Select Day 13:30 - 14:00', 3.64, 0.00, NULL, NULL, '330708080808', NULL, '', NULL, NULL, '31839b036f63806cba3f47b93af8ccb5', NULL, 0, 0, '000012', 2.00),
(818, '2024-03-22 15:41:33', '2024-03-22 17:29:21', NULL, 1, 187, NULL, 0, 11.5, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-24 18:30 - 19:00', 1.05, 0.00, 15, NULL, '12015550123', NULL, '', NULL, NULL, 'f0adc8838f4bdedde4ec2cfad0515589', NULL, 0, 0, '000013', 0.00),
(819, '2024-03-22 16:48:06', '2024-03-22 16:54:09', NULL, 1, 187, NULL, 0, 72.5, 'cod', '', ' No oignons please', NULL, NULL, NULL, 0.00, 0, 0, 2, 'Select Day 14:00 - 14:30', 5.22, 0.00, NULL, NULL, '330678787878', NULL, '', NULL, NULL, '3b5dca501ee1e6d8cd7b905f4e1bf723', NULL, 0, 0, '000014', 4.00),
(820, '2024-03-22 16:50:33', '2024-03-22 16:54:10', NULL, 1, 187, NULL, 0, 26.9, 'cod', '', ' no oignons', NULL, NULL, NULL, 0.00, 0, 0, 2, 'Select Day 12:00 - 12:10', 1.82, 0.00, NULL, NULL, '330765656654', NULL, '', NULL, NULL, 'e2a2dcc36a08a345332c751b2f2e476c', NULL, 0, 0, '000015', 2.00),
(821, '2024-03-22 16:51:52', '2024-03-22 17:29:17', NULL, 1, 187, NULL, 0, 13.5, 'cod', 'paid', ' No oignons', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 12:10 - 12:20', 1.05, 0.00, 5, NULL, '330754545155444', NULL, '', NULL, NULL, '4558dbb6f6f8bb2e16d03b85bde76e2c', NULL, 0, 0, '000016', 2.00),
(822, '2024-03-22 16:56:25', '2024-03-22 17:29:15', NULL, 1, 187, NULL, 0, 3.5, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 12:00 - 12:10', 0.32, 0.00, 5, NULL, '151231321231', NULL, '', NULL, NULL, 'afda332245e2af431fb7b672a68b659d', NULL, 0, 0, '000017', 0.00),
(823, '2024-03-22 17:01:09', '2024-03-22 17:27:18', NULL, 1, 187, NULL, 0, 5.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 12:00 - 12:10', 0.54, 0.00, NULL, NULL, '144545454545', NULL, '', NULL, NULL, '632cee946db83e7a52ce5e8d6f0fed35', NULL, 0, 0, '000018', 0.00),
(824, '2024-03-22 17:03:11', '2024-03-22 17:27:19', NULL, 1, 187, NULL, 0, 3.5, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 12:00 - 12:10', 0.32, 0.00, NULL, NULL, '1113131321231', NULL, '', NULL, NULL, '677e09724f0e2df9b6c000b75b5da10d', NULL, 0, 0, '000019', 0.00),
(825, '2024-03-22 17:04:11', '2024-03-22 17:27:21', NULL, 1, 187, NULL, 0, 2.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 12:00 - 12:10', 0.26, 0.00, NULL, NULL, '121212312123', NULL, '', NULL, NULL, 'd554f7bb7be44a7267068a7df88ddd20', NULL, 0, 0, '000020', 0.00),
(826, '2024-03-22 17:09:26', '2024-03-22 17:27:22', NULL, 1, 187, NULL, 0, 4.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-23 12:00 - 12:10', 0.45, 0.00, NULL, NULL, '11121231231', NULL, '', NULL, NULL, '795c7a7a5ec6b460ec00c5841019b9e9', NULL, 0, 0, '000021', 0.00),
(827, '2024-03-22 17:11:34', '2024-03-22 17:27:24', NULL, 1, 187, NULL, 0, 75.1, 'cod', '', ' NO OIGNONS', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 13:10 - 13:20', 5.41, 0.00, NULL, NULL, '1121212121213', NULL, '', NULL, NULL, 'fa3a3c407f82377f55c19c5d403335c7', NULL, 0, 0, '000022', 5.00),
(828, '2024-03-22 17:22:57', '2024-03-22 17:27:25', NULL, 1, 187, NULL, 0, 3.5, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 12:30 - 12:40', 0.32, 0.00, NULL, NULL, '11212312121', NULL, '', NULL, NULL, 'c2626d850c80ea07e7511bbae4c76f4b', NULL, 0, 0, '000023', 0.00),
(829, '2024-03-22 17:24:45', '2024-03-22 17:27:26', NULL, 1, 187, NULL, 0, 2.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-23 12:00 - 12:10', 0.26, 0.00, NULL, NULL, '112132123121', NULL, '', NULL, NULL, 'ce78d1da254c0843eb23951ae077ff5f', NULL, 0, 0, '000024', 0.00),
(830, '2024-03-22 17:26:58', '2024-03-22 17:29:01', NULL, 1, 187, NULL, 0, 47.8, 'cod', 'paid', ' No cheese please', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 18:50 - 19:00', 3.64, 0.00, 5, NULL, '330778787878', NULL, '', NULL, NULL, '8e82ab7243b7c66d768f1b8ce1c967eb', NULL, 0, 0, '000025', 2.00),
(831, '2024-03-22 17:39:24', '2024-03-22 19:01:36', NULL, 1, 187, NULL, 0, 4.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 12:40 - 12:50', 0.45, 0.00, NULL, NULL, '145454545454', NULL, '', NULL, NULL, 'e0ec453e28e061cc58ac43f91dc2f3f0', NULL, 0, 0, '000026', 0.00),
(832, '2024-03-22 18:42:02', '2024-03-22 19:01:34', NULL, 1, 187, NULL, 0, 2.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 13:40 - 13:50', 0.26, 0.00, NULL, NULL, '1412311321435', NULL, '', NULL, NULL, '7250eb93b3c18cc9daa29cf58af7a004', NULL, 0, 0, '000027', 0.00),
(833, '2024-03-22 18:46:33', '2024-03-22 19:01:33', NULL, 1, 187, NULL, 0, 4.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, 'Select Day 13:50 - 14:00', 0.45, 0.00, NULL, NULL, '14545456445', NULL, '', NULL, NULL, '013a006f03dbc5392effeb8f18fda755', NULL, 0, 0, '000028', 0.00),
(834, '2024-03-22 18:48:21', '2024-03-22 19:01:32', NULL, 1, 187, NULL, 0, 24.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 14:10 - 14:20', 1.82, 0.00, NULL, NULL, '114132132121', NULL, '', NULL, NULL, '301ad0e3bd5cb1627a2044908a42fdc2', NULL, 0, 0, '000029', 0.00),
(835, '2024-03-22 18:49:21', '2024-03-22 19:01:30', NULL, 1, 187, NULL, 0, 26.9, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-23 11:50 - 12:00', 1.82, 0.00, NULL, NULL, '15451531351', NULL, '', NULL, NULL, '4d5b995358e7798bc7e9d9db83c612a5', NULL, 0, 0, '000030', 2.00),
(836, '2024-03-22 18:59:19', '2024-03-22 19:01:28', NULL, 1, 187, NULL, 0, 24.9, 'cod', '', ' No Oignons', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 14:20 - 14:30', 1.82, 0.00, NULL, NULL, '12111321132', NULL, '', NULL, NULL, 'ab88b15733f543179858600245108dd8', NULL, 0, 0, '000031', 0.00),
(837, '2024-03-22 19:01:01', '2024-03-22 19:01:27', NULL, 225, 187, NULL, 0, 22.9, 'cod', '', ' No oignons', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 14:00 - 14:10', 1.82, 0.00, NULL, NULL, '11452144454', NULL, '', NULL, NULL, 'b0b183c207f46f0cca7dc63b2604f5cc', NULL, 0, 0, '000032', 0.00),
(838, '2024-03-22 19:21:12', '2024-03-22 19:21:13', NULL, 1, 63, NULL, 0, 7.49, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 2.00, 0.1458, 0.2, 2, '2024-03-22 15:30 - 16:00', 1.14, 0.00, NULL, NULL, '1121121212', NULL, '', NULL, NULL, 'f9028faec74be6ec9b852b0a542e2f39', NULL, 0, 0, '000002', 0.00),
(839, '2024-03-22 19:24:42', '2024-03-22 19:24:42', NULL, 1, 61, NULL, 0, 11.98, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 14:00 - 14:30', 1.52, 0.00, NULL, NULL, '11212123121', NULL, '', NULL, NULL, '8f7d807e1f53eff5f9efbe5cb81090fb', NULL, 0, 0, '000002', 2.00),
(840, '2024-03-22 19:31:20', '2024-03-22 19:32:32', NULL, 225, 187, NULL, 0, 22, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 18:30 - 18:40', 1.82, 0.00, 15, NULL, '1544545454', NULL, '', NULL, NULL, 'fa83a11a198d5a7f0bf77a1987bcd006', NULL, 0, 0, '000033', 0.00),
(841, '2024-03-22 19:38:39', '2024-03-22 20:40:46', NULL, 225, 187, NULL, 0, 21.4, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 19:20 - 19:30', 1.5, 0.00, NULL, NULL, '1211212113214', NULL, '', NULL, NULL, '02a32ad2669e6fe298e607fe7cc0e1a0', NULL, 0, 0, '000034', 0.00),
(842, '2024-03-22 20:25:08', '2024-03-22 20:40:48', NULL, 225, 187, NULL, 0, 50, 'cod', '', ' no oignon', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 18:30 - 18:40', 3.64, 0.00, NULL, NULL, '12121212312', NULL, '', NULL, NULL, 'fc3cf452d3da8402bebb765225ce8c0e', NULL, 0, 0, '000035', 2.00),
(843, '2024-03-22 20:26:46', '2024-03-22 20:40:43', NULL, NULL, 187, NULL, 0, 16.5, 'cod', '', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 18:30 - 18:40', 1.5, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '3d8e28caf901313a554cebc7d32e67e5', NULL, 0, 0, '000036', 0.00),
(844, '2024-03-22 20:28:05', '2024-03-22 20:40:41', NULL, 225, 187, NULL, 0, 74.3, 'cod', '', ' No oignon', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 19:30 - 19:40', 5.56, 0.00, NULL, NULL, '12121211', NULL, '', NULL, NULL, 'e97ee2054defb209c35fe4dc94599061', NULL, 0, 0, '000037', 3.00),
(845, '2024-03-22 20:31:03', '2024-03-22 20:40:40', NULL, 225, 187, NULL, 0, 60.1, 'cod', '', ' No oignons', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 19:10 - 19:20', 4.57, 0.00, NULL, NULL, '12112132121', NULL, '', NULL, NULL, 'b86e8d03fe992d1b0e19656875ee557c', NULL, 0, 0, '000038', 5.00),
(846, '2024-03-22 20:32:31', '2024-03-22 20:40:38', NULL, NULL, 187, NULL, 0, 40.8, 'cod', '', ' dqsdqsdqsd', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 18:50 - 19:00', 2.91, 0.00, NULL, NULL, '1545344545', NULL, '', NULL, NULL, '84f7e69969dea92a925508f7c1f9579a', NULL, 0, 0, '000039', 4.00),
(847, '2024-03-22 20:42:26', '2024-03-22 20:42:26', NULL, NULL, 187, NULL, 0, 73.3, 'cod', 'unpaid', ' No oignons please', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-22 18:50 - 19:00', 5.58, 0.00, NULL, NULL, '330649604949', NULL, '', NULL, NULL, 'f4552671f8909587cf485ea990207f3b', NULL, 0, 0, '000040', 3.50),
(848, '2024-03-26 19:11:31', '2024-03-26 19:11:31', NULL, 1, 187, NULL, 0, 13.200000000000001, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.2, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '362e80d4df43b03ae6d3f8540cd63626', NULL, 0, 0, '000041', 0.00),
(849, '2024-03-26 19:15:23', '2024-03-26 19:15:23', NULL, 1, 187, NULL, 0, 55.68000000000001, 'cod', 'unpaid', ' no cheese please', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 4.18, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'fe8c15fed5f808006ce95eddb7366e35', NULL, 0, 0, '000042', 4.00),
(850, '2024-03-26 19:18:03', '2024-03-26 19:18:03', NULL, 225, 187, NULL, 0, 63.84, 'cod', 'unpaid', ' No oignons Please !!!!', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-29 12:10 - 12:20', 4.67, 0.00, NULL, NULL, '1121231212', NULL, '', NULL, NULL, '1efa39bcaec6f3900149160693694536', NULL, 0, 0, '000043', 5.00),
(851, '2024-03-26 19:24:28', '2024-03-26 19:24:28', NULL, 1, 187, NULL, 0, 30.200000000000003, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 2.75, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '92fb0c6d1758261f10d052e6e2c1123c', NULL, 0, 0, '000044', 0.00),
(852, '2024-03-26 19:33:20', '2024-03-26 19:33:20', NULL, NULL, 187, NULL, 0, 16.700000000000003, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.52, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '22ac3c5a5bf0b520d281c122d1490650', NULL, 0, 0, '000045', 0.00),
(853, '2024-03-26 20:15:33', '2024-03-26 20:15:33', NULL, 1, 187, NULL, 0, 19.6, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.52, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'aff1621254f7c1be92f64550478c56e6', NULL, 0, 0, '000046', 0.00),
(854, '2024-03-26 20:46:03', '2024-03-26 20:46:03', NULL, NULL, 187, NULL, 0, 16.700000000000003, 'cod', 'paid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.52, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'f7e9050c92a851b0016442ab604b0488', NULL, 0, 0, '000047', 0.00),
(855, '2024-03-26 20:55:04', '2024-03-26 20:55:04', NULL, NULL, 187, NULL, 0, 82.16, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 6.33, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'addfa9b7e234254d26e9c7f2af1005cb', NULL, 0, 0, '000048', 5.00),
(856, '2024-03-26 21:05:38', '2024-03-26 21:05:38', NULL, NULL, 187, NULL, 0, 44.2, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 3.04, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '8c235f89a8143a28a1d6067e959dd858', NULL, 0, 0, '000049', 5.00),
(857, '2024-03-26 21:07:07', '2024-03-26 21:07:07', NULL, NULL, 187, NULL, 0, 32.2, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.95, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '847cc55b7032108eee6dd897f3bca8a5', NULL, 0, 0, '000050', 5.00),
(858, '2024-03-26 21:10:42', '2024-03-26 21:10:42', NULL, NULL, 187, NULL, 0, 24.6, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.52, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'a67f096809415ca1c9f112d96d27689b', NULL, 0, 0, '000051', 5.00),
(859, '2024-03-26 21:11:30', '2024-03-26 21:11:30', NULL, NULL, 187, NULL, 0, 19.6, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.52, 0.00, NULL, NULL, '120155501223', NULL, '', NULL, NULL, '2a084e55c87b1ebcdaad1f62fdbbac8e', NULL, 0, 0, '000052', 0.00),
(860, '2024-03-26 21:13:50', '2024-03-26 21:13:50', NULL, NULL, 187, NULL, 0, 15.200000000000001, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:40 - 11:50', 1.2, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'fc49306d97602c8ed1be1dfbf0835ead', NULL, 0, 0, '000053', 0.00),
(861, '2024-03-26 21:14:33', '2024-03-26 21:14:33', NULL, NULL, 187, NULL, 0, 19.6, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.52, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'f9a40a4780f5e1306c46f1c8daecee3b', NULL, 0, 0, '000054', 0.00),
(862, '2024-03-26 21:15:40', '2024-03-27 15:58:47', NULL, NULL, 187, NULL, 0, 17.6, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:30 - 11:40', 1.52, 0.00, 15, NULL, '12015550123', NULL, '', NULL, NULL, '5ec91aac30eae62f4140325d09b9afd0', NULL, 0, 0, '000055', 0.00),
(863, '2024-03-26 21:22:57', '2024-03-26 21:22:58', NULL, 225, 187, NULL, 0, 17.5, 'cod', 'unpaid', ' ttttttt', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-27 11:50 - 12:00', 1.05, 0.00, NULL, NULL, '1121312312', NULL, '', NULL, NULL, '19b650660b253761af189682e03501dd', NULL, 0, 0, '000056', 3.00),
(864, '2024-03-26 21:24:35', '2024-03-26 21:24:35', NULL, NULL, 187, NULL, 0, 15.100000000000001, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-26 18:30 - 18:40', 0.84, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '1fc214004c9481e4c8073e85323bfd4b', NULL, 0, 0, '000057', 5.00),
(865, '2024-03-26 21:36:17', '2024-03-26 21:36:17', NULL, NULL, 187, NULL, 0, 13.200000000000001, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-26 18:30 - 18:40', 1.2, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '3b3dbaf68507998acd6a5a5254ab2d76', NULL, 0, 0, '000058', 0.00),
(866, '2024-03-26 21:37:26', '2024-03-26 21:37:26', NULL, NULL, 187, NULL, 0, 15.700000000000001, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 0.00, 0, 0, 2, '2024-03-26 18:40 - 18:50', 0.97, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'ca8155f4d27f205953f9d3d7974bdd70', NULL, 0, 0, '000059', 5.00),
(867, '2024-03-27 14:28:34', '2024-03-27 14:28:34', NULL, 225, 187, NULL, 0, 14, 'stripelinks', 'unpaid', ' No Cheese', NULL, NULL, NULL, 1.80, 0.2475, 0.25, 2, '2024-03-27 11:40 - 11:50', 1.09, 0.00, NULL, NULL, '111213113131', NULL, 'https://app.emenusolutions.com/stripelinks/execute/867', NULL, NULL, 'ede7e2b6d13a41ddf9f4bdef84fdc737', NULL, 0, 0, '000060', 0.00),
(868, '2024-03-27 14:41:14', '2024-03-27 14:42:43', NULL, 225, 187, NULL, 0, 3.5, 'stripelinks', 'paid', ' no salt', NULL, NULL, NULL, 1.80, 0.0585, 0.25, 2, '2024-03-27 11:40 - 11:50', 0.32, 0.00, 5, NULL, '1121313212131', NULL, 'https://app.emenusolutions.com/stripelinks/execute/868', NULL, NULL, 'dd45045f8c68db9f54e70c67048d32e8', NULL, 0, 0, '000061', 0.00),
(869, '2024-03-27 15:31:36', '2024-03-27 15:31:36', NULL, 1, 187, NULL, 0, 20, 'stripelinks', 'unpaid', ' xccccccccccc', NULL, NULL, NULL, 1.80, 0.3555, 0.25, 2, '2024-03-28 11:30 - 11:40', 1.82, 0.00, NULL, NULL, '128741568741', NULL, 'https://app.emenusolutions.com/stripelinks/execute/869', NULL, NULL, '49c9adb18e44be0711a94e827042f630', NULL, 0, 0, '000062', 0.00),
(870, '2024-03-27 15:41:06', '2024-03-27 15:41:06', NULL, 1, 187, NULL, 0, 13.9, 'cod', 'unpaid', ' zsxczzzzzzzzzz', NULL, NULL, NULL, 1.80, 0.2457, 0.25, 2, '2024-03-29 12:10 - 12:20', 1.18, 0.00, NULL, NULL, '1478562178657', NULL, '', NULL, NULL, '22fb0cee7e1f3bde58293de743871417', NULL, 0, 0, '000063', 0.00),
(871, '2024-03-27 15:46:41', '2024-03-27 15:46:41', NULL, 1, 187, NULL, 0, 18.9, 'cod', 'paid', ' dddddddddddddddd', NULL, NULL, NULL, 1.80, 0.3357, 0.25, 2, '2024-03-29 11:30 - 11:40', 1.64, 0.00, NULL, NULL, '172157424563453', NULL, '', NULL, NULL, 'aeb3135b436aa55373822c010763dd54', NULL, 0, 0, '000064', 0.00),
(872, '2024-03-27 16:00:20', '2024-03-27 16:00:20', NULL, NULL, 187, NULL, 0, 18.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 1.80, 0.4185, 0.25, 2, '2024-03-27 11:30 - 11:40', 1.05, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '43feaeeecd7b2fe2ae2e26d917b6477d', NULL, 0, 0, '000065', 5.00),
(873, '2024-03-27 16:16:58', '2024-03-27 16:16:58', NULL, 225, 187, NULL, 0, 13, 'stripelinks', 'unpaid', ' ', NULL, NULL, NULL, 1.80, 0.2295, 0.25, 2, '2024-03-29 11:30 - 11:40', 1.18, 0.00, NULL, NULL, '10545405455', NULL, 'https://app.emenusolutions.com/stripelinks/execute/873', NULL, NULL, '98d6f58ab0dafbb86b083a001561bb34', NULL, 0, 0, '000066', 0.00),
(874, '2024-03-27 18:51:51', '2024-03-27 18:51:51', NULL, 1, 187, NULL, 0, 24.4, 'cod', 'unpaid', ' pas de fromage', NULL, NULL, NULL, 1.80, 0.4707, 0.25, 2, '2024-03-28 11:30 - 11:40', 1.85, 0.00, NULL, NULL, '15454545454', NULL, '', NULL, NULL, '51ef186e18dc00c2d31982567235c559', NULL, 0, 0, '000067', 2.00),
(875, '2024-03-27 20:04:32', '2024-03-27 20:04:32', NULL, NULL, 187, NULL, 0, 16.65, 'cod', 'unpaid', ' No oign', NULL, NULL, NULL, 1.80, 0.26514, 0.25, 2, '2024-03-28 11:30 - 11:40', 1.5, 0.00, NULL, NULL, '16765544557', NULL, '', NULL, NULL, '4b0a59ddf11c58e7446c9df0da541a84', 'LAMTR6ES', 1.67, 0, '000068', 0.00),
(876, '2024-03-28 05:20:39', '2024-03-28 05:21:59', NULL, 1, 187, NULL, 0, 32.8, 'cod', 'paid', ' ¨PAS  D OIGNON SVP', NULL, NULL, NULL, 1.80, 0.6219, 0.25, 2, '2024-03-29 11:50 - 12:00', 2.64, 0.00, 10, NULL, '1151515151', NULL, '', NULL, NULL, '67d16d00201083a2b118dd5128dd6f59', NULL, 0, 0, '000069', 2.00),
(877, '2024-03-28 14:20:17', '2024-03-28 14:20:51', NULL, 1, 64, NULL, 0, 12.2, 'cod', 'unpaid', ' No milk', NULL, NULL, NULL, 0.00, 0, 0, 3, '', 1.56, 0.00, 5, 299, NULL, NULL, '', NULL, NULL, '352407221afb776e3143e8a1a0577885', NULL, 0, 0, '000003', 2.00),
(878, '2024-03-28 18:18:43', '2024-03-28 18:18:43', NULL, NULL, 187, NULL, 0, 19.6, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 1.80, 0.3483, 0.25, 2, '2024-03-29 11:40 - 11:50', 1.52, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'dd8eb9f23fbd362da0e3f4e70b878c16', NULL, 0, 0, '000070', 0.00),
(879, '2024-03-28 18:22:06', '2024-03-28 18:22:06', NULL, NULL, 187, NULL, 0, 24.85, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 1.80, 0.41598, 0.25, 2, '2024-03-28 13:20 - 13:30', 2.07, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'd516b13671a4179d9b7b458a6ebdeb92', 'LAMTR6ES', 2.49, 0, '000071', 1.00),
(880, '2024-03-28 19:11:12', '2024-03-28 19:11:12', NULL, 1, 187, NULL, 0, 19.810000000000002, 'cod', 'unpaid', ' sdafsadffsad', NULL, NULL, NULL, 1.80, 0.33444, 0.25, 2, '2024-03-30 11:30 - 11:40', 1.52, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '1f50893f80d6830d62765ffad7721742', 'LAMTR6ES', 1.98, 0, '000072', 1.00),
(881, '2024-03-28 19:12:46', '2024-03-28 19:12:46', NULL, NULL, 187, NULL, 0, 19.810000000000002, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 1.80, 0.33444, 0.25, 2, '2024-03-30 11:30 - 11:40', 1.52, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '7504adad8bb96320eb3afdd4df6e1f60', 'LAMTR6ES', 1.98, 0, '000073', 1.00),
(882, '2024-03-28 19:38:45', '2024-03-28 19:38:45', NULL, 1, 187, NULL, 0, 6.4, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 1.80, 0.11718, 0.25, 2, '2024-03-29 11:30 - 11:40', 0.55, 0.00, NULL, NULL, '156456456456', NULL, '', NULL, NULL, '6c3cf77d52820cd0fe646d38bc2145ca', 'LAMTR6ES', 0.64, 0, '000074', 1.00),
(883, '2024-03-28 19:48:52', '2024-03-28 19:48:52', NULL, 1, 187, NULL, 0, 6.4, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 1.80, 0.11718, 0.25, 2, '2024-03-29 11:30 - 11:40', 0.55, 0.00, NULL, NULL, '142434345345', NULL, '', NULL, NULL, '210f760a89db30aa72ca258a3483cc7f', 'LAMTR6ES', 0.64, 0, '000075', 1.00),
(884, '2024-03-28 19:53:01', '2024-03-28 19:53:01', NULL, NULL, 187, NULL, 0, 6.4, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 1.80, 0.11718, 0.25, 2, '2024-03-30 11:30 - 11:40', 0.55, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '170c944978496731ba71f34c25826a34', 'LAMTR6ES', 0.64, 0, '000076', 1.00),
(885, '2024-03-28 20:01:13', '2024-03-28 20:01:13', NULL, NULL, 187, NULL, 0, 6, 'cod', 'unpaid', ' fdijhgui', NULL, NULL, NULL, 1.80, 0.1035, 0.25, 2, '2024-03-28 18:30 - 18:40', 0.55, 0.00, NULL, NULL, '1201555123', NULL, '', NULL, NULL, '0efe32849d230d7f53049ddc4a4b0c60', NULL, 0, 0, '000077', 0.00),
(886, '2024-03-29 18:47:38', '2024-03-29 18:47:38', NULL, 1, 187, NULL, 0, 3.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.170625, 0.25, 2, '2024-03-29 13:50 - 14:00', 0.32, 0.00, NULL, NULL, '1113153153', NULL, '', NULL, NULL, '704afe073992cbe4813cae2f7715336f', NULL, 0, 0, '000078', 0.00),
(887, '2024-03-29 18:50:41', '2024-03-29 18:51:54', NULL, 1, 187, NULL, 0, 3.5, 'stripelinks', 'paid', ' ', NULL, NULL, NULL, 5.25, 0.170625, 0.25, 2, '2024-03-29 14:20 - 14:30', 0.32, 0.00, NULL, NULL, '1231131313', NULL, 'https://app.emenusolutions.com/stripelinks/execute/887', NULL, NULL, '7ce3284b743aefde80ffd9aec500e085', NULL, 0, 0, '000079', 0.00),
(888, '2024-03-30 16:38:31', '2024-03-30 16:38:31', NULL, 1, 187, NULL, 0, 14.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.7245, 0.25, 2, '2024-03-30 11:40 - 11:50', 1.5, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '0a113ef6b61820daa5611c870ed8d5ee', 'LAMTR6ES', 1.45, 0, '000080', 1.00),
(889, '2024-03-30 16:43:09', '2024-03-30 16:43:09', NULL, 1, 187, NULL, 0, 14.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.7245, 0.25, 2, '2024-03-30 11:40 - 11:50', 1.5, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '07871915a8107172b3b5dc15a6574ad3', 'LAMTR6ES', 1.45, 0, '000081', 1.00),
(890, '2024-03-30 16:53:04', '2024-03-30 16:53:04', NULL, 1, 187, NULL, 0, 13, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.585375, 0.25, 2, '2024-03-30 11:50 - 12:00', 1.5, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '024d7f84fff11dd7e8d9c510137a2381', 'LAMTR6ES', 2.6, 0, '000082', 1.00),
(891, '2024-03-30 17:39:38', '2024-03-30 17:39:38', NULL, 1, 187, NULL, 0, 12, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.490875, 0.25, 2, '2024-03-30 12:40 - 12:50', 1.5, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'cfbce4c1d7c425baf21d6b6f2babe6be', 'LAMTR6ES', 2.4, 0, '000083', 0.00),
(892, '2024-03-30 17:55:11', '2024-03-30 17:55:11', NULL, 1, 187, NULL, 0, 12, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.490875, 0.25, 2, '2024-03-30 13:00 - 13:10', 1.5, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, 'c2aee86157b4a40b78132f1e71a9e6f1', 'LAMTR6ES', 2.4, 0, '000084', 0.00),
(893, '2024-03-30 17:55:18', '2024-03-30 17:55:18', NULL, 1, 187, NULL, 0, 31.880000000000003, 'cod', 'unpaid', ' No cheese', NULL, NULL, NULL, 5.25, 1.588125, 0.25, 2, '2024-03-30 13:10 - 13:20', 3.11, 0.00, NULL, NULL, '1546456456', NULL, '', NULL, NULL, 'd56b9fc4b0f1be8871f5e1c40c0067e7', 'LAMTR6ES', 6.38, 0, '000085', 5.00),
(894, '2024-03-30 18:10:45', '2024-03-30 18:10:45', NULL, 1, 187, NULL, 0, 21.4, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.110375, 0.25, 2, '2024-03-30 13:10 - 13:20', 1.82, 0.00, NULL, NULL, '134355566556', NULL, '', NULL, NULL, '4b0250793549726d5c1ea3906726ebfe', NULL, 0, 0, '000086', 0.00),
(895, '2024-03-30 19:27:16', '2024-03-30 19:28:09', NULL, 1, 187, NULL, 0, 15, 'stripelinks', 'paid', ' ', NULL, NULL, NULL, 5.25, 0.774375, 0.25, 2, '2024-03-30 18:30 - 18:40', 1.5, 0.00, NULL, NULL, '12015550123', NULL, 'https://app.emenusolutions.com/stripelinks/execute/895', NULL, NULL, '20aee3a5f4643755a79ee5f6a73050ac', NULL, 0, 0, '000087', 0.00),
(896, '2024-03-30 20:04:40', '2024-03-30 20:04:40', NULL, 1, 187, NULL, 0, 12, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.490875, 0.25, 2, '2024-03-30 19:10 - 19:20', 1.5, 0.00, NULL, NULL, '12015550123', NULL, '', NULL, NULL, '061412e4a03c02f9902576ec55ebbe77', 'LAMTR6ES', 2.4, 0, '000088', 0.00),
(897, '2024-03-31 00:28:41', '2024-03-31 00:28:42', NULL, 225, 187, NULL, 0, 24, 'cod', 'unpaid', ' no oignons', NULL, NULL, NULL, 5.25, 1.246875, 0.25, 3, '', 1.82, 0.00, NULL, 306, NULL, NULL, '', NULL, NULL, '5705e1164a8394aace6018e27d20d237', NULL, 0, 0, '000089', 0.00),
(898, '2024-03-31 00:29:21', '2024-03-31 00:29:21', NULL, 225, 187, NULL, 0, 22, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.141875, 0.25, 2, '2024-03-30 20:00 - 20:10', 1.82, 0.00, NULL, NULL, '115131132', NULL, '', NULL, NULL, 'a64c94baaf368e1840a1324e839230de', NULL, 0, 0, '000090', 0.00),
(899, '2024-03-31 15:53:26', '2024-03-31 15:53:26', NULL, 1, 187, NULL, 0, 22, 'cod', 'unpaid', ' ertefdgdfg', NULL, NULL, NULL, 5.25, 1.141875, 0.25, 2, '2024-04-01 11:50 - 12:00', 1.82, 0.00, NULL, NULL, '1345345345', NULL, '', NULL, NULL, '01882513d5fa7c329e940dda99b12147', NULL, 0, 0, '000091', 0.00),
(900, '2024-03-31 16:56:32', '2024-03-31 16:56:32', NULL, 1, 187, NULL, 0, 7.5, 'cod', 'unpaid', ' 5645', NULL, NULL, NULL, 5.25, 0.380625, 0.25, 2, '2024-03-31 19:00 - 19:10', 0.68, 0.00, NULL, NULL, '14564', NULL, '', NULL, NULL, 'acf4b89d3d503d8252c9c4ba75ddbf6d', NULL, 0, 0, '000092', 0.00),
(901, '2024-04-01 22:36:00', '2024-04-01 22:36:00', NULL, 1, 187, NULL, 0, 18.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.958125, 0.25, 2, '2024-04-02 11:40 - 11:50', 1.5, 0.00, NULL, NULL, '14243242452452', NULL, '', NULL, NULL, '892c91e0a653ba19df81a90f89d99bcd', NULL, 0, 0, '000093', 0.00),
(902, '2024-04-04 17:17:35', '2024-04-04 17:17:35', NULL, 1, 187, NULL, 10, 40.239999999999995, 'cod', 'unpaid', ' no spicy', NULL, NULL, NULL, 5.25, 1.67685, 0.25, 1, 'Select Day 12:50 - 13:00', 5.74, 0.00, NULL, NULL, '1343434343324', '5 jas nnklj lyon', '', NULL, NULL, 'b6a1085a27ab7bff7550f8a3bd017df8', 'LAMTR6ES', 8.05, 0, '000094', 0.00),
(903, '2024-04-04 17:29:58', '2024-04-07 20:12:17', NULL, 1, 187, NULL, 10, 41.44, 'cod', '', ' ', NULL, NULL, NULL, 5.25, 1.72725, 0.25, 1, 'Select Day 13:10 - 13:20', 3.64, 0.00, NULL, NULL, '100000000000', 'test lyon', '', NULL, NULL, 'aa169b49b583a2b5af89203c2b78c67c', 'LAMTR6ES', 8.29, 0, '000095', 0.00),
(904, '2024-04-06 17:55:04', '2024-04-07 20:12:15', NULL, 1, 187, NULL, 0, 16.5, 'cod', '', ' dfg', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 3, '', 1.65, 0.00, NULL, 306, NULL, NULL, '', NULL, NULL, 'f47d0ad31c4c49061b9e505593e3db98', NULL, 0, 0, '000096', 0.00),
(905, '2024-04-06 18:08:48', '2024-04-07 20:12:11', NULL, 1, 187, NULL, 5, 21.5, 'cod', '', ' ', NULL, NULL, NULL, 5.25, 1.115625, 0.25, 1, '2024-04-18 11:30 - 11:40', 1.65, 0.00, NULL, NULL, '15675675677', 'Khulna', '', NULL, NULL, 'f57a2f557b098c43f11ab969efe1504b', NULL, 0, 0, '000097', 0.00),
(906, '2024-04-07 19:58:00', '2024-04-07 20:12:12', NULL, 225, 187, NULL, 0, 24.919999999999998, 'cod', '', ' no cheese', NULL, NULL, NULL, 5.25, 1.296225, 0.25, 3, '', 2, 0.00, NULL, 306, NULL, NULL, '', NULL, NULL, 'c8fbbc86abe8bd6a5eb6a3b4d0411301', 'LAMTR6ES', 4.98, 0, '000098', 5.00),
(907, '2024-04-07 20:00:01', '2024-04-07 20:12:09', NULL, NULL, 187, NULL, 0, 24.919999999999998, 'cod', '', ' no cheese', NULL, NULL, NULL, 5.25, 1.296225, 0.25, 3, '', 2, 0.00, NULL, 306, NULL, NULL, '', NULL, NULL, '621461af90cadfdaf0e8d4cc25129f91', 'LAMTR6ES', 4.98, 0, '000099', 5.00),
(908, '2024-04-07 20:00:11', '2024-04-07 20:12:06', NULL, NULL, 187, NULL, 0, 24.919999999999998, 'cod', '', ' no cheese', NULL, NULL, NULL, 5.25, 1.296225, 0.25, 3, '', 2, 0.00, NULL, 306, NULL, NULL, '', NULL, NULL, '8b6dd7db9af49e67306feb59a8bdc52c', 'LAMTR6ES', 4.98, 0, '000100', 5.00),
(909, '2024-04-07 20:01:11', '2024-04-07 20:12:04', NULL, 225, 187, NULL, 0, 17.2, 'cod', '', ' no', NULL, NULL, NULL, 5.25, 0.919275, 0.25, 3, '', 1.65, 0.00, NULL, 306, NULL, NULL, '', NULL, NULL, 'a4300b002bcfb71f291dac175d52df94', 'LAMTR6ES', 3.44, 0, '000101', 4.00),
(910, '2024-04-07 20:02:10', '2024-04-07 20:12:02', NULL, 225, 187, NULL, 0, 15.2, 'stripelinks', '', ' fsdfsdfds', NULL, NULL, NULL, 5.25, 0.730275, 0.25, 2, '2024-04-07 18:50 - 19:00', 1.65, 0.00, NULL, NULL, '154545454', NULL, 'https://app.emenusolutions.com/stripelinks/execute/910', NULL, NULL, 'e205ee2a5de471a70c1fd1b46033a75f', 'LAMTR6ES', 3.04, 0, '000102', 2.00),
(911, '2024-04-07 20:05:25', '2024-04-07 20:12:00', NULL, NULL, 187, NULL, 0, 16.5, 'stripelinks', '', ' ', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 2, '2024-04-07 19:00 - 19:10', 1.65, 0.00, NULL, NULL, '15656455656', NULL, 'https://app.emenusolutions.com/stripelinks/execute/911', NULL, NULL, 'b56a18e0eacdf51aa2a5306b0f533204', NULL, 0, 0, '000103', 0.00),
(912, '2024-04-07 20:06:42', '2024-04-07 20:11:58', NULL, NULL, 187, NULL, 0, 24.9, 'stripelinks', '', ' No', NULL, NULL, NULL, 5.25, 1.294125, 0.25, 2, '2024-04-07 19:10 - 19:20', 2, 0.00, NULL, NULL, '15745656666', NULL, 'https://app.emenusolutions.com/stripelinks/execute/912', NULL, NULL, '2a9d121cd9c3a1832bb6d2cc6bd7a8a7', NULL, 0, 0, '000104', 0.00),
(913, '2024-04-08 13:30:47', '2024-04-08 13:30:47', NULL, 1, 187, NULL, 0, 51.64, 'cod', 'unpaid', ' dfgdg', NULL, NULL, NULL, 5.25, 2.41815, 0.25, 3, '', 4.96, 0.00, NULL, 306, NULL, NULL, '', NULL, NULL, '8b5040a8a5baf3e0e67386c2e3a9b903', 'LAMTR6ES', 10.33, 0, '000105', 5.00),
(914, '2024-04-08 13:33:47', '2024-04-08 13:33:47', NULL, 1, 187, NULL, 0, 59.95999999999999, 'cod', 'unpaid', ' asdasdas', NULL, NULL, NULL, 5.25, 2.7678, 0.25, 3, '', 5.8, 0.00, NULL, 306, NULL, NULL, '', NULL, NULL, '7634ea65a4e6d9041cfd3f7de18e334a', 'LAMTR6ES', 11.99, 0, '000106', 5.00),
(915, '2024-04-08 13:44:36', '2024-04-08 13:44:36', NULL, 1, 187, NULL, 0, 62.279999999999994, 'cod', 'unpaid', ' sdfsdf', NULL, NULL, NULL, 5.25, 2.864925, 0.25, 3, '', 6.78, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '24896ee4c6526356cc127852413ea3b4', 'LAMTR6ES', 12.46, 0, '000107', 5.00),
(916, '2024-04-08 13:44:36', '2024-04-08 13:44:36', NULL, 1, 187, NULL, 0, 62.279999999999994, 'cod', 'unpaid', ' sdfsdf', NULL, NULL, NULL, 5.25, 2.864925, 0.25, 3, '', 6.78, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '23ce1851341ec1fa9e0c259de10bf87c', 'LAMTR6ES', 12.46, 0, '000108', 5.00),
(917, '2024-04-09 00:51:58', '2024-04-09 00:52:38', NULL, 225, 187, NULL, 0, 17.2, 'cod', '', ' fsdfsdf', NULL, NULL, NULL, 5.25, 0.919275, 0.25, 3, '', 1.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'da0d1111d2dc5d489242e60ebcbaf988', 'LAMTR6ES', 3.44, 0, '000109', 4.00),
(918, '2024-04-09 01:00:08', '2024-04-09 01:00:08', NULL, NULL, 187, NULL, 0, 18.2, 'cod', 'unpaid', ' gdfgdf', NULL, NULL, NULL, 5.25, 1.013775, 0.25, 3, '', 1.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '1e056d2b0ebd5c878c550da6ac5d3724', 'LAMTR6ES', 3.64, 0, '000110', 5.00),
(919, '2024-04-09 01:00:20', '2024-04-09 01:00:20', NULL, NULL, 187, NULL, 0, 18.2, 'cod', 'unpaid', ' gdfgdf', NULL, NULL, NULL, 5.25, 1.013775, 0.25, 3, '', 1.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '3e89ebdb49f712c7d90d1b39e348bbbf', 'LAMTR6ES', 3.64, 0, '000111', 5.00),
(920, '2024-04-09 01:00:21', '2024-04-09 01:00:21', NULL, NULL, 187, NULL, 0, 18.2, 'cod', 'unpaid', ' gdfgdf', NULL, NULL, NULL, 5.25, 1.013775, 0.25, 3, '', 1.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '6d0f846348a856321729a2f36734d1a7', 'LAMTR6ES', 3.64, 0, '000112', 5.00),
(921, '2024-04-09 01:05:32', '2024-04-09 01:05:32', NULL, NULL, 187, NULL, 0, 24.919999999999998, 'cod', 'unpaid', ' gfdfgdf', NULL, NULL, NULL, 5.25, 1.296225, 0.25, 3, '', 2, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '430c3626b879b4005d41b8a46172e0c0', 'LAMTR6ES', 4.98, 0, '000113', 5.00),
(922, '2024-04-09 01:16:36', '2024-04-09 01:16:36', NULL, NULL, 187, NULL, 5, 20.2, 'stripelinks', 'unpaid', ' no no no cheese', NULL, NULL, NULL, 5.25, 0.940275, 0.25, 1, '2024-04-08 20:30 - 20:40', 1.65, 0.00, NULL, NULL, '11221212121', '1211 rue des mers', 'https://app.emenusolutions.com/stripelinks/execute/922', NULL, NULL, 'ccc0aa1b81bf81e16c676ddb977c5881', 'LAMTR6ES', 4.04, 0, '000114', 2.00),
(923, '2024-04-09 01:27:51', '2024-04-09 01:27:51', NULL, NULL, 187, NULL, 5, 34.2, 'cod', 'unpaid', ' no cheese', NULL, NULL, NULL, 5.25, 1.948275, 0.25, 1, '2024-04-08 21:00 - 21:10', 2.4, 0.00, NULL, NULL, '1121231231', '10 rue patrick', '', NULL, NULL, 'c4015b7f368e6b4871809f49debe0579', 'LAMTR6ES', 6.84, 0, '000115', 10.00),
(924, '2024-04-09 02:00:12', '2024-04-09 02:00:13', NULL, NULL, 187, NULL, 0, 117.43999999999998, 'stripelinks', 'unpaid', ' hhvhjvhv', NULL, NULL, NULL, 5.25, 5.96925, 0.25, 2, '2024-04-08 21:20 - 21:30', 11.09, 0.00, NULL, NULL, '112312123123', NULL, 'https://app.emenusolutions.com/stripelinks/execute/924', NULL, NULL, 'bea5955b308361a1b07bc55042e25e54', 'LAMTR6ES', 23.49, 0, '000116', 20.00),
(925, '2024-04-09 13:32:25', '2024-04-09 13:32:25', NULL, NULL, 187, NULL, 5, 35.2, 'cod', 'unpaid', ' Comment test', NULL, NULL, NULL, 5.25, 1.897875, 0.25, 1, 'Select Day 11:40 - 11:50', 3.52, 0.00, NULL, NULL, '1154545454', '14 rue Patrick', '', NULL, NULL, '7fa732b517cbed14a48843d74526c11a', 'LAMTR6ES', 8.8, 0, '000117', 10.00),
(926, '2024-04-09 14:15:05', '2024-04-09 14:45:57', NULL, NULL, 187, NULL, 0, 38.8, 'cod', 'unpaid', ' No', NULL, NULL, NULL, 5.25, 2.039625, 0.25, 3, '', 3.88, 0.00, 5, 307, NULL, NULL, '', NULL, NULL, 'cbb6a3b884f4f88b3a8e3d44c636cbd8', 'LAMTR6ES', 9.7, 0, '000118', 10.00),
(927, '2024-04-11 17:50:11', '2024-04-11 17:50:11', NULL, NULL, 187, NULL, 0, 20, 'cod', 'unpaid', ' Hugh', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 2, '2024-04-18 11:50 - 12:00', 2, 0.00, NULL, NULL, '166666634', NULL, '', NULL, NULL, '1f4477bad7af3616c1f933a02bfabe4e', NULL, 0, 0, '000119', 0.00),
(928, '2024-04-11 18:43:43', '2024-04-11 18:43:43', NULL, 1, 187, NULL, 0, 11, 'cod', 'unpaid', ' fdfsdfsdf', NULL, NULL, NULL, 5.25, 0.564375, 0.25, 3, '', 1.1, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'd045c59a90d7587d8d671b5f5aec4e7c', NULL, 0, 0, '000120', 0.00),
(929, '2024-04-11 18:46:46', '2024-04-11 18:46:46', NULL, 1, 187, NULL, 0, 2.9, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.139125, 0.25, 3, '', 0.29, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '0d0871f0806eae32d30983b62252da50', NULL, 0, 0, '000121', 0.00),
(930, '2024-04-12 16:10:33', '2024-04-12 16:10:33', NULL, NULL, 187, NULL, 0, 7.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.380625, 0.25, 3, '', 0.75, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '1cc3633c579a90cfdd895e64021e2163', NULL, 0, 0, '000122', 0.00),
(931, '2024-04-12 16:12:08', '2024-04-12 16:12:08', NULL, 1, 187, NULL, 0, 4.9, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.244125, 0.25, 3, '', 0.49, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '9f53d83ec0691550f7d2507d57f4f5a2', NULL, 0, 0, '000123', 0.00),
(932, '2024-04-16 13:23:27', '2024-04-16 13:23:27', NULL, 1, 187, NULL, 0, 16.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 2, '2024-04-17 11:40 - 11:50', 1.65, 0.00, NULL, NULL, '11212111111', NULL, '', NULL, NULL, 'd2ed45a52bc0edfa11c2064e9edee8bf', NULL, 0, 0, '000124', 0.00),
(933, '2024-04-16 15:38:23', '2024-04-16 15:38:23', NULL, 1, 187, NULL, 0, 16.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 3, '', 1.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '043c3d7e489c69b48737cc0c92d0f3a2', NULL, 0, 0, '000125', 0.00),
(934, '2024-04-16 15:54:23', '2024-04-16 15:54:23', NULL, 1, 187, NULL, 0, 23.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.220625, 0.25, 2, '2024-04-17 11:30 - 11:40', 2.35, 0.00, NULL, NULL, '1567547567', NULL, '', NULL, NULL, '4daa3db355ef2b0e64b472968cb70f0d', NULL, 0, 0, '000126', 0.00),
(935, '2024-04-16 16:47:31', '2024-04-16 16:48:59', NULL, 1, 187, NULL, 0, 16, 'cod', 'paid', ' fsfhksdh', NULL, NULL, NULL, 5.25, 0.721875, 0.25, 2, '2024-04-16 12:20 - 12:30', 1.6, 0.00, 10, NULL, '1121221212112', NULL, '', NULL, NULL, 'e820a45f1dfc7b95282d10b6087e11c0', 'LAMTR6ES', 4, 0, '000127', 2.00),
(936, '2024-04-16 20:10:14', '2024-04-16 20:10:14', NULL, 1, 187, NULL, 0, 16.5, 'cod', 'unpaid', ' fsdf', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 3, '', 1.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '90794e3b050f815354e3e29e977a88ab', NULL, 0, 0, '000128', 0.00),
(937, '2024-04-17 16:21:06', '2024-04-17 16:21:06', NULL, 1, 187, NULL, 0, 31.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.640625, 0.25, 3, '', 3.15, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'b7892fb3c2f009c65f686f6355c895b5', NULL, 0, 0, '000129', 0.00),
(938, '2024-04-17 16:31:43', '2024-04-17 16:31:43', NULL, 1, 187, NULL, 0, 49.8, 'cod', 'unpaid', ' fdsf', NULL, NULL, NULL, 5.25, 2.601375, 0.25, 3, '', 4.98, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '74bba22728b6185eec06286af6bec36d', NULL, 0, 0, '000130', 0.00),
(939, '2024-04-17 16:37:26', '2024-04-17 16:37:26', NULL, 1, 187, NULL, 0, 20, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 3, '', 2, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '3df1d4b96d8976ff5986393e8767f5b2', NULL, 0, 0, '000131', 0.00),
(940, '2024-04-17 16:46:02', '2024-04-17 16:46:02', NULL, 1, 187, NULL, 0, 45.44, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 2.301075, 0.25, 3, '', 4.544, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '8d6dc35e506fc23349dd10ee68dabb64', 'LAMTR6ES', 11.36, 0, '000132', 10.00),
(941, '2024-04-17 16:51:00', '2024-04-17 17:21:19', NULL, 1, 187, NULL, 5, 49.44, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 2.983575, 0.25, 1, '2024-04-17 11:50 - 12:00', 4.944, 0.00, 5, NULL, '1201550123', 'Paris', '', NULL, NULL, '92262bf907af914b95a0fc33c3f33bf6', 'LAMTR6ES', 12.36, 0, '000133', 20.00),
(942, '2024-04-17 19:55:31', '2024-04-17 19:55:32', NULL, 1, 187, NULL, 0, 19.4, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.005375, 0.25, 3, '', 1.94, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'b55ec28c52d5f6205684a473a2193564', NULL, 0, 0, '000134', 0.00),
(943, '2024-04-18 14:26:16', '2024-04-18 14:26:16', NULL, 1, 187, NULL, 5, 16.5, 'stripelinks', 'unpaid', ' DSQD', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 1, '2024-04-18 12:00 - 12:10', 2.15, 0.00, NULL, NULL, '11211212112', '12111', 'https://app.emenusolutions.com/stripelinks/execute/943', NULL, NULL, '2f885d0fbe2e131bfc9d98363e55d1d4', NULL, 0, 0, '000135', 0.00),
(944, '2024-04-18 14:28:37', '2024-04-18 14:28:37', NULL, 1, 187, NULL, 5, 16.5, 'stripelinks', 'unpaid', ' DFDSF', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 1, '2024-04-19 11:50 - 12:00', 2.185, 0.00, NULL, NULL, '11132121233', '104SDQSD', 'https://app.emenusolutions.com/stripelinks/execute/944', NULL, NULL, '64223ccf70bbb65a3a4aceac37e21016', NULL, 0, 0, '000136', 0.00),
(945, '2024-04-18 14:39:03', '2024-04-18 14:39:03', NULL, 1, 187, NULL, 5, 16.5, 'stripelinks', 'unpaid', ' SDFSDF', NULL, NULL, NULL, 5.25, 1.378125, 0.25, 1, '2024-04-18 12:00 - 12:10', 2.185, 0.00, NULL, NULL, '1112121321', '71 QUAI JOSEPH MARIE', 'https://app.emenusolutions.com/stripelinks/execute/945', NULL, NULL, '4b6538a44a1dfdc2b83477cd76dee98e', NULL, 0, 0, '000137', 10.00),
(946, '2024-04-18 14:41:42', '2024-04-18 14:41:42', NULL, 1, 187, NULL, 10, 16.5, 'cod', 'unpaid', ' QSDSQD', NULL, NULL, NULL, 5.25, 1.378125, 0.25, 1, 'Select Day 11:50 - 12:00', 2.72, 0.00, NULL, NULL, '1121121212', 'DSQDQSDQSD', '', NULL, NULL, 'c8c41c4a18675a74e01c8a20e8a0f662', NULL, 0, 0, '000138', 10.00),
(947, '2024-04-18 16:04:31', '2024-04-18 19:16:23', NULL, 1, 187, NULL, 0, 16.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 3, '', 1.65, 0.00, 10, 307, NULL, NULL, '', NULL, NULL, 'c4b31ce7d95c75ca70d50c19aef08bf1', NULL, 0, 0, '000139', 0.00),
(948, '2024-04-18 16:23:36', '2024-04-18 19:16:19', NULL, NULL, 187, NULL, 0, 13.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.695625, 0.25, 3, '', 1.35, 0.00, 5, 307, NULL, NULL, '', NULL, NULL, '58e4d44e550d0f7ee0a23d6b02d9b0db', NULL, 0, 0, '000140', 0.00),
(949, '2024-04-18 16:30:45', '2024-04-18 16:32:59', NULL, NULL, 187, NULL, 0, 20.4, 'cod', 'paid', ' ', NULL, NULL, NULL, 5.25, 1.057875, 0.25, 3, '', 2.04, 0.00, 5, 307, NULL, NULL, '', NULL, NULL, '3cef96dcc9b8035d23f69e30bb19218a', NULL, 0, 0, '000141', 0.00),
(950, '2024-04-18 16:06:59', '2024-04-18 16:06:59', NULL, 1, 187, NULL, 0, 33, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.719375, 0.25, 3, '', 3.3, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'a3d68b461bd9d3533ee1dd3ce4628ed4', NULL, 0, 0, '000142', 0.00),
(951, '2024-04-19 05:25:53', '2024-04-19 05:25:53', NULL, 1, 187, NULL, 0, 99, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 5.184375, 0.25, 3, '', 9.9, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '1c1d4df596d01da60385f0bb17a4a9e0', NULL, 0, 0, '000143', 0.00),
(952, '2024-04-21 06:07:01', '2024-04-21 06:07:01', NULL, 1, 187, NULL, 0, 20, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 3, '', 2, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'e6cb2a3c14431b55aa50c06529eaa21b', NULL, 0, 0, '000144', 0.00),
(953, '2024-04-21 06:23:33', '2024-04-21 06:23:33', NULL, 1, 187, NULL, 0, 20, 'stripelinks', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 2, '2024-04-26 11:30 - 11:40', 2, 0.00, NULL, NULL, '1456456456456', NULL, 'http://127.0.0.1:8000/stripelinks/execute/953', NULL, NULL, '9232fe81225bcaef853ae32870a2b0fe', NULL, 0, 0, '000145', 0.00),
(954, '2024-04-21 06:27:11', '2024-04-21 06:27:11', NULL, 1, 187, NULL, 0, 20, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 3, '', 2, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '6395ebd0f4b478145ecfbaf939454fa4', NULL, 0, 0, '000146', 0.00),
(955, '2024-04-21 06:42:50', '2024-04-21 06:42:50', NULL, 1, 187, NULL, 0, 40, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 2.086875, 0.25, 3, '', 4, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'ef4e3b775c934dada217712d76f3d51f', NULL, 0, 0, '000147', 0.00),
(956, '2024-04-21 06:45:18', '2024-04-21 06:45:18', NULL, 1, 187, NULL, 0, 20, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 3, '', 2, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '168908dd3227b8358eababa07fcaf091', NULL, 0, 0, '000148', 0.00),
(957, '2024-04-21 11:25:03', '2024-04-21 11:25:03', NULL, 1, 187, NULL, 0, 20, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 3, '', 2, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '2ba596643cbbbc20318224181fa46b28', NULL, 0, 0, '000149', 0.00),
(958, '2024-04-21 11:28:40', '2024-04-21 11:28:40', NULL, 1, 187, NULL, 0, 20, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 3, '', 2, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'd240e3d38a8882ecad8633c8f9c78c9b', NULL, 0, 0, '000150', 0.00),
(959, '2024-04-21 12:08:51', '2024-04-21 12:08:51', NULL, 1, 187, NULL, 0, 24, 'stripelinks', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.246875, 0.25, 3, '', 2.4, 0.00, NULL, 307, NULL, NULL, 'http://127.0.0.1:8000/stripelinks/execute/959', NULL, NULL, '0f840be9b8db4d3fbd5ba2ce59211f55', NULL, 0, 0, '000151', 0.00),
(960, '2024-04-21 12:10:48', '2024-04-21 12:10:49', NULL, 1, 187, NULL, 0, 24.9, 'stripelinks', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.294125, 0.25, 3, '', 2.49, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '437d7d1d97917cd627a34a6a0fb41136', NULL, 0, 0, '000152', 0.00),
(961, '2024-04-23 10:11:41', '2024-04-23 10:11:41', NULL, 1, 187, NULL, 0, 69.8, 'stripelinks', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 3.651375, 0.25, 3, '', 6.98, 0.00, NULL, 307, NULL, NULL, 'http://127.0.0.1:8000/stripelinks/execute/961', NULL, NULL, 'd707329bece455a462b58ce00d1194c9', NULL, 0, 0, '000153', 0.00),
(962, '2024-04-24 03:29:17', '2024-04-24 03:29:17', NULL, 1, 187, NULL, 0, 22, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.141875, 0.25, 3, '', 2.2, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '5c936263f3428a40227908d5a3847c0b', NULL, 0, 0, '000154', 0.00),
(963, '2024-04-24 03:30:09', '2024-04-24 03:30:09', NULL, 1, 187, NULL, 0, 22, 'stripelinks', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.141875, 0.25, 3, '', 2.2, 0.00, NULL, 307, NULL, NULL, 'http://127.0.0.1:8000/stripelinks/execute/963', NULL, NULL, '1ce927f875864094e3906a4a0b5ece68', NULL, 0, 0, '000155', 0.00),
(964, '2024-04-24 04:01:35', '2024-04-24 04:01:35', NULL, 1, 187, NULL, 0, 20, 'stripelinks', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.036875, 0.25, 3, '', 2, 0.00, NULL, 307, NULL, NULL, 'http://127.0.0.1:8000/stripelinks/execute/964', NULL, NULL, '8065d07da4a77621450aa84fee5656d9', NULL, 0, 0, '000156', 0.00),
(965, '2024-04-24 10:09:06', '2024-04-24 10:09:06', NULL, 1, 187, NULL, 0, 0, 'cod', 'unpaid', '', NULL, NULL, NULL, 0.00, 0, 0, 3, '', 0, 0.00, NULL, NULL, NULL, NULL, '', NULL, NULL, 'eeb69a3cb92300456b6a5f4162093851', NULL, 0, 0, '000157', 0.00),
(966, '2024-04-24 10:15:12', '2024-04-24 10:15:12', NULL, 1, 187, NULL, 0, 0, 'cod', 'unpaid', '', NULL, NULL, NULL, 0.00, 0, 0, 3, '', 0, 0.00, NULL, NULL, NULL, NULL, '', NULL, NULL, '4e0cb6fb5fb446d1c92ede2ed8780188', NULL, 0, 0, '000158', 0.00),
(967, '2024-04-24 10:15:29', '2024-04-24 10:15:29', NULL, 1, 187, NULL, 0, 6.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.328125, 0.25, 3, '', 0.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '6cfe0e6127fa25df2a0ef2ae1067d915', NULL, 0, 0, '000159', 0.00),
(968, '2024-04-24 10:20:23', '2024-04-24 10:20:23', NULL, 1, 187, NULL, 0, 6.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.328125, 0.25, 3, '', 0.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '8f468c873a32bb0619eaeb2050ba45d1', NULL, 0, 0, '000160', 0.00),
(969, '2024-04-24 10:37:05', '2024-04-24 10:37:06', NULL, 1, 187, NULL, 0, 6.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.328125, 0.25, 3, '', 0.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'e744f91c29ec99f0e662c9177946c627', NULL, 0, 0, '000161', 0.00),
(970, '2024-04-24 10:39:54', '2024-04-24 10:39:55', NULL, 1, 187, NULL, 0, 6.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.328125, 0.25, 3, '', 0.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '89fcd07f20b6785b92134bd6c1d0fa42', NULL, 0, 0, '000162', 0.00),
(971, '2024-04-24 10:40:49', '2024-04-24 10:40:49', NULL, 1, 187, NULL, 0, 6.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.328125, 0.25, 3, '', 0.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '6602294be910b1e3c4571bd98c4d5484', NULL, 0, 0, '000163', 0.00);
INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`, `payment_link`, `employee_id`, `deleted_at`, `md`, `coupon`, `discount`, `kds_finished`, `id_per_vendor`, `tip`) VALUES
(972, '2024-04-25 04:11:28', '2024-04-25 04:11:28', NULL, 1, 187, NULL, 0, 14, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.721875, 0.25, 3, '', 1.4, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'c22abfa379f38b5b0411bc11fa9bf92f', NULL, 0, 0, '000164', 0.00),
(973, '2024-04-25 04:12:27', '2024-04-25 04:12:27', NULL, 1, 187, NULL, 0, 16.5, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 0.853125, 0.25, 3, '', 1.65, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, 'ca75910166da03ff9d4655a0338e6b09', NULL, 0, 0, '000165', 0.00),
(974, '2024-04-29 07:08:27', '2024-04-29 07:08:27', NULL, 1, 187, NULL, 0, 33.12, 'cod', 'unpaid', ' ', NULL, NULL, NULL, 5.25, 1.290975, 0.25, 3, '', 3.312, 0.00, NULL, 307, NULL, NULL, '', NULL, NULL, '4311359ed4969e8401880e3c1836fbe1', 'LAMTR6ES', 8.28, 0, '000166', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_has_items`
--

CREATE TABLE `order_has_items` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `extras` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `vat` double(8,2) DEFAULT '0.00',
  `vatvalue` double(8,2) DEFAULT '0.00',
  `variant_price` double DEFAULT NULL,
  `variant_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `kds_finished` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_has_items`
--

INSERT INTO `order_has_items` (`id`, `created_at`, `updated_at`, `order_id`, `item_id`, `qty`, `extras`, `vat`, `vatvalue`, `variant_price`, `variant_name`, `kds_finished`) VALUES
(282, NULL, NULL, 742, 424, 1, '[]', 0.00, 0.00, 8.49, '', 0),
(283, NULL, NULL, 742, 428, 1, '[]', 0.00, 0.00, 16.49, '', 0),
(284, NULL, NULL, 742, 427, 1, '[]', 0.00, 0.00, 18.99, '', 0),
(347, NULL, NULL, 786, 499, 1, '[]', 18.00, 1.83, 12, '', 0),
(372, NULL, NULL, 807, 527, 1, '[]', 10.00, 1.05, 11.5, 'poulet-tikka, nature, poulet, coca-cola-33cl', 0),
(373, NULL, NULL, 808, 533, 1, '[]', 10.00, 0.54, 5.9, 'boeuf', 0),
(374, NULL, NULL, 809, 529, 1, '[]', 10.00, 0.45, 4.9, 'poulet', 0),
(375, NULL, NULL, 810, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(376, NULL, NULL, 811, 549, 1, '[]', 10.00, 0.26, 2.9, 'soda-indien-+0.4€', 0),
(377, NULL, NULL, 812, 549, 1, '[]', 10.00, 0.26, 2.9, 'soda-indien-+0.4€', 0),
(378, NULL, NULL, 813, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'butter, agneau-+2€, nature, lassi-mangue-33cl-+2€, non', 0),
(379, NULL, NULL, 814, 528, 1, '[]', 10.00, 1.32, 14.5, 'dal-lentilles-corails, nature, coca-cola-33cl, oui', 0),
(380, NULL, NULL, 814, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'biryani, poulet, ail-+0.90€, ice-tea-33-cl, oui', 0),
(381, NULL, NULL, 815, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'biryani, crevette-+2€, nature, lassi-mangue-33cl-+2€, oui', 0),
(382, NULL, NULL, 816, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, crevette-+2€, nature, eau-gazeuse-50cl, oui', 0),
(383, NULL, NULL, 817, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'biryani, crevette-+2€, ail-+0.90€, lassi-mangue-33cl-+2€, oui', 0),
(384, NULL, NULL, 818, 527, 1, '[]', 10.00, 1.05, 11.5, 'poulet-tikka, nature, poulet, coca-cola-33cl', 0),
(385, NULL, NULL, 819, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'biryani, agneau-+2€, piment-+0.90€, lassi-nature-33cl-+2€, oui', 0),
(386, NULL, NULL, 819, 535, 1, '[]', 10.00, 0.68, 7.5, 'ail-+0.90€', 0),
(387, NULL, NULL, 819, 549, 1, '[]', 10.00, 0.26, 2.9, 'soda-indien-+0.4€', 0),
(388, NULL, NULL, 819, 552, 2, '[]', 10.00, 0.64, 3.5, '', 0),
(389, NULL, NULL, 820, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'biryani, crevette-+2€, ail-+0.90€, lassi-mangue-33cl-+2€, oui', 0),
(390, NULL, NULL, 821, 527, 1, '[]', 10.00, 1.05, 11.5, 'poivrons-massala, nature, poulet, eau-gazeuse-50cl', 0),
(391, NULL, NULL, 822, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(392, NULL, NULL, 823, 533, 1, '[]', 10.00, 0.54, 5.9, 'boeuf', 0),
(393, NULL, NULL, 824, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(394, NULL, NULL, 825, 549, 1, '[]', 10.00, 0.26, 2.9, 'coca-zéro', 0),
(395, NULL, NULL, 826, 529, 1, '[]', 10.00, 0.45, 4.9, 'poulet', 0),
(396, NULL, NULL, 827, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'biryani, crevette-+2€, ail-+0.90€, lassi-nature-33cl-+2€, oui', 0),
(397, NULL, NULL, 827, 535, 1, '[]', 10.00, 0.68, 7.5, 'piment-+0.90€', 0),
(398, NULL, NULL, 827, 531, 1, '[]', 10.00, 0.45, 4.9, 'piment', 0),
(399, NULL, NULL, 827, 551, 2, '[]', 10.00, 0.64, 3.5, '', 0),
(400, NULL, NULL, 828, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(401, NULL, NULL, 829, 549, 1, '[]', 10.00, 0.26, 2.9, 'eau-gazeuse', 0),
(402, NULL, NULL, 830, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'biryani, poulet, ail-+0.90€, lassi-nature-33cl-+2€, oui', 0),
(403, NULL, NULL, 831, 550, 1, '[]', 10.00, 0.45, 4.9, 'rose', 0),
(404, NULL, NULL, 832, 549, 1, '[]', 10.00, 0.26, 2.9, 'coca-cola', 0),
(405, NULL, NULL, 833, 529, 1, '[]', 10.00, 0.45, 4.9, 'poulet', 0),
(406, NULL, NULL, 834, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'butter, crevette-+2€, ail-+0.90€, lassi-rose-33cl-+2€, oui', 0),
(407, NULL, NULL, 835, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'biryani, crevette-+2€, cheese-naan-+0.90€, lassi-mangue-33cl-+2€, non', 0),
(408, NULL, NULL, 836, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'dewalls, crevette-+2€, ail-+0.90€, lassi-mangue-33cl-+2€, oui', 0),
(409, NULL, NULL, 837, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'dewalls, poulet, ail-+0.90€, lassi-mangue-33cl-+2€, oui', 0),
(410, NULL, NULL, 838, 453, 1, '[]', 18.00, 1.14, 7.49, '', 0),
(411, NULL, NULL, 839, 407, 1, '[\"Truffle Parmesan + $2.99\",\"Sweet Heat Glaze + $1.99\"]', 18.00, 1.52, 9.98, '', 0),
(412, NULL, NULL, 840, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'butter, poulet, nature, lassi-rose-33cl-+2€, oui', 0),
(413, NULL, NULL, 841, 526, 1, '[]', 10.00, 1.50, 16.5, 'butter, crevette-+2€, ail-+0.90€, lassi-mangue-33cl-+2€, non', 0),
(414, NULL, NULL, 842, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'biryani, crevette-+2€, nature, lassi-rose-33cl-+2€, oui', 0),
(415, NULL, NULL, 843, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, nature, coca-cola-33cl, oui', 0),
(416, NULL, NULL, 844, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.64, 20, 'tikka-massala, agneau-+2€, piment-+0.90€, lassi-mangue-33cl-+2€, oui', 0),
(417, NULL, NULL, 844, 549, 1, '[]', 10.00, 0.26, 2.9, 'soda-indien-+0.4€', 0),
(418, NULL, NULL, 844, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(419, NULL, NULL, 844, 529, 3, '[]', 10.00, 1.34, 4.9, 'légumes', 0),
(420, NULL, NULL, 845, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'biryani, poulet, ail-+0.90€, lassi-rose-33cl-+2€, non', 0),
(421, NULL, NULL, 845, 529, 2, '[]', 10.00, 0.89, 4.9, 'légumes', 0),
(422, NULL, NULL, 845, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(423, NULL, NULL, 845, 538, 1, '[\"Cheese Naan + \\u20ac3.90\"]', 10.00, 1.54, 16.9, 'crevette-+2€', 0),
(424, NULL, NULL, 846, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'tikka-massala, crevette-+2€, ail-+0.90€, lassi-rose-33cl-+2€, non', 0),
(425, NULL, NULL, 846, 529, 1, '[]', 10.00, 0.45, 4.9, 'boeuf', 0),
(426, NULL, NULL, 846, 551, 2, '[]', 10.00, 0.64, 3.5, '', 0),
(427, NULL, NULL, 847, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'biryani, agneau-+2€, ail-+0.90€, lassi-rose-33cl-+2€, oui', 0),
(428, NULL, NULL, 847, 540, 1, '[\"Cheese Naan + \\u20ac3.90\"]', 10.00, 1.54, 16.9, 'crevette-+2€', 0),
(429, NULL, NULL, 847, 529, 1, '[]', 10.00, 0.45, 4.9, 'boeuf', 0),
(430, NULL, NULL, 847, 532, 2, '[]', 10.00, 0.55, 3, 'cheese-naan-+0.90€', 0),
(431, NULL, NULL, 847, 550, 1, '[]', 10.00, 0.45, 4.9, 'rose', 0),
(432, NULL, NULL, 847, 550, 1, '[]', 10.00, 0.45, 4.9, 'rose', 0),
(433, NULL, NULL, 847, 552, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(434, NULL, NULL, 848, 526, 1, '[]', 10.00, 1.20, 13.2, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(435, NULL, NULL, 849, 528, 2, '[\"Version XL (Suppl\\u00e9ment riz + garniture) + \\u20ac3.50\"]', 10.00, 2.75, 15.1, 'dal-lentilles-corails, cheese-naan-+0.90€, lassi-nature-33cl-+2€, oui', 0),
(436, NULL, NULL, 849, 529, 3, '[]', 10.00, 1.07, 3.92, 'boeuf', 0),
(437, NULL, NULL, 849, 550, 1, '[]', 10.00, 0.36, 3.92, 'nature', 0),
(438, NULL, NULL, 850, 528, 2, '[\"Version XL (Suppl\\u00e9ment riz + garniture) + \\u20ac3.50\"]', 10.00, 2.75, 15.1, 'dal-lentilles-corails, piment-+0.90€, lassi-mangue-33cl-+2€, oui', 0),
(439, NULL, NULL, 850, 531, 1, '[]', 10.00, 0.36, 3.92, 'pomme-de-terre', 0),
(440, NULL, NULL, 850, 532, 2, '[]', 10.00, 0.44, 2.4, 'cheese-naan-+0.90€', 0),
(441, NULL, NULL, 850, 550, 1, '[]', 10.00, 0.36, 3.92, 'rose', 0),
(442, NULL, NULL, 850, 551, 3, '[]', 10.00, 0.76, 2.8, '', 0),
(443, NULL, NULL, 851, 528, 2, '[\"Version XL (Suppl\\u00e9ment riz + garniture) + \\u20ac3.50\"]', 10.00, 2.75, 15.1, 'dal-lentilles-corails, nature, coca-cola-33cl, oui', 0),
(444, NULL, NULL, 852, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(445, NULL, NULL, 853, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, bœuf, cheese-naan-+0.90€, lassi-nature-33cl-+2€, avec-couverts', 0),
(446, NULL, NULL, 854, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(447, NULL, NULL, 855, 527, 1, '[]', 10.00, 0.84, 9.2, 'poulet-tikka, cheese-naan-+0.90€, boeuf, ice-tea-33-cl', 0),
(448, NULL, NULL, 855, 534, 2, '[]', 10.00, 1.09, 6, 'cheese-naan-+0.90€', 0),
(449, NULL, NULL, 855, 542, 2, '[\"Cheese Naan + \\u20ac3.90\"]', 10.00, 2.60, 14.3, 'agneau-+2€', 0),
(450, NULL, NULL, 855, 532, 1, '[]', 10.00, 0.22, 2.4, 'cheese-naan-+0.90€', 0),
(451, NULL, NULL, 855, 551, 2, '[]', 10.00, 0.51, 2.8, '', 0),
(452, NULL, NULL, 855, 529, 2, '[]', 10.00, 0.71, 3.92, 'poulet', 0),
(453, NULL, NULL, 855, 550, 1, '[]', 10.00, 0.36, 3.92, 'mangue', 0),
(454, NULL, NULL, 856, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 3.04, 16.7, 'biryani, agneau-+2, ail-+0.90€, lassi-nature-33cl-+2€, avec-couverts', 0),
(455, NULL, NULL, 857, 527, 2, '[\"SAMOSSA (1 pi\\u00e8ce) + \\u20ac1.50\"]', 10.00, 1.95, 10.7, 'poulet-tikka, cheese-naan-+0.90€, poulet, lassi-nature-33cl-+2€', 0),
(456, NULL, NULL, 858, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, agneau-+2, cheese-naan-+0.90€, lassi-nature-33cl-+2€, avec-couverts', 0),
(457, NULL, NULL, 859, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, crevette-+2, cheese-naan-+0.90€, lassi-nature-33cl-+2€, avec-couverts', 0),
(458, NULL, NULL, 860, 526, 1, '[]', 10.00, 1.20, 13.2, 'biryani, agneau-+2, nature, lassi-nature-33cl-+2€, avec-couverts', 0),
(459, NULL, NULL, 861, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, crevette-+2, ail-+0.90€, lassi-nature-33cl-+2€, avec-couverts', 0),
(460, NULL, NULL, 862, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, agneau-+2, cheese-naan-+0.90€, coca-zéro-33cl, avec-couverts', 0),
(461, NULL, NULL, 863, 528, 1, '[]', 10.00, 1.05, 11.6, 'dal-lentilles-corails, cheese-naan-+0.90€, lassi-nature-33cl-+2€, oui', 0),
(462, NULL, NULL, 864, 527, 1, '[]', 10.00, 0.84, 9.2, 'poulet-tikka, cheese-naan-+0.90€, poulet, coca-cola-33cl', 0),
(463, NULL, NULL, 865, 526, 1, '[]', 10.00, 1.20, 13.2, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(464, NULL, NULL, 866, 527, 1, '[\"SAMOSSA (1 pi\\u00e8ce) + \\u20ac1.50\"]', 10.00, 0.97, 10.7, 'poulet-tikka, nature, poulet, coca-cola-33cl', 0),
(465, NULL, NULL, 867, 537, 1, '[]', 10.00, 1.09, 12, 'agneau-+2€', 0),
(466, NULL, NULL, 868, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(467, NULL, NULL, 869, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'biryani, bœuf, nature, coca-cola-33cl, avec-couverts', 0),
(468, NULL, NULL, 870, 527, 1, '[\"SAMOSSA (1 pi\\u00e8ce) + \\u20ac1.50\"]', 10.00, 1.18, 13, 'poulet-tikka, ail-+0.90€, poulet, eau-gazeuse-50cl', 0),
(469, NULL, NULL, 871, 528, 1, '[\"Version XL (Suppl\\u00e9ment riz + garniture) + \\u20ac3.50\"]', 10.00, 1.64, 18, 'dal-lentilles-corails, ail-+0.90€, eau-gazeuse-50cl, non', 0),
(470, NULL, NULL, 872, 527, 1, '[]', 10.00, 1.05, 11.5, 'poulet-tikka, nature, poulet, lassi-nature-33cl-+2€', 0),
(471, NULL, NULL, 873, 543, 1, '[]', 10.00, 1.18, 13, 'poulet', 0),
(472, NULL, NULL, 874, 539, 1, '[\"Version XL + \\u20ac3.50\",\"Cheese Naan + \\u20ac3.90\"]', 10.00, 1.85, 20.4, 'agneau-+2€', 0),
(473, NULL, NULL, 875, 526, 1, '[]', 10.00, 1.50, 16.5, 'tikka-massala, crevette-+2, piment-+0.90, lassi-nature-33cl-+2€, sans-couverts', 0),
(474, NULL, NULL, 876, 528, 2, '[]', 10.00, 2.64, 14.5, 'dewalls-poivrons, cheese-naan-+0.90€, eau-plate-50cl, non', 0),
(475, NULL, NULL, 786, 499, 1, '[]', 18.00, 1.56, 10.2, '', 0),
(476, NULL, NULL, 786, 503, 1, '[]', 18.00, 1.69, 11.05, '', 0),
(477, NULL, NULL, 877, 499, 1, '[]', 18.00, 1.56, 10.2, '', 0),
(478, NULL, NULL, 878, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, crevette-+2€, cheese-naan-+0.9€, coca-cola-33cl, avec-couverts', 0),
(479, NULL, NULL, 879, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, crevette-+2€, cheese-naan-+0.9€, coca-cola-33cl, avec-couverts', 0),
(480, NULL, NULL, 879, 535, 1, '[]', 10.00, 0.55, 6, 'cheese-naan-+0.90€', 0),
(481, NULL, NULL, 880, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, crevette-+2€, newitem-+0.2€, lassi-mangue-33cl-+2€, avec-couverts', 0),
(482, NULL, NULL, 881, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.52, 16.7, 'biryani, crevette-+2€, newitem-+0.2€, lassi-nature-33cl-+2€, avec-couverts', 0),
(483, NULL, NULL, 882, 534, 1, '[]', 10.00, 0.55, 6, 'nature', 0),
(484, NULL, NULL, 883, 534, 1, '[]', 10.00, 0.55, 6, 'nature', 0),
(485, NULL, NULL, 884, 535, 1, '[]', 10.00, 0.55, 6, 'nature', 0),
(486, NULL, NULL, 885, 535, 1, '[]', 10.00, 0.55, 6, 'nature', 0),
(487, NULL, NULL, 886, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(488, NULL, NULL, 887, 551, 1, '[]', 10.00, 0.32, 3.5, '', 0),
(489, NULL, NULL, 888, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(490, NULL, NULL, 889, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(491, NULL, NULL, 890, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(492, NULL, NULL, 891, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(493, NULL, NULL, 892, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(494, NULL, NULL, 893, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, cheese-naan-+0.9€, eau-gazeuse-50cl, sans-couverts', 0),
(495, NULL, NULL, 893, 529, 2, '[]', 10.00, 0.89, 4.9, 'boeuf', 0),
(496, NULL, NULL, 893, 550, 1, '[]', 10.00, 0.45, 4.9, 'rose', 0),
(497, NULL, NULL, 893, 532, 1, '[]', 10.00, 0.27, 3, 'nature', 0),
(498, NULL, NULL, 894, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'butter, bœuf, cheese-naan-+0.9€, lassi-nature-33cl-+2€, sans-couverts', 0),
(499, NULL, NULL, 895, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(500, NULL, NULL, 896, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(501, NULL, NULL, 897, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'biryani, crevette-+2€, nature, lassi-nature-33cl-+2€, avec-couverts', 0),
(502, NULL, NULL, 898, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'biryani, crevette-+2€, nature, ice-tea-33-cl, avec-couverts', 0),
(503, NULL, NULL, 899, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 1.82, 20, 'biryani, poulet, nature, lassi-nature-33cl-+2€, avec-couverts', 0),
(504, NULL, NULL, 900, 535, 1, '[]', 10.00, 0.68, 7.5, 'nature', 0),
(505, NULL, NULL, 901, 526, 1, '[]', 10.00, 1.50, 16.5, 'biryani, crevette-+2€, nature, eau-gazeuse-50cl, avec-couverts', 0),
(506, NULL, NULL, 902, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 21.25, 4.25, 20, 'butter, bœuf, cheese-naan-+0.9€, lassi-mangue-33cl-+2€, sans-couverts', 0),
(507, NULL, NULL, 902, 534, 1, '[]', 10.00, 1.00, 10, 'nature', 0),
(508, NULL, NULL, 902, 550, 1, '[]', 10.00, 0.49, 4.9, 'mangue', 0),
(509, NULL, NULL, 903, 528, 1, '[\"Version XL (Suppl\\u00e9ment riz + garniture) + \\u20ac3.50\"]', 10.00, 1.80, 18, 'coco-aubergines, cheese-naan-+0.90€, lassi-mangue-33cl-+2€, non', 0),
(510, NULL, NULL, 903, 537, 1, '[\"Version XL + \\u20ac3.50\"]', 10.00, 1.55, 15.5, 'boeuf', 0),
(511, NULL, NULL, 903, 549, 1, '[]', 10.00, 0.29, 2.9, 'coca-cola', 0),
(512, NULL, NULL, 904, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(513, NULL, NULL, 905, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(514, NULL, NULL, 906, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, agneau-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(515, NULL, NULL, 907, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, agneau-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(516, NULL, NULL, 908, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, agneau-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(517, NULL, NULL, 909, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(518, NULL, NULL, 910, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, ail, ice-tea-33-cl, avec-couverts', 0),
(519, NULL, NULL, 911, 526, 1, '[]', 10.00, 1.65, 16.5, 'korma, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(520, NULL, NULL, 912, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, crevette-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, sans-couverts', 0),
(521, NULL, NULL, 913, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'dewalls, crevette-+2€, newitem-+0.2€, lassi-nature-33cl-+2€, avec-couverts', 0),
(522, NULL, NULL, 913, 528, 1, '[\"Version XL (Suppl\\u00e9ment riz + garniture) + \\u20ac3.50\"]', 10.00, 1.80, 18, 'dal-lentilles-corails, cheese-naan-+0.90€, lassi-nature-33cl-+2€, oui', 0),
(523, NULL, NULL, 913, 549, 4, '[]', 10.00, 1.16, 2.9, 'soda-indien-+0.4€', 0),
(524, NULL, NULL, 914, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 4.00, 20, 'biryani, crevette-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(525, NULL, NULL, 914, 535, 1, '[]', 10.00, 0.75, 7.5, 'piment-+0.90€', 0),
(526, NULL, NULL, 914, 551, 3, '[]', 10.00, 1.05, 3.5, '', 0),
(527, NULL, NULL, 915, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(528, NULL, NULL, 915, 535, 1, '[]', 10.00, 0.75, 7.5, 'ail-+0.90€', 0),
(529, NULL, NULL, 915, 544, 2, '[\"Version XL + \\u20ac2.80\",\"Cheese Naan + \\u20ac3.90\"]', 10.00, 3.54, 17.7, '', 0),
(530, NULL, NULL, 916, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(531, NULL, NULL, 915, 530, 1, '[]', 10.00, 0.49, 4.9, 'poulet', 0),
(532, NULL, NULL, 916, 535, 1, '[]', 10.00, 0.75, 7.5, 'ail-+0.90€', 0),
(533, NULL, NULL, 916, 544, 2, '[\"Version XL + \\u20ac2.80\",\"Cheese Naan + \\u20ac3.90\"]', 10.00, 3.54, 17.7, '', 0),
(534, NULL, NULL, 916, 530, 1, '[]', 10.00, 0.49, 4.9, 'poulet', 0),
(535, NULL, NULL, 917, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(536, NULL, NULL, 918, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(537, NULL, NULL, 919, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(538, NULL, NULL, 920, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(539, NULL, NULL, 921, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, crevette-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(540, NULL, NULL, 922, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-zéro-33cl, avec-couverts', 0),
(541, NULL, NULL, 923, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(542, NULL, NULL, 923, 535, 1, '[]', 10.00, 0.75, 7.5, 'nature', 0),
(543, NULL, NULL, 924, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, agneau-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(544, NULL, NULL, 924, 537, 3, '[\"Cheese Naan + \\u20ac3.90\"]', 10.00, 4.77, 15.9, 'agneau-+2€', 0),
(545, NULL, NULL, 924, 544, 1, '[\"Version XL + \\u20ac2.80\"]', 10.00, 1.38, 13.8, '', 0),
(546, NULL, NULL, 924, 531, 2, '[]', 10.00, 0.98, 4.9, 'aubergine', 0),
(547, NULL, NULL, 924, 550, 4, '[]', 10.00, 1.96, 4.9, 'coco', 0),
(548, NULL, NULL, 925, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, crevette-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(549, NULL, NULL, 925, 534, 1, '[]', 10.00, 0.75, 7.5, 'cheese-naan-+0.90€', 0),
(550, NULL, NULL, 925, 538, 1, '[\"Version XL + \\u20ac3.50\"]', 10.00, 1.65, 16.5, 'agneau-+2€', 0),
(551, NULL, NULL, 926, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, crevette-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(552, NULL, NULL, 926, 535, 1, '[]', 10.00, 0.75, 7.5, 'cheese-naan-+0.90€', 0),
(553, NULL, NULL, 926, 544, 1, '[]', 10.00, 1.10, 11, '', 0),
(554, NULL, NULL, 926, 532, 1, '[]', 10.00, 0.30, 3, 'nature', 0),
(555, NULL, NULL, 926, 551, 2, '[]', 10.00, 0.70, 3.5, '', 0),
(556, NULL, NULL, 927, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'tikka-massala, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(557, NULL, NULL, 928, 546, 1, '[]', 10.00, 1.10, 11, '', 0),
(558, NULL, NULL, 929, 549, 1, '[]', 10.00, 0.29, 2.9, 'coca-zéro', 0),
(559, NULL, NULL, 930, 535, 1, '[]', 10.00, 0.75, 7.5, 'nature', 0),
(560, NULL, NULL, 931, 529, 1, '[]', 10.00, 0.49, 4.9, 'poulet', 0),
(561, NULL, NULL, 932, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, crevette-+2€, nature, coca-cola-33cl, avec-couverts', 0),
(562, NULL, NULL, 933, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, crevette-+2€, nature, coca-cola-33cl, avec-couverts', 0),
(563, NULL, NULL, 934, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, crevette-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(564, NULL, NULL, 934, 551, 1, '[]', 10.00, 0.35, 3.5, '', 0),
(565, NULL, NULL, 935, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'butter, agneau-+2€, nature, eau-gazeuse-50cl, sans-couverts', 0),
(566, NULL, NULL, 936, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, lassi-nature-33cl-+2€, avec-couverts', 0),
(567, NULL, NULL, 937, 526, 1, '[]', 10.00, 1.85, 18.5, 'biryani, crevette-+2€, nature, coca-cola-33cl, avec-couverts', 0),
(568, NULL, NULL, 937, 527, 1, '[\"SAMOSSA (1 pi\\u00e8ce) + \\u20ac1.50\"]', 10.00, 1.30, 13, 'poulet-tikka, nature, poulet, coca-cola-33cl', 0),
(569, NULL, NULL, 938, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 4.98, 24.9, 'biryani, crevette-+2€, cheese-naan-+0.9€, lassi-nature-33cl-+2€, avec-couverts', 0),
(570, NULL, NULL, 939, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(571, NULL, NULL, 940, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.40, 24, 'biryani, crevette-+2€, nature, lassi-nature-33cl-+2€, avec-couverts', 0),
(572, NULL, NULL, 940, 535, 1, '[]', 10.00, 0.75, 7.5, 'nature', 0),
(573, NULL, NULL, 940, 539, 1, '[\"Version XL + \\u20ac3.50\"]', 10.00, 1.85, 18.5, 'agneau-+2€', 0),
(574, NULL, NULL, 940, 549, 1, '[]', 10.00, 0.33, 3.3, 'soda-indien-+0.4€', 0),
(575, NULL, NULL, 940, 552, 1, '[]', 10.00, 0.35, 3.5, '', 0),
(576, NULL, NULL, 941, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.20, 22, 'biryani, poulet, nature, lassi-nature-33cl-+2€, avec-couverts', 0),
(577, NULL, NULL, 941, 535, 1, '[]', 10.00, 0.75, 7.5, 'nature', 0),
(578, NULL, NULL, 941, 539, 1, '[\"Version XL + \\u20ac3.50\"]', 10.00, 1.85, 18.5, 'agneau-+2€', 0),
(579, NULL, NULL, 941, 548, 1, '[\"Version XL + \\u20ac2.80\"]', 10.00, 1.38, 13.8, '', 0),
(580, NULL, NULL, 942, 526, 1, '[]', 10.00, 1.94, 19.4, 'biryani, poulet, cheese-naan-+0.9€, lassi-mangue-33cl-+2€, avec-couverts', 0),
(581, NULL, NULL, 943, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(582, NULL, NULL, 944, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(583, NULL, NULL, 945, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, légumes, nature, coca-cola-33cl, avec-couverts', 0),
(584, NULL, NULL, 946, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, bœuf, piment, ice-tea-33-cl, avec-couverts', 0),
(585, NULL, NULL, 947, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(586, NULL, NULL, 948, 527, 1, '[]', 10.00, 1.35, 13.5, 'poivrons-massala, nature, boeuf, lassi-mangue-33cl-+2€', 0),
(587, NULL, NULL, 949, 540, 1, '[\"Version XL + \\u20ac3.50\",\"Cheese Naan + \\u20ac3.90\"]', 10.00, 2.04, 20.4, 'poulet', 0),
(588, NULL, NULL, 950, 526, 2, '[]', 10.00, 3.30, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(589, NULL, NULL, 951, 526, 3, '[]', 10.00, 4.95, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(590, NULL, NULL, 951, 526, 3, '[]', 10.00, 4.95, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(591, NULL, NULL, 952, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(592, NULL, NULL, 953, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(593, NULL, NULL, 954, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(594, NULL, NULL, 955, 526, 2, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 4.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(595, NULL, NULL, 956, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(596, NULL, NULL, 957, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(597, NULL, NULL, 958, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(598, NULL, NULL, 959, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.40, 24, 'biryani, crevette-+2€, nature, lassi-nature-33cl-+2€, avec-couverts', 0),
(599, NULL, NULL, 960, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.49, 24.9, 'biryani, agneau-+2€, cheese-naan-+0.9€, lassi-mangue-33cl-+2€, avec-couverts', 0),
(600, NULL, NULL, 961, 534, 3, '[]', 10.00, 2.52, 8.4, 'ail-+0.90€', 0),
(601, NULL, NULL, 961, 534, 3, '[]', 10.00, 2.52, 8.4, 'ail-+0.90€', 0),
(602, NULL, NULL, 961, 537, 1, '[\"Version XL + \\u20ac3.50\",\"Cheese Naan + \\u20ac3.90\"]', 10.00, 1.94, 19.4, 'poulet', 0),
(603, NULL, NULL, 962, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.20, 22, 'biryani, crevette-+2€, nature, coca-cola-33cl, avec-couverts', 0),
(604, NULL, NULL, 963, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.20, 22, 'biryani, crevette-+2€, nature, eau-gazeuse-50cl, avec-couverts', 0),
(605, NULL, NULL, 964, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.00, 20, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(606, NULL, NULL, 966, 536, 1, '[]', 10.00, 0.65, 6.5, 'nature', 0),
(607, NULL, NULL, 967, 536, 1, '[]', 10.00, 0.65, 6.5, 'nature', 0),
(608, NULL, NULL, 968, 536, 1, '[]', 10.00, 0.65, 6.5, 'nature', 0),
(609, NULL, NULL, 969, 536, 1, '[]', 10.00, 0.65, 6.5, 'nature', 0),
(610, NULL, NULL, 970, 536, 1, '[]', 10.00, 0.65, 6.5, 'nature', 0),
(611, NULL, NULL, 971, 536, 1, '[]', 10.00, 0.65, 6.5, 'nature', 0),
(612, NULL, NULL, 972, 536, 1, '[]', 10.00, 0.65, 6.5, 'nature', 0),
(613, NULL, NULL, 972, 535, 1, '[]', 10.00, 0.75, 7.5, 'nature', 0),
(614, NULL, NULL, 973, 526, 1, '[]', 10.00, 1.65, 16.5, 'biryani, poulet, nature, coca-cola-33cl, avec-couverts', 0),
(615, NULL, NULL, 974, 526, 1, '[\"VERSION XL (Suppl\\u00e9ment riz + garnitures) + \\u20ac3.50\"]', 10.00, 2.29, 22.9, 'biryani, crevette-+2 EUR, cheese-naan-+0.9 EUR, eau-gazeuse-50cl, avec-couverts', 0),
(616, NULL, NULL, 974, 539, 1, '[\"Version XL + \\u20ac3.50\"]', 10.00, 1.85, 18.5, 'agneau-+2 EUR', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_has_status`
--

CREATE TABLE `order_has_status` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `status_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_has_status`
--

INSERT INTO `order_has_status` (`id`, `created_at`, `updated_at`, `order_id`, `status_id`, `user_id`, `comment`) VALUES
(446, '2024-02-05 15:22:29', NULL, 742, 1, 89, 'Local order'),
(447, '2024-02-05 15:23:00', NULL, 742, 3, 89, ''),
(448, '2024-02-05 15:23:02', NULL, 742, 5, 89, ''),
(449, '2024-02-05 15:23:05', NULL, 742, 7, 89, ''),
(450, '2024-02-05 15:23:27', NULL, 742, 11, 89, ''),
(523, '2024-03-08 18:15:36', NULL, 786, 1, 91, 'Local order'),
(553, '2024-03-20 15:02:54', NULL, 807, 1, 225, 'Local order'),
(554, '2024-03-20 15:20:03', NULL, 807, 3, 225, ''),
(555, '2024-03-20 15:20:05', NULL, 807, 5, 225, ''),
(556, '2024-03-20 15:20:07', NULL, 807, 7, 225, ''),
(557, '2024-03-20 15:20:09', NULL, 807, 11, 225, ''),
(558, '2024-03-20 19:49:24', NULL, 808, 1, 225, 'Local order'),
(559, '2024-03-20 20:28:13', NULL, 808, 3, 225, ''),
(560, '2024-03-20 20:28:15', NULL, 808, 5, 225, ''),
(561, '2024-03-20 20:28:17', NULL, 808, 7, 225, ''),
(562, '2024-03-20 20:28:23', NULL, 808, 11, 225, ''),
(563, '2024-03-20 20:44:08', NULL, 809, 1, 225, 'Local order'),
(564, '2024-03-20 23:34:47', NULL, 810, 1, 225, 'Local order'),
(565, '2024-03-20 23:35:30', NULL, 809, 9, 225, ''),
(566, '2024-03-20 23:35:34', NULL, 810, 3, 225, ''),
(567, '2024-03-20 23:35:36', NULL, 810, 5, 225, ''),
(568, '2024-03-20 23:35:51', NULL, 810, 7, 225, ''),
(569, '2024-03-20 23:35:53', NULL, 810, 11, 225, ''),
(570, '2024-03-21 21:42:59', NULL, 811, 1, 225, 'Local order'),
(571, '2024-03-21 21:46:35', NULL, 811, 9, 225, ''),
(572, '2024-03-21 21:47:31', NULL, 812, 1, 225, 'Local order'),
(573, '2024-03-21 21:48:46', NULL, 812, 3, 225, ''),
(574, '2024-03-21 21:52:20', NULL, 813, 1, 225, 'Local order'),
(575, '2024-03-22 14:23:31', NULL, 813, 9, 225, ''),
(576, '2024-03-22 14:45:06', NULL, 814, 1, 225, 'Local order'),
(577, '2024-03-22 14:48:00', NULL, 814, 3, 225, ''),
(578, '2024-03-22 14:48:15', NULL, 814, 5, 225, ''),
(579, '2024-03-22 14:48:50', NULL, 814, 7, 225, ''),
(580, '2024-03-22 14:49:20', NULL, 814, 11, 225, ''),
(581, '2024-03-22 14:51:05', NULL, 815, 1, 225, 'Local order'),
(582, '2024-03-22 14:53:17', NULL, 816, 1, 225, 'Local order'),
(583, '2024-03-22 14:54:06', NULL, 816, 3, 225, ''),
(584, '2024-03-22 14:54:30', NULL, 816, 5, 225, ''),
(585, '2024-03-22 14:58:07', NULL, 815, 9, 225, ''),
(586, '2024-03-22 14:58:11', NULL, 816, 7, 225, ''),
(587, '2024-03-22 14:58:13', NULL, 816, 11, 225, ''),
(588, '2024-03-22 15:00:06', NULL, 817, 1, 225, 'Local order'),
(589, '2024-03-22 15:02:06', NULL, 817, 9, 225, ''),
(590, '2024-03-22 15:31:50', NULL, 812, 5, 225, ''),
(591, '2024-03-22 15:31:52', NULL, 812, 7, 225, ''),
(592, '2024-03-22 15:31:54', NULL, 812, 11, 225, ''),
(593, '2024-03-22 15:41:33', NULL, 818, 1, 225, 'Local order'),
(594, '2024-03-22 15:42:33', NULL, 818, 3, 225, ''),
(595, '2024-03-22 16:48:06', NULL, 819, 1, 225, 'Local order'),
(596, '2024-03-22 16:50:33', NULL, 820, 1, 225, 'Local order'),
(597, '2024-03-22 16:51:52', NULL, 821, 1, 225, 'Local order'),
(598, '2024-03-22 16:54:09', NULL, 819, 9, 225, ''),
(599, '2024-03-22 16:54:10', NULL, 820, 9, 225, ''),
(600, '2024-03-22 16:54:14', NULL, 821, 3, 225, ''),
(601, '2024-03-22 16:56:25', NULL, 822, 1, 225, 'Local order'),
(602, '2024-03-22 16:56:52', NULL, 822, 3, 225, ''),
(603, '2024-03-22 16:56:54', NULL, 821, 5, 225, ''),
(604, '2024-03-22 16:56:56', NULL, 821, 7, 225, ''),
(605, '2024-03-22 16:57:59', NULL, 818, 5, 225, ''),
(606, '2024-03-22 16:58:01', NULL, 818, 7, 225, ''),
(607, '2024-03-22 17:01:09', NULL, 823, 1, 225, 'Local order'),
(608, '2024-03-22 17:03:11', NULL, 824, 1, 225, 'Local order'),
(609, '2024-03-22 17:04:11', NULL, 825, 1, 225, 'Local order'),
(610, '2024-03-22 17:09:26', NULL, 826, 1, 225, 'Local order'),
(611, '2024-03-22 17:11:34', NULL, 827, 1, 225, 'Local order'),
(612, '2024-03-22 17:22:57', NULL, 828, 1, 225, 'Local order'),
(613, '2024-03-22 17:24:45', NULL, 829, 1, 225, 'Local order'),
(614, '2024-03-22 17:26:58', NULL, 830, 1, 225, 'Local order'),
(615, '2024-03-22 17:27:18', NULL, 823, 9, 225, ''),
(616, '2024-03-22 17:27:19', NULL, 824, 9, 225, ''),
(617, '2024-03-22 17:27:21', NULL, 825, 9, 225, ''),
(618, '2024-03-22 17:27:22', NULL, 826, 9, 225, ''),
(619, '2024-03-22 17:27:24', NULL, 827, 9, 225, ''),
(620, '2024-03-22 17:27:25', NULL, 828, 9, 225, ''),
(621, '2024-03-22 17:27:26', NULL, 829, 9, 225, ''),
(622, '2024-03-22 17:28:42', NULL, 830, 3, 225, ''),
(623, '2024-03-22 17:28:53', NULL, 830, 5, 225, ''),
(624, '2024-03-22 17:28:55', NULL, 830, 7, 225, ''),
(625, '2024-03-22 17:29:01', NULL, 830, 11, 225, ''),
(626, '2024-03-22 17:29:09', NULL, 822, 5, 225, ''),
(627, '2024-03-22 17:29:12', NULL, 822, 7, 225, ''),
(628, '2024-03-22 17:29:15', NULL, 822, 11, 225, ''),
(629, '2024-03-22 17:29:17', NULL, 821, 11, 225, ''),
(630, '2024-03-22 17:29:21', NULL, 818, 11, 225, ''),
(631, '2024-03-22 17:39:24', NULL, 831, 1, 225, 'Local order'),
(632, '2024-03-22 18:42:02', NULL, 832, 1, 225, 'Local order'),
(633, '2024-03-22 18:46:33', NULL, 833, 1, 225, 'Local order'),
(634, '2024-03-22 18:48:21', NULL, 834, 1, 225, 'Local order'),
(635, '2024-03-22 18:49:21', NULL, 835, 1, 225, 'Local order'),
(636, '2024-03-22 18:59:19', NULL, 836, 1, 225, 'Local order'),
(637, '2024-03-22 19:01:01', NULL, 837, 1, 225, 'Local order'),
(638, '2024-03-22 19:01:27', NULL, 837, 9, 225, ''),
(639, '2024-03-22 19:01:28', NULL, 836, 9, 225, ''),
(640, '2024-03-22 19:01:30', NULL, 835, 9, 225, ''),
(641, '2024-03-22 19:01:32', NULL, 834, 9, 225, ''),
(642, '2024-03-22 19:01:33', NULL, 833, 9, 225, ''),
(643, '2024-03-22 19:01:34', NULL, 832, 9, 225, ''),
(644, '2024-03-22 19:01:36', NULL, 831, 9, 225, ''),
(645, '2024-03-22 19:21:13', NULL, 838, 1, 90, 'Local order'),
(646, '2024-03-22 19:24:42', NULL, 839, 1, 88, 'Local order'),
(647, '2024-03-22 19:31:21', NULL, 840, 1, 225, 'Local order'),
(648, '2024-03-22 19:32:32', NULL, 840, 3, 225, ''),
(649, '2024-03-22 19:38:39', NULL, 841, 1, 225, 'Local order'),
(650, '2024-03-22 20:25:08', NULL, 842, 1, 225, 'Local order'),
(651, '2024-03-22 20:26:46', NULL, 843, 1, 225, 'Local order'),
(652, '2024-03-22 20:28:05', NULL, 844, 1, 225, 'Local order'),
(653, '2024-03-22 20:31:03', NULL, 845, 1, 225, 'Local order'),
(654, '2024-03-22 20:32:31', NULL, 846, 1, 225, 'Local order'),
(655, '2024-03-22 20:40:38', NULL, 846, 9, 225, ''),
(656, '2024-03-22 20:40:40', NULL, 845, 9, 225, ''),
(657, '2024-03-22 20:40:41', NULL, 844, 9, 225, ''),
(658, '2024-03-22 20:40:43', NULL, 843, 9, 225, ''),
(659, '2024-03-22 20:40:46', NULL, 841, 9, 225, ''),
(660, '2024-03-22 20:40:48', NULL, 842, 9, 225, ''),
(661, '2024-03-22 20:42:26', NULL, 847, 1, 225, 'Local order'),
(662, '2024-03-26 19:11:31', NULL, 848, 1, 225, 'Local order'),
(663, '2024-03-26 19:15:23', NULL, 849, 1, 225, 'Local order'),
(664, '2024-03-26 19:18:03', NULL, 850, 1, 225, 'Local order'),
(665, '2024-03-26 19:24:28', NULL, 851, 1, 225, 'Local order'),
(666, '2024-03-26 19:33:20', NULL, 852, 1, 225, 'Local order'),
(667, '2024-03-26 20:15:33', NULL, 853, 1, 225, 'Local order'),
(668, '2024-03-26 20:46:03', NULL, 854, 1, 225, 'Local order'),
(669, '2024-03-26 20:55:04', NULL, 855, 1, 225, 'Local order'),
(670, '2024-03-26 21:05:38', NULL, 856, 1, 225, 'Local order'),
(671, '2024-03-26 21:07:07', NULL, 857, 1, 225, 'Local order'),
(672, '2024-03-26 21:10:42', NULL, 858, 1, 225, 'Local order'),
(673, '2024-03-26 21:11:30', NULL, 859, 1, 225, 'Local order'),
(674, '2024-03-26 21:13:50', NULL, 860, 1, 225, 'Local order'),
(675, '2024-03-26 21:14:33', NULL, 861, 1, 225, 'Local order'),
(676, '2024-03-26 21:15:40', NULL, 862, 1, 225, 'Local order'),
(677, '2024-03-26 21:22:58', NULL, 863, 1, 225, 'Local order'),
(678, '2024-03-26 21:24:35', NULL, 864, 1, 225, 'Local order'),
(679, '2024-03-26 21:36:17', NULL, 865, 1, 225, 'Local order'),
(680, '2024-03-26 21:37:26', NULL, 866, 1, 225, 'Local order'),
(681, '2024-03-27 14:28:34', NULL, 867, 1, 225, 'Local order'),
(682, '2024-03-27 14:41:14', NULL, 868, 1, 225, 'Local order'),
(683, '2024-03-27 14:42:43', NULL, 868, 3, 225, ''),
(684, '2024-03-27 14:42:46', NULL, 868, 5, 225, ''),
(685, '2024-03-27 14:42:48', NULL, 868, 7, 225, ''),
(686, '2024-03-27 14:42:50', NULL, 868, 11, 225, ''),
(687, '2024-03-27 15:31:36', NULL, 869, 1, 225, 'Local order'),
(688, '2024-03-27 15:41:06', NULL, 870, 1, 225, 'Local order'),
(689, '2024-03-27 15:46:41', NULL, 871, 1, 225, 'Local order'),
(690, '2024-03-27 15:58:47', NULL, 862, 3, 225, ''),
(691, '2024-03-27 15:58:52', NULL, 862, 5, 225, ''),
(692, '2024-03-27 15:58:58', NULL, 862, 7, 225, ''),
(693, '2024-03-27 16:00:20', NULL, 872, 1, 225, 'Local order'),
(694, '2024-03-27 16:16:58', NULL, 873, 1, 225, 'Local order'),
(695, '2024-03-27 18:51:51', NULL, 874, 1, 225, 'Local order'),
(696, '2024-03-27 20:04:32', NULL, 875, 1, 225, 'Local order'),
(697, '2024-03-28 05:20:39', NULL, 876, 1, 225, 'Local order'),
(698, '2024-03-28 05:21:42', NULL, 876, 3, 225, ''),
(699, '2024-03-28 05:21:43', NULL, 876, 3, 225, ''),
(700, '2024-03-28 05:21:48', NULL, 876, 5, 225, ''),
(701, '2024-03-28 05:21:50', NULL, 876, 7, 225, ''),
(702, '2024-03-28 05:21:59', NULL, 876, 11, 225, ''),
(703, '2024-03-28 14:17:41', NULL, 786, 10, 91, 'Local ordering updated'),
(704, '2024-03-28 14:20:17', NULL, 877, 1, 91, 'Local order'),
(705, '2024-03-28 14:20:51', NULL, 877, 3, 91, ''),
(706, '2024-03-28 18:18:43', NULL, 878, 1, 225, 'Local order'),
(707, '2024-03-28 18:22:06', NULL, 879, 1, 225, 'Local order'),
(708, '2024-03-28 19:11:12', NULL, 880, 1, 225, 'Local order'),
(709, '2024-03-28 19:12:46', NULL, 881, 1, 225, 'Local order'),
(710, '2024-03-28 19:38:45', NULL, 882, 1, 225, 'Local order'),
(711, '2024-03-28 19:48:52', NULL, 883, 1, 225, 'Local order'),
(712, '2024-03-28 19:53:01', NULL, 884, 1, 225, 'Local order'),
(713, '2024-03-28 20:01:13', NULL, 885, 1, 225, 'Local order'),
(714, '2024-03-29 18:47:38', NULL, 886, 1, 225, 'Local order'),
(715, '2024-03-29 18:50:41', NULL, 887, 1, 225, 'Local order'),
(716, '2024-03-30 16:38:31', NULL, 888, 1, 225, 'Local order'),
(717, '2024-03-30 16:43:09', NULL, 889, 1, 225, 'Local order'),
(718, '2024-03-30 16:53:04', NULL, 890, 1, 225, 'Local order'),
(719, '2024-03-30 17:39:38', NULL, 891, 1, 225, 'Local order'),
(720, '2024-03-30 17:55:11', NULL, 892, 1, 225, 'Local order'),
(721, '2024-03-30 17:55:18', NULL, 893, 1, 225, 'Local order'),
(722, '2024-03-30 18:10:45', NULL, 894, 1, 225, 'Local order'),
(723, '2024-03-30 19:27:16', NULL, 895, 1, 225, 'Local order'),
(724, '2024-03-30 20:04:40', NULL, 896, 1, 225, 'Local order'),
(725, '2024-03-31 00:28:42', NULL, 897, 1, 225, 'Local order'),
(726, '2024-03-31 00:29:21', NULL, 898, 1, 225, 'Local order'),
(727, '2024-03-31 15:53:26', NULL, 899, 1, 225, 'Local order'),
(728, '2024-03-31 16:56:32', NULL, 900, 1, 225, 'Local order'),
(729, '2024-04-01 22:36:00', NULL, 901, 1, 225, 'Local order'),
(730, '2024-04-04 17:17:35', NULL, 902, 1, 225, 'Local order'),
(731, '2024-04-04 17:29:58', NULL, 903, 1, 225, 'Local order'),
(732, '2024-04-06 17:55:04', NULL, 904, 1, 225, 'Local order'),
(733, '2024-04-06 18:08:49', NULL, 905, 1, 225, 'Local order'),
(734, '2024-04-07 19:58:00', NULL, 906, 1, 225, 'Local order'),
(735, '2024-04-07 20:00:01', NULL, 907, 1, 225, 'Local order'),
(736, '2024-04-07 20:00:11', NULL, 908, 1, 225, 'Local order'),
(737, '2024-04-07 20:01:11', NULL, 909, 1, 225, 'Local order'),
(738, '2024-04-07 20:02:10', NULL, 910, 1, 225, 'Local order'),
(739, '2024-04-07 20:05:25', NULL, 911, 1, 225, 'Local order'),
(740, '2024-04-07 20:06:42', NULL, 912, 1, 225, 'Local order'),
(741, '2024-04-07 20:11:58', NULL, 912, 9, 225, ''),
(742, '2024-04-07 20:12:00', NULL, 911, 9, 225, ''),
(743, '2024-04-07 20:12:02', NULL, 910, 9, 225, ''),
(744, '2024-04-07 20:12:04', NULL, 909, 9, 225, ''),
(745, '2024-04-07 20:12:06', NULL, 908, 9, 225, ''),
(746, '2024-04-07 20:12:09', NULL, 907, 9, 225, ''),
(747, '2024-04-07 20:12:11', NULL, 905, 9, 225, ''),
(748, '2024-04-07 20:12:12', NULL, 906, 9, 225, ''),
(749, '2024-04-07 20:12:15', NULL, 904, 9, 225, ''),
(750, '2024-04-07 20:12:17', NULL, 903, 9, 225, ''),
(751, '2024-04-08 13:30:47', NULL, 913, 1, 225, 'Local order'),
(752, '2024-04-08 13:33:47', NULL, 914, 1, 225, 'Local order'),
(753, '2024-04-08 13:44:36', NULL, 915, 1, 225, 'Local order'),
(754, '2024-04-08 13:44:36', NULL, 916, 1, 225, 'Local order'),
(755, '2024-04-09 00:51:58', NULL, 917, 1, 225, 'Local order'),
(756, '2024-04-09 00:52:38', NULL, 917, 9, 225, ''),
(757, '2024-04-09 01:00:08', NULL, 918, 1, 225, 'Local order'),
(758, '2024-04-09 01:00:20', NULL, 919, 1, 225, 'Local order'),
(759, '2024-04-09 01:00:21', NULL, 920, 1, 225, 'Local order'),
(760, '2024-04-09 01:05:32', NULL, 921, 1, 225, 'Local order'),
(761, '2024-04-09 01:16:36', NULL, 922, 1, 225, 'Local order'),
(762, '2024-04-09 01:27:51', NULL, 923, 1, 225, 'Local order'),
(763, '2024-04-09 02:00:13', NULL, 924, 1, 225, 'Local order'),
(764, '2024-04-09 13:32:25', NULL, 925, 1, 225, 'Local order'),
(765, '2024-04-09 14:15:05', NULL, 926, 1, 225, 'Local order'),
(766, '2024-04-09 14:45:57', NULL, 926, 3, 225, ''),
(767, '2024-04-11 17:50:11', NULL, 927, 1, 225, 'Local order'),
(768, '2024-04-11 18:43:43', NULL, 928, 1, 225, 'Local order'),
(769, '2024-04-11 18:46:46', NULL, 929, 1, 225, 'Local order'),
(770, '2024-04-12 16:10:33', NULL, 930, 1, 225, 'Local order'),
(771, '2024-04-12 16:12:08', NULL, 931, 1, 225, 'Local order'),
(772, '2024-04-16 13:23:27', NULL, 932, 1, 225, 'Local order'),
(773, '2024-04-16 15:38:23', NULL, 933, 1, 225, 'Local order'),
(774, '2024-04-16 15:54:23', NULL, 934, 1, 225, 'Local order'),
(775, '2024-04-16 16:47:31', NULL, 935, 1, 225, 'Local order'),
(776, '2024-04-16 16:48:14', NULL, 935, 3, 225, ''),
(777, '2024-04-16 16:48:32', NULL, 935, 5, 225, ''),
(778, '2024-04-16 16:48:54', NULL, 935, 7, 225, ''),
(779, '2024-04-16 16:48:59', NULL, 935, 11, 225, ''),
(780, '2024-04-16 20:10:14', NULL, 936, 1, 225, 'Local order'),
(781, '2024-04-17 16:21:06', NULL, 937, 1, 225, 'Local order'),
(782, '2024-04-17 16:31:43', NULL, 938, 1, 225, 'Local order'),
(783, '2024-04-17 16:37:26', NULL, 939, 1, 225, 'Local order'),
(784, '2024-04-17 16:46:02', NULL, 940, 1, 225, 'Local order'),
(785, '2024-04-17 16:51:00', NULL, 941, 1, 225, 'Local order'),
(786, '2024-04-17 17:21:19', NULL, 941, 3, 225, ''),
(787, '2024-04-17 19:55:32', NULL, 942, 1, 225, 'Local order'),
(788, '2024-04-18 14:26:16', NULL, 943, 1, 225, 'Local order'),
(789, '2024-04-18 14:28:37', NULL, 944, 1, 225, 'Local order'),
(790, '2024-04-18 14:39:03', NULL, 945, 1, 225, 'Local order'),
(791, '2024-04-18 14:41:42', NULL, 946, 1, 225, 'Local order'),
(792, '2024-04-18 16:04:31', NULL, 947, 1, 225, 'Local order'),
(793, '2024-04-18 16:23:36', NULL, 948, 1, 225, 'Local order'),
(794, '2024-04-18 16:30:45', NULL, 949, 1, 225, 'Local order'),
(795, '2024-04-18 16:31:50', NULL, 949, 3, 225, ''),
(796, '2024-04-18 16:32:16', NULL, 949, 5, 225, ''),
(797, '2024-04-18 16:32:43', NULL, 949, 7, 225, ''),
(798, '2024-04-18 16:32:59', NULL, 949, 11, 225, ''),
(799, '2024-04-18 19:16:19', NULL, 948, 3, 225, ''),
(800, '2024-04-18 19:16:23', NULL, 947, 3, 225, ''),
(801, '2024-04-18 19:16:26', NULL, 948, 5, 225, ''),
(802, '2024-04-18 16:06:59', NULL, 950, 1, 225, 'Local order'),
(803, '2024-04-19 05:25:53', NULL, 951, 1, 225, 'Local order'),
(804, '2024-04-21 06:07:01', NULL, 952, 1, 225, 'Local order'),
(805, '2024-04-21 06:23:33', NULL, 953, 1, 225, 'Local order'),
(806, '2024-04-21 06:27:11', NULL, 954, 1, 225, 'Local order'),
(807, '2024-04-21 06:42:50', NULL, 955, 1, 225, 'Local order'),
(808, '2024-04-21 06:45:18', NULL, 956, 1, 225, 'Local order'),
(809, '2024-04-21 11:25:03', NULL, 957, 1, 225, 'Local order'),
(810, '2024-04-21 11:28:40', NULL, 958, 1, 225, 'Local order'),
(811, '2024-04-21 12:08:51', NULL, 959, 1, 225, 'Local order'),
(812, '2024-04-23 10:11:41', NULL, 961, 1, 225, 'Local order'),
(813, '2024-04-24 03:29:17', NULL, 962, 1, 225, 'Local order'),
(814, '2024-04-24 03:30:09', NULL, 963, 1, 225, 'Local order'),
(815, '2024-04-24 04:01:35', NULL, 964, 1, 225, 'Local order'),
(816, '2024-04-24 10:15:29', NULL, 967, 1, 225, 'Local order'),
(817, '2024-04-24 10:20:23', NULL, 968, 1, 225, 'Local order'),
(818, '2024-04-24 10:37:06', NULL, 969, 1, 225, 'Local order'),
(819, '2024-04-24 10:39:55', NULL, 970, 1, 225, 'Local order'),
(820, '2024-04-24 10:40:49', NULL, 971, 1, 225, 'Local order'),
(821, '2024-04-25 04:11:28', NULL, 972, 1, 225, 'Local order'),
(822, '2024-04-25 04:12:27', NULL, 973, 1, 225, 'Local order'),
(823, '2024-04-29 07:08:27', NULL, 974, 1, 225, 'Local order');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `showAsLink` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `created_at`, `updated_at`, `title`, `content`, `showAsLink`) VALUES
(1, '2023-06-27 14:42:17', '2024-04-12 19:46:56', 'Terms and conditions', '<h2><strong>Terms and Conditions</strong></h2>\r\n\r\n<p>Welcome to emenusolutions!</p>\r\n\r\n<p>These terms and conditions outline the rules and regulations for the use of Emenu Solutions&#39;s Website, located at https://emenusolutions.com/.</p>\r\n\r\n<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use emenusolutions if you do not agree to take all of the terms and conditions stated on this page.</p>\r\n\r\n<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: &quot;Client&quot;, &quot;You&quot; and &quot;Your&quot; refers to you, the person log on this website and compliant to the Company&#39;s terms and conditions. &quot;The Company&quot;, &quot;Ourselves&quot;, &quot;We&quot;, &quot;Our&quot; and &quot;Us&quot;, refers to our Company. &quot;Party&quot;, &quot;Parties&quot;, or &quot;Us&quot;, refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client&#39;s needs in respect of provision of the Company&#39;s stated services, in accordance with and subject to, prevailing law of af. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>\r\n\r\n<h3><strong>Cookies</strong></h3>\r\n\r\n<p>We employ the use of cookies. By accessing emenusolutions, you agreed to use cookies in agreement with the Emenu Solutions&#39;s Privacy Policy.</p>\r\n\r\n<p>Most interactive websites use cookies to let us retrieve the user&#39;s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>\r\n\r\n<h3><strong>License</strong></h3>\r\n\r\n<p>Unless otherwise stated, Emenu Solutions and/or its licensors own the intellectual property rights for all material on emenusolutions. All intellectual property rights are reserved. You may access this from emenusolutions for your own personal use subjected to restrictions set in these terms and conditions.</p>\r\n\r\n<p>You must not:</p>\r\n\r\n<ul>\r\n	<li>Republish material from emenusolutions</li>\r\n	<li>Sell, rent or sub-license material from emenusolutions</li>\r\n	<li>Reproduce, duplicate or copy material from emenusolutions</li>\r\n	<li>Redistribute content from emenusolutions</li>\r\n</ul>\r\n\r\n<p>This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the&nbsp;<a href=\"https://www.termsandconditionsgenerator.com/\">Free Terms and Conditions Generator</a>.</p>\r\n\r\n<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Emenu Solutions does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Emenu Solutions,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Emenu Solutions shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>\r\n\r\n<p>Emenu Solutions reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>\r\n\r\n<p>You warrant and represent that:</p>\r\n\r\n<ul>\r\n	<li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>\r\n	<li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>\r\n	<li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>\r\n	<li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>\r\n</ul>\r\n\r\n<p>You hereby grant Emenu Solutions a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>\r\n\r\n<h3><strong>Hyperlinking to our Content</strong></h3>\r\n\r\n<p>The following organizations may link to our Website without prior written approval:</p>\r\n\r\n<ul>\r\n	<li>Government agencies;</li>\r\n	<li>Search engines;</li>\r\n	<li>News organizations;</li>\r\n	<li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li>\r\n	<li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li>\r\n</ul>\r\n\r\n<p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party&#39;s site.</p>\r\n\r\n<p>We may consider and approve other link requests from the following types of organizations:</p>\r\n\r\n<ul>\r\n	<li>commonly-known consumer and/or business information sources;</li>\r\n	<li>dot.com community sites;</li>\r\n	<li>associations or other groups representing charities;</li>\r\n	<li>online directory distributors;</li>\r\n	<li>internet portals;</li>\r\n	<li>accounting, law and consulting firms; and</li>\r\n	<li>educational institutions and trade associations.</li>\r\n</ul>\r\n\r\n<p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Emenu Solutions; and (d) the link is in the context of general resource information.</p>\r\n\r\n<p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party&#39;s site.</p>\r\n\r\n<p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Emenu Solutions. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>\r\n\r\n<p>Approved organizations may hyperlink to our Website as follows:</p>\r\n\r\n<ul>\r\n	<li>By use of our corporate name; or</li>\r\n	<li>By use of the uniform resource locator being linked to; or</li>\r\n	<li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party&#39;s site.</li>\r\n</ul>\r\n\r\n<p>No use of Emenu Solutions&#39;s logo or other artwork will be allowed for linking absent a trademark license agreement.</p>\r\n\r\n<h3><strong>iFrames</strong></h3>\r\n\r\n<p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>\r\n\r\n<h3><strong>Content Liability</strong></h3>\r\n\r\n<p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>\r\n\r\n<h3><strong>Reservation of Rights</strong></h3>\r\n\r\n<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it&#39;s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>\r\n\r\n<h3><strong>Removal of links from our website</strong></h3>\r\n\r\n<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>\r\n\r\n<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>\r\n\r\n<h3><strong>Disclaimer</strong></h3>\r\n\r\n<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>\r\n\r\n<ul>\r\n	<li>limit or exclude our or your liability for death or personal injury;</li>\r\n	<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\r\n	<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\r\n	<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\r\n</ul>\r\n\r\n<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>\r\n\r\n<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>', 1),
(2, '2023-06-27 14:42:17', '2023-12-28 21:02:59', 'Privacy Policy', '<h1>Privacy Policy for SAWJ EURL</h1>\r\n\r\n<p>At EMENUSOLUTIONS, accessible from https://emenusolutions.com/, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by EMENUSOLUTIONS and how we use it.</p>\r\n\r\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us. Our Privacy Policy was created with the help of the&nbsp;<a href=\"https://www.generateprivacypolicy.com/\">Privacy Policy Generator</a>.</p>\r\n\r\n<h2>Log Files</h2>\r\n\r\n<p>EMENUSOLUTIONS follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services&#39; analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users&#39; movement on the website, and gathering demographic information.</p>\r\n\r\n<h2>Cookies and Web Beacons</h2>\r\n\r\n<p>Like any other website, EMENUSOLUTIONS uses &quot;cookies&quot;. These cookies are used to store information including visitors&#39; preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users&#39; experience by customizing our web page content based on visitors&#39; browser type and/or other information.</p>\r\n\r\n<h2>Google DoubleClick DART Cookie</h2>\r\n\r\n<p>Google is one of a third-party vendor on our site. It also uses cookies, known as DART cookies, to serve ads to our site visitors based upon their visit to www.website.com and other sites on the internet. However, visitors may choose to decline the use of DART cookies by visiting the Google ad and content network Privacy Policy at the following URL &ndash;&nbsp;<a href=\"https://policies.google.com/technologies/ads\">https://policies.google.com/technologies/ads</a></p>\r\n\r\n<h2>Our Advertising Partners</h2>\r\n\r\n<p>Some of advertisers on our site may use cookies and web beacons. Our advertising partners are listed below. Each of our advertising partners has their own Privacy Policy for their policies on user data. For easier access, we hyperlinked to their Privacy Policies below.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Google</p>\r\n\r\n	<p><a href=\"https://policies.google.com/technologies/ads\">https://policies.google.com/technologies/ads</a></p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Privacy Policies</h2>\r\n\r\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of EMENUSOLUTIONS.</p>\r\n\r\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on EMENUSOLUTIONS, which are sent directly to users&#39; browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.</p>\r\n\r\n<p>Note that EMENUSOLUTIONS has no access to or control over these cookies that are used by third-party advertisers.</p>\r\n\r\n<h2>Third Party Privacy Policies</h2>\r\n\r\n<p>EMENUSOLUTIONS&#39;s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.</p>\r\n\r\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers&#39; respective websites. What Are Cookies?</p>\r\n\r\n<h2>Children&#39;s Information</h2>\r\n\r\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p>\r\n\r\n<p>EMENUSOLUTIONS does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p>\r\n\r\n<h2>Online Privacy Policy Only</h2>\r\n\r\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in EMENUSOLUTIONS. This policy is not applicable to any information collected offline or via channels other than this website.</p>\r\n\r\n<h2>Consent</h2>\r\n\r\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its Terms and Conditions.</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('joel.berchmans@gmail.com', '$2y$10$9GOEjsI0v8A0xsM7ie154.AcMbxD.zRrRGvyOTlOwrPEFfP4yjy.2', '2023-07-06 01:01:41'),
('TashinaAnaya963@yahoo.com', '$2y$10$UYWJjMA5C.57r9tO/v/h2u69u3xi4WnYck0OcctsrP8WKt8npEMj2', '2023-07-25 23:45:02'),
('htonghav@gmail.com', '$2y$10$oaIhmQ1VLWn7ZQVGSSMTDO.p9Y50SQaYZiE9iL8EpfTxhfo/BDxlm', '2023-09-14 17:51:00'),
('sewdarovox@outlook.com', '$2y$10$TvnqezoHRFxT21Podcd5Xe.0tJ/QuOZgU6CocduB0jf60pEckX0ge', '2023-10-21 19:25:22'),
('woxloxiran@outlook.com', '$2y$10$pgLE7A6jS3DDtd5ntRFYeOrwOp3uZcZClC92mHwzJCu18mOLdfYC6', '2023-11-02 13:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `paths`
--

CREATE TABLE `paths` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paths`
--

INSERT INTO `paths` (`id`, `created_at`, `updated_at`, `lat`, `lng`, `user_id`) VALUES
(1, '2024-02-14 21:19:47', '2024-02-14 21:19:47', '47.90880188273869', '33.34572972450693', 159),
(2, '2024-02-15 22:40:34', '2024-02-15 22:40:34', '47.90880188273869', '33.34572972450693', 159);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_histories`
--

INSERT INTO `payment_histories` (`id`, `created_at`, `updated_at`, `user_id`, `payload`) VALUES
(56, '2024-03-18 20:30:44', '2024-03-18 20:30:44', 221, '{\"id\":\"evt_1OvhD5IXaVRnFbguukSYBESe\",\"object\":\"event\",\"api_version\":\"2023-10-16\",\"created\":1710772242,\"data\":{\"object\":{\"id\":\"in_1OvhD2IXaVRnFbgu7urK96K9\",\"object\":\"invoice\",\"account_country\":\"FR\",\"account_name\":\"SAWJ SARL\",\"account_tax_ids\":null,\"amount_due\":2900,\"amount_paid\":2900,\"amount_remaining\":0,\"amount_shipping\":0,\"application\":null,\"application_fee_amount\":null,\"attempt_count\":1,\"attempted\":true,\"auto_advance\":false,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_reason\":\"subscription_create\",\"charge\":\"ch_3OvhD3IXaVRnFbgu1kshomsu\",\"collection_method\":\"charge_automatically\",\"created\":1710772240,\"currency\":\"eur\",\"custom_fields\":null,\"customer\":\"cus_PlDdy69HkV3ESN\",\"customer_address\":null,\"customer_email\":\"ditrahetri@gufum.com\",\"customer_name\":\"ditrahetri\",\"customer_phone\":\"1121132132132132\",\"customer_shipping\":null,\"customer_tax_exempt\":\"none\",\"customer_tax_ids\":[],\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":null,\"discount\":null,\"discounts\":[],\"due_date\":null,\"effective_at\":1710772240,\"ending_balance\":0,\"footer\":null,\"from_invoice\":null,\"hosted_invoice_url\":\"https:\\/\\/invoice.stripe.com\\/i\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9QbERlNG1uNFpPM0paYmNGTG1DeGFFRjJGaWVlT1hoLDEwMTMxMzA0Mw020076DVgKHp?s=ap\",\"invoice_pdf\":\"https:\\/\\/pay.stripe.com\\/invoice\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9QbERlNG1uNFpPM0paYmNGTG1DeGFFRjJGaWVlT1hoLDEwMTMxMzA0Mw020076DVgKHp\\/pdf?s=ap\",\"issuer\":{\"type\":\"self\"},\"last_finalization_error\":null,\"latest_revision\":null,\"lines\":{\"object\":\"list\",\"data\":[{\"id\":\"il_1OvhD2IXaVRnFbgu7CjbMEct\",\"object\":\"line_item\",\"amount\":2900,\"amount_excluding_tax\":2900,\"currency\":\"eur\",\"description\":\"1 \\u00d7 BASIC MONTHLY PLAN (at \\u20ac29.00 \\/ month)\",\"discount_amounts\":[],\"discountable\":true,\"discounts\":[],\"invoice\":\"in_1OvhD2IXaVRnFbgu7urK96K9\",\"livemode\":false,\"metadata\":{\"name\":\"default\"},\"period\":{\"end\":1713450640,\"start\":1710772240},\"plan\":{\"id\":\"price_1OdrsUIXaVRnFbguNqtct33R\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":2900,\"amount_decimal\":\"2900\",\"billing_scheme\":\"per_unit\",\"created\":1706523346,\"currency\":\"eur\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":{\"plan_id\":\"1\"},\"nickname\":null,\"product\":\"prod_PSnTFhzWFA3zs6\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1OdrsUIXaVRnFbguNqtct33R\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1706523346,\"currency\":\"eur\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":{\"plan_id\":\"1\"},\"nickname\":null,\"product\":\"prod_PSnTFhzWFA3zs6\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":2900,\"unit_amount_decimal\":\"2900\"},\"proration\":false,\"proration_details\":{\"credited_items\":null},\"quantity\":1,\"subscription\":\"sub_1OvhD2IXaVRnFbguyn7YEbnX\",\"subscription_item\":\"si_PlDe33VvrJukff\",\"tax_amounts\":[],\"tax_rates\":[],\"type\":\"subscription\",\"unit_amount_excluding_tax\":\"2900\"}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/invoices\\/in_1OvhD2IXaVRnFbgu7urK96K9\\/lines\"},\"livemode\":false,\"metadata\":[],\"next_payment_attempt\":null,\"number\":\"0AC2D6AC-0061\",\"on_behalf_of\":null,\"paid\":true,\"paid_out_of_band\":false,\"payment_intent\":\"pi_3OvhD3IXaVRnFbgu1SzgJaDi\",\"payment_settings\":{\"default_mandate\":null,\"payment_method_options\":{\"acss_debit\":null,\"bancontact\":null,\"card\":{\"request_three_d_secure\":\"automatic\"},\"customer_balance\":null,\"konbini\":null,\"sepa_debit\":null,\"us_bank_account\":null},\"payment_method_types\":null},\"period_end\":1710772240,\"period_start\":1710772240,\"post_payment_credit_notes_amount\":0,\"pre_payment_credit_notes_amount\":0,\"quote\":null,\"receipt_number\":null,\"rendering\":null,\"rendering_options\":null,\"shipping_cost\":null,\"shipping_details\":null,\"starting_balance\":0,\"statement_descriptor\":null,\"status\":\"paid\",\"status_transitions\":{\"finalized_at\":1710772240,\"marked_uncollectible_at\":null,\"paid_at\":1710772242,\"voided_at\":null},\"subscription\":\"sub_1OvhD2IXaVRnFbguyn7YEbnX\",\"subscription_details\":{\"metadata\":{\"name\":\"default\"}},\"subtotal\":2900,\"subtotal_excluding_tax\":2900,\"tax\":null,\"test_clock\":null,\"total\":2900,\"total_discount_amounts\":[],\"total_excluding_tax\":2900,\"total_tax_amounts\":[],\"transfer_data\":null,\"webhooks_delivered_at\":1710772240}},\"livemode\":false,\"pending_webhooks\":1,\"request\":{\"id\":\"req_4tayw4FdwhnDDq\",\"idempotency_key\":\"1ca5f065-5eea-4d71-9da2-772fb6fa8e0e\"},\"type\":\"invoice.payment_succeeded\"}'),
(57, '2024-03-18 21:09:34', '2024-03-18 21:09:34', 222, '{\"id\":\"evt_1OvhogIXaVRnFbgut0o7hRWk\",\"object\":\"event\",\"api_version\":\"2023-10-16\",\"created\":1710774572,\"data\":{\"object\":{\"id\":\"in_1OvhocIXaVRnFbgu5vhQOmiq\",\"object\":\"invoice\",\"account_country\":\"FR\",\"account_name\":\"SAWJ SARL\",\"account_tax_ids\":null,\"amount_due\":50900,\"amount_paid\":50900,\"amount_remaining\":0,\"amount_shipping\":0,\"application\":null,\"application_fee_amount\":null,\"attempt_count\":1,\"attempted\":true,\"auto_advance\":false,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_reason\":\"subscription_create\",\"charge\":\"ch_3OvhodIXaVRnFbgu1jfYw0jN\",\"collection_method\":\"charge_automatically\",\"created\":1710774570,\"currency\":\"eur\",\"custom_fields\":null,\"customer\":\"cus_PlEGZZHVVOR3KY\",\"customer_address\":null,\"customer_email\":\"dsfgfdgs@sdasdafg.com\",\"customer_name\":\"dsfgdfsg\",\"customer_phone\":\"12015550123\",\"customer_shipping\":null,\"customer_tax_exempt\":\"none\",\"customer_tax_ids\":[],\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":null,\"discount\":null,\"discounts\":[],\"due_date\":null,\"effective_at\":1710774570,\"ending_balance\":0,\"footer\":null,\"from_invoice\":null,\"hosted_invoice_url\":\"https:\\/\\/invoice.stripe.com\\/i\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9QbEVIM3BMOGFWQk9PYWRYaUs5YTlGYmN5UFBlamFILDEwMTMxNTM3NA0200NwqiMSH3?s=ap\",\"invoice_pdf\":\"https:\\/\\/pay.stripe.com\\/invoice\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9QbEVIM3BMOGFWQk9PYWRYaUs5YTlGYmN5UFBlamFILDEwMTMxNTM3NA0200NwqiMSH3\\/pdf?s=ap\",\"issuer\":{\"type\":\"self\"},\"last_finalization_error\":null,\"latest_revision\":null,\"lines\":{\"object\":\"list\",\"data\":[{\"id\":\"il_1OvhocIXaVRnFbgurM08YciO\",\"object\":\"line_item\",\"amount\":50900,\"amount_excluding_tax\":50900,\"currency\":\"eur\",\"description\":\"1 \\u00d7 PREMIUM YEARLY PLAN (at \\u20ac509.00 \\/ year)\",\"discount_amounts\":[],\"discountable\":true,\"discounts\":[],\"invoice\":\"in_1OvhocIXaVRnFbgu5vhQOmiq\",\"livemode\":false,\"metadata\":{\"name\":\"default\"},\"period\":{\"end\":1742310570,\"start\":1710774570},\"plan\":{\"id\":\"price_1OewFUIXaVRnFbguD7G5UPlF\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":50900,\"amount_decimal\":\"50900\",\"billing_scheme\":\"per_unit\",\"created\":1706778476,\"currency\":\"eur\",\"interval\":\"year\",\"interval_count\":1,\"livemode\":false,\"metadata\":{\"plan_id\":\"6\"},\"nickname\":null,\"product\":\"prod_PTu3GdfRoYELVQ\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1OewFUIXaVRnFbguD7G5UPlF\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1706778476,\"currency\":\"eur\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":{\"plan_id\":\"6\"},\"nickname\":null,\"product\":\"prod_PTu3GdfRoYELVQ\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"year\",\"interval_count\":1,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":50900,\"unit_amount_decimal\":\"50900\"},\"proration\":false,\"proration_details\":{\"credited_items\":null},\"quantity\":1,\"subscription\":\"sub_1OvhocIXaVRnFbguqGdJ52T1\",\"subscription_item\":\"si_PlEHdNkKPLZr6C\",\"tax_amounts\":[],\"tax_rates\":[],\"type\":\"subscription\",\"unit_amount_excluding_tax\":\"50900\"}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/invoices\\/in_1OvhocIXaVRnFbgu5vhQOmiq\\/lines\"},\"livemode\":false,\"metadata\":[],\"next_payment_attempt\":null,\"number\":\"0AC2D6AC-0062\",\"on_behalf_of\":null,\"paid\":true,\"paid_out_of_band\":false,\"payment_intent\":\"pi_3OvhodIXaVRnFbgu1Uk9SM1N\",\"payment_settings\":{\"default_mandate\":null,\"payment_method_options\":{\"acss_debit\":null,\"bancontact\":null,\"card\":{\"request_three_d_secure\":\"automatic\"},\"customer_balance\":null,\"konbini\":null,\"sepa_debit\":null,\"us_bank_account\":null},\"payment_method_types\":null},\"period_end\":1710774570,\"period_start\":1710774570,\"post_payment_credit_notes_amount\":0,\"pre_payment_credit_notes_amount\":0,\"quote\":null,\"receipt_number\":null,\"rendering\":null,\"rendering_options\":null,\"shipping_cost\":null,\"shipping_details\":null,\"starting_balance\":0,\"statement_descriptor\":null,\"status\":\"paid\",\"status_transitions\":{\"finalized_at\":1710774570,\"marked_uncollectible_at\":null,\"paid_at\":1710774572,\"voided_at\":null},\"subscription\":\"sub_1OvhocIXaVRnFbguqGdJ52T1\",\"subscription_details\":{\"metadata\":{\"name\":\"default\"}},\"subtotal\":50900,\"subtotal_excluding_tax\":50900,\"tax\":null,\"test_clock\":null,\"total\":50900,\"total_discount_amounts\":[],\"total_excluding_tax\":50900,\"total_tax_amounts\":[],\"transfer_data\":null,\"webhooks_delivered_at\":1710774570}},\"livemode\":false,\"pending_webhooks\":1,\"request\":{\"id\":\"req_6bXbyZCFXWrz3u\",\"idempotency_key\":\"3e1b1f4b-9987-4d68-8d8b-b1fcae94e41a\"},\"type\":\"invoice.payment_succeeded\"}'),
(58, '2024-03-18 21:47:36', '2024-03-18 21:47:36', 223, '{\"id\":\"evt_1OviPTIXaVRnFbguZJseewYG\",\"object\":\"event\",\"api_version\":\"2023-10-16\",\"created\":1710776854,\"data\":{\"object\":{\"id\":\"in_1OviPQIXaVRnFbgueB8BLpn1\",\"object\":\"invoice\",\"account_country\":\"FR\",\"account_name\":\"SAWJ SARL\",\"account_tax_ids\":null,\"amount_due\":4900,\"amount_paid\":4900,\"amount_remaining\":0,\"amount_shipping\":0,\"application\":null,\"application_fee_amount\":null,\"attempt_count\":1,\"attempted\":true,\"auto_advance\":false,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_reason\":\"subscription_create\",\"charge\":\"ch_3OviPQIXaVRnFbgu0ai0UMpw\",\"collection_method\":\"charge_automatically\",\"created\":1710776852,\"currency\":\"eur\",\"custom_fields\":null,\"customer\":\"cus_PlEsar5qXB2bx3\",\"customer_address\":null,\"customer_email\":\"fdsgfs@fdgsdgf.com\",\"customer_name\":\"dfgssdfggfds\",\"customer_phone\":\"12015550123\",\"customer_shipping\":null,\"customer_tax_exempt\":\"none\",\"customer_tax_ids\":[],\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":null,\"discount\":null,\"discounts\":[],\"due_date\":null,\"effective_at\":1710776852,\"ending_balance\":0,\"footer\":null,\"from_invoice\":null,\"hosted_invoice_url\":\"https:\\/\\/invoice.stripe.com\\/i\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9QbEV0V095bWZ2UkI5OVJGVU96NlNadlFNT3FwTTk0LDEwMTMxNzY1NQ02002nXTLojS?s=ap\",\"invoice_pdf\":\"https:\\/\\/pay.stripe.com\\/invoice\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9QbEV0V095bWZ2UkI5OVJGVU96NlNadlFNT3FwTTk0LDEwMTMxNzY1NQ02002nXTLojS\\/pdf?s=ap\",\"issuer\":{\"type\":\"self\"},\"last_finalization_error\":null,\"latest_revision\":null,\"lines\":{\"object\":\"list\",\"data\":[{\"id\":\"il_1OviPQIXaVRnFbguqpFEkLpL\",\"object\":\"line_item\",\"amount\":4900,\"amount_excluding_tax\":4900,\"currency\":\"eur\",\"description\":\"1 \\u00d7 PREMIUM MONTHLY PLAN (at \\u20ac49.00 \\/ month)\",\"discount_amounts\":[],\"discountable\":true,\"discounts\":[],\"invoice\":\"in_1OviPQIXaVRnFbgueB8BLpn1\",\"livemode\":false,\"metadata\":{\"name\":\"default\"},\"period\":{\"end\":1713455252,\"start\":1710776852},\"plan\":{\"id\":\"price_1OdvsDIXaVRnFbguhg5UDmVx\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":4900,\"amount_decimal\":\"4900\",\"billing_scheme\":\"per_unit\",\"created\":1706538705,\"currency\":\"eur\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":{\"plan_id\":\"5\"},\"nickname\":null,\"product\":\"prod_PSrbXRQBYbw5Qv\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1OdvsDIXaVRnFbguhg5UDmVx\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1706538705,\"currency\":\"eur\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":{\"plan_id\":\"5\"},\"nickname\":null,\"product\":\"prod_PSrbXRQBYbw5Qv\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":4900,\"unit_amount_decimal\":\"4900\"},\"proration\":false,\"proration_details\":{\"credited_items\":null},\"quantity\":1,\"subscription\":\"sub_1OviPQIXaVRnFbguVhvXVMwV\",\"subscription_item\":\"si_PlEtsNIASrVBRY\",\"tax_amounts\":[],\"tax_rates\":[],\"type\":\"subscription\",\"unit_amount_excluding_tax\":\"4900\"}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/invoices\\/in_1OviPQIXaVRnFbgueB8BLpn1\\/lines\"},\"livemode\":false,\"metadata\":[],\"next_payment_attempt\":null,\"number\":\"0AC2D6AC-0063\",\"on_behalf_of\":null,\"paid\":true,\"paid_out_of_band\":false,\"payment_intent\":\"pi_3OviPQIXaVRnFbgu0XhdyEm8\",\"payment_settings\":{\"default_mandate\":null,\"payment_method_options\":{\"acss_debit\":null,\"bancontact\":null,\"card\":{\"request_three_d_secure\":\"automatic\"},\"customer_balance\":null,\"konbini\":null,\"sepa_debit\":null,\"us_bank_account\":null},\"payment_method_types\":null},\"period_end\":1710776852,\"period_start\":1710776852,\"post_payment_credit_notes_amount\":0,\"pre_payment_credit_notes_amount\":0,\"quote\":null,\"receipt_number\":null,\"rendering\":null,\"rendering_options\":null,\"shipping_cost\":null,\"shipping_details\":null,\"starting_balance\":0,\"statement_descriptor\":null,\"status\":\"paid\",\"status_transitions\":{\"finalized_at\":1710776852,\"marked_uncollectible_at\":null,\"paid_at\":1710776854,\"voided_at\":null},\"subscription\":\"sub_1OviPQIXaVRnFbguVhvXVMwV\",\"subscription_details\":{\"metadata\":{\"name\":\"default\"}},\"subtotal\":4900,\"subtotal_excluding_tax\":4900,\"tax\":null,\"test_clock\":null,\"total\":4900,\"total_discount_amounts\":[],\"total_excluding_tax\":4900,\"total_tax_amounts\":[],\"transfer_data\":null,\"webhooks_delivered_at\":1710776852}},\"livemode\":false,\"pending_webhooks\":1,\"request\":{\"id\":\"req_GGiK27xdKdx4Rb\",\"idempotency_key\":\"458121cf-275d-42e3-9508-a2bd4500cd14\"},\"type\":\"invoice.payment_succeeded\"}'),
(59, '2024-03-18 22:32:28', '2024-03-18 22:32:28', 225, '{\"id\":\"evt_1Ovj6tIXaVRnFbguA1u1Lt9r\",\"object\":\"event\",\"api_version\":\"2020-08-27\",\"created\":1710779546,\"data\":{\"object\":{\"id\":\"in_1Ovj6BIXaVRnFbgu6IgB6Ef5\",\"object\":\"invoice\",\"account_country\":\"FR\",\"account_name\":\"SAWJ SARL\",\"account_tax_ids\":null,\"amount_due\":1225,\"amount_paid\":1225,\"amount_remaining\":0,\"amount_shipping\":0,\"application\":null,\"application_fee_amount\":null,\"attempt_count\":1,\"attempted\":true,\"auto_advance\":false,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_reason\":\"subscription_create\",\"charge\":\"ch_3Ovj6BIXaVRnFbgu0M85ytvN\",\"collection_method\":\"charge_automatically\",\"created\":1710779503,\"currency\":\"eur\",\"custom_fields\":null,\"customer\":\"cus_PlFaTOXDGc43NN\",\"customer_address\":null,\"customer_email\":\"contact@lanka-food.com\",\"customer_name\":\"Piyathas\",\"customer_phone\":\"1769016306\",\"customer_shipping\":null,\"customer_tax_exempt\":\"none\",\"customer_tax_ids\":[],\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":null,\"discount\":{\"id\":\"di_1Ovj6BIXaVRnFbguDpXBoISg\",\"object\":\"discount\",\"checkout_session\":null,\"coupon\":{\"id\":\"DVx1KAyz\",\"object\":\"coupon\",\"amount_off\":null,\"created\":1710779026,\"currency\":null,\"duration\":\"forever\",\"duration_in_months\":null,\"livemode\":true,\"max_redemptions\":null,\"metadata\":{\"coupon_id\":\"11\"},\"name\":null,\"percent_off\":75,\"redeem_by\":null,\"times_redeemed\":1,\"valid\":true},\"customer\":\"cus_PlFaTOXDGc43NN\",\"end\":null,\"invoice\":null,\"invoice_item\":null,\"promotion_code\":null,\"start\":1710779503,\"subscription\":\"sub_1Ovj6BIXaVRnFbguXKfYLCRs\"},\"discounts\":[\"di_1Ovj6BIXaVRnFbguDpXBoISg\"],\"due_date\":null,\"effective_at\":1710779503,\"ending_balance\":0,\"footer\":null,\"from_invoice\":null,\"hosted_invoice_url\":\"https:\\/\\/invoice.stripe.com\\/i\\/acct_1OcU54IXaVRnFbgu\\/live_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9QbEZiVmtNeGNzYXhEdktWZVN2TUFVdWpQS1VhTnJILDEwMTMyMDM0Nw0200wPPrsqZv?s=ap\",\"invoice_pdf\":\"https:\\/\\/pay.stripe.com\\/invoice\\/acct_1OcU54IXaVRnFbgu\\/live_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9QbEZiVmtNeGNzYXhEdktWZVN2TUFVdWpQS1VhTnJILDEwMTMyMDM0Nw0200wPPrsqZv\\/pdf?s=ap\",\"issuer\":{\"type\":\"self\"},\"last_finalization_error\":null,\"latest_revision\":null,\"lines\":{\"object\":\"list\",\"data\":[{\"id\":\"il_1Ovj6BIXaVRnFbguRBsL8ibH\",\"object\":\"line_item\",\"amount\":4900,\"amount_excluding_tax\":4900,\"currency\":\"eur\",\"description\":\"1 \\u00d7 PREMIUM MONTHLY PLAN (at \\u20ac49.00 \\/ month)\",\"discount_amounts\":[{\"amount\":3675,\"discount\":\"di_1Ovj6BIXaVRnFbguDpXBoISg\"}],\"discountable\":true,\"discounts\":[],\"invoice\":\"in_1Ovj6BIXaVRnFbgu6IgB6Ef5\",\"livemode\":true,\"metadata\":{\"name\":\"default\"},\"period\":{\"end\":1713457903,\"start\":1710779503},\"plan\":{\"id\":\"price_1Ovj52IXaVRnFbguy0lTD0ug\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":4900,\"amount_decimal\":\"4900\",\"billing_scheme\":\"per_unit\",\"created\":1710779432,\"currency\":\"eur\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":true,\"metadata\":{\"plan_id\":\"5\"},\"nickname\":null,\"product\":\"prod_PlFaNRCUmJxuwc\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1Ovj52IXaVRnFbguy0lTD0ug\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1710779432,\"currency\":\"eur\",\"custom_unit_amount\":null,\"livemode\":true,\"lookup_key\":null,\"metadata\":{\"plan_id\":\"5\"},\"nickname\":null,\"product\":\"prod_PlFaNRCUmJxuwc\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":4900,\"unit_amount_decimal\":\"4900\"},\"proration\":false,\"proration_details\":{\"credited_items\":null},\"quantity\":1,\"subscription\":\"sub_1Ovj6BIXaVRnFbguXKfYLCRs\",\"subscription_item\":\"si_PlFb7ecIrNVa5l\",\"tax_amounts\":[],\"tax_rates\":[],\"type\":\"subscription\",\"unit_amount_excluding_tax\":\"4900\"}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/invoices\\/in_1Ovj6BIXaVRnFbgu6IgB6Ef5\\/lines\"},\"livemode\":true,\"metadata\":[],\"next_payment_attempt\":null,\"number\":\"0AC2D6AC-0001\",\"on_behalf_of\":null,\"paid\":true,\"paid_out_of_band\":false,\"payment_intent\":\"pi_3Ovj6BIXaVRnFbgu0rGWTVtX\",\"payment_settings\":{\"default_mandate\":null,\"payment_method_options\":{\"acss_debit\":null,\"bancontact\":null,\"card\":{\"request_three_d_secure\":\"automatic\"},\"customer_balance\":null,\"konbini\":null,\"sepa_debit\":null,\"us_bank_account\":null},\"payment_method_types\":null},\"period_end\":1710779503,\"period_start\":1710779503,\"post_payment_credit_notes_amount\":0,\"pre_payment_credit_notes_amount\":0,\"quote\":null,\"receipt_number\":null,\"rendering\":null,\"rendering_options\":null,\"shipping_cost\":null,\"shipping_details\":null,\"starting_balance\":0,\"statement_descriptor\":null,\"status\":\"paid\",\"status_transitions\":{\"finalized_at\":1710779503,\"marked_uncollectible_at\":null,\"paid_at\":1710779546,\"voided_at\":null},\"subscription\":\"sub_1Ovj6BIXaVRnFbguXKfYLCRs\",\"subscription_details\":{\"metadata\":{\"name\":\"default\"}},\"subtotal\":4900,\"subtotal_excluding_tax\":4900,\"tax\":null,\"test_clock\":null,\"total\":1225,\"total_discount_amounts\":[{\"amount\":3675,\"discount\":\"di_1Ovj6BIXaVRnFbguDpXBoISg\"}],\"total_excluding_tax\":1225,\"total_tax_amounts\":[],\"transfer_data\":null,\"webhooks_delivered_at\":1710779503}},\"livemode\":true,\"pending_webhooks\":1,\"request\":{\"id\":null,\"idempotency_key\":\"pi_3Ovj6BIXaVRnFbgu0rGWTVtX-payatt_3Ovj6BIXaVRnFbgu0vw9iKZn\"},\"type\":\"invoice.payment_succeeded\"}'),
(60, '2024-04-18 22:31:57', '2024-04-18 22:31:57', 221, '{\"id\":\"evt_1P6wwLIXaVRnFbgu0zK73ke9\",\"object\":\"event\",\"api_version\":\"2023-10-16\",\"created\":1713454317,\"data\":{\"object\":{\"id\":\"in_1P6vzdIXaVRnFbgue0ecrEOm\",\"object\":\"invoice\",\"account_country\":\"FR\",\"account_name\":\"Emenusolutions.com\",\"account_tax_ids\":null,\"amount_due\":2900,\"amount_paid\":2900,\"amount_remaining\":0,\"amount_shipping\":0,\"application\":null,\"application_fee_amount\":null,\"attempt_count\":1,\"attempted\":true,\"auto_advance\":false,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_reason\":\"subscription_cycle\",\"charge\":\"ch_3P6wwJIXaVRnFbgu03mVDj8l\",\"collection_method\":\"charge_automatically\",\"created\":1713450678,\"currency\":\"eur\",\"custom_fields\":null,\"customer\":\"cus_PlDdy69HkV3ESN\",\"customer_address\":null,\"customer_email\":\"ditrahetri@gufum.com\",\"customer_name\":\"ditrahetri\",\"customer_phone\":\"1121132132132132\",\"customer_shipping\":null,\"customer_tax_exempt\":\"none\",\"customer_tax_ids\":[],\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":\"Thank you for choosing Emenusolutions!\",\"discount\":null,\"discounts\":[],\"due_date\":null,\"effective_at\":1713454314,\"ending_balance\":0,\"footer\":\"SAWJ EURL trading as emenusolutions.com \",\"from_invoice\":null,\"hosted_invoice_url\":\"https:\\/\\/invoice.stripe.com\\/i\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9Qd3BlR0FTV0xYM284NVh3cGFpeTUzQzhjYU5ESzF1LDEwMzk5NTExNw0200okVHnJw3?s=ap\",\"invoice_pdf\":\"https:\\/\\/pay.stripe.com\\/invoice\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9Qd3BlR0FTV0xYM284NVh3cGFpeTUzQzhjYU5ESzF1LDEwMzk5NTExNw0200okVHnJw3\\/pdf?s=ap\",\"issuer\":{\"type\":\"self\"},\"last_finalization_error\":null,\"latest_revision\":null,\"lines\":{\"object\":\"list\",\"data\":[{\"id\":\"il_1P6vzdIXaVRnFbgu7LjdpSVw\",\"object\":\"line_item\",\"amount\":2900,\"amount_excluding_tax\":2900,\"currency\":\"eur\",\"description\":\"1 \\u00d7 BASIC MONTHLY PLAN (at \\u20ac29.00 \\/ month)\",\"discount_amounts\":[],\"discountable\":true,\"discounts\":[],\"invoice\":\"in_1P6vzdIXaVRnFbgue0ecrEOm\",\"livemode\":false,\"metadata\":{\"name\":\"default\"},\"period\":{\"end\":1716042640,\"start\":1713450640},\"plan\":{\"id\":\"price_1OdrsUIXaVRnFbguNqtct33R\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":2900,\"amount_decimal\":\"2900\",\"billing_scheme\":\"per_unit\",\"created\":1706523346,\"currency\":\"eur\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":{\"plan_id\":\"1\"},\"nickname\":null,\"product\":\"prod_PSnTFhzWFA3zs6\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1OdrsUIXaVRnFbguNqtct33R\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1706523346,\"currency\":\"eur\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":{\"plan_id\":\"1\"},\"nickname\":null,\"product\":\"prod_PSnTFhzWFA3zs6\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":2900,\"unit_amount_decimal\":\"2900\"},\"proration\":false,\"proration_details\":{\"credited_items\":null},\"quantity\":1,\"subscription\":\"sub_1OvhD2IXaVRnFbguyn7YEbnX\",\"subscription_item\":\"si_PlDe33VvrJukff\",\"tax_amounts\":[],\"tax_rates\":[],\"type\":\"subscription\",\"unit_amount_excluding_tax\":\"2900\"}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/invoices\\/in_1P6vzdIXaVRnFbgue0ecrEOm\\/lines\"},\"livemode\":false,\"metadata\":[],\"next_payment_attempt\":null,\"number\":\"0AC2D6AC-0086\",\"on_behalf_of\":null,\"paid\":true,\"paid_out_of_band\":false,\"payment_intent\":\"pi_3P6wwJIXaVRnFbgu0j01Kedu\",\"payment_settings\":{\"default_mandate\":null,\"payment_method_options\":{\"acss_debit\":null,\"bancontact\":null,\"card\":{\"request_three_d_secure\":\"automatic\"},\"customer_balance\":null,\"konbini\":null,\"sepa_debit\":null,\"us_bank_account\":null},\"payment_method_types\":null},\"period_end\":1713450640,\"period_start\":1710772240,\"post_payment_credit_notes_amount\":0,\"pre_payment_credit_notes_amount\":0,\"quote\":null,\"receipt_number\":null,\"rendering\":{\"amount_tax_display\":\"include_inclusive_tax\",\"pdf\":null},\"rendering_options\":{\"amount_tax_display\":\"include_inclusive_tax\"},\"shipping_cost\":null,\"shipping_details\":null,\"starting_balance\":0,\"statement_descriptor\":null,\"status\":\"paid\",\"status_transitions\":{\"finalized_at\":1713454314,\"marked_uncollectible_at\":null,\"paid_at\":1713454314,\"voided_at\":null},\"subscription\":\"sub_1OvhD2IXaVRnFbguyn7YEbnX\",\"subscription_details\":{\"metadata\":{\"name\":\"default\"}},\"subtotal\":2900,\"subtotal_excluding_tax\":2900,\"tax\":null,\"test_clock\":null,\"total\":2900,\"total_discount_amounts\":[],\"total_excluding_tax\":2900,\"total_tax_amounts\":[],\"transfer_data\":null,\"webhooks_delivered_at\":1713450678}},\"livemode\":false,\"pending_webhooks\":1,\"request\":{\"id\":null,\"idempotency_key\":null},\"type\":\"invoice.payment_succeeded\"}'),
(61, '2024-04-18 23:48:59', '2024-04-18 23:48:59', 223, '{\"id\":\"evt_1P6y8tIXaVRnFbguiCeXZmxQ\",\"object\":\"event\",\"api_version\":\"2023-10-16\",\"created\":1713458939,\"data\":{\"object\":{\"id\":\"in_1P6xCcIXaVRnFbgu4KRoO9ZQ\",\"object\":\"invoice\",\"account_country\":\"FR\",\"account_name\":\"Emenusolutions.com\",\"account_tax_ids\":null,\"amount_due\":4900,\"amount_paid\":4900,\"amount_remaining\":0,\"amount_shipping\":0,\"application\":null,\"application_fee_amount\":null,\"attempt_count\":1,\"attempted\":true,\"auto_advance\":false,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_reason\":\"subscription_cycle\",\"charge\":\"ch_3P6y8rIXaVRnFbgu1EXT0qr3\",\"collection_method\":\"charge_automatically\",\"created\":1713455326,\"currency\":\"eur\",\"custom_fields\":null,\"customer\":\"cus_PlEsar5qXB2bx3\",\"customer_address\":null,\"customer_email\":\"fdsgfs@fdgsdgf.com\",\"customer_name\":\"dfgssdfggfds\",\"customer_phone\":\"12015550123\",\"customer_shipping\":null,\"customer_tax_exempt\":\"none\",\"customer_tax_ids\":[],\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":\"Thank you for choosing Emenusolutions!\",\"discount\":null,\"discounts\":[],\"due_date\":null,\"effective_at\":1713458936,\"ending_balance\":0,\"footer\":\"SAWJ EURL trading as emenusolutions.com \",\"from_invoice\":null,\"hosted_invoice_url\":\"https:\\/\\/invoice.stripe.com\\/i\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9Qd3F1UHg1WXNPeEVGRkxjR2VPUjYwTEdYY05LcmlKLDEwMzk5OTczOQ0200rf46kjKW?s=ap\",\"invoice_pdf\":\"https:\\/\\/pay.stripe.com\\/invoice\\/acct_1OcU54IXaVRnFbgu\\/test_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9Qd3F1UHg1WXNPeEVGRkxjR2VPUjYwTEdYY05LcmlKLDEwMzk5OTczOQ0200rf46kjKW\\/pdf?s=ap\",\"issuer\":{\"type\":\"self\"},\"last_finalization_error\":null,\"latest_revision\":null,\"lines\":{\"object\":\"list\",\"data\":[{\"id\":\"il_1P6xCcIXaVRnFbguVkIuu4yv\",\"object\":\"line_item\",\"amount\":4900,\"amount_excluding_tax\":4900,\"currency\":\"eur\",\"description\":\"1 \\u00d7 PREMIUM MONTHLY PLAN (at \\u20ac49.00 \\/ month)\",\"discount_amounts\":[],\"discountable\":true,\"discounts\":[],\"invoice\":\"in_1P6xCcIXaVRnFbgu4KRoO9ZQ\",\"livemode\":false,\"metadata\":{\"name\":\"default\"},\"period\":{\"end\":1716047252,\"start\":1713455252},\"plan\":{\"id\":\"price_1OdvsDIXaVRnFbguhg5UDmVx\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":4900,\"amount_decimal\":\"4900\",\"billing_scheme\":\"per_unit\",\"created\":1706538705,\"currency\":\"eur\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":{\"plan_id\":\"5\"},\"nickname\":null,\"product\":\"prod_PSrbXRQBYbw5Qv\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1OdvsDIXaVRnFbguhg5UDmVx\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1706538705,\"currency\":\"eur\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":{\"plan_id\":\"5\"},\"nickname\":null,\"product\":\"prod_PSrbXRQBYbw5Qv\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":4900,\"unit_amount_decimal\":\"4900\"},\"proration\":false,\"proration_details\":{\"credited_items\":null},\"quantity\":1,\"subscription\":\"sub_1OviPQIXaVRnFbguVhvXVMwV\",\"subscription_item\":\"si_PlEtsNIASrVBRY\",\"tax_amounts\":[],\"tax_rates\":[],\"type\":\"subscription\",\"unit_amount_excluding_tax\":\"4900\"}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/invoices\\/in_1P6xCcIXaVRnFbgu4KRoO9ZQ\\/lines\"},\"livemode\":false,\"metadata\":[],\"next_payment_attempt\":null,\"number\":\"0AC2D6AC-0087\",\"on_behalf_of\":null,\"paid\":true,\"paid_out_of_band\":false,\"payment_intent\":\"pi_3P6y8rIXaVRnFbgu1Z3GS3xH\",\"payment_settings\":{\"default_mandate\":null,\"payment_method_options\":{\"acss_debit\":null,\"bancontact\":null,\"card\":{\"request_three_d_secure\":\"automatic\"},\"customer_balance\":null,\"konbini\":null,\"sepa_debit\":null,\"us_bank_account\":null},\"payment_method_types\":null},\"period_end\":1713455252,\"period_start\":1710776852,\"post_payment_credit_notes_amount\":0,\"pre_payment_credit_notes_amount\":0,\"quote\":null,\"receipt_number\":null,\"rendering\":{\"amount_tax_display\":\"include_inclusive_tax\",\"pdf\":null},\"rendering_options\":{\"amount_tax_display\":\"include_inclusive_tax\"},\"shipping_cost\":null,\"shipping_details\":null,\"starting_balance\":0,\"statement_descriptor\":null,\"status\":\"paid\",\"status_transitions\":{\"finalized_at\":1713458936,\"marked_uncollectible_at\":null,\"paid_at\":1713458936,\"voided_at\":null},\"subscription\":\"sub_1OviPQIXaVRnFbguVhvXVMwV\",\"subscription_details\":{\"metadata\":{\"name\":\"default\"}},\"subtotal\":4900,\"subtotal_excluding_tax\":4900,\"tax\":null,\"test_clock\":null,\"total\":4900,\"total_discount_amounts\":[],\"total_excluding_tax\":4900,\"total_tax_amounts\":[],\"transfer_data\":null,\"webhooks_delivered_at\":1713455326}},\"livemode\":false,\"pending_webhooks\":1,\"request\":{\"id\":null,\"idempotency_key\":null},\"type\":\"invoice.payment_succeeded\"}'),
(62, '2024-04-19 00:33:16', '2024-04-19 00:33:16', 225, '{\"id\":\"evt_1P6ypjIXaVRnFbguUQB8BybI\",\"object\":\"event\",\"api_version\":\"2020-08-27\",\"created\":1713461595,\"data\":{\"object\":{\"id\":\"in_1P6xsnIXaVRnFbguXkNskmAc\",\"object\":\"invoice\",\"account_country\":\"FR\",\"account_name\":\"Emenusolutions.com\",\"account_tax_ids\":null,\"amount_due\":4900,\"amount_paid\":4900,\"amount_remaining\":0,\"amount_shipping\":0,\"application\":null,\"application_fee_amount\":null,\"attempt_count\":1,\"attempted\":true,\"auto_advance\":false,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_reason\":\"subscription_cycle\",\"charge\":\"ch_3P6ypgIXaVRnFbgu0VT8xsHK\",\"collection_method\":\"charge_automatically\",\"created\":1713457941,\"currency\":\"eur\",\"custom_fields\":null,\"customer\":\"cus_PlFaTOXDGc43NN\",\"customer_address\":null,\"customer_email\":\"contact@lanka-food.com\",\"customer_name\":\"Piyathas\",\"customer_phone\":\"1769016306\",\"customer_shipping\":null,\"customer_tax_exempt\":\"none\",\"customer_tax_ids\":[],\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":\"Thank you for choosing Emenusolutions!\",\"discount\":null,\"discounts\":[],\"due_date\":null,\"effective_at\":1713461591,\"ending_balance\":0,\"footer\":\"SAWJ EURL trading as emenusolutions.com \",\"from_invoice\":null,\"hosted_invoice_url\":\"https:\\/\\/invoice.stripe.com\\/i\\/acct_1OcU54IXaVRnFbgu\\/live_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9Qd3JjdTFHZnJ6M2hjZHdGWk9vZHJCS3A4NFhBU3hHLDEwNDAwMjM5NQ0200LDRecNov?s=ap\",\"invoice_pdf\":\"https:\\/\\/pay.stripe.com\\/invoice\\/acct_1OcU54IXaVRnFbgu\\/live_YWNjdF8xT2NVNTRJWGFWUm5GYmd1LF9Qd3JjdTFHZnJ6M2hjZHdGWk9vZHJCS3A4NFhBU3hHLDEwNDAwMjM5NQ0200LDRecNov\\/pdf?s=ap\",\"issuer\":{\"type\":\"self\"},\"last_finalization_error\":null,\"latest_revision\":null,\"lines\":{\"object\":\"list\",\"data\":[{\"id\":\"il_1P6xsnIXaVRnFbguhlJJqPRQ\",\"object\":\"line_item\",\"amount\":4900,\"amount_excluding_tax\":4900,\"currency\":\"eur\",\"description\":\"1 \\u00d7 PREMIUM MONTHLY PLAN (at \\u20ac49.00 \\/ month)\",\"discount_amounts\":[],\"discountable\":true,\"discounts\":[],\"invoice\":\"in_1P6xsnIXaVRnFbguXkNskmAc\",\"livemode\":true,\"metadata\":{\"name\":\"default\"},\"period\":{\"end\":1716049903,\"start\":1713457903},\"plan\":{\"id\":\"price_1Ovj52IXaVRnFbguy0lTD0ug\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":4900,\"amount_decimal\":\"4900\",\"billing_scheme\":\"per_unit\",\"created\":1710779432,\"currency\":\"eur\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":true,\"metadata\":{\"plan_id\":\"5\"},\"nickname\":null,\"product\":\"prod_PlFaNRCUmJxuwc\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1Ovj52IXaVRnFbguy0lTD0ug\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1710779432,\"currency\":\"eur\",\"custom_unit_amount\":null,\"livemode\":true,\"lookup_key\":null,\"metadata\":{\"plan_id\":\"5\"},\"nickname\":null,\"product\":\"prod_PlFaNRCUmJxuwc\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":4900,\"unit_amount_decimal\":\"4900\"},\"proration\":false,\"proration_details\":{\"credited_items\":null},\"quantity\":1,\"subscription\":\"sub_1Ovj6BIXaVRnFbguXKfYLCRs\",\"subscription_item\":\"si_PlFb7ecIrNVa5l\",\"tax_amounts\":[],\"tax_rates\":[],\"type\":\"subscription\",\"unit_amount_excluding_tax\":\"4900\"}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/invoices\\/in_1P6xsnIXaVRnFbguXkNskmAc\\/lines\"},\"livemode\":true,\"metadata\":[],\"next_payment_attempt\":null,\"number\":\"0AC2D6AC-0002\",\"on_behalf_of\":null,\"paid\":true,\"paid_out_of_band\":false,\"payment_intent\":\"pi_3P6ypgIXaVRnFbgu04V6PzuB\",\"payment_settings\":{\"default_mandate\":null,\"payment_method_options\":{\"acss_debit\":null,\"bancontact\":null,\"card\":{\"request_three_d_secure\":\"automatic\"},\"customer_balance\":null,\"konbini\":null,\"sepa_debit\":null,\"us_bank_account\":null},\"payment_method_types\":null},\"period_end\":1713457903,\"period_start\":1710779503,\"post_payment_credit_notes_amount\":0,\"pre_payment_credit_notes_amount\":0,\"quote\":null,\"receipt_number\":null,\"rendering\":{\"amount_tax_display\":\"include_inclusive_tax\",\"pdf\":null},\"rendering_options\":{\"amount_tax_display\":\"include_inclusive_tax\"},\"shipping_cost\":null,\"shipping_details\":null,\"starting_balance\":0,\"statement_descriptor\":null,\"status\":\"paid\",\"status_transitions\":{\"finalized_at\":1713461591,\"marked_uncollectible_at\":null,\"paid_at\":1713461591,\"voided_at\":null},\"subscription\":\"sub_1Ovj6BIXaVRnFbguXKfYLCRs\",\"subscription_details\":{\"metadata\":{\"name\":\"default\"}},\"subtotal\":4900,\"subtotal_excluding_tax\":4900,\"tax\":null,\"test_clock\":null,\"total\":4900,\"total_discount_amounts\":[],\"total_excluding_tax\":4900,\"total_tax_amounts\":[],\"transfer_data\":null,\"webhooks_delivered_at\":1713457941}},\"livemode\":true,\"pending_webhooks\":1,\"request\":{\"id\":null,\"idempotency_key\":null},\"type\":\"invoice.payment_succeeded\"}');

-- --------------------------------------------------------

--
-- Table structure for table `period_discounts`
--

CREATE TABLE `period_discounts` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED DEFAULT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `discount_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(16,2) NOT NULL,
  `priority` int NOT NULL DEFAULT '1',
  `day` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `period_discounts`
--

INSERT INTO `period_discounts` (`id`, `item_id`, `start`, `end`, `discount_type`, `amount`, `priority`, `day`, `created_at`, `updated_at`) VALUES
(9, 407, '00:00:00', '23:00:00', 'value', 5.00, 1, 'monday', '2024-03-18 16:17:57', '2024-03-18 16:24:57'),
(17, 407, '00:00:00', '23:00:00', 'value', 5.00, 1, 'tuesday', '2024-03-18 16:25:15', '2024-03-18 16:25:15'),
(18, 407, '00:00:00', '23:00:00', 'value', 5.00, 1, 'wednesday', '2024-03-18 16:25:29', '2024-03-18 16:25:59'),
(20, 407, '00:00:00', '23:00:00', 'value', 5.00, 1, 'thursday', '2024-03-18 16:26:17', '2024-03-18 16:26:17'),
(21, 407, '00:00:00', '23:00:00', 'value', 5.00, 1, 'friday', '2024-03-18 16:26:41', '2024-03-18 16:26:41'),
(22, 407, '00:00:00', '23:00:00', 'value', 5.00, 1, 'saturday', '2024-03-18 16:27:00', '2024-03-18 16:27:00'),
(23, 407, '00:00:00', '23:00:00', 'value', 5.00, 1, 'sunday', '2024-03-18 16:27:13', '2024-03-18 16:27:13'),
(24, 425, '00:00:00', '23:00:00', 'value', 6.99, 1, 'monday', '2024-03-18 16:39:31', '2024-03-18 16:41:20'),
(25, 425, '00:00:00', '23:00:00', 'value', 6.99, 1, 'tuesday', '2024-03-18 16:39:48', '2024-03-18 16:41:26'),
(26, 425, '00:00:00', '23:00:00', 'value', 6.99, 1, 'wednesday', '2024-03-18 16:39:57', '2024-03-18 16:41:32'),
(27, 425, '00:00:00', '23:00:00', 'value', 6.99, 1, 'thursday', '2024-03-18 16:40:08', '2024-03-18 16:41:38'),
(28, 425, '00:00:00', '23:00:00', 'value', 6.99, 1, 'friday', '2024-03-18 16:40:21', '2024-03-18 16:41:45'),
(29, 425, '00:00:00', '23:00:00', 'value', 6.99, 1, 'saturday', '2024-03-18 16:40:30', '2024-03-18 16:41:51'),
(30, 425, '00:00:00', '23:00:00', 'value', 6.99, 1, 'sunday', '2024-03-18 16:40:39', '2024-03-18 16:41:58'),
(32, 441, '00:00:00', '23:00:00', 'value', 6.99, 1, 'monday', '2024-03-18 17:44:48', '2024-03-18 17:44:48'),
(33, 441, '00:00:00', '23:00:00', 'value', 6.99, 1, 'tuesday', '2024-03-18 17:45:01', '2024-03-18 17:45:01'),
(34, 441, '00:00:00', '23:00:00', 'value', 6.99, 1, 'wednesday', '2024-03-18 17:45:13', '2024-03-18 17:45:13'),
(35, 441, '00:00:00', '23:00:00', 'value', 6.99, 1, 'thursday', '2024-03-18 17:45:26', '2024-03-18 17:45:26'),
(36, 441, '00:00:00', '23:00:00', 'value', 6.99, 1, 'friday', '2024-03-18 17:45:42', '2024-03-18 17:45:42'),
(37, 441, '00:00:00', '23:00:00', 'value', 6.99, 1, 'saturday', '2024-03-18 17:45:58', '2024-03-18 17:45:58'),
(38, 441, '00:00:00', '23:00:00', 'value', 6.99, 1, 'sunday', '2024-03-18 17:46:15', '2024-03-18 17:46:15'),
(39, 509, '00:00:00', '23:00:00', 'value', 3.50, 1, 'monday', '2024-03-26 17:12:53', '2024-03-26 17:23:10'),
(40, 509, '00:00:00', '23:00:00', 'value', 3.50, 1, 'tuesday', '2024-03-26 17:13:01', '2024-03-26 17:23:16'),
(41, 509, '00:00:00', '23:00:00', 'value', 3.50, 1, 'wednesday', '2024-03-26 17:13:10', '2024-03-26 17:23:23'),
(43, 509, '00:00:00', '23:00:00', 'value', 3.50, 1, 'thursday', '2024-03-26 17:13:31', '2024-03-26 17:23:29'),
(44, 509, '00:00:00', '23:00:00', 'value', 3.50, 1, 'friday', '2024-03-26 17:13:40', '2024-03-26 17:23:40'),
(48, 534, '00:00:00', '23:00:00', 'value', 10.00, 1, 'monday', '2024-03-31 01:37:00', '2024-03-31 01:37:00'),
(49, 534, '00:00:00', '01:00:00', 'value', 10.00, 1, 'tuesday', '2024-03-31 01:37:09', '2024-03-31 01:39:41'),
(50, 534, '00:00:00', '23:00:00', 'value', 10.00, 1, 'wednesday', '2024-03-31 01:37:16', '2024-03-31 01:39:03'),
(51, 534, '00:00:00', '23:00:00', 'value', 10.00, 1, 'thursday', '2024-03-31 01:37:22', '2024-03-31 01:38:54'),
(52, 534, '00:00:00', '23:00:00', 'value', 10.00, 1, 'friday', '2024-03-31 01:37:32', '2024-03-31 01:38:47'),
(53, 534, '00:00:00', '23:00:00', 'value', 10.00, 1, 'saturday', '2024-03-31 01:38:02', '2024-03-31 01:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `period_discounts_for_restourants`
--

CREATE TABLE `period_discounts_for_restourants` (
  `id` bigint UNSIGNED NOT NULL,
  `restourant_id` bigint UNSIGNED DEFAULT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `discount_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `amount` double(16,2) NOT NULL,
  `priority` int NOT NULL DEFAULT '2',
  `day` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `period_discounts_for_restourants`
--

INSERT INTO `period_discounts_for_restourants` (`id`, `restourant_id`, `start`, `end`, `discount_type`, `amount`, `priority`, `day`, `created_at`, `updated_at`) VALUES
(8, 64, '00:00:00', '23:00:00', 'percent', 15.00, 2, 'monday', '2024-03-18 16:44:41', '2024-03-18 16:44:41'),
(9, 64, '00:00:00', '23:00:00', 'percent', 15.00, 2, 'tuesday', '2024-03-18 16:44:56', '2024-03-18 16:44:56'),
(10, 64, '00:00:00', '23:00:00', 'percent', 15.00, 2, 'wednesday', '2024-03-18 16:45:08', '2024-03-18 16:45:08'),
(11, 64, '00:00:00', '23:00:00', 'percent', 15.00, 2, 'thursday', '2024-03-18 16:45:16', '2024-03-18 16:45:16'),
(12, 64, '00:00:00', '23:00:00', 'percent', 15.00, 2, 'friday', '2024-03-18 16:45:25', '2024-03-18 16:45:25'),
(13, 64, '00:00:00', '23:00:00', 'percent', 15.00, 2, 'saturday', '2024-03-18 16:45:37', '2024-03-18 16:45:37'),
(14, 64, '00:00:00', '23:00:00', 'percent', 15.00, 2, 'sunday', '2024-03-18 16:45:46', '2024-03-18 16:45:46'),
(18, 187, '10:00:00', '11:11:00', 'percent', 20.00, 2, 'tuesday', '2024-04-16 16:42:21', '2024-04-16 16:42:21');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage restorants', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(2, 'manage drivers', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(3, 'manage orders', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(4, 'edit settings', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(5, 'view orders', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(6, 'edit restorant', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(7, 'edit orders', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(8, 'access backedn', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit_items` int NOT NULL DEFAULT '0' COMMENT '0 is unlimited',
  `limit_orders` int NOT NULL DEFAULT '0' COMMENT '0 is unlimited',
  `price` double NOT NULL,
  `period` int NOT NULL DEFAULT '1' COMMENT '1 - monthly, 2-anually',
  `paddle_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `description` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `features` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `limit_views` int NOT NULL DEFAULT '0' COMMENT '0 is unlimited',
  `enable_ordering` int NOT NULL DEFAULT '1',
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `limit_staff` int DEFAULT NULL,
  `limit_qrcode` int DEFAULT NULL,
  `limit_tables` int DEFAULT NULL,
  `monthly_price` decimal(8,2) DEFAULT NULL,
  `tenant_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit_lang` int NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `name`, `limit_items`, `limit_orders`, `price`, `period`, `paddle_id`, `created_at`, `updated_at`, `deleted_at`, `description`, `features`, `limit_views`, `enable_ordering`, `stripe_id`, `paypal_id`, `mollie_id`, `paystack_id`, `razorpay_id`, `limit_staff`, `limit_qrcode`, `limit_tables`, `monthly_price`, `tenant_id`, `limit_lang`) VALUES
(1, 'BASIC MONTHLY PLAN', 20, 0, 29.99, 1, '', '2023-06-27 14:42:24', '2024-04-11 21:38:57', NULL, 'If you run a small restaurant orIntroducing our Basic Plan, designed to enhance your dining experience with essential features for your establishment\'s core needs. bar, or just need the basics, this plan is great.', '50 ITEMS, 10 QR CODE TABLES, 3 STAFF ACCOUNTS, 5000 SCANS ALLOWANCE, GENERAL SUPPORT, MULTI-CHANEL PAYEMENT SOLUTION  1.8%+ 0.25€ ONLINE', 0, 1, '', '', NULL, NULL, '', 4, 5000, 10, 0.00, '', 7),
(2, 'BASIC YEARLY PLAN', 20, 0, 305.9, 2, '', '2023-06-27 14:42:24', '2024-02-29 18:22:03', NULL, 'Introducing our Basic Plan, designed to enhance your dining experience with essential features for your establishment\'s core needs.', '50 ITEMS, 10 QR CODE TABLES, 3 STAFF ACCOUNTS, 5000 SCANS ALLOWANCE, GENERAL SUPPORT, MULTI-CHANEL PAYEMENT SOLUTION  1.8%+ 0.25€ ONLINE', 0, 1, '', '', NULL, NULL, '', 4, 5000, 10, 29.99, '', 3),
(3, 'BAIC PLAN (MONTHLY) +  BUNDLE', 0, 0, 29.99, 1, '', '2023-06-27 14:42:24', '2023-12-06 09:03:03', '2023-12-06 09:03:03', 'Introducing our Basic Plan, designed to enhance your dining experience with essential features for your establishment\'s core needs.', '50 ITEMS, 10 QR CODE TABLES, 3 STAFF ACCOUNTS, 5000 SCANS ALLOWANCE, GENERAL SUPPORT, MULTI-CHANLE PAYEMENT SOLUTION  1.8%+ 0.25€ ONLINE, + BUNDLE INCLUED : ,ALLERGENS, DOMAIN, SOCIALPLATFORMS, THEMESWITCHER, UNLIMITED ITEMS,', 0, 1, '', NULL, NULL, NULL, '', 3, 50000, 10, NULL, '', 3),
(4, 'BASIC PLAN (YEARLY) + BUNDLE', 0, 0, 305.9, 2, '', '2023-08-07 17:31:20', '2023-12-06 09:03:14', '2023-12-06 09:03:14', 'Introducing our Basic Plan, designed to enhance your dining experience with essential features for your establishment\'s core needs.', '10 QR CODE TABLES, 3 STAFF ACCOUNTS, 5000 SCANS ALLOWANCE, GENERAL SUPPORT, MULTI-CHANLE PAYEMENT SOLUTION  1.8%+ 0.25€ ONLINE, + BUNDLE INCLUED : ,ALLERGENS, DOMAIN, SOCIALPLATFORMS, THEMESWITCHER, UNLIMITED ITEMS', 0, 1, '', NULL, NULL, NULL, '', 3, 5000, 10, NULL, '', 3),
(5, 'PREMIUM MONTHLY PLAN', 200, 0, 49.99, 1, '', '2023-08-31 14:41:46', '2024-03-20 17:16:38', NULL, 'Elevate your dining company\'s digital presence with our Premium Plan. Packed with advanced tools, it guarantees a seamless dining experience, catering to diverse needs.', '200 ITEMS, 25 QR CODE TABLES, 5 STAFF ACCOUNTS, 10 000 SCANS ALLOWANCE, 4 LANGUAGES INCLUED, CUSTOM DOMAIN, CUSTOMER REVIEWS, PRIORITY SUPPORT, MULTI-CHANEL PAYEMENT SOLUTION  1.8% + 0.25€ ONLINE', 0, 1, '', '', NULL, NULL, '', 6, 10000, 25, 0.00, '', 3),
(6, 'PREMIUM YEARLY PLAN', 200, 0, 509.9, 2, '', '2023-08-31 14:42:48', '2024-03-19 15:55:19', NULL, 'Elevate your dining company\'s digital presence with our Premium Plan. Packed with advanced tools, it guarantees a seamless dining experience, catering to diverse needs.', '200 ITEMS, 25 QR CODE TABLES, 5 STAFF ACCOUNTS, 10 000 SCANS ALLOWANCE, 4 LANGUAGES INCLUED, CUSTOM DOMAIN, CUSTOMER REVIEWS, PRIORITY SUPPORT, MULTI-CHANEL PAYEMENT SOLUTION  1.8%+ 0.25€ ONLINE', 0, 1, '', '', NULL, NULL, '', 6, 10000, 25, 49.99, '', 3),
(7, 'Entreprise Plan', 50, 0, 0, 1, '', '2023-08-31 14:44:59', '2024-03-11 21:38:07', NULL, 'Elevate your dining company\'s digital presence with our Premium Plan. Packed with advanced tools, it guarantees a seamless dining experience, catering to diverse needs.', '200 ITEMS, 5 STAFF ACCOUNTS, 4 LANGUAGES INCLUED, CUSTOM DOMAIN, CUSTOMER REVIEWS, PRIORITY SUPPORT, MULTI-CHANEL PAYEMENT SOLUTION  1.8%+ 0.25€ ONLINE + BUNDLE INCLUED :, ALLERGENS, SOCIALPLATFORMS, THEMESWITCHER, UNLIMITED SCANS, UNLIMITED QR CODE TABLES', 0, 1, '', '', NULL, NULL, '', 5, 100000, 1000, 0.00, '', 3),
(8, 'PREMIUM PLAN (YEARLY) + BUNDLE', 200, 0, 509.9, 2, '', '2023-08-31 14:47:28', '2023-12-06 09:05:35', '2023-12-06 09:05:35', 'Elevate your dining company\'s digital presence with our Premium Plan. Packed with advanced tools, it guarantees a seamless dining experience, catering to diverse needs.', '200 ITEMS, 5 STAFF ACCOUNTS, 4 LANGUAGES INCLUED, CUSTOM DOMAIN, CUSTOMER REVIEWS, PRIORITY SUPPORT, MULTI-CHANLE PAYEMENT SOLUTION  1%+ 0.25€ ONLINE + BUNDLE INCLUED :, ALLERGENS, SOCIALPLATFORMS, THEMESWITCHER, UNLIMITED SCANS, UNLIMITED QR CODE TABLES', 0, 1, '', NULL, NULL, NULL, '', 5, 100000, 1000, NULL, '', 3),
(9, 'Test plan', 23, 324, 500, 2, '', '2023-12-06 05:36:43', '2023-12-06 05:37:09', '2023-12-06 05:37:09', 'asdasd', 'asdsd', 0, 1, '', NULL, NULL, NULL, '', 45, 3434, 343, NULL, '', 3),
(10, 'Test plan', 45, 45, 326, 2, '', '2023-12-06 08:28:30', '2023-12-06 08:29:00', '2023-12-06 08:29:00', 'dfgdfg', 'dfgdfg', 0, 1, '', NULL, NULL, NULL, '', 0, 45, 45, 22.00, '', 3),
(11, 'Entreprise Plan', 50, 0, 0, 2, '', '2023-12-06 09:53:08', '2024-02-01 21:32:17', NULL, 'Elevate your dining company\'s digital presence with our Premium Plan. Packed with advanced tools, it guarantees a seamless dining experience, catering to diverse needs.', '200 ITEMS, 5 STAFF ACCOUNTS, 4 LANGUAGES INCLUED, CUSTOM DOMAIN, CUSTOMER REVIEWS, PRIORITY SUPPORT, MULTI-CHANEL PAYEMENT SOLUTION  1.8%+ 0.25€ ONLINE + BUNDLE INCLUED :, ALLERGENS, SOCIALPLATFORMS, THEMESWITCHER, UNLIMITED SCANS, UNLIMITED QR CODE TABLES', 0, 1, '', NULL, NULL, NULL, '', 5, 100000, 1000, 0.00, '', 3),
(12, 'sfdaf', 0, 0, 100, 1, '', '2024-02-29 19:37:06', '2024-02-29 19:37:06', NULL, 'asdfsadf', 'asdfsda', 0, 1, '', '', NULL, NULL, '', 0, 0, 0, 100.00, '4d16e8bf-3215-4ddd-a410-546d12e82cb7', 0),
(13, 'yearly plan test domain rest', 0, 0, 149, 2, '', '2024-02-29 20:56:48', '2024-02-29 20:56:48', NULL, 'yearly plan test domain rest', 'yearly plan test domain rest', 0, 1, '', '', NULL, NULL, '', 0, 0, 0, 149.00, '8609dc41-307c-4ee2-8462-16c6d61071f1', 0),
(14, 'test', 10, 10, 9.98, 1, '', '2024-03-11 12:11:16', '2024-03-11 12:20:35', '2024-03-11 12:20:35', 'test', 'test feature', 0, 1, '', '', NULL, NULL, '', 10, 10, 10, 0.00, '8609dc41-307c-4ee2-8462-16c6d61071f1', 10),
(15, 'test plan premium monthly', 0, 0, 40, 1, '', '2024-03-20 15:53:46', '2024-04-11 21:39:12', NULL, 'dfgdsfg', 'dfsgdsfg', 0, 1, '', '', NULL, NULL, '', 0, 0, 0, 0.00, '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `plan_coupons`
--

CREATE TABLE `plan_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `type` int NOT NULL,
  `price` double NOT NULL,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL,
  `limit_to_num_uses` int NOT NULL,
  `used_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_coupons`
--

INSERT INTO `plan_coupons` (`id`, `name`, `code`, `plan_id`, `type`, `price`, `active_from`, `active_to`, `limit_to_num_uses`, `used_count`, `created_at`, `updated_at`, `stripe_id`, `coupon_duration`) VALUES
(11, 'test123', 'TEST123', NULL, 1, 97.93, '2024-03-01', '2024-03-25', 20, 2, '2024-03-18 22:23:45', '2024-04-25 06:24:38', 'DVx1KAyz', '0');

-- --------------------------------------------------------

--
-- Table structure for table `plan_limits`
--

CREATE TABLE `plan_limits` (
  `id` bigint UNSIGNED NOT NULL,
  `restourant_id` bigint UNSIGNED DEFAULT NULL,
  `limit_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `post_type`, `title`, `subtitle`, `description`, `image`, `link`, `link_name`) VALUES
(2, '2023-07-05 19:52:02', '2023-07-05 19:52:02', 'allergen', '{\"en\":\"Peanut\"}', '{\"en\":null}', '{\"en\":null}', '8a32ee07-9f27-4da0-97ae-38e2a4e9749f', NULL, '{\"en\":null}'),
(3, '2023-07-05 19:52:33', '2024-03-11 10:41:26', 'allergen', '{\"en\":\"Egg\"}', '{\"en\":null}', '{\"en\":null}', 'e703e8fb-2c1a-4d78-b6cc-5f64963cf8b0', NULL, '{\"en\":null}'),
(4, '2023-07-05 19:52:53', '2023-07-05 19:52:53', 'allergen', '{\"en\":\"Yogurt\"}', '{\"en\":null}', '{\"en\":null}', '5aaa432a-6594-4e79-987f-aa861d407989', NULL, '{\"en\":null}'),
(5, '2023-07-05 19:53:15', '2023-07-05 19:53:15', 'allergen', '{\"en\":\"Cornflakes\"}', '{\"en\":null}', '{\"en\":null}', '8c1a9e9f-a3c7-496c-97a5-a6e2d9f2463f', NULL, '{\"en\":null}'),
(6, '2023-07-05 19:53:39', '2023-07-05 19:53:39', 'allergen', '{\"en\":\"Wheat\"}', '{\"en\":null}', '{\"en\":null}', '3e5faf12-f463-478f-9902-467f6e651fa4', NULL, '{\"en\":null}'),
(7, '2023-07-05 19:54:41', '2023-07-05 19:54:41', 'allergen', '{\"en\":\"Corn\"}', '{\"en\":null}', '{\"en\":null}', '90ad0225-d1f4-495d-a2ba-b28b804f4367', NULL, '{\"en\":null}'),
(8, '2023-07-05 19:54:56', '2023-07-05 19:54:56', 'allergen', '{\"en\":\"Oat\"}', '{\"en\":null}', '{\"en\":null}', '02552f66-5a00-462b-a554-c1ca4f3d9421', NULL, '{\"en\":null}'),
(9, '2023-07-05 19:55:15', '2023-07-05 19:55:15', 'allergen', '{\"en\":\"Wheat flour\"}', '{\"en\":null}', '{\"en\":null}', '98ebf74c-7077-44ab-b8d8-45f40ea38f5f', NULL, '{\"en\":null}'),
(10, '2023-07-05 19:55:29', '2023-07-05 19:55:29', 'allergen', '{\"en\":\"Rice\"}', '{\"en\":null}', '{\"en\":null}', 'b438f0ee-54ac-4453-9ae8-0a7aefed6572', NULL, '{\"en\":null}'),
(11, '2023-07-05 19:55:50', '2023-07-05 19:55:50', 'allergen', '{\"en\":\"Bread\"}', '{\"en\":null}', '{\"en\":null}', 'f190213d-6d0b-46e7-b229-a62166240547', NULL, '{\"en\":null}'),
(12, '2023-07-05 19:56:17', '2023-07-05 19:56:17', 'allergen', '{\"en\":\"Almond\"}', '{\"en\":null}', '{\"en\":null}', 'be1e876d-0633-4c32-a3e8-611997719ce8', NULL, '{\"en\":null}'),
(13, '2023-07-05 19:56:51', '2023-07-05 19:56:51', 'allergen', '{\"en\":\"Croissant\"}', '{\"en\":null}', '{\"en\":null}', 'ec4b5385-a523-4fb8-b21d-fa52df06707c', NULL, '{\"en\":null}'),
(14, '2023-07-05 19:57:17', '2023-07-05 19:57:17', 'allergen', '{\"en\":\"Lobster\"}', '{\"en\":null}', '{\"en\":null}', '8dccc5e7-3f72-4723-a351-a6b34879486c', NULL, '{\"en\":null}'),
(15, '2023-07-05 19:57:42', '2023-07-05 19:57:43', 'allergen', '{\"en\":\"Crab\"}', '{\"en\":null}', '{\"en\":null}', 'fcb67cfd-f7ea-4482-80e5-1fe8c732a211', NULL, '{\"en\":null}'),
(16, '2023-07-05 19:58:08', '2023-07-05 19:58:08', 'allergen', '{\"en\":\"Shrimp\"}', '{\"en\":null}', '{\"en\":null}', '75e148e8-1455-4947-8e9c-ba722804f786', NULL, '{\"en\":null}'),
(17, '2023-07-05 19:58:51', '2023-07-05 19:58:51', 'allergen', '{\"en\":\"Squid\"}', '{\"en\":null}', '{\"en\":null}', 'd9487639-3e60-4e33-82eb-56f1feade9cb', NULL, '{\"en\":null}'),
(18, '2023-07-05 19:59:14', '2023-07-05 19:59:14', 'allergen', '{\"en\":\"Mussel\"}', '{\"en\":null}', '{\"en\":null}', '1bb49741-6337-433a-84fb-66c209713768', NULL, '{\"en\":null}'),
(19, '2023-07-05 19:59:30', '2023-07-05 19:59:30', 'allergen', '{\"en\":\"Salmon\"}', '{\"en\":null}', '{\"en\":null}', '7105a42d-3cd3-495e-aaff-dff95071436b', NULL, '{\"en\":null}'),
(20, '2023-07-05 20:00:31', '2023-07-05 20:00:31', 'allergen', '{\"en\":\"Shell\"}', '{\"en\":null}', '{\"en\":null}', '96f02649-20f8-4c8c-bdd6-5b42617d5280', NULL, '{\"en\":null}'),
(21, '2023-07-05 20:00:51', '2023-07-05 20:00:51', 'allergen', '{\"en\":\"Chicken\"}', '{\"en\":null}', '{\"en\":null}', 'a08f2b49-a6e8-4ed6-a80e-65f08f61573b', NULL, '{\"en\":null}'),
(22, '2023-07-05 20:01:07', '2023-07-05 20:01:07', 'allergen', '{\"en\":\"Soy\"}', '{\"en\":null}', '{\"en\":null}', '6a697b0a-ca96-4013-a6e8-5f0c3e06d856', NULL, '{\"en\":null}'),
(23, '2023-07-05 20:01:34', '2023-07-05 20:01:34', 'allergen', '{\"en\":\"Meat\"}', '{\"en\":null}', '{\"en\":null}', '8f021a40-9882-4c43-9a3e-84e1227bc78b', NULL, '{\"en\":null}'),
(24, '2023-07-05 20:02:00', '2023-07-05 20:02:00', 'allergen', '{\"en\":\"Mushroom\"}', '{\"en\":null}', '{\"en\":null}', '1d86f5e9-9130-4d28-b0ba-448333a9cab6', NULL, '{\"en\":null}'),
(25, '2023-07-05 20:02:17', '2023-07-05 20:02:17', 'allergen', '{\"en\":\"Honey\"}', '{\"en\":null}', '{\"en\":null}', '3c8cb4b5-cd00-453d-8ded-3ff1da99dc46', NULL, '{\"en\":null}'),
(26, '2023-07-05 20:02:31', '2023-07-05 20:02:31', 'allergen', '{\"en\":\"Wine\"}', '{\"en\":null}', '{\"en\":null}', '51fd83bf-8547-43b3-8b54-0d821b7906dd', NULL, '{\"en\":null}'),
(27, '2023-07-05 20:02:48', '2023-07-05 20:02:48', 'allergen', '{\"en\":\"Beer\"}', '{\"en\":null}', '{\"en\":null}', 'a87a71de-7f1f-4de3-a8f0-9a10abdfdb40', NULL, '{\"en\":null}'),
(28, '2023-07-05 20:03:07', '2023-07-05 20:03:07', 'allergen', '{\"en\":\"Tuna\"}', '{\"en\":null}', '{\"en\":null}', '13959618-2c20-4ec8-b20e-13e190019ae1', NULL, '{\"en\":null}'),
(29, '2023-07-05 20:03:29', '2023-07-05 20:03:29', 'allergen', '{\"en\":\"Juice Box\"}', '{\"en\":null}', '{\"en\":null}', 'a3bee82c-f99d-4fcf-bfce-edabe56327f9', NULL, '{\"en\":null}'),
(30, '2023-07-05 20:04:10', '2023-07-05 20:04:10', 'allergen', '{\"en\":\"Mustard\"}', '{\"en\":null}', '{\"en\":null}', 'd6a0fdba-86f1-44b5-a81c-ad3d3376b4ee', NULL, '{\"en\":null}'),
(31, '2023-07-05 20:05:13', '2023-07-05 20:05:13', 'allergen', '{\"en\":\"Beans\"}', '{\"en\":null}', '{\"en\":null}', 'f7c79fc5-f9b8-4837-9b21-36c90d31cff2', NULL, '{\"en\":null}'),
(32, '2023-07-05 20:05:37', '2023-07-05 20:05:37', 'allergen', '{\"en\":\"Soy Sauce\"}', '{\"en\":null}', '{\"en\":null}', '8e0d073e-341e-4877-8606-cf249cbdd61e', NULL, '{\"en\":null}'),
(33, '2023-07-05 20:06:01', '2023-07-05 20:06:01', 'allergen', '{\"en\":\"Blueberry\"}', '{\"en\":null}', '{\"en\":null}', 'c38a0571-58c2-4b41-a2f8-c78548178c59', NULL, '{\"en\":null}'),
(34, '2023-07-05 20:06:25', '2023-07-05 20:06:25', 'allergen', '{\"en\":\"Peach\"}', '{\"en\":null}', '{\"en\":null}', '9db69ba5-d45a-417b-aeab-10189310334a', NULL, '{\"en\":null}'),
(35, '2023-07-05 20:06:40', '2023-07-05 20:06:40', 'allergen', '{\"en\":\"Melon\"}', '{\"en\":null}', '{\"en\":null}', '5bcc81ad-31ba-4d56-afe1-2b276d50f72f', NULL, '{\"en\":null}'),
(36, '2023-07-05 20:07:04', '2023-07-05 20:07:04', 'allergen', '{\"en\":\"Lemon\"}', '{\"en\":null}', '{\"en\":null}', '62c1cfba-4ba4-4d1a-aa0b-82ce9cb8a7e3', NULL, '{\"en\":null}'),
(37, '2023-07-05 20:07:23', '2023-07-05 20:07:23', 'allergen', '{\"en\":\"Celery\"}', '{\"en\":null}', '{\"en\":null}', '225fe253-fa41-413f-b537-c9ef9c61b085', NULL, '{\"en\":null}'),
(38, '2023-07-05 20:07:47', '2023-07-05 20:07:47', 'allergen', '{\"en\":\"Avocado\"}', '{\"en\":null}', '{\"en\":null}', 'c0f90621-b9b8-4091-b6d9-161a8f5bd12f', NULL, '{\"en\":null}'),
(39, '2023-07-05 20:08:15', '2023-07-05 20:08:15', 'allergen', '{\"en\":\"Chocolate\"}', '{\"en\":null}', '{\"en\":null}', '9142b532-2c2f-43fd-b284-ddc95bdb9113', NULL, '{\"en\":null}'),
(40, '2023-07-05 20:08:36', '2023-07-05 20:08:43', 'allergen', '{\"en\":\"Cookie\"}', '{\"en\":null}', '{\"en\":null}', '8dfa4165-b4f2-467c-b6a3-e119eca6f3f5', NULL, '{\"en\":null}'),
(41, '2023-07-05 20:09:00', '2023-07-05 20:09:00', 'allergen', '{\"en\":\"Butter\"}', '{\"en\":null}', '{\"en\":null}', '27119527-7206-4b79-8b56-03f1b2ac3d4b', NULL, '{\"en\":null}'),
(42, '2023-07-05 20:09:18', '2023-07-05 20:09:18', 'allergen', '{\"en\":\"Lupin\"}', '{\"en\":null}', '{\"en\":null}', '8acfe81e-4178-467b-a191-2bd9c67514ed', NULL, '{\"en\":null}'),
(43, '2023-07-05 20:09:37', '2023-07-05 20:09:37', 'allergen', '{\"en\":\"Peanut Butter\"}', '{\"en\":null}', '{\"en\":null}', '7096d274-8b7f-47b9-8cc5-0bfda8b5470f', NULL, '{\"en\":null}'),
(44, '2023-07-05 20:10:04', '2023-07-05 20:10:04', 'allergen', '{\"en\":\"Sesame\"}', '{\"en\":null}', '{\"en\":null}', 'b843e4d5-2398-45e7-b5b0-30b83eb865bb', NULL, '{\"en\":null}'),
(45, '2023-07-05 20:10:20', '2023-07-05 20:10:20', 'allergen', '{\"en\":\"Milk\"}', '{\"en\":null}', '{\"en\":null}', 'b638110e-24e2-4a11-8a36-359006d6086a', NULL, '{\"en\":null}'),
(46, '2023-07-05 20:10:36', '2023-07-05 20:10:36', 'allergen', '{\"en\":\"Cheese\"}', '{\"en\":null}', '{\"en\":null}', 'c184f357-efb2-4a24-a915-9905bd410f3e', NULL, '{\"en\":null}'),
(47, '2023-07-05 20:10:51', '2023-07-05 20:10:51', 'allergen', '{\"en\":\"Donut\"}', '{\"en\":null}', '{\"en\":null}', 'f87b60ab-2214-4585-82d1-9792247dcc71', NULL, '{\"en\":null}'),
(48, '2023-07-05 20:11:03', '2023-07-05 20:11:03', 'allergen', '{\"en\":\"Fish\"}', '{\"en\":null}', '{\"en\":null}', 'c89a60d0-88da-495c-abd9-9d09f476e1b1', NULL, '{\"en\":null}'),
(49, '2023-07-05 20:11:20', '2023-07-05 20:11:20', 'allergen', '{\"en\":\"Sugar\"}', '{\"en\":null}', '{\"en\":null}', 'ff13dcdb-7ee8-4240-8c91-c51c5edf918d', NULL, '{\"en\":null}'),
(50, '2023-07-05 20:11:37', '2023-07-05 20:11:45', 'allergen', '{\"en\":\"Sulphite\"}', '{\"en\":null}', '{\"en\":null}', '34704bf7-78a9-4a05-be1f-ae94b961e9fa', NULL, '{\"en\":null}'),
(51, '2023-07-05 20:12:04', '2023-07-05 20:12:04', 'allergen', '{\"en\":\"Coffee beans\"}', '{\"en\":null}', '{\"en\":null}', '178ee1fa-6dbe-4641-aa9d-574c23857d77', NULL, '{\"en\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` int NOT NULL,
  `rateable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateable_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restoareas`
--

CREATE TABLE `restoareas` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restoareas`
--

INSERT INTO `restoareas` (`id`, `name`, `restaurant_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(54, 'Table', 61, '2024-01-29 01:22:08', '2024-01-29 01:22:08', NULL),
(55, 'Gastro Table A', 62, '2024-01-29 01:38:32', '2024-01-29 01:38:32', NULL),
(56, 'table pasta', 63, '2024-01-29 04:07:58', '2024-01-29 04:07:58', NULL),
(57, 'Elegance & Flavors Bar', 64, '2024-01-29 04:52:10', '2024-01-29 04:52:10', NULL),
(64, 'A area', 187, '2024-04-08 13:42:45', '2024-04-08 13:42:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(2, 'owner', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(3, 'driver', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(4, 'client', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(5, 'staff', 'web', '2023-06-27 14:42:17', '2023-06-27 14:42:17'),
(6, 'manager', 'web', '2023-07-03 22:28:33', '2023-07-03 22:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(8, 1),
(5, 2),
(6, 2),
(8, 2),
(7, 3),
(8, 3),
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `search` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restorant_details_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `restorant_details_cover_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instagram` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `playstore` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `appstore` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `maps_api_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `delivery` double(8,2) NOT NULL DEFAULT '0.00',
  `typeform` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile_info_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile_info_subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_options` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '{}',
  `site_logo_dark` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `site_name`, `site_logo`, `search`, `restorant_details_image`, `restorant_details_cover_image`, `description`, `header_title`, `header_subtitle`, `currency`, `facebook`, `instagram`, `playstore`, `appstore`, `maps_api_key`, `delivery`, `typeform`, `mobile_info_title`, `mobile_info_subtitle`, `order_options`, `site_logo_dark`, `order_fields`) VALUES
(1, '2023-06-27 14:42:17', '2024-04-28 06:05:05', 'EmenuSolutions', 'f454ce99-d743-47d6-9ce8-2af717f2a27b', '/default/cover.jpg', '448ac9a6-fc8e-43c9-8742-897c9a5f630b', '/default/cover.jpg', 'Food Delivery from best restaurants', '', '', 'USD', '', '', '', '', 'AIzaSyCZhq0g1x1ttXPa1QB3ylcDQPTAzp_KUgA', 0.00, '', '', '', '{}', 'b1710001-e170-459e-a4b1-7ce689a388b8', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `simple_delivery_areas`
--

CREATE TABLE `simple_delivery_areas` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(8,2) NOT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_delivery_areas`
--

INSERT INTO `simple_delivery_areas` (`id`, `name`, `cost`, `restaurant_id`, `created_at`, `updated_at`, `phone`) VALUES
(41, 'Test', 5.00, 187, '2024-04-04 17:06:25', '2024-04-04 17:06:25', '+145764567567'),
(42, 'lyon 7', 10.00, 187, '2024-04-04 17:12:04', '2024-04-04 17:12:04', '+17878273883748');

-- --------------------------------------------------------

--
-- Table structure for table `sms_verifications`
--

CREATE TABLE `sms_verifications` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `alias`) VALUES
(1, 'Just created', 'just_created'),
(2, 'Accepted by admin', 'accepted_by_admin'),
(3, 'Accepted by restaurant', 'accepted_by_restaurant'),
(4, 'Assigned to driver', 'assigned_to_driver'),
(5, 'Prepared', 'prepared'),
(6, 'Picked up', 'picked_up'),
(7, 'Delivered', 'delivered'),
(8, 'Rejected by admin', 'rejected_by_admin'),
(9, 'Rejected by restaurant', 'rejected_by_restaurant'),
(10, 'Updated', 'updated'),
(11, 'Closed', 'closed'),
(12, 'Rejected by driver', 'rejected_by_driver'),
(13, 'Accepted by driver', 'accepted_by_driver');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `name`, `stripe_id`, `stripe_status`, `stripe_plan`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`, `stripe_price`) VALUES
(1, 84, 'default', 'sub_1ONWUVA3yhDzHDNOoHTsAEvw', 'active', '', 1, NULL, NULL, '2023-12-15 15:11:32', '2023-12-15 15:11:32', 'price_1OIgMjA3yhDzHDNO3FxdxNSe'),
(2, 115, 'default', 'sub_1ORxeTA3yhDzHDNOlZ78jVLg', 'active', '', 1, NULL, NULL, '2023-12-27 21:00:09', '2023-12-27 21:00:09', 'price_1OOIsHA3yhDzHDNO6ayPcGai'),
(3, 117, 'default', 'sub_1ORxnvA3yhDzHDNOGpwIFIi6', 'active', '', 1, NULL, NULL, '2023-12-27 21:09:55', '2023-12-27 21:09:55', 'price_1OIgMjA3yhDzHDNO3FxdxNSe'),
(4, 124, 'default', 'sub_1OaymZA3yhDzHDNOtRBSxxGz', 'active', '', 1, NULL, NULL, '2024-01-21 18:01:47', '2024-01-21 18:01:47', 'price_1OPjkZA3yhDzHDNOUAVmBLXU'),
(5, 125, 'default', 'sub_1Oayz4A3yhDzHDNO9yW3Y3vi', 'active', '', 1, NULL, NULL, '2024-01-21 18:14:41', '2024-01-21 18:14:42', 'price_1OIgMjA3yhDzHDNO3FxdxNSe'),
(6, 126, 'default', 'sub_1Oaz4cA3yhDzHDNOxPxTbjCL', 'active', '', 1, NULL, NULL, '2024-01-21 18:20:26', '2024-01-21 18:20:27', 'price_1OIgMjA3yhDzHDNO3FxdxNSe'),
(7, 225, 'default', 'sub_1Ovj6BIXaVRnFbguXKfYLCRs', 'active', '', 1, NULL, NULL, '2024-03-18 22:31:47', '2024-03-18 22:32:28', 'price_1Ovj52IXaVRnFbguy0lTD0ug');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_product` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_items`
--

INSERT INTO `subscription_items` (`id`, `subscription_id`, `stripe_id`, `stripe_plan`, `quantity`, `created_at`, `updated_at`, `stripe_product`, `stripe_price`) VALUES
(1, 1, 'si_PBuJOqddhknNhJ', '', 1, '2023-12-15 15:11:32', '2023-12-15 15:11:32', 'prod_P6uBK81ulqrnBq', 'price_1OIgMjA3yhDzHDNO3FxdxNSe'),
(2, 2, 'si_PGUdFGJZSDRnHo', '', 1, '2023-12-27 21:00:09', '2023-12-27 21:00:09', 'prod_PCiIOq4mCvtkqH', 'price_1OOIsHA3yhDzHDNO6ayPcGai'),
(3, 3, 'si_PGUnpBkbZT7dYG', '', 1, '2023-12-27 21:09:55', '2023-12-27 21:09:55', 'prod_P6uBK81ulqrnBq', 'price_1OIgMjA3yhDzHDNO3FxdxNSe'),
(4, 4, 'si_PPoP5HXNfqaFqj', '', 1, '2024-01-21 18:01:47', '2024-01-21 18:01:47', 'prod_PEC8c0vBcxicD2', 'price_1OPjkZA3yhDzHDNOUAVmBLXU'),
(5, 5, 'si_PPocu7QVvnLehx', '', 1, '2024-01-21 18:14:41', '2024-01-21 18:14:41', 'prod_P6uBK81ulqrnBq', 'price_1OIgMjA3yhDzHDNO3FxdxNSe'),
(6, 6, 'si_PPoifhPvQcrNBr', '', 1, '2024-01-21 18:20:26', '2024-01-21 18:20:26', 'prod_P6uBK81ulqrnBq', 'price_1OIgMjA3yhDzHDNO3FxdxNSe'),
(7, 7, 'si_PlFb7ecIrNVa5l', '', 1, '2024-03-18 22:31:47', '2024-03-18 22:31:47', 'prod_PlFaNRCUmJxuwc', 'price_1Ovj52IXaVRnFbguy0lTD0ug');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL DEFAULT '4',
  `restoarea_id` bigint UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `x` double(8,2) DEFAULT NULL,
  `y` double(8,2) DEFAULT NULL,
  `w` double(8,2) DEFAULT NULL,
  `h` double(8,2) DEFAULT NULL,
  `rounded` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `size`, `restoarea_id`, `restaurant_id`, `created_at`, `updated_at`, `deleted_at`, `x`, `y`, `w`, `h`, `rounded`) VALUES
(288, 'Table 1', 4, 54, 61, '2024-01-29 01:22:44', '2024-01-29 01:22:44', NULL, 0.00, 0.00, 164.00, 164.00, 'yes'),
(289, 'Table 2', 4, 54, 61, '2024-01-29 01:22:44', '2024-01-29 01:22:44', NULL, 370.91, 29.09, 164.00, 114.82, 'no'),
(290, 'Table 3', 5, 54, 61, '2024-01-29 01:22:44', '2024-01-29 01:22:44', NULL, 303.64, 190.91, 164.00, 164.00, 'yes'),
(291, 'Gastro Table A', 4, 55, 62, '2024-01-29 01:39:46', '2024-01-29 01:39:46', NULL, 360.00, 139.09, 164.00, 164.00, 'yes'),
(292, 'Gastro Table B', 2, 55, 62, '2024-01-29 01:39:46', '2024-01-29 01:39:46', NULL, 46.36, 273.64, 164.00, 142.01, 'no'),
(293, 'Gastro Table C', 2, 55, 62, '2024-01-29 01:39:46', '2024-01-29 01:39:46', NULL, 47.24, 156.72, 164.00, 142.01, 'no'),
(294, 'Gastro Table D', 4, 55, 62, '2024-01-29 01:39:46', '2024-01-29 01:39:46', NULL, 364.55, 285.45, 164.00, 164.00, 'yes'),
(295, 'Gastro Table E', 8, 55, 62, '2024-01-29 01:39:46', '2024-01-29 01:39:46', NULL, 601.82, 203.64, 212.18, 98.38, 'no'),
(296, 'Table Pasta 1', 2, 56, 63, '2024-01-29 04:08:22', '2024-01-29 04:08:22', NULL, NULL, NULL, NULL, NULL, 'no'),
(297, 'Table pasta 2', 4, 56, 63, '2024-01-29 04:08:36', '2024-01-29 04:08:36', NULL, NULL, NULL, NULL, NULL, 'no'),
(298, 'Table pasta private', 8, 56, 63, '2024-01-29 04:08:56', '2024-01-29 04:08:56', NULL, NULL, NULL, NULL, NULL, 'no'),
(299, 'Flavors Bar 10', 4, 57, 64, '2024-01-29 04:52:26', '2024-01-29 04:52:26', NULL, NULL, NULL, NULL, NULL, 'no'),
(300, 'Flavors Bar 11', 4, 57, 64, '2024-01-29 04:52:36', '2024-01-29 04:52:36', NULL, NULL, NULL, NULL, NULL, 'no'),
(301, 'Flavors Bar 12', 2, 57, 64, '2024-01-29 04:52:51', '2024-01-29 04:52:51', NULL, NULL, NULL, NULL, NULL, 'no'),
(307, 'A table', 4, 64, 187, '2024-04-08 13:43:01', '2024-04-08 13:43:01', NULL, NULL, NULL, NULL, NULL, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `temp_orders`
--

CREATE TABLE `temp_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `created_at`, `updated_at`, `data`) VALUES
('4d16e8bf-3215-4ddd-a410-546d12e82cb7', '2024-02-27 20:31:38', '2024-02-27 20:31:38', NULL),
('8609dc41-307c-4ee2-8462-16c6d61071f1', '2024-02-27 20:25:48', '2024-02-27 20:25:48', NULL),
('ca8896aa-e472-4e48-9087-321bffda0102', '2024-02-27 18:31:07', '2024-02-27 18:31:07', NULL),
('fe1aff03-f888-4b4c-9370-039866ba4fa9', '2024-03-11 12:21:12', '2024-03-11 12:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `language_id` int UNSIGNED NOT NULL,
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `google_id` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `plan_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cancel_url` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `update_url` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checkout_id` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subscription_plan_id` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `stripe_account` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `birth_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working` int NOT NULL DEFAULT '1',
  `onorder` int DEFAULT NULL,
  `numorders` int NOT NULL DEFAULT '0',
  `rejectedorders` int NOT NULL,
  `paypal_subscribtion_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_customer_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_mandate_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_percentage` decimal(6,4) NOT NULL DEFAULT '0.0000',
  `extra_billing_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mollie_subscribtion_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_subscribtion_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_trans_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `expotoken` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pm_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_price` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `google_id`, `fb_id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `phone`, `remember_token`, `created_at`, `updated_at`, `active`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `verification_code`, `phone_verified_at`, `plan_id`, `plan_status`, `cancel_url`, `update_url`, `checkout_id`, `subscription_plan_id`, `stripe_account`, `birth_date`, `lat`, `lng`, `working`, `onorder`, `numorders`, `rejectedorders`, `paypal_subscribtion_id`, `mollie_customer_id`, `mollie_mandate_id`, `tax_percentage`, `extra_billing_information`, `mollie_subscribtion_id`, `paystack_subscribtion_id`, `paystack_trans_id`, `restaurant_id`, `deleted_at`, `expotoken`, `pm_type`, `pm_last_four`, `show_price`) VALUES
(1, NULL, NULL, 'Admin Admin', 'admin1413@gmail.com', '2023-06-27 14:42:17', '$2y$10$We/377RsjRAYDTcNAcO1V.6Rm2aqziNAQqFPXV.1dAAgHxNpm1ana', 'Q6MPYKKNbuDDEAMdICqw32hGInN9rwTmV6y9rkUnzhSzLVuw17jtJLLpTVMtyMG1ANatcDfWWYpb7SM0', '+100000000000', 'rqU8T56nFoPuZytVebyvrv111nS64PaWbFuezf0hoqFl1YkFguAGvb17ZmW5', '2023-06-27 14:42:17', '2023-08-07 17:57:04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(3, NULL, NULL, 'Demo Staff 1', 'staff@example.com', '2023-06-27 14:42:17', '$2y$10$JPG7NyhDkSctYl5Xg1987O.IN9BUExAsx23bbFbU5dRaBQUgtSXAu', 'GCnfzRaW70y0c4WWDYJZ7Ci9e83roI1wFFSsF0dv3Sh8uzXBNIQyKbFQ03Uv7EZne5nhpbRXqwGDcUp4', '', NULL, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(4, NULL, NULL, 'Demo Staff 2', 'staff2_1@example.com', '2023-06-27 14:42:17', '$2y$10$.tNAHeQkHCTqZITis11dbeS6KhQm3XDJqE.IaXgv3g2PpChx.FC3q', 'YaWHezZjqHyKDpYhdFkoClQFaLC63G5iPH6jaTtroljMhq1GzGGpTtIRbbfg12YlVtsDLv1ggDkPDBBa', '', NULL, '2023-06-27 14:42:17', '2023-06-27 14:42:17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(5, NULL, NULL, 'Demo Staff 1', 'staff1_2@example.com', '2023-06-27 14:42:18', '$2y$10$o.DITw2brYqcMRZK5rabNeg1ifXR.pDy.TspyM3brciPcelyNBFs.', 'naR5OPgzZLIn6cZIptg9oxRzsDQ4imXJcSmlqWQazzYqJ6QhrKJYSqbMTz2MiEOfpYdwXv0pf52vUwsx', '', NULL, '2023-06-27 14:42:18', '2023-06-27 14:42:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(6, NULL, NULL, 'Demo Staff 2', 'staff2_2@example.com', '2023-06-27 14:42:18', '$2y$10$HKxnoE8CqLxPy0LPOlE/xenzWWcrn6/lp4qzaTr3hBCoTWjflTFke', 'X8ekn8MaT2FI5WAgxLohzr0FldpQGIEiry8ygqhlZx5FRFupXbfQMQF9CuqIEvM2TXspQK1SiblbNbNS', '', NULL, '2023-06-27 14:42:18', '2023-06-27 14:42:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(7, NULL, NULL, 'Demo Staff 1', 'staff1_3@example.com', '2023-06-27 14:42:18', '$2y$10$DPwNFoV2o2UbLZh1mq5R/uzCaUaRFx1odX3Vri4/bYfYcNAwliHTG', 'LtTxLLePIIWaxYkpiVBq4SUwEcZSHG5fcQvBUbc9CzE8lpNMEESZjwdopobeKZwGQDXsJIuUW3Kd9KLM', '', NULL, '2023-06-27 14:42:18', '2023-06-27 14:42:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(8, NULL, NULL, 'Demo Staff 2', 'staff2_3@example.com', '2023-06-27 14:42:18', '$2y$10$5HvLiFUfq0JGTWd/F5T/SOY2rKhXW4p8eNVnbLcIVKzUoDmHZJesW', 'ZQeDWSDkUIKV2pwBXfbku6MFvnRq8XrRJuqIE371kJxuXphSLSdMWxkQmqNootVHp8HnEm5VBqEF7lza', '', NULL, '2023-06-27 14:42:18', '2023-06-27 14:42:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(9, NULL, NULL, 'Demo Staff 1', 'staff1_4@example.com', '2023-06-27 14:42:18', '$2y$10$smYAuh73JwdqBLMBkcYndOmlYtjqagLR.CQ4gj5lCTYga2/POKFeS', 'hzJ9XkWMCceAK8oDSDlJvtZQVyeftXQBtuVcbaP8uYKSjLyC6ljWAvShBeCyTitSojhzQt9ujWD1VLFE', '', NULL, '2023-06-27 14:42:18', '2023-06-27 14:42:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(10, NULL, NULL, 'Demo Staff 2', 'staff2_4@example.com', '2023-06-27 14:42:18', '$2y$10$vixvcNNsjKxdS8tK/aPw1eZTpyJC3PxYmTdK1Sad/UShuykCbzyzu', 'QE2lOe0Q4fHq0QKqO8m08nRmzJQHzBVls0axF94LfVsvXwDmRpiSZL9mFGqAU0NJWT6cdjgIXY3Rized', '', NULL, '2023-06-27 14:42:18', '2023-06-27 14:42:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(11, NULL, NULL, 'Demo Staff 1', 'staff1_5@example.com', '2023-06-27 14:42:19', '$2y$10$2dvFCxFQ3.C4FP305avSkuhSyz/impkYHAIE1NlpbMQaIlfdlHI4m', '6KZCS6O6dcD3kvLJQrBk0GJvW9Y6QscVzjZNdLA85DBNmEL3ncoA4U2VkMVw5CGNiUqktI84G4id4X6W', '', NULL, '2023-06-27 14:42:19', '2023-06-27 14:42:19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(12, NULL, NULL, 'Demo Staff 2', 'staff2_5@example.com', '2023-06-27 14:42:19', '$2y$10$14KIMk8dC1tiHZyA7Mjl5eMgv2gi.n/Mz3B82sLJqchM8JRROpTn.', '49p1BU9cy8BcoPwMQGfTox5eUYz7Is4LuNG9ilcNioktNS08JSYQjx8myRwxNGHF6u5PxBOAqvGSKLG6', '', NULL, '2023-06-27 14:42:19', '2023-06-27 14:42:19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(13, NULL, NULL, 'Demo Staff 1', 'staff1_6@example.com', '2023-06-27 14:42:20', '$2y$10$44rzTcRB7Z2XWtVvwQgv3uw3SS26zJoHgO1UzHzxXFi9v/shxXKBC', 'OUV507aEcgb5OCVCLXs8lRzaSMBqDReB4eyopdhTokNgH9eG68PQAbxPvJrkSigFUncOuLkip3PY28iF', '', NULL, '2023-06-27 14:42:20', '2023-06-27 14:42:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(14, NULL, NULL, 'Demo Staff 2', 'staff2_6@example.com', '2023-06-27 14:42:20', '$2y$10$7youp8FqLI8VzDzkbjqnl.xE4NVMcNEGgUvNOObEiTvrueVo0sknS', '7uuN9u1QcON31mbcWcyR15kOPAykekUOKTJ36RT7roiofDfQnonSKiVc2GwMYsGeS8TC7XoC5lTPgNJv', '', NULL, '2023-06-27 14:42:20', '2023-06-27 14:42:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(15, NULL, NULL, 'Demo Staff 1', 'staff1_7@example.com', '2023-06-27 14:42:20', '$2y$10$nuBAZGotYKQkCZo3B5YMpuyLaDp63fxGjbsNL9s1kUkrYadTYsk6u', 'BUEl0onOjpgXhyz71VNcV89N951WsYi8LV4E5fKeo105G0oQGmjuEnXs1QJ4W32k1dQGSRkbTQyk0jbT', '', NULL, '2023-06-27 14:42:20', '2023-06-27 14:42:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(16, NULL, NULL, 'Demo Staff 2', 'staff2_7@example.com', '2023-06-27 14:42:20', '$2y$10$0ccZ7PpQd.TjNYChCPjIAeF.Fzr6H35efwCDUsFWvkkt3f13rQx3.', '277hkPZv9EeTPLl3DcNJ56jgrBkUcTh8UQLoG2vK0qubS9GexDW6RzyrhumlAFKultEb8DST9gSWDylg', '', NULL, '2023-06-27 14:42:20', '2023-06-27 14:42:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(17, NULL, NULL, 'Demo Staff 1', 'staff1_8@example.com', '2023-06-27 14:42:20', '$2y$10$fK9V5Wex4eSrYJ974p5YLe628ZI.tUgGjnm3v5vfrc5k0tFFi6HVK', 'agmjwhlcgReDRtaxaRei1NU8W3Q7jRwMYgp2ZmJdwViL6yowAwX77ojfU5RBh97NSHsL0Os0OPJZ2mbv', '', NULL, '2023-06-27 14:42:20', '2023-06-27 14:42:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(18, NULL, NULL, 'Demo Staff 2', 'staff2_8@example.com', '2023-06-27 14:42:20', '$2y$10$6yfGwup6KmhJyHB1rM3I3e3/89.3gTnnHiSJIT3d.htv0jDhoBFJO', 'WmK2JG6ATyOSbNxnucEd4h23gQySNxeupxK3AvNeHq2lO2APnujY3IDDjCUH1QlDfccmUQGrha4vXMx5', '', NULL, '2023-06-27 14:42:20', '2023-06-27 14:42:20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(19, NULL, NULL, 'Demo Staff 1', 'staff1_9@example.com', '2023-06-27 14:42:21', '$2y$10$2MwlBXGDOjNVpV5YGhse3eEO/SLRidsNSkC/NzvJKkcCqHrwZMlZe', '2xc6KfnqKxSnuIfVTTH5LgooTRPhsgIZ7ioLhWrr2uOpCSeSWB45yl54zJUE0oguf3LDy0onQkvlzpIS', '', NULL, '2023-06-27 14:42:21', '2023-06-27 14:42:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(20, NULL, NULL, 'Demo Staff 2', 'staff2_9@example.com', '2023-06-27 14:42:21', '$2y$10$aQPq5fbmfSo1PUaWBUvvYuSqWwo.p/jjZfQWsVT4mvYfYvcCUFyAK', '16kUEiGtUhS6NblIuOHddqLAg4Uu2TktnSycSfWGvW58kKsaIXNKfiIqNVrpl3PSPJj4GRSxwsl8MJq7', '', NULL, '2023-06-27 14:42:21', '2023-06-27 14:42:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(21, NULL, NULL, 'Demo Staff 1', 'staff1_10@example.com', '2023-06-27 14:42:22', '$2y$10$ZFIM1b5Idi12xOtwqWurrOYZGn9Pf5NoEli.nzsQZgeoLPFZOtCE6', 'sG0J2lbWC4SoJBgVRZ2AuKydGJ7i1AtQOmFrceQTwcHqnQSZKRFaVjJdQjjRY7U1FKvKobd1YAhf1TJw', '', NULL, '2023-06-27 14:42:22', '2023-06-27 14:42:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(22, NULL, NULL, 'Demo Staff 2', 'staff2_10@example.com', '2023-06-27 14:42:22', '$2y$10$fv3wrWjLTli5BeBlcOURh.Zfpz4LGh0jm9O3tlRJ6zSWNkQK5TmwO', 'UuTARrdquBubTR9MEQ6mvMvJrKSFuOlrCQROKVORu7j9m0NZkxIzSa6zXcqDs9kIZvMHZ8RSGrDswj9d', '', NULL, '2023-06-27 14:42:22', '2023-06-27 14:42:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(23, NULL, NULL, 'Demo Staff 1', 'staff1_11@example.com', '2023-06-27 14:42:22', '$2y$10$VaGPiataGMyT.Et9CTJNK.CvkUfq2t4VGwUmm64zqAu7qF2IgMQ5S', '8uhaE6JWfcjp0wVqaPjPM6geI5TAiPtpjGL1jNyXC0ulUJtSzhYnssqcLMchmhUe57S6rxDMYnCBLINJ', '', NULL, '2023-06-27 14:42:22', '2023-06-27 14:42:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(24, NULL, NULL, 'Demo Staff 2', 'staff2_11@example.com', '2023-06-27 14:42:22', '$2y$10$Bgg7P3KPdlK4Uy1PV6YEA.JISkFeE7kk9TsdGjoZKUBXRaSJjJCrS', 'SNv0CjP7gcE3Q8nMtVkQJDxg1bJOmdq8zmw0pHiqeosDNPQ8m4KFGuR9JLPszMElqoYoJLr9UJXF1So9', '', NULL, '2023-06-27 14:42:22', '2023-06-27 14:42:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(25, NULL, NULL, 'Demo Staff 1', 'staff1_12@example.com', '2023-06-27 14:42:22', '$2y$10$k5mGHTwpFWV3W3DKadYVzuMhk7whC3OoCOQRwsOGc7Ww9iNhjxNTu', 'vEnMIWnJFtZ92cB99yxywOa3UfWp3rVhNeR34XL2bDTxfvwDT6xoeYbfj8vXjbESUjTLCrbdR4F3HJBO', '', NULL, '2023-06-27 14:42:22', '2023-06-27 14:42:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(26, NULL, NULL, 'Demo Staff 2', 'staff2_12@example.com', '2023-06-27 14:42:22', '$2y$10$m8epK/f63NvpZ7CnJhkdjOpQFZQ0hORgA8X90IrAPhC1OcNs9S3pS', 'mtJm5X7EOSz1wjiQTgWARduoxcCpi2QJO0stm3tRm0sJ5HXg19M3Uw2ewA0gTsynBB9ONoER6Ah3hQwT', '', NULL, '2023-06-27 14:42:22', '2023-06-27 14:42:22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(27, NULL, NULL, 'Demo Staff 1', 'staff1_13@example.com', '2023-06-27 14:42:23', '$2y$10$UT9nJlUhi0bt3q/p/bhwx.S2N2PtF1Z3ifFrVDGz6BJNb96fzDcQ2', '9UhsvT7bLgFjuiCISpZ4m43nmQG1HHyjz0GGTXGlTOfn4MUQv1rruVGcNKeC1Yo3EiS89MNnbQ1NK6Fw', '', NULL, '2023-06-27 14:42:23', '2023-06-27 14:42:23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(28, NULL, NULL, 'Demo Staff 2', 'staff2_13@example.com', '2023-06-27 14:42:23', '$2y$10$KBwdx5OY1/TIxffj.XVMgOn42qP.LM9Kh.UqgbXcBCMAsOoP67eta', 'tWBCdsAw20hWWyXrE44Wl85fpgitgtepnaGPRXxyB63Ftd5NUEi55GjqUISPy0e0X6VTSwNGAzWV88l3', '', NULL, '2023-06-27 14:42:23', '2023-06-27 14:42:23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(29, NULL, NULL, 'Demo Staff 1', 'staff1_14@example.com', '2023-06-27 14:42:23', '$2y$10$UPGKcDFgsU7VuCBblRNlJePsCP2NLqDvCsxjALdxomKa34kSK.H/2', 'fYq4xoE6vA0RRHFcuK0fg0H69oms91Agkn1JbYQdpQvyeS6iWaFj3N5VAhbJI8n668CRdjRkIr6zt6ms', '', NULL, '2023-06-27 14:42:23', '2023-06-27 14:42:23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(30, NULL, NULL, 'Demo Staff 2', 'staff2_14@example.com', '2023-06-27 14:42:23', '$2y$10$worQaka/Ktb.XHzaZR4km.ecADt2QTwTle.KykEAg23ahIKVaxaTO', 'gc6h5dBN7WaDKimTYrH3zoC5gCrkj4ulFeoSk5on9AldCluLsd0FnCZk05NJRU5fsi0HmgcDvkTUvEDs', '', NULL, '2023-06-27 14:42:23', '2023-06-27 14:42:23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(31, NULL, NULL, 'Demo Staff 1', 'staff1_15@example.com', '2023-06-27 14:42:24', '$2y$10$lc4geYv23SPXDZroPgGgROdlNzRECRd6V9j2IAMMnrCaME/6tzGC6', 'l0uQF1GC85nokykFiWjo8vyetykwGj2Zc6uQ6zni5qBwBsbiA8SzZtZ7RabhQPLIW88lsLd5tongrLnZ', '', NULL, '2023-06-27 14:42:24', '2023-06-27 14:42:24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(32, NULL, NULL, 'Demo Staff 2', 'staff2_15@example.com', '2023-06-27 14:42:24', '$2y$10$G8UjL52hRB.on4I/9iFSA.N1t8xaMUfhnCnchW2k0IKK8MirrN5/C', 'sz3ZDllykj77a9bufayFQCrgTyQ9T0IIlygmZFj3JuzKL1HpZ7kBr4SJU2uk4JlNjD9VgBVgBTI6kcVH', '', NULL, '2023-06-27 14:42:24', '2023-06-27 14:42:24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(33, NULL, NULL, 'Demo Staff 1', 'staff1_16@example.com', '2023-06-27 14:42:24', '$2y$10$LUrlYqkAI2o0eDue9GUo4el0pgGxM0HFuJEihqU8W5zDZx1cGJDOW', '97bZOwXkamRb48loFGkI1AmfwA2lKqQ2OsNMOq0OcipYOB5nIvkLWkZlfAPX0XKC6lD9EfMb2Txa58Dj', '', NULL, '2023-06-27 14:42:24', '2023-06-27 14:42:24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(34, NULL, NULL, 'Demo Staff 2', 'staff2_16@example.com', '2023-06-27 14:42:24', '$2y$10$UkD9KpHsyls9zyWRiE/Lb.o0uYmzEZBXTD6qTGjMkNP50V1g80CwW', 'wzNg1hLDsWjkr4D7saNHhPhRaHCToYu4tRiD2cry8pH7Cps1h9lykk1I8wjob7GG3z3Xto6JH03dUl4R', '', NULL, '2023-06-27 14:42:24', '2023-06-27 14:42:24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(36, NULL, NULL, 'Pierre MARTIN', 'pm@admin.com', NULL, '$2y$10$vQRsOvrQOPx8u8Y0FKvVPezWXsoF0NO.Rr/ONBoTGM3hBh8ub8fmi', '9VQTxQFUqEK05dfnjeKlI3E8Rg3mqpYl0RldrWFQuNp61wxLvZFQdDkLwCndDn318qrTFo4WpcS3XNia', NULL, '0IigeaKFGmykzWJj87C49sAQxAdn1p4SefvqjbxkzBuVzz2u4HawFyDX2SjX', '2023-07-04 17:29:09', '2023-07-05 15:35:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2023-07-05 15:35:00', '', NULL, NULL, 1),
(37, NULL, NULL, 'Paul', 'paul@gmail.com', NULL, '$2y$10$btN/GAw6fGI5SaKXD7M4aOKmt0Unb52vR5qbGLPO1W9wzk9jRVWqi', 'D9dgc5n07BgDjzaHylkwmhBxlUoPS8THKXQfuv1D8j2sgEYKLWpw6698MqlxFuoecMJxcvQmeJGEHvuP', NULL, NULL, '2023-07-04 21:51:06', '2024-02-01 17:02:44', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-02-01 17:02:44', '', NULL, NULL, 1),
(39, NULL, NULL, 'Paul square', 'paul.square@testing.com', NULL, '$2y$10$kCzsQGkzx1hO5j2NVC6tAuS1XRtFhkWfy61pVQN6HsMkgQ7KW1ifW', 'i2zLqrogU1T2UgYG2WqNxGLkXSuOCsJPDgIRK193VN2xciNVpRlft00Cn0GOaw2vEt6pLiki1TpuY7PZ', NULL, NULL, '2023-07-05 15:45:53', '2023-07-05 15:45:53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(43, NULL, NULL, 'neo', 'neo.george18@gmail.com', NULL, '$2y$10$B6sBMPMbZn1Ai0YHe9EK4.QsYmV1IUIgj1NjvSgdNi23glxRq.QGu', 'PbjoJopQuGaTC4WMiYZUyAmCBgEWkXfBCUvIzoSfNaFBrRH2izCDi8d0BeCPFu3UGGp5hM59YSwxwGMS', NULL, NULL, '2023-07-25 16:31:21', '2023-07-25 16:31:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(46, NULL, NULL, 'ASd Ads', 'asd@asd', NULL, '$2y$10$iFXqetxrnmEhpgMMRMkixu9ku4HRzMC7qPm5ezI1Lb/1LO/qzeIp6', 'qgxIkhKOF0b0sorXefEKpEZMwpbwoCdPYzGH1U1dA3aJz8UW1cYAWo82XqTsb5xfjLrQpDVV1STrWik3', NULL, NULL, '2023-07-27 06:51:41', '2023-07-27 06:51:45', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2023-07-27 06:51:45', '', NULL, NULL, 1),
(53, NULL, NULL, 'Paul', 'paul@truck.fr', NULL, '$2y$10$x6P.KPhYlv17lUzjjwBzUeM.5tpCk0nL1I45lrctET71zmLA2HkSy', 'Z9YLzKw3AWhJwwefgpjL84msUtCq9sdGZT9LlJEWBQpIaBGEaFeV3ilHsPw5pJyy2xXiQCo7YAELnXEE', NULL, 'liUc5pygnjhFqYclh6gdYZsf9MunaD15bNOb3b7enmFI7FLsZbewjM93ylWB', '2023-08-31 15:36:29', '2023-08-31 15:36:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(54, NULL, NULL, 'Pierre', 'Pierre@truck.fr', NULL, '$2y$10$08EXzft4aEmmtV5sr6Abl.HBKUoNbAMaQ5/I43X1oKlpfnwyoP7dW', 'GK7WmIe19XlSVqWgeOT3Vj58FO9BArRBjvICouQSqKwO203owNTomgfqYb6VSe4EhsiyueIkYRQulD1X', NULL, NULL, '2023-08-31 15:36:48', '2023-08-31 15:38:12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2023-08-31 15:38:12', '', NULL, NULL, 1),
(55, NULL, NULL, 'Patrick', 'Patrick@truck.fr', NULL, '$2y$10$QUH1lPqbxCjjPa2vo0aAgOWoYhCZWo.kYIPZpTNv4aeDa09PqgTba', 'DRYtRJyYmkqr8dwVnRSYuZMvXldSOIJVG7icQyDfMIinwaB6PFEzZKowErrXLSZeu7fxqfSrpFqxGgyp', '0649604505', NULL, '2023-08-31 17:58:35', '2023-09-14 16:50:53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 1, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(56, NULL, NULL, 'adsad', 'admidsadn1413@gmail.com', NULL, '$2y$10$Ld.JTnfduXhJORoOJ7RQG.jRvZ8OY51/B5wASlLTMy4/qFWmQOQoK', 'nuwJgH2usj2HAuwTRdgkb4t8T1ji0HrbtuTYL1a7rnv5WC3IKwJjnnXOEvOeqpi1N57b2KZ0whpTKVaD', NULL, NULL, '2023-09-08 12:11:05', '2023-09-08 12:11:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2023-09-08 12:11:10', '', NULL, NULL, 1),
(57, NULL, NULL, 'test', 'admin141tt3@gmail.com', NULL, '$2y$10$T1C4Y0jc81LlFVDKFX.pMeDrbect6dFocikb3C9i3DSllrRpZWaQ2', 'xNjCmlvDfvN74z6fJFK8lJx9A0R844NBtv7i1BnsSOtmsPDkQdQPIa4WktnOgsJBMMroA1P3D9KWpAdE', NULL, NULL, '2023-09-09 12:13:28', '2024-03-12 18:28:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-03-12 18:28:29', '', NULL, NULL, 1),
(60, NULL, NULL, 'hello world', 'hello@gmail.com', NULL, NULL, 'YQe71I2JLqXz45D5kObtSRO8JoELLiR9UAbBzvgqQQ0RnWOaJaeAgkvWS7wwNangpNXzwdygqhnO7A3D', '+1023456789', NULL, '2023-09-14 17:47:19', '2023-09-15 18:50:27', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2023-09-15 18:50:27', '', NULL, NULL, 1),
(88, NULL, NULL, 'Demo Owner 1', 'demo1@demo.com', NULL, '$2y$10$sVe8LaMMoS17nJ50Dx9/TuscbJXBI3Sx/EGvTg73YXD5gX0M0AD72', 'veYIxxVeddRjFJufATAQOdbJL0YGNTsQFUNh7afFPRwW069OiIRHQDxs0X53vYXaoq5OXZKtUV7RFntK', '+1123456789', NULL, '2023-12-17 16:45:27', '2024-03-19 17:09:59', 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'set_by_admin', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 61, NULL, '', NULL, NULL, 1),
(89, NULL, NULL, 'Demo Owner 2', 'demo2@demo.com', NULL, '$2y$10$ayxR3PHv63zvkG1EIzj2NuLsgyIvpyQcCTNDexRt52V1RH5/bL7cK', 'cXyrBPIhadpJTSZ1wtBF81UtfBbMa0t1LgIlc2cv8OYYzOsYD2HJ1A1MMSUXEsoKlDhwtq0cEZOdNGkY', '+1123456789', NULL, '2023-12-17 16:54:10', '2024-03-19 17:07:36', 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'set_by_admin', '', '', '', '', 'acct_1OdwbwIjY7ugbD2t', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 62, NULL, '', NULL, NULL, 1),
(90, NULL, NULL, 'Demo Owner 3', 'demo3@demo.com', NULL, '$2y$10$.L3sg8oLYG53/0ZUxDUCyO8r0XWMLAqKvhMA78WHCXVcafRCk/.Hy', '6GYC9eXaajgXxaxyP4S3hHSKQqw5EcKQLQdivGTzYTXb3unRX1vVRqVFdqHp4ZG7xs81JOuVzF1s6LpD', '+1123456789', NULL, '2023-12-17 17:01:21', '2024-02-13 00:48:38', 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'set_by_admin', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 63, NULL, '', NULL, NULL, 1),
(91, NULL, NULL, 'Demo Owner 4', 'demo4@demo.com', NULL, '$2y$10$bF8Blh1APLHHbCmFRO5C7e2hJRmIbSdLWQ1QQgq54qvLMNOtXCTPy', 'minznuj6DzqUQfGjYK0WVm7zGzSnxXJlqsPhMMufxzvYhex9VyBubXCAHDpMzinziVL1sEEwr0TKTkZ2', '+1123456789', NULL, '2023-12-17 17:04:08', '2024-01-29 22:15:41', 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'set_by_admin', '', '', '', '', 'acct_1OdwYhREkMMa061l', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 64, NULL, '', NULL, NULL, 1),
(104, NULL, NULL, 'JHON', 'TESTJHON@GMAIL.COM', NULL, '$2y$10$RETrznS0dvcB6/Lh2UT/e.KRSnVmPshX2TYzLGntVxG9aJ8Ml2nNm', '2LQGxEFfINRdyDQE3eHcDbP94mCWAiRrIb7BoCGtvbjKeCrdaFCZXhNTuC7wxBFRTVTs6Y7tfsF8a5Z5', NULL, 'wuq2B87NbwJbaXyWaJ5uQrWIBadhIaEQAAf7Y14RvUPiqKWk6IlOZqnhNQa1', '2023-12-21 21:04:55', '2023-12-21 21:04:55', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(105, NULL, NULL, 'LIM', 'testlim@gmail.com', NULL, '$2y$10$zdUyIayiyxmVHT4W7KF/YeDV4wXD5I1FF1oiW00nI6UkvLzEpoh9.', 'o7R5LtPpC2CuWDrBYIfzlGJrSg5So1Dv1vHZcE97x7yWjlkI3Otm1icC1QHXLWbMDPFM8ITpKGXKqPv5', NULL, NULL, '2023-12-21 21:06:21', '2023-12-21 21:06:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(106, NULL, NULL, 'Paul', 'testppaul@gmail.fr', NULL, '$2y$10$ymqrrIIbDFVgCoLpLzKxQue3Rh6ez01.u9YI8MdUFrSbFCl/g3Lx6', 'imDvf0fx1n7Avv1cHQuGRWdxNInI956hSDmJIE86Q1a17EpCBR9nYUQmld7Oz9vsYipKpy1Zyr8PBUHk', NULL, NULL, '2023-12-21 21:06:44', '2024-02-01 21:41:49', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(121, NULL, NULL, 'Some Driver', 'somedriver@gmail.com', NULL, '$2y$10$16gNeZMPV1PPFbyQEeuMZut7.2mHuTaxdL1/frrKPe9S878mlWl.i', 'uWPpBRZbs8iDGLXNxKrT6HYmghIyC6rylqbiHQE88tBTqKqbYAjXAFJTC9O7FSl02REgTMLTmrspB47K', '+880123456789', NULL, '2024-01-17 18:05:18', '2024-01-17 18:05:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 62, NULL, '', NULL, NULL, 1),
(122, NULL, NULL, 'zxczxc', 'skhimelhaque@gmail.com', NULL, '$2y$10$.bp3YdPIzFOnDjxXoqK8HunMQwFnOgpw.bxhymiJM.jCb3y.U2yDa', 'S87n6KrvE1DaLBcgBBqPQYodPNWgFeDRVJD9a7tApuCTguufITSFbZl1T8kfyf4oJdBSu6408PW7RUh5', NULL, NULL, '2024-01-20 17:22:36', '2024-01-20 17:22:44', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 63, '2024-01-20 17:22:44', '', NULL, NULL, 1),
(123, NULL, NULL, 'SK Himel Haque Bikon', 'skhimelhaque@gmail.com', NULL, '$2y$10$26oaHP/ybyx/Wy.fKNof7.EW72lqUxcvoJj0DGus1zPP8bW5.qVWG', 'Bx8w82dVIKuGX6oN17ZKKGTbaIdljeSwf5iVgtNgruCRFilLyOeuHDFFYZD1Mct3KMDNIW58ANpC0sWq', NULL, NULL, '2024-01-20 17:25:46', '2024-01-20 17:25:46', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 63, NULL, '', NULL, NULL, 1),
(127, NULL, NULL, 'Your Staff', 'yourstaff@gmail.com', NULL, '$2y$10$hrarMY1HYannmZd0OEIQKO6M9EQmIQDTYwypuzv78K.7M8fDuGMry', 'zQ1o2gDq0B87qWHAt4o8u3UXqAsS6benAfqOdWJ92Jm7C79MeaEGX1NZjTJLjJaq99zYn5ojoaZBoet3', NULL, NULL, '2024-01-21 18:25:40', '2024-01-21 18:31:59', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 62, '2024-01-21 18:31:59', '', NULL, NULL, 1),
(159, NULL, NULL, 'Marcel', 'driver@gmail.com', NULL, '$2y$10$/DhlYzNwnDTSF8zdH9nx3OfsGhGbXhxzCBRZNQYdRi7b4vLaesEy2', '9gvIaKYLfdpCAAMetnA9yqYqP3nl6pBN6U5SZQEAPFMNx59M3ykzoSnaL8OBj4fmLAQEgwHUn3GYZ2ED', '+380635851611', NULL, '2024-02-14 20:47:25', '2024-02-15 22:37:37', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '47.90880188273869', '33.34572972450693', 1, NULL, 2, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(160, NULL, NULL, 'Winston', 'transporter.krog@gmail.com', NULL, '$2y$10$gPKrrTjgVdRZ4l9XZIejs.eL9TKJbHtaU0z4tH84mqxMlho7AXPJ.', 'wGBKXwQGPCOBaC8LZDA0KSa8tjJPFK0o6fPxHoIxnrPPXSajAAaFrWAMKjpIgbABNjalaiba3yKn8qCj', '380977777777', NULL, '2024-02-20 17:40:48', '2024-02-20 17:40:48', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(193, NULL, NULL, 'john smithd', 'milok41222@artgulin.com', NULL, '$2y$10$TR4TSUgWWOUz4/tQnmXsgeO.LI6Pe1mnogoWU/J8fZjm7GDrx87Fu', '6pmgqjrfKJVDT9LxbD0n0ceryCIOrZbsGDaUyfKtFAIxAhoGa2841y84vnoPc0CSGT1c5dgcMAtmtlVb', NULL, 'RWkc30f5QgNTb6cozkkLWdoCF6pcEPjkr1YKcXu5gzonKk8t6epOWB9PR0ME', '2024-03-11 10:54:09', '2024-03-11 10:55:40', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-03-11 10:55:40', '', NULL, NULL, 1),
(195, NULL, NULL, 'Ivan', 'ivan@gmail.com', NULL, '$2y$10$wJ/N2/RLBand1NXR/hOVwOdt5h/xDr49Kg/BjUjf/9LKZdtq2iWuu', 'W21gbh283mH7tUILdvAeAGbP981tLxsT0SI1abIoY1Jmj3JOimJe4Bg57yyBHzea8mbnW5FptoGuy3bk', NULL, NULL, '2024-03-12 18:29:05', '2024-03-12 18:29:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(221, NULL, NULL, 'ditrahetri', 'ditrahetri@gufum.com', NULL, '$2y$10$vm1wPb8kujN.uhB9RxMtee4wDjxCrpQ8P8uNPX/M4Fyk1XjUtuvPS', '8KPR5Ln1iNlB19BJiBklucGt9q5KVp2ZDqg9lMRJ0TZQtcU5mzzUpT1bELylNz7OOGXSVNAVLMLfjtpq', '1121132132132132', NULL, '2024-03-18 20:29:26', '2024-03-18 20:30:45', 1, 'cus_PlDdy69HkV3ESN', NULL, NULL, NULL, NULL, NULL, 1, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(222, NULL, NULL, 'dsfgdfsg', 'dsfgfdgs@sdasdafg.com', NULL, '$2y$10$B7HcevXOZRAZjbN1BhEq5.TX3Z7EQh7rdxeN/wwogyMZ6muzpAMQG', '50YHCBKP4EiaQylrVm2JWXKZkcbpyKGQsk4WZjPokDVHBNw3cMdPwhciwf5MW4SXicJx0vYOQLq2gKJM', '12015550123', NULL, '2024-03-18 21:08:58', '2024-03-18 21:09:35', 1, 'cus_PlEGZZHVVOR3KY', NULL, NULL, NULL, NULL, NULL, 6, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(223, NULL, NULL, 'dfgssdfggfds', 'fdsgfs@fdgsdgf.com', NULL, '$2y$10$jhHEd9EdqtJnmpMrtqpBruMrjc.bWU0qV6.Xf4W5L8oTRf6N5ucNW', 'G2lXU7SMQciOYc460cAxeiozNCUfg0KVkxEERJvvt8s3vcXIbvOVclxV8z8UefB0daR9aioIXAdtTsNB', '12015550123', NULL, '2024-03-18 21:47:03', '2024-03-18 21:47:37', 1, 'cus_PlEsar5qXB2bx3', NULL, NULL, NULL, NULL, NULL, 5, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(224, NULL, NULL, 'dsfgdsfg', 'gdsfgsdf@dsfsdfg.com', NULL, NULL, 'ZAiYmYhvXnrO5DOZKK9R4ptjKEmX9jd0UlFZF1PyL9igiOVGRHnznmVgiYCVWgRZNw2xzk4BprUy1PFG', '12015550123', NULL, '2024-03-18 22:25:52', '2024-03-25 15:39:14', 0, 'cus_PlFVbhb7tyHoN2', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-03-25 15:39:14', '', NULL, NULL, 1),
(225, NULL, NULL, 'Pyathas', 'contact@lanka-food.com', NULL, '$2y$10$BkKK0xX.N8IUTwA5TBLtQ.WgylBluyc3fATazq56ncEcYIllnNcRe', '2eALDW5McRLX5UuseHH1DPJGrmKS6bOGyTTDt93oV2slHC873QauFZAwQnYwIcSNLW4OgeIayGorzkMU', '+33769016306', NULL, '2024-03-18 22:30:30', '2024-03-30 19:21:01', 1, 'cus_PlFaTOXDGc43NN', NULL, NULL, NULL, NULL, NULL, 15, 'set_by_admin', '', '', '', '', 'acct_1OyrOdI21cuaeYjx', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 187, NULL, '', NULL, NULL, 1),
(226, NULL, NULL, 'test branding', 'testbranding@dfsdf.fr', NULL, NULL, 'HwZsM6L3PtsJ79youf3xcdIpOE6jKl9bXhuDWYlAPHW7YRZNDEFWKef5WcrlZtPDDNjWB5DBCOyCfVMn', '11213123132123', NULL, '2024-03-19 16:29:12', '2024-03-25 15:39:09', 0, 'cus_PlWyyvp4B3vvkJ', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-03-25 15:39:09', '', NULL, NULL, 1),
(227, NULL, NULL, 'sdlkjdfhsb', 'dsflkjgsfhjkl@dfsgkjh.com', NULL, NULL, 'EJP2RUn5uNzk1PwvAlTuPY5M91gVcpf4zTSG1ujLTNBrESkK6OJQLPb63iwV4QTXcop3v29vVP4CxE1E', '15616515454545', NULL, '2024-03-22 16:17:09', '2024-03-25 15:39:06', 0, 'cus_PmeSPtTm1XiGOX', NULL, NULL, NULL, NULL, NULL, 6, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-03-25 15:39:06', '', NULL, NULL, 1),
(228, NULL, NULL, 'dsfgdgfs', 'dsfgdgfs@sdfsdgg.com', NULL, NULL, 'DHOzTVmXLZgVbtaqp4srhnG94kSyVSuYqGQcGMqzQjxGWGbAtbR5EdC6lYIsMkIMTcXYwbQwl2YSUPrU', '16546546546546544', NULL, '2024-03-22 16:23:40', '2024-03-25 15:39:03', 0, 'cus_PmeZZZnCeTaGpc', NULL, NULL, NULL, NULL, NULL, 6, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-03-25 15:39:03', '', NULL, NULL, 1),
(229, NULL, NULL, 'hjklh@kjhjk.com', 'hjklh@kjhjk.com', NULL, NULL, 'TZMvLkDZQpDtlmespLgasf3XrAlyeKgGHUVuVWyjj0iQieJ9bOCRHryXaSKRxJOUt4bAMdSLha4gwa9c', '380504751256', NULL, '2024-03-22 17:41:25', '2024-03-25 15:38:59', 0, 'cus_PmfpuxcVaVAanO', NULL, NULL, NULL, NULL, NULL, 6, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-03-25 15:38:59', '', NULL, NULL, 1),
(230, NULL, NULL, 'asdfsdfafsad', 'asdfsad@lkjhlj.com', NULL, NULL, 'hwQJZue0IyK4LTVtRy5t0eyTOjEwWL521gQOBAz739JJIsa2z8F5Bb1rF6NBT81DbbZsJPftzwzV0Emy', '+380977777777', NULL, '2024-03-22 17:44:10', '2024-03-22 20:15:02', 0, 'cus_PmfrUaDVyQNHKV', NULL, NULL, NULL, NULL, NULL, 6, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-03-22 20:15:02', '', NULL, NULL, 1),
(231, NULL, NULL, 'jo', 'jo@gmail.fr', NULL, '$2y$10$Jc7VGNl6HOD2g0Qqj.YO5OrC31bU4W2daaM562VJQYWSQQVAI0FjK', 'mJWXwD2wlVDsAdpxXRPOOy4VF20YVRCtY6EMNqT1IdelvdGwFHodX3Vj9qSQGcgAf5gAkY89ZcUDcPVe', NULL, 'jVe5fdYJMeH4HMk2Tmi60m73ZLnoGyZTSFUqMMWy1Nyi3obUSUBArnvgmezr', '2024-04-11 21:42:50', '2024-04-11 21:42:50', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, 187, NULL, '', NULL, NULL, 1),
(232, NULL, NULL, 'Paypal Subscription test', 'testmodemenu@gmail.com', NULL, NULL, '3BeNbjSWIdT4AGXU0yUkemsL5WeovBQBc77oDqMnltXN9eKwuYxjiBffDh3MzRgmcSnJfInHGAx3IHwq', '+330653334244', NULL, '2024-04-18 17:08:50', '2024-04-18 17:08:52', 0, 'cus_PwlQaZdSiUuYHs', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1),
(233, NULL, NULL, 'himel bikofgfdgn', 'skhimelhadfgdfgdfgque@gmail.com', NULL, NULL, 'GXWxaDKaqoiJfYYSkBtGBMwwrD09SrPJmMLCV0TytYpgwVHS9AIEkNvA4P8GfikRJdrJJ8ZcJthMx9hF', '+88001457583450', NULL, '2024-04-27 11:10:35', '2024-04-27 11:10:39', 0, 'cus_Q0DKLyTvuZ0Hj0', NULL, NULL, NULL, NULL, NULL, 6, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(234, NULL, NULL, 'hiwerewrwerkon', 'skhiwerwerwer@gmail.com', NULL, NULL, 'kTXsoBU0gzr2CUPViht7zb4NNkeOrMbJmCdR0G7EhEKRShUepFS41312osJQ2rOa21kajFStZrrjtaIS', '+88001735447580', NULL, '2024-04-27 12:57:31', '2024-05-06 11:55:31', 0, 'cus_Q0F3TG4Of59tIC', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-05-06 11:55:31', NULL, NULL, NULL, 1),
(235, NULL, NULL, 'himel bikerterton', 'skhimelhaqertertue@gmail.com', NULL, NULL, 'A0ml1wXljckrZYGovry4kqhffcaO9xC50Bt7faV1bJ319kheZ3UpyHbA4cj2KfFkJuFTxUcwN8lHa5Gk', '+88001735447456580', NULL, '2024-04-28 05:58:00', '2024-04-28 05:58:05', 0, 'cus_Q0VVLKJdg1UZkA', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(236, NULL, NULL, 'SK Himel Haquegg', 'skhimefgdfgdaque@gmail.com', NULL, NULL, 'LZid0uGYlkK4yOrjbiYjSfZ4M55gof87bqTMToxKvrrLnhzRypkcwEVNuo3e604tXBE6dYbvJti4QFAM', '+88001972025117', NULL, '2024-04-28 06:05:43', '2024-05-02 10:44:01', 0, 'cus_Q0VdRIl9uOoo3V', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-05-02 10:44:01', NULL, NULL, NULL, 1),
(237, NULL, NULL, 'himel bikonfgh', 'fghfghque@gmail.com', NULL, NULL, 'gWhiZ6W6OY6VUfJca7aSwL7On7d6MpWL2Q1L8VMOJqgNiIU24Mgoz7Fp6q0xGkQUKKbpHfzoXfwa3dUw', '+88001735447564560', NULL, '2024-04-28 06:06:58', '2024-04-28 06:06:59', 0, 'cus_Q0VeTXAqjdpYwA', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(238, NULL, NULL, 'tujfgjhnhjghjyel bikon', '4564564564aque@gmail.com', NULL, NULL, 'XjCdGW6D5U9MmRvFIP7TEZNcwyOcqTZVmkcRe6s5fBwZjr9Cc4tSQ8wYjzjICNOMTgTdkEDGJCObTOnm', '+88001735447580', NULL, '2024-04-28 06:08:01', '2024-04-28 06:08:03', 0, 'cus_Q0VfK8pWxjJp35', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(239, NULL, NULL, 'himel bikonfdgdfgdgdfg', 'skhisadrw4efwsef@gmail.com', NULL, NULL, 'MG4lQVWFkbz7pjWfQ6hxNYWLE6S9YKIw6U68ncOOg4KucC8njtWkzOmOi1FUdGirvu13v2VHKrECdVDL', '+88001737567567566580', NULL, '2024-04-28 06:09:30', '2024-05-08 03:50:43', 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-05-08 03:50:43', NULL, NULL, NULL, 1),
(240, NULL, NULL, 'himel bikonyuiyui', 'skhimelhaquuiyuiyuiyuiye@gmail.com', NULL, NULL, 'qJmiR09ZZIua6ETMRYefIDZG6t3iBGGDsUcNfAlDPL3ENStK4zyuYNOv89kDIeHWMStmPwDQHRpcHgLG', '+8801735-447560', NULL, '2024-04-28 06:09:48', '2024-04-29 05:55:59', 0, 'cus_Q0VhfXEoU3OEKD', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-04-29 05:55:59', NULL, NULL, NULL, 1),
(241, NULL, NULL, 'himel bikonfgh', 'skhimelhaqtyue@gmail.com', NULL, NULL, 'pejSWORoEbzSsO4SJGPqejW8mZvKCBA70n3rVjnwejlEWyDznOoy8h7A5ne7QZqGhGGZ4DaTuveKaHVd', '+88001735453580', NULL, '2024-04-28 06:21:59', '2024-04-29 05:55:52', 0, 'cus_Q0VtsKCri9UsnI', NULL, NULL, NULL, NULL, NULL, 11, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-04-29 05:55:52', NULL, NULL, NULL, 1),
(242, NULL, NULL, 'himel 67867bikon', 'skhime678678lhaque@gmail.com', NULL, NULL, 'FeEsiPpn2fDAE7LLObmigQLbeOKorGdIo54KYqnph0PKQ2OYePYPsfTeLXtRsLIsUgN8ZIYnkrXc8XuA', '+88001735447686', NULL, '2024-04-30 10:31:30', '2024-05-06 11:55:46', 0, 'cus_Q1KNii3kfKeDRJ', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-05-06 11:55:46', NULL, NULL, NULL, 1),
(243, NULL, NULL, 'himel bikonfghfh', 'skhimelhajghjghjhjkhjque@gmail.com', NULL, NULL, 'fKDf0EdJCKhhDbl4l8YZTyJ0ecpwvhHQaCSs4lR5Y6rOLIgvl3hbDP1q5KTlr88MZaRHJRmYfMjvE2mF', '+88001735678447580', NULL, '2024-05-02 06:22:00', '2024-05-06 11:55:38', 0, 'cus_Q20nbG5meugGhN', NULL, NULL, NULL, NULL, NULL, 2, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '2024-05-06 11:55:38', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_categories`
--

CREATE TABLE `user_has_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `options` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `enable_qty` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `item_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_system` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `price`, `options`, `image`, `qty`, `enable_qty`, `order`, `item_id`, `created_at`, `updated_at`, `deleted_at`, `is_system`) VALUES
(8200, 12.99, '{\"196\":\"sadsd-sadsdeur\",\"197\":\"new-itemsdsad-0asdasdasdeur\"}', '', 0, 0, 0, 423, '2024-01-17 17:01:36', '2024-01-17 17:01:36', NULL, 1),
(9065, 3.99, '{\"199\":\"berry-bliss-burst\"}', '', 0, 0, 0, 422, '2024-01-29 01:18:30', '2024-01-29 01:18:30', NULL, 1),
(9066, 3.99, '{\"199\":\"citrus-sunrise-splash\"}', '', 0, 0, 0, 422, '2024-01-29 01:18:30', '2024-01-29 01:18:30', NULL, 1),
(9067, 3.99, '{\"199\":\"tropical-mango-tango-120\"}', '', 0, 0, 0, 422, '2024-01-29 01:18:30', '2024-01-29 01:18:30', NULL, 1),
(9068, 3.99, '{\"199\":\"green-goddess-reviver-120\"}', '', 0, 0, 0, 422, '2024-01-29 01:18:30', '2024-01-29 01:18:30', NULL, 1),
(9069, 3.99, '{\"199\":\"watermelon-wave-quencher-120\"}', '', 0, 0, 0, 422, '2024-01-29 01:18:30', '2024-01-29 01:18:30', NULL, 1),
(11590, 0, '{\"204\":\"sovinion-20eur\"}', '', 0, 0, 0, 516, '2024-03-26 17:02:14', '2024-03-26 17:02:14', NULL, 1),
(11591, 0, '{\"204\":\"chardone-10eur\"}', '', 0, 0, 0, 516, '2024-03-26 17:02:14', '2024-03-26 17:02:14', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `variants_has_extras`
--

CREATE TABLE `variants_has_extras` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant_id` bigint UNSIGNED NOT NULL,
  `extra_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_has_categories`
--

CREATE TABLE `vendor_has_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `table_id` bigint UNSIGNED DEFAULT NULL,
  `by` int NOT NULL DEFAULT '1' COMMENT '1 - Owner, 0 - Client Himself',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_user_id_foreign` (`user_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_vendor_id_foreign` (`vendor_id`),
  ADD KEY `banners_page_id_foreign` (`page_id`);

--
-- Indexes for table `cart_storage`
--
ALTER TABLE `cart_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_storage_id_index` (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_restorant_id_foreign` (`restorant_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_alias_unique` (`alias`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restorants_name_unique` (`name`),
  ADD UNIQUE KEY `restorants_subdomain_unique` (`subdomain`),
  ADD KEY `restorants_user_id_foreign` (`user_id`);

--
-- Indexes for table `compare_plan_name`
--
ALTER TABLE `compare_plan_name`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `compare_plan_name_plan_name_unique` (`plan_name`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domains_domain_unique` (`domain`),
  ADD KEY `domains_tenant_id_foreign` (`tenant_id`);

--
-- Indexes for table `dynamic_prices`
--
ALTER TABLE `dynamic_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `expenses_expenses_category_id_foreign` (`expenses_category_id`),
  ADD KEY `expenses_expenses_vendor_id_foreign` (`expenses_vendor_id`);

--
-- Indexes for table `expenses_category`
--
ALTER TABLE `expenses_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `expenses_vendor`
--
ALTER TABLE `expenses_vendor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_vendor_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_item_id_foreign` (`item_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hours_restorant_id_foreign` (`restorant_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `item_has_allergens`
--
ALTER TABLE `item_has_allergens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `labels_slug_unique` (`slug`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `localmenus`
--
ALTER TABLE `localmenus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localmenus_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_item_id_foreign` (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_client_id_foreign` (`client_id`),
  ADD KEY `orders_restorant_id_foreign` (`restorant_id`),
  ADD KEY `orders_driver_id_foreign` (`driver_id`),
  ADD KEY `orders_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `order_has_items`
--
ALTER TABLE `order_has_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_has_items_order_id_foreign` (`order_id`),
  ADD KEY `order_has_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `order_has_status`
--
ALTER TABLE `order_has_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_has_status_order_id_foreign` (`order_id`),
  ADD KEY `order_has_status_status_id_foreign` (`status_id`),
  ADD KEY `order_has_status_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paths`
--
ALTER TABLE `paths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `period_discounts`
--
ALTER TABLE `period_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `period_discounts_item_id_foreign` (`item_id`);

--
-- Indexes for table `period_discounts_for_restourants`
--
ALTER TABLE `period_discounts_for_restourants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `period_discounts_for_restourants_restourant_id_foreign` (`restourant_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_coupons`
--
ALTER TABLE `plan_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_coupons_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `plan_limits`
--
ALTER TABLE `plan_limits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_limits_restourant_id_foreign` (`restourant_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_rateable_type_rateable_id_index` (`rateable_type`,`rateable_id`),
  ADD KEY `ratings_rateable_id_index` (`rateable_id`),
  ADD KEY `ratings_rateable_type_index` (`rateable_type`),
  ADD KEY `ratings_user_id_foreign` (`user_id`),
  ADD KEY `ratings_order_id_foreign` (`order_id`);

--
-- Indexes for table `restoareas`
--
ALTER TABLE `restoareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restoareas_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simple_delivery_areas`
--
ALTER TABLE `simple_delivery_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simple_delivery_areas_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_verifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_name_unique` (`name`),
  ADD UNIQUE KEY `status_alias_unique` (`alias`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables_restoarea_id_foreign` (`restoarea_id`),
  ADD KEY `tables_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `temp_orders`
--
ALTER TABLE `temp_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`),
  ADD UNIQUE KEY `users_verification_code_unique` (`verification_code`),
  ADD KEY `users_stripe_id_index` (`stripe_id`),
  ADD KEY `users_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `user_has_categories`
--
ALTER TABLE `user_has_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_item_id_foreign` (`item_id`);

--
-- Indexes for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_has_extras_variant_id_foreign` (`variant_id`),
  ADD KEY `variants_has_extras_extra_id_foreign` (`extra_id`);

--
-- Indexes for table `vendor_has_categories`
--
ALTER TABLE `vendor_has_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_restaurant_id_foreign` (`restaurant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `compare_plan_name`
--
ALTER TABLE `compare_plan_name`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1507;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dynamic_prices`
--
ALTER TABLE `dynamic_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_category`
--
ALTER TABLE `expenses_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_vendor`
--
ALTER TABLE `expenses_vendor`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=582;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=554;

--
-- AUTO_INCREMENT for table `item_has_allergens`
--
ALTER TABLE `item_has_allergens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `localmenus`
--
ALTER TABLE `localmenus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=975;

--
-- AUTO_INCREMENT for table `order_has_items`
--
ALTER TABLE `order_has_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=617;

--
-- AUTO_INCREMENT for table `order_has_status`
--
ALTER TABLE `order_has_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=824;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paths`
--
ALTER TABLE `paths`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `period_discounts`
--
ALTER TABLE `period_discounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `period_discounts_for_restourants`
--
ALTER TABLE `period_discounts_for_restourants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `plan_coupons`
--
ALTER TABLE `plan_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `plan_limits`
--
ALTER TABLE `plan_limits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restoareas`
--
ALTER TABLE `restoareas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `simple_delivery_areas`
--
ALTER TABLE `simple_delivery_areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `temp_orders`
--
ALTER TABLE `temp_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `user_has_categories`
--
ALTER TABLE `user_has_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11592;

--
-- AUTO_INCREMENT for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_has_categories`
--
ALTER TABLE `vendor_has_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`),
  ADD CONSTRAINT `banners_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_restorant_id_foreign` FOREIGN KEY (`restorant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `restorants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `domains`
--
ALTER TABLE `domains`
  ADD CONSTRAINT `domains_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_expenses_category_id_foreign` FOREIGN KEY (`expenses_category_id`) REFERENCES `expenses_category` (`id`),
  ADD CONSTRAINT `expenses_expenses_vendor_id_foreign` FOREIGN KEY (`expenses_vendor_id`) REFERENCES `expenses_vendor` (`id`),
  ADD CONSTRAINT `expenses_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `expenses_category`
--
ALTER TABLE `expenses_category`
  ADD CONSTRAINT `expenses_category_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `expenses_vendor`
--
ALTER TABLE `expenses_vendor`
  ADD CONSTRAINT `expenses_vendor_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `extras`
--
ALTER TABLE `extras`
  ADD CONSTRAINT `extras_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `hours`
--
ALTER TABLE `hours`
  ADD CONSTRAINT `hours_restorant_id_foreign` FOREIGN KEY (`restorant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `localmenus`
--
ALTER TABLE `localmenus`
  ADD CONSTRAINT `localmenus_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_restorant_id_foreign` FOREIGN KEY (`restorant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `order_has_items`
--
ALTER TABLE `order_has_items`
  ADD CONSTRAINT `order_has_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_has_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_has_status`
--
ALTER TABLE `order_has_status`
  ADD CONSTRAINT `order_has_status_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_has_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `order_has_status_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD CONSTRAINT `payment_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `period_discounts`
--
ALTER TABLE `period_discounts`
  ADD CONSTRAINT `period_discounts_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `period_discounts_for_restourants`
--
ALTER TABLE `period_discounts_for_restourants`
  ADD CONSTRAINT `period_discounts_for_restourants_restourant_id_foreign` FOREIGN KEY (`restourant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `plan_coupons`
--
ALTER TABLE `plan_coupons`
  ADD CONSTRAINT `plan_coupons_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `plan_limits`
--
ALTER TABLE `plan_limits`
  ADD CONSTRAINT `plan_limits_restourant_id_foreign` FOREIGN KEY (`restourant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `restoareas`
--
ALTER TABLE `restoareas`
  ADD CONSTRAINT `restoareas_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `simple_delivery_areas`
--
ALTER TABLE `simple_delivery_areas`
  ADD CONSTRAINT `simple_delivery_areas_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  ADD CONSTRAINT `sms_verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `tables_restoarea_id_foreign` FOREIGN KEY (`restoarea_id`) REFERENCES `restoareas` (`id`);

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  ADD CONSTRAINT `variants_has_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`),
  ADD CONSTRAINT `variants_has_extras_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `companies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
