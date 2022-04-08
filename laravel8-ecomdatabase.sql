-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2022 at 08:47 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel8-ecomdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ELECTRONICS', '1', '2021-04-24 18:58:19', '2021-04-24 18:58:19'),
(2, 1, 'Cameras', '1', '2021-04-24 19:02:08', '2021-04-24 20:44:02'),
(3, 1, 'Hard Disk', '1', '2021-04-24 19:03:16', '2021-05-14 21:20:59'),
(4, NULL, 'CLOTHES', '1', '2021-04-24 19:03:40', '2021-04-24 19:03:40'),
(7, 4, 'Shoes', '1', '2021-05-14 21:18:29', '2021-05-14 21:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(21, '2022_03_13_204012_create_categories_table', 1),
(22, '2022_03_14_165348_create_products_table', 1),
(23, '2022_03_15_125907_create_product_details_table', 1),
(24, '2022_04_03_142551_create_carts_table', 1),
(25, '2022_04_04_040428_create_product_bookings_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'camera small type 1', '222', '030420221649004057.jpg', '1', '2021-05-13 04:33:53', '2022-04-03 10:40:57'),
(4, 2, 'camera middle', '234', '030420221649005463.jpg', '1', '2021-05-14 21:09:13', '2022-04-03 11:04:23'),
(5, 2, 'Black camera', '234', '030420221649005472.jpg', '1', '2021-05-14 21:16:44', '2022-04-03 11:04:32'),
(6, 2, 'black small', '200', '030420221649005481.jpg', '1', '2021-05-14 21:17:31', '2022-04-03 11:04:41'),
(7, 7, 'shoe type 1', '500', '030420221649005496.jpg', '1', '2021-05-14 21:19:09', '2022-04-03 11:04:56'),
(8, 7, 'shoe black', '400', '030420221649005509.jpg', '1', '2021-05-14 21:19:35', '2022-04-03 11:05:09'),
(9, 7, 'shoe type 2', '400', '030420221649005520.jpg', '1', '2021-05-14 21:20:02', '2022-04-03 11:05:20'),
(10, 3, 'sanddisk 8 gb', '100', '030420221649005530.jpg', '1', '2021-05-14 21:21:53', '2022-04-03 11:05:30'),
(11, 3, 'sandisk 16gb', '200', '030420221649005544.jpg', '1', '2021-05-14 21:22:29', '2022-04-03 11:05:44'),
(12, 3, 'pandrive', '300', '030420221649005557.jpg', '1', '2021-05-14 21:22:54', '2022-04-03 11:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_bookings`
--

CREATE TABLE `product_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_bookings`
--

INSERT INTO `product_bookings` (`id`, `user_id`, `product_id`, `qty`, `payment_status`, `booking_status`, `created_at`, `updated_at`) VALUES
(1, 3, 8, '2', '0', 0, '2022-04-04 07:14:43', '2022-04-04 07:14:43'),
(2, 3, 9, '1', '0', 0, '2022-04-04 07:14:43', '2022-04-04 07:14:43'),
(3, 3, 11, '1', '0', 2, '2022-04-06 07:10:24', '2022-04-06 11:53:29'),
(4, 3, 4, '2', '1', 1, '2022-04-06 09:37:03', '2022-04-06 11:52:34'),
(5, 3, 12, '3', '1', 2, '2022-04-06 09:43:34', '2022-04-06 11:53:50'),
(8, 3, 6, '2', '1', 1, '2022-04-06 10:07:50', '2022-04-06 11:52:23'),
(9, 3, 4, '2', '1', 0, '2022-04-07 15:03:32', '2022-04-07 09:04:13'),
(10, 3, 8, '2', '1', 0, '2022-04-07 17:50:03', '2022-04-07 11:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_items` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `title`, `total_items`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fujifilm FinePix S2950 Digital Camera', '10', '14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card).', '2021-05-14 20:52:58', '2021-05-14 21:08:38'),
(2, 4, 'Fujifilm FinePix S2950 Digital Camera', '200', '14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card).', '2021-05-14 21:09:32', '2021-05-14 21:15:37'),
(3, 5, 'Fujifilm FinePix S2950 Digital Camera', '205', '14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card).', '2021-05-14 21:24:27', '2021-05-14 21:24:27'),
(4, 6, 'Fujifilm  Digital Camera', '140', '14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card).', '2021-05-14 21:24:50', '2021-05-14 21:24:50'),
(5, 7, 'Fujifilm FinePix shoe type 1', '200', 'this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.', '2021-05-14 21:26:54', '2021-05-14 21:26:54'),
(6, 8, 'Fujifilm FinePix shoe black', '34', 'this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.', '2021-05-14 21:27:25', '2021-05-14 21:27:25'),
(7, 9, 'Fujifilm FinePix shoe type 2', '34', 'this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.this product is related to cloths and it is shoes.', '2021-05-14 21:28:18', '2021-05-14 21:28:18'),
(8, 10, 'product sanddisk 8 gb', '400', 'this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.', '2021-05-14 21:30:33', '2021-05-14 21:30:33'),
(9, 11, 'product sandisk 16gb', '300', 'this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.', '2021-05-14 21:31:12', '2021-05-14 21:31:12'),
(10, 12, 'This product pandrive', '234', 'this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.this is a storage device of type electronics.', '2021-05-14 21:32:00', '2021-05-14 21:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sohan', 'sohan@gmail.com', NULL, 'sohan123', 'admin', NULL, '2022-04-03 16:26:00', '2022-04-03 16:26:00'),
(2, 'Bishu Pasha', 'bishupasha@gmail.com', NULL, '$2y$10$AwuDo8wehKnC9ap.fIhLheA2/5uMHaIhWBEd0i7.oUvIyesy5f/w6', 'admin', NULL, '2022-04-03 10:28:07', '2022-04-03 10:28:07'),
(3, 'user user2', 'user@gmail.com', NULL, '$2y$10$sP5Cv3mBlGAReuihKVh86.U4l06182CeOfODzWVFw6Yub0XrQAJZ.', 'user', NULL, '2022-04-03 10:43:18', '2022-04-03 10:43:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_bookings`
--
ALTER TABLE `product_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bookings_user_id_foreign` (`user_id`),
  ADD KEY `product_bookings_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_bookings`
--
ALTER TABLE `product_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_bookings`
--
ALTER TABLE `product_bookings`
  ADD CONSTRAINT `product_bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
