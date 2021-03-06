-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2021 at 03:35 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laraquiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `category_name`, `created_at`, `updated_at`, `id_level`) VALUES
(1, 'Matematika', '2021-01-21 01:56:00', '2021-01-25 03:05:53', 1),
(2, 'Biologi', '2021-01-21 01:57:00', '2021-01-25 03:05:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(41, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(42, 6, 'idq', 'text', 'Idq', 1, 1, 1, 1, 1, 0, '{}', 3),
(43, 6, 'answer', 'rich_text_box', 'Answer', 0, 1, 1, 1, 1, 1, '{\"view\":\"answer\"}', 6),
(44, 6, 'score', 'text', 'Score', 0, 1, 1, 1, 1, 1, '{\"view\":\"score\",\"validation\":{\"rule\":\"required\",\"massage\":{\"required\":\"This Input Must.\"}}}', 5),
(45, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(46, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(48, 6, 'correct_answer', 'checkbox', 'Correct Answer', 0, 1, 1, 1, 1, 1, '{\"view\":\"correct_answer\"}', 4),
(50, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(51, 10, 'quiz_name', 'text', 'Quiz Name', 0, 1, 1, 1, 1, 1, '{}', 4),
(52, 10, 'gambar', 'image', 'Gambar', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 5),
(53, 10, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{}', 6),
(54, 10, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 7),
(55, 10, 'start_date', 'timestamp', 'Start Date', 0, 1, 1, 1, 1, 1, '{\"description\":\"This Input For Time Start Quiz\"}', 8),
(56, 10, 'end_date', 'timestamp', 'End Date', 0, 1, 1, 1, 1, 1, '{\"description\":\"This Input For End Quiz\"}', 9),
(57, 10, 'id_groups', 'text', 'Id Groups', 0, 1, 1, 1, 1, 1, '{}', 10),
(58, 10, 'id_questions', 'text', 'Questions', 0, 1, 1, 1, 1, 1, '{}', 11),
(59, 10, 'duration', 'text', 'Duration', 0, 1, 1, 1, 1, 1, '{\"description\":\"This Input For Duration Quiz (in Minutes)\"}', 12),
(60, 10, 'pass_percentage', 'text', 'Pass Percentage', 0, 1, 1, 1, 1, 1, '{}', 13),
(61, 10, 'with_login', 'checkbox', 'With Login', 0, 1, 1, 1, 1, 1, '{\"description\":\"Check it If  Quiz Need Login\",\"on\":\"Yes\",\"off\":\"No\",\"checked\":true}', 14),
(62, 10, 'inserted_by', 'text', 'Inserted By', 0, 1, 1, 1, 1, 1, '{}', 15),
(63, 10, 'quiz_price', 'text', 'Quiz Price', 0, 1, 1, 1, 1, 1, '{}', 16),
(64, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 17),
(65, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 18),
(66, 10, 'quiss_belongsto_group_relationship', 'relationship', 'Group Quiz', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Group\",\"table\":\"groups\",\"type\":\"belongsTo\",\"column\":\"id_groups\",\"key\":\"id\",\"label\":\"group_name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(67, 10, 'quiss_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"inserted_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(68, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 11, 'group_name', 'text', 'Group Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2),
(70, 11, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3),
(71, 11, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric\"}}', 4),
(72, 11, 'valid_for_days', 'text', 'Valid For Days', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric\"}}', 5),
(73, 11, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 6),
(74, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(75, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(76, 6, 'option_belongsto_qbank_relationship', 'relationship', 'qbanks', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Qbank\",\"table\":\"qbanks\",\"type\":\"belongsTo\",\"column\":\"idq\",\"key\":\"id\",\"label\":\"question\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(77, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(78, 15, 'level_name', 'text', 'Level Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(79, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(80, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(81, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 16, 'category_name', 'text', 'Category Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(83, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(84, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(90, 16, 'id_level', 'text', 'Id Level', 0, 1, 1, 1, 1, 1, '{}', 6),
(91, 16, 'category_belongsto_level_relationship', 'relationship', 'levels', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Level\",\"table\":\"levels\",\"type\":\"belongsTo\",\"column\":\"id_level\",\"key\":\"id\",\"label\":\"level_name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(92, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(93, 17, 'id_quiz', 'text', 'Id Quiz', 0, 1, 1, 1, 1, 1, '{}', 2),
(94, 17, 'id_user', 'text', 'Id User', 0, 1, 1, 1, 1, 1, '{}', 3),
(95, 17, 'result_status', 'text', 'Result Status', 0, 1, 1, 1, 1, 1, '{}', 4),
(96, 17, 'start_time', 'text', 'Start Time', 0, 1, 1, 1, 1, 1, '{}', 5),
(97, 17, 'end_time', 'text', 'End Time', 0, 1, 1, 1, 1, 1, '{}', 6),
(98, 17, 'categories', 'text', 'Categories', 0, 1, 1, 1, 1, 1, '{}', 7),
(99, 17, 'individual_time', 'text', 'Individual Time', 0, 1, 1, 1, 1, 1, '{}', 8),
(100, 17, 'total_time', 'text', 'Total Time', 0, 1, 1, 1, 1, 1, '{}', 9),
(101, 17, 'score_obtained', 'text', 'Score Obtained', 0, 1, 1, 1, 1, 1, '{}', 10),
(102, 17, 'percentage_obtained', 'text', 'Percentage Obtained', 0, 1, 1, 1, 1, 1, '{}', 11),
(103, 17, 'attempted_ip', 'text', 'Attempted Ip', 0, 1, 1, 1, 1, 1, '{}', 12),
(104, 17, 'score_individual', 'text', 'Score Individual', 0, 1, 1, 1, 1, 1, '{}', 13),
(105, 17, 'photo', 'text', 'Photo', 0, 1, 1, 1, 1, 1, '{}', 14),
(106, 17, 'manual_valuation', 'text', 'Manual Valuation', 0, 1, 1, 1, 1, 1, '{}', 15),
(107, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 16),
(108, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 17),
(109, 17, 'result_belongsto_quiss_relationship', 'relationship', 'quiss', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Quis\",\"table\":\"quiss\",\"type\":\"belongsTo\",\"column\":\"id_quiz\",\"key\":\"id\",\"label\":\"quiz_name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":null}', 18),
(110, 17, 'result_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id_user\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":null}', 19),
(111, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(112, 20, 'id_user', 'text', 'Id User', 0, 1, 1, 1, 1, 1, '{}', 4),
(113, 20, 'id_quiz', 'text', 'Id Quiz', 0, 1, 1, 1, 1, 1, '{}', 5),
(114, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(115, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 1, 0, 0, '{}', 7),
(116, 20, 'transaksi_quiz_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id_user\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(117, 20, 'transaksi_quiz_belongsto_quiss_relationship', 'relationship', 'quiss', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Quis\",\"table\":\"quiss\",\"type\":\"belongsTo\",\"column\":\"id_quiz\",\"key\":\"id\",\"label\":\"quiz_name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(118, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(119, 21, 'id_user', 'text', 'Id User', 0, 1, 1, 1, 1, 1, '{}', 4),
(120, 21, 'id_groups', 'text', 'Id Groups', 0, 1, 1, 1, 1, 1, '{}', 5),
(121, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(122, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 1, 0, 0, '{}', 7),
(123, 21, 'transaksipaket_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id_user\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(124, 21, 'transaksipaket_belongsto_group_relationship', 'relationship', 'groups', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Group\",\"table\":\"groups\",\"type\":\"belongsTo\",\"column\":\"id_groups\",\"key\":\"id\",\"label\":\"group_name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(125, 22, 'id', 'text', 'ID TryOut', 1, 1, 1, 0, 0, 0, '{}', 1),
(127, 22, 'id_user', 'text', 'Id User', 0, 1, 1, 1, 1, 1, '{}', 12),
(128, 22, 'result_status', 'text', 'Result Status', 0, 1, 1, 0, 0, 1, '{}', 13),
(129, 22, 'start_time', 'text', 'Start Time', 0, 1, 1, 0, 0, 0, '{}', 14),
(130, 22, 'end_time', 'text', 'End Time', 0, 1, 1, 0, 0, 0, '{}', 15),
(131, 22, 'categories', 'text', 'Categories', 0, 1, 1, 0, 0, 0, '{}', 3),
(132, 22, 'individual_time', 'text', 'Individual Time', 0, 1, 1, 0, 0, 0, '{}', 16),
(133, 22, 'total_time', 'text', 'Total Time', 0, 1, 1, 0, 0, 0, '{}', 17),
(134, 22, 'score_obtained', 'text', 'Score Obtained', 0, 1, 1, 0, 0, 0, '{}', 18),
(135, 22, 'percentage_obtained', 'text', 'Percentage Obtained', 0, 1, 1, 0, 0, 0, '{}', 6),
(136, 22, 'attempted_ip', 'text', 'Attempted Ip', 0, 1, 1, 0, 0, 0, '{}', 19),
(137, 22, 'score_individual', 'text', 'Score Individual', 0, 1, 1, 0, 0, 0, '{}', 20),
(138, 22, 'photo', 'text', 'Photo', 0, 1, 1, 0, 0, 0, '{}', 21),
(139, 22, 'manual_valuation', 'text', 'Manual Valuation', 0, 1, 1, 0, 0, 0, '{}', 22),
(140, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 25),
(141, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 26),
(142, 22, 'resultujian_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"id_user\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(143, 22, 'resultujian_belongsto_quiss_relationship', 'relationship', 'Nama TryOut', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\Quis\",\"table\":\"quiss\",\"type\":\"belongsTo\",\"column\":\"id_quis\",\"key\":\"id\",\"label\":\"quiz_name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(144, 22, 'id_quis', 'text', 'Id Quis', 0, 1, 1, 1, 1, 1, '{}', 11),
(145, 21, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 0, 0, '{}', 6),
(146, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(147, 24, 'question_type', 'select_dropdown', 'Question Type', 0, 1, 1, 1, 1, 1, '{\"default\":\"question_type\",\"options\":{\"1\":\"Multiple Choice Single Answer\",\"2\":\"Multiple Choice Multiple Answer\"}}', 3),
(148, 24, 'question', 'rich_text_box', 'Question', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rulw\":\"required\",\"message\":{\"required\":\"This Input Mask\"}}}', 6),
(149, 24, 'inserted_by', 'text', 'Inserted By', 0, 0, 0, 0, 0, 0, '{}', 8),
(150, 24, 'paragraph', 'rich_text_box', 'Paragraph', 0, 1, 1, 1, 1, 1, '{}', 4),
(151, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(152, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(153, 24, 'time_served', 'text', 'Time Served', 0, 0, 0, 0, 0, 0, '{}', 10),
(154, 24, 'time_correct', 'text', 'Time Correct', 0, 0, 0, 0, 0, 0, '{}', 11),
(155, 24, 'time_incorrected', 'text', 'Time Incorrected', 0, 0, 0, 0, 0, 0, '{}', 12),
(156, 24, 'id_category', 'text', 'Id Category', 0, 0, 0, 0, 0, 0, '{}', 13),
(157, 24, 'qbank_belongsto_category_relationship', 'relationship', 'categorys', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categorys\",\"type\":\"belongsTo\",\"column\":\"id_category\",\"key\":\"id\",\"label\":\"category_name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(158, 24, 'qbank_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"scope\":\"SomeUser\",\"model\":\"\\\\TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"inserted_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(159, 20, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 0, 0, '{}', 8),
(160, 22, 'resultujian_belongsto_level_relationship', 'relationship', 'level', 0, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Level\",\"table\":\"levels\",\"type\":\"belongsTo\",\"column\":\"id_level\",\"key\":\"id\",\"label\":\"level_name\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(161, 22, 'id_level', 'text', 'Id Level', 0, 1, 1, 1, 1, 1, '{}', 23),
(162, 22, 'resultujian_belongsto_quiss_relationship_1', 'relationship', 'Soal', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Quis\",\"table\":\"quiss\",\"type\":\"belongsTo\",\"column\":\"id_quis\",\"key\":\"id\",\"label\":\"id_questions\",\"pivot_table\":\"categorys\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(165, 22, 'nilai_terrendah', 'text', 'Nilai Terrendah', 0, 1, 1, 0, 0, 0, '{}', 10),
(166, 22, 'rangking', 'text', 'Rangking', 0, 1, 1, 1, 1, 1, '{}', 24),
(167, 22, 'nilai_tertinggi', 'text', 'Nilai Tertinggi', 0, 1, 1, 1, 1, 1, '{}', 9),
(168, 22, 'volume', 'text', 'Volume', 0, 1, 1, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-12-13 21:31:56', '2020-12-13 21:31:56'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-12-13 21:31:56', '2020-12-13 21:31:56'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-12-13 21:31:56', '2020-12-13 21:31:56'),
(6, 'options', 'options', 'Question Option', 'Question Options', 'voyager-check-circle', 'App\\Option', NULL, '\\App\\Http\\Controllers\\Voyager\\OptionsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-14 03:10:28', '2021-01-21 05:16:24'),
(7, 'quizs', 'quizs', 'Quiz', 'Quizs', 'voyager-file-text', 'App\\Quiz', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-14 21:40:48', '2020-12-14 21:42:41'),
(10, 'quiss', 'quiss', 'Quiss', 'Quisses', 'voyager-file-text', 'App\\Quis', NULL, '\\App\\Http\\Controllers\\Voyager\\QuissController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-14 21:53:05', '2021-01-13 21:27:53'),
(11, 'groups', 'groups', 'Group', 'Groups', NULL, 'App\\Group', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-18 01:15:15', '2020-12-18 01:18:21'),
(15, 'levels', 'levels', 'Level', 'Levels', NULL, 'App\\Level', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-01-21 01:47:46', '2021-01-21 01:47:46'),
(16, 'categorys', 'categorys', 'Category', 'Categories', NULL, 'App\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-21 01:48:46', '2021-01-25 03:05:41'),
(17, 'results', 'results', 'Result', 'Results', NULL, 'App\\Result', NULL, '\\App\\Http\\Controllers\\Voyager\\ResultController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-01-26 04:43:48', '2021-01-26 04:43:48'),
(20, 'transaksi_quiz', 'transaksi-quiz', 'Transaksi Quiz', 'Transaksi Quizzes', NULL, 'App\\TransaksiQuiz', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-01-27 18:08:01', '2021-02-15 22:01:21'),
(21, 'transaksipakets', 'transaksipakets', 'Transaksipaket', 'Transaksipakets', NULL, 'App\\Transaksipaket', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-02 18:17:38', '2021-02-15 22:00:46'),
(22, 'resultujians', 'resultujians', 'Resultujian', 'Resultujians', NULL, 'App\\Resultujian', NULL, '\\App\\Http\\Controllers\\Voyager\\ResultController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-03 00:36:18', '2021-03-14 07:31:27'),
(24, 'qbanks', 'qbanks', 'Qbank', 'Qbanks', NULL, 'App\\Qbank', NULL, '\\App\\Http\\Controllers\\Voyager\\QbanksController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-02-11 06:29:07', '2021-02-11 08:02:24');

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
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `valid_for_days` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `slug`, `price`, `valid_for_days`, `description`, `created_at`, `updated_at`) VALUES
(1, 'PAKET SIMAK UI #1', 'paket-simak-ui-1', 17500, 30, '<p>Paket Latihan Simak UI</p>', '2020-12-18 01:23:48', '2020-12-18 01:23:48'),
(2, 'PAKET SIMAK UI #2', 'paket-simak-ui-2', 20000, 30, '<p>Paket Ujian Try Out Simak UI</p>', '2020-12-18 01:45:29', '2020-12-18 01:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `jawbanmurids`
--

CREATE TABLE `jawbanmurids` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_quis` int(11) DEFAULT NULL,
  `id_qbanks` int(11) DEFAULT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jawbanmurids`
--

INSERT INTO `jawbanmurids` (`id`, `id_user`, `id_quis`, `id_qbanks`, `jawaban`, `created_at`, `updated_at`) VALUES
(89, 8, 10, 22, '42', '2021-03-02 07:13:09', '2021-03-02 07:13:09'),
(90, 8, 10, 22, '42', '2021-03-02 07:14:38', '2021-03-02 07:14:38'),
(91, 8, 10, 22, '43', '2021-03-02 07:45:11', '2021-03-02 07:45:11'),
(92, 8, 10, 22, '42', '2021-03-02 07:48:46', '2021-03-02 07:48:46'),
(93, 8, 10, 22, '42', '2021-03-02 07:52:31', '2021-03-02 07:52:31'),
(94, 3, 10, 22, '44', '2021-03-12 23:56:03', '2021-03-12 23:56:03'),
(95, 3, 10, 23, '94', '2021-03-12 23:56:26', '2021-03-12 23:56:26'),
(96, 8, 10, 22, '42', '2021-03-14 03:26:20', '2021-03-14 03:26:20'),
(97, 8, 10, 23, '94', '2021-03-14 03:26:24', '2021-03-14 03:26:24'),
(98, 8, 10, 24, '96', '2021-03-14 03:26:28', '2021-03-14 03:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `level_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level_name`, `created_at`, `updated_at`) VALUES
(1, 'Level 1 UNBK', '2021-01-21 01:56:23', '2021-01-21 01:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-12-13 21:31:57', '2020-12-13 21:31:57'),
(4, 'murid', '2021-01-15 02:02:31', '2021-01-15 02:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-12-13 21:31:58', '2020-12-13 21:31:58', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 10, '2020-12-13 21:31:58', '2021-02-11 06:30:47', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 9, '2020-12-13 21:31:58', '2021-02-11 06:30:52', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', '#000000', NULL, 8, '2020-12-13 21:31:58', '2021-02-11 06:30:52', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 11, '2020-12-13 21:31:58', '2021-02-11 06:30:47', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-12-13 21:31:58', '2020-12-14 03:38:39', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-12-13 21:31:58', '2020-12-14 03:38:39', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-12-13 21:31:58', '2020-12-14 03:38:39', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-12-13 21:31:59', '2020-12-14 03:38:39', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 12, '2020-12-13 21:31:59', '2021-02-11 06:30:47', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-12-13 21:32:03', '2020-12-14 03:38:39', 'voyager.hooks', NULL),
(14, 1, 'Question Options', '', '_self', 'voyager-check-circle', '#000000', NULL, 6, '2020-12-14 03:10:29', '2021-02-11 06:30:52', 'voyager.options.index', 'null'),
(16, 1, 'Quiz Setup', '', '_self', 'voyager-file-text', '#000000', NULL, 7, '2020-12-14 21:53:05', '2021-02-11 06:30:52', 'voyager.quiss.index', 'null'),
(17, 1, 'Groups', '', '_self', 'voyager-people', '#000000', NULL, 5, '2020-12-18 01:15:15', '2021-02-11 06:31:39', 'voyager.groups.index', 'null'),
(19, 1, 'Levels', '', '_self', NULL, NULL, NULL, 2, '2021-01-21 01:47:46', '2021-02-11 06:31:16', 'voyager.levels.index', NULL),
(20, 1, 'Categories', '', '_self', NULL, NULL, NULL, 3, '2021-01-21 01:48:46', '2021-02-11 06:31:16', 'voyager.categorys.index', NULL),
(21, 1, 'Results', '', '_self', NULL, NULL, NULL, 13, '2021-01-26 04:43:49', '2021-02-11 06:30:47', 'voyager.results.index', NULL),
(22, 4, 'Dashboard', '', '_self', NULL, '#000000', NULL, 1, '2021-01-26 19:04:41', '2021-01-27 02:18:57', 'voyager.dashboard', NULL),
(23, 1, 'Tryout', '/tryout/tryout-murid', '_self', NULL, '#000000', NULL, 14, '2021-01-27 02:16:19', '2021-02-11 06:30:47', NULL, ''),
(24, 4, 'Daftar Tryout', '/tryout/tryout-murid', '_self', NULL, '#000000', NULL, 3, '2021-01-27 02:19:25', '2021-01-27 19:13:21', NULL, ''),
(25, 1, 'Transaksi Quizzes', '', '_self', NULL, NULL, NULL, 15, '2021-01-27 18:08:01', '2021-02-11 06:30:47', 'voyager.transaksi-quiz.index', NULL),
(26, 4, 'My Tryout', '/tryout/my-tryout', '_self', NULL, '#000000', NULL, 4, '2021-01-27 19:10:15', '2021-01-27 19:13:14', NULL, ''),
(28, 4, 'Daftar Group', '/tryout/paket-murid', '_self', NULL, '#000000', NULL, 2, '2021-01-27 19:13:10', '2021-02-02 18:20:02', NULL, ''),
(29, 1, 'Transaksipakets', '', '_self', NULL, NULL, NULL, 16, '2021-02-02 18:17:39', '2021-02-11 06:30:47', 'voyager.transaksipakets.index', NULL),
(30, 1, 'Resultujians', '', '_self', NULL, '#000000', NULL, 17, '2021-02-03 00:36:18', '2021-03-12 09:49:39', 'voyager.resultujians.index', 'null'),
(31, 4, 'Result Ujian', '/tryout/resultujiansMurid', '_self', NULL, '#000000', NULL, 5, '2021-02-03 00:37:13', '2021-03-12 09:50:50', NULL, ''),
(33, 1, 'Question Banks', '', '_self', 'voyager-edit', '#000000', NULL, 4, '2021-02-11 06:29:07', '2021-02-11 06:37:59', 'voyager.qbanks.index', 'null');

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
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(25, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(26, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(27, '2016_06_01_000004_create_oauth_clients_table', 2),
(28, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'jLJhCOt9P3TfmLiW3ELhLgvIz7QM9QzOJvhN7QSm', NULL, 'http://localhost', 1, 0, 0, '2021-01-16 04:51:04', '2021-01-16 04:51:04'),
(2, NULL, 'Laravel Password Grant Client', 'tbuj8TM0A5bCURqvG4hEaBqulLoy0xPjEI50cWmc', 'users', 'http://localhost', 0, 1, 0, '2021-01-16 04:51:04', '2021-01-16 04:51:04'),
(3, NULL, 'Laravel Personal Access Client', 'aAgKIclrrGaXeoUvj1F13KQXqtqY1Si2UsBWbJCn', NULL, 'http://localhost', 1, 0, 0, '2021-01-16 04:54:45', '2021-01-16 04:54:45'),
(4, NULL, 'Laravel Password Grant Client', 'Xk9tJDnVA7WNRlPKfGvvnaJYe9EOyDHLr4z7BUZd', 'users', 'http://localhost', 0, 1, 0, '2021-01-16 04:54:45', '2021-01-16 04:54:45'),
(5, NULL, 'Laravel Personal Access Client', 'qjyzJHs8P0Mn1EscrQz7EifBxGkKN1NLrIos3QNH', NULL, 'http://localhost', 1, 0, 0, '2021-01-16 04:55:12', '2021-01-16 04:55:12'),
(6, NULL, 'Laravel Password Grant Client', 'A1LIlW3OKLI99Hxbgk8KUUr0xRHgzraE5dcnYTeb', 'users', 'http://localhost', 0, 1, 0, '2021-01-16 04:55:12', '2021-01-16 04:55:12'),
(7, NULL, 'Laravel Personal Access Client', 'v6oO4E9WbMKaasURFCldioBr6sDat7QpoLYMLWm5', NULL, 'http://localhost', 1, 0, 0, '2021-01-16 05:08:44', '2021-01-16 05:08:44'),
(8, NULL, 'Laravel Password Grant Client', 'bNEQfahF9FpWZa7L2yQl0qESQG5MxOuXp4KR7SNj', 'users', 'http://localhost', 0, 1, 0, '2021-01-16 05:08:44', '2021-01-16 05:08:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-01-16 04:51:04', '2021-01-16 04:51:04'),
(2, 3, '2021-01-16 04:54:45', '2021-01-16 04:54:45'),
(3, 5, '2021-01-16 04:55:12', '2021-01-16 04:55:12'),
(4, 7, '2021-01-16 05:08:44', '2021-01-16 05:08:44');

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
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `idq` int(11) NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `correct_answer` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `idq`, `answer`, `score`, `created_at`, `updated_at`, `correct_answer`) VALUES
(42, 22, '<p>4</p>', 1, '2021-01-21 05:51:00', '2021-01-25 04:44:36', '1'),
(43, 22, '<p>3</p>', 0, '2021-01-21 05:51:59', '2021-01-25 04:44:36', '0'),
(44, 22, '<p>2</p>', 0, '2021-01-21 05:51:59', '2021-01-25 04:44:36', '0'),
(45, 22, '<p>1</p>', 1, '2021-01-21 05:51:00', '2021-01-25 04:44:36', '0'),
(94, 23, '<p>coba jawab 1</p>', 1, '2021-03-02 13:01:38', NULL, NULL),
(95, 23, '<p>coba jawab salah</p>', 0, '2021-03-02 13:01:38', NULL, NULL),
(96, 24, '<p>coba jawab 2</p>', 6, '2021-03-02 13:01:38', NULL, NULL),
(97, 24, '<p>coba jawab salah 2</p>', 0, '2021-03-02 13:01:38', NULL, NULL),
(98, 25, '<p>coba jawab 1</p>', 1, '2021-03-03 08:35:12', NULL, NULL),
(99, 25, '<p>coba jawab salah</p>', 0, '2021-03-03 08:35:12', NULL, NULL),
(100, 26, '<p>coba jawab 2</p>', 6, '2021-03-03 08:35:12', NULL, NULL),
(101, 26, '<p>coba jawab salah 2</p>', 0, '2021-03-03 08:35:12', NULL, NULL);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-12-13 21:31:59', '2020-12-13 21:31:59'),
(2, 'browse_bread', NULL, '2020-12-13 21:31:59', '2020-12-13 21:31:59'),
(3, 'browse_database', NULL, '2020-12-13 21:31:59', '2020-12-13 21:31:59'),
(4, 'browse_media', NULL, '2020-12-13 21:31:59', '2020-12-13 21:31:59'),
(5, 'browse_compass', NULL, '2020-12-13 21:31:59', '2020-12-13 21:31:59'),
(6, 'browse_menus', 'menus', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(7, 'read_menus', 'menus', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(8, 'edit_menus', 'menus', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(9, 'add_menus', 'menus', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(10, 'delete_menus', 'menus', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(11, 'browse_roles', 'roles', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(12, 'read_roles', 'roles', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(13, 'edit_roles', 'roles', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(14, 'add_roles', 'roles', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(15, 'delete_roles', 'roles', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(16, 'browse_users', 'users', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(17, 'read_users', 'users', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(18, 'edit_users', 'users', '2020-12-13 21:32:00', '2020-12-13 21:32:00'),
(19, 'add_users', 'users', '2020-12-13 21:32:01', '2020-12-13 21:32:01'),
(20, 'delete_users', 'users', '2020-12-13 21:32:01', '2020-12-13 21:32:01'),
(21, 'browse_settings', 'settings', '2020-12-13 21:32:01', '2020-12-13 21:32:01'),
(22, 'read_settings', 'settings', '2020-12-13 21:32:01', '2020-12-13 21:32:01'),
(23, 'edit_settings', 'settings', '2020-12-13 21:32:01', '2020-12-13 21:32:01'),
(24, 'add_settings', 'settings', '2020-12-13 21:32:01', '2020-12-13 21:32:01'),
(25, 'delete_settings', 'settings', '2020-12-13 21:32:01', '2020-12-13 21:32:01'),
(26, 'browse_hooks', NULL, '2020-12-13 21:32:03', '2020-12-13 21:32:03'),
(32, 'browse_options', 'options', '2020-12-14 03:10:29', '2020-12-14 03:10:29'),
(33, 'read_options', 'options', '2020-12-14 03:10:29', '2020-12-14 03:10:29'),
(34, 'edit_options', 'options', '2020-12-14 03:10:29', '2020-12-14 03:10:29'),
(35, 'add_options', 'options', '2020-12-14 03:10:29', '2020-12-14 03:10:29'),
(36, 'delete_options', 'options', '2020-12-14 03:10:29', '2020-12-14 03:10:29'),
(37, 'browse_quizs', 'quizs', '2020-12-14 21:40:48', '2020-12-14 21:40:48'),
(38, 'read_quizs', 'quizs', '2020-12-14 21:40:48', '2020-12-14 21:40:48'),
(39, 'edit_quizs', 'quizs', '2020-12-14 21:40:48', '2020-12-14 21:40:48'),
(40, 'add_quizs', 'quizs', '2020-12-14 21:40:48', '2020-12-14 21:40:48'),
(41, 'delete_quizs', 'quizs', '2020-12-14 21:40:48', '2020-12-14 21:40:48'),
(42, 'browse_quiss', 'quiss', '2020-12-14 21:53:05', '2020-12-14 21:53:05'),
(43, 'read_quiss', 'quiss', '2020-12-14 21:53:05', '2020-12-14 21:53:05'),
(44, 'edit_quiss', 'quiss', '2020-12-14 21:53:05', '2020-12-14 21:53:05'),
(45, 'add_quiss', 'quiss', '2020-12-14 21:53:05', '2020-12-14 21:53:05'),
(46, 'delete_quiss', 'quiss', '2020-12-14 21:53:05', '2020-12-14 21:53:05'),
(47, 'browse_groups', 'groups', '2020-12-18 01:15:15', '2020-12-18 01:15:15'),
(48, 'read_groups', 'groups', '2020-12-18 01:15:15', '2020-12-18 01:15:15'),
(49, 'edit_groups', 'groups', '2020-12-18 01:15:15', '2020-12-18 01:15:15'),
(50, 'add_groups', 'groups', '2020-12-18 01:15:15', '2020-12-18 01:15:15'),
(51, 'delete_groups', 'groups', '2020-12-18 01:15:15', '2020-12-18 01:15:15'),
(52, 'browse_levels', 'levels', '2021-01-21 01:47:46', '2021-01-21 01:47:46'),
(53, 'read_levels', 'levels', '2021-01-21 01:47:46', '2021-01-21 01:47:46'),
(54, 'edit_levels', 'levels', '2021-01-21 01:47:46', '2021-01-21 01:47:46'),
(55, 'add_levels', 'levels', '2021-01-21 01:47:46', '2021-01-21 01:47:46'),
(56, 'delete_levels', 'levels', '2021-01-21 01:47:46', '2021-01-21 01:47:46'),
(57, 'browse_categorys', 'categorys', '2021-01-21 01:48:46', '2021-01-21 01:48:46'),
(58, 'read_categorys', 'categorys', '2021-01-21 01:48:46', '2021-01-21 01:48:46'),
(59, 'edit_categorys', 'categorys', '2021-01-21 01:48:46', '2021-01-21 01:48:46'),
(60, 'add_categorys', 'categorys', '2021-01-21 01:48:46', '2021-01-21 01:48:46'),
(61, 'delete_categorys', 'categorys', '2021-01-21 01:48:46', '2021-01-21 01:48:46'),
(62, 'browse_results', 'results', '2021-01-26 04:43:49', '2021-01-26 04:43:49'),
(63, 'read_results', 'results', '2021-01-26 04:43:49', '2021-01-26 04:43:49'),
(64, 'edit_results', 'results', '2021-01-26 04:43:49', '2021-01-26 04:43:49'),
(65, 'add_results', 'results', '2021-01-26 04:43:49', '2021-01-26 04:43:49'),
(66, 'delete_results', 'results', '2021-01-26 04:43:49', '2021-01-26 04:43:49'),
(67, 'browse_transaksi_quiz', 'transaksi_quiz', '2021-01-27 18:08:01', '2021-01-27 18:08:01'),
(68, 'read_transaksi_quiz', 'transaksi_quiz', '2021-01-27 18:08:01', '2021-01-27 18:08:01'),
(69, 'edit_transaksi_quiz', 'transaksi_quiz', '2021-01-27 18:08:01', '2021-01-27 18:08:01'),
(70, 'add_transaksi_quiz', 'transaksi_quiz', '2021-01-27 18:08:01', '2021-01-27 18:08:01'),
(71, 'delete_transaksi_quiz', 'transaksi_quiz', '2021-01-27 18:08:01', '2021-01-27 18:08:01'),
(72, 'browse_transaksipakets', 'transaksipakets', '2021-02-02 18:17:39', '2021-02-02 18:17:39'),
(73, 'read_transaksipakets', 'transaksipakets', '2021-02-02 18:17:39', '2021-02-02 18:17:39'),
(74, 'edit_transaksipakets', 'transaksipakets', '2021-02-02 18:17:39', '2021-02-02 18:17:39'),
(75, 'add_transaksipakets', 'transaksipakets', '2021-02-02 18:17:39', '2021-02-02 18:17:39'),
(76, 'delete_transaksipakets', 'transaksipakets', '2021-02-02 18:17:39', '2021-02-02 18:17:39'),
(77, 'browse_resultujians', 'resultujians', '2021-02-03 00:36:18', '2021-02-03 00:36:18'),
(78, 'read_resultujians', 'resultujians', '2021-02-03 00:36:18', '2021-02-03 00:36:18'),
(79, 'edit_resultujians', 'resultujians', '2021-02-03 00:36:18', '2021-02-03 00:36:18'),
(80, 'add_resultujians', 'resultujians', '2021-02-03 00:36:18', '2021-02-03 00:36:18'),
(81, 'delete_resultujians', 'resultujians', '2021-02-03 00:36:18', '2021-02-03 00:36:18'),
(82, 'browse_qbanks', 'qbanks', '2021-02-11 06:29:07', '2021-02-11 06:29:07'),
(83, 'read_qbanks', 'qbanks', '2021-02-11 06:29:07', '2021-02-11 06:29:07'),
(84, 'edit_qbanks', 'qbanks', '2021-02-11 06:29:07', '2021-02-11 06:29:07'),
(85, 'add_qbanks', 'qbanks', '2021-02-11 06:29:07', '2021-02-11 06:29:07'),
(86, 'delete_qbanks', 'qbanks', '2021-02-11 06:29:07', '2021-02-11 06:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(37, 5),
(38, 1),
(38, 3),
(38, 5),
(39, 1),
(39, 3),
(40, 1),
(40, 3),
(41, 1),
(41, 3),
(42, 1),
(42, 3),
(42, 4),
(42, 5),
(43, 1),
(43, 3),
(43, 5),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(47, 4),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(77, 4),
(78, 1),
(78, 4),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qbanks`
--

CREATE TABLE `qbanks` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inserted_by` int(11) DEFAULT NULL,
  `paragraph` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `time_served` int(11) DEFAULT NULL,
  `time_correct` int(11) DEFAULT NULL,
  `time_incorrected` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qbanks`
--

INSERT INTO `qbanks` (`id`, `question_type`, `question`, `inserted_by`, `paragraph`, `created_at`, `updated_at`, `time_served`, `time_correct`, `time_incorrected`, `id_category`) VALUES
(22, '1', '<p>Berapa Hasil Dari Perhitungan berikut&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mfrac bevelled=\"true\"><mn>10</mn><mn>5</mn></mfrac></math></p>', 1, '<p>coba</p>', '2021-01-21 05:51:00', '2021-01-25 04:26:11', NULL, NULL, NULL, 1),
(23, '1', '<p>Pertanyaan 1</p>', 8, '', '2021-03-02 13:01:38', NULL, NULL, NULL, NULL, 2),
(24, '1', '<p>Pertanyaan 2</p>', 8, '<p>Paragraph 2</p>', '2021-03-02 13:01:38', NULL, NULL, NULL, NULL, 2),
(25, '1', '<p>Pertanyaan nya</p>', 8, '<p>Paragraph nya</p>', '2021-03-03 08:35:12', NULL, NULL, NULL, NULL, 2),
(26, '1', '<p>Pertanyaan nya 2</p>', 8, '<p>Paragraph nya 2</p>', '2021-03-03 08:35:12', NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `quiss`
--

CREATE TABLE `quiss` (
  `id` int(10) UNSIGNED NOT NULL,
  `quiz_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambar` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `id_groups` int(11) DEFAULT NULL,
  `id_questions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `pass_percentage` float DEFAULT NULL,
  `with_login` int(11) DEFAULT NULL,
  `inserted_by` int(11) DEFAULT NULL,
  `quiz_price` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiss`
--

INSERT INTO `quiss` (`id`, `quiz_name`, `gambar`, `slug`, `description`, `start_date`, `end_date`, `id_groups`, `id_questions`, `duration`, `pass_percentage`, `with_login`, `inserted_by`, `quiz_price`, `created_at`, `updated_at`) VALUES
(10, 'Coba2', 'quiss\\January2021\\7F8s6a1xXTEz3yL0filx.jpg', 'paket-simak-ui-1', 'coba', '2021-01-26 08:06:00', '2021-01-26 08:06:00', 1, '22,23,24', 90, 75, 1, 8, 0, '2021-01-25 18:07:00', '2021-02-28 21:29:32'),
(11, 'Tryout SIMAK UI', 'quiss\\January2021\\tEdRBkDR1NarhiahtLfF.jpg', 'Tryout-SIMAK-UI', 'Tryout SIMAK UI', '2021-01-27 20:02:00', '2021-01-27 20:02:00', 1, '22', 90, 75, 1, 8, 5000, '2021-01-27 06:02:00', '2021-02-28 21:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `resultujians`
--

CREATE TABLE `resultujians` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_quis` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `result_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `categories` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `individual_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score_obtained` float DEFAULT NULL,
  `percentage_obtained` float DEFAULT NULL,
  `attempted_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score_individual` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_valuation` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  `nilai_tertinggi` int(11) DEFAULT NULL,
  `nilai_terrendah` int(11) DEFAULT NULL,
  `rangking` int(11) DEFAULT NULL,
  `volume` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resultujians`
--

INSERT INTO `resultujians` (`id`, `id_quis`, `id_user`, `result_status`, `start_time`, `end_time`, `categories`, `individual_time`, `total_time`, `score_obtained`, `percentage_obtained`, `attempted_ip`, `score_individual`, `photo`, `manual_valuation`, `created_at`, `updated_at`, `id_level`, `nilai_tertinggi`, `nilai_terrendah`, `rangking`, `volume`) VALUES
(1, 10, 3, 'PASS', '2021-02-03 14:40:01', NULL, NULL, NULL, '2', 1, 100, NULL, NULL, NULL, NULL, '2021-02-03 00:40:03', '2021-02-03 00:40:03', NULL, NULL, NULL, NULL, NULL),
(2, 10, 8, 'FAIL', '2021-02-19 13:47:58', NULL, NULL, NULL, NULL, 0, 50, NULL, NULL, NULL, NULL, '2021-02-18 23:48:00', '2021-02-18 23:48:00', NULL, NULL, NULL, NULL, NULL),
(3, 10, 8, 'FAIL', '2021-02-28 20:56:10', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2021-02-28 06:56:11', '2021-02-28 06:56:11', NULL, NULL, NULL, NULL, NULL),
(4, 11, 8, 'FAIL', '2021-03-01 14:37:34', NULL, NULL, NULL, NULL, 7, 67, NULL, NULL, NULL, NULL, '2021-03-01 00:37:00', '2021-03-10 19:24:55', 1, NULL, NULL, NULL, NULL),
(5, 10, 8, 'FAIL', '2021-03-01 14:42:38', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2021-03-01 00:42:39', '2021-03-01 00:42:39', NULL, NULL, NULL, NULL, NULL),
(6, 10, 3, 'FAIL', '2021-03-01 14:43:38', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2021-03-01 00:43:39', '2021-03-01 00:43:39', NULL, NULL, NULL, NULL, NULL),
(7, 10, 8, 'PASS', '2021-03-14 17:26:33', NULL, NULL, NULL, NULL, 8, 100, NULL, NULL, NULL, NULL, '2021-03-14 03:26:35', '2021-03-14 03:26:35', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-12-13 21:31:59', '2020-12-13 21:31:59'),
(2, 'user', 'Normal User', '2020-12-13 21:31:59', '2020-12-13 21:31:59'),
(3, 'guru', 'Guru', '2021-01-14 01:05:16', '2021-01-14 01:05:16'),
(4, 'murid', 'Murid', '2021-01-14 22:12:06', '2021-01-14 22:12:06'),
(5, 'guest', 'guest', '2021-01-21 01:41:23', '2021-01-21 01:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `transaksipakets`
--

CREATE TABLE `transaksipakets` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_groups` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksipakets`
--

INSERT INTO `transaksipakets` (`id`, `id_user`, `id_groups`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, 1, '2021-02-02 18:34:00', '2021-02-15 22:41:33', '1'),
(2, 3, 2, '2021-02-16 08:27:12', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_quiz`
--

CREATE TABLE `transaksi_quiz` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_quiz` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi_quiz`
--

INSERT INTO `transaksi_quiz` (`id`, `id_user`, `id_quiz`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, 11, '2021-01-27 19:36:00', '2021-01-27 19:36:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'sultan', 'your@email.com', 'users\\December2020\\xK9uyWWF3tpGQ8LCE6p8.jpg', NULL, '$2y$10$T3MTz9CSQ7Y9z288hNd6y.mVSKc4xH1/7xsBllD7Fmr0dGpPQwQqe', NULL, '{\"locale\":\"en\"}', '2020-12-13 21:41:12', '2020-12-13 21:51:40'),
(2, 3, 'Guru Besar', 'guru@email.com', 'users/default.png', NULL, '$2y$10$hAZERiT2ZzQjAFZrTgZL4ems8JSh1O7d06nFBqKY.eEj5.dENTRUC', NULL, '{\"locale\":\"en\"}', '2021-01-14 01:05:56', '2021-01-14 01:05:56'),
(3, 4, 'murid1', 'murid@email.com', 'users/default.png', NULL, '$2y$10$pmXUqzwuLMmvAHaFHu9jVe1vDUzEvZF4TJb7sgqsMIqbAw0T9QukC', NULL, '{\"locale\":\"en\"}', '2021-01-14 22:12:50', '2021-01-14 22:12:50'),
(4, 5, 'Guest', 'guest@email.com', 'users/default.png', NULL, '$2y$10$wlDI3FoPyVh69bT4Dg05yuDHfnf8qnk/J9h9zhhlaFTh.N8G1M7eG', NULL, '{\"locale\":\"en\"}', '2021-01-21 01:41:48', '2021-01-21 01:41:48'),
(8, 1, 'Putra', 'putra@email.com', 'users/default.png', NULL, '$2y$10$3YM7P.ZBXOKXQzQOtgqa7.0w61vlio.P9cR3Krw1LXjnUQvLRiH1e', NULL, '{\"locale\":\"en\"}', '2021-02-07 20:38:16', '2021-02-07 20:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(8, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jawbanmurids`
--
ALTER TABLE `jawbanmurids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `qbanks`
--
ALTER TABLE `qbanks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiss`
--
ALTER TABLE `quiss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resultujians`
--
ALTER TABLE `resultujians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `transaksipakets`
--
ALTER TABLE `transaksipakets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_quiz`
--
ALTER TABLE `transaksi_quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jawbanmurids`
--
ALTER TABLE `jawbanmurids`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `quiss`
--
ALTER TABLE `quiss`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `resultujians`
--
ALTER TABLE `resultujians`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi_quiz`
--
ALTER TABLE `transaksi_quiz`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
