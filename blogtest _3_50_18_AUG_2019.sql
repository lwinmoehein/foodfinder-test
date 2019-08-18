-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 18, 2019 at 09:19 AM
-- Server version: 10.3.13-MariaDB-2
-- PHP Version: 7.2.19-0ubuntu0.19.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogtest`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone_no`, `password`, `profile_url`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'lwin Moe Hain', '09778673750', '$2y$10$1CdmCJddlTFQxiWtqgpHPOt6B7pyA7ZY03HSlYpfjiAgkXz7yk0im', 'http://www.google.com', NULL, '2019-08-12 02:50:34', '2019-08-12 02:50:34'),
(2, 'kyaw thi ha', '09440813572', '$2y$10$uB59CgKb/muDTIjFFfGcJeh.UOjXHZiXUn.bXtir5WQlCffnV6b7C', 'http://www.google.com', NULL, '2019-08-12 06:18:56', '2019-08-18 02:44:26'),
(3, 'Aung', '09440813432', '$2y$10$Dm925WaLPe7/J/RDtZHSEOKHXTORFO3/HuzvDpsAXYGPxsP5K0gj6', 'http://www.google.com', NULL, '2019-08-12 06:19:11', '2019-08-12 06:19:11'),
(4, 'MOe', '09440813234', '$2y$10$CLNtG5EUhvdKojriaXsJ7eYH9zlWpnqE6tMQdcdeu0rM/6zw7pJnm', 'http://www.google.com', NULL, '2019-08-12 06:19:23', '2019-08-12 06:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `menucategories`
--

CREATE TABLE `menucategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menucategories`
--

INSERT INTO `menucategories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'နံနက်စာ', '2019-08-18 08:41:56', '2019-08-18 08:41:56'),
(2, 'အသုပ်', '2019-08-18 08:42:20', '2019-08-18 08:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `menuranks`
--

CREATE TABLE `menuranks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `rank` tinyint(1) NOT NULL,
  `review` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menuranks`
--

INSERT INTO `menuranks` (`id`, `customer_id`, `menu_id`, `rank`, `review`, `created_at`, `updated_at`) VALUES
(2, 2, 8, 3, 'Good', '2019-08-18 02:28:12', '2019-08-18 02:30:01');

--
-- Triggers `menuranks`
--
DELIMITER $$
CREATE TRIGGER `delete_rank_menu` BEFORE DELETE ON `menuranks` FOR EACH ROW BEGIN
	IF OLD.rank=1 THEN
	UPDATE menus SET menus.rank1=menus.rank1-1 WHERE  		menus.id=OLD.menu_id;
    ELSEIF OLD.rank=2 THEN
    UPDATE menus SET menus.rank2=menus.rank2-1 WHERE  		menus.id=OLD.menu_id;
    ELSEIF OLD.rank=3 THEN
    UPDATE menus SET menus.rank3=menus.rank3-1 WHERE  		menus.id=OLD.menu_id;
    ELSEIF OLD.rank=4 THEN
    UPDATE menus SET menus.rank4=menus.rank4-1 WHERE  		menus.id=OLD.menu_id;
    ELSEIF OLD.rank=5 THEN
    UPDATE menus SET menus.rank5=menus.rank5-1 WHERE  		menus.id=OLD.menu_id;
    END IF;
     UPDATE menus SET menus.rank=(((5*menus.rank5)+(4*menus.rank4)+(3*menus.rank3)+(2*menus.rank2)+(1*menus.rank1))/(1+menus.rank1+menus.rank2+menus.rank3+menus.rank4+menus.rank5)) WHERE menus.id=OLD.menu_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_rank_menu` BEFORE INSERT ON `menuranks` FOR EACH ROW BEGIN
	IF NEW.rank=1 THEN
	UPDATE menus SET menus.rank1=1+menus.rank1 WHERE  		menus.id=NEW.menu_id;
    ELSEIF NEW.rank=2 THEN
    UPDATE menus SET menus.rank2=1+menus.rank2 WHERE  		menus.id=NEW.menu_id;
    ELSEIF NEW.rank=3 THEN
    UPDATE menus SET menus.rank3=1+menus.rank3 WHERE  		menus.id=NEW.menu_id;
    ELSEIF NEW.rank=4 THEN
    UPDATE menus SET menus.rank4=1+menus.rank4 WHERE  		menus.id=NEW.menu_id;
    ELSEIF NEW.rank=5 THEN
    UPDATE menus SET menus.rank5=1+menus.rank5 WHERE  		menus.id=NEW.menu_id;
    END IF;
    UPDATE menus SET menus.rank=(((5*menus.rank5)+(4*menus.rank4)+(3*menus.rank3)+(2*menus.rank2)+(1*menus.rank1))/(1+menus.rank1+menus.rank2+menus.rank3+menus.rank4+menus.rank5)) WHERE menus.id=NEW.menu_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `menucategory_id` bigint(20) UNSIGNED NOT NULL,
  `shopuser_id` bigint(20) UNSIGNED NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `price` double UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `rank1` bigint(20) NOT NULL DEFAULT 0,
  `rank2` bigint(20) NOT NULL DEFAULT 0,
  `rank3` bigint(20) NOT NULL DEFAULT 0,
  `rank4` bigint(20) NOT NULL DEFAULT 0,
  `rank5` bigint(20) NOT NULL DEFAULT 0,
  `rank` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `menucategory_id`, `shopuser_id`, `photo_url`, `price`, `description`, `created_at`, `updated_at`, `rank1`, `rank2`, `rank3`, `rank4`, `rank5`, `rank`) VALUES
(2, 'fsdfsd', 2, 1, 'http://www.kyaw.com', 33, NULL, '2019-08-18 02:12:54', '2019-08-18 02:12:54', 0, 0, 0, 0, 0, 0),
(4, 'တောက်တောက်ကော်', 1, 1, 'http://www.kyaw.com', 33, NULL, '2019-08-18 02:14:15', '2019-08-18 02:14:15', 0, 0, 0, 0, 0, 0),
(6, 'တောက်တောက်ကော်', 1, 1, 'http://www.kyaw.com', 33, NULL, '2019-08-18 02:15:48', '2019-08-18 02:15:48', 0, 0, 0, 0, 0, 0),
(7, 'တောက်တောက်ကော်', 1, 1, 'http://www.kyaw.com', 33, NULL, '2019-08-18 02:15:55', '2019-08-18 02:15:55', 0, 0, 0, 0, 0, 0),
(8, 'တောက်တောက်ကော်', 1, 1, 'http://www.kyaw.com', 33, NULL, '2019-08-18 02:16:31', '2019-08-18 02:16:31', 0, 0, 1, 0, 0, 2),
(9, 'တောက်တောက်ကော်', 1, 1, 'http://www.kyaw.com', 33, 'စားလို့ စောက်ရမ်းကောင်းတယ်နော်', '2019-08-18 02:17:15', '2019-08-18 02:17:15', 0, 0, 0, 0, 0, 0),
(10, 'တောက်တောက်ကော်', 1, 1, 'http://www.kyaw.com', 400, NULL, '2019-08-18 02:17:47', '2019-08-18 02:19:16', 0, 0, 0, 0, 0, 0),
(11, 'တောက်တောက်ကော်', 1, 1, 'http://www.kyaw.com', 33, NULL, '2019-08-18 02:17:50', '2019-08-18 02:17:50', 0, 0, 0, 0, 0, 0);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_10_031101_create_shopusers_table', 2),
(9, '2019_08_11_090437_create_shopcategories_table', 3),
(10, '2019_08_11_093556_create_menucategories_table', 4),
(11, '2019_08_11_093625_create_menus_table', 4),
(12, '2019_08_12_085051_create_customers_table', 4),
(13, '2019_08_12_094916_create_shopranks_table', 5),
(15, '2019_08_14_113327_create_shop_cities_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00c6ccb2a44d7d77d696b0658859d8e11bae095a82b2a7480055754c015e4af9c3522fc7808ca516', 5, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:41:34', '2019-08-10 19:41:34', '2020-08-11 02:11:34'),
('0381f1bf0c5345c2975280ab9c9cfaafe50f08447da5aeee164c21d7e713886857de55c61d90fbf3', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:14', '2019-08-10 18:41:14', '2020-08-11 01:11:14'),
('081d62222ea99d182c5f39db8956bd9eca43e965fdf73e73eba478101c1718b81e291810a7e50727', 5, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:37:19', '2019-08-10 19:37:19', '2020-08-11 02:07:19'),
('09d6e4008ed41cba1081609ed0820e11c1d02384c9ec5722a163f45d8095ff1eb9857b7c8e6a5d5d', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:50', '2019-08-10 18:41:50', '2020-08-11 01:11:50'),
('0b65f40deb860b52c7ab7c8f8e09fbcb96adf1bad862f7d0c57340414b2cd74211a5dc1888bc6974', 1, 1, 'MyApp', '[]', 0, '2019-08-10 04:31:29', '2019-08-10 04:31:29', '2020-08-10 11:01:29'),
('204c96a3364d99310fb25b1a03e6c1d6b85b14f182caa9b0b920c1d93fb674448db1cb09b4e6bf51', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:32', '2019-08-10 18:41:32', '2020-08-11 01:11:32'),
('21cd084581136169b657a06fba506fc2bc0b861a47b5246015cb884b93a06625b2afa05a447f8c45', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:28', '2019-08-10 18:41:28', '2020-08-11 01:11:28'),
('23c78ec03388efba4b80980c95bc2f94a2cc872b33d397dfcf682d1f931ee1f05259562e723775b3', 10, 1, 'MyShopUser', '[]', 0, '2019-08-11 03:17:24', '2019-08-11 03:17:24', '2020-08-11 09:47:24'),
('241084b5bebb4fab8d9b1dc06b57b8c017753d5b7f99dbbf4bfd4de4748bc7cdee2a3ae10a07f7f3', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:31', '2019-08-10 18:41:31', '2020-08-11 01:11:31'),
('2a18d13ef980eac006e50b7f7ebe55c75f3ebb0d595548c160c1622b3f8e3c95be7375129468a0da', 8, 1, 'MyShopUser', '[]', 0, '2019-08-10 21:37:48', '2019-08-10 21:37:48', '2020-08-11 04:07:48'),
('334c39312ad48441202ac7ae68dd37d18b858932235e638150f7c07ceca3779e2d8f0c0205a9f5a0', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:44', '2019-08-10 18:41:44', '2020-08-11 01:11:44'),
('346d49913e40aa68b5b429aa7564fc68de9b89e27cbd70f809d94b324e1da762a2025dbb13ec3563', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:49', '2019-08-10 18:41:49', '2020-08-11 01:11:49'),
('39d3b44caad2bdff754ec5de03bb6586eb5665413347615071149075978749fd0488d64508d95ef2', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:08', '2019-08-10 18:41:08', '2020-08-11 01:11:08'),
('3bc651d42a2fc3480b3856d636ce8056f504e11d9e621dc84f9dd4773a2123f57dd0d8d199c06098', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:27', '2019-08-10 18:41:27', '2020-08-11 01:11:27'),
('3bdecc35468e121f631cdcb353ac5add6d7268785b3d979d31d5cca4adb97d3cfd7d3cd986fbcf8b', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:02', '2019-08-10 18:41:02', '2020-08-11 01:11:02'),
('4c4f9dba2c0fa168c77a6c8e1ba5a757a51ed8b8782c2d2b1ffdb922788b92226892bc3ed0647382', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 06:41:47', '2019-08-10 06:41:47', '2020-08-10 13:11:47'),
('5715151de34eefcace4963c92bc7aaba8ccfd4820686e0fbbaf17c0739f47541ebdd78dec7e3a666', 1, 1, 'MyCustomer', '[]', 0, '2019-08-12 02:50:35', '2019-08-12 02:50:35', '2020-08-12 09:20:35'),
('5e6676c4bc8aafa3af667510363614f7331870bb16300d1f3c483cd8c2ad485fd3640aa1f2d36722', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:35', '2019-08-10 18:41:35', '2020-08-11 01:11:35'),
('5f0f4f4e391b67cf7c30fd6008b977743b2a723828fa97ee070ffe793347c9143a7a07454d820a31', 3, 1, 'MyCustomer', '[]', 0, '2019-08-12 06:19:11', '2019-08-12 06:19:11', '2020-08-12 12:49:11'),
('63a68ac647d53f3719160d5ece3046d2d4959d9225411c87e872e1e1cde1b2080cb0c806611df24a', 2, 1, 'MyApp', '[]', 0, '2019-08-10 04:35:50', '2019-08-10 04:35:50', '2020-08-10 11:05:50'),
('6a7af47bddeecfebd2cc75975c88bd60599e007b04760dfc33f3a5319a9f965192276e8ba86c7237', 4, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:17:30', '2019-08-10 19:17:30', '2020-08-11 01:47:30'),
('6a8d19fda37ac1f7de7adf15ff88e80f95f06d97ad1fa333d3b5fabca1dc40ec1356bb8682d60b2e', 2, 1, 'MyCustomer', '[]', 0, '2019-08-12 06:18:56', '2019-08-12 06:18:56', '2020-08-12 12:48:56'),
('6e60714966096b9d5ac5a9f13545e494af864e1b752b3cf0068ab934076385ab8ab5bf9f2ef5f977', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:06', '2019-08-10 18:41:06', '2020-08-11 01:11:06'),
('734a84d39a93a9f4c151b9ec268b938464791c8a23f7bd732adc9478115fc80616f5798422840eab', 2, 1, 'MyCustomer', '[]', 0, '2019-08-18 02:45:29', '2019-08-18 02:45:29', '2020-08-18 09:15:29'),
('73eddb415df0eb8b27abf665e6580a9eb748076f1fd3f775c3a2dfaa3de358448acb8a37d7d4d50d', NULL, 3, NULL, '[]', 0, '2019-08-10 19:40:57', '2019-08-10 19:40:57', '2020-08-11 02:10:57'),
('772b7d3f37668e60aa732050daddc464456d0108cf7fed0ad1b62091182571740bc8612302d447e4', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:40:30', '2019-08-10 18:40:30', '2020-08-11 01:10:30'),
('7d9743aad3f37093bd19d059b98b6fdccbd9ed7cd0cc90383036531682328339696ee0686aef58ac', 6, 1, 'MyShopUser', '[]', 0, '2019-08-10 21:27:38', '2019-08-10 21:27:38', '2020-08-11 03:57:38'),
('8ab018a115489bd375cdf37fe921d4974d67f03ff4a4f215412413a4f35118c4e2b2f4da113c00c5', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:28', '2019-08-10 18:41:28', '2020-08-11 01:11:28'),
('98ab899036379af226d6d5499aaf665ad43072fe5a92e198b72d66e1da97c96c8c56d029eacf6afd', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:47', '2019-08-10 18:41:47', '2020-08-11 01:11:47'),
('9f6ef39d820ec50744c7d9d4381ada5cdb26fdac8435d062a58b634aff720638383bef1858f91da3', 2, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:04:39', '2019-08-10 18:04:39', '2020-08-11 00:34:39'),
('a4d4a5441f57f64290df8b152fbbcf11b4d910ea1c71736c00ece3bae44a0cb6a0db1d69a375464e', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:33', '2019-08-10 18:41:33', '2020-08-11 01:11:33'),
('b2ad499a99d449ee3b1daad22b5ffd0c914eaa41681a51fde94c0665f3e84198a742a947d94a0aa7', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:30', '2019-08-10 18:41:30', '2020-08-11 01:11:30'),
('b45998f31630706ac44e6b8c0bdbcb90e4f0a936dbe77c4ca358430dedcbd394021866019092e9ae', 5, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:37:20', '2019-08-10 19:37:20', '2020-08-11 02:07:20'),
('b50b371e8af72da1db633c290dbb9ffb547aadfcbb979c2a20be83746755ba49cdc112200bd48f40', 1, 1, 'MyCustomer', '[]', 0, '2019-08-12 12:02:48', '2019-08-12 12:02:48', '2020-08-12 18:32:48'),
('bd9c26d5b8d375ff6cba6c2e30c5b4890e80c96380a43df38f9a9b9ed6b5aad464acf0a39d69af42', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:40:44', '2019-08-10 18:40:44', '2020-08-11 01:10:44'),
('c370639b87198cb6d388289b4167f34d0cf764520e1c126f5f0b267bf70b523aa070fccac77d3c98', 12, 1, 'MyShopUser', '[]', 0, '2019-08-12 16:53:45', '2019-08-12 16:53:45', '2020-08-12 23:23:45'),
('c5b55deadd12fa13145c72c762f0c85edb4c3e2de3cda3c358d8fe29bf9f0f0282735db06ed95370', 5, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:22:56', '2019-08-10 19:22:56', '2020-08-11 01:52:56'),
('d40d62bd6c22bced8b902e6650ad5ef504924b631c06ed98e720abffaa5540a280bcf1ff136b1afc', 5, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:37:15', '2019-08-10 19:37:15', '2020-08-11 02:07:15'),
('d8fb256910f2a13cce8cefe66c9eb767abeaabb0de387a91a809c110212486f527205a4a194cdac1', 12, 1, 'MyShopUser', '[]', 0, '2019-08-13 01:45:26', '2019-08-13 01:45:26', '2020-08-13 08:15:26'),
('db75f053f75d6e970088222ffd0052f454384a8824a316d8768d24ff6d01072b86b13eb8c2e1f9a8', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:40:50', '2019-08-10 18:40:50', '2020-08-11 01:10:50'),
('de2a67551809fcf26801dd389e9136927323396055f3f859132157ce0e66c7fea4906909e9b8c522', 7, 1, 'MyShopUser', '[]', 0, '2019-08-10 21:35:25', '2019-08-10 21:35:25', '2020-08-11 04:05:25'),
('de79489300f29b3a656b3a12675a47c7107afea26448f12695e331e94c213b9433f02c496859c742', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:46', '2019-08-10 18:41:46', '2020-08-11 01:11:46'),
('df80a022dd1f2e95420ce60daaca5bc890bc211f2c95aec15de2fb01e5f59f79225646588108f9a6', 5, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:41:51', '2019-08-10 19:41:51', '2020-08-11 02:11:51'),
('e5d092388323eb07710a38dc789daa3c41da00569b0cf50f2ad54185c4b7b3788e6cb5ea79d50f1b', 2, 1, 'MyApp', '[]', 0, '2019-08-10 18:41:25', '2019-08-10 18:41:25', '2020-08-11 01:11:25'),
('edee4696b53313c09dbb445666a4314f1859d30a708644eafe1b94756267c2dc24a4bc3db0c78af4', 2, 1, 'MyCustomer', '[]', 0, '2019-08-12 06:57:18', '2019-08-12 06:57:18', '2020-08-12 13:27:18'),
('f225d3f35957f6d9bc34e8e9961581a2d3070d6ec867cbee0742adda13f49f694693dd9aa2f2ad16', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:41:05', '2019-08-10 18:41:05', '2020-08-11 01:11:05'),
('f266d2a1e2f97989c28065c7e44f88ae85eac64f5063fb47d3f111d83df593290dc54959548fcb75', 4, 1, 'MyCustomer', '[]', 0, '2019-08-12 06:19:23', '2019-08-12 06:19:23', '2020-08-12 12:49:23'),
('f266de95dba048aef3fcfc78874615db94f7226cd5a27ff77b342f03212e32278ef9597c4230083b', 5, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:21:25', '2019-08-10 19:21:25', '2020-08-11 01:51:25'),
('f701bccc595ef6fa34efe19a2cee685e9e1183468faffcc1161e156adaf58bba7b9ec58f9cc23748', 1, 1, 'MyShopUser', '[]', 0, '2019-08-10 18:40:59', '2019-08-10 18:40:59', '2020-08-11 01:10:59'),
('fec0832c5a3e76d4dcdc8d1ac0bbb0afc9454d3f24348d97505b527ffd869e427698d78bde55fab6', 5, 1, 'MyShopUser', '[]', 0, '2019-08-10 19:22:27', '2019-08-10 19:22:27', '2020-08-11 01:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'dkt6EKIw2jOJzwsvBt7n1FaP0j1zuoNkorjhmMC9', 'http://localhost', 1, 0, 0, '2019-08-09 19:31:46', '2019-08-09 19:31:46'),
(2, NULL, 'Laravel Password Grant Client', 'oVVrKkYijkxLPIMm31Zy2eVifFhhwRMbNln3N3oX', 'http://localhost', 0, 1, 0, '2019-08-09 19:31:48', '2019-08-09 19:31:48'),
(3, NULL, 'Laravel ClientCredentials Grant Client', 'z3o6VRIInSgOMrVdwUfL7jUAsUNHztAFgHr2stcm', '', 0, 0, 0, '2019-08-10 19:37:02', '2019-08-10 19:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-08-09 19:31:48', '2019-08-09 19:31:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `shopcategories`
--

CREATE TABLE `shopcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shopcategories`
--

INSERT INTO `shopcategories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Coffice', '2019-08-10 17:30:00', NULL),
(2, 'ထမင်းကျော်', NULL, NULL),
(3, 'အရက်ဆိုင်', '2019-08-13 12:44:35', '2019-08-13 12:44:35'),
(4, 'စားသောက်ဆိုင်', '2019-08-14 01:18:02', '2019-08-14 01:18:02'),
(5, 'မုန့်ဟင်းခါးဆိုင်', '2019-08-14 01:18:02', '2019-08-14 01:18:02');

-- --------------------------------------------------------

--
-- Table structure for table `shopranks`
--

CREATE TABLE `shopranks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `shopuser_id` bigint(20) UNSIGNED NOT NULL,
  `rank` tinyint(1) UNSIGNED NOT NULL,
  `review` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shopranks`
--

INSERT INTO `shopranks` (`id`, `customer_id`, `shopuser_id`, `rank`, `review`, `created_at`, `updated_at`) VALUES
(45, 1, 12, 3, 'Nice', '2019-08-18 01:42:50', '2019-08-18 01:44:58');

--
-- Triggers `shopranks`
--
DELIMITER $$
CREATE TRIGGER `delete_rank` BEFORE DELETE ON `shopranks` FOR EACH ROW BEGIN
	IF OLD.rank=1 THEN
	UPDATE shopusers SET shopusers.rank1=shopusers.rank1-1 WHERE  		shopusers.id=OLD.shopuser_id;
    ELSEIF OLD.rank=2 THEN
    UPDATE shopusers SET shopusers.rank2=shopusers.rank2-1 WHERE  		shopusers.id=OLD.shopuser_id;
    ELSEIF OLD.rank=3 THEN
    UPDATE shopusers SET shopusers.rank3=shopusers.rank3-1 WHERE  		shopusers.id=OLD.shopuser_id;
    ELSEIF OLD.rank=4 THEN
    UPDATE shopusers SET shopusers.rank4=shopusers.rank4-1 WHERE  		shopusers.id=OLD.shopuser_id;
    ELSEIF OLD.rank=5 THEN
    UPDATE shopusers SET shopusers.rank5=shopusers.rank5-1 WHERE  		shopusers.id=OLD.shopuser_id;
    END IF;
     UPDATE shopusers SET shopusers.rank=(((5*shopusers.rank5)+(4*shopusers.rank4)+(3*shopusers.rank3)+(2*shopusers.rank2)+(1*shopusers.rank1))/(1+shopusers.rank1+shopusers.rank2+shopusers.rank3+shopusers.rank4+shopusers.rank5)) WHERE shopusers.id=OLD.shopuser_id;
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_rank` BEFORE INSERT ON `shopranks` FOR EACH ROW BEGIN
	IF NEW.rank=1 THEN
	UPDATE shopusers SET shopusers.rank1=1+shopusers.rank1 WHERE  		shopusers.id=NEW.shopuser_id;
    ELSEIF NEW.rank=2 THEN
    UPDATE shopusers SET shopusers.rank2=1+shopusers.rank2 WHERE  		shopusers.id=NEW.shopuser_id;
    ELSEIF NEW.rank=3 THEN
    UPDATE shopusers SET shopusers.rank3=1+shopusers.rank3 WHERE  		shopusers.id=NEW.shopuser_id;
    ELSEIF NEW.rank=4 THEN
    UPDATE shopusers SET shopusers.rank4=1+shopusers.rank4 WHERE  		shopusers.id=NEW.shopuser_id;
    ELSEIF NEW.rank=5 THEN
    UPDATE shopusers SET shopusers.rank5=1+shopusers.rank5 WHERE  		shopusers.id=NEW.shopuser_id;
    END IF;
    UPDATE shopusers SET shopusers.rank=(((5*shopusers.rank5)+(4*shopusers.rank4)+(3*shopusers.rank3)+(2*shopusers.rank2)+(1*shopusers.rank1))/(1+shopusers.rank1+shopusers.rank2+shopusers.rank3+shopusers.rank4+shopusers.rank5)) WHERE shopusers.id=NEW.shopuser_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `shopusers`
--

CREATE TABLE `shopusers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_cities_id` bigint(20) UNSIGNED NOT NULL,
  `shopcategory_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `rank1` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rank2` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rank3` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rank4` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rank5` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rank` double UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shopusers`
--

INSERT INTO `shopusers` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile_url`, `address`, `latitude`, `longitude`, `phone_no`, `shop_cities_id`, `shopcategory_id`, `remember_token`, `created_at`, `updated_at`, `rank1`, `rank2`, `rank3`, `rank4`, `rank5`, `rank`) VALUES
(1, 'Hnin', 'kyawthi547@gmail.com', NULL, '$2y$10$tulat.h9KfIFQigeWKRjqe99VO53qKxcwxJ6LY32WTHSc9c7LAkxC', 'http://www.facebook.com/kjfksoj', 'Kanma', 43, 33, '09778324234', 3, 2, NULL, '2019-08-10 06:41:47', '2019-08-16 10:53:41', 0, 0, 0, 0, 0, 0),
(4, 'kyaw', 'thiha0905@gmail.com', NULL, '$2y$10$yjXJVrlF39op/VY0f03.J.w9OJ883k0pYqZ1NlbtAKmAU/yOzAAzm', 'fsfsf', 'efrewrfwef', 53535, 423424, '23rwr32423r', 3, 2, NULL, '2019-08-10 19:17:30', '2019-08-10 19:17:30', 0, 0, 0, 0, 0, 0),
(5, 'lwin Moe Hain', 'lwin@gmail.com', NULL, '$2y$10$EM.cVeLboxm2DFJ6nD6K9eo58R8ArMw1wDDN1Nq1lVmVCTG0O2XCS', 'fsfsf', 'Pakokku', 53535, 423424, '23rwr32423r', 3, 1, NULL, '2019-08-10 19:21:25', '2019-08-10 19:21:25', 0, 0, 0, 0, 1, 0),
(6, 'King', 'king@gmail.com', NULL, '$2y$10$/WzgLmaSJJA4JaKz2UVUhOaUWbrivikMlzlIDbQHkBErjgkEOSqXu', 'http://www.fjsljf.com/sfjldsfsfsl', 'Pakokku', 53535, 423424, '23rwr32423r', 3, 1, NULL, '2019-08-10 21:27:38', '2019-08-10 21:27:38', 0, 0, 0, 0, 0, 0),
(7, 'Myo Kyaw Htun', 'myolay@gmail.com', NULL, '$2y$10$WyEWKmA62d3tvZRHH1ckf.61pJy2xMGk1LTfiGwdz2wksEjfM6Svm', 'http://www.fjsljf.com/sfjldsfsfsl', 'Pakokku', 53535, 423424, '09778673750', 3, 2, NULL, '2019-08-10 21:35:25', '2019-08-10 21:35:25', 0, 0, 0, 0, 0, 0),
(8, 'Myo Kyaw Htun', 'myay@gmail.com', NULL, '$2y$10$Tqeh8wuY5zmDCujU2skbGOCKG4V0rlN5l4Ynx4UHLByCNoBtoesdO', 'http://www.fjsljf.com/sfjldsfsfsl', 'Pakokku', 53535, -33.1, '09778673755', 3, 1, NULL, '2019-08-10 21:37:48', '2019-08-10 21:37:48', 0, 0, 0, 0, 0, 0),
(10, 'Myo Kyaw Htuyaw Htunfjsihfihsilfhilsjfijklsjfkljsklfjioweeriowejfoijewifjio', 'hello@gmail.com', NULL, '$2y$10$Nj6vMPzA84rdNi957shMxugF.NIOGKWBlKq6/wRajTiWZXeB8P4de', 'http://www.kyaw.com', 'Pakokku', 53535, -33.1, '09778673755', 3, 1, NULL, '2019-08-11 03:17:24', '2019-08-11 03:17:24', 0, 0, 0, 0, 0, 0),
(12, 'Moe Kaung Kin', 'moe@gmail.com', NULL, '$2y$10$IfK13wjvcwrJMzcaWsbAoOLoPd5zXIxxcDwRuoCc2ew/8MxyMQpLK', 'http://www.kyaw.com', 'Pakokku', 53535, -33.1, '09778673755', 3, 1, NULL, '2019-08-12 16:53:45', '2019-08-12 16:53:45', 0, 0, 1, 0, 0, 1.5);

-- --------------------------------------------------------

--
-- Table structure for table `shop_cities`
--

CREATE TABLE `shop_cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `township` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_cities`
--

INSERT INTO `shop_cities` (`id`, `township`, `division`, `region`, `created_at`, `updated_at`) VALUES
(1, ' Township', ' Division', 'Region', '2019-08-14 13:03:10', '2019-08-14 13:03:10'),
(2, ' Gangaw', ' Gangaw', 'Magway Region', '2019-08-14 13:03:10', '2019-08-14 13:03:10'),
(3, ' Kyaukhtu', ' Gangaw', 'Magway Region', '2019-08-14 13:03:10', '2019-08-14 13:03:10'),
(4, ' Saw', ' Gangaw', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(5, ' Tilin', ' Gangaw', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(6, ' Chauck', ' Magway', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(7, ' Magway', ' Magway', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(8, ' Myothit', ' Magway', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(9, ' Natmauk', ' Magway', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(10, ' Taungdwingyi', ' Magway', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(11, ' Yenangyaung', ' Magway', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(12, ' Minbu', ' Minbu', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(13, ' Ngape', ' Minbu', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(14, ' Pwintbyu', ' Minbu', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(15, ' Salin', ' Minbu', 'Magway Region', '2019-08-14 13:03:11', '2019-08-14 13:03:11'),
(16, ' Sidoktaya', ' Minbu', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(17, ' Myaing', ' Pakokku', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(18, ' Pakokku', ' Pakokku', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(19, ' Pauk', ' Pakokku', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(20, ' Seikphyu', ' Pakokku', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(21, ' Yesagyo', ' Pakokku', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(22, ' Aunglan', ' Thayet', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(23, ' Kamma', ' Thayet', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(24, ' Mindon', ' Thayet', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(25, ' Minhla', ' Thayet', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(26, ' Sinbaungwe', ' Thayet', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(27, ' Thayet', ' Thayet', 'Magway Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(28, ' Kyaukse', ' Kyaukse', 'Mandalay Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(29, ' Myittha', ' Kyaukse', 'Mandalay Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(30, ' Sintgaing', ' Kyaukse', 'Mandalay Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(31, ' Tada-U', ' Kyaukse', 'Mandalay Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(32, ' Amarapura', ' Mandalay', 'Mandalay Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(33, ' Aungmyethazan', ' Mandalay', 'Mandalay Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(34, ' Chanayethazan', ' Mandalay', 'Mandalay Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(35, ' Chanmyathazi', ' Mandalay', 'Mandalay Region', '2019-08-14 13:03:12', '2019-08-14 13:03:12'),
(36, ' Mahaaungmye', ' Mandalay', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(37, ' Patheingyi', ' Mandalay', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(38, ' Pyigyidagun', ' Mandalay', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(39, ' Mahlaing', ' Meiktila', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(40, ' Meiktila', ' Meiktila', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(41, ' Thazi', ' Meiktila', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(42, ' Wundwin', ' Meiktila', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(43, ' Myingyan', ' Myingyan', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(44, ' Natogyi', ' Myingyan', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(45, ' Nganzun', ' Myingyan', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(46, ' Thaungtha', ' Myingyan', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(47, ' Kyaukpadaung', ' Nyaung-U', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(48, ' Ngathayauk', ' Nyaung-U', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(49, ' Nyaung-U', ' Nyaung-U', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(50, ' Madaya', ' Pyinoolwin', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(51, ' Mogok', ' Pyinoolwin', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(52, ' Pyinoolwin', ' Pyinoolwin', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(53, ' Singu', ' Pyinoolwin', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(54, ' Tagaung', ' Pyinoolwin', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(55, ' Thabeikkyin', ' Pyinoolwin', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(56, ' Pyawbwe', ' Yamethin', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(57, ' Yamethin', ' Yamethin', 'Mandalay Region', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(58, ' Dekkhinathiri', ' Dekkhina(South Naypyidaw)', 'Naypyidaw Union Territory', '2019-08-14 13:03:13', '2019-08-14 13:03:13'),
(59, ' Lewe', ' Dekkhina(South Naypyidaw)', 'Naypyidaw Union Territory', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(60, ' Pyinmana', ' Dekkhina(South Naypyidaw)', 'Naypyidaw Union Territory', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(61, ' Zabuthiri', ' Dekkhina(South Naypyidaw)', 'Naypyidaw Union Territory', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(62, ' Ottarathiri', ' Ottara(North Naypyidaw)', 'Naypyidaw Union Territory', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(63, ' Pobbathiri', ' Ottara(North Naypyidaw)', 'Naypyidaw Union Territory', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(64, ' Tatkon', ' Ottara(North Naypyidaw)', 'Naypyidaw Union Territory', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(65, ' Zeyarthiri', ' Ottara(North Naypyidaw)', 'Naypyidaw Union Territory', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(66, ' Bawlakhe', ' Bawlakhe', 'Kayah State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(67, ' Hpasawng', ' Bawlakhe', 'Kayah State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(68, ' Mese', ' Bawlakhe', 'Kayah State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(69, ' Ywathit', ' Bawlakhe', 'Kayah State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(70, ' Demoso', ' Loikaw', 'Kayah State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(71, ' Hpruso', ' Loikaw', 'Kayah State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(72, ' Loikaw', ' Loikaw', 'Kayah State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(73, ' Shadaw', ' Loikaw', 'Kayah State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(74, ' Kengtung', ' Kengtung', 'Shan State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(75, ' Mine Pauk', ' Kengtung', 'Shan State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(76, ' Minelar', ' Kengtung', 'Shan State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(77, ' Mong Khet', ' Kengtung', 'Shan State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(78, ' Mong La', ' Kengtung', 'Shan State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(79, ' Mong Yang', ' Kengtung', 'Shan State', '2019-08-14 13:03:14', '2019-08-14 13:03:14'),
(80, ' Mineyu', ' Mong Hpayak', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(81, ' Mong Hpayak', ' Mong Hpayak', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(82, ' Mong Yawng', ' Mong Hpayak', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(83, ' Minekoke', ' Mong Hsat', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(84, ' Monehta', ' Mong Hsat', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(85, ' Mong Hsat', ' Mong Hsat', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(86, ' Mong Ping', ' Mong Hsat', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(87, ' Mong Tong', ' Mong Hsat', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(88, ' Ponparkyin', ' Mong Hsat', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(89, ' Tontar', ' Mong Hsat', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(90, ' Kyaing Lap', ' Tachileik', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(91, ' Tachileik', ' Tachileik', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(92, ' Talay', ' Tachileik', 'Shan State', '2019-08-14 13:03:15', '2019-08-14 13:03:15'),
(93, ' Kunlong', ' Kunlong', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(94, ' Hsipaw', ' Kyaukme', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(95, ' Kyaukme', ' Kyaukme', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(96, ' Mantong', ' Kyaukme', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(97, ' Minelon', ' Kyaukme', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(98, ' Minengaw', ' Kyaukme', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(99, ' Namhsan', ' Kyaukme', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(100, ' Namtu', ' Kyaukme', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(101, ' Nawnghkio', ' Kyaukme', 'Shan State', '2019-08-14 13:03:16', '2019-08-14 13:03:16'),
(102, ' Hsenwi', ' Lashio', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(103, ' Lashio', ' Lashio', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(104, ' Mongyai', ' Lashio', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(105, ' Tangyan', ' Lashio', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(106, ' Chinshwehaw', ' Laukkaing', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(107, ' Konkyan', ' Laukkaing', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(108, ' Laukkaing', ' Laukkaing', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(109, ' Mawhtike', ' Laukkaing', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(110, ' Kutkai', ' Mu Se', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(111, ' Manhero', ' Mu Se', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(112, ' Monekoe', ' Mu Se', 'Shan State', '2019-08-14 13:03:17', '2019-08-14 13:03:17'),
(113, ' Mu Se', ' Mu Se', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(114, ' Namhkam', ' Mu Se', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(115, ' Pansai', ' Mu Se', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(116, ' Tamoenye', ' Mu Se', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(117, ' Hopang', ' Hopang', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(118, ' Mongmao', ' Hopang', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(119, ' Namtit', ' Hopang', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(120, ' Pangwaun', ' Hopang', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(121, ' Panlong', ' Hopang', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(122, ' Man Kan', ' Matman', 'Shan State', '2019-08-14 13:03:18', '2019-08-14 13:03:18'),
(123, ' Matman', ' Matman', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(124, ' Namphan', ' Matman', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(125, ' Pangsang Township (Pan', ' Matman', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(126, ' Mabein', ' Mongmit', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(127, ' Mongmit', ' Mongmit', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(128, ' Homane', ' Langkho', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(129, ' Kengtaung', ' Langkho', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(130, ' Langkho', ' Langkho', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(131, ' Mawkmai', ' Langkho', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(132, ' Mong Nai', ' Langkho', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(133, ' Mong Pan', ' Langkho', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(134, ' Karli', ' Loilen', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(135, ' Kholan', ' Loilen', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(136, ' Kunhing', ' Loilen', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(137, ' Kyethi', ' Loilen', 'Shan State', '2019-08-14 13:03:19', '2019-08-14 13:03:19'),
(138, ' Lai-Hka', ' Loilen', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(139, ' Loilen', ' Loilen', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(140, ' Minenaung', ' Loilen', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(141, ' Minesan', ' Loilen', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(142, ' Mong Hsu', ' Loilen', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(143, ' Mong Kung', ' Loilen', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(144, ' Nansang', ' Loilen', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(145, ' Panglong', ' Loilen', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(146, ' Hopong', ' Taunggyi', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(147, ' Hsi Hseng', ' Taunggyi', 'Shan State', '2019-08-14 13:03:20', '2019-08-14 13:03:20'),
(148, ' Indaw', ' Taunggyi', 'Shan State', '2019-08-14 13:03:21', '2019-08-14 13:03:21'),
(149, ' Kalaw', ' Taunggyi', 'Shan State', '2019-08-14 13:03:21', '2019-08-14 13:03:21'),
(150, ' Kyauktalongyi', ' Taunggyi', 'Shan State', '2019-08-14 13:03:21', '2019-08-14 13:03:21'),
(151, ' Lawksawk', ' Taunggyi', 'Shan State', '2019-08-14 13:03:21', '2019-08-14 13:03:21'),
(152, ' Naungtayar', ' Taunggyi', 'Shan State', '2019-08-14 13:03:21', '2019-08-14 13:03:21'),
(153, ' Nyaungshwe', ' Taunggyi', 'Shan State', '2019-08-14 13:03:21', '2019-08-14 13:03:21'),
(154, ' Pekon', ' Taunggyi', 'Shan State', '2019-08-14 13:03:21', '2019-08-14 13:03:21'),
(155, ' Pingdaya', ' Taunggyi', 'Shan State', '2019-08-14 13:03:21', '2019-08-14 13:03:21'),
(156, ' Pinlaung', ' Taunggyi', 'Shan State', '2019-08-14 13:03:22', '2019-08-14 13:03:22'),
(157, ' Taunggyi', ' Taunggyi', 'Shan State', '2019-08-14 13:03:22', '2019-08-14 13:03:22'),
(158, ' Ywangan', ' Taunggyi', 'Shan State', '2019-08-14 13:03:22', '2019-08-14 13:03:22'),
(159, ' Hinthada', ' Hinthada', 'Ayeyarwady Region', '2019-08-14 13:03:22', '2019-08-14 13:03:22'),
(160, ' Ingapu', ' Hinthada', 'Ayeyarwady Region', '2019-08-14 13:03:22', '2019-08-14 13:03:22'),
(161, ' Kyangin', ' Hinthada', 'Ayeyarwady Region', '2019-08-14 13:03:22', '2019-08-14 13:03:22'),
(162, ' Lemyethna', ' Hinthada', 'Ayeyarwady Region', '2019-08-14 13:03:22', '2019-08-14 13:03:22'),
(163, ' Myanaung', ' Hinthada', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(164, ' Zalun', ' Hinthada', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(165, ' Labutta', ' Labutta', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(166, ' Mawlamyinegyun', ' Labutta', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(167, ' Pyinsalu', ' Labutta', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(168, ' Danuphyu', ' Ma-ubin', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(169, ' Ma-ubin', ' Ma-ubin', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(170, ' Nyaungdon', ' Ma-ubin', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(171, ' Pantanaw', ' Ma-ubin', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(172, ' Einme', ' Myaungmya', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(173, ' Myaungmya', ' Myaungmya', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(174, ' Wakema', ' Myaungmya', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(175, ' Hainggyikyun', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(176, ' Kangyidaunk', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(177, ' Kyaunggon', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:23', '2019-08-14 13:03:23'),
(178, ' Kyonpyaw', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(179, ' Ngapudaw', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(180, ' Ngathaingchaung', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(181, ' Ngayokaung', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(182, ' Ngwehsaung', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(183, ' Pathein', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(184, ' Shwethaungyan', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(185, ' Thabaung', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(186, ' Yekyi', ' Pathein', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(187, ' Ahmar', ' Pyapon', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(188, ' Bogale', ' Pyapon', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(189, ' Dedaye', ' Pyapon', 'Ayeyarwady Region', '2019-08-14 13:03:24', '2019-08-14 13:03:24'),
(190, ' Kyaiklat', ' Pyapon', 'Ayeyarwady Region', '2019-08-14 13:03:25', '2019-08-14 13:03:25'),
(191, ' Pyapon', ' Pyapon', 'Ayeyarwady Region', '2019-08-14 13:03:25', '2019-08-14 13:03:25'),
(192, ' Aungmyin', ' Bago', 'Bago Region', '2019-08-14 13:03:25', '2019-08-14 13:03:25'),
(193, ' Bago', ' Bago', 'Bago Region', '2019-08-14 13:03:26', '2019-08-14 13:03:26'),
(194, ' Daik-U', ' Bago', 'Bago Region', '2019-08-14 13:03:26', '2019-08-14 13:03:26'),
(195, ' Hpayargyi', ' Bago', 'Bago Region', '2019-08-14 13:03:26', '2019-08-14 13:03:26'),
(196, ' Intagaw', ' Bago', 'Bago Region', '2019-08-14 13:03:26', '2019-08-14 13:03:26'),
(197, ' Kawa', ' Bago', 'Bago Region', '2019-08-14 13:03:26', '2019-08-14 13:03:26'),
(198, ' Kyauktaga', ' Bago', 'Bago Region', '2019-08-14 13:03:26', '2019-08-14 13:03:26'),
(199, ' Madauk', ' Bago', 'Bago Region', '2019-08-14 13:03:26', '2019-08-14 13:03:26'),
(200, ' Nyaunglebin', ' Bago', 'Bago Region', '2019-08-14 13:03:27', '2019-08-14 13:03:27'),
(201, ' Peinzalot', ' Bago', 'Bago Region', '2019-08-14 13:03:27', '2019-08-14 13:03:27'),
(202, ' Penwegon', ' Bago', 'Bago Region', '2019-08-14 13:03:27', '2019-08-14 13:03:27'),
(203, ' Pyuntaza', ' Bago', 'Bago Region', '2019-08-14 13:03:27', '2019-08-14 13:03:27'),
(204, ' Shwegyin', ' Bago', 'Bago Region', '2019-08-14 13:03:27', '2019-08-14 13:03:27'),
(205, ' Thanatpin', ' Bago', 'Bago Region', '2019-08-14 13:03:27', '2019-08-14 13:03:27'),
(206, ' Waw', ' Bago', 'Bago Region', '2019-08-14 13:03:27', '2019-08-14 13:03:27'),
(207, ' Kanyutkwin', ' Taungoo', 'Bago Region', '2019-08-14 13:03:28', '2019-08-14 13:03:28'),
(208, ' Kaytumadi', ' Taungoo', 'Bago Region', '2019-08-14 13:03:28', '2019-08-14 13:03:28'),
(209, ' Kyaukkyi', ' Taungoo', 'Bago Region', '2019-08-14 13:03:28', '2019-08-14 13:03:28'),
(210, ' Kywebwe', ' Taungoo', 'Bago Region', '2019-08-14 13:03:28', '2019-08-14 13:03:28'),
(211, ' Mone', ' Taungoo', 'Bago Region', '2019-08-14 13:03:28', '2019-08-14 13:03:28'),
(212, ' Myohla', ' Taungoo', 'Bago Region', '2019-08-14 13:03:28', '2019-08-14 13:03:28'),
(213, ' Natthangwin', ' Taungoo', 'Bago Region', '2019-08-14 13:03:29', '2019-08-14 13:03:29'),
(214, ' Nyaungbinthar', ' Taungoo', 'Bago Region', '2019-08-14 13:03:30', '2019-08-14 13:03:30'),
(215, ' Oktwin', ' Taungoo', 'Bago Region', '2019-08-14 13:03:30', '2019-08-14 13:03:30'),
(216, ' Pyu', ' Taungoo', 'Bago Region', '2019-08-14 13:03:30', '2019-08-14 13:03:30'),
(217, ' Swa', ' Taungoo', 'Bago Region', '2019-08-14 13:03:31', '2019-08-14 13:03:31'),
(218, ' Tantabin', ' Taungoo', 'Bago Region', '2019-08-14 13:03:31', '2019-08-14 13:03:31'),
(219, ' Taungoo', ' Taungoo', 'Bago Region', '2019-08-14 13:03:31', '2019-08-14 13:03:31'),
(220, ' Thagara', ' Taungoo', 'Bago Region', '2019-08-14 13:03:31', '2019-08-14 13:03:31'),
(221, ' Yaeni', ' Taungoo', 'Bago Region', '2019-08-14 13:03:31', '2019-08-14 13:03:31'),
(222, ' Yedashe', ' Taungoo', 'Bago Region', '2019-08-14 13:03:31', '2019-08-14 13:03:31'),
(223, ' Innma', ' Pyay', 'Bago Region', '2019-08-14 13:03:32', '2019-08-14 13:03:32'),
(224, ' Okshipin', ' Pyay', 'Bago Region', '2019-08-14 13:03:33', '2019-08-14 13:03:33'),
(225, ' Padaung', ' Pyay', 'Bago Region', '2019-08-14 13:03:34', '2019-08-14 13:03:34'),
(226, ' Padigone', ' Pyay', 'Bago Region', '2019-08-14 13:03:34', '2019-08-14 13:03:34'),
(227, ' Paukkaung', ' Pyay', 'Bago Region', '2019-08-14 13:03:34', '2019-08-14 13:03:34'),
(228, ' Paungdale', ' Pyay', 'Bago Region', '2019-08-14 13:03:34', '2019-08-14 13:03:34'),
(229, ' Paungde', ' Pyay', 'Bago Region', '2019-08-14 13:03:34', '2019-08-14 13:03:34'),
(230, ' Pyay', ' Pyay', 'Bago Region', '2019-08-14 13:03:34', '2019-08-14 13:03:34'),
(231, ' Shwedaung', ' Pyay', 'Bago Region', '2019-08-14 13:03:34', '2019-08-14 13:03:34'),
(232, ' Sinmeswe', ' Pyay', 'Bago Region', '2019-08-14 13:03:35', '2019-08-14 13:03:35'),
(233, ' Thegon', ' Pyay', 'Bago Region', '2019-08-14 13:03:35', '2019-08-14 13:03:35'),
(234, ' Gyobingauk', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:35', '2019-08-14 13:03:35'),
(235, ' Letpadan', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:35', '2019-08-14 13:03:35'),
(236, ' Minhla', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:35', '2019-08-14 13:03:35'),
(237, ' Monyo', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:35', '2019-08-14 13:03:35'),
(238, ' Nattalin', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:36', '2019-08-14 13:03:36'),
(239, ' Okpho', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:36', '2019-08-14 13:03:36'),
(240, ' Ooethegone', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:37', '2019-08-14 13:03:37'),
(241, ' Sitkwin', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:37', '2019-08-14 13:03:37'),
(242, ' Tapun', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:37', '2019-08-14 13:03:37'),
(243, ' Tharrawaddy', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:37', '2019-08-14 13:03:37'),
(244, ' Thonze', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:37', '2019-08-14 13:03:37'),
(245, ' Zigon', ' Thayarwady', 'Bago Region', '2019-08-14 13:03:37', '2019-08-14 13:03:37'),
(246, ' Botataung', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:37', '2019-08-14 13:03:37'),
(247, ' City', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:37', '2019-08-14 13:03:37'),
(248, ' Dagon Seikkan', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:38', '2019-08-14 13:03:38'),
(249, ' Dawbon', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:38', '2019-08-14 13:03:38'),
(250, ' East Dagon', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:38', '2019-08-14 13:03:38'),
(251, ' Mingala Taungnyunt', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:38', '2019-08-14 13:03:38'),
(252, ' North Dagon', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(253, ' North Okkalapa', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(254, ' Pazundaung', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(255, ' South Dagon', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(256, ' South Okkalapa', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(257, ' Tamwe', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(258, ' Thaketa', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(259, ' Thingangyun', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(260, ' Yankin', ' East Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(261, ' City', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(262, ' Hlaingthaya', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:39', '2019-08-14 13:03:39'),
(263, ' Hlegu', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(264, ' Hmawbi', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(265, ' Htantabin', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(266, ' Insein', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(267, ' Mingaladon', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(268, ' Rural', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(269, ' Shwepyitha', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(270, ' Taikkyi', ' North Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(271, ' City', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:40', '2019-08-14 13:03:40'),
(272, ' Cocokyun', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(273, ' Dala', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(274, ' Kawhmu', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(275, ' Kayan', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(276, ' Kungyangon', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(277, ' Kyauktan', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(278, ' Rural', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(279, ' Seikkyi Kanaungto', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(280, ' Tada', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(281, ' Thanlyin', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:41', '2019-08-14 13:03:41'),
(282, ' Thongwa', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:42', '2019-08-14 13:03:42'),
(283, ' Twante', ' South Yangon', 'Yangon Region', '2019-08-14 13:03:42', '2019-08-14 13:03:42'),
(284, ' Ahlon', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:42', '2019-08-14 13:03:42'),
(285, ' Bahan', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:42', '2019-08-14 13:03:42'),
(286, ' City', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:42', '2019-08-14 13:03:42'),
(287, ' Dagon', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:42', '2019-08-14 13:03:42'),
(288, ' Hlaing', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:42', '2019-08-14 13:03:42'),
(289, ' Kamayut', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:42', '2019-08-14 13:03:42'),
(290, ' Kyauktada', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:43', '2019-08-14 13:03:43'),
(291, ' Kyimyindaing', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:43', '2019-08-14 13:03:43'),
(292, ' Lanmadaw', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:43', '2019-08-14 13:03:43'),
(293, ' Latha', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:43', '2019-08-14 13:03:43'),
(294, ' Mayangon', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(295, ' Pabedan', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(296, ' Sanchaung', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(297, ' Seikkan', ' West Yangon(Downtown)', 'Yangon Region', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(298, ' Bhamo', ' Bhamo', 'Kachin State', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(299, ' Dotphoneyan', ' Bhamo', 'Kachin State', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(300, ' Lwegel', ' Bhamo', 'Kachin State', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(301, ' Mansi', ' Bhamo', 'Kachin State', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(302, ' Momauk', ' Bhamo', 'Kachin State', '2019-08-14 13:03:44', '2019-08-14 13:03:44'),
(303, ' Myohla', ' Bhamo', 'Kachin State', '2019-08-14 13:03:45', '2019-08-14 13:03:45'),
(304, ' Shwegu', ' Bhamo', 'Kachin State', '2019-08-14 13:03:45', '2019-08-14 13:03:45'),
(305, ' Hopin', ' Mohnyin', 'Kachin State', '2019-08-14 13:03:45', '2019-08-14 13:03:45'),
(306, ' Hpakant', ' Mohnyin', 'Kachin State', '2019-08-14 13:03:45', '2019-08-14 13:03:45'),
(307, ' Kamine', ' Mohnyin', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(308, ' Mogaung', ' Mohnyin', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(309, ' Mohnyin', ' Mohnyin', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(310, ' Chipwi', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(311, ' Hsadone', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(312, ' Hsawlaw', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(313, ' Hsinbo', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(314, ' Injangyang', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(315, ' Kanpaikti', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:46', '2019-08-14 13:03:46'),
(316, ' Myitkyina', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:47', '2019-08-14 13:03:47'),
(317, ' Panwa', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:47', '2019-08-14 13:03:47'),
(318, ' Shinbwayyan', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:47', '2019-08-14 13:03:47'),
(319, ' Tanai', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:48', '2019-08-14 13:03:48'),
(320, ' Waingmaw', ' Myitkyina', 'Kachin State', '2019-08-14 13:03:50', '2019-08-14 13:03:50'),
(321, ' Kawnglanghpu', ' Putao', 'Kachin State', '2019-08-14 13:03:51', '2019-08-14 13:03:51'),
(322, ' Machanbaw', ' Putao', 'Kachin State', '2019-08-14 13:03:51', '2019-08-14 13:03:51'),
(323, ' Nogmung', ' Putao', 'Kachin State', '2019-08-14 13:03:51', '2019-08-14 13:03:51'),
(324, ' Pannandin', ' Putao', 'Kachin State', '2019-08-14 13:03:51', '2019-08-14 13:03:51'),
(325, ' Putao', ' Putao', 'Kachin State', '2019-08-14 13:03:51', '2019-08-14 13:03:51'),
(326, ' Sumprabum', ' Putao', 'Kachin State', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(327, ' Donhee', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(328, ' Hkamti', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(329, ' Homalin', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(330, ' Htanparkway', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(331, ' Lahe', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(332, ' Leshi Township (Lay', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(333, ' Mobaingluk', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(334, ' Nanyun', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(335, ' Pansaung', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(336, ' Sonemara', ' Hkamti', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(337, ' Kanbalu', ' Kanbalu', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(338, ' Kyunhla', ' Kanbalu', 'Sagaing Region', '2019-08-14 13:03:52', '2019-08-14 13:03:52'),
(339, ' Taze', ' Kanbalu', 'Sagaing Region', '2019-08-14 13:03:53', '2019-08-14 13:03:53'),
(340, ' Ye-U', ' Kanbalu', 'Sagaing Region', '2019-08-14 13:03:53', '2019-08-14 13:03:53'),
(341, ' Kale', ' Kale', 'Sagaing Region', '2019-08-14 13:03:53', '2019-08-14 13:03:53'),
(342, ' Kalewa', ' Kale', 'Sagaing Region', '2019-08-14 13:03:54', '2019-08-14 13:03:54'),
(343, ' Mingin', ' Kale', 'Sagaing Region', '2019-08-14 13:03:55', '2019-08-14 13:03:55'),
(344, ' Banmauk', ' Katha', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(345, ' Indaw', ' Katha', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(346, ' Katha', ' Katha', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(347, ' Kawlin', ' Katha', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(348, ' Pinlebu', ' Katha', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(349, ' Tigyaing', ' Katha', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(350, ' Wuntho', ' Katha', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(351, ' Mawlaik', ' Mawlaik', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(352, ' Paungbyin', ' Mawlaik', 'Sagaing Region', '2019-08-14 13:03:56', '2019-08-14 13:03:56'),
(353, ' Ayadaw', ' Monywa', 'Sagaing Region', '2019-08-14 13:03:57', '2019-08-14 13:03:57'),
(354, ' Budalin', ' Monywa', 'Sagaing Region', '2019-08-14 13:03:57', '2019-08-14 13:03:57'),
(355, ' Chaung-U', ' Monywa', 'Sagaing Region', '2019-08-14 13:03:59', '2019-08-14 13:03:59'),
(356, ' Monywa', ' Monywa', 'Sagaing Region', '2019-08-14 13:04:00', '2019-08-14 13:04:00'),
(357, ' Myaung', ' Sagaing', 'Sagaing Region', '2019-08-14 13:04:01', '2019-08-14 13:04:01'),
(358, ' Myinmu', ' Sagaing', 'Sagaing Region', '2019-08-14 13:04:02', '2019-08-14 13:04:02'),
(359, ' Sagaing', ' Sagaing', 'Sagaing Region', '2019-08-14 13:04:03', '2019-08-14 13:04:03'),
(360, ' Khin-U', ' Shwebo', 'Sagaing Region', '2019-08-14 13:04:04', '2019-08-14 13:04:04'),
(361, ' Kyaukmyaung', ' Shwebo', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(362, ' Shwebo', ' Shwebo', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(363, ' Tabayin', ' Shwebo', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(364, ' Wetlet', ' Shwebo', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(365, ' Khampat', ' Tamu', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(366, ' Myothit', ' Tamu', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(367, ' Tamu', ' Tamu', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(368, ' Kani', ' Yinmabin', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(369, ' Pale', ' Yinmabin', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(370, ' Salingyi', ' Yinmabin', 'Sagaing Region', '2019-08-14 13:04:05', '2019-08-14 13:04:05'),
(371, ' Yinmabin', ' Yinmabin', 'Sagaing Region', '2019-08-14 13:04:06', '2019-08-14 13:04:06'),
(372, ' Bawgali', ' Hpa-an', 'Kayin State', '2019-08-14 13:04:06', '2019-08-14 13:04:06'),
(373, ' Hlaignbwe', ' Hpa-an', 'Kayin State', '2019-08-14 13:04:06', '2019-08-14 13:04:06'),
(374, ' Hpa-an', ' Hpa-an', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(375, ' Leiktho', ' Hpa-an', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(376, ' Paingkyon', ' Hpa-an', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(377, ' Shan Ywathit', ' Hpa-an', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(378, ' Thandaunggyi', ' Hpa-an', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(379, ' Hpapun', ' Hpapun', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(380, ' Kamamaung', ' Hpapun', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(381, ' Kawkareik', ' Kawkareik', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(382, ' Kyaidon', ' Kawkareik', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(383, ' Kyain Seikgyi', ' Kawkareik', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(384, ' Payarthonezu', ' Kawkareik', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(385, ' Myawaddy', ' Myawaddy', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(386, ' Sugali', ' Myawaddy', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(387, ' Wawlaymyaing', ' Myawaddy', 'Kayin State', '2019-08-14 13:04:07', '2019-08-14 13:04:07'),
(388, ' Chaungzon', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(389, ' Khawzar', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(390, ' Kyaikkhami', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(391, ' Kyaikmaraw', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(392, ' Lamine', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(393, ' Mawlamyine', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(394, ' Mudon', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(395, ' Thanbyuzayat', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(396, ' Ye', ' Mawlamyine', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(397, ' Bilin', ' Thaton', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(398, ' Kyaikto', ' Thaton', 'Mon State', '2019-08-14 13:04:08', '2019-08-14 13:04:08'),
(399, ' Mottama', ' Thaton', 'Mon State', '2019-08-14 13:04:09', '2019-08-14 13:04:09'),
(400, ' Paung', ' Thaton', 'Mon State', '2019-08-14 13:04:09', '2019-08-14 13:04:09'),
(401, ' Suvannawadi', ' Thaton', 'Mon State', '2019-08-14 13:04:09', '2019-08-14 13:04:09'),
(402, ' Thaton', ' Thaton', 'Mon State', '2019-08-14 13:04:09', '2019-08-14 13:04:09'),
(403, ' Zingyeik', ' Thaton', 'Mon State', '2019-08-14 13:04:09', '2019-08-14 13:04:09'),
(404, ' Dawei', ' Dawei', 'Tanintharyi Region', '2019-08-14 13:04:09', '2019-08-14 13:04:09'),
(405, ' Kaleinaung', ' Dawei', 'Tanintharyi Region', '2019-08-14 13:04:09', '2019-08-14 13:04:09'),
(406, ' Launglon', ' Dawei', 'Tanintharyi Region', '2019-08-14 13:04:09', '2019-08-14 13:04:09'),
(407, ' Myitta', ' Dawei', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(408, ' Thayetchaung', ' Dawei', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(409, ' Yebyu', ' Dawei', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(410, ' Bokpyin', ' Kawthoung', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(411, ' Karathuri', ' Kawthoung', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(412, ' Kawthoung', ' Kawthoung', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(413, ' Khamaukgyi', ' Kawthoung', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(414, ' Pyigyimandaing', ' Kawthoung', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(415, ' Kyunsu', ' Myeik', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(416, ' Myeik', ' Myeik', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(417, ' Palauk', ' Myeik', 'Tanintharyi Region', '2019-08-14 13:04:10', '2019-08-14 13:04:10'),
(418, ' Palaw', ' Myeik', 'Tanintharyi Region', '2019-08-14 13:04:11', '2019-08-14 13:04:11'),
(419, ' Tanintharyi', ' Myeik', 'Tanintharyi Region', '2019-08-14 13:04:11', '2019-08-14 13:04:11'),
(420, ' Cikha', ' Falam', 'Chin State', '2019-08-14 13:04:12', '2019-08-14 13:04:12'),
(421, ' Falam', ' Falam', 'Chin State', '2019-08-14 13:04:14', '2019-08-14 13:04:14'),
(422, ' Rikhuadal', ' Falam', 'Chin State', '2019-08-14 13:04:15', '2019-08-14 13:04:15'),
(423, ' Tiddim', ' Falam', 'Chin State', '2019-08-14 13:04:16', '2019-08-14 13:04:16'),
(424, ' Ton Zang', ' Falam', 'Chin State', '2019-08-14 13:04:17', '2019-08-14 13:04:17'),
(425, ' Hakha', ' Hakha', 'Chin State', '2019-08-14 13:04:18', '2019-08-14 13:04:18'),
(426, ' Htantlang', ' Hakha', 'Chin State', '2019-08-14 13:04:20', '2019-08-14 13:04:20'),
(427, ' Kanpetlet', ' Mindat', 'Chin State', '2019-08-14 13:04:22', '2019-08-14 13:04:22'),
(428, ' Matupi', ' Mindat', 'Chin State', '2019-08-14 13:04:23', '2019-08-14 13:04:23'),
(429, ' Mindat', ' Mindat', 'Chin State', '2019-08-14 13:04:24', '2019-08-14 13:04:24'),
(430, ' Paletwa', ' Mindat', 'Chin State', '2019-08-14 13:04:25', '2019-08-14 13:04:25'),
(431, ' Reazu', ' Mindat', 'Chin State', '2019-08-14 13:04:25', '2019-08-14 13:04:25'),
(432, ' Sami', ' Mindat', 'Chin State', '2019-08-14 13:04:26', '2019-08-14 13:04:26'),
(433, ' Ann', ' Kyaukpyu', 'Rakhine State', '2019-08-14 13:04:26', '2019-08-14 13:04:26'),
(434, ' Kyaukpyu', ' Kyaukpyu', 'Rakhine State', '2019-08-14 13:04:26', '2019-08-14 13:04:26'),
(435, ' Manaung', ' Kyaukpyu', 'Rakhine State', '2019-08-14 13:04:26', '2019-08-14 13:04:26'),
(436, ' Ramree', ' Kyaukpyu', 'Rakhine State', '2019-08-14 13:04:26', '2019-08-14 13:04:26'),
(437, ' Buthidaung', ' Maungdaw', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(438, ' Maungdaw', ' Maungdaw', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(439, ' Taungpyoletwe', ' Maungdaw', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(440, ' Pauktaw', ' Sittwe', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(441, ' Ponnagyun', ' Sittwe', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(442, ' Rathedaung', ' Sittwe', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(443, ' Sittwe', ' Sittwe', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(444, ' Gaw', ' Thandwe', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(445, ' Kyeintali', ' Thandwe', 'Rakhine State', '2019-08-14 13:04:27', '2019-08-14 13:04:27'),
(446, ' Maei', ' Thandwe', 'Rakhine State', '2019-08-14 13:04:28', '2019-08-14 13:04:28'),
(447, ' Thandwe', ' Thandwe', 'Rakhine State', '2019-08-14 13:04:28', '2019-08-14 13:04:28'),
(448, ' Toungup', ' Thandwe', 'Rakhine State', '2019-08-14 13:04:28', '2019-08-14 13:04:28'),
(449, ' Kyauktaw', ' Mrauk-U', 'Rakhine State', '2019-08-14 13:04:28', '2019-08-14 13:04:28'),
(450, ' Minbya', ' Mrauk-U', 'Rakhine State', '2019-08-14 13:04:28', '2019-08-14 13:04:28'),
(451, ' Mrauk-U', ' Mrauk-U', 'Rakhine State', '2019-08-14 13:04:29', '2019-08-14 13:04:29'),
(452, ' Myebon', ' Mrauk-U', 'Rakhine State', '2019-08-14 13:04:29', '2019-08-14 13:04:29');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'fsf', 'fsf@gmail.com', NULL, '$2y$10$n7Z/hJxIY8rE6IdVHlEZEecJymDk0N.FX2eWYsdcnqMGyTsVKevsu', NULL, '2019-08-09 20:51:17', '2019-08-09 20:51:17'),
(2, 'kyaw', 'kyawthi547@gmail.com', NULL, '$2y$10$6B1SxKylVjMarNxx4.1BpOLHRBdUi3sMbP.cQHltqkQ0ObRx2owEu', NULL, '2019-08-10 04:35:50', '2019-08-10 04:35:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_phone_no_unique` (`phone_no`);

--
-- Indexes for table `menucategories`
--
ALTER TABLE `menucategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menucategories_name_unique` (`name`);
ALTER TABLE `menucategories` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `menuranks`
--
ALTER TABLE `menuranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shopuser_id` (`shopuser_id`),
  ADD KEY `menucategory_id` (`menucategory_id`);
ALTER TABLE `menus` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `shopcategories`
--
ALTER TABLE `shopcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shopcategories_name_unique` (`name`);
ALTER TABLE `shopcategories` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `shopranks`
--
ALTER TABLE `shopranks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_index` (`customer_id`,`shopuser_id`),
  ADD KEY `shopranks_shopuser_id_foreign` (`shopuser_id`);

--
-- Indexes for table `shopusers`
--
ALTER TABLE `shopusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shopusers_email_unique` (`email`),
  ADD KEY `shopcategoryid` (`shopcategory_id`),
  ADD KEY `shop_citiy_id` (`shop_cities_id`);

--
-- Indexes for table `shop_cities`
--
ALTER TABLE `shop_cities`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `shop_cities` ADD FULLTEXT KEY `township` (`township`);

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
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `menucategories`
--
ALTER TABLE `menucategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menuranks`
--
ALTER TABLE `menuranks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `shopcategories`
--
ALTER TABLE `shopcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `shopranks`
--
ALTER TABLE `shopranks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `shopusers`
--
ALTER TABLE `shopusers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `shop_cities`
--
ALTER TABLE `shop_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `menuranks`
--
ALTER TABLE `menuranks`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menucategory_id` FOREIGN KEY (`menucategory_id`) REFERENCES `menucategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shopuser_id` FOREIGN KEY (`shopuser_id`) REFERENCES `shopusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shopranks`
--
ALTER TABLE `shopranks`
  ADD CONSTRAINT `shopranks_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shopranks_shopuser_id_foreign` FOREIGN KEY (`shopuser_id`) REFERENCES `shopusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shopusers`
--
ALTER TABLE `shopusers`
  ADD CONSTRAINT `shop_citiy_id` FOREIGN KEY (`shop_cities_id`) REFERENCES `shop_cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shopcategoryid` FOREIGN KEY (`shopcategory_id`) REFERENCES `shopcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
