-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Dec 15, 2023 at 04:13 AM
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
-- Database: `klim_laravel`
--
DROP TABLE IF EXISTS `labels`;
-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `table_name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `created_at`, `updated_at`, `slug`, `name`, `table_name`) VALUES
(1, '0000-00-00 00:00:00', '2023-11-20 11:34:19', 'compare_plan_name_cost_saving_eco', 'COST-SAVING  & ECO- FRIENDLY', 'compare_plan_name'),
(2, NULL, '2023-11-22 12:08:28', 'compare_plan_name_no_setup_cost', 'No set-up cost', 'compare_plan_name'),
(4, NULL, '2023-11-22 08:17:20', 'compare_plan_name_eco_friendly', 'Eco-friendly', 'compare_plan_name'),
(5, NULL, '2023-11-22 12:32:59', 'compare_plan_name_boost_your_business', 'Test', 'compare_plan_name'),
(6, NULL, '2023-11-17 12:47:54', 'compare_plan_name_features', 'Features', 'compare_plan_name'),
(7, NULL, '2023-11-22 12:33:18', 'compare_plan_name_cut_opt_cost', 'Cut operational cost', 'compare_plan_name'),
(8, NULL, '2023-11-22 12:33:33', 'compare_plan_name_detailed_reports', 'Detailed Reports                                                                                                                                                                               ', 'compare_plan_name'),
(9, NULL, '2023-11-19 13:13:40', 'compare_plan_name_increase_sales', 'Increase sales by 10% - 15%               using offers', 'compare_plan_name'),
(10, NULL, '2023-11-22 12:33:33', 'compare_plan_name_saving_foh', '', 'compare_plan_name'),
(11, NULL, '2023-11-20 11:35:43', 'compare_plan_name_order_limit', 'ORDER LIMIT', 'compare_plan_name'),
(12, NULL, NULL, 'compare_plan_name_unlimited_product', 'Unlimited product', 'compare_plan_name'),
(13, NULL, NULL, 'compare_plan_name_order_management', 'ORDER MANAGEMENT (POS INTEGRATION)', 'compare_plan_name'),
(14, NULL, '2023-11-19 13:15:05', 'compare_plan_name_delivery_pick_dine', 'Delivery, Pick-up and Dine in Experience', 'compare_plan_name'),
(15, NULL, '2023-11-19 13:08:57', 'compare_plan_name_payments_gateway', 'Payments gateway for fast                    money collection', 'compare_plan_name'),
(16, NULL, NULL, 'compare_plan_name_data_analytics', 'Data Analytics to increase\n                    more sales', 'compare_plan_name'),
(17, NULL, NULL, 'compare_plan_name_engage', 'ENGAGE & DELIGHT YOUR CUSTOMERS', 'compare_plan_name'),
(18, NULL, '2023-11-19 13:15:23', 'compare_plan_name_connect_customers', 'Connect with customers  on Social Media', 'compare_plan_name'),
(19, NULL, NULL, 'compare_plan_name_control_presence', 'Control your online\n                    presence', 'compare_plan_name'),
(20, NULL, '2023-11-19 13:13:05', 'compare_plan_name_customer_support', 'Get excellent customer                    support', 'compare_plan_name'),
(21, NULL, '2023-11-19 13:15:28', 'compare_plan_name_collect_reviews', 'Collect reviews from customers', 'compare_plan_name'),
(22, NULL, '2023-11-22 12:33:33', 'compare_plan_name_elevate_dining_experience', '', 'compare_plan_name'),
(23, NULL, NULL, 'compare_plan_name_add_items', 'Add more items', 'compare_plan_name'),
(24, NULL, NULL, 'compare_plan_name_browse_menu', 'Browse the Menu', 'compare_plan_name'),
(25, NULL, NULL, 'compare_plan_name_call_waiter', 'Call Your Waiter', 'compare_plan_name'),
(26, NULL, NULL, 'compare_plan_name_create_dining_experience', 'Create the\n                    dine-in experienc', 'compare_plan_name'),
(27, NULL, NULL, 'compare_plan_name_dynamic_pricing', 'Dynamic pricing (changes\n                    automatically)', 'compare_plan_name'),
(28, NULL, NULL, 'compare_plan_name_qr_code_menu', 'QR-code menu', 'compare_plan_name'),
(29, NULL, NULL, 'compare_plan_name_quick_search', 'Quick search by name', 'compare_plan_name'),
(30, NULL, NULL, 'compare_plan_name_unique_qr_code', 'Unique QR code for each\n                    table', 'compare_plan_name'),
(31, NULL, NULL, 'compare_plan_name_expand', 'EXPAND YOUR SERVICE', 'compare_plan_name'),
(32, NULL, '2023-11-19 13:00:44', 'compare_plan_name_expand_features', 'Expand with extra', 'compare_plan_name'),
(33, NULL, NULL, 'compare_plan_name_globalize', 'GLOBALIZE YOUR BUSINESS', 'compare_plan_name'),
(34, NULL, NULL, 'compare_plan_name_custom_domain', 'Custom domain name', 'compare_plan_name'),
(35, NULL, '2023-11-17 14:24:53', 'compare_plan_name_menu_generator', 'Menu generator (PDF) test', 'compare_plan_name'),
(36, NULL, NULL, 'compare_plan_name_translation', 'Translation into 7 languages', 'compare_plan_name'),
(37, NULL, NULL, 'compare_plan_name_effortless_menu_control', 'EFFORTLESS MENU CONTROL', 'compare_plan_name'),
(38, NULL, NULL, 'compare_plan_name_allergens', 'Allergens', 'compare_plan_name'),
(39, NULL, NULL, 'compare_plan_name_menu_management', 'Easy menu management', 'compare_plan_name'),
(40, NULL, NULL, 'compare_plan_name_optional_change', 'No operational change', 'compare_plan_name'),
(41, NULL, NULL, 'compare_plan_name_support', 'ADAPTABLE SUPPORT FOR ALL SIZES', 'compare_plan_name'),
(42, NULL, NULL, 'compare_plan_name_multiple_accounts', 'Multiple accounts\n                    (staff', 'compare_plan_name'),
(43, NULL, NULL, 'compare_plan_name_support_tickets', 'General support tickets', 'compare_plan_name'),
(44, NULL, NULL, 'compare_plan_name_priority_support', 'Priority suppor', 'compare_plan_name'),
(45, NULL, NULL, 'compare_plan_name_qr_scans', 'Unlimited QR scans', 'compare_plan_name'),
(46, NULL, NULL, 'compare_plan_name_suitable_business', 'Suitable for small,\n                    medium, large businesses', 'compare_plan_name'),
(47, NULL, NULL, 'compare_plan_name_add_images', 'Add images', 'compare_plan_name'),
(48, NULL, NULL, 'compare_plan_name_add_logo', 'Add logo', 'compare_plan_name'),
(49, NULL, NULL, 'compare_plan_name_customizable_design', 'Customizable design', 'compare_plan_name'),
(50, NULL, NULL, 'compare_plan_name_free_themes', 'Free Themes', 'compare_plan_name'),
(51, NULL, '2023-11-17 14:24:44', 'compare_plan_name_instant_updates', 'Instant updates 2', 'compare_plan_name'),
(52, NULL, NULL, 'compare_plan_name_personalise_menu', 'Personalise your menu', 'compare_plan_name'),
(53, NULL, NULL, 'compare_plan_name_view_from_device', 'View from any device', 'compare_plan_name'),
(54, NULL, NULL, 'compare_plan_name_design_it_your_way', 'DESIGN IT YOUR WAY', 'compare_plan_name');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `labels_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
