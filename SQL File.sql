-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2024 at 10:01 AM
-- Server version: 10.5.26-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialg_Up`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_type` enum('3','2') NOT NULL DEFAULT '2',
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_email` text DEFAULT NULL,
  `username` varchar(225) DEFAULT NULL,
  `password` text NOT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` varchar(999) NOT NULL,
  `mode` varchar(225) NOT NULL,
  `two_factor` enum('0','1') NOT NULL DEFAULT '0',
  `two_factor_secret_key` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_type`, `admin_name`, `admin_email`, `username`, `password`, `telephone`, `register_date`, `login_date`, `login_ip`, `client_type`, `access`, `mode`, `two_factor`, `two_factor_secret_key`) VALUES
(1, '3', 'Admin', 'admin@admin.com', 'admin', '123456789', '', '2021-09-08 10:19:05', '2024-09-13 07:24:57', '157.34.85.95', '2', '{\"admin_access\":1,\"users\":1,\"services\":1,\"update-prices\":1,\"bulk\":1,\"synced-logs\":1,\"orders\":1,\"subscriptions\":1,\"dripfeed\":1,\"tasks\":1,\"payments\":1,\"tickets\":1,\"additionals\":1,\"referral\":1,\"broadcast\":1,\"logs\":1,\"reports\":1,\"videop\":1,\"coupon\":1,\"child-panels\":1,\"updates\":1,\"appearance\":1,\"themes\":1,\"new_year\":1,\"pages\":1,\"news\":1,\"meta\":1,\"blog\":1,\"menu\":1,\"inte\":1,\"language\":1,\"files\":1,\"settings\":1,\"general_settings\":1,\"providers\":1,\"payments_settings\":1,\"bank_accounts\":1,\"modules\":1,\"subject\":1,\"payments_bonus\":1,\"currency-manager\":1,\"alert_settings\":1,\"site_count\":1,\"manager\":1,\"super_admin\":1}', 'sun', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_constants`
--

CREATE TABLE `admin_constants` (
  `id` int(11) NOT NULL,
  `brand_logo` varchar(255) DEFAULT NULL,
  `paidRent` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin_constants`
--

INSERT INTO `admin_constants` (`id`, `brand_logo`, `paidRent`) VALUES
(1, '{\"logo_url\":\"https://puffxhost.com/wp-content/uploads/2024/01/20240117_213307.png\",\"width\":\"110\",\"height\":\"25\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `image_file` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime NOT NULL,
  `image_file` varchar(200) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `blog_get` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulkedit`
--

CREATE TABLE `bulkedit` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `category_name_lang` longtext DEFAULT NULL CHECK (json_valid(`category_name_lang`)),
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') NOT NULL DEFAULT '2',
  `category_icon` text NOT NULL,
  `is_refill` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `category_deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `childpanels`
--

CREATE TABLE `childpanels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `domain` varchar(191) NOT NULL,
  `child_panel_currency` varchar(191) NOT NULL,
  `child_panel_username` varchar(191) NOT NULL,
  `child_panel_password` varchar(191) NOT NULL,
  `charged_amount` float NOT NULL,
  `child_panel_status` enum('Pending','Active','Frozen','Suspended') NOT NULL DEFAULT 'Pending',
  `renewal_date` date NOT NULL,
  `created_on` datetime NOT NULL,
  `child_panel_uqid` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `admin_type` enum('1','2') NOT NULL DEFAULT '2',
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` decimal(21,4) NOT NULL DEFAULT 0.0000,
  `spent` decimal(21,4) NOT NULL DEFAULT 0.0000,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `apikey` text NOT NULL,
  `tel_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `email_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text DEFAULT NULL,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT 0,
  `currency_type` varchar(10) DEFAULT NULL,
  `ref_code` text NOT NULL,
  `ref_by` text DEFAULT NULL,
  `change_email` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL DEFAULT 3,
  `currency` varchar(225) NOT NULL DEFAULT '1',
  `passwordreset_token` varchar(225) NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  `broadcast_id` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `username`, `admin_type`, `password`, `telephone`, `balance`, `spent`, `balance_type`, `debit_limit`, `register_date`, `login_date`, `login_ip`, `apikey`, `tel_type`, `email_type`, `client_type`, `access`, `lang`, `timezone`, `currency_type`, `ref_code`, `ref_by`, `change_email`, `resend_max`, `currency`, `passwordreset_token`, `discount_percentage`, `broadcast_id`) VALUES
(3, '', 'itz.jaat@gamil.com', 'Admin', '2', '25f9e794323b453885f5181f1b624d0b', '', 0.0000, 0.0000, '2', NULL, '2024-09-12 21:35:58', '2024-09-13 08:25:40', '157.34.84.41', '9a5b6385eb01d5f1b75449deb5fc72a9', '1', '2', '2', NULL, 'en', 0, 'INR', 'f0a44e', NULL, '2', 3, '1', '', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(1, 1, '\r\n    User registered.', '103.192.118.80', '2024-09-12 19:35:28'),
(2, 2, '\r\n    User registered.', '103.192.118.80', '2024-09-12 20:42:03'),
(3, 3, '\r\n    User registered.', '157.34.21.187', '2024-09-12 21:35:58'),
(4, 3, 'Member logged in.', '157.34.21.187', '2024-09-12 22:00:39'),
(5, 3, 'Member logged in.', '157.34.21.187', '2024-09-12 22:21:27'),
(6, 3, 'Member logged in.', '157.34.21.187', '2024-09-12 22:27:09'),
(7, 3, 'New support ticket created#1', '157.34.21.187', '2024-09-12 22:27:29'),
(8, 3, 'Member logged in.', '157.34.84.41', '2024-09-13 04:12:45'),
(9, 3, 'Member logged in.', '157.34.84.41', '2024-09-13 07:03:15'),
(10, 3, 'Member logged in.', '157.34.84.41', '2024-09-13 07:06:46'),
(11, 3, 'Member logged in.', '157.34.79.201', '2024-09-13 08:00:20'),
(12, 3, 'Member logged in.', '157.34.79.201', '2024-09-13 08:03:04'),
(13, 3, 'Member logged in.', '157.34.84.41', '2024-09-13 08:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(100) NOT NULL,
  `currency_name` varchar(50) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `symbol_position` varchar(10) DEFAULT 'left',
  `currency_rate` double NOT NULL,
  `currency_inverse_rate` double NOT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 0,
  `currency_hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_code`, `currency_symbol`, `symbol_position`, `currency_rate`, `currency_inverse_rate`, `is_enable`, `currency_hash`) VALUES
(1, 'Indian Rupee', 'INR', '₹', 'left', 1, 1, 1, 'dd093d15ff7d02ea8727f5fac9319787ec14c440'),
(2, 'U.S. Dollar', 'USD', '$', 'left', 0.012015002158936, 83.229281757243, 1, '274981f01f2172c43e42df7d47d626cb7a42ea90'),
(3, 'Euro', 'EUR', '€', 'left', 0.011394927308091, 87.758348338907, 1, 'bda03a543c4dcfab038d3a3608be22e16c04d853'),
(4, 'Turkish Lira', 'TRY', '₺', 'left', 0.33830367152858, 2.9559241715635, 1, 'e623e3c82396078772e44931c9c6e334e95441b7'),
(5, 'Russian Rouble', 'RUB', '₽', 'left', 1.1243967812005, 0.88936576190864, 1, '96459362d1b781b4660551d69ff6c21151990978'),
(6, 'Brazilian Real', 'BRL', 'R$', 'left', 0.060114399149314, 16.634949598617, 1, 'a3acd13e425d0b71545e7ee0e2c1ba4984c6f6a5'),
(7, 'South Korean Won', 'KRW', '₩', 'left', 16.316824717217, 0.06128643393128, 1, '134684348ccfe173c95598dd0f8d098aff7cd217'),
(8, 'Saudi Riyal', 'SAR', '﷼', 'left', 0.045051445095212, 22.196846247364, 1, '18227d67abb50f00fbd19c71ea9c93238afd0400'),
(9, 'Chinese Yuan', 'CNY', '¥', 'left', 0.087921047271665, 11.373840860996, 1, 'a05f4bd12a533b6d1c619513c330cf5b39b494e9'),
(10, 'Vietnamese Dong', 'VND', '₫', 'left', 294.38407761965, 0.0033969228501958, 1, '18ea7c50963f3fdb36a4506de7f47d6f458c5362'),
(11, 'Kuwaiti Dinar', 'KWD', 'د.ك', 'left', 0.0037157576935952, 269.12411477306, 1, '1cd9155bf3dc874ea43442a7632b503e3be36cc1'),
(12, 'Egyptian Pound', 'EGP', '£', 'left', 0.3711722695648, 2.6941667845297, 1, 'ca11309d64a3ce2eca7562f953273776f713c024'),
(13, 'Pakistani Rupee', 'PKR', '₨', 'left', 3.4280474618823, 0.29171124703476, 1, '8c0738e04dca8f81925f00154f5e62318d53d36a'),
(14, 'Nigerian Naira', 'NGN', '₦', 'left', 9.6445623830002, 0.10368536801241, 1, '792d3fc2d26bba98bd67ffa90fb11a4930cc0a9c');

-- --------------------------------------------------------

--
-- Table structure for table `custom_settings`
--

CREATE TABLE `custom_settings` (
  `id` int(11) NOT NULL,
  `snow_data` text NOT NULL,
  `snow_data_array` text NOT NULL,
  `snow_status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 - inactive , 2 - active',
  `start_count_parser` text NOT NULL,
  `orders_count_increase` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_settings`
--

INSERT INTO `custom_settings` (`id`, `snow_data`, `snow_data_array`, `snow_status`, `start_count_parser`, `orders_count_increase`) VALUES
(1, '\"snow\":{\"init\":false,\"options\":{\"particles\":{\"move\":{\"speed\":,\"bounce\":false,\"enable\":true,\"random\":false,\"attract\":{\"enable\":false,\"rotateX\":600,\"rotateY\":1200},\"out_mode\":\"out\",\"straight\":false,\"direction\":\"bottom\"},\"size\":{\"anim\":{\"sync\":false,\"speed\":40,\"enable\":false,\"size_min\":0.1},\"value\":10,\"random\":true},\"color\":{\"value\":\"#fff\"},\"number\":{\"value\":,\"density\":{\"enable\":true,\"value_area\":650}},\"opacity\":{\"anim\":{\"sync\":false,\"speed\":1,\"enable\":true,\"opacity_min\":0.9},\"value\":0.9,\"random\":true},\"line_linked\":{\"color\":\"#ffffff\",\"width\":1,\"enable\":false,\"opacity\":0.8,\"distance\":500}},\"interactivity\":{\"modes\":{\"bubble\":{\"size\":4,\"speed\":3,\"opacity\":1,\"distance\":400,\"duration\":0.3},\"repulse\":{\"speed\":3,\"distance\":200,\"duration\":0.4}},\"events\":{\"resize\":true,\"onclick\":{\"mode\":\"repulse\",\"enable\":true},\"onhover\":{\"mode\":\"bubble\",\"enable\":false}},\"detect_on\":\"window\"},\"retina_detect\":true}},\"toys\":{\"init\":false,\"options\":{\"count\":100,\"speed\":1,\"images\":[],\"maxSize\":30,\"launches\":\"1\"}},\"garland\":{\"init\":false,\"options\":{\"type\":\"\",\"style\":\"\"}},\"fireworks\":{\"init\":false,\"options\":{\"delay\":{\"max\":30,\"min\":30},\"friction\":,\"launches\":1,}}', '{\"snow_fall\":\"true\",\"snowflakes\":\"20\",\"snow_speed\":\"3\",\"garlands\":\"true\",\"gar_shape\":\"apple\",\"gar_style\":\"style1\",\"fire_works\":\"true\",\"fire_size\":\"0.95\",\"fire_speed\":\"slow\",\"toy_size\":\"80\",\"toy_quantity\":\"100\",\"toy_speed\":\"6\",\"toy_launch\":\"infinite\"}', '1', '{\"none\":\"Catch from supplier\",\"instagram_follower\":\"Instagram followers\",\"instagram_photo\":\"Instagram likes\",\"instagram_comments\":\"Instagram comments\",\"youtube_views\":\"Youtube views\",\"youtube_likes\":\"Youtube likes\",\"youtube_comments\":\"Youtube comments\",\"youtube_subscribers\":\"Youtube subscribers\"}', '0:0');

-- --------------------------------------------------------

--
-- Table structure for table `decoration`
--

CREATE TABLE `decoration` (
  `id` int(11) NOT NULL,
  `snow_effect` int(11) NOT NULL,
  `snow_colour` text NOT NULL,
  `diwali_lights` int(11) NOT NULL,
  `video_link` text NOT NULL,
  `christmas_deco` varchar(5000) NOT NULL,
  `action_link` text NOT NULL,
  `pop_noti` int(11) NOT NULL,
  `pop_title` text NOT NULL,
  `pop_desc` text NOT NULL,
  `action_text` varchar(10) NOT NULL,
  `action_button` int(11) NOT NULL,
  `snow_fall` varchar(500) DEFAULT NULL,
  `garlands` text DEFAULT NULL,
  `fire_works` text DEFAULT NULL,
  `toys` text DEFAULT NULL,
  `snowflakes` int(11) NOT NULL,
  `snow_speed` int(11) NOT NULL,
  `gar_shape` text NOT NULL,
  `gar_style` text NOT NULL,
  `fire_size` varchar(100) NOT NULL,
  `fire_speed` text NOT NULL,
  `toy_size` int(11) NOT NULL,
  `toy_quantity` int(11) NOT NULL,
  `toy_speed` int(11) NOT NULL,
  `toy_launch` varchar(100) NOT NULL,
  `toy_a` varchar(50) NOT NULL,
  `toy_b` varchar(50) NOT NULL,
  `toy_c` varchar(50) NOT NULL,
  `toy_d` varchar(50) NOT NULL,
  `toy_e` varchar(50) NOT NULL,
  `toy_f` varchar(50) NOT NULL,
  `toy_g` varchar(50) NOT NULL,
  `toy_h` varchar(50) NOT NULL,
  `toy_i` varchar(50) NOT NULL,
  `toy_j` varchar(50) NOT NULL,
  `toy_k` varchar(50) NOT NULL,
  `psw_license` text NOT NULL,
  `toy_l` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `decoration`
--

INSERT INTO `decoration` (`id`, `snow_effect`, `snow_colour`, `diwali_lights`, `video_link`, `christmas_deco`, `action_link`, `pop_noti`, `pop_title`, `pop_desc`, `action_text`, `action_button`, `snow_fall`, `garlands`, `fire_works`, `toys`, `snowflakes`, `snow_speed`, `gar_shape`, `gar_style`, `fire_size`, `fire_speed`, `toy_size`, `toy_quantity`, `toy_speed`, `toy_launch`, `toy_a`, `toy_b`, `toy_c`, `toy_d`, `toy_e`, `toy_f`, `toy_g`, `toy_h`, `toy_i`, `toy_j`, `toy_k`, `psw_license`, `toy_l`) VALUES
(1, 0, '#000000', 0, '', '\n<style>.particle-snow{position:fixed;top:0;left:0;width:100%;height:100%;z-index:1;pointer-events:none}.particle-snow canvas{position:fixed;top:0;left:0;width:100%;height:100%;pointer-events:none}.christmas-garland{text-align:center;white-space:nowrap;overflow:hidden;position:absolute;z-index:1;padding:0;pointer-events:none;width:100%;height:85px}.christmas-garland .christmas-garland__item{position:relative;width:28px;height:28px;border-radius:50%;display:inline-block;margin-left:20px}.christmas-garland .christmas-garland__item .shape{-webkit-animation-fill-mode:both;animation-fill-mode:both;-webkit-animation-iteration-count:infinite;animation-iteration-count:infinite;-webkit-animation-name:flash-1;animation-name:flash-1;-webkit-animation-duration:2s;animation-duration:2s}.christmas-garland .christmas-garland__item .apple{width:22px;height:22px;border-radius:50%;margin-left:auto;margin-right:auto;margin-top:8px}.christmas-garland .christmas-garland__item .pear{width:12px;height:28px;border-radius:50%;margin-left:auto;margin-right:auto;margin-top:6px}.christmas-garland .christmas-garland__item:nth-child(2n+1) .shape{-webkit-animation-name:flash-2;animation-name:flash-2;-webkit-animation-duration:.4s;animation-duration:.4s}.christmas-garland .christmas-garland__item:nth-child(4n+2) .shape{-webkit-animation-name:flash-3;animation-name:flash-3;-webkit-animation-duration:1.1s;animation-duration:1.1s}.christmas-garland .christmas-garland__item:nth-child(odd) .shape{-webkit-animation-duration:1.8s;animation-duration:1.8s}.christmas-garland .christmas-garland__item:nth-child(3n+1) .shape{-webkit-animation-duration:1.4s;animation-duration:1.4s}.christmas-garland .christmas-garland__item:before{content:\"\";position:absolute;background:#222;width:10px;height:10px;border-radius:3px;top:-1px;left:9px}.christmas-garland .christmas-garland__item:after{content:\"\";top:-9px;left:14px;position:absolute;width:52px;height:18px;border-bottom:solid #222 2px;border-radius:50%}.christmas-garland .christmas-garland__item:last-child:after{content:none}.christmas-garland .christmas-garland__item:first-child{margin-left:-40px}</style>\n<!-- developed by Raj Patel-->\n      \n<!-- developed by Raj Patel-->  \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/libs/jquery/1.12.4/jquery.min.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/flpbonhmkq9tsp29.js\">\n          </script>\n    \n        \n<!-- developed by Raj Patel-->\n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/a4kdpfesx15uh7ae.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/596z6ya3isgxcipy.js\">\n          </script>\n    \n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/39j8e9yrxs283d1x.js\">\n          </script>\n    \n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/global/33srijdbqcgk6lsz.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/52pp7z/wxbh27w4jdzpslxn.js\">\n          </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" src=\"https://cdn.mypanel.link/52pp7z/angedasgma230hxr.js\">\n          </script>\n    \n        \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n    <script type=\"text/javascript\" >\n       window.modules.layouts = {\"theme_id\":1,\"auth\":0,\"live\":true};     </script>\n    \n        \n    <script type=\"text/javascript\" >\n       window.modules.signin = [];     </script>\n    \n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n<!-- developed by Raj Patel-->\n        \n    <script type=\"text/javascript\" >\n       document.addEventListener(\'DOMContentLoaded\', function() { \nvar newYearEvent = new window.NewYearEvent({\"snow\":{\"init\":true,\"options\":{\"particles\":{\"move\":{\"speed\":3,\"bounce\":false,\"enable\":true,\"random\":false,\"attract\":{\"enable\":false,\"rotateX\":600,\"rotateY\":1200},\"out_mode\":\"out\",\"straight\":false,\"direction\":\"bottom\"},\"size\":{\"anim\":{\"sync\":false,\"speed\":40,\"enable\":false,\"size_min\":0.1},\"value\":5,\"random\":true},\"color\":{\"value\":\"#fff\"},\"number\":{\"value\":100,\"density\":{\"enable\":true,\"value_area\":650}},\"opacity\":{\"anim\":{\"sync\":false,\"speed\":1,\"enable\":true,\"opacity_min\":0.9},\"value\":0.9,\"random\":true},\"line_linked\":{\"color\":\"#ffffff\",\"width\":1,\"enable\":false,\"opacity\":0.8,\"distance\":500}},\"interactivity\":{\"modes\":{\"bubble\":{\"size\":4,\"speed\":3,\"opacity\":1,\"distance\":400,\"duration\":0.3},\"repulse\":{\"speed\":3,\"distance\":200,\"duration\":0.4}},\"events\":{\"resize\":true,\"onclick\":{\"mode\":\"repulse\",\"enable\":true},\"onhover\":{\"mode\":\"bubble\",\"enable\":false}},\"detect_on\":\"window\"},\"retina_detect\":true}},\"toys\"', '', 0, '', '', '', 0, NULL, NULL, NULL, NULL, 500, 5, 'apple', 'style3', '0.97', 'medium', 50, 60, 3, '1', '', '', '', '', '1', '1', '', '1', '', '', '1', 'dukesmm.com', '1');

-- --------------------------------------------------------

--
-- Table structure for table `earn`
--

CREATE TABLE `earn` (
  `earn_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `link` text NOT NULL,
  `earn_note` text NOT NULL,
  `status` enum('Pending','Under Review','Funds Granted','Rejected','Not Eligible') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `General_options`
--

CREATE TABLE `General_options` (
  `id` int(11) NOT NULL,
  `coupon_status` enum('1','2') NOT NULL DEFAULT '1',
  `updates_show` enum('1','2') NOT NULL DEFAULT '1',
  `panel_status` enum('Pending','Active','Frozen','Suspended') NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `massorder` enum('1','2') NOT NULL DEFAULT '2',
  `balance_format` enum('0.0','0.00','0.000','0.0000') NOT NULL DEFAULT '0.0',
  `currency_format` enum('0','2','3','4') NOT NULL DEFAULT '3',
  `ticket_system` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_options`
--

INSERT INTO `General_options` (`id`, `coupon_status`, `updates_show`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `massorder`, `balance_format`, `currency_format`, `ticket_system`) VALUES
(1, '', '2', 'Active', 1024, 20, '2', '', '', '2');

-- --------------------------------------------------------

--
-- Table structure for table `integrations`
--

CREATE TABLE `integrations` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `icon_url` varchar(225) NOT NULL,
  `code` text NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `integrations`
--

INSERT INTO `integrations` (`id`, `name`, `description`, `icon_url`, `code`, `visibility`, `status`) VALUES
(1, 'Beamer', 'Announce updates and get feedback with in-app notification center, widgets and changelog', '/img/integrations/Beamer.svg', '', 1, 1),
(2, 'Getsitecontrol', 'It helps you prevent website visitors from leaving your website without taking any action.', '/img/integrations/Getsitecontrol.svg', '<html>\r\n<body style=\'background-color:black\'>\r\n<canvas id=\'myCanvas\' width=\'800\' height=\'800\'></canvas>\r\n<script>\r\nconst max_fireworks = 5,\r\n  max_sparks = 50;\r\nlet canvas = document.getElementById(\'myCanvas\');\r\nlet context = canvas.getContext(\'2d\');\r\nlet fireworks = [];\r\n \r\nfor (let i = 0; i < max_fireworks; i++) {\r\n  let firework = {\r\n    sparks: []\r\n  };\r\n  for (let n = 0; n < max_sparks; n++) {\r\n    let spark = {\r\n      vx: Math.random() * 5 + .5,\r\n      vy: Math.random() * 5 + .5,\r\n      weight: Math.random() * .3 + .03,\r\n      red: Math.floor(Math.random() * 2),\r\n      green: Math.floor(Math.random() * 2),\r\n      blue: Math.floor(Math.random() * 2)\r\n    };\r\n    if (Math.random() > .5) spark.vx = -spark.vx;\r\n    if (Math.random() > .5) spark.vy = -spark.vy;\r\n    firework.sparks.push(spark);\r\n  }\r\n  fireworks.push(firework);\r\n  resetFirework(firework);\r\n}\r\nwindow.requestAnimationFrame(explode);\r\n \r\nfunction resetFirework(firework) {\r\n  firework.x = Math.floor(Math.random() * canvas.width);\r\n  firework.y = canvas.height;\r\n  firework.age = 0;\r\n  firework.phase = \'fly\';\r\n}\r\n \r\nfunction explode() {\r\n  context.clearRect(0, 0, canvas.width, canvas.height);\r\n  fireworks.forEach((firework,index) => {\r\n    if (firework.phase == \'explode\') {\r\n        firework.sparks.forEach((spark) => {\r\n        for (let i = 0; i < 10; i++) {\r\n          let trailAge = firework.age + i;\r\n          let x = firework.x + spark.vx * trailAge;\r\n          let y = firework.y + spark.vy * trailAge + spark.weight * trailAge * spark.weight * trailAge;\r\n          let fade = i * 20 - firework.age * 2;\r\n          let r = Math.floor(spark.red * fade);\r\n          let g = Math.floor(spark.green * fade);\r\n          let b = Math.floor(spark.blue * fade);\r\n          context.beginPath();\r\n          context.fillStyle = \'rgba(\' + r + \',\' + g + \',\' + b + \',1)\';\r\n          context.rect(x, y, 4, 4);\r\n          context.fill();\r\n        }\r\n      });\r\n      firework.age++;\r\n      if (firework.age > 100 && Math.random() < .05) {\r\n        resetFirework(firework);\r\n      }\r\n    } else {\r\n      firework.y = firework.y - 10;\r\n      for (let spark = 0; spark < 15; spark++) {\r\n        context.beginPath();\r\n        context.fillStyle = \'rgba(\' + index * 50 + \',\' + spark * 17 + \',0,1)\';\r\n        context.rect(firework.x + Math.random() * spark - spark / 2, firework.y + spark * 4, 4, 4);\r\n        context.fill();\r\n      }\r\n      if (Math.random() < .001 || firework.y < 200) firework.phase = \'explode\';\r\n    }\r\n  });\r\n  window.requestAnimationFrame(explode);\r\n}\r\n</script>\r\n</body>\r\n</html>', 1, 1),
(3, 'Google Analytics', 'Statistics and basic analytical tools for search engine optimization (SEO) and marketing purposes', '/img/integrations/Google%20Analytics.svg', '', 1, 1),
(4, 'Google Tag manager', 'Manage all your website tags without editing the code using simple tag management solutions', '/img/integrations/Google%20Tag%20manager.svg', '', 1, 1),
(5, 'JivoChat', 'All-in-one business messenger to talk to customers: live chat, phone, email and social', '/img/integrations/JivoChat.svg', '', 1, 1),
(6, 'Onesignal', 'Leader in customer engagement, empowers mobile push, web push, email, in-app messages', '/img/integrations/Onesignal.svg', '', 1, 1),
(7, 'Push alert', 'Increase reach, revenue, retarget users with Push Notifications on desktop and mobile', '/img/integrations/Push%20alert.svg', '', 1, 1),
(8, 'Smartsupp', 'Live chat, email inbox and Facebook Messenger in one customer messaging platform', '/img/integrations/Smartsupp.svg', '', 1, 1),
(9, 'Tawk.to', 'Track and chat with visitors on your website, mobile app or a free customizable page', '/img/integrations/Tawk.to.svg', '', 1, 1),
(10, 'Tidio', 'Communicator for businesses that keep live chat, chatbots, Messenger and email in one place', '/img/integrations/Tidio.svg', '', 1, 1),
(11, 'Zendesk Chat', 'Helps respond quickly to customer questions, reduce wait times and increase sales', '/img/integrations/Zendesk%20Chat.svg', '', 1, 1),
(12, 'Getbutton.io', 'Chat with website visitors through popular messaging apps. Whatsapp, messenger etc. contact button.', '/img/integrations/Getbutton.svg', '', 1, 1),
(13, 'Google reCAPTCHA v2', 'It uses an advanced risk analysis engine and adaptive challenges to prevent malware from engaging in abusive activities on your website.', '/img/integrations/reCAPTCHA.svg', '', 1, 1),
(14, 'Whatsapp', 'Whatsapp is for Personal Support of your Users', '/img/integrations/whatsapp.svg', ' <div>\r\n<!-- https://github.com/sabirans04/whatsapp-floating-button -->\r\n<style>\r\n.sabirans04 {\r\n    position: fixed;\r\n    bottom: 18px;\r\n    left: 18px;right: auto !important;}\r\n</style>\r\n    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/gh/sabirans04/Animated-Floating-Whatsapp-Icon/assets/css/style.css\">\r\n\r\n<a target=\"_blank\" class=\"sabirans04\" href=\"https://wa.me/+919584355207\"><i class=\"icon\"><svg height=\"682pt\" viewBox=\"-23 -21 682 682.66669\" width=\"682pt\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"m544.386719 93.007812c-59.875-59.945312-139.503907-92.9726558-224.335938-93.007812-174.804687 0-317.070312 142.261719-317.140625 317.113281-.023437 55.894531 14.578125 110.457031 42.332032 158.550781l-44.992188 164.335938 168.121094-44.101562c46.324218 25.269531 98.476562 38.585937 151.550781 38.601562h.132813c174.785156 0 317.066406-142.273438 317.132812-317.132812.035156-84.742188-32.921875-164.417969-92.800781-224.359376zm-224.335938 487.933594h-.109375c-47.296875-.019531-93.683594-12.730468-134.160156-36.742187l-9.621094-5.714844-99.765625 26.171875 26.628907-97.269531-6.269532-9.972657c-26.386718-41.96875-40.320312-90.476562-40.296875-140.28125.054688-145.332031 118.304688-263.570312 263.699219-263.570312 70.40625.023438 136.589844 27.476562 186.355469 77.300781s77.15625 116.050781 77.132812 186.484375c-.0625 145.34375-118.304687 263.59375-263.59375 263.59375zm144.585938-197.417968c-7.921875-3.96875-46.882813-23.132813-54.148438-25.78125-7.257812-2.644532-12.546875-3.960938-17.824219 3.96875-5.285156 7.929687-20.46875 25.78125-25.09375 31.066406-4.625 5.289062-9.242187 5.953125-17.167968 1.984375-7.925782-3.964844-33.457032-12.335938-63.726563-39.332031-23.554687-21.011719-39.457031-46.960938-44.082031-54.890626-4.617188-7.9375-.039062-11.8125 3.476562-16.171874 8.578126-10.652344 17.167969-21.820313 19.808594-27.105469 2.644532-5.289063 1.320313-9.917969-.664062-13.882813-1.976563-3.964844-17.824219-42.96875-24.425782-58.839844-6.4375-15.445312-12.964843-13.359374-17.832031-13.601562-4.617187-.230469-9.902343-.277344-15.1875-.277344-5.28125 0-13.867187 1.980469-21.132812 9.917969-7.261719 7.933594-27.730469 27.101563-27.730469 66.105469s28.394531 76.683594 32.355469 81.972656c3.960937 5.289062 55.878906 85.328125 135.367187 119.648438 18.90625 8.171874 33.664063 13.042968 45.175782 16.695312 18.984374 6.03125 36.253906 5.179688 49.910156 3.140625 15.226562-2.277344 46.878906-19.171875 53.488281-37.679687 6.601563-18.511719 6.601563-34.375 4.617187-37.683594-1.976562-3.304688-7.261718-5.285156-15.183593-9.253906zm0 0\" fill-rule=\"evenodd\"></path></svg></i></a>\r\n\r\n<!-- https://github.com/sabirans04/whatsapp-floating-button -->\r\n\r\n</div>', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'English', 'en', '2', '1'),
(2, 'Arabic', 'ar', '2', '0'),
(3, 'Hindi', 'hi', '2', '0'),
(4, 'Tamil', 'ta', '2', '0'),
(5, 'Bengali', 'bn', '2', '0');

-- --------------------------------------------------------

--
-- Table structure for table `Mailforms`
--

CREATE TABLE `Mailforms` (
  `id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `message` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `header` varchar(225) NOT NULL,
  `footer` varchar(225) NOT NULL,
  `type` enum('Admins','Users') NOT NULL DEFAULT 'Users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `menu_name_lang` longtext DEFAULT NULL CHECK (json_valid(`menu_name_lang`)),
  `menu_line` double NOT NULL,
  `type` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2',
  `slug` varchar(225) NOT NULL DEFAULT '2',
  `icon` varchar(225) DEFAULT NULL,
  `menu_status` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `visible` enum('Internal','External') NOT NULL DEFAULT 'Internal',
  `active` varchar(225) NOT NULL,
  `tiptext` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `menu_name_lang`, `menu_line`, `type`, `slug`, `icon`, `menu_status`, `visible`, `active`, `tiptext`) VALUES
(1, 'New Order', '{\"en\": \"New Order\"}', 1, '2', '/', 'fa fa-shopping-bag', '1', 'Internal', 'neworder', ''),
(2, 'Mass Order', '{\"en\": \"Mass Order\"}', 2, '2', '/massorder', 'fas fa-cart-plus', '1', 'Internal', 'massorder', 'Shown only if Mass Order system enabled for use'),
(3, 'Orders ', '{\"en\": \"Orders \"}', 3, '2', '/orders', 'fas fa-server', '1', 'Internal', 'orders', ''),
(6, 'Services', '{\"en\": \"Services\"}', 5, '2', '/services', 'fas fa-file-alt', '1', 'Internal', 'services', ''),
(7, 'Add Funds', '{\"en\": \"Add Funds\"}', 6, '2', '/addfunds', 'fab fa-cc-amazon-pay', '1', 'Internal', 'addfunds', ''),
(8, 'Api', '{\"en\": \"Api\"}', 9, '2', '/api', 'fal fa-plug', '1', 'Internal', 'api', ''),
(9, 'Tickets ', '{\"en\": \"Tickets \"}', 8, '2', '/tickets', 'fas fa-headset', '1', 'Internal', 'tickets', ''),
(10, 'Child Panels', '{\"en\": \"Child Panels\"}', 10, '2', '/child-panels', 'fas fa-child', '1', 'Internal', 'child-panels', 'Shown only if child panels selling enabled'),
(11, 'Refer & Earn', '{\"en\": \"Refer & Earn\"}', 11, '2', '/refer', 'fas fa-bezier-curve', '1', 'Internal', 'refer', 'Shown only if affiliate system enabled for use'),
(13, 'Terms', '{\"en\": \"Terms\"}', 12, '2', '/terms', 'fas fa-exclamation-triangle', '1', 'Internal', 'terms', ''),
(14, 'Signup ', '{\"en\": \"Signup\"}', 2, '2', '/signup', 'fas fa-arrow-right', '1', 'External', 'signup', 'Shown only if Signup system enabled for use'),
(15, 'Api', '{\"en\": \"Api\"}', 4, '2', '/api', 'fal fa-plug', '1', 'External', 'api', ''),
(17, 'Daily Updates', '{\"en\": \"Daily Updates\"}', 13, '2', '/updates', 'fas fa-bell', '1', 'Internal', '', 'Shown only if Updates System enabled'),
(18, 'Terms', '{\"en\": \"Terms\"}', 3, '2', '/terms', 'fas fa-exclamation-triangle', '1', 'External', 'terms', ''),
(32, 'blogs', '{\"en\": \"blogs\"}', 16, '2', '/blog', 'fab fa-500px', '1', 'Internal', 'blog', ''),
(24, 'Services', '{\"en\": \"Services\"}', 14, '2', '/services', 'fas fa-file-alt', '1', 'External', 'services', ''),
(28, 'Transfer Funds ', '{\"en\": \"Transfer Funds \"}', 14, '2', '/transferfunds', 'fas fa-grip-vertical', '1', 'Internal', 'Transfer Funds ', ''),
(31, 'blogs', '{\"en\":\"blogs\",\"ar\":\"\",\"hi\":\"\",\"ta\":\"\",\"bn\":\"\"}', 15, '2', '/blog', 'fab fa-500px', '1', 'External', 'blog', '');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news_icon` varchar(225) NOT NULL,
  `news_title` varchar(225) NOT NULL,
  `news_title_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`news_title_lang`)),
  `news_content` varchar(225) NOT NULL,
  `news_content_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`news_content_lang`)),
  `news_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications_popup`
--

CREATE TABLE `notifications_popup` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` text DEFAULT NULL,
  `action_link` text DEFAULT NULL,
  `isAllUser` enum('1','0') NOT NULL DEFAULT '0',
  `expiry_date` date NOT NULL,
  `status` enum('1','2','0') NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `action_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text DEFAULT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double NOT NULL DEFAULT 0,
  `api_currencycharge` double DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site',
  `refill_status` enum('Pending','Refilling','Completed','Rejected','Error') NOT NULL DEFAULT 'Pending',
  `is_refill` enum('1','2') NOT NULL DEFAULT '1',
  `refill` varchar(225) NOT NULL DEFAULT '1',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'true',
  `api_refillid` double NOT NULL DEFAULT 0,
  `avg_done` enum('0','1') NOT NULL DEFAULT '1',
  `order_increase` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL,
  `page_status` enum('1','2') NOT NULL DEFAULT '1',
  `active` enum('1','2') NOT NULL DEFAULT '1',
  `seo_title` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_keywords` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `seo_description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_modified` datetime NOT NULL,
  `del` varchar(255) NOT NULL DEFAULT '1',
  `page_content2` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`, `page_status`, `active`, `seo_title`, `seo_keywords`, `seo_description`, `last_modified`, `del`, `page_content2`) VALUES
(2, 'Add funds', 'addfunds', '', '1', '1', '', '', '', '2023-07-27 09:55:56', '2', ''),
(787, 'Login', 'auth', '', '1', '1', '', '', '', '2023-08-12 09:18:17', '2', ''),
(9, 'New Order', 'neworder', '', '1', '1', '', '', '', '2023-08-02 11:58:29', '2', ''),
(14, 'Terms', 'terms', '<p style=\"text-align: center; \"><b>Privacy Policy</b></p><p><br></p><p>HI THERE - WE RESPECT YOUR PRIVACY!</p><p><br></p><p>WE HATE PRIVACY BREACH AS MUCH AS YOU DO. BUT DURING THE TOTAL BUSINESS PROCESS WITH YOU, WE MIGHT NEED TO SHARE SOME OF YOUR DATA WITH THIRD PARTY. DETAILS OF OUR PRIVACY POLICY IS GIVEN BELOW. PLEASE NOTE THAT, BY PLACING ORDER WITH SocialGrowth24x7 , YOU AGREE WITH OUR TERMS AND CONDITIONS AND PRIVACY POLICY. WE MIGHT CHANGE THE PRIVACY POLICY TIME TO TIME.</p><p><br></p><p>PLEASE READ THE FOLLOWING CAREFULLY BEFORE PROCEEDING TO USE SocialGrowth24x7 :</p><p><br></p><p><br></p><p><br></p><p><b>Data Collection:</b></p><p><br></p><p>This document describes the official privacy policy of SocialGrowth24x7 . The user is advised to read the privacy policy and ensure that he/she has no ambiguity with reference to any point of the Privacy Policy.</p><p><br></p><p><br></p><p><br></p><p>The user is informed that by visiting, using and continuing to use SocialGrowth24x7 or subscribing to any package of the Services, it shall be presumed that the user has accepted all the points of the Privacy Policy. If you do not agree to the Privacy Policy, please do not use Cheapest SMM Panel and the Services.</p><p><br></p><p><b>Use License :</b></p><p>Permission is granted to temporarily download one copy of the materials (information or software) on SocialGrowth24x7\'s web site for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license, you may not:</p><p>modify or copy the materials</p><p>use the materials for any commercial purpose, or for any public display (commercial or non-commercial)</p><p>attempt to decompile or reverse engineer any software contained on SocialGrowth24x7\'s web site</p><p>remove any copyright or other proprietary notations from the materials; or</p><p>transfer the materials to another person or “mirror” the materials on any other server.</p><p>This license shall automatically terminate if you violate any of these restrictions and may be terminated by SocialGrowth24x7\'s at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.</p><p><br></p><p><b>What information we collect:</b></p><p><br></p><p>We might collect the following information from our user and use for the purpose of completing the transaction, job, and maintenance of our financial or strategic information:</p><p><br></p><p>Name</p><p><br></p><p>Business Name</p><p><br></p><p>User name of the clientâ€™s social media account</p><p><br></p><p>Email</p><p><br></p><p>Phone number</p><p><br></p><p>User preferences and history of internet use for optimization of the services by employing the cookies.</p><p><br></p><p><br></p><p><br></p><p><b>What are Cookies?</b></p><p><br></p><p>The cookies are a small piece of data consisting of a text-only string of information introduced by a particular website and are stored in the hard disk of the machine. They collect data relating to the browsing preferences and history, and such other information the user has provided to the website.</p><p><br></p><p><br></p><p><br></p><p><b>Our Cookies</b></p><p><br></p><p>Our cookies aim to give the user an optimal use of SocialGrowth24x7. The collected information is also used for general marketing and statistical analysis. Our cookies do not collect personal data of user. Some cookies are communicated to the userâ€™s hard disk by the third party. SocialGrowth24x7 has no affiliation with such party. SocialGrowth24x7 disclaims any liability arising from such cookies. The client is advised to read the respective policy of the third party or block their entrance.</p><p><br></p><p><br></p><p><br></p><p><b>How to Stop Cookies</b></p><p><br></p><p>By default, the browsers are set to allow cookies. The user may opt to disable cookies if he/she does not want them to process in userâ€™s machine by changing browser settings. It is also possible to configure browser setting allowing some and denying the others to have access to the userâ€™s computer or set the browser to notify when a cookie knock. The â€˜Helpâ€™ section of the browser may assist the user to manage the cookies preference.</p><p><br></p><p><br></p><p><br></p><p>Security and Confidentiality of the Information</p><p><br></p><p>SocialGrowth24x7 respect the privacy of the user. SocialGrowth24x7 employs a sophisticated security system to make it sure that such information is within the trusted staff of SocialGrowth24x7 and uses it on the â€˜need-to-know basisâ€™. The payment-related information is encrypted with the help of the highly reliable technology SSL. SocialGrowth24x7 has taken all the possible steps to safeguard the information relating to the user is safe. SocialGrowth24x7 disclaims the liability in case of SocialGrowth24x7 fails to maintain the security due to the cause beyond the reasonable control.</p><p><br></p><p><br></p><p><br></p><p><b>Modifications</b></p><p><br></p><p>SocialGrowth24x7 may change, modify or amend the Privacy Policy at any time without prior notice. The amended version of Privacy Policy shall immediately be effective after it is posted on SocialGrowth24x7.</p>', '1', '1', '', '', '', '2024-09-13 09:54:01', '2', ''),
(789, 'Mass Order', 'massorder', '', '1', '1', '', '', '', '2022-02-07 08:43:06', '2', ''),
(790, 'Orders', 'orders', '', '1', '1', '', '', '', '2022-02-07 08:53:20', '2', ''),
(791, 'Services', 'services', '', '1', '1', '', '', '', '2022-01-26 07:22:09', '2', ''),
(792, 'Tickets', 'tickets', '', '1', '1', '', '', '', '2022-01-26 07:22:09', '2', ''),
(793, 'API', 'api', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', ''),
(794, 'Signup', 'signup', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', ''),
(795, 'Blog', 'blog', '', '1', '1', '', '', '', '2022-01-24 07:21:07', '2', ''),
(909, 'success', 'success', '', '1', '1', '', '', '', '0000-00-00 00:00:00', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `panel_categories`
--

CREATE TABLE `panel_categories` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '1 -> ENABLE, 0 -> DISABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_info`
--

CREATE TABLE `panel_info` (
  `panel_id` int(11) NOT NULL,
  `panel_domain` text NOT NULL,
  `panel_plan` text NOT NULL,
  `panel_status` enum('Pending','Active','Frozen','Suspended') NOT NULL,
  `panel_orders` int(11) NOT NULL,
  `panel_thismonthorders` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `renewal_date` datetime NOT NULL,
  `panel_type` enum('Child','Main') NOT NULL DEFAULT 'Main'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `panel_info`
--

INSERT INTO `panel_info` (`panel_id`, `panel_domain`, `panel_plan`, `panel_status`, `panel_orders`, `panel_thismonthorders`, `date_created`, `api_key`, `renewal_date`, `panel_type`) VALUES
(1, 'yourpanel.com', 'A', 'Active', 1453, 1453, '2022-01-24 10:58:08', 'b1fbedd6f1266a8990bf648919068680', '2025-02-23 10:58:08', 'Main');

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethods`
--

CREATE TABLE `paymentmethods` (
  `methodId` int(11) NOT NULL,
  `methodName` varchar(300) DEFAULT NULL,
  `methodLogo` varchar(200) DEFAULT NULL,
  `methodVisibleName` varchar(300) DEFAULT NULL,
  `methodCallback` varchar(100) DEFAULT NULL,
  `methodMin` int(11) NOT NULL DEFAULT 1,
  `methodMax` int(11) NOT NULL DEFAULT 1,
  `methodFee` float NOT NULL DEFAULT 0,
  `methodBonusPercentage` float NOT NULL DEFAULT 0,
  `methodBonusStartAmount` int(11) NOT NULL DEFAULT 0,
  `methodCurrency` varchar(3) DEFAULT NULL,
  `methodStatus` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 -> off, 1 -> on',
  `methodExtras` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `methodPosition` int(11) DEFAULT NULL,
  `methodInstructions` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paymentmethods`
--

INSERT INTO `paymentmethods` (`methodId`, `methodName`, `methodLogo`, `methodVisibleName`, `methodCallback`, `methodMin`, `methodMax`, `methodFee`, `methodBonusPercentage`, `methodBonusStartAmount`, `methodCurrency`, `methodStatus`, `methodExtras`, `methodPosition`, `methodInstructions`) VALUES
(1, 'PayTM Checkout', 'https://excelcdn.in/smm/admin/images/payment-methods/paytm.png', 'PayTM Checkout', 'payTMCheckout', 1, 100000, 0, 0, 0, 'INR', '1', '{\"merchantId\":\"\",\"merchantKey\":\"\"}', 2, ''),
(2, 'PayTM Merchant', 'https://excelcdn.in/smm/admin/images/payment-methods/paytm.png', 'PayTM Merchant', 'payTMMerchant', 1, 10000, 0, 0, 0, 'INR', '1', '{\"merchantId\":\"\"}', 1, ''),
(3, 'Perfect Money', 'https://excelcdn.in/smm/admin/images/payment-methods/perfect-money.png', 'Perfect Money', 'perfectMoney', 10, 1000, 3, 0, 0, 'USD', '0', '{\"accountNumber\":\"\",\"alternatePassPhrase\":\"\"}', 3, ''),
(4, 'Coinbase Commerce', 'https://excelcdn.in/smm/admin/images/payment-methods/coinbase-commerce.png', 'Coinbase Commerce', 'coinbaseCommerce', 1, 1000, 0, 0, 0, 'USD', '0', '{\"APIKey\":\"\"}', 4, NULL),
(5, 'Kashier', 'https://excelcdn.in/smm/admin/images/payment-methods/kashier.png', 'Kashier', 'kashier', 1, 1000, 0, 0, 0, 'USD', '0', '{\"MID\":\"\",\"APIKey\":\"\",\"mode\":\"live\"}', 5, NULL),
(6, 'Razorpay', 'https://excelcdn.in/smm/admin/images/payment-methods/razorpay.png', 'Razorpay', 'razorPay', 1, 10000, 0, 0, 0, 'INR', '0', '{\"APIPublicKey\":\"\",\"APISecretKey\":\"\",\"gatewayThemeColour\":\"\"}', 6, NULL),
(7, 'PhonePe (Automatic)', 'https://excelcdn.in/smm/admin/images/payment-methods/phonepe.png', 'PhonePe (Automatic)', 'phonepe', 1, 10000, 0, 0, 0, 'INR', '1', '{\"email\":\"\",\"password\":\"\"}', 7, ''),
(8, 'Easypaisa (Automatic)', 'https://excelcdn.in/smm/admin/images/payment-methods/easypaisa.png', 'Easypaisa (Automatic)', 'easypaisa', 1, 50000, 0, 0, 0, 'PKR', '0', '{\"email\":\"\",\"password\":\"\",\"senderEmail\":\"\",\"emailSubject\":\"easypaisa\"}', 8, NULL),
(9, 'Jazzcash (Automatic)', 'https://excelcdn.in/smm/admin/images/payment-methods/jazzcash.png', 'Jazzcash (Automatic)', 'jazzcash', 1, 50000, 0, 0, 0, 'PKR', '0', '{\"email\":\"\",\"password\":\"\",\"senderEmail\":\"\",\"emailSubject\":\"jazzcash\"}', 9, NULL),
(10, 'Instamojo', 'https://excelcdn.in/smm/admin/images/payment-methods/instamojo.jpg', 'Instamojo', 'instamojo', 1, 1000, 0, 0, 0, 'INR', '0', '{\"APIKey\":\"\",\"authToken\":\"\"}', 10, NULL),
(11, 'Cashmaal', 'https://excelcdn.in/smm/admin/images/payment-methods/cashmaal.png', 'Cashmaal', 'cashmaal', 1, 50000, 0, 0, 0, 'PKR', '0', '{\"webId\":\"\"}', 11, NULL),
(12, 'Alipay', 'https://excelcdn.in/smm/admin/images/payment-methods/alipay.png', 'Alipay', 'alipay', 1, 10000, 0, 0, 0, 'USD', '0', '{\"partnerId\":\"\",\"privateKey\":\"\"}', 12, NULL),
(13, 'PayU', 'https://excelcdn.in/smm/admin/images/payment-methods/payu.png', 'PayU', 'payU', 1, 10000, 0, 0, 0, 'INR', '0', '{\"merchantKey\":\"\",\"merchantSalt\":\"\"}', 13, NULL),
(14, 'UpiApi', 'https://excelcdn.in/smm/admin/images/payment-methods/upiapi.png', 'UpiApi', 'upiapi', 1, 10000, 0, 0, 0, 'INR', '0', '{\"productionAPIToken\":\"\",\"productionAPISecretKey\":\"\"}', 2, ''),
(15, 'Opay Express Checkout', 'https://excelcdn.in/smm/admin/images/payment-methods/opay.png', 'Opay Express Checkout', 'opay', 1, 10000, 0, 0, 0, 'USD', '0', '{\"merchantId\":\"\",\"publicKey\":\"\",\"secretKey\":\"\"}', 3, ''),
(16, 'Flutterwave', 'https://excelcdn.in/smm/admin/images/payment-methods/flutterwave.png', 'Flutterwave', 'flutterwave', 1, 1000, 0, 0, 0, 'USD', '0', '{\"secretKey\":\"\"}', 3, ''),
(17, 'Stripe', 'https://excelcdn.in/smm/admin/images/payment-methods/stripe.png', 'Stripe', 'stripe', 1, 1000, 0, 0, 0, 'USD', '0', '{\"publishableKey\":\"\",\"secretKey\":\"\"}', 1, ''),
(18, 'Payeer', 'https://excelcdn.in/smm/admin/images/payment-methods/payeer.png', 'Payeer', 'payeer', 1, 1000, 0, 0, 0, 'USD', '1', '{\"shopId\":\"\",\"secretKey\":\"\"}', 1, ''),
(22, 'bharatpe', 'https://bp-wp-website-prod.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/09/bharatpe_logo.png', 'BharatPe', 'bharatpe', 1, 10000, 0, 5, 500, 'INR', '1', '{\"merchantId\":\"\",\"token\":\"\"}', 1, ''),
(100, 'Manual One', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual One', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 2, NULL),
(101, 'Manual Two', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Two', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 3, NULL),
(102, 'Manual Three', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Three', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 4, NULL),
(103, 'Manual Four', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Four', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 2, NULL),
(104, 'Manual Five', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Five', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 18, NULL),
(105, 'Manual Six', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Six', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 19, NULL),
(106, 'Manual Seven', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Seven', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 20, NULL),
(107, 'Manual Eight', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Eight', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 21, NULL),
(108, 'Manual Nine', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Nine', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 22, NULL),
(109, 'Manual Ten', 'https://excelcdn.in/smm/admin/images/payment-methods/manual.jpg', 'Manual Ten', NULL, 1, 1, 0, 0, 0, NULL, '0', NULL, 23, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_amount` decimal(15,4) NOT NULL,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` varchar(255) NOT NULL DEFAULT 'No',
  `payment_mode` enum('Manual','Automatic') NOT NULL DEFAULT 'Automatic',
  `payment_create_date` datetime NOT NULL,
  `payment_update_date` datetime NOT NULL,
  `payment_ip` varchar(225) NOT NULL,
  `payment_extra` text NOT NULL,
  `payment_bank` int(11) NOT NULL,
  `t_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL,
  `referral_client_id` int(11) NOT NULL,
  `referral_clicks` double NOT NULL DEFAULT 0,
  `referral_sign_up` double NOT NULL DEFAULT 0,
  `referral_totalFunds_byReffered` double NOT NULL DEFAULT 0,
  `referral_earned_commision` double DEFAULT 0,
  `referral_requested_commision` varchar(225) DEFAULT '0',
  `referral_total_commision` double DEFAULT 0,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `referral_code` text NOT NULL,
  `referral_rejected_commision` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `referral`
--

INSERT INTO `referral` (`referral_id`, `referral_client_id`, `referral_clicks`, `referral_sign_up`, `referral_totalFunds_byReffered`, `referral_earned_commision`, `referral_requested_commision`, `referral_total_commision`, `referral_status`, `referral_code`, `referral_rejected_commision`) VALUES
(1, 1, 0, 0, 0, 0, '0', 0, '1', 'db96fe', 0),
(2, 2, 0, 0, 0, 0, '0', 0, '1', 'dde3c0', 0),
(3, 3, 0, 0, 0, 0, '0', 0, '1', 'f0a44e', 0);

-- --------------------------------------------------------

--
-- Table structure for table `referral_payouts`
--

CREATE TABLE `referral_payouts` (
  `r_p_id` int(11) NOT NULL,
  `r_p_code` text NOT NULL,
  `r_p_status` enum('1','2','3','4','0') NOT NULL DEFAULT '0',
  `r_p_amount_requested` double NOT NULL,
  `r_p_requested_at` datetime NOT NULL,
  `r_p_updated_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `service_price` varchar(225) NOT NULL,
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text DEFAULT NULL,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`name_lang`)),
  `description_lang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description_lang`)),
  `time_lang` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `time` varchar(225) NOT NULL DEFAULT 'Not enough data',
  `cancelbutton` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1 -> ON, 2 -> OFF',
  `show_refill` enum('true','false') NOT NULL DEFAULT 'false',
  `service_profit` varchar(225) NOT NULL,
  `refill_days` varchar(225) NOT NULL DEFAULT '30',
  `refill_hours` varchar(225) NOT NULL DEFAULT '24',
  `avg_days` int(11) NOT NULL,
  `avg_hours` int(11) NOT NULL,
  `avg_minutes` int(11) NOT NULL,
  `avg_many` int(11) NOT NULL,
  `price_profit` int(11) NOT NULL,
  `service_overflow` int(11) NOT NULL DEFAULT 0,
  `service_sync` enum('0','1') NOT NULL DEFAULT '1',
  `service_deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`, `price_profit`, `service_overflow`, `service_sync`, `service_deleted`) VALUES
(1, 1, 1557, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"151.14\",\"currency\":\"INR\"}', 88, 1, '2', '1', 'Instagram Followers - [ Max - 500k ] [ ⚡ Current speed : 50k/day ] [ Stable, Almost Non Drop ] [ No Refill ] [ From Applications ] INSTANT', '', '181.368', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Followers - [ Max - 500k ] [ \\u26a1 Current speed : 50k\\/day ] [ Stable, Almost Non Drop ] [ No Refill ] [ From Applications ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(2, 1, 1556, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"173.65\",\"currency\":\"INR\"}', 88, 2, '2', '1', 'Instagram Followers - [ Max - 500k ] [ ⚡ Current speed : 10k/day ] [ 365 Days Refill BUTTON ] INSTANT', '', '208.38', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Followers - [ Max - 500k ] [ \\u26a1 Current speed : 10k\\/day ] [ 365 Days Refill BUTTON ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(3, 1, 1554, '2', '{\"min\":\"10\",\"max\":\"5000000\",\"rate\":\"98.24\",\"currency\":\"INR\"}', 88, 3, '2', '1', 'Instagram Followers: Speed 30-50k, Drop rate 0-3%. Important: Please disable flag for review before ordering otherwise no refil / no refund', '', '117.888', 10, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Followers: Speed 30-50k, Drop rate 0-3%. Important: Please disable flag for review before ordering otherwise no refil \\/ no refund\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(4, 1, 753, '2', '{\"min\":\"10\",\"max\":\"3000\",\"rate\":\"709.45\",\"currency\":\"INR\"}', 89, 4, '2', '1', 'Instagram Africa Followers - [ AR30 - 100% Real ]', '', '851.34', 10, 3000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Africa Followers - [ AR30 - 100% Real ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(5, 1, 754, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"425.67\",\"currency\":\"INR\"}', 89, 5, '2', '1', 'Instagram South Asia Followers (India, Pakistan, etc.) [ AR30 - 100% Real ]', '', '510.804', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram South Asia Followers (India, Pakistan, etc.) [ AR30 - 100% Real ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(6, 1, 755, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"425.67\",\"currency\":\"INR\"}', 89, 6, '2', '1', 'Instagram Asia Followers (Indonesia, Thailand, etc.) [ AR30 - 100% Real ]', '', '510.804', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Asia Followers (Indonesia, Thailand, etc.) [ AR30 - 100% Real ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(7, 1, 756, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"425.67\",\"currency\":\"INR\"}', 89, 7, '2', '1', 'Instagram Europe Followers [ AR30 - 100% Real ]', '', '510.804', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Europe Followers [ AR30 - 100% Real ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(8, 1, 757, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"425.67\",\"currency\":\"INR\"}', 89, 8, '2', '1', 'Instagram Turkey Followers [ AR30 - 100% Real ]', '', '510.804', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Turkey Followers [ AR30 - 100% Real ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(9, 1, 758, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"425.67\",\"currency\":\"INR\"}', 89, 9, '2', '1', 'Instagram Latinos Followers (Latin America and Mexico) [ AR30 - 100% Real ]', '', '510.804', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Latinos Followers (Latin America and Mexico) [ AR30 - 100% Real ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(10, 1, 759, '2', '{\"min\":\"20\",\"max\":\"10000\",\"rate\":\"312.16\",\"currency\":\"INR\"}', 89, 10, '2', '1', 'Instagram Latin America - Followers [ Max - 10k ] [ REAL HQ ] [ 30 Days AUTO Refill ] INSTANT', '', '374.592', 20, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Latin America - Followers [ Max - 10k ] [ REAL HQ ] [ 30 Days AUTO Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(11, 1, 760, '2', '{\"min\":\"20\",\"max\":\"15000\",\"rate\":\"709.45\",\"currency\":\"INR\"}', 89, 11, '2', '1', 'Instagram Followers - [ Chinese Followers ] [ 30 Days Refill ] INSTANT', '', '851.34', 20, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Followers - [ Chinese Followers ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(12, 1, 761, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"425.67\",\"currency\":\"INR\"}', 89, 12, '2', '1', 'Instagram Latin Followers - [ Max 20K ] [ Real ] [ R30 ] INSTANT', '', '510.804', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Latin Followers - [ Max 20K ] [ Real ] [ R30 ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(13, 1, 762, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"36.02\",\"currency\":\"INR\"}', 89, 13, '2', '1', 'Instagram Latin Likes - [ Max 20K ] [ Real ] [ R30 ] INSTANT', '', '43.224', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Latin Likes - [ Max 20K ] [ Real ] [ R30 ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(14, 1, 1409, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"240.30\",\"currency\":\"INR\"}', 90, 14, '2', '1', 'Premium Instagram Indian Followers  [ Max - 1M ] [ 50k/day ] [ 365 Days Refill ] INSTANT', '', '288.36', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Premium Instagram Indian Followers  [ Max - 1M ] [ 50k\\/day ] [ 365 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(15, 1, 505, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"3.36\",\"currency\":\"INR\"}', 91, 15, '2', '1', 'Working - Instagram Views + Fast [ Instant ]', '', '4.032', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Working - Instagram Views + Fast [ Instant ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(16, 1, 1417, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"4.03\",\"currency\":\"INR\"}', 91, 16, '2', '1', 'Working - Instagram Views + Fast [ Instant ] 30000 per hour', '', '4.836', 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Working - Instagram Views + Fast [ Instant ] 30000 per hour\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(17, 1, 1408, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"5.38\",\"currency\":\"INR\"}', 91, 17, '2', '1', 'Instagram Reel Views - Speed : 100000 per hour - Instant', '', '6.456', 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Reel Views - Speed : 100000 per hour - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(18, 1, 569, '2', '{\"min\":\"100\",\"max\":\"2147483647\",\"rate\":\"4.29\",\"currency\":\"INR\"}', 91, 18, '2', '1', 'Emergency Instagram Views + Reels', '', '5.148', 100, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Emergency Instagram Views + Reels\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(19, 1, 775, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"3.19\",\"currency\":\"INR\"}', 92, 19, '2', '1', 'Premium Instagram Likes [ Speed : 10000 / hour ]', '', '3.828', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Premium Instagram Likes [ Speed : 10000 \\/ hour ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(20, 1, 3, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"3.19\",\"currency\":\"INR\"}', 92, 20, '2', '1', 'Regular Instagram Likes [ Low Quality ] Speed : 20000 / hour', '', '3.828', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Regular Instagram Likes [ Low Quality ] Speed : 20000 \\/ hour\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(21, 1, 1405, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"4.29\",\"currency\":\"INR\"}', 92, 21, '2', '1', 'Instagram Likes - [ Refill Button ] [ Non Drop ] 35000 Per Hour', '', '5.148', 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Likes - [ Refill Button ] [ Non Drop ] 35000 Per Hour\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(22, 1, 560, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"43.99\",\"currency\":\"INR\"}', 92, 22, '2', '1', 'Instagram Indian Likes 🇮🇳 [ Real & Active ] Instant ( Bollywood Choice )', '', '52.788', 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Indian Likes \\ud83c\\uddee\\ud83c\\uddf3 [ Real & Active ] Instant ( Bollywood Choice )\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(23, 1, 767, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"35.20\",\"currency\":\"INR\"}', 92, 23, '2', '1', '🇮🇳 Instagram Indian Likes - [ Max -30k ] [ Super Real, Organic Add ] INSTANT', '', '42.24', 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3 Instagram Indian Likes - [ Max -30k ] [ Super Real, Organic Add ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(24, 1, 1414, '2', '{\"min\":\"10\",\"max\":\"5000000\",\"rate\":\"5.80\",\"currency\":\"INR\"}', 93, 24, '2', '1', 'Instagram Likes  - [ Max - 500k ] [ Bot, SUPERFAST ] 30000 Per Hour', '', '6.96', 10, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Likes  - [ Max - 500k ] [ Bot, SUPERFAST ] 30000 Per Hour\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(25, 1, 264, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"35.20\",\"currency\":\"INR\"}', 94, 25, '2', '1', 'Real Indian Instagram Likes [ Supreme Quality ] [ Active ] For Celebrities', '', '42.24', 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Real Indian Instagram Likes [ Supreme Quality ] [ Active ] For Celebrities\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(26, 1, 1406, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"26.40\",\"currency\":\"INR\"}', 94, 26, '2', '1', 'Instagram Bollywood Indian Likes [Instant] [Non Drop] 🇮🇳', '', '31.68', 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Bollywood Indian Likes [Instant] [Non Drop] \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(27, 1, 768, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"35.20\",\"currency\":\"INR\"}', 94, 27, '2', '1', 'Instagram Indian Likes - [ Super Real, Organic Add ] Instant', '', '42.24', 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Indian Likes - [ Super Real, Organic Add ] Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(28, 1, 1401, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"873.16\",\"currency\":\"INR\"}', 94, 28, '2', '3', 'Instagram Indian - Custom Comments [ Used By Bollywood ]', '', '1047.792', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Indian - Custom Comments [ Used By Bollywood ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(29, 1, 933, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"873.16\",\"currency\":\"INR\"}', 94, 29, '2', '3', 'Instagram Indian - Custom Comments [ Used By Bollywood ]', '', '1047.792', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Indian - Custom Comments [ Used By Bollywood ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(30, 1, 236, '2', '{\"min\":\"5\",\"max\":\"100\",\"rate\":\"149.70\",\"currency\":\"INR\"}', 95, 30, '2', '3', 'Instagram Custom Comments - [ 100% Real ] Instant', '', '179.64', 5, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Custom Comments - [ 100% Real ] Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(31, 1, 1410, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"56.67\",\"currency\":\"INR\"}', 95, 31, '2', '1', 'Instagram Real English Random Comments - Instant - Speed 1000 per day - Non Drop', '', '68.004', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Real English Random Comments - Instant - Speed 1000 per day - Non Drop\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(32, 1, 1411, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"62.97\",\"currency\":\"INR\"}', 95, 32, '2', '1', 'Instagram Random English Comments - Instant - Speed 50000 per day - Non Drop', '', '75.564', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random English Comments - Instant - Speed 50000 per day - Non Drop\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(33, 1, 710, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"71.79\",\"currency\":\"INR\"}', 95, 33, '2', '3', 'Instagram Custom Comments - Instant', '', '86.148', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Custom Comments - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(34, 1, 1407, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"68.09\",\"currency\":\"INR\"}', 95, 34, '2', '1', 'Instagram  Random Comments - Fast - Instant', '', '81.708', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram  Random Comments - Fast - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(35, 1, 1412, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"62.97\",\"currency\":\"INR\"}', 95, 35, '2', '3', 'Instagram Custom Comments - Instant - Speed 5,000 per hour - Non Drop', '', '75.564', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Custom Comments - Instant - Speed 5,000 per hour - Non Drop\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(36, 1, 743, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 36, '2', '1', 'Instagram Random Chinese Comments 🇨🇳', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Chinese Comments \\ud83c\\udde8\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(37, 1, 744, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 37, '2', '1', 'Instagram Random Turkish Comments 🇹🇷', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Turkish Comments \\ud83c\\uddf9\\ud83c\\uddf7\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(38, 1, 745, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 38, '2', '1', 'Instagram Random Arabic Comments 🇮🇶', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Arabic Comments \\ud83c\\uddee\\ud83c\\uddf6\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(39, 1, 746, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 39, '2', '1', 'Instagram Random Indian Comments 🇮🇳', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Indian Comments \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(40, 1, 747, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 40, '2', '1', 'Instagram Random Korean Comments 🇰🇷', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Korean Comments \\ud83c\\uddf0\\ud83c\\uddf7\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(41, 1, 748, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 41, '2', '1', 'Instagram Random Russian Comments 🇷🇺', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Russian Comments \\ud83c\\uddf7\\ud83c\\uddfa\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(42, 1, 749, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 42, '2', '1', 'Instagram Random Italian Comments 🇮🇹', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Italian Comments \\ud83c\\uddee\\ud83c\\uddf9\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(43, 1, 750, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 43, '2', '1', 'Instagram Random France Comments 🇫🇷', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random France Comments \\ud83c\\uddeb\\ud83c\\uddf7\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(44, 1, 751, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 44, '2', '1', 'Instagram Random Persian Comments 🇮🇷', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Persian Comments \\ud83c\\uddee\\ud83c\\uddf7\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(45, 1, 752, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"81.86\",\"currency\":\"INR\"}', 96, 45, '2', '1', 'Instagram Random English Comments 🇬🇧', '', '98.232', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random English Comments \\ud83c\\uddec\\ud83c\\udde7\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(46, 1, 797, '2', '{\"min\":\"5\",\"max\":\"500\",\"rate\":\"658.38\",\"currency\":\"INR\"}', 97, 46, '2', '1', '🇮🇳  Instagram Indian Random Comments [ 24 hours Complete Time ]', '', '790.056', 5, 500, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Instagram Indian Random Comments [ 24 hours Complete Time ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(47, 1, 799, '2', '{\"min\":\"5\",\"max\":\"500\",\"rate\":\"753.68\",\"currency\":\"INR\"}', 97, 47, '2', '1', '🇮🇳  Instagram Indian 𝐅𝐄𝐌𝐀𝐋𝐄 Random Comments - [Non-drop] [High Quality 🔥] [100% Real and active] [ 24  hours Complete Time ]', '', '904.416', 5, 500, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Instagram Indian \\ud835\\udc05\\ud835\\udc04\\ud835\\udc0c\\ud835\\udc00\\ud835\\udc0b\\ud835\\udc04 Random Comments - [Non-drop] [High Quality \\ud83d\\udd25] [100% Real and active] [ 24  hours Complete Time ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(48, 1, 800, '2', '{\"min\":\"5\",\"max\":\"500\",\"rate\":\"801.32\",\"currency\":\"INR\"}', 97, 48, '2', '3', '🇮🇳  Instagram Indian 𝐅𝐄𝐌𝐀𝐋𝐄 Custom Comments - [Non-drop] [High Quality 🔥] [100% Real and active] [ 24 - 48 hours Complete Time ]', '', '961.584', 5, 500, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Instagram Indian \\ud835\\udc05\\ud835\\udc04\\ud835\\udc0c\\ud835\\udc00\\ud835\\udc0b\\ud835\\udc04 Custom Comments - [Non-drop] [High Quality \\ud83d\\udd25] [100% Real and active] [ 24 - 48 hours Complete Time ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(49, 1, 801, '2', '{\"min\":\"5\",\"max\":\"100\",\"rate\":\"848.97\",\"currency\":\"INR\"}', 97, 49, '2', '1', '🇮🇳  Instagram 𝐈𝐍𝐃𝐈𝐀𝐍 Random message [100% Real active Accounts] [ 24 - 48 hours Complete Time ]', '', '1018.764', 5, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Instagram \\ud835\\udc08\\ud835\\udc0d\\ud835\\udc03\\ud835\\udc08\\ud835\\udc00\\ud835\\udc0d Random message [100% Real active Accounts] [ 24 - 48 hours Complete Time ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(50, 1, 802, '2', '{\"min\":\"5\",\"max\":\"100\",\"rate\":\"896.61\",\"currency\":\"INR\"}', 97, 50, '2', '3', '🇮🇳  Instagram 𝐈𝐍𝐃𝐈𝐀𝐍 Custom message [100% Real active Accounts] [ 24 - 48 hours Complete Time ]', '', '1075.932', 5, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Instagram \\ud835\\udc08\\ud835\\udc0d\\ud835\\udc03\\ud835\\udc08\\ud835\\udc00\\ud835\\udc0d Custom message [100% Real active Accounts] [ 24 - 48 hours Complete Time ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(51, 1, 803, '2', '{\"min\":\"5\",\"max\":\"100\",\"rate\":\"1000.57\",\"currency\":\"INR\"}', 97, 51, '2', '1', '🇮🇳  Instagram 𝐈𝐍𝐃𝐈𝐀𝐍 𝐅𝐄𝐌𝐀𝐋𝐄 Random message [100% Real active Accounts] [ 24 - 48 hours Complete Time ]', '', '1200.684', 5, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Instagram \\ud835\\udc08\\ud835\\udc0d\\ud835\\udc03\\ud835\\udc08\\ud835\\udc00\\ud835\\udc0d \\ud835\\udc05\\ud835\\udc04\\ud835\\udc0c\\ud835\\udc00\\ud835\\udc0b\\ud835\\udc04 Random message [100% Real active Accounts] [ 24 - 48 hours Complete Time ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(52, 1, 804, '2', '{\"min\":\"5\",\"max\":\"100\",\"rate\":\"1095.86\",\"currency\":\"INR\"}', 97, 52, '2', '3', '🇮🇳  Instagram 𝐈𝐍𝐃𝐈𝐀𝐍 𝐅𝐄𝐌𝐀𝐋𝐄 Custom message [100% Real active Accounts] [ 24 - 48 hours Complete Time ]', '', '1315.032', 5, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Instagram \\ud835\\udc08\\ud835\\udc0d\\ud835\\udc03\\ud835\\udc08\\ud835\\udc00\\ud835\\udc0d \\ud835\\udc05\\ud835\\udc04\\ud835\\udc0c\\ud835\\udc00\\ud835\\udc0b\\ud835\\udc04 Custom message [100% Real active Accounts] [ 24 - 48 hours Complete Time ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(53, 1, 469, '2', '{\"min\":\"10\",\"max\":\"3000\",\"rate\":\"61.13\",\"currency\":\"INR\"}', 98, 53, '2', '1', 'Instagram Indian Female Likes 🇮🇳 [Real] Non Drop', '', '73.356', 10, 3000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Indian Female Likes \\ud83c\\uddee\\ud83c\\uddf3 [Real] Non Drop\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(54, 1, 1402, '2', '{\"min\":\"10\",\"max\":\"1000\",\"rate\":\"493.84\",\"currency\":\"INR\"}', 98, 54, '2', '1', 'Instagram Random Comments - [ Max - 1k ] [ Mostly Female ] INSTANT', '', '592.608', 10, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Random Comments - [ Max - 1k ] [ Mostly Female ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(55, 1, 1403, '2', '{\"min\":\"1\",\"max\":\"600\",\"rate\":\"2292.04\",\"currency\":\"INR\"}', 98, 55, '2', '3', 'Instagram Custom Comments Female', '', '2750.448', 1, 600, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Custom Comments Female\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(56, 1, 911, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"55.41\",\"currency\":\"INR\"}', 99, 56, '2', '1', 'Instagram Live Viewers  [Stay 15 Minutes] [⚡Instant] [⭐Guaranteed Direct]', '', '66.492', 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 15 Minutes] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(57, 1, 912, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"101.08\",\"currency\":\"INR\"}', 99, 57, '2', '1', 'Instagram Live Viewers  [Stay 30 Minutes] [⚡Instant] [⭐Guaranteed Direct]', '', '121.296', 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 30 Minutes] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(58, 1, 913, '2', '{\"min\":\"10\",\"max\":\"30000\",\"rate\":\"202.16\",\"currency\":\"INR\"}', 99, 58, '2', '1', 'Instagram Live Viewers  [Stay 60 Minutes] [⚡Instant] [⭐Guaranteed Direct]', '', '242.592', 10, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 60 Minutes] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(59, 1, 914, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"288.02\",\"currency\":\"INR\"}', 99, 59, '2', '1', 'Instagram Live Viewers  [Stay 90 Minutes] [⚡Instant] [⭐Guaranteed Direct]', '', '345.624', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 90 Minutes] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(60, 1, 915, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"383.63\",\"currency\":\"INR\"}', 99, 60, '2', '1', 'Instagram Live Viewers  [Stay 2 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '460.356', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 2 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(61, 1, 916, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"764.93\",\"currency\":\"INR\"}', 99, 61, '2', '1', 'Instagram Live Viewers  [Stay 3 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '917.916', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 3 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(62, 1, 917, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"764.93\",\"currency\":\"INR\"}', 99, 62, '2', '1', 'Instagram Live Viewers  [Stay 4 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '917.916', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 4 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(63, 1, 918, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"1146.23\",\"currency\":\"INR\"}', 99, 63, '2', '1', 'Instagram Live Viewers  [Stay 6 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '1375.476', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 6 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(64, 1, 919, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"2290.12\",\"currency\":\"INR\"}', 99, 64, '2', '1', 'Instagram Live Viewers  [Stay 12 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '2748.144', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Live Viewers  [Stay 12 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(65, 1, 390, '2', '{\"min\":\"10\",\"max\":\"15000\",\"rate\":\"15.12\",\"currency\":\"INR\"}', 100, 65, '2', '1', 'Instagram Story Views [ Max - 10k ]	[ Always Working ] SUPER SERVICE INSTANT', '', '18.144', 10, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Views [ Max - 10k ]\\t[ Always Working ] SUPER SERVICE INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(66, 1, 921, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"17.64\",\"currency\":\"INR\"}', 100, 66, '2', '1', 'Instagram Real Story Views [Premium Quality] [All Stories] [50K/D] [Instant]', '', '21.168', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Real Story Views [Premium Quality] [All Stories] [50K\\/D] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(67, 1, 922, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"15.29\",\"currency\":\"INR\"}', 100, 67, '2', '1', 'Instagram Story Views - [ Max - 100k ] [ 100k/day ] INSTANT', '', '18.348', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Views - [ Max - 100k ] [ 100k\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(68, 1, 923, '2', '{\"min\":\"100\",\"max\":\"5000\",\"rate\":\"14.11\",\"currency\":\"INR\"}', 100, 68, '2', '1', 'Instagram Story Views - [ Max - 5k ] [ FAST ] INSTANT', '', '16.932', 100, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Views - [ Max - 5k ] [ FAST ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(69, 1, 924, '2', '{\"min\":\"10\",\"max\":\"15000\",\"rate\":\"85.81\",\"currency\":\"INR\"}', 100, 69, '2', '1', 'Instagram Story Views + Likes', '', '102.972', 10, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Views + Likes\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(70, 1, 925, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"23.51\",\"currency\":\"INR\"}', 100, 70, '2', '1', 'Instagram Story Impression All Posts [Username Only]', '', '28.212', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Impression All Posts [Username Only]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(71, 1, 926, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"423.15\",\"currency\":\"INR\"}', 100, 71, '2', '1', 'Instagram Story Vote ( Vote In first ]', '', '507.78', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Vote ( Vote In first ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(72, 1, 927, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"213.93\",\"currency\":\"INR\"}', 100, 72, '2', '1', '🇮🇳 Instagram India Story Views + Likes [ HQ ]', '', '256.716', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3 Instagram India Story Views + Likes [ HQ ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(73, 1, 928, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"423.15\",\"currency\":\"INR\"}', 100, 73, '2', '1', 'Instagram Story Vote ( Vote In Second ]', '', '507.78', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Vote ( Vote In Second ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(74, 1, 929, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"423.15\",\"currency\":\"INR\"}', 100, 74, '2', '1', 'Instagram Story Vote  ( Vote In Third ]', '', '507.78', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Vote  ( Vote In Third ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(75, 1, 930, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"423.15\",\"currency\":\"INR\"}', 100, 75, '2', '1', 'Instagram Story Vote  ( Vote In Fourth ]', '', '507.78', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Vote  ( Vote In Fourth ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(76, 1, 931, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"423.15\",\"currency\":\"INR\"}', 100, 76, '2', '1', 'Instagram Story Vote  ( Vote In Fifth ]', '', '507.78', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Story Vote  ( Vote In Fifth ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(77, 1, 932, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"9.41\",\"currency\":\"INR\"}', 100, 77, '2', '1', 'Instagram Real Saves [Premium Quality] [50K/D] [Instant]', '', '11.292', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Real Saves [Premium Quality] [50K\\/D] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(78, 1, 1485, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"4.54\",\"currency\":\"INR\"}', 101, 78, '2', '11', 'Instagram Auto Likes  - [ Max - 50k ] [ 5k/Hour ] [ Hq ]  INSTANT', '', '5.448', 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Auto Likes  - [ Max - 50k ] [ 5k\\/Hour ] [ Hq ]  INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(79, 1, 1486, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"2.52\",\"currency\":\"INR\"}', 101, 79, '2', '11', 'Instagram Auto Likes  - [ Max - 50k ] [ 5k/Hour ] [ Hq ]  INSTANT', '', '3.024', 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Auto Likes  - [ Max - 50k ] [ 5k\\/Hour ] [ Hq ]  INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(80, 1, 1487, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"11.34\",\"currency\":\"INR\"}', 101, 80, '2', '11', 'Instagram Auto Likes  - [ Max - 50k ] [ 5k/Hour ] [ Hq ]  INSTANT', '', '13.608', 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Auto Likes  - [ Max - 50k ] [ 5k\\/Hour ] [ Hq ]  INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(81, 1, 1488, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"3.78\",\"currency\":\"INR\"}', 101, 81, '2', '11', 'Instagram Auto Views - [ Superfast ]', '', '4.536', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Auto Views - [ Superfast ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(82, 1, 1489, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"49.12\",\"currency\":\"INR\"}', 101, 82, '2', '11', 'Instagram Brazil Auto Like', '', '58.944', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Brazil Auto Like\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(83, 1, 1490, '2', '{\"min\":\"10\",\"max\":\"200000\",\"rate\":\"79.34\",\"currency\":\"INR\"}', 101, 83, '2', '11', 'Instagram Auto Comments', '', '95.208', 10, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Auto Comments\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(84, 1, 1491, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"4.54\",\"currency\":\"INR\"}', 101, 84, '2', '11', 'Instagram Auto Views', '', '5.448', 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Auto Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(85, 1, 50, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"9.24\",\"currency\":\"INR\"}', 102, 85, '2', '1', 'Instagram Impressions + Reach ( Always Working )', '', '11.088', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Impressions + Reach ( Always Working )\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(86, 1, 55, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"6.72\",\"currency\":\"INR\"}', 102, 86, '2', '1', 'Instagram Impressions / Reach / Profile Visits', '', '8.064', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Impressions \\/ Reach \\/ Profile Visits\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(87, 1, 51, '2', '{\"min\":\"100\",\"max\":\"5000000\",\"rate\":\"8.06\",\"currency\":\"INR\"}', 102, 87, '2', '1', 'Instagram Impressions', '', '9.672', 100, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Impressions\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(88, 1, 52, '2', '{\"min\":\"100\",\"max\":\"5000000\",\"rate\":\"15.01\",\"currency\":\"INR\"}', 102, 88, '2', '1', 'Instagram Profile Visits', '', '18.012', 100, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Profile Visits\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(89, 1, 53, '2', '{\"min\":\"100\",\"max\":\"5000000\",\"rate\":\"34.09\",\"currency\":\"INR\"}', 102, 89, '2', '1', 'Instagram Shares', '', '40.908', 100, 5000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Shares\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(90, 1, 54, '2', '{\"min\":\"100\",\"max\":\"45000\",\"rate\":\"10.08\",\"currency\":\"INR\"}', 102, 90, '2', '1', 'Instagram Saves', '', '12.096', 100, 45000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Instagram Saves\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(91, 1, 644, '2', '{\"min\":\"10\",\"max\":\"2000\",\"rate\":\"768.58\",\"currency\":\"INR\"}', 103, 91, '2', '1', 'Whatsapp Channel Members [Real & Active] [Non Drop]', '', '922.296', 10, 2000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Whatsapp Channel Members [Real & Active] [Non Drop]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(92, 1, 716, '2', '{\"min\":\"10\",\"max\":\"2000\",\"rate\":\"606.41\",\"currency\":\"INR\"}', 103, 92, '2', '1', '🌎 Whatsapp Channel Followers | Max 2K | No Drop | Daily 1K', '', '727.692', 10, 2000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udf0e Whatsapp Channel Followers | Max 2K | No Drop | Daily 1K\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(93, 1, 717, '2', '{\"min\":\"10\",\"max\":\"1000\",\"rate\":\"634.61\",\"currency\":\"INR\"}', 103, 93, '2', '1', '🇮🇳 Whatsapp Channel Followers | Max 500 [Indian]', '', '761.532', 10, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3 Whatsapp Channel Followers | Max 500 [Indian]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(94, 1, 718, '2', '{\"min\":\"10\",\"max\":\"750\",\"rate\":\"634.61\",\"currency\":\"INR\"}', 103, 94, '2', '1', '🇦🇪 Whatsapp Channel Followers | Max 500 [Arabic]', '', '761.532', 10, 750, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udde6\\ud83c\\uddea Whatsapp Channel Followers | Max 500 [Arabic]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(95, 1, 719, '2', '{\"min\":\"10\",\"max\":\"750\",\"rate\":\"634.61\",\"currency\":\"INR\"}', 103, 95, '2', '1', '🇹🇷 Whatsapp Channel Followers | Max 500 [Turk]', '', '761.532', 10, 750, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf9\\ud83c\\uddf7 Whatsapp Channel Followers | Max 500 [Turk]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(96, 1, 720, '2', '{\"min\":\"10\",\"max\":\"750\",\"rate\":\"634.61\",\"currency\":\"INR\"}', 103, 96, '2', '1', '🇺🇸 Whatsapp Channel Followers | Max 500 [USA]', '', '761.532', 10, 750, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddf8 Whatsapp Channel Followers | Max 500 [USA]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(97, 1, 721, '2', '{\"min\":\"10\",\"max\":\"750\",\"rate\":\"634.61\",\"currency\":\"INR\"}', 103, 97, '2', '1', '🇪🇺 Whatsapp Channel Followers | Max 500 [Europe]', '', '761.532', 10, 750, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddea\\ud83c\\uddfa Whatsapp Channel Followers | Max 500 [Europe]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(98, 1, 722, '2', '{\"min\":\"10\",\"max\":\"200\",\"rate\":\"373.72\",\"currency\":\"INR\"}', 103, 98, '2', '1', 'Whatsapp Channel Emoji Reactions [ 👍❤️😂😲😥🙏] [Mixed] [Max - 200] INSTANT-1HRS', '', '448.464', 10, 200, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Whatsapp Channel Emoji Reactions [ \\ud83d\\udc4d\\u2764\\ufe0f\\ud83d\\ude02\\ud83d\\ude32\\ud83d\\ude25\\ud83d\\ude4f] [Mixed] [Max - 200] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(99, 1, 723, '2', '{\"min\":\"10\",\"max\":\"200\",\"rate\":\"373.72\",\"currency\":\"INR\"}', 103, 99, '2', '1', 'Whatsapp Channel Emoji Reactions [👍] [Max - 200] INSTANT-1HRS', '', '448.464', 10, 200, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Whatsapp Channel Emoji Reactions [\\ud83d\\udc4d] [Max - 200] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(100, 1, 724, '2', '{\"min\":\"10\",\"max\":\"200\",\"rate\":\"373.72\",\"currency\":\"INR\"}', 103, 100, '2', '1', 'Whatsapp Channel Emoji Reactions [❤️] [Max - 200] INSTANT-1HRS', '', '448.464', 10, 200, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Whatsapp Channel Emoji Reactions [\\u2764\\ufe0f] [Max - 200] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(101, 1, 725, '2', '{\"min\":\"10\",\"max\":\"200\",\"rate\":\"373.72\",\"currency\":\"INR\"}', 103, 101, '2', '1', 'Whatsapp Channel Emoji Reactions [😂] [Max - 200] INSTANT-1HRS', '', '448.464', 10, 200, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Whatsapp Channel Emoji Reactions [\\ud83d\\ude02] [Max - 200] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(102, 1, 726, '2', '{\"min\":\"10\",\"max\":\"200\",\"rate\":\"373.72\",\"currency\":\"INR\"}', 103, 102, '2', '1', 'Whatsapp Channel Emoji Reactions [😲] [Max - 200] INSTANT-1HRS', '', '448.464', 10, 200, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Whatsapp Channel Emoji Reactions [\\ud83d\\ude32] [Max - 200] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(103, 1, 727, '2', '{\"min\":\"10\",\"max\":\"200\",\"rate\":\"373.72\",\"currency\":\"INR\"}', 103, 103, '2', '1', 'Whatsapp Channel Emoji Reactions [😥] [Max - 200] INSTANT-1HRS', '', '448.464', 10, 200, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Whatsapp Channel Emoji Reactions [\\ud83d\\ude25] [Max - 200] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(104, 1, 728, '2', '{\"min\":\"10\",\"max\":\"200\",\"rate\":\"373.72\",\"currency\":\"INR\"}', 103, 104, '2', '1', 'Whatsapp Channel Emoji Reactions [🙏] [Max - 200] INSTANT-1HRS', '', '448.464', 10, 200, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Whatsapp Channel Emoji Reactions [\\ud83d\\ude4f] [Max - 200] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(105, 1, 770, '2', '{\"min\":\"1\",\"max\":\"100\",\"rate\":\"74967.36\",\"currency\":\"INR\"}', 104, 105, '2', '1', '🇮🇳  Google 𝑰𝑵𝑫𝑰𝑨 Business Reviews ➡️ [ 5 Stars Rating | Random Reviews ]', '', '89960.832', 1, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Google \\ud835\\udc70\\ud835\\udc75\\ud835\\udc6b\\ud835\\udc70\\ud835\\udc68 Business Reviews \\u27a1\\ufe0f [ 5 Stars Rating | Random Reviews ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0');
INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`, `price_profit`, `service_overflow`, `service_sync`, `service_deleted`) VALUES
(106, 1, 771, '2', '{\"min\":\"1\",\"max\":\"100\",\"rate\":\"74561.72\",\"currency\":\"INR\"}', 104, 106, '2', '3', '🇮🇳  Google 𝑰𝑵𝑫𝑰𝑨 Business Reviews ➡️ [ 5 Stars Rating | Custom Reviews ]', '', '89474.064', 1, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3  Google \\ud835\\udc70\\ud835\\udc75\\ud835\\udc6b\\ud835\\udc70\\ud835\\udc68 Business Reviews \\u27a1\\ufe0f [ 5 Stars Rating | Custom Reviews ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(107, 1, 1343, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"90.68\",\"currency\":\"INR\"}', 105, 107, '2', '1', 'Threads Followers - [ Max - 10k ] [ Real, Less Drops ] INSTANT', '', '108.816', 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Followers - [ Max - 10k ] [ Real, Less Drops ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(108, 1, 1344, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"180.09\",\"currency\":\"INR\"}', 105, 108, '2', '1', 'Threads Followers - [ Max - 10k ] [ Brazil [ 10k/day ] [ No Refill ] INSTANT', '', '216.108', 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Followers - [ Max - 10k ] [ Brazil [ 10k\\/day ] [ No Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(109, 1, 1345, '2', '{\"min\":\"20\",\"max\":\"5000\",\"rate\":\"409.30\",\"currency\":\"INR\"}', 105, 109, '2', '1', 'Threads Likes - [ Max - 5k ] [ Brazil ] [ 500-5k/day ] [ No Refill ] INSTANT', '', '491.16', 20, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Likes - [ Max - 5k ] [ Brazil ] [ 500-5k\\/day ] [ No Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(110, 1, 1346, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"196.47\",\"currency\":\"INR\"}', 105, 110, '2', '1', 'Threads Likes - [ Max - 100k ] [ WorldWide ] [ 30 Days Refl ] [ 10-30K/day ] INSTANT', '', '235.764', 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Likes - [ Max - 100k ] [ WorldWide ] [ 30 Days Refl ] [ 10-30K\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(111, 1, 1347, '2', '{\"min\":\"5\",\"max\":\"20000\",\"rate\":\"1661.10\",\"currency\":\"INR\"}', 105, 111, '2', '1', 'Threads Followers - [ Max - 20k ] [ Real ] [ No Refill ] [ 200-1k/day ] INSTANT', '', '1993.32', 5, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Followers - [ Max - 20k ] [ Real ] [ No Refill ] [ 200-1k\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(112, 1, 1348, '2', '{\"min\":\"5\",\"max\":\"20000\",\"rate\":\"778.29\",\"currency\":\"INR\"}', 105, 112, '2', '1', 'Threads Likes - [ 100-500/day ] [ REAL, No Refill ] 0-12 HRS', '', '933.948', 5, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Likes - [ 100-500\\/day ] [ REAL, No Refill ] 0-12 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(113, 1, 1349, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"75.57\",\"currency\":\"INR\"}', 105, 113, '2', '1', 'Threads Followers - [ 10k-20k/day ] [ Less Drop, No Refill ] 0-12 HRS', '', '90.684', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Followers - [ 10k-20k\\/day ] [ Less Drop, No Refill ] 0-12 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(114, 1, 1350, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"338.77\",\"currency\":\"INR\"}', 105, 114, '2', '1', 'Threads Likes - [ 10k-20k/day ] [ 30 Days Refill ] 0-1 HRS', '', '406.524', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Likes - [ 10k-20k\\/day ] [ 30 Days Refill ] 0-1 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(115, 1, 1351, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"532.72\",\"currency\":\"INR\"}', 105, 115, '2', '1', 'Threads Reshare [ 30 Days Refill ]', '', '639.264', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Reshare [ 30 Days Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(116, 1, 1352, '2', '{\"min\":\"50\",\"max\":\"50000\",\"rate\":\"355.15\",\"currency\":\"INR\"}', 105, 116, '2', '1', 'Threads Followers - [ Max - 50k] [ 10k-30k/day ] [ 30 Days Refill ] 0-1HRS', '', '426.18', 50, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Followers - [ Max - 50k] [ 10k-30k\\/day ] [ 30 Days Refill ] 0-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(117, 1, 1353, '2', '{\"min\":\"5\",\"max\":\"5000\",\"rate\":\"6604.10\",\"currency\":\"INR\"}', 105, 117, '2', '1', 'Threads Random Comments', '', '7924.92', 5, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Random Comments\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(118, 1, 1354, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"166.24\",\"currency\":\"INR\"}', 105, 118, '2', '1', 'Threads Followers | %100 Organic (Turkish)', '', '199.488', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Followers | %100 Organic (Turkish)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(119, 1, 1356, '2', '{\"min\":\"50\",\"max\":\"20000\",\"rate\":\"232.99\",\"currency\":\"INR\"}', 105, 119, '2', '1', 'Threads Likes', '', '279.588', 50, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Likes\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(120, 1, 1358, '2', '{\"min\":\"1\",\"max\":\"100\",\"rate\":\"1833.64\",\"currency\":\"INR\"}', 105, 120, '2', '1', 'Threads Random Positive Comments - [ Brazil ] [ 100/day ] INSTANT-1HRS', '', '2200.368', 1, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Random Positive Comments - [ Brazil ] [ 100\\/day ] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(121, 1, 1359, '2', '{\"min\":\"1\",\"max\":\"100\",\"rate\":\"2201.37\",\"currency\":\"INR\"}', 105, 121, '2', '3', 'Threads Custom Positive Comments - [ Brazil ] [ 100/day ] INSTANT-1HRS', '', '2641.644', 1, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Threads Custom Positive Comments - [ Brazil ] [ 100\\/day ] INSTANT-1HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(122, 1, 570, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"171.99\",\"currency\":\"INR\"}', 106, 122, '2', '1', 'Bollywood YouTube Views | Lifetime Guarantee 🔥Used By Bollywood', '', '206.388', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Bollywood YouTube Views | Lifetime Guarantee \\ud83d\\udd25Used By Bollywood\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(123, 1, 838, '2', '{\"min\":\"100\",\"max\":\"300000\",\"rate\":\"236.77\",\"currency\":\"INR\"}', 106, 123, '2', '1', 'YouTube Video Views - Speed : 30,000 Per Day - Lifetime Guaranteed - Instant', '', '284.124', 100, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Video Views - Speed : 30,000 Per Day - Lifetime Guaranteed - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(124, 1, 839, '2', '{\"min\":\"10000\",\"max\":\"3000000\",\"rate\":\"195.21\",\"currency\":\"INR\"}', 106, 124, '2', '1', 'Youtube Views -  [ Search Ranking ] - No Drop - Speed : 2,00,000 Per Day - Lifetime Guaranteed 0-24 hrs', '', '234.252', 10000, 3000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Views -  [ Search Ranking ] - No Drop - Speed : 2,00,000 Per Day - Lifetime Guaranteed 0-24 hrs\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(125, 1, 840, '2', '{\"min\":\"1000\",\"max\":\"1000000000\",\"rate\":\"180.09\",\"currency\":\"INR\"}', 106, 125, '2', '1', 'Youtube Views - [ NATIVE ADS ] [ Min - 1k ] [Speed : 5,000 Per Day - Lifetime Guaranteed - Instant] [ Start In 1-12hrs ]', '', '216.108', 1000, 1000000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Views - [ NATIVE ADS ] [ Min - 1k ] [Speed : 5,000 Per Day - Lifetime Guaranteed - Instant] [ Start In 1-12hrs ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(126, 1, 841, '2', '{\"min\":\"30000\",\"max\":\"1000000000\",\"rate\":\"125.94\",\"currency\":\"INR\"}', 106, 126, '2', '1', 'Premium Youtube Views - Speed : 2,000,000 Per Day - Lifetime Guaranteed [ Used By Bollywood ]', '', '151.128', 30000, 1000000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Premium Youtube Views - Speed : 2,000,000 Per Day - Lifetime Guaranteed [ Used By Bollywood ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(127, 1, 647, '2', '{\"min\":\"10000\",\"max\":\"2000000\",\"rate\":\"137.15\",\"currency\":\"INR\"}', 107, 127, '2', '1', 'YouTube Music Video Views - Speed : 2,00,000 Per Day', '', '164.58', 10000, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Music Video Views - Speed : 2,00,000 Per Day\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(128, 1, 648, '2', '{\"min\":\"10000\",\"max\":\"2000000\",\"rate\":\"146.30\",\"currency\":\"INR\"}', 107, 128, '2', '1', 'YouTube Music Video Views - Speed : 5,00,000 Per Day', '', '175.56', 10000, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Music Video Views - Speed : 5,00,000 Per Day\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(129, 1, 649, '2', '{\"min\":\"10000\",\"max\":\"2000000\",\"rate\":\"155.44\",\"currency\":\"INR\"}', 107, 129, '2', '1', 'YouTube Music Video Views - Speed : 1,000,000 Per Day', '', '186.528', 10000, 2000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Music Video Views - Speed : 1,000,000 Per Day\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(130, 1, 842, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"170.02\",\"currency\":\"INR\"}', 108, 130, '2', '1', 'YouTube - Views [Retention 20 sec]', '', '204.024', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 20 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(131, 1, 843, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"181.35\",\"currency\":\"INR\"}', 108, 131, '2', '1', 'YouTube - Views [Retention 25 sec]', '', '217.62', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 25 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(132, 1, 844, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"192.69\",\"currency\":\"INR\"}', 108, 132, '2', '1', 'YouTube - Views [Retention 30 sec]', '', '231.228', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 30 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(133, 1, 845, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"205.28\",\"currency\":\"INR\"}', 108, 133, '2', '1', 'YouTube - Views [Retention 35 sec]', '', '246.336', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 35 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(134, 1, 846, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"219.13\",\"currency\":\"INR\"}', 108, 134, '2', '1', 'YouTube - Views [Retention 40 sec]', '', '262.956', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 40 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(135, 1, 847, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"232.99\",\"currency\":\"INR\"}', 108, 135, '2', '1', 'YouTube - Views [Retention 50 sec]', '', '279.588', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 50 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(136, 1, 848, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"255.66\",\"currency\":\"INR\"}', 108, 136, '2', '1', 'YouTube - Views [Retention 60 sec]', '', '306.792', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 60 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(137, 1, 849, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"318.62\",\"currency\":\"INR\"}', 108, 137, '2', '1', 'YouTube - Views [Retention 90 sec]', '', '382.344', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 90 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(138, 1, 850, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"381.59\",\"currency\":\"INR\"}', 108, 138, '2', '1', 'YouTube - Views [Retention 120 sec]', '', '457.908', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 120 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(139, 1, 851, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"531.46\",\"currency\":\"INR\"}', 108, 139, '2', '1', 'YouTube - Views [Retention 180 sec]', '', '637.752', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 180 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(140, 1, 852, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"701.47\",\"currency\":\"INR\"}', 108, 140, '2', '1', 'YouTube - Views [Retention 240 sec]', '', '841.764', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 240 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(141, 1, 853, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"871.48\",\"currency\":\"INR\"}', 108, 141, '2', '1', 'YouTube - Views [Retention 300 sec]', '', '1045.776', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 300 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(142, 1, 854, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"1125.87\",\"currency\":\"INR\"}', 108, 142, '2', '1', 'YouTube - Views [Retention 499 sec]', '', '1351.044', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 499 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(143, 1, 855, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"1769.41\",\"currency\":\"INR\"}', 108, 143, '2', '1', 'YouTube - Views [Retention 999 sec]', '', '2123.292', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 999 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(144, 1, 856, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"1969.65\",\"currency\":\"INR\"}', 108, 144, '2', '1', 'YouTube - Views [Retention 1999 sec]', '', '2363.58', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube - Views [Retention 1999 sec]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(145, 1, 861, '2', '{\"min\":\"10000\",\"max\":\"60000\",\"rate\":\"122.16\",\"currency\":\"INR\"}', 109, 145, '2', '1', 'Youtube AdWords Views - [ Min - 10k ] [ Speed - 10-50k/day ] [ Life Time Guaranteed ] 24-72 HRS', '', '146.592', 10000, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube AdWords Views - [ Min - 10k ] [ Speed - 10-50k\\/day ] [ Life Time Guaranteed ] 24-72 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(146, 1, 862, '2', '{\"min\":\"100000\",\"max\":\"2147483647\",\"rate\":\"90.63\",\"currency\":\"INR\"}', 109, 146, '2', '1', 'Youtube AdWords Views - [ Min - 100k ] [ Speed - 500k-2m/day ] [ Life Time Guaranteed ] 24-48 HRS', '', '108.756', 100000, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube AdWords Views - [ Min - 100k ] [ Speed - 500k-2m\\/day ] [ Life Time Guaranteed ] 24-48 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(147, 1, 863, '2', '{\"min\":\"500000\",\"max\":\"10000000\",\"rate\":\"75.59\",\"currency\":\"INR\"}', 109, 147, '2', '1', 'Youtube AdWords Views - [ Min - 500k ] [ Speed - 200k-500k/day ] [ Life Time Guaranteed ] 24-48 HRS', '', '90.708', 500000, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube AdWords Views - [ Min - 500k ] [ Speed - 200k-500k\\/day ] [ Life Time Guaranteed ] 24-48 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(148, 1, 864, '2', '{\"min\":\"1000000\",\"max\":\"10000000\",\"rate\":\"70.55\",\"currency\":\"INR\"}', 109, 148, '2', '1', 'Youtube AdWords Views - [ Min - 1M ] [ Speed - 500k-2m/day ] [ Life Time Guaranteed ] 24-48 HRS', '', '84.66', 1000000, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube AdWords Views - [ Min - 1M ] [ Speed - 500k-2m\\/day ] [ Life Time Guaranteed ] 24-48 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(149, 1, 218, '2', '{\"min\":\"1000\",\"max\":\"200000\",\"rate\":\"47.23\",\"currency\":\"INR\"}', 110, 149, '2', '1', 'Youtube Live Stream Views - INSTANT', '', '56.676', 1000, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Live Stream Views - INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(150, 1, 887, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"42.32\",\"currency\":\"INR\"}', 111, 150, '2', '1', 'YouTube Live Stream Views S5 - [ 15 Mins Live Watching ] INSTANT', '', '50.784', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 15 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(151, 1, 888, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"84.63\",\"currency\":\"INR\"}', 111, 151, '2', '1', 'YouTube Live Stream Views S5 - [ 30 Mins Live Watching ] INSTANT', '', '101.556', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 30 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(152, 1, 889, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"169.26\",\"currency\":\"INR\"}', 111, 152, '2', '1', 'YouTube Live Stream Views S5 - [ 60 Mins Live Watching ] INSTANT', '', '203.112', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 60 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(153, 1, 890, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"253.89\",\"currency\":\"INR\"}', 111, 153, '2', '1', 'YouTube Live Stream Views S5 - [ 90 Mins Live Watching ] INSTANT', '', '304.668', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 90 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(154, 1, 891, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"338.52\",\"currency\":\"INR\"}', 111, 154, '2', '1', 'YouTube Live Stream Views S5 - [ 120 Mins Live Watching ] INSTANT', '', '406.224', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 120 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(155, 1, 892, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"423.15\",\"currency\":\"INR\"}', 111, 155, '2', '1', 'YouTube Live Stream Views S5 - [ 150 Mins Live Watching ] INSTANT', '', '507.78', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 150 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(156, 1, 893, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"1015.55\",\"currency\":\"INR\"}', 111, 156, '2', '1', 'YouTube Live Stream Views S5 - [ 360 Mins Live Watching ] INSTANT', '', '1218.66', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 360 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(157, 1, 894, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"1551.54\",\"currency\":\"INR\"}', 111, 157, '2', '1', 'YouTube Live Stream Views S5 - [ 720 Mins Live Watching ] INSTANT', '', '1861.848', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 720 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(158, 1, 895, '2', '{\"min\":\"50\",\"max\":\"500000\",\"rate\":\"3103.07\",\"currency\":\"INR\"}', 111, 158, '2', '1', 'YouTube Live Stream Views S5 - [ 1440 Mins Live Watching ] INSTANT', '', '3723.684', 50, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Live Stream Views S5 - [ 1440 Mins Live Watching ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(159, 1, 896, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"20.15\",\"currency\":\"INR\"}', 112, 159, '2', '1', 'Youtube Livestream Views [15 Minutes]', '', '24.18', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [15 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(160, 1, 897, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"49.12\",\"currency\":\"INR\"}', 112, 160, '2', '1', 'Youtube Livestream Views [30 Minutes]', '', '58.944', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [30 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(161, 1, 898, '2', '{\"min\":\"100\",\"max\":\"750000\",\"rate\":\"45.37\",\"currency\":\"INR\"}', 112, 161, '2', '1', 'Youtube Livestream Views [60 Minutes]', '', '54.444', 100, 750000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [60 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(162, 1, 899, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"158.68\",\"currency\":\"INR\"}', 112, 162, '2', '1', 'Youtube Livestream Views [90 Minutes]', '', '190.416', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [90 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(163, 1, 900, '2', '{\"min\":\"100\",\"max\":\"750000\",\"rate\":\"84.68\",\"currency\":\"INR\"}', 112, 163, '2', '1', 'Youtube Livestream Views [120 Minutes]', '', '101.616', 100, 750000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [120 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(164, 1, 901, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"266.82\",\"currency\":\"INR\"}', 112, 164, '2', '1', 'Youtube Livestream Views [150 Minutes]', '', '320.184', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [150 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(165, 1, 902, '2', '{\"min\":\"100\",\"max\":\"750000\",\"rate\":\"155.24\",\"currency\":\"INR\"}', 112, 165, '2', '1', 'Youtube Livestream Views [180 Minutes]', '', '186.288', 100, 750000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [180 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(166, 1, 903, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"533.64\",\"currency\":\"INR\"}', 112, 166, '2', '1', 'Youtube Livestream Views [360 Minutes]', '', '640.368', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [360 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(167, 1, 904, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"1067.27\",\"currency\":\"INR\"}', 112, 167, '2', '1', 'Youtube Livestream Views [720 Minutes]', '', '1280.724', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [720 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(168, 1, 905, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"3258.23\",\"currency\":\"INR\"}', 112, 168, '2', '1', 'Youtube Livestream Views [1440 Minutes]', '', '3909.876', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Livestream Views [1440 Minutes]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(169, 1, 48, '2', '{\"min\":\"50\",\"max\":\"50000\",\"rate\":\"411.55\",\"currency\":\"INR\"}', 113, 169, '2', '1', 'Regular Youtube Subscribers [500 Per Day]', '', '493.86', 50, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Regular Youtube Subscribers [500 Per Day]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(170, 1, 75, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"468.11\",\"currency\":\"INR\"}', 113, 170, '2', '1', 'Youtube Best Subscribers - [ 100-200/day ] [ Own Service ] [ 30 Days Guaranteed ] INSTANT', '', '561.732', 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Best Subscribers - [ 100-200\\/day ] [ Own Service ] [ 30 Days Guaranteed ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(171, 1, 865, '2', '{\"min\":\"20\",\"max\":\"30000\",\"rate\":\"317.24\",\"currency\":\"INR\"}', 113, 171, '2', '1', '♛ YouTube subscribers - [ Max - 50k ] [ ⚡Current speed : 50/day ] [ 30 Days Refill ] INSTANT', '', '380.688', 20, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u265b YouTube subscribers - [ Max - 50k ] [ \\u26a1Current speed : 50\\/day ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(172, 1, 866, '2', '{\"min\":\"200\",\"max\":\"50000\",\"rate\":\"493.17\",\"currency\":\"INR\"}', 113, 172, '2', '1', '♛ YouTube subscribers - [ Max - 50k ] [ ⚡Current speed : 500-1000/day ] [ 30 Days Refill ] INSTANT', '', '591.804', 200, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u265b YouTube subscribers - [ Max - 50k ] [ \\u26a1Current speed : 500-1000\\/day ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(173, 1, 867, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"293.86\",\"currency\":\"INR\"}', 113, 173, '2', '1', 'Youtube Subscribers - [ Max - 100k ] [ 100-200/day ] [ Non Drop, 60 Days Refill ] INSTANT', '', '352.632', 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Subscribers - [ Max - 100k ] [ 100-200\\/day ] [ Non Drop, 60 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(174, 1, 868, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"1163.66\",\"currency\":\"INR\"}', 113, 174, '2', '1', '♛ Youtube Subscribers - [ Max - 250k ] [ The Best Service In World ] [ 3k/day ] [ 90 Days Refill ] INSTANT', '', '1396.392', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u265b Youtube Subscribers - [ Max - 250k ] [ The Best Service In World ] [ 3k\\/day ] [ 90 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(175, 1, 869, '2', '{\"min\":\"500\",\"max\":\"50000\",\"rate\":\"584.23\",\"currency\":\"INR\"}', 113, 175, '2', '1', 'Youtube Subscribers [ Refill: 365Days]  [ Start Time: 30-60 Min ] [ Speed: 3-4K/D ]', '', '701.076', 500, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Subscribers [ Refill: 365Days]  [ Start Time: 30-60 Min ] [ Speed: 3-4K\\/D ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(176, 1, 870, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"990.87\",\"currency\":\"INR\"}', 113, 176, '2', '1', 'YouTube Subscribers - [ Max - 100k ]  [ 2k-4k/day ] [ 30 Days Refill ] 0-24 HRS', '', '1189.044', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Subscribers - [ Max - 100k ]  [ 2k-4k\\/day ] [ 30 Days Refill ] 0-24 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(177, 1, 776, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"1347.52\",\"currency\":\"INR\"}', 114, 177, '2', '1', 'Youtube Watchtime - [ No Drop ] [ Lifetime Guaranteed ] [ 15 Minutes+ Video ]  [ 500-1000 Hour/day ] INSTANT', '', '1617.024', 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Watchtime - [ No Drop ] [ Lifetime Guaranteed ] [ 15 Minutes+ Video ]  [ 500-1000 Hour\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(178, 1, 777, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"2425.54\",\"currency\":\"INR\"}', 114, 178, '2', '1', 'Youtube Watchtime - [ No Drop ] [ Lifetime Guaranteed ] [ 30 Minutes+ Video ] [ 500-1000 Hour/day ] INSTANT', '', '2910.648', 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Watchtime - [ No Drop ] [ Lifetime Guaranteed ] [ 30 Minutes+ Video ] [ 500-1000 Hour\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(179, 1, 778, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"3502.29\",\"currency\":\"INR\"}', 114, 179, '2', '1', 'Youtube Watchtime - [ No Drop ] [ Lifetime Guaranteed ] [ 60 Minutes+ Video ] [ 500-1000 Hour/day ] INSTANT', '', '4202.748', 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Watchtime - [ No Drop ] [ Lifetime Guaranteed ] [ 60 Minutes+ Video ] [ 500-1000 Hour\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(180, 1, 550, '2', '{\"min\":\"100\",\"max\":\"4000\",\"rate\":\"3524.02\",\"currency\":\"INR\"}', 114, 180, '2', '1', '💎⭐ Youtube Watch Time - S1 [ Premium Quality ] [ Upto 60 mints Retention ] [ 100-200 Hrs/daily ] [ 30 Days Refill ] INSTANT', '', '4228.824', 100, 4000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83d\\udc8e\\u2b50 Youtube Watch Time - S1 [ Premium Quality ] [ Upto 60 mints Retention ] [ 100-200 Hrs\\/daily ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(181, 1, 871, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"72.88\",\"currency\":\"INR\"}', 115, 181, '2', '1', '♛ Youtube Likes - [ 50-100k/day ] [ Non Drop, 30 Days Refill ] INSTANT', '', '87.456', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u265b Youtube Likes - [ 50-100k\\/day ] [ Non Drop, 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(182, 1, 872, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"43.49\",\"currency\":\"INR\"}', 115, 182, '2', '1', '♛ Youtube Likes - [ 5k/hour ] [ Non Drop, 30 Days Refill ] INSTANT', '', '52.188', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u265b Youtube Likes - [ 5k\\/hour ] [ Non Drop, 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(183, 1, 873, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"83.46\",\"currency\":\"INR\"}', 115, 183, '2', '1', 'Youtube Likes - S1 ( Exclusive ) [ Max - 100k ] [ ⚡Current speed : 20-30k/day ] ] [ 30 Days Refill ] INSTANT', '', '100.152', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Likes - S1 ( Exclusive ) [ Max - 100k ] [ \\u26a1Current speed : 20-30k\\/day ] ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(184, 1, 874, '2', '{\"min\":\"20\",\"max\":\"100000\",\"rate\":\"76.41\",\"currency\":\"INR\"}', 115, 184, '2', '1', 'Youtube Likes - S1 ( Exclusive ) [ Max - 100k ] [ Fastest In World #1 ] [ No Refill ] INSTANT', '', '91.692', 20, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Likes - S1 ( Exclusive ) [ Max - 100k ] [ Fastest In World #1 ] [ No Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(185, 1, 875, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"79.93\",\"currency\":\"INR\"}', 115, 185, '2', '1', 'Youtube Likes - S1 ( Exclusive ) [ Max - 100k ] [ Fastest In World #1 ] [ 30 Days Refill ] INSTANT', '', '95.916', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Likes - S1 ( Exclusive ) [ Max - 100k ] [ Fastest In World #1 ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(186, 1, 876, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"96.39\",\"currency\":\"INR\"}', 115, 186, '2', '1', 'Youtube Likes - [ Max - 100k ] [ 100k/day ] [ No Drop, 30 Days Refill ] INSTANT', '', '115.668', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Likes - [ Max - 100k ] [ 100k\\/day ] [ No Drop, 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(187, 1, 877, '2', '{\"min\":\"50\",\"max\":\"15000\",\"rate\":\"18.81\",\"currency\":\"INR\"}', 115, 187, '2', '1', 'Youtube Likes - [ Max - 10k ] [ Fast ] [ 30 Days Refill ] INSTANT', '', '22.572', 50, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Likes - [ Max - 10k ] [ Fast ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(188, 1, 878, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"17.64\",\"currency\":\"INR\"}', 115, 188, '2', '1', 'Youtube Likes - [ Max - 10k ] [ No Refill ] INSTANT', '', '21.168', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Likes - [ Max - 10k ] [ No Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(189, 1, 879, '2', '{\"min\":\"10\",\"max\":\"400000\",\"rate\":\"106.97\",\"currency\":\"INR\"}', 115, 189, '2', '1', 'YouTube Likes - [ Max - 50k ] [ 30 Days Refill ] [ 25k/day ] INSTANT', '', '128.364', 10, 400000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Likes - [ Max - 50k ] [ 30 Days Refill ] [ 25k\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(190, 1, 880, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"196.30\",\"currency\":\"INR\"}', 115, 190, '2', '1', 'Youtube Community Post Likes - [ High Quality ]', '', '235.56', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Community Post Likes - [ High Quality ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(191, 1, 881, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"103.44\",\"currency\":\"INR\"}', 115, 191, '2', '1', 'Youtube Comment Likes - [ Max - 100k ] [ UPVOTES ] [ 30 Days Refill ] INSTANT', '', '124.128', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Comment Likes - [ Max - 100k ] [ UPVOTES ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(192, 1, 1558, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"42.81\",\"currency\":\"INR\"}', 115, 192, '2', '1', 'Youtube Likes - [ 50k/day ] [ Non Drop, 30 Days Refill ] INSTANT', '', '51.372', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Likes - [ 50k\\/day ] [ Non Drop, 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(193, 1, 1561, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"52.92\",\"currency\":\"INR\"}', 115, 193, '2', '1', 'YouTube Likes Fast No Drop R30', '', '63.504', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"YouTube Likes Fast No Drop R30\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(194, 1, 857, '2', '{\"min\":\"1000\",\"max\":\"15000\",\"rate\":\"2357.53\",\"currency\":\"INR\"}', 116, 194, '2', '1', 'Youtube Performence + Ads click ', '', '2829.036', 1000, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Performence + Ads click\\u00a0\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(195, 1, 858, '2', '{\"min\":\"100\",\"max\":\"15000\",\"rate\":\"2488.50\",\"currency\":\"INR\"}', 116, 195, '2', '1', 'Youtube Views + Likes + Ads Click', '', '2986.2', 100, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Views + Likes + Ads Click\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(196, 1, 860, '2', '{\"min\":\"100\",\"max\":\"15000\",\"rate\":\"3667.27\",\"currency\":\"INR\"}', 116, 196, '2', '1', 'Youtube Views 100%, likes 30%, Subscribers 10% + ads clicks ', '', '4400.724', 100, 15000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Views 100%, likes 30%, Subscribers 10% + ads clicks\\u00a0\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(197, 1, 1493, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"94.02\",\"currency\":\"INR\"}', 117, 197, '2', '3', 'Youtube Custom Comment - [ Max 20K ] [ 30 Day Refill ]', '', '112.824', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Custom Comment - [ Max 20K ] [ 30 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(198, 1, 1494, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"110.31\",\"currency\":\"INR\"}', 117, 198, '2', '3', 'Youtube Custom Comment - [ Max 10K ] [ Non Drop ]', '', '132.372', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Custom Comment - [ Max 10K ] [ Non Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(199, 1, 882, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"189.25\",\"currency\":\"INR\"}', 117, 199, '2', '3', 'Youtube Custom Comments', '', '227.1', 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Custom Comments\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(200, 1, 883, '2', '{\"min\":\"5\",\"max\":\"5000\",\"rate\":\"564.20\",\"currency\":\"INR\"}', 117, 200, '2', '3', 'Youtube Comments [ Fastest ] [ Instant ]', '', '677.04', 5, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Comments [ Fastest ] [ Instant ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(201, 1, 884, '2', '{\"min\":\"5\",\"max\":\"10000\",\"rate\":\"548.92\",\"currency\":\"INR\"}', 117, 201, '2', '3', 'Youtube Comments - [ Real ] [ 30 Days Refill ] [ 1k/day ] INSTANT', '', '658.704', 5, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Comments - [ Real ] [ 30 Days Refill ] [ 1k\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(202, 1, 885, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"789.88\",\"currency\":\"INR\"}', 117, 202, '2', '3', 'Yotube Comments - [ Real ] [ 30 Days Refill ] [ 2-4k.day ] INSTANT', '', '947.856', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Yotube Comments - [ Real ] [ 30 Days Refill ] [ 2-4k.day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(203, 1, 886, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"228.03\",\"currency\":\"INR\"}', 117, 203, '2', '1', 'Youtube Random Emoji Comments [ Max - 10k ] 0-6 HRS', '', '273.636', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Random Emoji Comments [ Max - 10k ] 0-6 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(204, 1, 1560, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"132.28\",\"currency\":\"INR\"}', 117, 204, '2', '3', 'Youtube Custom Comment - [ Max 100K ] [ Non Drop ]', '', '158.736', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Youtube Custom Comment - [ Max 100K ] [ Non Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(205, 1, 80, '2', '{\"min\":\"500\",\"max\":\"100000000\",\"rate\":\"80.60\",\"currency\":\"INR\"}', 118, 205, '2', '1', 'Facebook Video Views [ Used By Bollywood ] Speed: 20,000-50,000 per day [ Instant ]', '', '96.72', 500, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Video Views [ Used By Bollywood ] Speed: 20,000-50,000 per day [ Instant ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(206, 1, 612, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"49.03\",\"currency\":\"INR\"}', 119, 206, '2', '1', 'Facebook LiveStream Views | 15Min', '', '58.836', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 15Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(207, 1, 613, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"98.06\",\"currency\":\"INR\"}', 119, 207, '2', '1', 'Facebook LiveStream Views | 30Min', '', '117.672', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 30Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(208, 1, 615, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"196.15\",\"currency\":\"INR\"}', 119, 208, '2', '1', 'Facebook LiveStream Views | 60Min', '', '235.38', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 60Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(209, 1, 616, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"294.22\",\"currency\":\"INR\"}', 119, 209, '2', '1', 'Facebook LiveStream Views | 90Min', '', '353.064', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 90Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(210, 1, 617, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"392.29\",\"currency\":\"INR\"}', 119, 210, '2', '1', 'Facebook LiveStream Views | 120Min', '', '470.748', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 120Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(211, 1, 618, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"490.37\",\"currency\":\"INR\"}', 119, 211, '2', '1', 'Facebook LiveStream Views | 150 Min', '', '588.444', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 150 Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0');
INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`, `price_profit`, `service_overflow`, `service_sync`, `service_deleted`) VALUES
(212, 1, 619, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"588.44\",\"currency\":\"INR\"}', 119, 212, '2', '1', 'Facebook LiveStream Views | 180Min', '', '706.128', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 180Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(213, 1, 620, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"686.51\",\"currency\":\"INR\"}', 119, 213, '2', '1', 'Facebook LiveStream Views | 210Min', '', '823.812', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 210Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(214, 1, 621, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"784.58\",\"currency\":\"INR\"}', 119, 214, '2', '1', 'Facebook LiveStream Views | 240Min', '', '941.496', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 240Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(215, 1, 622, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"882.65\",\"currency\":\"INR\"}', 119, 215, '2', '1', 'Facebook LiveStream Views | 270 Min', '', '1059.18', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 270 Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(216, 1, 623, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"980.73\",\"currency\":\"INR\"}', 119, 216, '2', '1', 'Facebook LiveStream Views | 300Min', '', '1176.876', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook LiveStream Views | 300Min\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(217, 1, 934, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"204.02\",\"currency\":\"INR\"}', 120, 217, '2', '1', 'Facebook Page Like and Follows [Emergency Fast Server] [High Quality] [30 Days] [𝑭𝒂𝒔𝒕𝒆𝒔𝒕]', '', '244.824', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Page Like and Follows [Emergency Fast Server] [High Quality] [30 Days] [\\ud835\\udc6d\\ud835\\udc82\\ud835\\udc94\\ud835\\udc95\\ud835\\udc86\\ud835\\udc94\\ud835\\udc95]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(218, 1, 935, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"123.35\",\"currency\":\"INR\"}', 120, 218, '2', '1', 'Facebook Follows [ All type Works ] [ 30 days ] [ 20k Day ] [ 𝐆𝐨𝐨𝐝 𝐐𝐮𝐚𝐥𝐢𝐭𝐲 ]', '', '148.02', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Follows [ All type Works ] [ 30 days ] [ 20k Day ] [ \\ud835\\udc06\\ud835\\udc28\\ud835\\udc28\\ud835\\udc1d \\ud835\\udc10\\ud835\\udc2e\\ud835\\udc1a\\ud835\\udc25\\ud835\\udc22\\ud835\\udc2d\\ud835\\udc32 ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(219, 1, 937, '2', '{\"min\":\"50\",\"max\":\"100\",\"rate\":\"183.37\",\"currency\":\"INR\"}', 121, 219, '2', '1', 'Facebook Super Instant Real Hearts/Love (Refill 30 Days)', '', '220.044', 50, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Super Instant Real Hearts\\/Love (Refill 30 Days)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(220, 1, 938, '2', '{\"min\":\"50\",\"max\":\"100\",\"rate\":\"183.37\",\"currency\":\"INR\"}', 121, 220, '2', '1', 'Facebook Super Instant Real Angry React (Refill 30 Days)', '', '220.044', 50, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Super Instant Real Angry React (Refill 30 Days)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(221, 1, 939, '2', '{\"min\":\"50\",\"max\":\"100\",\"rate\":\"183.37\",\"currency\":\"INR\"}', 121, 221, '2', '1', 'Facebook Super Instant Real Haha React (Refill 30 Days)', '', '220.044', 50, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Super Instant Real Haha React (Refill 30 Days)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(222, 1, 940, '2', '{\"min\":\"50\",\"max\":\"100\",\"rate\":\"183.37\",\"currency\":\"INR\"}', 121, 222, '2', '1', 'Facebook Super Instant Real WoW React (Refill 30 Days)', '', '220.044', 50, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Super Instant Real WoW React (Refill 30 Days)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(223, 1, 941, '2', '{\"min\":\"50\",\"max\":\"100\",\"rate\":\"183.37\",\"currency\":\"INR\"}', 121, 223, '2', '1', 'Facebook Super Instant Real Sad React (Refill 30 Days)', '', '220.044', 50, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Super Instant Real Sad React (Refill 30 Days)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(224, 1, 942, '2', '{\"min\":\"50\",\"max\":\"100\",\"rate\":\"183.37\",\"currency\":\"INR\"}', 121, 224, '2', '1', 'Facebook Super Instant Real Care React (Refill 30 Days)', '', '220.044', 50, 100, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Super Instant Real Care React (Refill 30 Days)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(225, 1, 944, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"65.85\",\"currency\":\"INR\"}', 121, 225, '2', '1', 'Facebook  Post Reaction ❤️ [ Speed - 50k/day ] [ 30 Days Refill ] 0-1 HRS', '', '79.02', 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook  Post Reaction \\u2764\\ufe0f [ Speed - 50k\\/day ] [ 30 Days Refill ] 0-1 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(226, 1, 945, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"65.85\",\"currency\":\"INR\"}', 121, 226, '2', '1', 'Facebook Post Reaction 🥰 [ Speed - 50k/day ] [ 30 Days Refill ] 0-1 HRS', '', '79.02', 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Post Reaction \\ud83e\\udd70 [ Speed - 50k\\/day ] [ 30 Days Refill ] 0-1 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(227, 1, 946, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"65.85\",\"currency\":\"INR\"}', 121, 227, '2', '1', 'Facebook Post Reaction 😯 [ Speed - 50k/day ] [ 30 Days Refill ] 0-1 HRS', '', '79.02', 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Post Reaction \\ud83d\\ude2f [ Speed - 50k\\/day ] [ 30 Days Refill ] 0-1 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(228, 1, 947, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"65.85\",\"currency\":\"INR\"}', 121, 228, '2', '1', 'Facebook Post Reaction 😢 [ Speed - 50k/day ] [ 30 Days Refill ] 0-1 HRS', '', '79.02', 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Post Reaction \\ud83d\\ude22 [ Speed - 50k\\/day ] [ 30 Days Refill ] 0-1 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(229, 1, 948, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"65.85\",\"currency\":\"INR\"}', 121, 229, '2', '1', 'Facebook Post Reaction 😡 [ Speed - 50k/day ] [ 30 Days Refill ] 0-1 HRS', '', '79.02', 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Post Reaction \\ud83d\\ude21 [ Speed - 50k\\/day ] [ 30 Days Refill ] 0-1 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(230, 1, 936, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"74.07\",\"currency\":\"INR\"}', 122, 230, '2', '1', 'Facebook Post Likes [Super 𝐈𝐧𝐬𝐭𝐚𝐧𝐭 𝐒𝐭𝐚𝐫𝐭] [ European Quality ] [ Refill 60 Days ]', '', '88.884', 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Post Likes [Super \\ud835\\udc08\\ud835\\udc27\\ud835\\udc2c\\ud835\\udc2d\\ud835\\udc1a\\ud835\\udc27\\ud835\\udc2d \\ud835\\udc12\\ud835\\udc2d\\ud835\\udc1a\\ud835\\udc2b\\ud835\\udc2d] [ European Quality ] [ Refill 60 Days ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(231, 1, 451, '2', '{\"min\":\"500\",\"max\":\"10000000\",\"rate\":\"45.34\",\"currency\":\"INR\"}', 123, 231, '2', '1', 'Facebook Reels Views  - [ Max - 10M ] [ Fastest Server ] Non Drop', '', '54.408', 500, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Reels Views  - [ Max - 10M ] [ Fastest Server ] Non Drop\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(232, 1, 452, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"166.24\",\"currency\":\"INR\"}', 123, 232, '2', '1', 'Facebook Reels Likes - [ Max - 5000 ] [ 5k/day ] Instant', '', '199.488', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Reels Likes - [ Max - 5000 ] [ 5k\\/day ] Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(233, 1, 785, '2', '{\"min\":\"5\",\"max\":\"500\",\"rate\":\"2181.05\",\"currency\":\"INR\"}', 124, 233, '2', '3', 'Facebook Custom Comments [ Max - 1k ] 0-6 HRS', '', '2617.26', 5, 500, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Custom Comments [ Max - 1k ] 0-6 HRS\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(234, 1, 786, '2', '{\"min\":\"5\",\"max\":\"1000\",\"rate\":\"1307.95\",\"currency\":\"INR\"}', 124, 234, '2', '3', 'Facebook Custom Comments - [ Max - 1k ] [ No Drop ] [ 20-40/day ] 0-24 Hours', '', '1569.54', 5, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Custom Comments - [ Max - 1k ] [ No Drop ] [ 20-40\\/day ] 0-24 Hours\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(235, 1, 949, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"192.77\",\"currency\":\"INR\"}', 125, 235, '2', '1', '(New) FB Professional or New Layout Profile Page Like and Follow [2-5k] [ Nondrop ]  🅱🅴🆂🆃  🇮🇳 🏆🏆 [ 30 Days ]', '', '231.324', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"(New) FB Professional or New Layout Profile Page Like and Follow [2-5k] [ Nondrop ]  \\ud83c\\udd71\\ud83c\\udd74\\ud83c\\udd82\\ud83c\\udd83  \\ud83c\\uddee\\ud83c\\uddf3 \\ud83c\\udfc6\\ud83c\\udfc6 [ 30 Days ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(236, 1, 950, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"275.05\",\"currency\":\"INR\"}', 125, 236, '2', '1', 'Facebook Page like and Follow [India] [Real-Non Drop] [3k/Day] 🇮🇳  [ All Layout Works ] [ 30 Days ]', '', '330.06', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Page like and Follow [India] [Real-Non Drop] [3k\\/Day] \\ud83c\\uddee\\ud83c\\uddf3  [ All Layout Works ] [ 30 Days ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(237, 1, 951, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"263.30\",\"currency\":\"INR\"}', 125, 237, '2', '1', 'Facebook page likes and Follow [India] [Real-Non Drop] [3k/Day] 🇮🇳  [ ALL Type link Works ] [Refill 30] [ 100% Nondrop and Stable Server ]', '', '315.96', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook page likes and Follow [India] [Real-Non Drop] [3k\\/Day] \\ud83c\\uddee\\ud83c\\uddf3  [ ALL Type link Works ] [Refill 30] [ 100% Nondrop and Stable Server ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(238, 1, 952, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"172.79\",\"currency\":\"INR\"}', 125, 238, '2', '1', 'Facebook Profile follow / Page Follow / ID follow  [10k Day] ⚡ [ Nondrop ] 【﻿ｖｉｐ】 🇮🇳', '', '207.348', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Profile follow \\/ Page Follow \\/ ID follow  [10k Day] \\u26a1 [ Nondrop ] \\u3010\\ufeff\\uff56\\uff49\\uff50\\u3011 \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(239, 1, 953, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"181.02\",\"currency\":\"INR\"}', 125, 239, '2', '1', '2528: Facebook Profile Followers  [Real - Non Drop] [ Indian ] 🇮🇳 [ Refill 30 ]', '', '217.224', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"2528: Facebook Profile Followers  [Real - Non Drop] [ Indian ] \\ud83c\\uddee\\ud83c\\uddf3 [ Refill 30 ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(240, 1, 954, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"182.19\",\"currency\":\"INR\"}', 125, 240, '2', '1', '2526: Facebook Real Group Members [India] [ 5k Day] 🇮🇳', '', '218.628', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"2526: Facebook Real Group Members [India] [ 5k Day] \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(241, 1, 955, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"192.77\",\"currency\":\"INR\"}', 125, 241, '2', '1', 'Facebook Page Likes and Follow [6-10k Day] ⚡ [ Nondrop ] 【﻿ｖｉｐ】🅕🅐🅢🅣 🇮🇳', '', '231.324', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Page Likes and Follow [6-10k Day] \\u26a1 [ Nondrop ] \\u3010\\ufeff\\uff56\\uff49\\uff50\\u3011\\ud83c\\udd55\\ud83c\\udd50\\ud83c\\udd62\\ud83c\\udd63 \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(242, 1, 956, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"179.84\",\"currency\":\"INR\"}', 125, 242, '2', '1', 'Facebook Group Member [15k Day] ⚡ [ Nondrop ]  🅕🅐🅢🅣 🇮🇳', '', '215.808', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Group Member [15k Day] \\u26a1 [ Nondrop ]  \\ud83c\\udd55\\ud83c\\udd50\\ud83c\\udd62\\ud83c\\udd63 \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(243, 1, 957, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"162.21\",\"currency\":\"INR\"}', 125, 243, '2', '1', 'Facebook Nondrop Care React ( 🥰 ) [ India ] 🇮🇳', '', '194.652', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Nondrop Care React ( \\ud83e\\udd70 ) [ India ] \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(244, 1, 958, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"162.21\",\"currency\":\"INR\"}', 125, 244, '2', '1', 'Facebook Nondrop Love React  (❤️) [ India ] 🇮🇳', '', '194.652', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Nondrop Love React  (\\u2764\\ufe0f) [ India ] \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(245, 1, 959, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"162.21\",\"currency\":\"INR\"}', 125, 245, '2', '1', 'Facebook Nondrop Haha React (😀) [ India ] 🇮🇳', '', '194.652', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Nondrop Haha React (\\ud83d\\ude00) [ India ] \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(246, 1, 960, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"162.21\",\"currency\":\"INR\"}', 125, 246, '2', '1', 'Facebook Nondrop Angry React ( 😡) [ India ] 🇮🇳', '', '194.652', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Nondrop Angry React ( \\ud83d\\ude21) [ India ] \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(247, 1, 961, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"162.21\",\"currency\":\"INR\"}', 125, 247, '2', '1', 'Facebook Nondrop WoW React ( 😲) [ India ] 🇮🇳', '', '194.652', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Nondrop WoW React ( \\ud83d\\ude32) [ India ] \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(248, 1, 962, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"162.21\",\"currency\":\"INR\"}', 125, 248, '2', '1', 'Facebook Nondrop Sad React ( 😢) [ India ] 🇮🇳', '', '194.652', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Nondrop Sad React ( \\ud83d\\ude22) [ India ] \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(249, 1, 35, '2', '{\"min\":\"100\",\"max\":\"2500000\",\"rate\":\"240.12\",\"currency\":\"INR\"}', 126, 249, '2', '1', 'Facebook Post Likes 🇮🇳', '', '288.144', 100, 2500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Post Likes \\ud83c\\uddee\\ud83c\\uddf3\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(250, 1, 1390, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"95.21\",\"currency\":\"INR\"}', 127, 250, '2', '1', 'Facebook Live Stream Views - [ Stay 15 Minutes ] INSTANT', '', '114.252', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 15 Minutes ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(251, 1, 1391, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"190.42\",\"currency\":\"INR\"}', 127, 251, '2', '1', 'Facebook Live Stream Views - [ Stay 30 Minutes ] INSTANT', '', '228.504', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 30 Minutes ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(252, 1, 1392, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"380.84\",\"currency\":\"INR\"}', 127, 252, '2', '1', 'Facebook Live Stream Views - [ Stay 1 Hour ] INSTANT', '', '457.008', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 1 Hour ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(253, 1, 1393, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"571.25\",\"currency\":\"INR\"}', 127, 253, '2', '1', 'Facebook Live Stream Views - [ Stay 1.5 Hour ] INSTANT', '', '685.5', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 1.5 Hour ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(254, 1, 1394, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"752.26\",\"currency\":\"INR\"}', 127, 254, '2', '1', 'Facebook Live Stream Views - [ Stay 2 Hour ] INSTANT', '', '902.712', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 2 Hour ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(255, 1, 1395, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"950.91\",\"currency\":\"INR\"}', 127, 255, '2', '1', 'Facebook Live Stream Views - [ Stay 2.5 Hour ] INSTANT', '', '1141.092', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 2.5 Hour ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(256, 1, 1396, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"1128.39\",\"currency\":\"INR\"}', 127, 256, '2', '1', 'Facebook Live Stream Views - [ Stay 3 Hour ] INSTANT', '', '1354.068', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 3 Hour ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(257, 1, 1397, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"1520.98\",\"currency\":\"INR\"}', 127, 257, '2', '1', 'Facebook Live Stream Views - [ Stay 4 Hour ] INSTANT', '', '1825.176', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 4 Hour ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(258, 1, 1398, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"2294.40\",\"currency\":\"INR\"}', 127, 258, '2', '1', 'Facebook Live Stream Views - [ Stay 6 Hour ] INSTANT', '', '2753.28', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 6 Hour ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(259, 1, 1400, '2', '{\"min\":\"200\",\"max\":\"10000\",\"rate\":\"4161.16\",\"currency\":\"INR\"}', 127, 259, '2', '1', 'Facebook Live Stream Views - [ Stay 24 Hour ] INSTANT', '', '4993.392', 200, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook Live Stream Views - [ Stay 24 Hour ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(260, 1, 309, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"399.75\",\"currency\":\"INR\"}', 128, 260, '2', '1', 'Facebook 600k Minutes - [ For Monetization ] [ 3 Hour Video ]  [ 2-3 Days Complete ] - NORMAL SERVER', '', '479.7', 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook 600k Minutes - [ For Monetization ] [ 3 Hour Video ]  [ 2-3 Days Complete ] - NORMAL SERVER\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(261, 1, 310, '2', '{\"min\":\"1000\",\"max\":\"1000\",\"rate\":\"771.86\",\"currency\":\"INR\"}', 128, 261, '2', '1', 'Facebook 600k Minutes - [ For Monetization ] [ 3 Hour Video ] [ 1 Days Complete ] - VIP SERVER', '', '926.232', 1000, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Facebook 600k Minutes - [ For Monetization ] [ 3 Hour Video ] [ 1 Days Complete ] - VIP SERVER\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(262, 1, 1404, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"168.09\",\"currency\":\"INR\"}', 129, 262, '2', '1', 'Telegram Members - [ Max - 100K ] [ 50k/day ] [ 90 Days Refill Non Drop ] INSTANT', '', '201.708', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Members - [ Max - 100K ] [ 50k\\/day ] [ 90 Days Refill Non Drop ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(263, 1, 971, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"223.05\",\"currency\":\"INR\"}', 129, 263, '2', '1', 'Telegram chanel Members - [ Max - 50K ] [ 50k/day ] [ Non Drop ] INSTANT', '', '267.66', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram chanel Members - [ Max - 50K ] [ 50k\\/day ] [ Non Drop ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(264, 1, 972, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"179.61\",\"currency\":\"INR\"}', 129, 264, '2', '1', 'NEW - 💎⭐ Telegram channel members - [ Big Base ] [ Non Drop, 90 Days Guaranteed ] [ SuperFast ] INSTANT', '', '215.532', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"NEW - \\ud83d\\udc8e\\u2b50 Telegram channel members - [ Big Base ] [ Non Drop, 90 Days Guaranteed ] [ SuperFast ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(265, 1, 973, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"191.35\",\"currency\":\"INR\"}', 129, 265, '2', '1', 'Telegram chanel / Group Members ( Public / Private ) [ Daily 80k ] [ 100% Non / ZERO Drop ] [ BEST IN THE WORLD ] [ Non Drop ] INSTANT', '', '229.62', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram chanel \\/ Group Members ( Public \\/ Private ) [ Daily 80k ] [ 100% Non \\/ ZERO Drop ] [ BEST IN THE WORLD ] [ Non Drop ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(266, 1, 974, '2', '{\"min\":\"500\",\"max\":\"200000\",\"rate\":\"200.74\",\"currency\":\"INR\"}', 129, 266, '2', '1', 'Telegram chanel / Group Members ( Public / Private ) [ Daily 50k ] [ 100% Non / ZERO Drop ] [ BEST IN THE WORLD #2 ] [ Non Drop ] INSTANT', '', '240.888', 500, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram chanel \\/ Group Members ( Public \\/ Private ) [ Daily 50k ] [ 100% Non \\/ ZERO Drop ] [ BEST IN THE WORLD #2 ] [ Non Drop ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(267, 1, 975, '2', '{\"min\":\"500\",\"max\":\"60000\",\"rate\":\"178.44\",\"currency\":\"INR\"}', 129, 267, '2', '1', '🇺🇸 Telegram Chanel /Group Members - [ Max - 100k ] [ 100k/day ] [ Non Drop, 60 Days Guaranteed ] INSTANT', '', '214.128', 500, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddf8 Telegram Chanel \\/Group Members - [ Max - 100k ] [ 100k\\/day ] [ Non Drop, 60 Days Guaranteed ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(268, 1, 976, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"185.48\",\"currency\":\"INR\"}', 129, 268, '2', '1', 'Telegram chanel members - [  Max - UNLIMITED ] [ Best For Search Ranking - SEO ] [ Superfast ] [ Non Drop ] INSTANT', '', '222.576', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram chanel members - [  Max - UNLIMITED ] [ Best For Search Ranking - SEO ] [ Superfast ] [ Non Drop ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(269, 1, 729, '2', '{\"min\":\"10\",\"max\":\"35000\",\"rate\":\"468.77\",\"currency\":\"INR\"}', 130, 269, '2', '1', 'Telegram Premium Members 7Days', '', '562.524', 10, 35000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Members 7Days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(270, 1, 730, '2', '{\"min\":\"10\",\"max\":\"25000\",\"rate\":\"807.40\",\"currency\":\"INR\"}', 130, 270, '2', '1', 'Telegram Premium Members + Views 1-3k/day | 14days', '', '968.88', 10, 25000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Members + Views 1-3k\\/day | 14days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(271, 1, 731, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"806.51\",\"currency\":\"INR\"}', 130, 271, '2', '1', 'Telegram  Premium Members 30Days', '', '967.812', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram  Premium Members 30Days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(272, 1, 732, '2', '{\"min\":\"50\",\"max\":\"20000\",\"rate\":\"4486.92\",\"currency\":\"INR\"}', 130, 272, '2', '1', 'Telegram Premium Members + Views 90days', '', '5384.304', 50, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Members + Views 90days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(273, 1, 733, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"11024.99\",\"currency\":\"INR\"}', 130, 273, '2', '1', 'Telegram Premium Members + Views 180days', '', '13229.988', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Members + Views 180days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(274, 1, 734, '2', '{\"min\":\"50\",\"max\":\"20000\",\"rate\":\"7050.87\",\"currency\":\"INR\"}', 130, 274, '2', '1', 'Telegram Premium Members + Views 360ays', '', '8461.044', 50, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Members + Views 360ays\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(275, 1, 735, '2', '{\"min\":\"100\",\"max\":\"30000\",\"rate\":\"16024.69\",\"currency\":\"INR\"}', 130, 275, '2', '1', 'Telegram Premium Members + Views 365days', '', '19229.628', 100, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Members + Views 365days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(276, 1, 736, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"14738.08\",\"currency\":\"INR\"}', 131, 276, '2', '1', 'Telegram Channel Boost [Channel Story Activation] 7days', '', '17685.696', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Channel Boost [Channel Story Activation] 7days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(277, 1, 737, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"23068.30\",\"currency\":\"INR\"}', 131, 277, '2', '1', 'Telegram Channel Boost [Channel Story Activation] 15days', '', '27681.96', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Channel Boost [Channel Story Activation] 15days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(278, 1, 738, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"48699.73\",\"currency\":\"INR\"}', 131, 278, '2', '1', 'Telegram Channel Boost [Channel Story Activation] 30days', '', '58439.676', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Channel Boost [Channel Story Activation] 30days\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(279, 1, 739, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"58.21\",\"currency\":\"INR\"}', 132, 279, '2', '1', 'Telegram Premium Post Views', '', '69.852', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Post Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(280, 1, 740, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"54.90\",\"currency\":\"INR\"}', 132, 280, '2', '1', 'Telegram Premium Post Views [Russian]', '', '65.88', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Post Views [Russian]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(281, 1, 741, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"58.21\",\"currency\":\"INR\"}', 132, 281, '2', '1', 'Telegram Premium Post Views [China]', '', '69.852', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Premium Post Views [China]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(282, 1, 1137, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"175.08\",\"currency\":\"INR\"}', 133, 282, '2', '1', '🇷🇺 Telegram Channel/Group Members - [ Max - 10k ] INSTANT', '', '210.096', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf7\\ud83c\\uddfa Telegram Channel\\/Group Members - [ Max - 10k ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(283, 1, 1138, '2', '{\"min\":\"100\",\"max\":\"10000\",\"rate\":\"161.04\",\"currency\":\"INR\"}', 133, 283, '2', '1', '🇸🇦 Telegram Channel/Group Members - [ Max - 10k ] INSTANT', '', '193.248', 100, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf8\\ud83c\\udde6 Telegram Channel\\/Group Members - [ Max - 10k ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(284, 1, 1139, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"164.35\",\"currency\":\"INR\"}', 133, 284, '2', '1', 'China Members🇨🇳 -Zero Drop -unlimited', '', '197.22', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"China Members\\ud83c\\udde8\\ud83c\\uddf3 -Zero Drop -unlimited\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(285, 1, 1140, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"177.27\",\"currency\":\"INR\"}', 133, 285, '2', '1', '🇬🇧[English] Members -low Drop 30k/day', '', '212.724', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddec\\ud83c\\udde7[English] Members -low Drop 30k\\/day\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(286, 1, 1141, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"164.35\",\"currency\":\"INR\"}', 133, 286, '2', '1', 'Russian Members🇷🇺 Zero Drop-30k/day', '', '197.22', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Russian Members\\ud83c\\uddf7\\ud83c\\uddfa Zero Drop-30k\\/day\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(287, 1, 1142, '2', '{\"min\":\"500\",\"max\":\"60000\",\"rate\":\"171.40\",\"currency\":\"INR\"}', 133, 287, '2', '1', 'USA Members🇺🇸 -Zero Drop -60k/day', '', '205.68', 500, 60000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"USA Members\\ud83c\\uddfa\\ud83c\\uddf8 -Zero Drop -60k\\/day\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(288, 1, 1143, '2', '{\"min\":\"500\",\"max\":\"200000\",\"rate\":\"178.44\",\"currency\":\"INR\"}', 133, 288, '2', '1', 'China Members🇨🇳 -Zero Drop -30k/day', '', '214.128', 500, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"China Members\\ud83c\\udde8\\ud83c\\uddf3 -Zero Drop -30k\\/day\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(289, 1, 1144, '2', '{\"min\":\"500\",\"max\":\"50000\",\"rate\":\"171.40\",\"currency\":\"INR\"}', 134, 289, '2', '1', '[S2] Vip Members (USA🇺🇸 Sim)', '', '205.68', 500, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"[S2] Vip Members (USA\\ud83c\\uddfa\\ud83c\\uddf8 Sim)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(290, 1, 1145, '2', '{\"min\":\"100\",\"max\":\"200000\",\"rate\":\"110.35\",\"currency\":\"INR\"}', 134, 290, '2', '1', '[S1] Cheap Members (USA🇺🇸 Sim)', '', '132.42', 100, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"[S1] Cheap Members (USA\\ud83c\\uddfa\\ud83c\\uddf8 Sim)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(291, 1, 1146, '2', '{\"min\":\"500\",\"max\":\"50000\",\"rate\":\"171.40\",\"currency\":\"INR\"}', 134, 291, '2', '1', '[S2] Vip Members (USA🇺🇸 Sim)', '', '205.68', 500, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"[S2] Vip Members (USA\\ud83c\\uddfa\\ud83c\\uddf8 Sim)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(292, 1, 1147, '2', '{\"min\":\"500\",\"max\":\"50000\",\"rate\":\"171.40\",\"currency\":\"INR\"}', 134, 292, '2', '1', 'Members USA🇺🇸 Sim [ZeroDrop 30dyas Gurantee]', '', '205.68', 500, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Members USA\\ud83c\\uddfa\\ud83c\\uddf8 Sim [ZeroDrop 30dyas Gurantee]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(293, 1, 1148, '2', '{\"min\":\"500\",\"max\":\"500000\",\"rate\":\"173.74\",\"currency\":\"INR\"}', 134, 293, '2', '1', 'Ultra fast Members [ZeroDrop-30DaysGurantee]', '', '208.488', 500, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Ultra fast Members [ZeroDrop-30DaysGurantee]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(294, 1, 1153, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"1.17\",\"currency\":\"INR\"}', 135, 294, '2', '11', 'Smart View (New , Old Posts)', '', '1.404', 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(295, 1, 1437, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 295, '2', '11', '🇸🇦[Arabic] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf8\\ud83c\\udde6[Arabic] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(296, 1, 1438, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 296, '2', '11', '🇨🇳[China] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udde8\\ud83c\\uddf3[China] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(297, 1, 1439, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 297, '2', '11', '🇮🇳[INDIA] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3[INDIA] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(298, 1, 1440, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"12.85\",\"currency\":\"INR\"}', 135, 298, '2', '11', '🇷🇺[Russia] Smart View (New , Old Posts)', '', '15.42', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf7\\ud83c\\uddfa[Russia] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(299, 1, 1441, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 299, '2', '11', '🇺🇸[USA]  Smart View (New , Old Posts)', '', '8.412', 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddf8[USA]  Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(300, 1, 1442, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 300, '2', '11', '🇺🇿[Uzbekistan] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddff[Uzbekistan] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(301, 1, 1443, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 301, '2', '11', '🇰🇿[Kazakhstan] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf0\\ud83c\\uddff[Kazakhstan] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(302, 1, 1444, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 302, '2', '11', '🇺🇦[Ukraine] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\udde6[Ukraine] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(303, 1, 1445, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 303, '2', '11', '🇮🇹[italy] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf9[italy] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(304, 1, 1446, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 304, '2', '11', '🇮🇩[Indonesia] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\udde9[Indonesia] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(305, 1, 1447, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 305, '2', '11', '🇮🇱[Israel] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf1[Israel] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(306, 1, 1448, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 306, '2', '11', '🇹🇷[Turkey] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf9\\ud83c\\uddf7[Turkey] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(307, 1, 1449, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"7.01\",\"currency\":\"INR\"}', 135, 307, '2', '11', '🇩🇪[Germany] Smart View (New , Old Posts)', '', '8.412', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udde9\\ud83c\\uddea[Germany] Smart View (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(308, 1, 1450, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 308, '2', '11', 'Smart Share (New , Old Posts)', '', '7.02', 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(309, 1, 1451, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 309, '2', '11', '🇸🇦[Arabic] Smart Share (New , Old Posts)', '', '7.02', 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf8\\ud83c\\udde6[Arabic] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(310, 1, 1452, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 310, '2', '11', '🇨🇳[China] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udde8\\ud83c\\uddf3[China] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(311, 1, 1453, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 311, '2', '11', '🇮🇳[INDIA] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3[INDIA] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(312, 1, 1454, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 312, '2', '11', '🇷🇺[Russia] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf7\\ud83c\\uddfa[Russia] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(313, 1, 1455, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 313, '2', '11', '🇺🇸[USA] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddf8[USA] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(314, 1, 1456, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 314, '2', '11', '🇺🇿[Uzbekistan] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddff[Uzbekistan] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(315, 1, 1457, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 315, '2', '11', '🇰🇿[Kazakhstan] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf0\\ud83c\\uddff[Kazakhstan] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(316, 1, 1458, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 316, '2', '11', '🇺🇦[Ukraine] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\udde6[Ukraine] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0');
INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`, `price_profit`, `service_overflow`, `service_sync`, `service_deleted`) VALUES
(317, 1, 1459, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 317, '2', '11', '🇮🇹[italy] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf9[italy] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(318, 1, 1460, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 318, '2', '11', '🇮🇩[Indonesia] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\udde9[Indonesia] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(319, 1, 1461, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 319, '2', '11', '🇮🇱[Israel] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf1[Israel] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(320, 1, 1462, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 320, '2', '11', '🇹🇷[Turkey] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf9\\ud83c\\uddf7[Turkey] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(321, 1, 1463, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"5.85\",\"currency\":\"INR\"}', 135, 321, '2', '11', '🇩🇪[Germany] Smart Share (New , Old Posts)', '', '7.02', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udde9\\ud83c\\uddea[Germany] Smart Share (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(322, 1, 1464, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 322, '2', '11', 'Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(323, 1, 1465, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 323, '2', '11', '🇨🇳[China] Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udde8\\ud83c\\uddf3[China] Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(324, 1, 1466, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 324, '2', '11', '🇬🇧[English] Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddec\\ud83c\\udde7[English] Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(325, 1, 1467, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 325, '2', '11', '🇷🇺[Rus] Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf7\\ud83c\\uddfa[Rus] Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(326, 1, 1468, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 326, '2', '11', '🇸🇦 [Arabic] Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf8\\ud83c\\udde6 [Arabic] Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(327, 1, 1469, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 327, '2', '11', '🇮🇳 [India] Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3 [India] Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(328, 1, 1470, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 328, '2', '11', '🇩🇪[Germany] Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udde9\\ud83c\\uddea[Germany] Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(329, 1, 1471, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 329, '2', '11', '🇹🇷[Turkey] Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddf9\\ud83c\\uddf7[Turkey] Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(330, 1, 1472, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"280.36\",\"currency\":\"INR\"}', 135, 330, '2', '11', '🇮🇱[Israel] Smart Comment (New , Old Posts)', '', '336.432', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf1[Israel] Smart Comment (New , Old Posts)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(331, 1, 1473, '2', '{\"min\":\"20\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 331, '2', '11', 'Positive Reactions[ 👍 ❤️ 🔥 🎉 😁]+ Views', '', '16.824', 20, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Positive Reactions[ \\ud83d\\udc4d \\u2764\\ufe0f \\ud83d\\udd25 \\ud83c\\udf89 \\ud83d\\ude01]+ Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(332, 1, 1474, '2', '{\"min\":\"20\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 332, '2', '11', 'Permium Mix Positive [👌 😍 ❤️ 🤡 👍 🐳] + Views', '', '16.824', 20, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Permium Mix Positive [\\ud83d\\udc4c \\ud83d\\ude0d \\u2764\\ufe0f \\ud83e\\udd21 \\ud83d\\udc4d \\ud83d\\udc33] + Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(333, 1, 1475, '2', '{\"min\":\"20\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 333, '2', '11', 'Negative Reactions[👎 😱 💩 😢 🤮]+ Views', '', '16.824', 20, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Negative Reactions[\\ud83d\\udc4e \\ud83d\\ude31 \\ud83d\\udca9 \\ud83d\\ude22 \\ud83e\\udd2e]+ Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(334, 1, 1476, '2', '{\"min\":\"20\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 334, '2', '11', 'Smart Reaction Like👍 + Views', '', '16.824', 20, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart Reaction Like\\ud83d\\udc4d + Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(335, 1, 1477, '2', '{\"min\":\"20\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 335, '2', '11', 'Smart Reaction DisLike👎 + Views', '', '16.824', 20, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart Reaction DisLike\\ud83d\\udc4e + Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(336, 1, 1478, '2', '{\"min\":\"20\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 336, '2', '11', 'Smart Reaction Heart❤️ + Views', '', '16.824', 20, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart Reaction Heart\\u2764\\ufe0f + Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(337, 1, 1479, '2', '{\"min\":\"20\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 337, '2', '11', 'Smart Reaction Fire🔥 + Views', '', '16.824', 20, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart Reaction Fire\\ud83d\\udd25 + Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(338, 1, 1480, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 338, '2', '11', 'Smart reaction Ok hand 👌 + Views', '', '16.824', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart reaction Ok hand \\ud83d\\udc4c + Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(339, 1, 1481, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 339, '2', '11', 'Smart reaction Heart-eyes 😍 + Views', '', '16.824', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart reaction Heart-eyes \\ud83d\\ude0d + Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(340, 1, 1482, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"14.02\",\"currency\":\"INR\"}', 135, 340, '2', '11', 'Smart reaction Whale 🐳 + Views', '', '16.824', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Smart reaction Whale \\ud83d\\udc33 + Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(341, 1, 1203, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 136, 341, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝟭𝟬 𝗰𝗼𝘂𝗻𝘁𝗿𝘆[𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁] [𝗶𝗻𝗰𝗹𝘂𝗱𝗲 𝘀𝘁𝗮𝘁]', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\udfed\\ud835\\udfec \\ud835\\uddf0\\ud835\\uddfc\\ud835\\ude02\\ud835\\uddfb\\ud835\\ude01\\ud835\\uddff\\ud835\\ude06[\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01] [\\ud835\\uddf6\\ud835\\uddfb\\ud835\\uddf0\\ud835\\uddf9\\ud835\\ude02\\ud835\\uddf1\\ud835\\uddf2 \\ud835\\ude00\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(342, 1, 1204, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 136, 342, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝗜𝘀𝗿𝗮𝗲𝗹 🇮🇱 [𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁]📊', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\udddc\\ud835\\ude00\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf2\\ud835\\uddf9 \\ud83c\\uddee\\ud83c\\uddf1 [\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01]\\ud83d\\udcca\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(343, 1, 1205, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 136, 343, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝗮𝗿𝗮𝗯𝗶𝗰 🇸🇦 [𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁]📊', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\uddee\\ud835\\uddff\\ud835\\uddee\\ud835\\uddef\\ud835\\uddf6\\ud835\\uddf0 \\ud83c\\uddf8\\ud83c\\udde6 [\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01]\\ud83d\\udcca\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(344, 1, 1206, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 136, 344, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝗖𝗵𝗶𝗻𝗮 🇨🇳[𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁]📊', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\uddd6\\ud835\\uddf5\\ud835\\uddf6\\ud835\\uddfb\\ud835\\uddee \\ud83c\\udde8\\ud83c\\uddf3[\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01]\\ud83d\\udcca\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(345, 1, 1207, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 136, 345, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝗨𝗦/𝗚𝗹𝗼𝗯𝗮𝗹[𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁]📊', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\udde8\\ud835\\udde6\\/\\ud835\\uddda\\ud835\\uddf9\\ud835\\uddfc\\ud835\\uddef\\ud835\\uddee\\ud835\\uddf9[\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01]\\ud83d\\udcca\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(346, 1, 1208, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 136, 346, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝗜𝗻𝗱𝗶𝗮 🇮🇳 [𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁]📊', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\udddc\\ud835\\uddfb\\ud835\\uddf1\\ud835\\uddf6\\ud835\\uddee \\ud83c\\uddee\\ud83c\\uddf3 [\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01]\\ud83d\\udcca\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(347, 1, 1209, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 136, 347, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝗥𝘂𝘀𝘀𝗶𝗮 🇷🇺 [𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁]📊', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\udde5\\ud835\\ude02\\ud835\\ude00\\ud835\\ude00\\ud835\\uddf6\\ud835\\uddee \\ud83c\\uddf7\\ud83c\\uddfa [\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01]\\ud83d\\udcca\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(348, 1, 1210, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 136, 348, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝗚𝗲𝗿𝗺𝗮𝗻𝘆 🇩🇪 [𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁]📊', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\uddda\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddfa\\ud835\\uddee\\ud835\\uddfb\\ud835\\ude06 \\ud83c\\udde9\\ud83c\\uddea [\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01]\\ud83d\\udcca\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(349, 1, 1211, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 349, '2', '1', '𝗠𝗶𝘅 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝟭𝟬 𝗖𝗼𝘂𝗻𝘁𝗿𝘆][𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊] 🌎🔝', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udfed\\ud835\\udfec \\ud835\\uddd6\\ud835\\uddfc\\ud835\\ude02\\ud835\\uddfb\\ud835\\ude01\\ud835\\uddff\\ud835\\ude06][\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca] \\ud83c\\udf0e\\ud83d\\udd1d\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(350, 1, 1212, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 350, '2', '1', '𝗜𝘀𝗿𝗮𝗲𝗹 🇮🇱 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udddc\\ud835\\ude00\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf2\\ud835\\uddf9 \\ud83c\\uddee\\ud83c\\uddf1 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(351, 1, 1213, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 351, '2', '1', '𝗨𝗸𝗿𝗮𝗶𝗻𝗲 🇺🇦 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde8\\ud835\\uddf8\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf6\\ud835\\uddfb\\ud835\\uddf2 \\ud83c\\uddfa\\ud83c\\udde6 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(352, 1, 1214, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 352, '2', '1', '𝗖𝗵𝗶𝗻𝗮 🇨🇳 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\uddd6\\ud835\\uddf5\\ud835\\uddf6\\ud835\\uddfb\\ud835\\uddee \\ud83c\\udde8\\ud83c\\uddf3 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(353, 1, 1215, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 353, '2', '1', '𝗦𝗮𝘂𝗱𝗶 𝗔𝗿𝗮𝗯𝗶𝗮 🇸🇦 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde6\\ud835\\uddee\\ud835\\ude02\\ud835\\uddf1\\ud835\\uddf6 \\ud835\\uddd4\\ud835\\uddff\\ud835\\uddee\\ud835\\uddef\\ud835\\uddf6\\ud835\\uddee \\ud83c\\uddf8\\ud83c\\udde6 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(354, 1, 1216, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 354, '2', '1', '𝗜𝗻𝗱𝗶𝗮 🇮🇳 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udddc\\ud835\\uddfb\\ud835\\uddf1\\ud835\\uddf6\\ud835\\uddee \\ud83c\\uddee\\ud83c\\uddf3 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(355, 1, 1217, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 355, '2', '1', '𝗥𝘂𝘀𝘀𝗶𝗮 🇷🇺 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde5\\ud835\\ude02\\ud835\\ude00\\ud835\\ude00\\ud835\\uddf6\\ud835\\uddee \\ud83c\\uddf7\\ud83c\\uddfa \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(356, 1, 1218, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 356, '2', '1', '𝗨𝗦 🇺🇸 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde8\\ud835\\udde6 \\ud83c\\uddfa\\ud83c\\uddf8 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(357, 1, 1219, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 357, '2', '1', '𝗚𝗲𝗿𝗺𝗮𝗻𝘆 🇩🇪 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\uddda\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddfa\\ud835\\uddee\\ud835\\uddfb\\ud835\\ude06 \\ud83c\\udde9\\ud83c\\uddea \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(358, 1, 1220, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 137, 358, '2', '1', '𝗧𝘂𝗿𝗸𝗶𝘆𝗲 🇹🇷 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝗽𝗼𝘀𝘁 𝘃𝗶𝗲𝘄 [𝗥𝗲𝗮𝗹][𝗛𝗤 𝐒𝐓𝐀𝐓📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\ude02\\ud835\\uddff\\ud835\\uddf8\\ud835\\uddf6\\ud835\\ude06\\ud835\\uddf2 \\ud83c\\uddf9\\ud83c\\uddf7 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 \\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf9][\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(359, 1, 1221, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 138, 359, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 - 𝗠𝗶𝘅 𝗖𝗼𝘂𝗻𝘁𝗿𝘆 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]🌎🔝', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 - \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\ude02\\ud835\\uddfb\\ud835\\ude01\\ud835\\uddff\\ud835\\ude06 [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\\ud83c\\udf0e\\ud83d\\udd1d\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(360, 1, 1222, '2', '{\"min\":\"15\",\"max\":\"13500\",\"rate\":\"56.42\",\"currency\":\"INR\"}', 138, 360, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗨𝗸𝗿𝗮𝗶𝗻𝗲 🇺🇦 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '67.704', 15, 13500, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\udde8\\ud835\\uddf8\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf6\\ud835\\uddfb\\ud835\\uddf2 \\ud83c\\uddfa\\ud83c\\udde6 [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(361, 1, 1223, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"56.42\",\"currency\":\"INR\"}', 138, 361, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗖𝗵𝗶𝗻𝗮 🇨🇳 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '67.704', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\uddd6\\ud835\\uddf5\\ud835\\uddf6\\ud835\\uddfb\\ud835\\uddee \\ud83c\\udde8\\ud83c\\uddf3 [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(362, 1, 1224, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 138, 362, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗜𝘀𝗿𝗮𝗲𝗹 🇮🇱 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\udddc\\ud835\\ude00\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf2\\ud835\\uddf9 \\ud83c\\uddee\\ud83c\\uddf1 [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(363, 1, 1225, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"56.42\",\"currency\":\"INR\"}', 138, 363, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗔𝗿𝗮𝗯𝗶𝗰 🇸🇦🇦🇪 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '67.704', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\uddd4\\ud835\\uddff\\ud835\\uddee\\ud835\\uddef\\ud835\\uddf6\\ud835\\uddf0 \\ud83c\\uddf8\\ud83c\\udde6\\ud83c\\udde6\\ud83c\\uddea [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(364, 1, 1226, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 138, 364, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗜𝗻𝗱𝗶𝗮 🇮🇳 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\udddc\\ud835\\uddfb\\ud835\\uddf1\\ud835\\uddf6\\ud835\\uddee \\ud83c\\uddee\\ud83c\\uddf3 [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(365, 1, 1227, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 138, 365, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗥𝘂𝘀𝘀𝗶𝗮 🇷🇺 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\udde5\\ud835\\ude02\\ud835\\ude00\\ud835\\ude00\\ud835\\uddf6\\ud835\\uddee \\ud83c\\uddf7\\ud83c\\uddfa [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(366, 1, 1228, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 138, 366, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗨𝗞-𝗨𝗦 🇬🇧 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\udde8\\ud835\\uddde-\\ud835\\udde8\\ud835\\udde6 \\ud83c\\uddec\\ud83c\\udde7 [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(367, 1, 1229, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"56.42\",\"currency\":\"INR\"}', 138, 367, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗧𝘂𝗿𝗸𝗲𝘆 🇹🇷 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '67.704', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\udde7\\ud835\\ude02\\ud835\\uddff\\ud835\\uddf8\\ud835\\uddf2\\ud835\\ude06 \\ud83c\\uddf9\\ud83c\\uddf7 [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(368, 1, 1230, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"56.42\",\"currency\":\"INR\"}', 138, 368, '2', '1', '🤖𝗕𝗼𝘁 𝗦𝘁𝗮𝗿𝘁 [𝗚𝗲𝗿𝗺𝗮𝗻𝘆 🇩🇪 [𝗔𝗰𝗰𝗲𝗽𝘁 𝗥𝗲𝗳𝗲𝗿𝗿𝗮𝗹 𝗖𝗼𝗱𝗲]', '', '67.704', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83e\\udd16\\ud835\\uddd5\\ud835\\uddfc\\ud835\\ude01 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddff\\ud835\\ude01 [\\ud835\\uddda\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddfa\\ud835\\uddee\\ud835\\uddfb\\ud835\\ude06 \\ud83c\\udde9\\ud83c\\uddea [\\ud835\\uddd4\\ud835\\uddf0\\ud835\\uddf0\\ud835\\uddf2\\ud835\\uddfd\\ud835\\ude01 \\ud835\\udde5\\ud835\\uddf2\\ud835\\uddf3\\ud835\\uddf2\\ud835\\uddff\\ud835\\uddff\\ud835\\uddee\\ud835\\uddf9 \\ud835\\uddd6\\ud835\\uddfc\\ud835\\uddf1\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(369, 1, 1231, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 138, 369, '2', '1', '𝗧𝗚 𝗠𝗶𝘅 𝗦𝗘𝗢 𝗧𝘂𝗿𝗸𝗶𝘆𝗲 🇹🇷 [𝘃𝗶𝗲𝘄+𝗿𝗲𝗮𝗰𝘁𝗶𝗼𝗻+𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁]📊', '', '33.852', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\udde7\\ud835\\uddda \\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05 \\ud835\\udde6\\ud835\\uddd8\\ud835\\udde2 \\ud835\\udde7\\ud835\\ude02\\ud835\\uddff\\ud835\\uddf8\\ud835\\uddf6\\ud835\\ude06\\ud835\\uddf2 \\ud83c\\uddf9\\ud83c\\uddf7 [\\ud835\\ude03\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04+\\ud835\\uddff\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddf0\\ud835\\ude01\\ud835\\uddf6\\ud835\\uddfc\\ud835\\uddfb+\\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01]\\ud83d\\udcca\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(370, 1, 1232, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 370, '2', '1', '⤴️ 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝗦𝘁𝗮𝘁📊][𝗠𝗶𝘅🌎🔝]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca][\\ud835\\udde0\\ud835\\uddf6\\ud835\\ude05\\ud83c\\udf0e\\ud83d\\udd1d]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(371, 1, 1233, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 371, '2', '1', '⤴️ 🇨🇳 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f \\ud83c\\udde8\\ud83c\\uddf3 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(372, 1, 1234, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 372, '2', '1', '⤴️ 🇺🇦 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f \\ud83c\\uddfa\\ud83c\\udde6 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(373, 1, 1235, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 373, '2', '1', '⤴️ 🇮🇱 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f \\ud83c\\uddee\\ud83c\\uddf1 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(374, 1, 1236, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 374, '2', '1', '⤴️🇸🇦 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f\\ud83c\\uddf8\\ud83c\\udde6 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(375, 1, 1237, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 375, '2', '1', '⤴️🇮🇳 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f\\ud83c\\uddee\\ud83c\\uddf3 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(376, 1, 1238, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 376, '2', '1', '⤴️🇷🇺 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f\\ud83c\\uddf7\\ud83c\\uddfa \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(377, 1, 1239, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 377, '2', '1', '⤴️🇺🇸 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f\\ud83c\\uddfa\\ud83c\\uddf8 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(378, 1, 1240, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 378, '2', '1', '⤴️🇩🇪 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f\\ud83c\\udde9\\ud83c\\uddea \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(379, 1, 1241, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"11.76\",\"currency\":\"INR\"}', 139, 379, '2', '1', '⤴️🇹🇷 𝗢𝗿𝗴𝗮𝗻𝗶𝗰 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝘁𝗮𝘁📊]', '', '14.112', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u2934\\ufe0f\\ud83c\\uddf9\\ud83c\\uddf7 \\ud835\\udde2\\ud835\\uddff\\ud835\\uddf4\\ud835\\uddee\\ud835\\uddfb\\ud835\\uddf6\\ud835\\uddf0 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\ude01\\ud835\\uddee\\ud835\\ude01\\ud83d\\udcca]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(380, 1, 1242, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"2.71\",\"currency\":\"INR\"}', 139, 380, '2', '1', '𝗖𝗵𝗲𝗮𝗽𝗲𝘀𝘁 𝗧𝗚 𝗦𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁/𝗥𝗲𝗽𝗼𝘀𝘁 [𝗡𝗗][𝗙𝗮𝗸𝗲]', '', '3.252', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud835\\uddd6\\ud835\\uddf5\\ud835\\uddf2\\ud835\\uddee\\ud835\\uddfd\\ud835\\uddf2\\ud835\\ude00\\ud835\\ude01 \\ud835\\udde7\\ud835\\uddda \\ud835\\udde6\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01\\/\\ud835\\udde5\\ud835\\uddf2\\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 [\\ud835\\udde1\\ud835\\uddd7][\\ud835\\uddd9\\ud835\\uddee\\ud835\\uddf8\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(381, 1, 1243, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"211.58\",\"currency\":\"INR\"}', 139, 381, '2', '1', '[𝗳𝘂𝘁𝘂𝗿𝗲 𝟯𝟬 𝗽𝗼𝘀𝘁] ⤴️ 𝗺𝗶𝘅 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝐓𝐀𝐓📊]🌎🔝', '', '253.896', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"[\\ud835\\uddf3\\ud835\\ude02\\ud835\\ude01\\ud835\\ude02\\ud835\\uddff\\ud835\\uddf2 \\ud835\\udfef\\ud835\\udfec \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01] \\u2934\\ufe0f \\ud835\\uddfa\\ud835\\uddf6\\ud835\\ude05 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\\ud83c\\udf0e\\ud83d\\udd1d\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(382, 1, 1244, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"493.68\",\"currency\":\"INR\"}', 139, 382, '2', '1', '[𝗳𝘂𝘁𝘂𝗿𝗲 𝟱𝟬 𝗽𝗼𝘀𝘁] ⤴️ 𝗺𝗶𝘅 𝘀𝗵𝗮𝗿𝗲 𝗽𝗼𝘀𝘁 + 𝗩𝗶𝗲𝘄 [𝗛𝗤 𝐒𝐓𝐀𝐓📊]🌎🔝', '', '592.416', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"[\\ud835\\uddf3\\ud835\\ude02\\ud835\\ude01\\ud835\\ude02\\ud835\\uddff\\ud835\\uddf2 \\ud835\\udff1\\ud835\\udfec \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01] \\u2934\\ufe0f \\ud835\\uddfa\\ud835\\uddf6\\ud835\\ude05 \\ud835\\ude00\\ud835\\uddf5\\ud835\\uddee\\ud835\\uddff\\ud835\\uddf2 \\ud835\\uddfd\\ud835\\uddfc\\ud835\\ude00\\ud835\\ude01 + \\ud835\\udde9\\ud835\\uddf6\\ud835\\uddf2\\ud835\\ude04 [\\ud835\\udddb\\ud835\\udde4 \\ud835\\udc12\\ud835\\udc13\\ud835\\udc00\\ud835\\udc13\\ud83d\\udcca]\\ud83c\\udf0e\\ud83d\\udd1d\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(383, 1, 416, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"2.02\",\"currency\":\"INR\"}', 140, 383, '2', '1', 'Telegram Mixed Positive Reactions + Free Views', '', '2.424', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Mixed Positive Reactions + Free Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(384, 1, 417, '2', '{\"min\":\"10\",\"max\":\"1000000\",\"rate\":\"14.98\",\"currency\":\"INR\"}', 140, 384, '2', '1', 'Telegram Mixed Negative Reactions + Free Views', '', '17.976', 10, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Mixed Negative Reactions + Free Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(385, 1, 419, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"12.60\",\"currency\":\"INR\"}', 140, 385, '2', '1', 'Telegram Party 🎉 Reaction + Free Views', '', '15.12', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Party \\ud83c\\udf89 Reaction + Free Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0');
INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`, `price_profit`, `service_overflow`, `service_sync`, `service_deleted`) VALUES
(386, 1, 420, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"12.60\",\"currency\":\"INR\"}', 140, 386, '2', '1', 'Telegram Fire 🔥 Reaction + Free Views', '', '15.12', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Fire \\ud83d\\udd25 Reaction + Free Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(387, 1, 421, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"12.60\",\"currency\":\"INR\"}', 140, 387, '2', '1', 'Telegram Heart ❤️ Reaction + Free Views', '', '15.12', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Heart \\u2764\\ufe0f Reaction + Free Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(388, 1, 422, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"12.60\",\"currency\":\"INR\"}', 140, 388, '2', '1', 'Telegram Star Struck 🤩 Reaction + Free Views', '', '15.12', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Star Struck \\ud83e\\udd29 Reaction + Free Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(389, 1, 423, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"12.60\",\"currency\":\"INR\"}', 140, 389, '2', '1', 'Telegram Screaming Face 😱 Reaction + Free Views', '', '15.12', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Screaming Face \\ud83d\\ude31 Reaction + Free Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(390, 1, 424, '2', '{\"min\":\"15\",\"max\":\"1000000\",\"rate\":\"12.60\",\"currency\":\"INR\"}', 140, 390, '2', '1', 'Telegram Beaming Face 😁 Reaction + Free Views', '', '15.12', 15, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Beaming Face \\ud83d\\ude01 Reaction + Free Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(391, 1, 428, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"39.23\",\"currency\":\"INR\"}', 141, 391, '2', '1', 'Telegram Poll Votes + Likes [ Non Drop ]', '', '47.076', 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Poll Votes + Likes [ Non Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(392, 1, 429, '2', '{\"min\":\"10\",\"max\":\"300000\",\"rate\":\"39.23\",\"currency\":\"INR\"}', 141, 392, '2', '1', 'Premium Telegram Poll Votes + Likes [ Non Drop ]', '', '47.076', 10, 300000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Premium Telegram Poll Votes + Likes [ Non Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(393, 1, 432, '2', '{\"min\":\"10\",\"max\":\"200000\",\"rate\":\"224.91\",\"currency\":\"INR\"}', 141, 393, '2', '1', 'Telegram Indian Random Comments - [ Non Drop ]', '', '269.892', 10, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Indian Random Comments - [ Non Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(394, 1, 1246, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"0.95\",\"currency\":\"INR\"}', 142, 394, '2', '1', 'Telegram Post View', '', '1.14', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post View\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(395, 1, 1247, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"3.53\",\"currency\":\"INR\"}', 142, 395, '2', '1', 'Telegram Post View [last 5 post]', '', '4.236', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post View [last 5 post]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(396, 1, 1248, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"7.06\",\"currency\":\"INR\"}', 142, 396, '2', '1', 'Telegram Post View [last 10 post]', '', '8.472', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post View [last 10 post]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(397, 1, 1249, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"14.11\",\"currency\":\"INR\"}', 142, 397, '2', '1', 'Telegram Post View [last 20 post]', '', '16.932', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post View [last 20 post]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(398, 1, 1250, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"23.51\",\"currency\":\"INR\"}', 142, 398, '2', '1', 'Telegram Post View [last 30 post]', '', '28.212', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post View [last 30 post]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(399, 1, 1251, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"35.27\",\"currency\":\"INR\"}', 142, 399, '2', '1', 'Telegram Post View [last 50 post]', '', '42.324', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post View [last 50 post]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(400, 1, 1252, '2', '{\"min\":\"500\",\"max\":\"40000\",\"rate\":\"7.06\",\"currency\":\"INR\"}', 142, 400, '2', '1', 'Mix Positive Reaction 👍❤️🔥🥰👏😁🎉🤩', '', '8.472', 500, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Mix Positive Reaction \\ud83d\\udc4d\\u2764\\ufe0f\\ud83d\\udd25\\ud83e\\udd70\\ud83d\\udc4f\\ud83d\\ude01\\ud83c\\udf89\\ud83e\\udd29\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(401, 1, 1253, '2', '{\"min\":\"100\",\"max\":\"40000\",\"rate\":\"30.57\",\"currency\":\"INR\"}', 142, 401, '2', '1', 'Telegram Bot Start', '', '36.684', 100, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Bot Start\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(402, 1, 1254, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"5.88\",\"currency\":\"INR\"}', 142, 402, '2', '1', 'Telegram - Post Views S2 [ Last 5 Post ]', '', '7.056', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram - Post Views S2 [ Last 5 Post ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(403, 1, 1255, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"10.58\",\"currency\":\"INR\"}', 142, 403, '2', '1', 'Telegram - Post Views S2 [ Last 10 Post ]', '', '12.696', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram - Post Views S2 [ Last 10 Post ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(404, 1, 1256, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"18.81\",\"currency\":\"INR\"}', 142, 404, '2', '1', 'Telegram - Post Views S2 [ Last 20 Post ]', '', '22.572', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram - Post Views S2 [ Last 20 Post ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(405, 1, 1257, '2', '{\"min\":\"10\",\"max\":\"10000000\",\"rate\":\"1.06\",\"currency\":\"INR\"}', 143, 405, '2', '1', 'Telegram Post Views Single Post [ INSTANT ]', '', '1.272', 10, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views Single Post [ INSTANT ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(406, 1, 1258, '2', '{\"min\":\"10\",\"max\":\"500000\",\"rate\":\"1.06\",\"currency\":\"INR\"}', 143, 406, '2', '1', 'Telegram Post Views [ 1 Post ]', '', '1.272', 10, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views [ 1 Post ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(407, 1, 1259, '2', '{\"min\":\"10\",\"max\":\"10000000\",\"rate\":\"4.70\",\"currency\":\"INR\"}', 143, 407, '2', '1', 'Post Views [Last 5 posts] [Instant]', '', '5.64', 10, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Post Views [Last 5 posts] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(408, 1, 1260, '2', '{\"min\":\"10\",\"max\":\"10000000\",\"rate\":\"9.40\",\"currency\":\"INR\"}', 143, 408, '2', '1', 'Post Views [Last 10 posts] [Instant]', '', '11.28', 10, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Post Views [Last 10 posts] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(409, 1, 1261, '2', '{\"min\":\"10\",\"max\":\"10000000\",\"rate\":\"18.79\",\"currency\":\"INR\"}', 143, 409, '2', '1', 'Post Views [Last 20 posts] [Instant]', '', '22.548', 10, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Post Views [Last 20 posts] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(410, 1, 1262, '2', '{\"min\":\"10\",\"max\":\"10000000\",\"rate\":\"42.27\",\"currency\":\"INR\"}', 143, 410, '2', '1', 'Post Views [Last 50 posts] [Instant]', '', '50.724', 10, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Post Views [Last 50 posts] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(411, 1, 1263, '2', '{\"min\":\"10\",\"max\":\"10000000\",\"rate\":\"71.61\",\"currency\":\"INR\"}', 143, 411, '2', '1', 'Post Views [Last 100 posts] [Instant]', '', '85.932', 10, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Post Views [Last 100 posts] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(412, 1, 1264, '2', '{\"min\":\"10\",\"max\":\"10000000\",\"rate\":\"118.57\",\"currency\":\"INR\"}', 143, 412, '2', '1', 'Post Views [Last 200 posts] [Instant]', '', '142.284', 10, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Post Views [Last 200 posts] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(413, 1, 1265, '2', '{\"min\":\"10\",\"max\":\"10000000\",\"rate\":\"266.48\",\"currency\":\"INR\"}', 143, 413, '2', '1', 'Post Views [Last 500 posts] [Instant]', '', '319.776', 10, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Post Views [Last 500 posts] [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(414, 1, 1267, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"4.71\",\"currency\":\"INR\"}', 143, 414, '2', '1', 'Telegram Post Views [Last 5] include Statistics 📊 [𝗦𝘁𝗮𝗯𝗹𝗲]', '', '5.652', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views [Last 5] include Statistics \\ud83d\\udcca [\\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddef\\ud835\\uddf9\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(415, 1, 1268, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"9.41\",\"currency\":\"INR\"}', 143, 415, '2', '1', 'Telegram Post Views [Last 10] include Statistics 📊 [𝗦𝘁𝗮𝗯𝗹𝗲]', '', '11.292', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views [Last 10] include Statistics \\ud83d\\udcca [\\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddef\\ud835\\uddf9\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(416, 1, 1269, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"17.64\",\"currency\":\"INR\"}', 143, 416, '2', '1', 'Telegram Post Views [Last 20] include Statistics 📊 [𝗦𝘁𝗮𝗯𝗹𝗲]', '', '21.168', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views [Last 20] include Statistics \\ud83d\\udcca [\\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddef\\ud835\\uddf9\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(417, 1, 1270, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"28.21\",\"currency\":\"INR\"}', 143, 417, '2', '1', 'Telegram Post Views [Last 30] include Statistics 📊 [𝗦𝘁𝗮𝗯𝗹𝗲]', '', '33.852', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views [Last 30] include Statistics \\ud83d\\udcca [\\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddef\\ud835\\uddf9\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(418, 1, 1271, '2', '{\"min\":\"1000\",\"max\":\"40000\",\"rate\":\"43.49\",\"currency\":\"INR\"}', 143, 418, '2', '1', 'Telegram Post Views [Last 50] include Statistics 📊 [𝗦𝘁𝗮𝗯𝗹𝗲]', '', '52.188', 1000, 40000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views [Last 50] include Statistics \\ud83d\\udcca [\\ud835\\udde6\\ud835\\ude01\\ud835\\uddee\\ud835\\uddef\\ud835\\uddf9\\ud835\\uddf2]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(419, 1, 1310, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"174.92\",\"currency\":\"INR\"}', 144, 419, '2', '1', 'Russian 🇷🇺 [Zero drop ] members [80k]', '', '209.904', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Russian \\ud83c\\uddf7\\ud83c\\uddfa [Zero drop ] members [80k]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(420, 1, 1311, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"8.23\",\"currency\":\"INR\"}', 144, 420, '2', '1', 'Telegram Post Views [ last 5 ]', '', '9.876', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views [ last 5 ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(421, 1, 1312, '2', '{\"min\":\"100\",\"max\":\"500000\",\"rate\":\"17.64\",\"currency\":\"INR\"}', 144, 421, '2', '1', 'Telegram Post Views [ last 10 ]', '', '21.168', 100, 500000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views [ last 10 ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(422, 1, 650, '2', '{\"min\":\"100\",\"max\":\"2147483647\",\"rate\":\"2.02\",\"currency\":\"INR\"}', 145, 422, '2', '1', 'Twitter-X Bundle Impression ( Views - Impression - Detail Expand- Profile Click  )', '', '2.424', 100, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter-X Bundle Impression ( Views - Impression - Detail Expand- Profile Click  )\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(423, 1, 651, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"7.51\",\"currency\":\"INR\"}', 145, 423, '2', '1', 'Twitter-X Tweet Views', '', '9.012', 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter-X Tweet Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(424, 1, 652, '2', '{\"min\":\"100\",\"max\":\"2147483647\",\"rate\":\"2.02\",\"currency\":\"INR\"}', 145, 424, '2', '1', 'Twitter-X Video Views', '', '2.424', 100, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter-X Video Views\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(425, 1, 653, '2', '{\"min\":\"100\",\"max\":\"2147483647\",\"rate\":\"2.02\",\"currency\":\"INR\"}', 145, 425, '2', '1', 'Twitter-X Impressions Engagements [Instant]', '', '2.424', 100, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter-X Impressions Engagements [Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(426, 1, 654, '2', '{\"min\":\"100\",\"max\":\"2147483647\",\"rate\":\"0.84\",\"currency\":\"INR\"}', 145, 426, '2', '1', 'Twitter-X New Followers İmpression', '', '1.008', 100, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter-X New Followers \\u0130mpression\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(427, 1, 655, '2', '{\"min\":\"100\",\"max\":\"2147483647\",\"rate\":\"0.84\",\"currency\":\"INR\"}', 145, 427, '2', '1', 'Twitter-X  Detail Click', '', '1.008', 100, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter-X  Detail Click\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(428, 1, 656, '2', '{\"min\":\"100\",\"max\":\"2147483647\",\"rate\":\"0.84\",\"currency\":\"INR\"}', 145, 428, '2', '1', 'Twitter - X Profile Click', '', '1.008', 100, 2147483647, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter - X Profile Click\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(429, 1, 1415, '2', '{\"min\":\"100\",\"max\":\"30000\",\"rate\":\"195.20\",\"currency\":\"INR\"}', 146, 429, '2', '1', 'Twitter Followers - [ Max - 50k ] [ 30 Days Refill ] INSTANT', '', '234.24', 100, 30000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Followers - [ Max - 50k ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(430, 1, 1323, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"246.84\",\"currency\":\"INR\"}', 146, 430, '2', '1', 'Twitter Followers - [ Max - 100k ] [ Less Drop, 30 Days Refill ] INSTANT', '', '296.208', 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Followers - [ Max - 100k ] [ Less Drop, 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(431, 1, 1324, '2', '{\"min\":\"50\",\"max\":\"25000\",\"rate\":\"1692.55\",\"currency\":\"INR\"}', 146, 431, '2', '1', 'Twitter Followers - ACTIVE Users 100% REAL Lifetime', '', '2031.06', 50, 25000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Followers - ACTIVE Users 100% REAL Lifetime\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(432, 1, 1325, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"916.82\",\"currency\":\"INR\"}', 146, 432, '2', '1', 'Twitter Followers - [ 100% NON DROP ] [ REAL, 1000/day ] [ 60 Days Refill ] INSTANT', '', '1100.184', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Followers - [ 100% NON DROP ] [ REAL, 1000\\/day ] [ 60 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(433, 1, 1326, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"214.01\",\"currency\":\"INR\"}', 146, 433, '2', '1', 'Twitter Followers [30 Days Refill] [Fast Delivery] [Instant Start]', '', '256.812', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Followers [30 Days Refill] [Fast Delivery] [Instant Start]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(434, 1, 1327, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"352.63\",\"currency\":\"INR\"}', 147, 434, '2', '1', '🇺🇸 Twitter USA Followers - [ Max - 10k ] [ 500/day ] [ 30 Days Refill ] INSTANT', '', '423.156', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddf8 Twitter USA Followers - [ Max - 10k ] [ 500\\/day ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(435, 1, 1328, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"182.19\",\"currency\":\"INR\"}', 147, 435, '2', '1', '🇺🇸 Twitter USA Likes - [ Max - 10k ] [ 500/day ] [ 30 Days Refil ] INSTANT', '', '218.628', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddf8 Twitter USA Likes - [ Max - 10k ] [ 500\\/day ] [ 30 Days Refil ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(436, 1, 1329, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"305.61\",\"currency\":\"INR\"}', 147, 436, '2', '1', '🇺🇸 Twitter USA Retweets - [ Max - 5k ] [ 500-100/day ] [ 30 Days Refill ] INSTANT', '', '366.732', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddf8 Twitter USA Retweets - [ Max - 5k ] [ 500-100\\/day ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(437, 1, 1416, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"57.96\",\"currency\":\"INR\"}', 148, 437, '2', '1', 'Twitter Likes - Less Drop - No Refill - Instant', '', '69.552', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Likes - Less Drop - No Refill - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(438, 1, 1330, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"305.61\",\"currency\":\"INR\"}', 148, 438, '2', '1', 'Twitter Likes - [ Max - 5k ] [ 3-5k/day ] [ Non Drop, High Quality ] [ 30 Days Refill ] INSTANT', '', '366.732', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Likes - [ Max - 5k ] [ 3-5k\\/day ] [ Non Drop, High Quality ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(439, 1, 1331, '2', '{\"min\":\"20\",\"max\":\"100000\",\"rate\":\"775.77\",\"currency\":\"INR\"}', 149, 439, '2', '1', 'Twitter Retweets | Active Users 100% REAL | Lifetime Warranty', '', '930.924', 20, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Retweets | Active Users 100% REAL | Lifetime Warranty\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(440, 1, 1332, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"235.09\",\"currency\":\"INR\"}', 149, 440, '2', '1', 'Twiiter Retweets [ Max - 5k ] [  300-500/day ] [ 30 days refill ] INSTANT', '', '282.108', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twiiter Retweets [ Max - 5k ] [  300-500\\/day ] [ 30 days refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(441, 1, 1333, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"1833.64\",\"currency\":\"INR\"}', 149, 441, '2', '3', 'Twitter Tweets (0-2 Hr)', '', '2200.368', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Tweets (0-2 Hr)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(442, 1, 1334, '2', '{\"min\":\"50\",\"max\":\"50000000\",\"rate\":\"141.05\",\"currency\":\"INR\"}', 150, 442, '2', '1', 'Twitter Mentions (USER FOLLOWERS)', '', '169.26', 50, 50000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Mentions (USER FOLLOWERS)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(443, 1, 1335, '2', '{\"min\":\"200\",\"max\":\"50000\",\"rate\":\"141.05\",\"currency\":\"INR\"}', 150, 443, '2', '1', 'Twitter Hashtag Mention', '', '169.26', 200, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Hashtag Mention\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(444, 1, 1336, '2', '{\"min\":\"200\",\"max\":\"1000\",\"rate\":\"211.58\",\"currency\":\"INR\"}', 150, 444, '2', '1', 'Twitter Likes Mention- Username', '', '253.896', 200, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Likes Mention- Username\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(445, 1, 1337, '2', '{\"min\":\"200\",\"max\":\"1000\",\"rate\":\"211.58\",\"currency\":\"INR\"}', 150, 445, '2', '1', 'Twitter RT Mention- Username', '', '253.896', 200, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter RT Mention- Username\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(446, 1, 1338, '2', '{\"min\":\"20\",\"max\":\"10000000\",\"rate\":\"141.05\",\"currency\":\"INR\"}', 150, 446, '2', '1', 'Twitter Custom Mention [ 50 K]', '', '169.26', 20, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Custom Mention [ 50 K]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(447, 1, 1339, '2', '{\"min\":\"20\",\"max\":\"50000\",\"rate\":\"1269.44\",\"currency\":\"INR\"}', 150, 447, '2', '1', 'Twitter Single Person Mention (Username)', '', '1523.328', 20, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Single Person Mention (Username)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(448, 1, 1340, '2', '{\"min\":\"20\",\"max\":\"50000\",\"rate\":\"987.35\",\"currency\":\"INR\"}', 150, 448, '2', '1', 'Twitter Mention Five Person (Username)', '', '1184.82', 20, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Mention Five Person (Username)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(449, 1, 1341, '2', '{\"min\":\"20\",\"max\":\"50000\",\"rate\":\"1128.39\",\"currency\":\"INR\"}', 150, 449, '2', '1', 'Twitter Single Person Mention (Custom List)', '', '1354.068', 20, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Single Person Mention (Custom List)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(450, 1, 1342, '2', '{\"min\":\"20\",\"max\":\"50000\",\"rate\":\"846.30\",\"currency\":\"INR\"}', 150, 450, '2', '1', 'Twitter Five Person Mention (Custom List)', '', '1015.56', 20, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Five Person Mention (Custom List)\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(451, 1, 154, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"2.02\",\"currency\":\"INR\"}', 151, 451, '2', '1', 'Twitter Video Views + Impressions - Super Fast', '', '2.424', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Video Views + Impressions - Super Fast\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(452, 1, 155, '2', '{\"min\":\"50\",\"max\":\"100000000\",\"rate\":\"4.04\",\"currency\":\"INR\"}', 151, 452, '2', '1', 'Twitter Video Views - Super Fast - Cancel Button', '', '4.848', 50, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Video Views - Super Fast - Cancel Button\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(453, 1, 156, '2', '{\"min\":\"100\",\"max\":\"100000\",\"rate\":\"36.27\",\"currency\":\"INR\"}', 151, 453, '2', '1', 'Twitter Poll Votes - Lifetime Guarantee - Instant', '', '43.524', 100, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Poll Votes - Lifetime Guarantee - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(454, 1, 157, '2', '{\"min\":\"100\",\"max\":\"1000000000\",\"rate\":\"23.19\",\"currency\":\"INR\"}', 151, 454, '2', '1', 'Twitter Impressions - Lifetime Guarantee - Instant', '', '27.828', 100, 1000000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Impressions - Lifetime Guarantee - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(455, 1, 158, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"23.18\",\"currency\":\"INR\"}', 151, 455, '2', '1', 'Twitter Media Views - Lifetime Guarantee - Instant', '', '27.816', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Media Views - Lifetime Guarantee - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(456, 1, 159, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"23.18\",\"currency\":\"INR\"}', 151, 456, '2', '1', 'Twitter Details Click - Lifetime Guarantee - Instant', '', '27.816', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Details Click - Lifetime Guarantee - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(457, 1, 160, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"23.18\",\"currency\":\"INR\"}', 151, 457, '2', '1', 'Twitter Profile Click - Lifetime Guarantee - Instant', '', '27.816', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Profile Click - Lifetime Guarantee - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(458, 1, 161, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"23.18\",\"currency\":\"INR\"}', 151, 458, '2', '1', 'Twitter Hashtag Click - Lifetime Guarantee - Instant', '', '27.816', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Hashtag Click - Lifetime Guarantee - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(459, 1, 162, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"23.18\",\"currency\":\"INR\"}', 151, 459, '2', '1', 'Twitter Link Click - Lifetime Guarantee - Instant', '', '27.816', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Twitter Link Click - Lifetime Guarantee - Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(460, 1, 1363, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"183.37\",\"currency\":\"INR\"}', 152, 460, '2', '1', 'Tiktok Followers - [ Max - 100k ] [ 500/day ] [ 30 Days Refill ] INSTANT', '', '220.044', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Tiktok Followers - [ Max - 100k ] [ 500\\/day ] [ 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(461, 1, 1364, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"163.39\",\"currency\":\"INR\"}', 152, 461, '2', '1', 'Tiktok Followers [Real] [No Drop] [3-5K/D/] [0-1/H]', '', '196.068', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Tiktok Followers [Real] [No Drop] [3-5K\\/D\\/] [0-1\\/H]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(462, 1, 1365, '2', '{\"min\":\"10\",\"max\":\"400000\",\"rate\":\"117.55\",\"currency\":\"INR\"}', 152, 462, '2', '1', 'Tiktok Followers [ Max - 500k ] [ 10k/day ] INSTANT', '', '141.06', 10, 400000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Tiktok Followers [ Max - 500k ] [ 10k\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(463, 1, 1366, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"27.04\",\"currency\":\"INR\"}', 153, 463, '2', '1', 'TikTok Likes - [ Max - 100k ] [ 100k/day ] [ REAL, No Refill ] INSTANT', '', '32.448', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Likes - [ Max - 100k ] [ 100k\\/day ] [ REAL, No Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(464, 1, 1367, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"49.37\",\"currency\":\"INR\"}', 153, 464, '2', '1', 'Tiktok Likes - ] [ 10k-20k ] 30 Days Refill ] INSTANT', '', '59.244', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Tiktok Likes - ] [ 10k-20k ] 30 Days Refill ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(465, 1, 1368, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"25.87\",\"currency\":\"INR\"}', 153, 465, '2', '1', 'Tiktok Likes [ Max - 500k ] [ 10k/day ] INSTANT', '', '31.044', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Tiktok Likes [ Max - 500k ] [ 10k\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(466, 1, 1369, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"48.20\",\"currency\":\"INR\"}', 153, 466, '2', '1', 'Tiktok Likes [No Drop] [30 Days Refill] [50-100K/D] [Instant]', '', '57.84', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Tiktok Likes [No Drop] [30 Days Refill] [50-100K\\/D]\\u00a0[Instant]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(467, 1, 481, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"1.77\",\"currency\":\"INR\"}', 154, 467, '2', '1', 'Tiktok Views - ( Cheap ) ( 10M/day )', '', '2.124', 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Tiktok Views - ( Cheap ) ( 10M\\/day )\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(468, 1, 1370, '2', '{\"min\":\"50\",\"max\":\"20000\",\"rate\":\"1528.03\",\"currency\":\"INR\"}', 154, 468, '2', '1', ' SEO TikTok Views and Likes from Search ( put link of the video )', '', '1833.636', 50, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\u00a0SEO TikTok Views and Likes from Search ( put link of the video )\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(469, 1, 1371, '2', '{\"min\":\"50\",\"max\":\"20000\",\"rate\":\"1175.41\",\"currency\":\"INR\"}', 154, 469, '2', '1', 'SEO TikTok Views and Likes from Search for all videos in the account ( put username )', '', '1410.492', 50, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"SEO TikTok Views and Likes from Search for all videos in the account ( put username )\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(470, 1, 1372, '2', '{\"min\":\"5\",\"max\":\"1000\",\"rate\":\"705.25\",\"currency\":\"INR\"}', 155, 470, '2', '1', 'Tiktok Random Comments [ Max - 10k ] [ Real ] [ 50-100/day ] INSTANT', '', '846.3', 5, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Tiktok Random Comments [ Max - 10k ] [ Real ] [ 50-100\\/day ] INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(471, 1, 1373, '2', '{\"min\":\"50\",\"max\":\"100000\",\"rate\":\"1.18\",\"currency\":\"INR\"}', 156, 471, '2', '1', 'TikTok Saves [Max: 20K] [Refill: 30 Days] [Start Time: 1 Hour] [Speed: 20K/Day] 💧♻️', '', '1.416', 50, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Saves [Max: 20K] [Refill: 30 Days] [Start Time: 1 Hour] [Speed: 20K\\/Day] \\ud83d\\udca7\\u267b\\ufe0f\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(472, 1, 1374, '2', '{\"min\":\"10\",\"max\":\"10000\",\"rate\":\"74.06\",\"currency\":\"INR\"}', 157, 472, '2', '1', 'TikTok Live Stream Views {15 Minutes} {MQ] #BoostTik', '', '88.872', 10, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Live Stream Views {15 Minutes} {MQ] #BoostTik\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(473, 1, 1375, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"148.11\",\"currency\":\"INR\"}', 157, 473, '2', '1', 'TikTok Live Stream Views {30 Minutes} {MQ] #BoostTik', '', '177.732', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Live Stream Views {30 Minutes} {MQ] #BoostTik\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(474, 1, 1376, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"296.21\",\"currency\":\"INR\"}', 157, 474, '2', '1', 'TikTok Live Stream Views {60 Minutes} {MQ] #BoostTik', '', '355.452', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Live Stream Views {60 Minutes} {MQ] #BoostTik\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(475, 1, 1377, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"444.31\",\"currency\":\"INR\"}', 157, 475, '2', '1', 'TikTok Live Stream Views {90 Minutes} {MQ] #BoostTik', '', '533.172', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Live Stream Views {90 Minutes} {MQ] #BoostTik\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(476, 1, 1378, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"592.41\",\"currency\":\"INR\"}', 157, 476, '2', '1', 'TikTok Live Stream Views {120 Minutes} {MQ] #BoostTik', '', '710.892', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Live Stream Views {120 Minutes} {MQ] #BoostTik\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(477, 1, 1379, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"888.61\",\"currency\":\"INR\"}', 157, 477, '2', '1', 'TikTok Live Stream Views {180 Minutes} {MQ] #BoostTik', '', '1066.332', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Live Stream Views {180 Minutes} {MQ] #BoostTik\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(478, 1, 1380, '2', '{\"min\":\"10\",\"max\":\"20000\",\"rate\":\"1027.31\",\"currency\":\"INR\"}', 157, 478, '2', '1', 'TikTok Live Stream Views {240 Minutes} {MQ] #BoostTik', '', '1232.772', 10, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"TikTok Live Stream Views {240 Minutes} {MQ] #BoostTik\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(479, 1, 1381, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"367.91\",\"currency\":\"INR\"}', 158, 479, '2', '1', 'Live Viewers TikTok [Stay 15 Minutes] [⚡Instant] [⭐Guaranteed Direct]', '', '441.492', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [Stay 15 Minutes] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(480, 1, 1382, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"734.63\",\"currency\":\"INR\"}', 158, 480, '2', '1', 'Live Viewers TikTok [Stay 30 Minutes] [⚡Instant] [⭐Guaranteed Direct]', '', '881.556', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [Stay 30 Minutes] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(481, 1, 1383, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"1444.58\",\"currency\":\"INR\"}', 158, 481, '2', '1', 'Live Viewers TikTok [1 hour] [⚡Instant] [⭐Guaranteed Direct]', '', '1733.496', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [1 hour] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(482, 1, 1384, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"2156.87\",\"currency\":\"INR\"}', 158, 482, '2', '1', 'Live Viewers TikTok [1.5 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '2588.244', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [1.5 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(483, 1, 1385, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"2919.71\",\"currency\":\"INR\"}', 158, 483, '2', '1', 'Live Viewers TikTok [2 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '3503.652', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [2 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(484, 1, 1386, '2', '{\"min\":\"10\",\"max\":\"5000\",\"rate\":\"4189.15\",\"currency\":\"INR\"}', 158, 484, '2', '1', 'Live Viewers TikTok [3 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '5026.98', 10, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [3 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(485, 1, 1387, '2', '{\"min\":\"20\",\"max\":\"5000\",\"rate\":\"7315.21\",\"currency\":\"INR\"}', 158, 485, '2', '1', 'Live Viewers TikTok [4 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '8778.252', 20, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [4 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(486, 1, 1388, '2', '{\"min\":\"20\",\"max\":\"5000\",\"rate\":\"9795.91\",\"currency\":\"INR\"}', 158, 486, '2', '1', 'Live Viewers TikTok [6 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '11755.092', 20, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [6 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(487, 1, 1389, '2', '{\"min\":\"20\",\"max\":\"5000\",\"rate\":\"23336.97\",\"currency\":\"INR\"}', 158, 487, '2', '1', 'Live Viewers TikTok [24 hours] [⚡Instant] [⭐Guaranteed Direct]', '', '28004.364', 20, 5000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Live Viewers TikTok [24 hours] [\\u26a1Instant] [\\u2b50Guaranteed Direct]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(488, 1, 502, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"1.68\",\"currency\":\"INR\"}', 159, 488, '2', '1', 'Telegram Single Post Views - [ Super Fast ] Instant', '', '2.016', 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Single Post Views - [ Super Fast ] Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(489, 1, 503, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"1.68\",\"currency\":\"INR\"}', 159, 489, '2', '1', 'Telegram Post Views - [Last 1 Post ] Instant', '', '2.016', 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Telegram Post Views - [Last 1 Post ] Instant\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(490, 1, 404, '2', '{\"min\":\"10\",\"max\":\"50000\",\"rate\":\"280.39\",\"currency\":\"INR\"}', 160, 490, '2', '1', '🇮🇳 Telegram Indian Members -  INSTANT', '', '336.468', 10, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddee\\ud83c\\uddf3 Telegram Indian Members -  INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(491, 1, 405, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"168.18\",\"currency\":\"INR\"}', 160, 491, '2', '1', '🇨🇳 Telegram Chinese Members - INSTANT', '', '201.816', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\udde8\\ud83c\\uddf3 Telegram Chinese Members - INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(492, 1, 403, '2', '{\"min\":\"500\",\"max\":\"100000\",\"rate\":\"176.35\",\"currency\":\"INR\"}', 160, 492, '2', '1', '🇺🇸 Telegram USA Members - INSTANT', '', '211.62', 500, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83c\\uddfa\\ud83c\\uddf8 Telegram USA Members - INSTANT\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(493, 1, 683, '2', '{\"min\":\"20\",\"max\":\"2000\",\"rate\":\"4584.08\",\"currency\":\"INR\"}', 161, 493, '2', '1', 'LinkedIn Costum Comments -  [ USA ] [ Max 5k ] [ HQ ]', '', '5500.896', 20, 2000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Costum Comments -  [ USA ] [ Max 5k ] [ HQ ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(494, 1, 684, '2', '{\"min\":\"5\",\"max\":\"300\",\"rate\":\"19981.89\",\"currency\":\"INR\"}', 161, 494, '2', '1', 'LinkedIn Comments Random real users ✅', '', '23978.268', 5, 300, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Comments Random real users \\u2705\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(495, 1, 685, '2', '{\"min\":\"5\",\"max\":\"300\",\"rate\":\"22920.40\",\"currency\":\"INR\"}', 161, 495, '2', '3', 'LinkedIn Comments Custom real users ✅', '', '27504.48', 5, 300, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Comments Custom real users \\u2705\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0');
INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`, `time_lang`, `time`, `cancelbutton`, `show_refill`, `service_profit`, `refill_days`, `refill_hours`, `avg_days`, `avg_hours`, `avg_minutes`, `avg_many`, `price_profit`, `service_overflow`, `service_sync`, `service_deleted`) VALUES
(496, 1, 124, '2', '{\"min\":\"50\",\"max\":\"50000\",\"rate\":\"2071.22\",\"currency\":\"INR\"}', 161, 496, '2', '1', 'LinkedIn Shares [Real USA] [No Drop] [Lifetime] [100-200/D] [0-24/H]', '', '2485.464', 50, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Shares [Real USA] [No Drop] [Lifetime] [100-200\\/D] [0-24\\/H]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(497, 1, 125, '2', '{\"min\":\"20\",\"max\":\"1500\",\"rate\":\"10844.63\",\"currency\":\"INR\"}', 161, 497, '2', '1', 'LinkedIn Connections - [ Lifetime ] [ No Drop ] [ 5/day ] 0-24 Hrs', '', '13013.556', 20, 1500, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Connections - [ Lifetime ] [ No Drop ] [ 5\\/day ] 0-24 Hrs\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(498, 1, 126, '2', '{\"min\":\"50\",\"max\":\"10000\",\"rate\":\"2815.94\",\"currency\":\"INR\"}', 161, 498, '2', '1', 'LinkedIn Connections - [ 50-100/day ] 0-24 Hrs', '', '3379.128', 50, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Connections - [ 50-100\\/day ] 0-24 Hrs\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(499, 1, 127, '2', '{\"min\":\"50\",\"max\":\"20000\",\"rate\":\"2521.25\",\"currency\":\"INR\"}', 161, 499, '2', '1', 'LinkedIn Profile Followers -  [ World Wide ] [ 60 Days Refill ] [ 100-300/day ]  0-8 Hrs', '', '3025.5', 50, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Profile Followers -  [ World Wide ] [ 60 Days Refill ] [ 100-300\\/day ]  0-8 Hrs\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(500, 1, 128, '2', '{\"min\":\"50\",\"max\":\"20000\",\"rate\":\"2521.25\",\"currency\":\"INR\"}', 161, 500, '2', '1', 'LinkedIn Company Page Followers -  [ World Wide ] [ 60 Days Refill ] [ 100-300/day ] 0-8 Hrs', '', '3025.5', 50, 20000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Company Page Followers -  [ World Wide ] [ 60 Days Refill ] [ 100-300\\/day ] 0-8 Hrs\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(501, 1, 129, '2', '{\"min\":\"100\",\"max\":\"50000\",\"rate\":\"840.42\",\"currency\":\"INR\"}', 161, 501, '2', '1', 'LinkedIn Profile Followers - [ USA ] [ 60 Days Refill ] [ 100-300/day ] 0-8 Hrs', '', '1008.504', 100, 50000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Profile Followers - [ USA ] [ 60 Days Refill ] [ 100-300\\/day ] 0-8 Hrs\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(502, 1, 131, '2', '{\"min\":\"20\",\"max\":\"10000\",\"rate\":\"2292.04\",\"currency\":\"INR\"}', 161, 502, '2', '1', 'LinkedIn Share - [ Shares ] [', '', '2750.448', 20, 10000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"LinkedIn Share - [ Shares ] [\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(503, 1, 169, '2', '{\"min\":\"500\",\"max\":\"10000000\",\"rate\":\"67.67\",\"currency\":\"INR\"}', 162, 503, '2', '1', 'Spotify Real Playlist Plays - [ 5k-10k/day ] [ High Quality ]', '', '81.204', 500, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Real Playlist Plays - [ 5k-10k\\/day ] [ High Quality ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(504, 1, 175, '2', '{\"min\":\"500\",\"max\":\"10000000\",\"rate\":\"43.66\",\"currency\":\"INR\"}', 162, 504, '2', '1', 'Spotify USA Plays - [ 5k/day ] [ Non Drop ]', '', '52.392', 500, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify USA Plays - [ 5k\\/day ] [ Non Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(505, 1, 1360, '2', '{\"min\":\"500\",\"max\":\"10000000\",\"rate\":\"23.51\",\"currency\":\"INR\"}', 162, 505, '2', '1', 'Spotify Plays - [ 5-10k/day ] [ Non Drop ] [ WorldWide ]', '', '28.212', 500, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays - [ 5-10k\\/day ] [ Non Drop ] [ WorldWide ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(506, 1, 1362, '2', '{\"min\":\"500\",\"max\":\"10000000\",\"rate\":\"35.27\",\"currency\":\"INR\"}', 162, 506, '2', '1', 'Spotify USA Plays - [ 1k/day ] [ Non Drop ]', '', '42.324', 500, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify USA Plays - [ 1k\\/day ] [ Non Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(507, 1, 1498, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"23.36\",\"currency\":\"INR\"}', 163, 507, '2', '1', 'Spotify Followers (User/Playlist/Artist) - [ Max 100M ] [ 365 Day Refill ]', '', '28.032', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Followers (User\\/Playlist\\/Artist) - [ Max 100M ] [ 365 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(508, 1, 1499, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"29.20\",\"currency\":\"INR\"}', 163, 508, '2', '1', 'Spotify Save & Followers - Max 100M', '', '35.04', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Save & Followers - Max 100M\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(509, 1, 1518, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 509, '2', '1', 'Spotify USA Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify USA Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(510, 1, 1519, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 510, '2', '1', 'Spotify Turkey Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Turkey Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(511, 1, 1520, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 511, '2', '1', 'Spotify Italy Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Italy Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(512, 1, 1521, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 512, '2', '1', 'Spotify Brazil Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Brazil Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(513, 1, 1522, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 513, '2', '1', 'Spotify Russia Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Russia Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(514, 1, 1523, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 514, '2', '1', 'Spotify France Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify France Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(515, 1, 1524, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 515, '2', '1', 'Spotify Germany Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Germany Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(516, 1, 1525, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 516, '2', '1', 'Spotify UK Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify UK Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(517, 1, 1526, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 517, '2', '1', 'Spotify Canada Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Canada Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(518, 1, 1527, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 518, '2', '1', 'Spotify Portugal Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Portugal Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(519, 1, 1528, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 519, '2', '1', 'Spotify Sweden Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Sweden Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(520, 1, 1529, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 520, '2', '1', 'Spotify Mexico Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Mexico Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(521, 1, 1530, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 521, '2', '1', 'Spotify South Korea Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify South Korea Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(522, 1, 1531, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 522, '2', '1', 'Spotify India Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify India Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(523, 1, 1532, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"37.38\",\"currency\":\"INR\"}', 164, 523, '2', '1', 'Spotify Nigeria Followers - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '44.856', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Nigeria Followers - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(524, 1, 1533, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 524, '2', '1', 'Spotify USA Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify USA Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(525, 1, 1534, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 525, '2', '1', 'Spotify Turkey Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Turkey Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(526, 1, 1535, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 526, '2', '1', 'Spotify Italy Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Italy Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(527, 1, 1536, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 527, '2', '1', 'Spotify Brazil Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Brazil Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(528, 1, 1537, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 528, '2', '1', 'Spotify Russia Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Russia Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(529, 1, 1538, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 529, '2', '1', 'Spotify France Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify France Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(530, 1, 1539, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 530, '2', '1', 'Spotify Germany Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Germany Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(531, 1, 1540, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 531, '2', '1', 'Spotify UK Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify UK Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(532, 1, 1541, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 532, '2', '1', 'Spotify Canada Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Canada Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(533, 1, 1542, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 533, '2', '1', 'Spotify Portugal Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Portugal Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(534, 1, 1543, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 534, '2', '1', 'Spotify Sweden Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Sweden Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(535, 1, 1544, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 535, '2', '1', 'Spotify Mexico Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Mexico Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(536, 1, 1545, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 536, '2', '1', 'Spotify South Korea Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify South Korea Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(537, 1, 1546, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 537, '2', '1', 'Spotify India Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify India Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(538, 1, 1547, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 165, 538, '2', '1', 'Spotify Nigeria Followers (Real Looking) - [ Max 100M ] [ 1M/Day ] [ 90 Day Refill ]', '', '53.256', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Nigeria Followers (Real Looking) - [ Max 100M ] [ 1M\\/Day ] [ 90 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(539, 1, 1500, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"22.19\",\"currency\":\"INR\"}', 166, 539, '2', '1', 'Spotify Saves - [ Max 100M ] - ULTRA CHEAP', '', '26.628', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Saves - [ Max 100M ] - ULTRA CHEAP\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(540, 1, 1501, '2', '{\"min\":\"20\",\"max\":\"100000000\",\"rate\":\"58.40\",\"currency\":\"INR\"}', 166, 540, '2', '1', 'Spotify Premium Saves - [ Max 100M ] - ULTRA CHEAP', '', '70.08', 20, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Premium Saves - [ Max 100M ] - ULTRA CHEAP\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(541, 1, 1502, '2', '{\"min\":\"20\",\"max\":\"1000000\",\"rate\":\"145.99\",\"currency\":\"INR\"}', 166, 541, '2', '1', 'Spotify Premium Saves - [ Max 1M ]', '', '175.188', 20, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Premium Saves - [ Max 1M ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(542, 1, 1503, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 542, '2', '1', 'Spotify USA Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify USA Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(543, 1, 1504, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 543, '2', '1', 'Spotify Turkey Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Turkey Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(544, 1, 1505, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 544, '2', '1', 'Spotify Italy Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Italy Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(545, 1, 1506, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 545, '2', '1', 'Spotify Brazil Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Brazil Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(546, 1, 1507, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 546, '2', '1', 'Spotify Russia Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Russia Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(547, 1, 1508, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 547, '2', '1', 'Spotify France Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify France Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(548, 1, 1509, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 548, '2', '1', 'Spotify Germany Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Germany Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(549, 1, 1510, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 549, '2', '1', 'Spotify UK Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify UK Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(550, 1, 1511, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 550, '2', '1', 'Spotify Canada Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Canada Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(551, 1, 1512, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 551, '2', '1', 'Spotify Portugal Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Portugal Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(552, 1, 1513, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 552, '2', '1', 'Spotify Sweden Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Sweden Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(553, 1, 1514, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 553, '2', '1', 'Spotify Mexico Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Mexico Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(554, 1, 1515, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 554, '2', '1', 'Spotify South Korea Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify South Korea Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(555, 1, 1516, '2', '{\"min\":\"100\",\"max\":\"10000000\",\"rate\":\"44.38\",\"currency\":\"INR\"}', 167, 555, '2', '1', 'Spotify India Saves - [ Max 100M ] [ 1M/Day ]', '', '53.256', 100, 10000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify India Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(556, 1, 1517, '2', '{\"min\":\"100\",\"max\":\"200000\",\"rate\":\"44.42\",\"currency\":\"INR\"}', 167, 556, '2', '1', 'Spotify Nigeria Saves - [ Max 100M ] [ 1M/Day ]', '', '53.304', 100, 200000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Nigeria Saves - [ Max 100M ] [ 1M\\/Day ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(557, 1, 178, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 557, '2', '1', 'Spotify Plays [AUSTRALIA]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [AUSTRALIA]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(558, 1, 179, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 558, '2', '1', 'Spotify Plays [AUSTRIA]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [AUSTRIA]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(559, 1, 180, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 559, '2', '1', 'Spotify Plays [BELGIUM]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [BELGIUM]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(560, 1, 181, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 560, '2', '1', 'Spotify Plays [BRAZIL]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [BRAZIL]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(561, 1, 182, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 561, '2', '1', 'Spotify Plays [CANADA]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [CANADA]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(562, 1, 183, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 562, '2', '1', 'Spotify Plays [COLUMBIA]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [COLUMBIA]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(563, 1, 184, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 563, '2', '1', 'Spotify Plays [COSTA RICA]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [COSTA RICA]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(564, 1, 185, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 564, '2', '1', 'Spotify Plays [DENMARK]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [DENMARK]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(565, 1, 186, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 565, '2', '1', 'Spotify Plays [FRANCE]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [FRANCE]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(566, 1, 187, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 566, '2', '1', 'Spotify Plays [GERMANY]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [GERMANY]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(567, 1, 188, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 567, '2', '1', 'Spotify Plays [ITALY]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [ITALY]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(568, 1, 189, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 568, '2', '1', 'Spotify Plays [ARGENTINA]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [ARGENTINA]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(569, 1, 190, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 569, '2', '1', 'Spotify Plays [IRLAND]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [IRLAND]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(570, 1, 191, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 570, '2', '1', 'Spotify Plays [MEXICO]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [MEXICO]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(571, 1, 192, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 571, '2', '1', 'Spotify Plays [NEW ZEALAND]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [NEW ZEALAND]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(572, 1, 193, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 572, '2', '1', 'Spotify Plays [NETHERLAND]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [NETHERLAND]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(573, 1, 194, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 573, '2', '1', 'Spotify Plays [PORTUGAL]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [PORTUGAL]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(574, 1, 195, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 574, '2', '1', 'Spotify Plays [SWITZERLAND]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [SWITZERLAND]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(575, 1, 196, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 575, '2', '1', 'Spotify Plays [SPAIN]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [SPAIN]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(576, 1, 197, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 576, '2', '1', 'Spotify Plays [SWEDEN]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [SWEDEN]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(577, 1, 198, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 577, '2', '1', 'Spotify Plays [SOUTH KOREA]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [SOUTH KOREA]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(578, 1, 199, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"130.98\",\"currency\":\"INR\"}', 168, 578, '2', '1', 'Spotify Plays [UK]', '', '157.176', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Plays [UK]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(579, 1, 1548, '2', '{\"min\":\"5\",\"max\":\"100000\",\"rate\":\"1168.10\",\"currency\":\"INR\"}', 169, 579, '2', '1', 'Spotify Add To Playlist - [ Max 10K ]', '', '1401.72', 5, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Add To Playlist - [ Max 10K ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(580, 1, 1549, '2', '{\"min\":\"10\",\"max\":\"100000\",\"rate\":\"1752.01\",\"currency\":\"INR\"}', 169, 580, '2', '1', 'Spotify Add To Playlist - PREMİUM SERVİCE [ Max 100K ]', '', '2102.412', 10, 100000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Spotify Add To Playlist - PREM\\u0130UM SERV\\u0130CE [ Max 100K ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(581, 1, 1559, '2', '{\"min\":\"1000\",\"max\":\"1000000\",\"rate\":\"157.38\",\"currency\":\"INR\"}', 170, 581, '2', '1', '📱 Mobile Traffic from Any Country [See Description]', '', '188.856', 1000, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"\\ud83d\\udcf1 Mobile Traffic from Any Country [See Description]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(582, 1, 704, '2', '{\"min\":\"100\",\"max\":\"1000000\",\"rate\":\"13.34\",\"currency\":\"INR\"}', 171, 582, '2', '1', 'Worldwide Traffic Website from Google.com [Real Organic]', '', '16.008', 100, 1000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Worldwide Traffic Website from Google.com [Real Organic]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(583, 1, 135, '2', '{\"min\":\"50\",\"max\":\"2000\",\"rate\":\"451.98\",\"currency\":\"INR\"}', 172, 583, '2', '1', 'Discord Online Members [For 3 Months] [500-1K/D] [0-12/H]', '', '542.376', 50, 2000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Discord Online Members [For 3 Months] [500-1K\\/D] [0-12\\/H]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(584, 1, 1421, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"29.20\",\"currency\":\"INR\"}', 173, 584, '2', '1', 'Quora.com Views - [ Max 100M ] [ No Drop ]', '', '35.04', 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Quora.com Views - [ Max 100M ] [ No Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(585, 1, 1418, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"1.17\",\"currency\":\"INR\"}', 174, 585, '2', '1', 'Soundcloud Plays - [ Max 100M ] [ 1M+/Day ] - Cheap Server', '', '1.404', 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Soundcloud Plays - [ Max 100M ] [ 1M+\\/Day ] - Cheap Server\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(586, 1, 1419, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"3.51\",\"currency\":\"INR\"}', 174, 586, '2', '1', 'Soundcloud Plays - [ Max 100M ] [ 10M+/Day ] [ 30 Day Refill ]', '', '4.212', 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Soundcloud Plays - [ Max 100M ] [ 10M+\\/Day ] [ 30 Day Refill ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'false', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0'),
(587, 1, 1420, '2', '{\"min\":\"100\",\"max\":\"100000000\",\"rate\":\"5.84\",\"currency\":\"INR\"}', 174, 587, '2', '1', 'Soundcloud Plays - [ Max 100M ] [ 100M+/Day ] [ Non Drop ]', '', '7.008', 100, 100000000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '{\"en\":\"Soundcloud Plays - [ Max 100M ] [ 100M+\\/Day ] [ Non Drop ]\"}', '{\"en\":\"\"}', 'Not enough data', 'Not enough data', '2', 'true', '', '30', '24', 0, 0, 0, 0, 20, 0, '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `currency` varchar(200) DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi',
  `status` enum('1','2') NOT NULL DEFAULT '2',
  `api_sync` enum('0','1') NOT NULL DEFAULT '1',
  `api_login_credentials` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` text DEFAULT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `site_base_currency` varchar(20) DEFAULT NULL,
  `site_currency_converter` tinyint(1) NOT NULL DEFAULT 0,
  `site_update_rates_automatically` int(11) NOT NULL DEFAULT 0,
  `last_updated_currency_rates` datetime DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text DEFAULT NULL,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_apimail` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `child_panel_nameservers` varchar(255) NOT NULL DEFAULT '{"ns1":"ns1.scriptlux.com","ns2":"ns2.scriptlux.com"}',
  `childpanel_price` double DEFAULT NULL,
  `snow_effect` enum('1','2') NOT NULL DEFAULT '2',
  `snow_colour` text NOT NULL,
  `promotion` enum('1','2') DEFAULT '2',
  `referral_commision` double NOT NULL,
  `referral_payout` double NOT NULL,
  `referral_status` enum('1','2') NOT NULL DEFAULT '1',
  `childpanel_selling` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> OFF , 2 -> ON',
  `tickets_per_user` double NOT NULL DEFAULT 5,
  `name_fileds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `skype_feilds` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `otp_login` enum('1','2','0') NOT NULL DEFAULT '0',
  `auto_deactivate_payment` enum('1','2') NOT NULL DEFAULT '1',
  `service_avg_time` enum('1','0') NOT NULL DEFAULT '0',
  `alert_orderfail` enum('1','2') NOT NULL DEFAULT '2',
  `alert_welcomemail` enum('1','2') NOT NULL DEFAULT '2',
  `freebalance` enum('1','2') NOT NULL DEFAULT '1',
  `freeamount` double DEFAULT 0,
  `alert_newmessage` enum('1','2') NOT NULL DEFAULT '1',
  `email_confirmation` enum('1','2') NOT NULL DEFAULT '2',
  `resend_max` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `fundstransfer_fees` varchar(10) NOT NULL,
  `permissions` text DEFAULT NULL,
  `fake_order_service_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `fake_order_min` int(11) DEFAULT NULL,
  `fake_order_max` int(11) DEFAULT NULL,
  `panel_orders` int(11) DEFAULT NULL,
  `panel_orders_pattern` varchar(255) NOT NULL DEFAULT '{"panel_orders_prefix":"","panel_orders_suffix":""}',
  `downloaded_category_icons` tinyint(1) NOT NULL DEFAULT 0,
  `summary_card_background_color` varchar(100) DEFAULT 'theme_colour',
  `google_login` varchar(100) NOT NULL DEFAULT '{"purchased":"1","status":"1"}',
  `services_average_time` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `site_base_currency`, `site_currency_converter`, `site_update_rates_automatically`, `last_updated_currency_rates`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_apimail`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `child_panel_nameservers`, `childpanel_price`, `snow_effect`, `snow_colour`, `promotion`, `referral_commision`, `referral_payout`, `referral_status`, `childpanel_selling`, `tickets_per_user`, `name_fileds`, `skype_feilds`, `otp_login`, `auto_deactivate_payment`, `service_avg_time`, `alert_orderfail`, `alert_welcomemail`, `freebalance`, `freeamount`, `alert_newmessage`, `email_confirmation`, `resend_max`, `status`, `fundstransfer_fees`, `permissions`, `fake_order_service_enabled`, `fake_order_min`, `fake_order_max`, `panel_orders`, `panel_orders_pattern`, `downloaded_category_icons`, `summary_card_background_color`, `google_login`, `services_average_time`) VALUES
(1, 'SocialGrowth24x7', 'World\'s affordable smm panel', 'Best and Cheap SMM Panel for Instagram, Tiktok, Facebook, Youtube and Twitter. Buy IG Reels views and Followers, Buy Instagram Likes, Views and Comments, Buy TikTok Likes and Followers, Buy Facebook Likes and Comments, Buy Youtube Likes, Views and Subscribers.', 'smm panel,smmpanel,SMM Panel India,SMM Panel Paytm,SMM Panel Cheap India,SMM Reseller Panel,SMM Reseller Panel India,Cheap SMM Panel,cheapest SMM panel,cheap SMM panel india,Cheapest SMM Reseller Panel,Cheapest SMM Panel Paytm,Cheapest SMM Panel Paytm,indian smm panel,IndianSMM Reseller Panel,Best SMM panel,Best SMM Panel India,Top SMM Panel', 'img/panel/9b70e8fe62e40c570a322f1b0b659098.png', 'SocialGrowth24x7', '', 'INR', 0, 0, NULL, 'img/panel/13682ac418603aa0966369d46bbf282f562acf47.png', 'en', 'Eternity', 'pink', '1', '', '', '', '', '1', '2', '1', '2', 0, 0, '', '', '', '', '0', '2', '2', '2', '2', '2', '2', 'bizimsms', '', '', '', '1', '', '', '2', '1', '2', '2', 'asc', 500, 2500, 10000, 15000, '{\"ns1\":\"ns1.puffxhost.com\",\"ns2\":\"ns2.puffxhost.com\"}', 500, '', '', '2', 10, 100, '2', '2', 9999999999, '2', '2', '0', '1', '1', '2', '2', '2', 0.9, '2', '2', 2, '0', '3', '{\"admin access\":{\"admin_access\":{\"name\":\"Admin Access\",\"value\":\"admin_access\"}},\"pages\":{\"users\":{\"name\":\"Users\",\"value\":\"users\"},\"services\":{\"name\":\"Services\",\"value\":\"services\"},\"update-prices\":{\"name\":\"Update Prices\",\"value\":\"update-prices\"},\"bulk\":{\"name\":\"Bulk Services Editor\",\"value\":\"bulk\"},\"bulkc\":{\"name\":\"Bulk Category Editor\",\"value\":\"services\"},\"synced-logs\":{\"name\":\"Seller Sync Logs\",\"value\":\"synced-logs\"},\"orders\":{\"name\":\"Orders\",\"value\":\"orders\"},\"subscriptions\":{\"name\":\"Subscriptions\",\"value\":\"subscriptions\"},\"dripfeed\":{\"name\":\"Dripfeed\",\"value\":\"dripfeed\"},\"tasks\":{\"name\":\"Order Refill and Cancel Tasks\",\"value\":\"tasks\"},\"payments\":{\"name\":\"Payments\",\"value\":\"payments\"},\"tickets\":{\"name\":\"Tickets\",\"value\":\"tickets\"}},\"additionals\":{\"additionals\":{\"name\":\"Additionals\",\"value\":\"additionals\"},\"referral\":{\"name\":\"Affiliates\",\"value\":\"referral\"},\"broadcast\":{\"name\":\"Broadcasts\",\"value\":\"broadcast\"},\"logs\":{\"name\":\"Panel Logs\",\"value\":\"logs\"},\"reports\":{\"name\":\"Reports\",\"value\":\"reports\"},\"videop\":{\"name\":\"Promotion\",\"value\":\"videop\"},\"coupon\":{\"name\":\"Coupons\",\"value\":\"coupon\"},\"child-panels\":{\"name\":\"Child Panels\",\"value\":\"child-panels\"},\"updates\":{\"name\":\"Updates\",\"value\":\"updates\"}},\"appearance\":{\"appearance\":{\"name\":\"Appearance\",\"value\":\"appearance\"},\"themes\":{\"name\":\"Themes\",\"value\":\"themes\"},\"new_year\":{\"name\":\"New Year\",\"value\":\"new_year\"},\"pages\":{\"name\":\"Pages\",\"value\":\"pages\"},\"news\":{\"name\":\"Announcements\",\"value\":\"news\"},\"meta\":{\"name\":\"Meta (SEO) Settings\",\"value\":\"meta\"},\"blog\":{\"name\":\"Blogs\",\"value\":\"blog\"},\"menu\":{\"name\":\"Menu\",\"value\":\"menu\"},\"inte\":{\"name\":\"Integrations\",\"value\":\"inte\"},\"language\":{\"name\":\"Languages\",\"value\":\"language\"},\"files\":{\"name\":\"Uploaded Images\",\"value\":\"files\"}},\"settings\":{\"settings\":{\"name\":\"Settings\",\"value\":\"settings\"},\"general_settings\":{\"name\":\"General Settings\",\"value\":\"general_settings\"},\"providers\":{\"name\":\"Sellers\",\"value\":\"providers\"},\"payments_settings\":{\"name\":\"Payment Methods\",\"value\":\"payments_settings\"},\"bank_accounts\":{\"name\":\"Bank Accounts\",\"value\":\"bank_accounts\"},\"modules\":{\"name\":\"Modules\",\"value\":\"modules\"},\"subject\":{\"name\":\"Support Settings\",\"value\":\"subject\"},\"payments_bonus\":{\"name\":\"Payment Bonuses\",\"value\":\"payments_bonus\"},\"currency-manager\":{\"name\":\"Site Currency Manager\",\"value\":\"currency-manager\"},\"alert_settings\":{\"name\":\"Notification Settings\",\"value\":\"alert_settings\"},\"site_count\":{\"name\":\"Fake Orders\",\"value\":\"site_count\"},\"manager\":{\"name\":\"Manager\",\"value\":\"manager\"}}}', 1, 1, 3, 14009, '{\"panel_orders_prefix\":\"\",\"panel_orders_suffix\":\"\"}', 0, 'theme_colour', '{\"purchased\":\"0\",\"status\":\"0\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sync_logs`
--

CREATE TABLE `sync_logs` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) NOT NULL,
  `api_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `task_api` int(11) DEFAULT NULL,
  `task_type` varchar(225) DEFAULT NULL,
  `task_status` varchar(225) DEFAULT 'pending',
  `task_response` text DEFAULT NULL,
  `task_created_at` datetime DEFAULT NULL,
  `task_updated_at` datetime DEFAULT NULL,
  `task_by` text DEFAULT NULL,
  `check_refill_status` int(11) DEFAULT NULL,
  `refill_orderid` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL,
  `last_modified` datetime NOT NULL,
  `newpage` text NOT NULL,
  `colour` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`, `last_modified`, `newpage`, `colour`) VALUES
(1, 'X Blur', 'xblur', '', '2023-11-07 09:29:47', '', '1'),
(2, 'SSMSUN', 'SMMSUN-New-V2', '', '2024-09-13 06:38:26', '', '2'),
(6, 'Pitchy', 'pitchy', '', '2024-09-13 07:05:31', '', '2'),
(5, 'United', 'united', '', '2024-09-13 07:01:28', '', '2'),
(3, 'Simplify', 'Simplify', '', '2024-09-13 03:42:40', '', '2'),
(4, 'msp', 'msp', '', '2024-09-13 04:06:54', '', '2'),
(7, 'Eternity', 'Eternity', '', '2024-09-13 07:08:11', '', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `client_id`, `subject`, `time`, `lastupdate_time`, `client_new`, `status`, `support_new`, `canmessage`) VALUES
(1, 3, 'Order', '2024-09-12 22:27:29', '2024-09-12 22:30:20', '1', 'answered', '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `readed` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ticket_reply`
--

INSERT INTO `ticket_reply` (`id`, `ticket_id`, `client_id`, `time`, `support`, `message`, `readed`) VALUES
(1, 1, 0, '2024-09-12 22:27:29', '1', 'Hi', '1'),
(2, 1, 0, '2024-09-12 22:30:20', '2', 'Thnx', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_subjects`
--

CREATE TABLE `ticket_subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `content` text DEFAULT NULL,
  `auto_reply` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ticket_subjects`
--

INSERT INTO `ticket_subjects` (`subject_id`, `subject`, `content`, `auto_reply`) VALUES
(1, 'Order', '', '0'),
(2, 'Payment', '', '0'),
(4, 'Complaint & Suggestion', '', '0'),
(6, 'Others', 'You will be answered within minutes', '1');

-- --------------------------------------------------------

--
-- Table structure for table `units_per_page`
--

CREATE TABLE `units_per_page` (
  `id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `page` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `units_per_page`
--

INSERT INTO `units_per_page` (`id`, `unit`, `page`) VALUES
(1, 50, 'clients'),
(2, 50, 'orders'),
(3, 50, 'payments'),
(4, 50, 'refill'),
(5, 50, 'bulk'),
(6, 8, 'services');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `u_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'Not enough data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_constants`
--
ALTER TABLE `admin_constants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulkedit`
--
ALTER TABLE `bulkedit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `childpanels`
--
ALTER TABLE `childpanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earn`
--
ALTER TABLE `earn`
  ADD PRIMARY KEY (`earn_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `General_options`
--
ALTER TABLE `General_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Mailforms`
--
ALTER TABLE `Mailforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `panel_categories`
--
ALTER TABLE `panel_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_info`
--
ALTER TABLE `panel_info`
  ADD PRIMARY KEY (`panel_id`);

--
-- Indexes for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD PRIMARY KEY (`methodId`),
  ADD KEY `methodId` (`methodId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`referral_id`);

--
-- Indexes for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  ADD PRIMARY KEY (`r_p_id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sync_logs`
--
ALTER TABLE `sync_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `units_per_page`
--
ALTER TABLE `units_per_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulkedit`
--
ALTER TABLE `bulkedit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `childpanels`
--
ALTER TABLE `childpanels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `earn`
--
ALTER TABLE `earn`
  MODIFY `earn_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `General_options`
--
ALTER TABLE `General_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `integrations`
--
ALTER TABLE `integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Mailforms`
--
ALTER TABLE `Mailforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications_popup`
--
ALTER TABLE `notifications_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14010;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=913;

--
-- AUTO_INCREMENT for table `panel_categories`
--
ALTER TABLE `panel_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_info`
--
ALTER TABLE `panel_info`
  MODIFY `panel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paymentmethods`
--
ALTER TABLE `paymentmethods`
  MODIFY `methodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral`
--
ALTER TABLE `referral`
  MODIFY `referral_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `referral_payouts`
--
ALTER TABLE `referral_payouts`
  MODIFY `r_p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53367;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=588;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sync_logs`
--
ALTER TABLE `sync_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units_per_page`
--
ALTER TABLE `units_per_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
