-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 24, 2023 lúc 05:11 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ve_tau`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `name`, `description`) VALUES
(2, '2022-06-17 06:49:44', '2022-06-17 10:21:54', 'Hạng thương gia', 'Hạng thương gia'),
(7, '2022-06-17 10:24:52', '2022-06-23 08:06:18', 'Hạng thường', 'Hạng thường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `threshold` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `created_at`, `updated_at`, `code`, `discount`, `start_date`, `end_date`, `threshold`) VALUES
(1, '2021-08-25 05:38:37', '2022-07-21 09:56:52', 'BH123', 13.00, '2022-07-12 17:00:00', '2022-07-27 17:00:00', 14.00),
(2, '2022-07-21 17:16:37', '2022-07-21 17:16:37', 'MH123', 23.00, '2022-07-03 17:00:00', '2022-08-02 17:00:00', 30.00),
(4, '2023-07-18 09:47:18', '2023-07-18 09:47:18', 'AB235', 10.00, '2023-07-17 17:00:00', '2023-07-29 17:00:00', 10.00),
(5, '2023-07-18 09:47:58', '2023-07-18 09:47:58', 'AD568', 50.00, '2023-07-18 17:00:00', '2023-07-30 17:00:00', 5.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2022_04_19_133951_create_permission_tables', 1),
(15, '2022_04_24_150628_create_places_table', 1),
(16, '2022_04_24_151217_create_reviews_table', 1),
(17, '2022_04_24_151246_create_place_review_table', 1),
(18, '2022_04_24_151434_create_tickets_table', 1),
(19, '2022_04_24_171558_add_status_column_to_users_table', 2),
(20, '2022_04_30_145323_create_categories_table', 3),
(21, '2022_04_30_171032_create_categories_table', 4),
(22, '2022_04_30_171340_create_tickets_category_table', 5),
(23, '2022_05_01_082315_add_column_to_tickets_table', 6),
(24, '2022_05_01_090910_add_place_id_column_to_reviews_table', 7),
(25, '2022_05_02_013645_add_avatar_column_to_users_table', 8),
(26, '2022_05_09_160411_add_display_name_column_to_roles_table', 9),
(27, '2022_06_17_120834_create_prices_ticket_table', 9),
(28, '2022_06_17_120954_create_staff_table', 9),
(29, '2022_06_17_121142_create_coupons_table', 9),
(30, '2022_06_17_121559_alter_tickets_table', 10),
(31, '2022_06_17_122405_create_category_tour_table', 11),
(32, '2022_06_17_122945_create_tour_review_table', 12),
(33, '2022_06_17_123153_create_place_review_2_table', 13),
(34, '2022_06_17_123237_create_orders_table', 14),
(35, '2022_06_17_130940_delele_tour_review_table', 15),
(36, '2022_06_17_131029_delele_place_review_table', 16),
(37, '2022_06_17_131453_alter_review_table', 17),
(38, '2022_07_04_153521_set_default_value_coupon_id_column_in_orders_table', 18),
(39, '2022_07_05_093146_add_name_to_tickets', 19),
(40, '2022_07_05_103250_alter_table_tickets_change_places', 20),
(41, '2022_07_13_095535_add_ward_to_places_table', 21),
(42, '2022_07_21_113239_alter_table_prices_ticket_change_adult_child', 22),
(43, '2022_07_22_010339_del_category_tour_table', 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 29),
(2, 'App\\Models\\User', 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tour_id` int(11) NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `child_count` int(11) NOT NULL,
  `adult_count` int(11) NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `tax` double(8,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `tour_id`, `coupon_id`, `user_id`, `child_count`, `adult_count`, `total_price`, `tax`, `payment_method`, `status`) VALUES
(4, '2022-07-16 21:10:34', '2022-07-16 21:10:34', 1, NULL, 6, 0, 1, 13.00, 10.00, 'cod', 'penning'),
(5, '2022-07-16 21:11:06', '2022-07-21 08:52:51', 1, NULL, 6, 0, 1, 13.00, 10.00, 'cod', 'active'),
(21, '2022-07-17 06:02:44', '2022-07-21 08:52:50', 1, NULL, 6, 0, 1, 13.00, 10.00, 'cod', 'active'),
(28, '2022-07-21 10:00:41', '2022-07-21 10:00:41', 2, NULL, 6, 0, 1, 11.31, 10.00, 'cod', 'penning'),
(33, '2022-07-21 10:18:54', '2022-07-21 10:18:54', 1, NULL, 6, 0, 1, 13.00, 10.00, 'cod', 'penning'),
(34, '2023-07-14 05:36:22', '2023-07-14 05:36:22', 1, NULL, 25, 0, 1, 13.00, 10.00, 'cod', 'penning'),
(35, '2023-07-15 07:50:34', '2023-07-15 07:50:34', 8, NULL, 1, 0, 1, 200000.00, 10.00, 'cod', 'penning'),
(36, '2023-07-19 02:31:31', '2023-07-19 02:31:31', 7, NULL, 29, 0, 1, 250000.00, 10.00, 'cod', 'penning');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `places`
--

CREATE TABLE `places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `province` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `address_detail` varchar(500) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`images`)),
  `ward` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `places`
--

INSERT INTO `places` (`id`, `created_at`, `updated_at`, `province`, `district`, `address_detail`, `name`, `description`, `images`, `ward`) VALUES
(6, '2023-07-10 03:05:58', '2023-07-18 08:44:37', 'Tỉnh Bà Rịa - Vũng Tàu', 'Huyện Châu Đức', 'đảo Cát Bà.', 'đảo Cát Bà', 'nullfefe', '[\"http://127.0.0.1:8000/uploads/place\\\\64abd80626601.png\"]', 'Xã Bàu Chinh'),
(7, '2023-07-10 03:06:29', '2023-07-10 03:10:06', 'Tỉnh Cao Bằng', 'Huyện Bảo Lâm', 'Côn Đảo', 'Côn Đảo', 'Côn Đảo', '[\"http://127.0.0.1:8000/uploads/place\\\\64abd82553b17.png\"]', 'Xã Đức Hạnh'),
(8, '2023-07-10 03:07:05', '2023-07-10 03:10:09', 'Tỉnh Bà Rịa - Vũng Tàu', 'Thành phố Bà Rịa', 'Vũng Tàu.', 'Vũng Tàu.', 'Vũng Tàu.', '[\"http://127.0.0.1:8000/uploads/place\\\\64abd849b54df.png\"]', 'Phường Phước Hiệp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prices_ticket`
--

CREATE TABLE `prices_ticket` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `child` varchar(255) DEFAULT NULL,
  `adult` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `prices_ticket`
--

INSERT INTO `prices_ticket` (`id`, `created_at`, `updated_at`, `child`, `adult`) VALUES
(4, NULL, NULL, '4384', '4384'),
(5, NULL, NULL, '50000', '34.00'),
(6, NULL, NULL, '100000', '200000'),
(7, NULL, NULL, '100000', '200000'),
(8, NULL, NULL, '100000', '200000'),
(9, NULL, NULL, '100000', '200000'),
(10, NULL, NULL, '100000', '200000'),
(11, NULL, NULL, '50000', '0222'),
(12, NULL, '2023-07-19 01:58:41', '180000', '250000'),
(13, NULL, NULL, '100000', '200000'),
(14, NULL, NULL, '100000', '200000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `star` double NOT NULL,
  `type` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `created_at`, `updated_at`, `user_id`, `star`, `type`, `comment`, `object_id`) VALUES
(1, '2022-07-19 06:59:01', '2022-07-19 06:59:01', 6, 5, 'tour', 'Hướng dẫn viên chuyên nghiệp', 1),
(2, '2022-07-19 06:59:01', '2022-07-19 06:59:01', 9, 4, 'tour', 'Chu đáo, tận ', 1),
(3, '2022-07-19 06:59:01', '2022-07-19 06:59:01', 21, 4, 'tour', 'Tốt ', 1),
(4, '2022-07-19 07:01:01', '2022-07-19 07:01:01', 10, 4, 'tour', 'Tốt', 1),
(5, '2022-07-19 08:23:26', '2022-07-19 08:23:26', 20, 4, 'place', 'Đẹp nhưng vẫn còn đang xây dựng', 1),
(6, '2022-07-19 08:24:51', '2022-07-19 08:24:51', 6, 4, 'place', 'Thử lại một lần nữa', 1),
(7, '2022-07-21 17:33:15', '2022-07-21 17:33:15', 10, 4, 'place', 'Khu vực tuyệt đẹp', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `display_name`) VALUES
(1, 'admin', 'api', NULL, NULL, NULL),
(2, 'member', 'api', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dest` int(11) NOT NULL,
  `tour_guide_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `range` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vehicle` varchar(255) NOT NULL,
  `hotel_star` int(11) NOT NULL,
  `schedule` text NOT NULL,
  `places` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`places`)),
  `max_slot` int(11) NOT NULL,
  `slot` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tickets`
--

INSERT INTO `tickets` (`id`, `created_at`, `updated_at`, `dest`, `tour_guide_id`, `price_id`, `range`, `start_date`, `vehicle`, `hotel_star`, `schedule`, `places`, `max_slot`, `slot`, `name`) VALUES
(7, '2023-07-10 03:13:18', '2023-07-18 08:31:54', 6, 3, 12, 5, '2023-07-11 17:00:00', 'a', 5, 'Cát Bà đến Hạ Long', '[6]', 50, 0, 'Cát Bà đến Hạ Long'),
(8, '2023-07-10 03:14:02', '2023-07-10 03:14:02', 1, 3, 14, 5, '2023-07-15 17:00:00', '2', 5, 'Hải Phòng đến Cát Bà', '[6, 1]', 50, 0, 'Hải Phòng đến Cát Bà');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets_category`
--

CREATE TABLE `tickets_category` (
  `tour_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tickets_category`
--

INSERT INTO `tickets_category` (`tour_id`, `category_id`) VALUES
(1, 7),
(4, 3),
(4, 7),
(5, 3),
(5, 7),
(6, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`id`, `created_at`, `updated_at`, `name`, `phone_number`, `address`) VALUES
(2, '2022-06-17 06:49:44', '2022-06-17 10:43:09', 'Jonny', '12312321', 'Da Nang, Lam Dong'),
(3, '2022-06-17 10:41:08', '2022-06-17 10:43:02', 'Hoàng Ngọc Lâm', 'HDV tài năng', '1234'),
(4, '2023-07-18 08:39:38', '2023-07-18 08:39:38', 'fw', 'fewe', 'fe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `avatar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `status`, `avatar`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$l247C8kmbLLPc61qTZ1TFeLssK8P5XaGi24EjVQp8j4W0AiTo9T/u', NULL, NULL, '2023-07-15 07:54:33', 'admin123', 'active', 'http://localhost:8000/uploads/user\\64b2b32963634.png'),
(6, 'Nguyễn Quang Huy', 'xinchao@gmail.com', NULL, '$2y$10$Geta5OxcLfEN3O4KCNgIMuWB5B/lIXGbPzQDae1IEwA2WFUSMupRO', NULL, '2022-04-24 10:20:39', '2022-07-16 21:08:12', 'nqhhh', 'active', 'http://localhost:8000/uploads/user/62d38b2c9bab8.png'),
(8, 'Chu Hiểu ', 'three@gmail.cm', NULL, '$2y$10$X/h2OcobkKGcOh9a3Sc4dOdl0i0WWwh2St8lbO.epGCawasGymeyu', NULL, '2022-05-03 18:43:49', '2022-05-03 18:43:49', 'cls_130871_20183554', 'active', NULL),
(9, 'Phạm Huy Hoàng', 'contact@pigroupco.com', NULL, '$2y$10$1Y04DTky4F5O1javUAyhZeipwWwVvFhtrwFN6uAf7ifpBuhBOT4vC', NULL, '2022-05-03 18:44:55', '2022-05-03 18:44:55', 'pigroupco', 'active', NULL),
(10, 'Dương Công Hậu', 'aa@a.c', NULL, '$2y$10$JcIoR9f9ly40OJJ/I4wr/uSREN5KkWFbabLp/VOaDUqfXmtUQty5e', NULL, '2022-05-03 18:45:41', '2022-07-21 17:33:52', 'mmstemplate', 'active', 'http://localhost:8000/uploads/user/62d9f0706d2f3.jpg'),
(20, 'Dương Lê', 'aaaaaaa@a.a', NULL, '$2y$10$AiReXm61opyMPdvfeyn/TefHWZHkhsvA8ODX/aYd5xIgEdN8VE9Mm', NULL, '2022-05-03 19:10:51', '2022-05-03 19:10:51', 'aaaaaaa', 'active', NULL),
(21, 'Vân Vân', 'test@mail', NULL, '$2y$10$y0xAcggVuLe4TS9KsFYEHeZC2rVheRm6Aa7JhKnrLOdkp5jhdTbty', NULL, '2022-06-17 11:36:26', '2022-06-17 11:36:26', 'test12345', 'active', NULL),
(22, 'Hoàng Lẽ Phải', 'asdfasdf@123', NULL, '$2y$10$mkpDgR29FfNBHAn91XIPoeYYA/v1u5EpHJN0HK/ruQaX.RlkKHwMq', NULL, '2022-06-17 11:37:48', '2022-06-17 11:37:48', 'test123456', 'active', NULL),
(23, 'ngoc2001', 'ngoc2001@gmail.com', NULL, '$2y$10$hA2uZC3c2aOSe4AtDBKE6e5NoTvBlUr1QH9RUytPAs0yJVQGXmegO', NULL, '2023-07-04 06:37:39', '2023-07-04 06:37:39', 'ngoc2001', 'active', NULL),
(24, 'phuongle', 'phuonghole121201@gmail.com', NULL, '$2y$10$l247C8kmbLLPc61qTZ1TFeLssK8P5XaGi24EjVQp8j4W0AiTo9T/u', NULL, '2023-07-04 06:50:47', '2023-07-04 06:50:47', 'phuongle', 'active', NULL),
(25, 'ngocngoc', 'ngoc@gmail.com', NULL, '$2y$10$UugEVTIYoScvaHPHrblUhuBeKuHXiDbl.NG2PjzuekOZFMB6s/.Sa', NULL, '2023-07-14 05:34:54', '2023-07-14 05:34:54', 'ngocngoc', 'active', NULL),
(26, 'NgocNgoc2', 'ngoccatha@gmail.com', NULL, '$2y$10$Gh7DUhJ/gjAAuxnmCRD3wuzOHXoTSRrc/ogjruQAaEjcJZC8TXFZ.', NULL, '2023-07-15 07:24:45', '2023-07-15 07:24:45', 'NgocNgoc2', 'active', NULL),
(27, 'NgocNgoc', 'ha.cat.ngoc281@gmail.com', NULL, '$2y$10$pzjF4pjY7GX.nmZHL8zv2eDVvXlZ24kFOy.qRkELoHtgIeygFB05y', NULL, '2023-07-19 01:20:05', '2023-07-19 01:20:05', 'Hngoc', 'active', NULL),
(28, 'NgocNgoc1', 'ha.cat.ngoc2812@gmail.com', NULL, '$2y$10$RPPt.zxnYLC74qkxt35m5OrwP2iFZFPE3udR9UNHFB/Qkv50VFPEO', NULL, '2023-07-19 01:24:34', '2023-07-19 01:43:48', 'NgocNgoc1', 'active', 'http://localhost:8000/uploads/user\\64b7a24414411.jpg'),
(29, 'Ngoc1', 'ha.cat.ngoc2813@gmail.com', NULL, '$2y$10$3eDTxcmNdocw0vjlo7XTO.9/10H9xanCTkavBmfqLagKD8PK6mcmW', NULL, '2023-07-19 02:22:38', '2023-07-19 02:22:38', 'NgocNgoc11', 'active', NULL),
(30, 'NgocNgoc111', 'phamthanhson12333@gmail.com', NULL, '$2y$10$oP/o9gpPxldj3t18x.v2iO0vVLal5HNZ119vTQ6nnospuGuwG83vu', NULL, '2023-07-19 02:26:55', '2023-07-19 02:26:55', 'NgocNgoc111', 'active', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `prices_ticket`
--
ALTER TABLE `prices_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tickets_category`
--
ALTER TABLE `tickets_category`
  ADD PRIMARY KEY (`tour_id`,`category_id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `places`
--
ALTER TABLE `places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `prices_ticket`
--
ALTER TABLE `prices_ticket`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
