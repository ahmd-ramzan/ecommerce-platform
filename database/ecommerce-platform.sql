-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2023 at 06:34 PM
-- Server version: 8.0.35-0ubuntu0.22.04.1
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce-platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_intent_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `uuid`, `user_id`, `created_at`, `updated_at`, `payment_intent_id`) VALUES
(1, 'b29ee665-b048-4075-b7cb-32b1a3037baa', 1, '2023-11-27 21:49:38', '2023-11-27 22:07:09', 'pi_3OHHdgFXp1IgXlfK0eHZMUGm'),
(3, '3e4896ce-ab7a-401d-9816-7692f0926b92', 1, '2023-11-28 21:56:10', '2023-11-28 21:56:10', NULL),
(5, 'f7fa8a77-75c9-4c16-ad95-68a107f14c7f', 1, '2023-12-01 08:29:01', '2023-12-01 08:29:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_variation`
--

CREATE TABLE `cart_variation` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `variation_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_variation`
--

INSERT INTO `cart_variation` (`id`, `cart_id`, `variation_id`, `quantity`, `created_at`, `updated_at`) VALUES
(5, 12, 3, 1, NULL, NULL),
(6, 12, 5, 1, NULL, NULL),
(7, 13, 3, 1, NULL, NULL),
(8, 13, 5, 1, NULL, NULL),
(17, 14, 3, 2, NULL, NULL),
(18, 14, 5, 1, NULL, NULL),
(20, 25, 3, 2, NULL, NULL),
(21, 25, 8, 1, NULL, NULL),
(22, 26, 3, 1, NULL, NULL),
(23, 26, 8, 1, NULL, NULL),
(24, 27, 3, 1, NULL, NULL),
(26, 29, 3, 1, NULL, NULL),
(27, 29, 8, 1, NULL, NULL),
(28, 30, 3, 1, NULL, NULL),
(29, 31, 3, 1, NULL, NULL),
(36, 37, 3, 1, NULL, NULL),
(37, 1, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Brands', 'brands', NULL, '2023-07-08 11:25:15', '2023-07-08 11:25:15'),
(2, 'Seasons', 'seasons', NULL, '2023-07-08 11:25:15', '2023-07-08 11:25:15'),
(3, 'Nike', 'nike', 1, '2023-07-08 11:26:46', '2023-07-08 11:26:46'),
(6, 'Summer', 'summer', 2, '2023-07-08 11:27:39', '2023-07-08 11:27:39'),
(7, 'Winter', 'winter', 2, '2023-07-08 11:27:39', '2023-07-08 11:27:39'),
(8, 'New in', 'new-in', 3, '2023-07-08 11:29:04', '2023-07-08 11:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL),
(2, 8, 1, NULL, NULL),
(3, 3, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\Product', 1, '7a6c913c-12f3-4dab-a635-a1de4a3ca04a', 'default', 'nike black', 'nike-black.jpg', 'image/jpeg', 'public', 'public', 86222, '[]', '[]', '{\"thumb200x200\": true}', '[]', 1, '2023-11-01 01:59:05', '2023-11-01 01:59:05'),
(3, 'App\\Models\\Product', 1, 'b58a0577-a696-4758-bffe-8a9720029466', 'default', 'nike white', 'nike-white.jpg', 'image/jpeg', 'public', 'public', 157596, '[]', '[]', '{\"thumb200x200\": true}', '[]', 2, '2023-11-01 02:01:55', '2023-11-01 02:01:55'),
(4, 'App\\Models\\Variation', 3, 'b00b0cdf-1d15-430e-b09a-fad30dde2bc4', 'default', 'nike black', 'nike-black.jpg', 'image/jpeg', 'public', 'public', 86222, '[]', '[]', '{\"thumb200x200\": true}', '[]', 1, '2023-11-01 03:37:26', '2023-11-01 03:37:26'),
(5, 'App\\Models\\Variation', 4, 'b510219d-bc6a-44b7-9339-43f90cf76be0', 'default', 'nike black', 'nike-black.jpg', 'image/jpeg', 'public', 'public', 86222, '[]', '[]', '{\"thumb200x200\": true}', '[]', 1, '2023-11-01 03:37:32', '2023-11-01 03:37:33'),
(6, 'App\\Models\\Variation', 5, '66328c5a-acbc-4ce4-ae04-45ffe8ec35a3', 'default', 'nike white', 'nike-white.jpg', 'image/jpeg', 'public', 'public', 157596, '[]', '[]', '{\"thumb200x200\": true}', '[]', 1, '2023-11-01 03:38:36', '2023-11-01 03:38:36'),
(7, 'App\\Models\\Variation', 6, '606a3967-3563-4bfc-a1bb-dc5a3db663ae', 'default', 'nike white', 'nike-white.jpg', 'image/jpeg', 'public', 'public', 157596, '[]', '[]', '{\"thumb200x200\": true}', '[]', 1, '2023-11-01 03:38:43', '2023-11-01 03:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_05_171519_create_categories_table', 1),
(6, '2023_07_06_224540_create_products_table', 1),
(7, '2023_10_29_024830_create_variations_table', 2),
(8, '2023_10_30_074632_create_stocks_table', 3),
(9, '2023_11_01_054540_create_media_table', 4),
(10, '2023_11_01_095846_create_carts_table', 5),
(11, '2023_11_01_100240_create_cart_variation_table', 5),
(12, '2023_11_09_032139_create_category_product_table', 6),
(13, '2023_11_22_154106_create_shipping_types_table', 7),
(14, '2023_11_24_160932_create_shipping_addresses_table', 8),
(17, '2023_11_25_103023_create_order_variation_table', 10),
(18, '2023_11_25_072330_create_orders_table', 11),
(19, '2023_11_28_023622_add_payment_intent_id_to_carts_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_address_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_type_id` bigint UNSIGNED DEFAULT NULL,
  `subtotal` int NOT NULL,
  `placed_at` timestamp NOT NULL,
  `packaged_at` timestamp NULL DEFAULT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uuid`, `email`, `user_id`, `shipping_address_id`, `shipping_type_id`, `subtotal`, `placed_at`, `packaged_at`, `shipped_at`, `created_at`, `updated_at`) VALUES
(1, '6d28aaa2-fe8e-40c3-8301-010930323f1e', 'ahmed@gmail.com', 1, 2, 2, 9000, '2023-11-26 06:50:42', '2023-11-26 08:24:17', NULL, '2023-11-26 06:50:42', '2023-11-26 08:24:17'),
(2, 'b9e587b8-312d-435b-94f0-999ced47159b', 'ahmed@gmail.com', 1, 2, 1, 9000, '2023-11-26 08:45:42', NULL, NULL, '2023-11-26 08:45:42', '2023-11-26 08:45:42'),
(3, 'bfc8997d-984b-4368-bc57-042f1c3daba6', 'ahmed@gmail.com', 1, 2, 1, 9000, '2023-11-26 08:57:29', NULL, NULL, '2023-11-26 08:57:29', '2023-11-26 08:57:29'),
(4, 'eb3c55c3-ffba-4691-8f7f-46e4db4999e9', 'ahmed@gmail.com', 1, 2, 2, 9000, '2023-11-28 21:56:10', NULL, NULL, '2023-11-28 21:56:10', '2023-11-28 21:56:10'),
(5, '6910606b-ffc4-443f-b7f3-7705f3017765', 'ahmed@gmail.com', 1, 2, 2, 9000, '2023-12-01 08:29:00', NULL, NULL, '2023-12-01 08:29:00', '2023-12-01 08:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_variation`
--

CREATE TABLE `order_variation` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `variation_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_variation`
--

INSERT INTO `order_variation` (`id`, `order_id`, `variation_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, '2023-11-26 06:50:42', '2023-11-26 06:50:42'),
(2, 2, 3, 1, '2023-11-26 08:45:42', '2023-11-26 08:45:42'),
(3, 3, 8, 1, '2023-11-26 08:57:29', '2023-11-26 08:57:29'),
(4, 4, 3, 1, '2023-11-28 21:56:10', '2023-11-28 21:56:10'),
(5, 5, 3, 1, '2023-12-01 08:29:00', '2023-12-01 08:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int UNSIGNED NOT NULL,
  `live_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `price`, `live_at`, `created_at`, `updated_at`) VALUES
(1, 'Nike Air Force 1', 'nike-air-force-1', 'Nike Air Force 1 Description', 8000, '2023-07-08 16:29:40', '2023-07-08 11:29:40', '2023-07-08 11:29:40'),
(2, 'Example Product', 'example-product', 'Example Product Description', 8000, '2023-07-08 16:29:40', '2023-07-08 11:29:40', '2023-07-08 11:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `user_id`, `address`, `city`, `postcode`, `created_at`, `updated_at`) VALUES
(1, NULL, 'a', 'b', 'c', '2023-11-24 11:42:15', '2023-11-24 11:42:15'),
(2, 1, 'a', 'b', 'c', '2023-11-24 12:13:10', '2023-11-24 12:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `title`, `price`, `created_at`, `updated_at`) VALUES
(1, 'UPS free', 0, '2023-11-22 15:42:44', '2023-11-22 15:42:44'),
(2, 'UPS Standerd', 2000, '2023-11-22 15:42:44', '2023-11-22 15:42:44');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `variation_id` bigint UNSIGNED NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `variation_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 3, 20, NULL, NULL),
(3, 5, 20, NULL, NULL),
(4, 8, 20, NULL, NULL),
(8, 5, -1, '2023-11-26 06:50:42', '2023-11-26 06:50:42'),
(9, 3, -1, '2023-11-26 08:45:42', '2023-11-26 08:45:42'),
(10, 8, -1, '2023-11-26 08:57:29', '2023-11-26 08:57:29'),
(11, 3, -1, '2023-11-28 21:56:10', '2023-11-28 21:56:10'),
(12, 3, -1, '2023-12-01 08:29:00', '2023-12-01 08:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', 'ahmed@gmail.com', NULL, '$2y$10$BNMC7axwSMpONFZhzRsWF.GJeE1vKYDOnUnSufALkSiTa8T.wx5wy', NULL, '2023-07-08 05:38:13', '2023-07-08 05:38:13'),
(3, 'farhan', 'farhan@gmail.com', NULL, '$2y$10$2wXkooVB1sLccTCs.GjMJuuIlaj2EYN7S5my9te4hEWguHjv6HTT2', NULL, '2023-11-25 10:51:23', '2023-11-25 10:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `product_id`, `parent_id`, `title`, `price`, `type`, `sku`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Black', 9000, 'color', NULL, 1, NULL, NULL),
(2, 1, NULL, 'White', 9000, 'color', NULL, 2, NULL, NULL),
(3, 1, 1, '8', 9000, 'size', 'abc', 1, NULL, NULL),
(4, 1, 1, '9', 9000, 'size', 'def', 1, NULL, NULL),
(5, 1, 2, '8', 9000, 'size', 'ghi', 1, NULL, NULL),
(6, 1, 2, '9', 9000, 'size', 'jkl', 2, NULL, NULL),
(7, 2, NULL, 'Rainbow', 9000, 'color', NULL, 1, NULL, NULL),
(8, 2, 7, '12', 9000, 'size', 'xyz', 1, NULL, NULL),
(9, 1, NULL, 'Rainbow', 9000, 'color', 'ilk', 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_variation`
--
ALTER TABLE `cart_variation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_variation_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_variation_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_address_id_foreign` (`shipping_address_id`),
  ADD KEY `orders_shipping_type_id_foreign` (`shipping_type_id`);

--
-- Indexes for table `order_variation`
--
ALTER TABLE `order_variation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_variation_order_id_foreign` (`order_id`),
  ADD KEY `order_variation_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_variation`
--
ALTER TABLE `cart_variation`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_variation`
--
ALTER TABLE `order_variation`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_variation`
--
ALTER TABLE `cart_variation`
  ADD CONSTRAINT `cart_variation_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_variation_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_addresses` (`id`),
  ADD CONSTRAINT `orders_shipping_type_id_foreign` FOREIGN KEY (`shipping_type_id`) REFERENCES `shipping_types` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_variation`
--
ALTER TABLE `order_variation`
  ADD CONSTRAINT `order_variation_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_variation_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
