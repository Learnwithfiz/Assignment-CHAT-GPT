-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 15, 2024 at 10:34 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_chat_gpt`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_03_15_075522_set_user_gpt_api', 1),
(4, '2024_03_15_075943_user_gpt_info', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'my-app-token', '44da786aaa1cdb638d40f63c71eb3961853ed3ff8163cce34848c8574fbee79d', '[\"*\"]', '2024-03-15 03:17:51', NULL, '2024-03-15 02:48:09', '2024-03-15 03:17:51'),
(2, 'App\\Models\\User', 3, 'my-app-token', '7909b6648268e146a9a751a683e9e2cb2cbe82b0fda1165d89cf3afce3e1d7cd', '[\"*\"]', '2024-03-15 03:44:23', NULL, '2024-03-15 03:14:49', '2024-03-15 03:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `set_user_gpt_api`
--

DROP TABLE IF EXISTS `set_user_gpt_api`;
CREATE TABLE IF NOT EXISTS `set_user_gpt_api` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `API_KEY` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_active` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `inserted_date` timestamp NOT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `set_user_gpt_api`
--

INSERT INTO `set_user_gpt_api` (`id`, `email`, `API_KEY`, `status_active`, `is_deleted`, `inserted_date`, `update_date`) VALUES
(1, 'fiz1@gmail.com', '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', 1, 0, '2015-03-23 18:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'fiz', 'fiz1@gmail.com', NULL, '1234@456', NULL, '2015-03-23 18:00:00', NULL),
(3, 'puspo', 'puspo@gmail.com', NULL, '1234', NULL, '2015-03-23 18:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_gpt_info`
--

DROP TABLE IF EXISTS `user_gpt_info`;
CREATE TABLE IF NOT EXISTS `user_gpt_info` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gpt_search_info` varchar(1200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_active` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `inserted_date` timestamp NOT NULL,
  `question` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_gpt_info`
--

INSERT INTO `user_gpt_info` (`id`, `user_id`, `gpt_search_info`, `status_active`, `is_deleted`, `inserted_date`, `question`) VALUES
(1, 1, 'Sure, here is an example of a simple C program that prints \"Hello, World\" to the console:\n\n```c\n#include <stdio.h>\n\nint main() {\n    printf(\"Hello, World!\\n\");\n    return 0;\n}\n```\n\nYou can compile this program using a C compiler, such as GCC, and then run the compiled executable to see the output.', 1, 0, '2015-03-23 18:00:00', ''),
(2, 1, 'Yes, Learn With Fiz is a popular online platform that offers educational videos and tutorials on a variety of subjects, including math, science, language arts, and more. The platform aims to make learning engaging and fun for students of all ages. Users can access a wide range of educational content to enhance their knowledge and skills in different subjects.', 1, 0, '2015-03-23 18:00:00', ''),
(3, 1, 'Yes, I know Shakib Al Hasan. He is a Bangladeshi cricketer who is considered one of the best all-rounders in the world. Shakib has represented Bangladesh in all three formats of the game and has achieved numerous records and accolades throughout his career. He has been a key player for Bangladesh cricket team and has also played in various T20 leagues around the world.', 1, 0, '2015-03-23 18:00:00', ''),
(4, 3, 'Yes, I am familiar with Tamim Iqbal. He is a professional cricketer from Bangladesh who is considered one of their most talented and successful batsmen. Tamim plays as an opening batsman in all formats of the game and has represented Bangladesh in international cricket since 2007. He has scored numerous centuries and has been a key player for the Bangladesh national team.', 1, 0, '2015-03-23 18:00:00', ''),
(5, 3, 'I\'m aware that Mostafizur Rahman is a common name, and it is likely that there are many individuals with this name. Without more specific information, I cannot provide details about a specific person named Mostafizur Rahman.', 1, 0, '2015-03-23 18:00:00', 'Do You Know Mostafizur Rahman'),
(6, 3, 'I do not have any specific information about an individual named Mostafizur Rahman. If you have any specific details or context you can provide, I can try to assist further.', 1, 0, '2015-03-23 18:00:00', 'Do You Know Mostafizur Rahman'),
(7, 3, 'Here is a simple C program to calculate the sum of two numbers:\n\n```c\n#include <stdio.h>\n\nint main() {\n    int num1, num2, sum;\n    \n    // Get the inputs from the user\n    printf(\"Enter first number: \");\n    scanf(\"%d\", &num1);\n    \n    printf(\"Enter second number: \");\n    scanf(\"%d\", &num2);\n    \n    // Calculate the sum\n    sum = num1 + num2;\n    \n    // Display the result\n    printf(\"Sum of %d and %d is %d\\n\", num1, num2, sum);\n    \n    return 0;\n}\n```\n\nThis program takes two numbers as input from the user and calculates their sum. It then displays the sum as output.', 1, 0, '2015-03-23 18:00:00', 'Write a c program sum two number'),
(8, 3, '```c\n#include <stdio.h>\n\nint main() {\n    int num1, num2, sum;\n\n    printf(\"Enter the first number: \");\n    scanf(\"%d\", &num1);\n\n    printf(\"Enter the second number: \");\n    scanf(\"%d\", &num2);\n\n    sum = num1 + num2;\n\n    printf(\"The sum of %d and %d is %d\\n\", num1, num2, sum);\n\n    return 0;\n}\n```', 1, 0, '2015-03-23 18:00:00', 'Write a c program sum two number');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
