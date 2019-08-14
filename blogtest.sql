-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 14, 2019 at 01:45 AM
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
(2, 'kyaw thi ha', '09440813572', '$2y$10$7wHlkBlorlbJuCHXNV5oKOXQi21NwLm16bLiiCru.EK8Taf/Ze.Qq', 'http://www.google.com', NULL, '2019-08-12 06:18:56', '2019-08-12 06:18:56'),
(3, 'Aung', '09440813432', '$2y$10$Dm925WaLPe7/J/RDtZHSEOKHXTORFO3/HuzvDpsAXYGPxsP5K0gj6', 'http://www.google.com', NULL, '2019-08-12 06:19:11', '2019-08-12 06:19:11'),
(4, 'MOe', '09440813234', '$2y$10$CLNtG5EUhvdKojriaXsJ7eYH9zlWpnqE6tMQdcdeu0rM/6zw7pJnm', 'http://www.google.com', NULL, '2019-08-12 06:19:23', '2019-08-12 06:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `menucategories`
--

CREATE TABLE `menucategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(13, '2019_08_12_094916_create_shopranks_table', 5);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shopranks`
--

INSERT INTO `shopranks` (`id`, `customer_id`, `shopuser_id`, `rank`, `review`, `created_at`, `updated_at`) VALUES
(39, 1, 1, 4, NULL, NULL, NULL),
(40, 2, 1, 3, NULL, NULL, NULL),
(42, 3, 1, 3, NULL, NULL, NULL),
(44, 1, 12, 3, NULL, '2019-08-12 16:55:47', '2019-08-12 16:55:47');

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
     UPDATE shopusers SET shopusers.rank=(((5*shopusers.rank5)+(4*shopusers.rank4)+(3*shopusers.rank3)+(2*shopusers.rank2)+(1*shopusers.rank1))/(1+shopusers.rank1+shopusers.rank2+shopusers.rank3+shopusers.rank4+shopusers.rank5)) WHERE shopusers.id=OLD.shopuser_id;
    END IF;
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
  `shopcategory_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
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

INSERT INTO `shopusers` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile_url`, `address`, `latitude`, `longitude`, `phone_no`, `shopcategory_id`, `remember_token`, `created_at`, `updated_at`, `rank1`, `rank2`, `rank3`, `rank4`, `rank5`, `rank`) VALUES
(1, 'kyaw', 'kyawthi547@gmail.com', NULL, '$2y$10$DUqdkE9YHalSWzfm5mYHiuK.VLp7rhwVoUoO1rK1FJ4urom1e/U0y', 'fsfsf', 'efrewrfwef', 53535, 423424, '23rwr32423r', 1, NULL, '2019-08-10 06:41:47', '2019-08-10 06:41:47', 0, 0, 2, 1, 0, 2.5),
(4, 'kyaw', 'thiha0905@gmail.com', NULL, '$2y$10$yjXJVrlF39op/VY0f03.J.w9OJ883k0pYqZ1NlbtAKmAU/yOzAAzm', 'fsfsf', 'efrewrfwef', 53535, 423424, '23rwr32423r', 2, NULL, '2019-08-10 19:17:30', '2019-08-10 19:17:30', 0, 0, 0, 0, 0, 0),
(5, 'lwin Moe Hain', 'lwin@gmail.com', NULL, '$2y$10$EM.cVeLboxm2DFJ6nD6K9eo58R8ArMw1wDDN1Nq1lVmVCTG0O2XCS', 'fsfsf', 'Pakokku', 53535, 423424, '23rwr32423r', 1, NULL, '2019-08-10 19:21:25', '2019-08-10 19:21:25', 0, 0, 0, 0, 1, 0),
(6, 'King', 'king@gmail.com', NULL, '$2y$10$/WzgLmaSJJA4JaKz2UVUhOaUWbrivikMlzlIDbQHkBErjgkEOSqXu', 'http://www.fjsljf.com/sfjldsfsfsl', 'Pakokku', 53535, 423424, '23rwr32423r', 1, NULL, '2019-08-10 21:27:38', '2019-08-10 21:27:38', 0, 0, 0, 0, 0, 0),
(7, 'Myo Kyaw Htun', 'myolay@gmail.com', NULL, '$2y$10$WyEWKmA62d3tvZRHH1ckf.61pJy2xMGk1LTfiGwdz2wksEjfM6Svm', 'http://www.fjsljf.com/sfjldsfsfsl', 'Pakokku', 53535, 423424, '09778673750', 2, NULL, '2019-08-10 21:35:25', '2019-08-10 21:35:25', 0, 0, 0, 0, 0, 0),
(8, 'Myo Kyaw Htun', 'myay@gmail.com', NULL, '$2y$10$Tqeh8wuY5zmDCujU2skbGOCKG4V0rlN5l4Ynx4UHLByCNoBtoesdO', 'http://www.fjsljf.com/sfjldsfsfsl', 'Pakokku', 53535, -33.1, '09778673755', 1, NULL, '2019-08-10 21:37:48', '2019-08-10 21:37:48', 0, 0, 0, 0, 0, 0),
(10, 'Myo Kyaw Htuyaw Htunfjsihfihsilfhilsjfijklsjfkljsklfjioweeriowejfoijewifjio', 'hello@gmail.com', NULL, '$2y$10$Nj6vMPzA84rdNi957shMxugF.NIOGKWBlKq6/wRajTiWZXeB8P4de', 'http://www.kyaw.com', 'Pakokku', 53535, -33.1, '09778673755', 1, NULL, '2019-08-11 03:17:24', '2019-08-11 03:17:24', 0, 0, 0, 0, 0, 0),
(12, 'Moe Kaung Kin', 'moe@gmail.com', NULL, '$2y$10$IfK13wjvcwrJMzcaWsbAoOLoPd5zXIxxcDwRuoCc2ew/8MxyMQpLK', 'http://www.kyaw.com', 'Pakokku', 53535, -33.1, '09778673755', 1, NULL, '2019-08-12 16:53:45', '2019-08-12 16:53:45', 0, 0, 1, 0, 0, 1.5);

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
  ADD KEY `shopcategoryid` (`shopcategory_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `shopusers`
--
ALTER TABLE `shopusers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `shopcategoryid` FOREIGN KEY (`shopcategory_id`) REFERENCES `shopcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
