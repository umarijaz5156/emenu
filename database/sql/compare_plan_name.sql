-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Dec 15, 2023 at 04:14 AM
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
-- Database: `emenu`
--
DROP TABLE IF EXISTS `compare_plan_name`;
-- --------------------------------------------------------

--
-- Table structure for table `compare_plan_name`
--

CREATE TABLE `compare_plan_name` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_name` varchar(191) NOT NULL,
  `cost_saving_eco` varchar(191) NOT NULL DEFAULT '',
  `no_setup_cost` tinyint(1) NOT NULL,
  `eco_friendly` tinyint(1) NOT NULL,
  `boost_your_business` varchar(191) NOT NULL DEFAULT '',
  `cut_opt_cost` tinyint(1) NOT NULL,
  `detailed_reports` tinyint(1) NOT NULL,
  `increase_sales` tinyint(1) NOT NULL,
  `savings_foh` tinyint(1) NOT NULL,
  `order_limit` varchar(191) NOT NULL DEFAULT '',
  `unlimited_product` tinyint(1) NOT NULL,
  `order_management` varchar(191) NOT NULL DEFAULT '',
  `delivery_pick_dine` tinyint(1) NOT NULL,
  `payments_gateway` tinyint(1) NOT NULL,
  `data_analytics` tinyint(1) NOT NULL,
  `engage_delight` varchar(191) NOT NULL DEFAULT '',
  `connect_customers` tinyint(1) NOT NULL,
  `control_presence` tinyint(1) NOT NULL,
  `customer_supports` tinyint(1) NOT NULL,
  `collect_reviews` tinyint(1) NOT NULL,
  `elevate_dining` varchar(191) NOT NULL DEFAULT '',
  `add_items` int(11) NOT NULL DEFAULT 0,
  `browse_menu` tinyint(1) NOT NULL,
  `call_waiter` tinyint(1) NOT NULL,
  `create_dining_experience` tinyint(1) NOT NULL,
  `dynamic_pricing` tinyint(1) NOT NULL,
  `qr_code_menu` tinyint(1) NOT NULL,
  `quick_search` tinyint(1) NOT NULL,
  `unique_qr_code` int(11) NOT NULL,
  `expand_your_service` varchar(191) NOT NULL DEFAULT '',
  `expand_features` tinyint(1) NOT NULL,
  `globalize_business` varchar(191) NOT NULL DEFAULT '',
  `custom_domain` tinyint(1) NOT NULL,
  `menu_generator` tinyint(1) NOT NULL,
  `translation_languages` int(11) NOT NULL,
  `menu_control` varchar(191) NOT NULL DEFAULT '',
  `allergens` tinyint(1) NOT NULL,
  `menu_management` tinyint(1) NOT NULL,
  `operational_change` tinyint(1) NOT NULL,
  `adaptable_support` varchar(191) NOT NULL DEFAULT '',
  `multiple_accounts` int(11) NOT NULL,
  `support_tickets` tinyint(1) NOT NULL,
  `priority_support` tinyint(1) NOT NULL,
  `qr_scans` int(11) NOT NULL,
  `design` varchar(191) NOT NULL DEFAULT '',
  `suitable_business` tinyint(1) NOT NULL,
  `add_images` tinyint(1) NOT NULL,
  `add_logo` tinyint(1) NOT NULL,
  `customizable_design` tinyint(1) NOT NULL,
  `free_themes` varchar(191) NOT NULL DEFAULT 'Default',
  `instants_updates` tinyint(1) NOT NULL,
  `personalise_menu` tinyint(1) NOT NULL,
  `view_from_device` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compare_plan_name`
--

INSERT INTO `compare_plan_name` (`id`, `created_at`, `updated_at`, `plan_name`, `cost_saving_eco`, `no_setup_cost`, `eco_friendly`, `boost_your_business`, `cut_opt_cost`, `detailed_reports`, `increase_sales`, `savings_foh`, `order_limit`, `unlimited_product`, `order_management`, `delivery_pick_dine`, `payments_gateway`, `data_analytics`, `engage_delight`, `connect_customers`, `control_presence`, `customer_supports`, `collect_reviews`, `elevate_dining`, `add_items`, `browse_menu`, `call_waiter`, `create_dining_experience`, `dynamic_pricing`, `qr_code_menu`, `quick_search`, `unique_qr_code`, `expand_your_service`, `expand_features`, `globalize_business`, `custom_domain`, `menu_generator`, `translation_languages`, `menu_control`, `allergens`, `menu_management`, `operational_change`, `adaptable_support`, `multiple_accounts`, `support_tickets`, `priority_support`, `qr_scans`, `design`, `suitable_business`, `add_images`, `add_logo`, `customizable_design`, `free_themes`, `instants_updates`, `personalise_menu`, `view_from_device`) VALUES
(1, '0000-00-00 00:00:00', '2023-11-22 12:33:33', 'basic_plan', '[value-5]', 1, 1, '[value-8]', 1, 0, 0, 0, '[value-13]', 1, '[value-15]', 0, 0, 0, '[value-19]', 0, 0, 0, 0, '[value-24]', 5, 0, 0, 0, 0, 0, 0, 10, '[value-33]', 0, '[value-35]', 0, 0, 12, '[value-39]', 1, 0, 0, '[value-43]', 10, 0, 0, 10, '[value-48]', 0, 0, 0, 0, '', 0, 0, 0),
(2, '0000-00-00 00:00:00', '2023-11-22 12:33:33', 'premium_plan', '[value-5]', 1, 0, '[value-8]', 1, 0, 0, 0, '[value-13]', 1, '[value-15]', 0, 0, 0, '[value-19]', 0, 1, 1, 1, '[value-24]', 20, 0, 0, 0, 0, 0, 0, 25, '[value-33]', 0, '[value-35]', 0, 0, 15, '[value-39]', 1, 1, 0, '[value-43]', 15, 0, 0, 15, '[value-48]', 0, 0, 0, 1, '', 0, 0, 0),
(3, '0000-00-00 00:00:00', '2023-11-22 12:33:33', 'enterprise_plan', '[value-5]', 0, 1, '[value-8]', 0, 0, 0, 0, '[value-13]', 0, '[value-15]', 1, 0, 1, '[value-19]', 0, 1, 1, 1, '[value-24]', 60, 0, 0, 0, 0, 0, 0, 50, '[value-33]', 0, '[value-35]', 0, 0, 100, '[value-39]', 0, 1, 0, '[value-43]', 20, 0, 0, 30, '[value-48]', 0, 0, 0, 0, '', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compare_plan_name`
--
ALTER TABLE `compare_plan_name`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `compare_plan_name_plan_name_unique` (`plan_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compare_plan_name`
--
ALTER TABLE `compare_plan_name`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
