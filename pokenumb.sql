-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Jan-2024 às 01:00
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pokenumb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT 0,
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(128) NOT NULL DEFAULT '',
  `blocked` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `page_access` int(11) DEFAULT NULL,
  `page_lastday` int(11) DEFAULT NULL,
  `email_new` varchar(255) DEFAULT NULL,
  `email_new_time` int(15) DEFAULT NULL,
  `rlname` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created` int(16) DEFAULT NULL,
  `email_code` varchar(255) DEFAULT NULL,
  `next_email` int(11) DEFAULT NULL,
  `premium_points` int(11) DEFAULT NULL,
  `nickname` char(48) DEFAULT NULL,
  `avatar` char(48) DEFAULT NULL,
  `about_me` text DEFAULT NULL,
  `event_points` int(11) NOT NULL DEFAULT 0,
  `language` int(11) NOT NULL DEFAULT 0,
  `vip_time` int(11) NOT NULL DEFAULT 0,
  `lang_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hash` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `page_access`, `page_lastday`, `email_new`, `email_new_time`, `rlname`, `location`, `created`, `email_code`, `next_email`, `premium_points`, `nickname`, `avatar`, `about_me`, `event_points`, `language`, `vip_time`, `lang_id`, `hash`) VALUES
(1, 'teste', '2808dd1f557fac2bf821e207b2d18bbb74af79f5', '', 0, 1705357441, 'teemova@gmail.com', '', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1617277421, NULL, NULL, 0, 'testeeee test', NULL, NULL, 0, 0, 0, 0, ''),
(2, 'male', 'd541697a7247b71082c661ade42fc0252e5fd556', '', 0, 1705362003, 'mixlort33@gmail.com', '6c38a74ac9292368f7c24dc7d12fd3d585d29de3', 0, 0, 6, 6, NULL, NULL, NULL, NULL, NULL, 1617277551, NULL, NULL, 20, 'mix lort', NULL, NULL, 0, 0, 0, 0, '84d39528c07f5fee91112d805dfbeb8f6a2f6ac6af2e98ddde3d1986ace8e3ee');

--
-- Acionadores `accounts`
--
DELIMITER $$
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN DELETE FROM `bans` WHERE `type` NOT IN(1, 2) AND `value` = OLD.`id`; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) UNSIGNED NOT NULL DEFAULT 4294967295 COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires` int(11) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `reason` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `statement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bounty_hunters`
--

CREATE TABLE `bounty_hunters` (
  `id` int(11) NOT NULL,
  `fp_id` int(11) NOT NULL,
  `sp_id` int(11) NOT NULL,
  `k_id` int(11) NOT NULL,
  `added` int(15) NOT NULL,
  `prize` bigint(20) NOT NULL,
  `killed` int(11) NOT NULL,
  `kill_time` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bugtracker`
--

CREATE TABLE `bugtracker` (
  `id` int(11) NOT NULL,
  `category` int(3) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `done` tinyint(3) DEFAULT NULL,
  `priority` tinyint(3) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carousel`
--

CREATE TABLE `carousel` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL DEFAULT 'Text Here',
  `link` varchar(255) NOT NULL DEFAULT '#',
  `image` varchar(255) NOT NULL DEFAULT 'https://i.imgur.com/rwoJ6Ip.png',
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `carousel`
--

INSERT INTO `carousel` (`id`, `text`, `link`, `image`, `date`) VALUES
(1, 'Promoção BETA, em qualquer doação, receba 50% de pontos *A MAIS*, somente durante o beta!! Na oficial serão devolvidos todos os pontos com o valor promocional!!', '#', 'https://i.imgur.com/sgQZggW.jpg', 1629679559),
(2, 'POKEMON MS - Sua jornada tem um novo rumo agora', '#', 'https://i.imgur.com/uDogms7.jpeg', 1629679510),
(3, 'Pokémon MS - Olá treinador! Está preparado para iniciar uma nova jornada em um mundo repleto de mistérios!?', '#', 'https://i.imgur.com/s9Ts4Xn.jpeg', 1629679589),
(4, 'Pokémon MS - Venha e explore um mundo totalmente novo e divirta-se com seus amigos nesse MMORPG!', '#', 'https://i.imgur.com/7Kcf4he.jpeg', 1629679604),
(5, 'Pokémon MS - Venha conhecer um novo MMORPG inovador repleto de novidades e mistérios.', '#', 'https://i.imgur.com/R1Uuf4x.jpeg', 1629679759),
(6, 'Pokémon MS - Venha e faça parte desse mundo e seja o melhor treinador pokémon!', '#', 'https://i.imgur.com/ZESr3aL.jpeg', 1629679748),
(7, 'Pokémon MS - Está esperando o que!? Inicie sua jornada agora mesmo nesse mundo desconhecido!', '#', 'https://i.imgur.com/LPW7M6A.png', 1629679559);

-- --------------------------------------------------------

--
-- Estrutura da tabela `closed_key`
--

CREATE TABLE `closed_key` (
  `id` int(11) NOT NULL,
  `chave` text NOT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `closed_key`
--

INSERT INTO `closed_key` (`id`, `chave`, `used`, `time`) VALUES
(1, 'rn3Hi5UQ3Zmzn7PBYsY2', 13, 1629518355),
(2, 'WBWhh4J24aMxBNCN19E8', 14, 1629518422),
(3, 'BmYTfrzzRdKe2eKn9qEt', 15, 1629681178),
(4, '0C02MxGWVVJ8Jp60fx4o', 24, 1629681358),
(5, '6CxKRXmcipsQDbLuZLs2', 16, 1629681376),
(6, 'tFKWedXiEj8MSDNqaRhO', 32, 1629681378),
(7, 'qB6y46WTmNeatj4iVD5r', 19, 1629681382),
(8, 'eaXKRrJmyVjhQ8cZDLrQ', 17, 1629681385),
(9, '4KSdHHPXY0HXL1sba2qw', 23, 1629681387),
(10, 'YBych8psS30sr4YpFe0Q', 33, 1629681389),
(11, 'z14L4pifYOCgswhYnh0s', 26, 1629681390),
(12, 't6PaapVayCwPCJAhN2bd', 28, 1629681391),
(13, 'r9R828mxSVQozjFg5a1y', 29, 1629681393),
(14, 'OV5c384sw3hjHHBP3xsA', 25, 1629681493),
(15, 'Bc44kLDPggt0Amuk5ds1', 34, 1629681509),
(16, 'TTPXTdGkZhUTpJUxnZMG', 20, 1629681760),
(17, 'b52uaHe4Y3PTgdpn2FEt', 37, 1629681859),
(18, 'Yke0xKugF7dqZO9fsUBq', 21, 1629681914),
(19, 'cVyXG38o5EMmxD0g0reb', 22, 1629682599),
(20, 'HJD4K57uuOQfnSdr43dJ', 18, 1629682610),
(21, 'aWPgZUBDXYmwWhN2jwia', 27, 1629683235),
(22, 'YMpMfhiRdzXWeeeQxcZt', 30, 1629683240),
(23, 'hm3Py6cFhV9uyu1EzM4O', 35, 1629683243),
(24, 'CtG5cPP0anu2KNnHWxMT', 69, 1629696520),
(25, 'PJAV1yNmBKXEEdryiRRp', 31, 1629696527),
(26, '0c1duc9Utk4dz6U0UhEC', 36, 1629696527),
(27, 'DW0Hw7Mr5tGGTbb1roT5', 38, 1629759022),
(28, 'bQc8JE4zBr3i0oxgJU19', 39, 1629759032),
(29, '9mQHtJCPPdhKrJ2Gje9c', 40, 1629762908),
(30, 'z7EwYZfb6mfC33SaNrZ1', 41, 1629772331),
(31, 'y6c4jqKg1bPmkrJua6Bw', 62, 1629773309),
(32, 'Dc03YVtiByF7NUyb8bYd', 60, 1629773314),
(33, '6MZO430wTYCu0kB9yR4g', 44, 1629773928),
(34, 'xQzM5uXE5TPZdS4er70h', 64, 1629774586),
(35, '6TAnrSFWqwZBsXYCVS0N', 43, 1629784418),
(36, 'zSFcrV0aNrJtnaxgeDmj', 57, 1629790238),
(37, 'AZbYOt33PqBBjgpUwLqb', 54, 1629790240),
(38, 'E6EeySsxWo7ja9aH7A0y', 59, 1629790241),
(39, 'XQejW8D68w8NfeyA2PjL', 58, 1629790242),
(40, '5Y9o1aVak2d60K9Nd5iy', 46, 1629790244),
(41, 'yPVxpCzfxxeowy1huxt8', 47, 1629790245),
(42, 'u4YRtdtaxf3DnXPfTDM5', 51, 1629790246),
(43, 'aKanjSfcoLWe09cJC4es', 56, 1629790248),
(44, 'StbzQ41Vn1Yn1TByW3eH', 45, 1629790249),
(45, 'ST7q5yz2nG3PQBHkJaaO', 52, 1629790250),
(46, '5LdFOPegQ795YZK4hp0j', 48, 1629790251),
(47, 'VaPcoT35agNOFQJiOGAb', 53, 1629790252),
(48, 'RBBeCuS4LJTkJ0TMm7GJ', 55, 1629790254),
(49, 'od2EmRc6Mzb8MgVLcG8U', 49, 1629790255),
(50, '0cAGZOpTENEtX0ZA9ZH9', 50, 1629790256),
(51, 'dXESbneKjcTWwUOPyfif', 61, 1629790371),
(52, 'Tu16uTnzQQjO0o7hjUZc', 42, 1629797103),
(53, 'qOKf7K4dafkS6OQCKcK1', 63, 1629819372),
(54, 'LOr4LJuRQSFNnWR2T45g', 78, 1629819375),
(55, 'PAnQfemPfL3ALz1B8ia9', 71, 1629819821),
(56, 'ZRsdmacaouQJeet5GP9C', 76, 1629821000),
(57, 'GYtxHY0cBWkAdMPqZQ68', 73, 1629821053),
(58, 'B8H070HCGc5yGHcrHOeO', 70, 1629821096),
(59, 'ADEEzaZTwUTTXMnewysD', 75, 1629821219),
(60, 'O2rTRtQ74wCmTAO8OG9o', 77, 1629822874),
(61, 'FWfhTwByAG9NUF4MwP2q', 74, 1629823394),
(62, 'TNthcQH2WbyRYPmzxa89', 67, 1629854060),
(63, 'pRszp5CPzHdq6GDM63sJ', 65, 1629854061),
(64, 'erb8MKhL1sLkN8x55nYX', 68, 1629854063),
(65, 'VP5yPsJBm7YycaCLFMKq', 66, 1629854064),
(66, 'bm812HaFOXF0g5KhruhM', 81, 1629854065),
(67, '4R59KXqOTK6OErj61yXm', 72, 1629854074),
(68, 'AEJWUYjNuLSP25jsgUPU', 79, 1629905186),
(69, 'o9AqDWJdGahzzUVbWLen', 80, 1629905872),
(70, '3DrxcLuPpqWAcNA9UA6d', 82, 1629940994),
(71, 'VcXnTJ6G0YxjADcWL7YP', 91, 1629940997),
(72, 'qgQkuYVoWYzpweuckMA7', 85, 1629994539),
(73, 'gAdaPk6816fc12Uey7us', 84, 1629994543),
(74, 'CgNyR6johZMBSWW00n9n', 83, 1630085250),
(75, 'y8jdPYdQVWojG2BC2MPB', 86, 1630085255),
(76, 'B1jTmfyJ8M4hzAxTgNV9', 94, 1630337952),
(77, 'yLLVLqNhManhUANtq95s', 95, 1630337956),
(78, 'FEdy3hdtPPniBroTM3Qk', 99, 1630337957),
(79, '2Z4w3AzaySCFO58tKhD5', 92, 1630337958),
(80, 'GJJdNnVt4u0ZT5f6BoPE', 88, 1630337959),
(81, 'BTy4H14yMN5TG7O8ANma', 98, 1630337960),
(82, 'R5dDa0PQ5s0bDMcgiUVU', 100, 1630337961),
(83, 'yqabWscPC26KH5igARr8', 102, 1630337962),
(84, '62eXpPy9Tkm19WObXboU', 93, 1630337964),
(85, 'DcfjgRD0DWHqttZabp12', 87, 1630337965),
(86, 'PMAc5ghKrQAuqoNbcBCO', 90, 1630337966),
(87, 'XJAZYjocm2PLhGe0XD97', 89, 1630337967),
(88, 'gFHzU04oV1MZrs0N6QzG', 96, 1630337969),
(89, 'ukV82TrBBCL2kVeWOcZe', 104, 1630337970),
(90, '5ESK3c3GzDYDBT0Ezf9d', 97, 1630337972),
(91, 'WbQE3kx8SEgEatnp5dkm', 101, 1630340224),
(92, 'EKUKxYEDmGR5KTmEr1KB', 134, 1630340228),
(93, '7QbakxxDThTUqAUf6CWW', 108, 1630340350),
(94, 'hL4HFSrPCFkVJHCi85MF', 139, 1630363445),
(95, 'TJFaq5VkWHqfWhq32EUM', 107, 1630363459),
(96, 'joeTBbYiBWcTQD4QNxbA', 110, 1630364254),
(97, 'BNzLj9Bd8R1FCjRi0qR2', 122, 1630523891),
(98, '39yOSLYQapC0hBTFiq4E', 214, 1630532706),
(99, '12TMYkGTYAfuEpjdNSGY', 106, 1630532708),
(100, 'PafhkCkeQeuyzcJWLAz1', 109, 1630532709),
(101, 'tTaOsGRxm5Z3KBq8D2tN', 113, 1630532710),
(102, 'E7sr8KZqYT9JFAaAKSfe', 103, 1630536255),
(103, 'TZrGKMpdBpV2xpnSq6Ra', 128, 1630540790),
(104, 'pS5diKneyuDT6C6WgZS9', 133, 1630640355),
(105, 'jrWrMNYGiOFfV7rwC3ee', 105, 1630640358),
(106, '7UJLJxedSeYwnE1DFyXk', 135, 1630640360),
(107, 'rbq0PnnkxfoKe7xOKFje', 132, 1630640362),
(108, 'ZErp2L5M2e8KHMHAtu6m', 118, 1630640365),
(109, 'AUwuXLXuSOjmDQz7PAVY', 112, 1630640372),
(110, 'TT3nqDNW5dPk2fHfJy6x', 119, 1630640393),
(111, '718YFHJC2ktk1wZ1WoDk', 136, 1630640398),
(112, 'aQAKizNmJQweBXqWdFsu', 192, 1630640400),
(113, 'KLDaRTsnz2AB4jUUhDbw', 127, 1630640402),
(114, '5PeQqJa47iPmYHmwu2q1', 124, 1630640404),
(115, 'UBe3VbHYCVoaqOVrjnWX', 120, 1630640406),
(116, 'sPBJ1tX90OXtYCbe9Vkn', 121, 1630640410),
(117, 'nh1bhrRGE2UtDZxGztzm', 131, 1630640412),
(118, 'ysiMZx8S46pPV5TbxAyQ', 111, 1630640414),
(119, 'mrejVhtpigcYdbSRFmrL', 137, 1630640416),
(120, 'gKUUVXRHZBZUP06GRfB9', 114, 1630787049),
(121, 'R6LeSwHe5JfBOJtOsdFz', 116, 1630787050),
(122, 'pU4TETOiQ1mskZMFULXF', 115, 1630787052),
(123, 'KS7NtygTKw6DqTZhP3LN', 117, 1630787053),
(124, 'utM5DXrKSZD3Y2WFg5y8', 130, 1630787054),
(125, 'yJ0KD20EuNDVBnZkV1hh', 125, 1630787054),
(126, 'BdcTxMC9hqYfLgJXgiD0', 123, 1630787055),
(127, 'nNYDKLHJHaP3AwN2zN1P', 195, 1630787056),
(128, 'fAKtJsPVHc6FuEZLKBgP', 126, 1630787057),
(129, 'k3jeLmkBR7ktHbpnM3es', 129, 1630787058),
(130, '3TAcxFRsyjth7AgdWTLD', 206, 1630800878),
(131, 'MBYu2eNBs2ApzxE3pc6Q', 138, 1630800881),
(132, '5gC1qJt9uHNefRFq3Aw7', 213, 1630801564),
(133, 'hhwJciQs6WReigKDygRE', 193, 1630994415),
(134, '91bsaE7V5cbQ8mVoSAVc', 210, 1631034677),
(135, 'neLxgtc9GU32PSoo5c4p', 204, 1631034681),
(136, 'OWdQPcgseEByPSqGw7Ds', 202, 1631034683),
(137, '4iCVro2nqCJ0dsb8ePxG', 217, 1631034684),
(138, 'OKuZpVfcFiHHmX9bJ45d', 207, 1631034685),
(139, 'objBxucmMLVHh6on0YCP', 200, 1631034686),
(140, 'qrnHNCHUtBzQhH4CdTCT', 197, 1631034687),
(141, '37CW3jkWcj5D2UEEKs0o', 205, 1631034688),
(142, 'UjVkaNbR3fm1k1JGcgBM', 196, 1631034689),
(143, 'z0Ag9xg5FkOCmgBzLA3H', 198, 1631034691),
(144, '43whiLGENB8YGWGVSEO5', 216, 1631034692),
(145, 'zp2YxRfjta0zrxZL25ap', 194, 1631034693),
(146, 'bGUypz5uBXiE1pAWUyAy', 203, 1631034694),
(147, 'jgiuJFAzBUMHRUxHL5ZG', 201, 1631034696),
(148, 'k9uxxfAbBfj7FoRxkqiD', 209, 1631034697),
(149, 'qomP04sSyxS3P4yTxEDO', 199, 1631038351),
(150, 'fQisFQ38nhg7GAwjA1ez', 208, 1631038358),
(151, 'AAhKtSZKTSTUz1mXG5qQ', 219, 1631064842),
(152, 'FXZ7qiUn154yWr5eSyaw', 211, 1631064846),
(153, '6zSHNtQMXVRZ25uYcoGQ', 239, 1631064913),
(154, 'tOy3rwu62HjbV78nWX1Q', 218, 1631064917),
(155, 'XZG7p5dOZEbf2yJRR4sR', 212, 1631064921),
(156, 'TeonONi1J4uMOsqYBxHB', 215, 1631064964),
(157, 'kN5msjzQ6GPRpbhQxX3z', 223, 1631121095),
(158, 'RJLgkWRbdAupUybMXWON', 221, 1631121099),
(159, 'SKg59yXqZ6XR6arej2KW', 233, 1631121101),
(160, 'ej97OztwHP3WHLAJXFRU', 225, 1631122523),
(161, 'rSe4bEA7gQs1MfX3TWMC', 224, 1631471018),
(162, 'Xhq4RF71VyAV480MdL0E', 240, 1631471020),
(163, 'k8aYsePdreuWMLO2qdVE', 228, 1631471021),
(164, 'j8a1cTkVWnUr7g7Nndwi', 232, 1631471022),
(165, 'Rct5VX7V7MhXhnEMiWfq', 222, 1631471023),
(166, 'f6HDRwsLJFJLNhFXua87', 231, 1631471024),
(167, 'G00KKjb05J1M6s0NhNUO', 234, 1631471025),
(168, 'Cp6pEa5yZp3i8wzTV65y', 226, 1631471026),
(169, 'CMCPU8Lr5FzgWaUnfR8m', 227, 1631471027),
(170, 'QzREwkR7CDkHdrMnSmB7', 229, 1631471028),
(171, '6qSXGSogcmoibi9hSsaZ', 238, 1631471029),
(172, '9nSssBzzoufuM75WxTbS', 236, 1631471030),
(173, 'VWpZgAKFa1ZoWdiJMNYJ', 230, 1631471031),
(174, 'nBDKh2aFZNXVZqmNMrxx', 235, 1631471032),
(175, 'KPrTNXOu7jrhNzaheyPQ', 237, 1631471033),
(176, 'B35HPdMsz5Q7AXEOhMXf', 220, 1631471036),
(177, 'zHbRQ4pTOpqptg9pbp64', 0, 1631471184),
(178, 'StLhZtr5wiaWpbPxnAyL', 0, 1631471433),
(179, 'EeC0qWX2rLcFBSPyM61E', 0, 1631472063);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `time` int(11) DEFAULT 0,
  `author` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_caughts`
--

CREATE TABLE `datalog_caughts` (
  `player_id` int(11) NOT NULL,
  `pokemon_number` smallint(5) UNSIGNED NOT NULL,
  `tries` mediumint(8) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_christmas_drops`
--

CREATE TABLE `datalog_christmas_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_coin_uses`
--

CREATE TABLE `datalog_coin_uses` (
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `use` tinyint(3) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_colosseum_arena`
--

CREATE TABLE `datalog_colosseum_arena` (
  `account_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_duel_bet`
--

CREATE TABLE `datalog_duel_bet` (
  `leader_a` int(11) NOT NULL,
  `leader_b` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `amount` mediumint(9) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_easter_drops`
--

CREATE TABLE `datalog_easter_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_egg_generate`
--

CREATE TABLE `datalog_egg_generate` (
  `player_id` int(11) NOT NULL,
  `egg` varchar(100) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `tries` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_egg_move_generate`
--

CREATE TABLE `datalog_egg_move_generate` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `pokemon_name` varchar(255) NOT NULL,
  `pokemon_level` smallint(6) NOT NULL,
  `pokemon_extrapoints` smallint(6) NOT NULL,
  `egg_move` varchar(255) NOT NULL,
  `from_egg` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_egg_move_regenerate`
--

CREATE TABLE `datalog_egg_move_regenerate` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `pokemon_name` varchar(255) NOT NULL,
  `pokemon_level` smallint(6) NOT NULL,
  `pokemon_extrapoints` smallint(6) NOT NULL,
  `egg_move` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_halloween_drops`
--

CREATE TABLE `datalog_halloween_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_julyvacation_drops`
--

CREATE TABLE `datalog_julyvacation_drops` (
  `player_id` int(11) NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_logins`
--

CREATE TABLE `datalog_logins` (
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_map_items`
--

CREATE TABLE `datalog_map_items` (
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  `date` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_mastery_token_bought`
--

CREATE TABLE `datalog_mastery_token_bought` (
  `date` bigint(20) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `tokens` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_online`
--

CREATE TABLE `datalog_online` (
  `world_id` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `online` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_player_items`
--

CREATE TABLE `datalog_player_items` (
  `player_id` int(10) UNSIGNED NOT NULL,
  `on_logout_count` int(10) UNSIGNED DEFAULT NULL,
  `on_logout_date` bigint(20) UNSIGNED DEFAULT NULL,
  `on_login_count` int(11) DEFAULT NULL,
  `on_login_date` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_player_ups`
--

CREATE TABLE `datalog_player_ups` (
  `player_id` int(11) NOT NULL,
  `from_level` smallint(5) UNSIGNED NOT NULL,
  `to_level` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `posx` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `posy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `posz` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `datalog_pokemon_ups`
--

CREATE TABLE `datalog_pokemon_ups` (
  `player_id` int(11) NOT NULL,
  `pokemon_number` smallint(5) UNSIGNED NOT NULL,
  `from_level` smallint(5) UNSIGNED NOT NULL,
  `to_level` smallint(5) UNSIGNED NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `posx` int(10) NOT NULL DEFAULT 0,
  `posy` int(10) NOT NULL DEFAULT 0,
  `posz` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `downloads`
--

CREATE TABLE `downloads` (
  `id` int(11) NOT NULL,
  `version` varchar(100) NOT NULL,
  `host` varchar(25) NOT NULL,
  `link` varchar(100) NOT NULL,
  `button` varchar(100) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `downloads`
--

INSERT INTO `downloads` (`id`, `version`, `host`, `link`, `button`, `date`) VALUES
(3, '-', 'OtClient', 'https://www.pokenumb.com.br/apiTwo/files_0.1/PokeNumb.rar', 'https://i.imgur.com/doWxT4X.png', 1656609643),
(9, '-', 'Mobile', 'https://www.pokenumb.com.br/apiTwo/files_0.1/PokeNumb.apk', 'https://i.imgur.com/0UB9dmd.png', 1656609646);

-- --------------------------------------------------------

--
-- Estrutura da tabela `environment_killers`
--

CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fatura`
--

CREATE TABLE `fatura` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `ref` varchar(255) NOT NULL,
  `forma` varchar(100) NOT NULL,
  `data` varchar(100) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forums`
--

CREATE TABLE `forums` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `access` smallint(5) DEFAULT 1 COMMENT 'Min. access to see the board',
  `closed` tinyint(1) DEFAULT NULL,
  `moderators` tinytext DEFAULT NULL,
  `order` int(6) DEFAULT NULL,
  `requireLogin` tinyint(1) DEFAULT NULL,
  `guild` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `with` int(11) DEFAULT NULL,
  `friend` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `link` varchar(200) NOT NULL DEFAULT '',
  `balance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `guild_points` int(11) NOT NULL DEFAULT 0,
  `wins` int(11) NOT NULL DEFAULT 0,
  `losses` int(11) NOT NULL DEFAULT 0,
  `draws` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`); INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`); INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`); END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_kills`
--

CREATE TABLE `guild_kills` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT 0,
  `end` bigint(20) NOT NULL DEFAULT 0,
  `frags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `payment` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guild_kills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `enemy_kills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `lastwarning` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `town` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `doors` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `beds` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tiles` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `guild` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `clear` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(1, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 4, 242, 0, 0),
(2, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 242, 0, 0),
(3, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 144, 0, 0),
(4, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 182, 0, 0),
(5, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 4, 392, 0, 0),
(6, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 64, 0, 0),
(7, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 121, 0, 0),
(8, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 20, 0, 0),
(9, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 20, 0, 0),
(10, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 84, 0, 0),
(11, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 107, 0, 0),
(18, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 81, 0, 0),
(19, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 23, 0, 0),
(20, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 8, 169, 0, 0),
(21, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 4, 74, 0, 0),
(22, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 4, 111, 0, 0),
(23, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 81, 0, 0),
(24, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 16, 0, 0),
(877, 0, 0, 0, 0, 0, 'Unnamed House #877', 7, 68, 100, 100, 0, 0, 92, 0, 0),
(878, 0, 0, 0, 0, 0, 'Unnamed House #878', 7, 63, 100, 100, 0, 0, 88, 0, 0),
(879, 0, 0, 0, 0, 0, 'Unnamed House #879', 7, 56, 100, 100, 0, 0, 88, 0, 0),
(880, 0, 0, 0, 0, 0, 'Unnamed House #880', 7, 188, 100, 100, 0, 0, 248, 0, 0),
(881, 0, 0, 0, 0, 0, 'Unnamed House #881', 7, 130, 100, 100, 0, 0, 150, 0, 0),
(1501, 0, 1390, 0, 0, 1654630014, 'Saffron City #1501', 1, 183, 100, 100, 7, 0, 304, 0, 0),
(1502, 0, 2453, 0, 0, 1657686567, 'Saffron City #1502', 1, 78, 100, 100, 2, 0, 117, 0, 0),
(1503, 0, 1594, 0, 0, 1654984713, 'Saffron City #1503', 1, 115, 100, 100, 4, 0, 170, 0, 0),
(1504, 0, 1248, 0, 0, 1655154560, 'Saffron City #1504', 1, 81, 100, 100, 3, 0, 130, 0, 0),
(1505, 0, 1520, 0, 0, 1654820529, 'Saffron City #1505', 1, 80, 100, 100, 2, 0, 130, 0, 0),
(1506, 0, 1906, 0, 0, 1655762074, 'Saffron City #1506', 1, 61, 100, 100, 2, 0, 110, 0, 0),
(1507, 0, 1934, 0, 0, 1655610522, 'Saffron City #1507', 1, 73, 100, 100, 3, 0, 119, 0, 0),
(1508, 0, 1091, 0, 0, 1654126757, 'Saffron City #1508', 1, 73, 100, 100, 3, 0, 117, 0, 0),
(1509, 0, 0, 0, 0, 0, 'Saffron City #1509', 1, 62, 100, 100, 2, 0, 90, 0, 0),
(1510, 0, 2011, 0, 0, 1656810674, 'Unnamed House #1510', 7, 72, 100, 100, 1, 0, 111, 0, 0),
(1511, 0, 0, 0, 0, 0, 'Unnamed House #1511', 7, 123, 100, 100, 1, 0, 171, 0, 0),
(1512, 0, 0, 0, 0, 0, 'Unnamed House #1512', 7, 125, 100, 100, 2, 0, 198, 0, 0),
(1513, 0, 0, 0, 0, 0, 'Unnamed House #1513', 7, 164, 100, 100, 2, 0, 264, 0, 0),
(1514, 0, 0, 0, 0, 0, 'Unnamed House #1514', 7, 197, 100, 100, 1, 0, 312, 0, 0),
(1515, 0, 0, 0, 0, 0, 'Unnamed House #1515', 7, 154, 100, 100, 2, 0, 246, 0, 0),
(1516, 0, 0, 0, 0, 0, 'Unnamed House #1516', 7, 95, 100, 100, 1, 0, 142, 0, 0),
(1517, 0, 2807, 0, 0, 1658328443, 'Unnamed House #1517', 7, 152, 100, 100, 2, 0, 246, 0, 0),
(1518, 0, 0, 0, 0, 0, 'Unnamed House #1518', 7, 57, 100, 100, 1, 0, 90, 0, 0),
(1519, 0, 0, 0, 0, 0, 'Unnamed House #1519', 7, 50, 100, 100, 1, 0, 73, 0, 0),
(1520, 0, 0, 0, 0, 0, 'Unnamed House #1520', 7, 51, 100, 100, 1, 0, 87, 0, 0),
(1521, 0, 0, 0, 0, 0, 'Unnamed House #1521', 7, 46, 100, 100, 1, 0, 72, 0, 0),
(1522, 0, 0, 0, 0, 0, 'Unnamed House #1522', 7, 66, 100, 100, 1, 0, 102, 0, 0),
(1523, 0, 0, 0, 0, 0, 'Unnamed House #1523', 7, 46, 100, 100, 1, 0, 84, 0, 0),
(1524, 0, 0, 0, 0, 0, 'Unnamed House #1524', 7, 112, 100, 100, 2, 0, 180, 0, 0),
(1525, 0, 0, 0, 0, 0, 'Unnamed House #1525', 7, 124, 100, 100, 1, 0, 216, 0, 0),
(1526, 0, 0, 0, 0, 0, 'Unnamed House #1526', 7, 58, 100, 100, 1, 0, 90, 0, 0),
(1527, 0, 0, 0, 0, 0, 'Unnamed House #1527', 7, 83, 100, 100, 2, 0, 140, 0, 0),
(1528, 0, 0, 0, 0, 0, 'Unnamed House #1528', 7, 102, 100, 100, 1, 0, 180, 0, 0),
(1529, 0, 0, 0, 0, 0, 'Unnamed House #1529', 7, 169, 100, 100, 2, 0, 275, 0, 0),
(1530, 0, 0, 0, 0, 0, 'Unnamed House #1530', 7, 63, 100, 100, 1, 0, 88, 0, 0),
(1531, 0, 2015, 0, 0, 1655701704, 'Unnamed House #1531', 7, 157, 100, 100, 3, 0, 276, 0, 0),
(1532, 0, 0, 0, 0, 0, 'Unnamed House #1532', 7, 233, 100, 100, 2, 0, 380, 0, 0),
(1533, 0, 0, 0, 0, 0, 'Unnamed House #1533', 7, 70, 100, 100, 1, 0, 116, 0, 0),
(1534, 0, 0, 0, 0, 0, 'Unnamed House #1534', 7, 75, 100, 100, 3, 0, 136, 0, 0),
(1535, 0, 0, 0, 0, 0, 'Unnamed House #1535', 7, 95, 100, 100, 2, 0, 151, 0, 0),
(1536, 0, 0, 0, 0, 0, 'Unnamed House #1536', 7, 65, 100, 100, 2, 0, 96, 0, 0),
(1537, 0, 1931, 0, 0, 1656531170, 'Unnamed House #1537', 7, 208, 100, 100, 3, 0, 340, 0, 0),
(1538, 0, 0, 0, 0, 0, 'Unnamed House #1538', 7, 193, 100, 100, 1, 0, 316, 0, 0),
(1539, 0, 0, 0, 0, 0, 'Unnamed House #1539', 7, 181, 100, 100, 1, 0, 290, 0, 0),
(1540, 0, 0, 0, 0, 0, 'Unnamed House #1540', 7, 135, 100, 100, 1, 0, 216, 0, 0),
(1541, 0, 0, 0, 0, 0, 'Unnamed House #1541', 7, 147, 100, 100, 1, 0, 216, 0, 0),
(1542, 0, 0, 0, 0, 0, 'Unnamed House #1542', 7, 121, 100, 100, 1, 0, 200, 0, 0),
(1543, 0, 0, 0, 0, 0, 'Unnamed House #1543', 7, 111, 100, 100, 2, 0, 176, 0, 0),
(1544, 0, 0, 0, 0, 0, 'Unnamed House #1544', 7, 45, 100, 100, 1, 0, 66, 0, 0),
(1545, 0, 0, 0, 0, 0, 'Unnamed House #1545', 7, 60, 100, 100, 2, 0, 89, 0, 0),
(1546, 0, 0, 0, 0, 0, 'Unnamed House #1546', 7, 49, 100, 100, 1, 0, 72, 0, 0),
(1547, 0, 0, 0, 0, 0, 'Unnamed House #1547', 7, 75, 100, 100, 3, 0, 135, 0, 0),
(1548, 0, 0, 0, 0, 0, 'Unnamed House #1548', 7, 42, 100, 100, 1, 0, 72, 0, 0),
(1549, 0, 0, 0, 0, 0, 'Unnamed House #1549', 7, 56, 100, 100, 1, 0, 81, 0, 0),
(1550, 0, 0, 0, 0, 0, 'Unnamed House #1550', 7, 47, 100, 100, 1, 0, 74, 0, 0),
(1551, 0, 0, 0, 0, 0, 'Unnamed House #1551', 7, 224, 100, 100, 1, 0, 323, 0, 0),
(1552, 0, 0, 0, 0, 0, 'Unnamed House #1552', 7, 191, 100, 100, 2, 0, 267, 0, 0),
(1553, 0, 0, 0, 0, 0, 'Unnamed House #1553', 7, 56, 100, 100, 1, 0, 81, 0, 0),
(1554, 0, 0, 0, 0, 0, 'Unnamed House #1554', 7, 103, 100, 100, 2, 0, 183, 0, 0),
(1555, 0, 0, 0, 0, 0, 'Unnamed House #1555', 7, 67, 100, 100, 1, 0, 110, 0, 0),
(1556, 0, 2801, 0, 0, 1658185174, 'Unnamed House #1556', 7, 90, 100, 100, 1, 0, 121, 0, 0),
(1557, 0, 2803, 0, 0, 1658198203, 'Unnamed House #1557', 7, 72, 100, 100, 1, 0, 110, 0, 0),
(1558, 0, 2580, 0, 0, 1657670289, 'Unnamed House #1558', 7, 72, 100, 100, 1, 0, 110, 0, 0),
(1559, 0, 2672, 0, 0, 1657590274, 'Unnamed House #1559', 7, 72, 100, 100, 1, 0, 100, 0, 0),
(1560, 0, 0, 0, 0, 0, 'Unnamed House #1560', 7, 72, 100, 100, 1, 0, 100, 0, 0),
(1561, 0, 0, 0, 0, 0, 'Unnamed House #1561', 7, 72, 100, 100, 1, 0, 110, 0, 0),
(1562, 0, 0, 0, 0, 0, 'Unnamed House #1562', 7, 81, 100, 100, 1, 0, 121, 0, 0),
(1563, 0, 0, 0, 0, 0, 'Unnamed House #1563', 7, 81, 100, 100, 1, 0, 110, 0, 0),
(1564, 0, 0, 0, 0, 0, 'Unnamed House #1564', 7, 40, 100, 100, 1, 0, 71, 0, 0),
(1565, 0, 0, 0, 0, 0, 'Unnamed House #1565', 7, 63, 100, 100, 1, 0, 109, 0, 0),
(1566, 0, 0, 0, 0, 0, 'Unnamed House #1566', 7, 137, 100, 100, 2, 0, 203, 0, 0),
(1567, 0, 1551, 0, 0, 1655398870, 'Unnamed House #1567', 7, 142, 100, 100, 1, 0, 230, 0, 0),
(1568, 0, 0, 0, 0, 0, 'Unnamed House #1568', 7, 42, 100, 100, 1, 0, 64, 0, 0),
(1569, 0, 0, 0, 0, 0, 'Unnamed House #1569', 7, 44, 100, 100, 1, 0, 64, 0, 0),
(1570, 0, 0, 0, 0, 0, 'Unnamed House #1570', 7, 79, 100, 100, 1, 0, 126, 0, 0),
(1571, 0, 0, 0, 0, 0, 'Unnamed House #1571', 7, 36, 100, 100, 1, 0, 56, 0, 0),
(1572, 0, 0, 0, 0, 0, 'Unnamed House #1572', 7, 42, 100, 100, 1, 0, 64, 0, 0),
(1573, 0, 1177, 0, 0, 1655438710, 'Unnamed House #1573', 7, 36, 100, 100, 1, 0, 56, 0, 0),
(1574, 0, 0, 0, 0, 0, 'Unnamed House #1574', 7, 143, 100, 100, 1, 0, 232, 0, 0),
(1575, 0, 0, 0, 0, 0, 'Unnamed House #1575', 7, 70, 100, 100, 1, 0, 96, 0, 0),
(1576, 0, 0, 0, 0, 0, 'Unnamed House #1576', 7, 211, 100, 100, 1, 0, 319, 0, 0),
(1577, 0, 0, 0, 0, 0, 'Unnamed House #1577', 7, 234, 100, 100, 1, 0, 336, 0, 0),
(1578, 0, 0, 0, 0, 0, 'Unnamed House #1578', 7, 195, 100, 100, 1, 0, 280, 0, 0),
(1579, 0, 0, 0, 0, 0, 'Unnamed House #1579', 7, 325, 100, 100, 0, 0, 515, 0, 0),
(1580, 0, 0, 0, 0, 0, 'Unnamed House #1580', 7, 64, 100, 100, 1, 0, 100, 0, 0),
(1581, 0, 0, 0, 0, 0, 'Unnamed House #1581', 7, 131, 100, 100, 1, 0, 204, 0, 0),
(1582, 0, 0, 0, 0, 0, 'Unnamed House #1582', 7, 70, 100, 100, 1, 0, 96, 0, 0),
(1583, 0, 0, 0, 0, 0, 'Unnamed House #1583', 7, 73, 100, 100, 2, 0, 113, 0, 0),
(1584, 0, 0, 0, 0, 0, 'Unnamed House #1584', 7, 143, 100, 100, 2, 0, 220, 0, 0),
(1585, 0, 0, 0, 0, 0, 'Unnamed House #1585', 7, 129, 100, 100, 1, 0, 198, 0, 0),
(1586, 0, 0, 0, 0, 0, 'Unnamed House #1586', 7, 145, 100, 100, 1, 0, 220, 0, 0),
(1587, 0, 0, 0, 0, 0, 'Unnamed House #1587', 7, 209, 100, 100, 1, 0, 330, 0, 0),
(1588, 0, 2552, 0, 0, 1657403137, 'Unnamed House #1588', 7, 212, 100, 100, 1, 0, 330, 0, 0),
(1589, 0, 0, 0, 0, 0, 'Unnamed House #1589', 7, 69, 100, 100, 1, 0, 108, 0, 0),
(1590, 0, 0, 0, 0, 0, 'Unnamed House #1590', 7, 144, 100, 100, 1, 0, 208, 0, 0),
(1591, 0, 0, 0, 0, 0, 'Unnamed House #1591', 7, 163, 100, 100, 3, 0, 234, 0, 0),
(1592, 0, 0, 0, 0, 0, 'Unnamed House #1592', 7, 68, 100, 100, 1, 0, 108, 0, 0),
(1593, 0, 0, 0, 0, 0, 'Unnamed House #1593', 7, 180, 100, 100, 1, 0, 264, 0, 0),
(1594, 0, 0, 0, 0, 0, 'Unnamed House #1594', 7, 105, 100, 100, 1, 0, 168, 0, 0),
(1595, 0, 0, 0, 0, 0, 'Unnamed House #1595', 7, 120, 100, 100, 1, 0, 210, 0, 0),
(1596, 0, 0, 0, 0, 0, 'Unnamed House #1596', 7, 50, 100, 100, 1, 0, 74, 0, 0),
(1597, 0, 0, 0, 0, 0, 'Unnamed House #1597', 7, 72, 100, 100, 1, 0, 111, 0, 0),
(1598, 0, 0, 0, 0, 0, 'Unnamed House #1598', 7, 56, 100, 100, 1, 0, 88, 0, 0),
(1599, 0, 0, 0, 0, 0, 'Unnamed House #1599', 7, 96, 100, 100, 1, 0, 126, 0, 0),
(1600, 0, 0, 0, 0, 0, 'Unnamed House #1600', 7, 60, 100, 100, 1, 0, 98, 0, 0),
(1601, 0, 0, 0, 0, 0, 'Unnamed House #1601', 7, 65, 100, 100, 1, 0, 105, 0, 0),
(1602, 0, 0, 0, 0, 0, 'Unnamed House #1602', 7, 71, 100, 100, 3, 0, 120, 0, 0),
(1603, 0, 0, 0, 0, 0, 'Unnamed House #1603', 7, 81, 100, 100, 3, 0, 132, 0, 0),
(1604, 0, 0, 0, 0, 0, 'Unnamed House #1604', 7, 49, 100, 100, 1, 0, 72, 0, 0),
(1605, 0, 0, 0, 0, 0, 'Unnamed House #1605', 7, 49, 100, 100, 1, 0, 81, 0, 0),
(1606, 0, 0, 0, 0, 0, 'Unnamed House #1606', 7, 93, 100, 100, 1, 0, 139, 0, 0),
(1607, 0, 0, 0, 0, 0, 'Unnamed House #1607', 7, 62, 100, 100, 1, 0, 92, 0, 0),
(1608, 0, 0, 0, 0, 0, 'Unnamed House #1608', 7, 89, 100, 100, 1, 0, 137, 0, 0),
(1609, 0, 0, 0, 0, 0, 'Unnamed House #1609', 7, 70, 100, 100, 1, 0, 102, 0, 0),
(1610, 0, 0, 0, 0, 0, 'Unnamed House #1610', 7, 85, 100, 100, 1, 0, 129, 0, 0),
(1611, 0, 0, 0, 0, 0, 'Unnamed House #1611', 7, 93, 100, 100, 2, 0, 147, 0, 0),
(1612, 0, 0, 0, 0, 0, 'Unnamed House #1612', 7, 47, 100, 100, 1, 0, 78, 0, 0),
(1613, 0, 0, 0, 0, 0, 'Unnamed House #1613', 7, 25, 100, 100, 1, 0, 44, 0, 0),
(1614, 0, 0, 0, 0, 0, 'Unnamed House #1614', 7, 37, 100, 100, 1, 0, 69, 0, 0),
(1615, 0, 0, 0, 0, 0, 'Unnamed House #1615', 7, 62, 100, 100, 1, 0, 98, 0, 0),
(1616, 0, 0, 0, 0, 0, 'Unnamed House #1616', 7, 50, 100, 100, 1, 0, 69, 0, 0),
(1617, 0, 0, 0, 0, 0, 'Unnamed House #1617', 7, 42, 100, 100, 1, 0, 72, 0, 0),
(1618, 0, 0, 0, 0, 0, 'Unnamed House #1618', 7, 53, 100, 100, 2, 0, 90, 0, 0),
(1619, 0, 0, 0, 0, 0, 'Unnamed House #1619', 7, 40, 100, 100, 1, 0, 70, 0, 0),
(1620, 0, 0, 0, 0, 0, 'Unnamed House #1620', 7, 72, 100, 100, 1, 0, 102, 0, 0),
(1621, 0, 0, 0, 0, 0, 'Unnamed House #1621', 7, 78, 100, 100, 2, 0, 135, 0, 0),
(1622, 0, 0, 0, 0, 0, 'Unnamed House #1622', 7, 82, 100, 100, 1, 0, 124, 0, 0),
(1623, 0, 0, 0, 0, 0, 'Unnamed House #1623', 7, 48, 100, 100, 1, 0, 73, 0, 0),
(1624, 0, 0, 0, 0, 0, 'Unnamed House #1624', 7, 70, 100, 100, 1, 0, 97, 0, 0),
(1625, 0, 0, 0, 0, 0, 'Unnamed House #1625', 7, 81, 100, 100, 1, 0, 118, 0, 0),
(1626, 0, 2340, 0, 0, 1657548067, 'Saffron City #1626', 1, 218, 100, 100, 11, 0, 300, 0, 0),
(1627, 0, 1299, 0, 0, 1654565834, 'Saffron City #1627', 1, 154, 100, 100, 6, 0, 216, 0, 0),
(1628, 0, 2169, 0, 0, 1656278299, 'Saffron City #1628', 1, 322, 100, 100, 12, 0, 484, 0, 0),
(1629, 0, 2211, 0, 0, 1656461001, 'Saffron City #1629', 1, 232, 100, 100, 12, 0, 360, 0, 0),
(1630, 0, 1928, 0, 0, 1655571258, 'Saffron City #1630', 1, 286, 100, 100, 12, 0, 440, 0, 0),
(1631, 0, 1099, 0, 0, 1655341141, 'Saffron City #1631', 1, 231, 100, 100, 10, 0, 396, 0, 0),
(1632, 0, 1133, 0, 0, 1654042239, 'Saffron City #1632', 1, 137, 100, 100, 7, 0, 216, 0, 0),
(1633, 0, 1545, 0, 0, 1658635915, 'Saffron City #1633', 1, 222, 100, 100, 13, 0, 310, 0, 0),
(1634, 0, 2416, 0, 0, 1656992338, 'Saffron City #1634', 1, 79, 100, 100, 6, 0, 120, 0, 0),
(1635, 0, 2243, 0, 0, 1656651626, 'Saffron City #1635', 1, 203, 100, 100, 9, 0, 300, 0, 0),
(1636, 0, 2398, 0, 0, 1657288320, 'Saffron City #1636', 1, 78, 100, 100, 4, 0, 112, 0, 0),
(1637, 0, 1579, 0, 0, 1655033030, 'Saffron City #1637', 1, 297, 100, 100, 8, 0, 430, 0, 0),
(1638, 0, 1809, 0, 0, 1656022358, 'Saffron City #1638', 1, 56, 100, 100, 7, 0, 91, 0, 0),
(1639, 0, 2279, 0, 0, 1656632530, 'Saffron City #1639', 1, 60, 100, 100, 9, 0, 104, 0, 0),
(1640, 0, 1823, 0, 0, 1658111690, 'Saffron City #1640', 1, 100, 100, 100, 11, 0, 156, 0, 0),
(1641, 0, 2315, 0, 0, 1657028980, 'Saffron City #1641', 1, 120, 100, 100, 8, 0, 208, 0, 0),
(1642, 0, 2360, 0, 0, 1656757594, 'Saffron City #1642', 1, 155, 100, 100, 12, 0, 264, 0, 0),
(1643, 0, 2267, 0, 0, 1656859973, 'Saffron City #1643', 1, 140, 100, 100, 12, 0, 220, 0, 0),
(1644, 0, 1640, 0, 0, 1657464488, 'Saffron City #1644', 1, 60, 100, 100, 8, 0, 100, 0, 0),
(1645, 0, 2815, 0, 0, 1658285533, 'Saffron City #1645', 1, 67, 100, 100, 8, 0, 120, 0, 0),
(1646, 0, 1941, 0, 0, 1655564709, 'Saffron City #1646', 1, 222, 100, 100, 15, 0, 362, 0, 0),
(1647, 0, 2403, 0, 0, 1657510794, 'Saffron City #1647', 1, 93, 100, 100, 10, 0, 140, 0, 0),
(1648, 0, 1514, 0, 0, 1655108245, 'Saffron City #1648', 1, 132, 100, 100, 10, 0, 218, 0, 0),
(1649, 0, 2625, 0, 0, 1657922215, 'Saffron City #1649', 1, 84, 100, 100, 3, 0, 132, 0, 0),
(1650, 0, 2518, 0, 0, 1657750021, 'Saffron City #1650', 1, 67, 100, 100, 3, 0, 110, 0, 0),
(1651, 0, 2494, 0, 0, 1657568971, 'Saffron City #1651', 1, 68, 100, 100, 4, 0, 120, 0, 0),
(1652, 0, 0, 0, 0, 0, 'Saffron City #1652', 1, 54, 100, 100, 1, 0, 77, 0, 0),
(1653, 0, 1657, 0, 0, 1655382795, 'Saffron City #1653', 1, 121, 100, 100, 9, 0, 198, 0, 0),
(1654, 0, 1445, 0, 0, 1654632736, 'Saffron City #1654', 1, 172, 100, 100, 11, 0, 240, 0, 0),
(1655, 0, 1226, 0, 0, 1654780852, 'Saffron City #1655', 1, 156, 100, 100, 7, 0, 216, 0, 0),
(1656, 0, 2111, 0, 0, 1657503649, 'Saffron City #1656', 1, 70, 100, 100, 4, 0, 96, 0, 0),
(1657, 0, 2324, 0, 0, 1656878961, 'Saffron City #1657', 1, 49, 100, 100, 3, 0, 72, 0, 0),
(1658, 0, 0, 0, 0, 0, 'Saffron City #1658', 1, 56, 100, 100, 3, 0, 90, 0, 0),
(1659, 0, 0, 0, 0, 0, 'Saffron City #1659', 1, 64, 100, 100, 4, 0, 110, 0, 0),
(1660, 0, 2371, 0, 0, 1658678550, 'Saffron City #1660', 1, 48, 100, 100, 4, 0, 77, 0, 0),
(1661, 0, 0, 0, 0, 0, 'Saffron City #1661', 1, 48, 100, 100, 2, 0, 90, 0, 0),
(1662, 0, 0, 0, 0, 0, 'Saffron City #1662', 1, 49, 100, 100, 3, 0, 72, 0, 0),
(1663, 0, 0, 0, 0, 0, 'Saffron City #1663', 1, 43, 100, 100, 7, 0, 88, 0, 0),
(1664, 0, 1686, 0, 0, 1655933238, 'Saffron City #1664', 1, 58, 100, 100, 8, 0, 108, 0, 0),
(1665, 0, 0, 0, 0, 0, 'Saffron City #1665', 1, 42, 100, 100, 1, 0, 63, 0, 0),
(1666, 0, 0, 0, 0, 0, 'Saffron City #1666', 1, 49, 100, 100, 3, 0, 72, 0, 0),
(1667, 0, 1647, 0, 0, 1655526596, 'Saffron City #1667', 1, 42, 100, 100, 4, 0, 63, 0, 0),
(1668, 0, 1571, 0, 0, 1655695777, 'Saffron City #1668', 1, 45, 100, 100, 5, 0, 72, 0, 0),
(1669, 0, 0, 0, 0, 0, 'Saffron City #1669', 1, 43, 100, 100, 5, 0, 80, 0, 0),
(1670, 0, 0, 0, 0, 0, 'Saffron City #1670', 1, 42, 100, 100, 5, 0, 63, 0, 0),
(1671, 0, 0, 0, 0, 0, 'Saffron City #1671', 1, 35, 100, 100, 3, 0, 54, 0, 0),
(1672, 0, 0, 0, 0, 0, 'Saffron City #1672', 1, 42, 100, 100, 5, 0, 72, 0, 0),
(1673, 0, 0, 0, 0, 0, 'Saffron City #1673', 1, 86, 100, 100, 6, 0, 147, 0, 0),
(1674, 0, 0, 0, 0, 0, 'Saffron City #1674', 1, 28, 100, 100, 1, 0, 46, 0, 0),
(1675, 0, 0, 0, 0, 0, 'Saffron City #1675', 1, 66, 100, 100, 7, 0, 105, 0, 0),
(1676, 0, 0, 0, 0, 0, 'Saffron City #1676', 1, 28, 100, 100, 2, 0, 48, 0, 0),
(1677, 0, 0, 0, 0, 0, 'Saffron City #1677', 1, 32, 100, 100, 5, 0, 56, 0, 0),
(1678, 0, 0, 0, 0, 0, 'Saffron City #1678', 1, 44, 100, 100, 4, 0, 78, 0, 0),
(1679, 0, 2632, 0, 0, 1657415305, 'Saffron City #1679', 1, 40, 100, 100, 5, 0, 82, 0, 0),
(1680, 0, 0, 0, 0, 0, 'Saffron City #1680', 1, 35, 100, 100, 4, 0, 56, 0, 0),
(1681, 0, 1813, 0, 0, 1655238993, 'Saffron City #1681', 1, 130, 100, 100, 10, 0, 220, 0, 0),
(1682, 0, 1804, 0, 0, 1655230020, 'Saffron City #1682', 1, 129, 100, 100, 11, 0, 222, 0, 0),
(1683, 0, 0, 0, 0, 0, 'Saffron City #1683', 1, 62, 100, 100, 3, 0, 90, 0, 0),
(1684, 0, 0, 0, 0, 0, 'Saffron City #1684', 1, 45, 100, 100, 1, 0, 60, 0, 0),
(1685, 0, 2318, 0, 0, 1657571929, 'Saffron City #1685', 1, 42, 100, 100, 4, 0, 64, 0, 0),
(1686, 0, 0, 0, 0, 0, 'Saffron City #1686', 1, 42, 100, 100, 4, 0, 72, 0, 0),
(1687, 0, 0, 0, 0, 0, 'Saffron City #1687', 1, 69, 100, 100, 5, 0, 118, 0, 0),
(1688, 0, 2063, 0, 0, 1655899224, 'Saffron City #1688', 1, 46, 100, 100, 6, 0, 82, 0, 0),
(1689, 0, 1879, 0, 0, 1655602468, 'Saffron City #1689', 1, 89, 100, 100, 7, 0, 143, 0, 0),
(1690, 0, 1401, 0, 0, 1654752811, 'Saffron City #1690', 1, 95, 100, 100, 4, 0, 148, 0, 0),
(1691, 0, 1067, 0, 0, 1654048589, 'Saffron City #1691', 1, 123, 100, 100, 4, 0, 195, 0, 0),
(1692, 0, 1160, 0, 0, 1654079059, 'Saffron City #1692', 1, 126, 100, 100, 2, 0, 195, 0, 0),
(1693, 0, 1117, 0, 0, 1654126673, 'Saffron City #1693', 1, 117, 100, 100, 5, 0, 195, 0, 0),
(1694, 0, 1081, 0, 0, 1654126753, 'Saffron City #1694', 1, 123, 100, 100, 2, 0, 195, 0, 0),
(1695, 0, 1593, 0, 0, 1657503825, 'Saffron City #1695', 1, 236, 100, 100, 7, 0, 390, 0, 0),
(1696, 0, 1303, 0, 0, 1654621196, 'Saffron City #1696', 1, 98, 100, 100, 3, 0, 160, 0, 0),
(1697, 0, 1585, 0, 0, 1655123755, 'Saffron City #1697', 1, 72, 100, 100, 3, 0, 126, 0, 0),
(1698, 0, 1111, 0, 0, 1654084504, 'Saffron City #1698', 1, 97, 100, 100, 3, 0, 143, 0, 0),
(1699, 0, 1207, 0, 0, 1654422877, 'Saffron City #1699', 1, 160, 100, 100, 5, 0, 284, 0, 0),
(1700, 0, 1378, 0, 0, 1654823082, 'Saffron City #1700', 1, 128, 100, 100, 3, 0, 204, 0, 0),
(1701, 0, 1618, 0, 0, 1655440369, 'Saffron City #1701', 1, 54, 100, 100, 1, 0, 77, 0, 0),
(1702, 0, 1553, 0, 0, 1654944661, 'Saffron City #1702', 1, 98, 100, 100, 5, 0, 150, 0, 0),
(1703, 0, 1132, 0, 0, 1654433813, 'Saffron City #1703', 1, 132, 100, 100, 3, 0, 240, 0, 0),
(1704, 0, 2358, 0, 0, 1656970683, 'Saffron City #1704', 1, 49, 100, 100, 2, 0, 87, 0, 0),
(1705, 0, 2245, 0, 0, 1656981002, 'Saffron City #1705', 1, 54, 100, 100, 6, 0, 84, 0, 0),
(1706, 0, 2432, 0, 0, 1658359698, 'Saffron City #1706', 1, 59, 100, 100, 1, 0, 81, 0, 0),
(1707, 0, 2755, 0, 0, 1658934835, 'Saffron City #1707', 1, 86, 100, 100, 9, 0, 172, 0, 0),
(1708, 0, 2378, 0, 0, 1656866200, 'Saffron City #1708', 1, 70, 100, 100, 4, 0, 107, 0, 0),
(1709, 0, 1854, 0, 0, 1657080767, 'Saffron City #1709', 1, 69, 100, 100, 4, 0, 125, 0, 0),
(1710, 0, 2448, 0, 0, 1657378434, 'Saffron City #1710', 1, 45, 100, 100, 4, 0, 90, 0, 0),
(1711, 0, 0, 0, 0, 0, 'Saffron City #1711', 1, 47, 100, 100, 2, 0, 81, 0, 0),
(1712, 0, 1093, 0, 0, 1655425832, 'Saffron City #1712', 1, 46, 100, 100, 2, 0, 77, 0, 0),
(1713, 0, 2134, 0, 0, 1656145175, 'Saffron City #1713', 1, 112, 100, 100, 4, 0, 172, 0, 0),
(1714, 0, 2187, 0, 0, 1656278260, 'Saffron City #1714', 1, 68, 100, 100, 2, 0, 116, 0, 0),
(1715, 0, 1527, 0, 0, 1654785824, 'Saffron City #1715', 1, 311, 100, 100, 22, 0, 473, 0, 0),
(1716, 0, 1570, 0, 0, 1654825788, 'Saffron City #1716', 1, 244, 100, 100, 13, 0, 400, 0, 0),
(1717, 0, 2564, 0, 0, 1657331753, 'Saffron City #1717', 1, 85, 100, 100, 3, 0, 126, 0, 0),
(1718, 0, 2885, 0, 0, 1658944450, 'Saffron City #1718', 1, 71, 100, 100, 4, 0, 112, 0, 0),
(1719, 0, 1103, 0, 0, 1654115118, 'Saffron City #1719', 1, 217, 100, 100, 5, 0, 350, 0, 0),
(1720, 0, 1426, 0, 0, 1655048979, 'Saffron City #1720', 1, 64, 100, 100, 3, 0, 112, 0, 0),
(1721, 0, 1331, 0, 0, 1654759958, 'Saffron City #1721', 1, 79, 100, 100, 1, 0, 126, 0, 0),
(1722, 0, 1300, 0, 0, 1655091531, 'Saffron City #1722', 1, 64, 100, 100, 1, 0, 99, 0, 0),
(1803, 0, 0, 0, 0, 0, 'Vermilion City #1803', 3, 133, 100, 100, 10, 0, 192, 0, 0),
(1804, 0, 0, 0, 0, 0, 'Vermilion City #1804', 3, 0, 100, 100, 0, 0, 1, 0, 0),
(1805, 0, 0, 0, 0, 0, 'Vermilion City #1805', 3, 228, 100, 100, 10, 0, 309, 0, 0),
(1806, 0, 0, 0, 0, 0, 'Vermilion City #1806', 3, 80, 100, 100, 6, 0, 114, 0, 0),
(1807, 0, 0, 0, 0, 0, 'Vermilion City #1807', 3, 97, 100, 100, 10, 0, 158, 0, 0),
(1808, 0, 0, 0, 0, 0, 'Vermilion City #1808', 3, 36, 100, 100, 5, 0, 48, 0, 0),
(1809, 0, 0, 0, 0, 0, 'Vermilion City #1809', 3, 120, 100, 100, 3, 0, 165, 0, 0),
(1810, 0, 0, 0, 0, 0, 'Vermilion City #1810', 3, 102, 100, 100, 4, 0, 130, 0, 0),
(1811, 0, 0, 0, 0, 0, 'Vermilion City #1811', 3, 113, 100, 100, 9, 0, 168, 0, 0),
(1812, 0, 0, 0, 0, 0, 'Vermilion City #1812', 3, 133, 100, 100, 8, 0, 171, 0, 0),
(1813, 0, 0, 0, 0, 0, 'Vermilion City #1813', 3, 123, 100, 100, 4, 0, 163, 0, 0),
(1814, 0, 0, 0, 0, 0, 'Vermilion City #1814', 3, 103, 100, 100, 7, 0, 161, 0, 0),
(1815, 0, 0, 0, 0, 0, 'Vermilion City #1815', 3, 119, 100, 100, 6, 0, 158, 0, 0),
(1816, 0, 0, 0, 0, 0, 'Vermilion City #1816', 3, 144, 100, 100, 4, 0, 220, 0, 0),
(1817, 0, 1525, 0, 0, 1655126878, 'Vermilion City #1817', 3, 118, 100, 100, 1, 0, 147, 0, 0),
(1818, 0, 0, 0, 0, 0, 'Vermilion City #1818', 3, 222, 100, 100, 8, 0, 311, 0, 0),
(1819, 0, 0, 0, 0, 0, 'Vermilion City #1819', 3, 200, 100, 100, 6, 0, 256, 0, 0),
(1820, 0, 0, 0, 0, 0, 'Vermilion City #1820', 3, 102, 100, 100, 2, 0, 120, 0, 0),
(1821, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 83, 0, 0),
(2010, 0, 0, 0, 0, 0, 'Mandarin City #2010', 15, 80, 100, 100, 7, 4, 126, 0, 0),
(2011, 0, 0, 0, 0, 0, 'Mandarin City #2011', 15, 49, 100, 100, 7, 2, 88, 0, 0),
(2012, 0, 0, 0, 0, 0, 'Mandarin City #2012', 15, 52, 100, 100, 9, 4, 90, 0, 0),
(2013, 0, 0, 0, 0, 0, 'Mandarin City #2013', 15, 30, 100, 100, 6, 2, 60, 0, 0),
(2014, 0, 0, 0, 0, 0, 'Mandarin City #2014', 15, 24, 100, 100, 1, 0, 30, 0, 0),
(2015, 0, 0, 0, 0, 0, 'Mandarin City #2015', 15, 113, 100, 100, 11, 4, 178, 0, 0),
(2017, 0, 0, 0, 0, 0, 'Mandarin City #2017', 15, 28, 100, 100, 6, 2, 56, 0, 0),
(2018, 0, 0, 0, 0, 0, 'Mandarin City #2018', 15, 22, 100, 100, 5, 2, 48, 0, 0),
(2019, 0, 0, 0, 0, 0, 'Mandarin City #2019', 15, 22, 100, 100, 3, 2, 35, 0, 0),
(2020, 0, 0, 0, 0, 0, 'Mandarin City #2020', 15, 14, 100, 100, 2, 2, 25, 0, 0),
(2021, 0, 0, 0, 0, 0, 'Mandarin City #2021', 15, 64, 100, 100, 1, 4, 84, 0, 0),
(2022, 0, 0, 0, 0, 0, 'Mandarin City #2022', 15, 41, 100, 100, 1, 2, 63, 0, 0),
(2023, 0, 0, 0, 0, 0, 'Mandarin City #2023', 15, 28, 100, 100, 2, 2, 41, 0, 0),
(2024, 0, 0, 0, 0, 0, 'Mandarin City #2024', 15, 69, 100, 100, 2, 0, 94, 0, 0),
(2025, 0, 0, 0, 0, 0, 'Mandarin City #2025', 15, 116, 100, 100, 6, 3, 151, 0, 0),
(2026, 0, 0, 0, 0, 0, 'Mandarin City #2026', 15, 91, 100, 100, 6, 2, 137, 0, 0),
(2027, 0, 0, 0, 0, 0, 'Mandarin City #2027', 15, 25, 100, 100, 2, 0, 42, 0, 0),
(2028, 0, 0, 0, 0, 0, 'Mandarin City #2028', 15, 34, 100, 100, 7, 2, 49, 0, 0),
(2029, 0, 0, 0, 0, 0, 'Mandarin City #2029', 15, 20, 100, 100, 3, 4, 28, 0, 0),
(2030, 0, 0, 0, 0, 0, 'Mandarin City #2030', 15, 44, 100, 100, 6, 4, 70, 0, 0),
(2031, 0, 0, 0, 0, 0, 'Mandarin City #2031', 15, 22, 100, 100, 2, 2, 35, 0, 0),
(2032, 0, 0, 0, 0, 0, 'Mandarin City #2032', 15, 28, 100, 100, 4, 2, 45, 0, 0),
(2033, 0, 0, 0, 0, 0, 'Mandarin City #2033', 15, 42, 100, 100, 3, 4, 72, 0, 0),
(2034, 0, 0, 0, 0, 0, 'Mandarin City #2034', 15, 40, 100, 100, 4, 2, 59, 0, 0),
(2035, 0, 0, 0, 0, 0, 'Mandarin City #2035', 15, 37, 100, 100, 1, 2, 50, 0, 0),
(2036, 0, 0, 0, 0, 0, 'Mandarin City #2036', 15, 34, 100, 100, 2, 2, 41, 0, 0),
(2037, 0, 0, 0, 0, 0, 'Mandarin City #2037', 15, 79, 100, 100, 10, 0, 128, 0, 0),
(2152, 0, 0, 0, 0, 0, 'Pewter City #2152', 4, 119, 100, 100, 2, 0, 162, 0, 0),
(2153, 0, 0, 0, 0, 0, 'Pewter City #2153', 4, 107, 100, 100, 2, 0, 162, 0, 0),
(2154, 0, 0, 0, 0, 0, 'Pewter City #2154', 4, 45, 100, 100, 1, 0, 56, 0, 0),
(2155, 0, 0, 0, 0, 0, 'Pewter City #2155', 4, 75, 100, 100, 3, 0, 120, 0, 0),
(2156, 0, 0, 0, 0, 0, 'Pewter City #2156', 4, 61, 100, 100, 2, 0, 92, 0, 0),
(2157, 0, 0, 0, 0, 0, 'Pewter City #2157', 4, 77, 100, 100, 1, 0, 116, 0, 0),
(2158, 0, 0, 0, 0, 0, 'Pewter City #2158', 4, 90, 100, 100, 3, 0, 146, 0, 0),
(2159, 0, 0, 0, 0, 0, 'Pewter City  #2159', 4, 119, 100, 100, 2, 0, 164, 0, 0),
(2160, 0, 0, 0, 0, 0, 'Pewter City #2160', 4, 117, 100, 100, 4, 0, 164, 0, 0),
(2161, 0, 0, 0, 0, 0, 'Pewter City #2161', 4, 143, 100, 100, 2, 0, 181, 0, 0),
(2162, 0, 0, 0, 0, 0, 'Pewter City #2162', 4, 121, 100, 100, 2, 0, 176, 0, 0),
(2163, 0, 0, 0, 0, 0, 'Pewter City #2163', 4, 59, 100, 100, 1, 0, 75, 0, 0),
(2164, 0, 0, 0, 0, 0, 'Pewter City  #2164', 4, 78, 100, 100, 2, 0, 123, 0, 0),
(2165, 0, 0, 0, 0, 0, 'Pewter City #2165', 4, 111, 100, 100, 1, 0, 169, 0, 0),
(2166, 0, 0, 0, 0, 0, 'Pewter City #2166', 4, 53, 100, 100, 2, 0, 80, 0, 0),
(2167, 0, 0, 0, 0, 0, 'Pewter City #2167', 4, 78, 100, 100, 3, 0, 128, 0, 0),
(2168, 0, 0, 0, 0, 0, 'Pewter City  #2168', 4, 60, 100, 100, 2, 0, 86, 0, 0),
(2169, 0, 0, 0, 0, 0, 'Pewter City #2169', 4, 34, 100, 100, 2, 0, 55, 0, 0),
(2170, 0, 0, 0, 0, 0, 'Pewter City  #2170', 4, 54, 100, 100, 1, 0, 81, 0, 0),
(2171, 0, 0, 0, 0, 0, 'Pewter City #2171', 4, 93, 100, 100, 4, 0, 138, 0, 0),
(2172, 0, 0, 0, 0, 0, 'Pewter City #2172', 4, 0, 100, 100, 0, 0, 2, 0, 0),
(2173, 0, 0, 0, 0, 0, 'Pewter City #2173', 4, 88, 100, 100, 2, 0, 134, 0, 0),
(2174, 0, 0, 0, 0, 0, 'Pewter City #2174', 4, 89, 100, 100, 2, 0, 130, 0, 0),
(2175, 0, 0, 0, 0, 0, 'Pewter City  #2175', 4, 37, 100, 100, 1, 0, 53, 0, 0),
(2176, 0, 0, 0, 0, 0, 'Pewter City  #2176', 4, 82, 100, 100, 2, 0, 122, 0, 0),
(2177, 0, 0, 0, 0, 0, 'Pewter City  #2177', 4, 82, 100, 100, 3, 0, 129, 0, 0),
(2178, 0, 0, 0, 0, 0, 'Pewter City  #2178', 4, 109, 100, 100, 4, 0, 159, 0, 0),
(2179, 0, 0, 0, 0, 0, 'Pewter City #2179', 4, 60, 100, 100, 3, 0, 88, 0, 0),
(2180, 0, 0, 0, 0, 0, 'Pewter City #2180', 4, 44, 100, 100, 1, 0, 57, 0, 0),
(2181, 0, 2537, 0, 0, 1658886845, 'Pewter City  #2181', 4, 44, 100, 100, 3, 0, 81, 0, 0),
(2182, 0, 0, 0, 0, 0, 'Pewter City #2182', 4, 110, 100, 100, 2, 0, 164, 0, 0),
(2183, 0, 0, 0, 0, 0, 'Pewter City  #2183', 4, 44, 100, 100, 2, 0, 70, 0, 0),
(2184, 0, 0, 0, 0, 0, 'Pewter City #2184', 4, 48, 100, 100, 1, 0, 57, 0, 0),
(2185, 0, 0, 0, 0, 0, 'Pewter City #2185', 4, 90, 100, 100, 2, 0, 130, 0, 0),
(2186, 0, 0, 0, 0, 0, 'Pewter City  #2186', 4, 78, 100, 100, 2, 0, 100, 0, 0),
(2187, 0, 0, 0, 0, 0, 'Pewter City #2187', 4, 164, 100, 100, 2, 0, 212, 0, 0),
(2188, 0, 0, 0, 0, 0, 'Pewter City  #2188', 4, 177, 100, 100, 2, 0, 244, 0, 0),
(2189, 0, 0, 0, 0, 0, 'Pewter City  #2189', 4, 96, 100, 100, 2, 0, 147, 0, 0),
(2190, 0, 0, 0, 0, 0, 'Pewter City #2190', 4, 97, 100, 100, 3, 0, 132, 0, 0),
(2191, 0, 0, 0, 0, 0, 'Pewter City  #2191', 4, 25, 100, 100, 1, 0, 40, 0, 0),
(2192, 0, 0, 0, 0, 0, 'Viridian City #2192', 8, 113, 505750, 0, 1, 0, 170, 0, 0),
(2193, 0, 0, 0, 0, 0, 'Viridian City #2193', 8, 42, 139825, 0, 1, 0, 47, 0, 0),
(2194, 0, 0, 0, 0, 0, 'Viridian City #2194', 8, 42, 166600, 0, 1, 0, 56, 0, 0),
(2195, 0, 0, 0, 0, 0, 'Viridian City #2195', 8, 63, 267750, 0, 1, 0, 90, 0, 0),
(2196, 0, 0, 0, 0, 0, 'Viridian City #2196', 8, 80, 365925, 0, 1, 0, 123, 0, 0),
(2197, 0, 0, 0, 0, 0, 'Viridian City #2197', 8, 70, 261800, 0, 1, 0, 88, 0, 0),
(2198, 0, 0, 0, 0, 0, 'Viridian City #2198', 8, 60, 229075, 0, 1, 0, 77, 0, 0),
(2199, 0, 0, 0, 0, 0, 'Viridian City #2199', 8, 70, 261800, 0, 1, 0, 88, 0, 0),
(2200, 0, 0, 0, 0, 0, 'Viridian City #2200', 8, 96, 333200, 0, 1, 0, 112, 0, 0),
(2201, 0, 0, 0, 0, 0, 'Viridian City #2201', 8, 84, 309400, 0, 1, 0, 104, 0, 0),
(2202, 0, 0, 0, 0, 0, 'Viridian City #2202', 8, 155, 589050, 0, 0, 0, 198, 0, 0),
(2203, 0, 0, 0, 0, 0, 'Viridian City #2203', 8, 165, 672350, 0, 1, 0, 226, 0, 0),
(2204, 0, 0, 0, 0, 0, 'Viridian City #2204', 8, 116, 464100, 0, 1, 0, 156, 0, 0),
(2205, 0, 0, 0, 0, 0, 'Viridian City #2205', 8, 50, 249900, 0, 1, 0, 84, 0, 0),
(2206, 0, 0, 0, 0, 0, 'Viridian City #2206', 8, 50, 178500, 0, 1, 0, 60, 0, 0),
(2207, 0, 0, 0, 0, 0, 'Viridian City #2207', 8, 48, 160650, 0, 1, 0, 54, 0, 0),
(2208, 0, 0, 0, 0, 0, 'Viridian City #2208', 8, 64, 214200, 0, 1, 0, 72, 0, 0),
(2209, 0, 0, 0, 0, 0, 'Viridian City #2209', 8, 56, 214200, 0, 1, 0, 72, 0, 0),
(2210, 0, 0, 0, 0, 0, 'Viridian City #2210', 8, 108, 470050, 0, 1, 0, 158, 0, 0),
(2211, 0, 0, 0, 0, 0, 'Viridian City #2211', 8, 113, 470050, 0, 1, 0, 158, 0, 0),
(2212, 0, 0, 0, 0, 0, 'Viridian City #2212', 8, 60, 285600, 0, 1, 0, 96, 0, 0),
(2213, 0, 0, 0, 0, 0, 'Viridian City #2213', 8, 72, 303450, 0, 1, 0, 102, 0, 0),
(2214, 0, 0, 0, 0, 0, 'Viridian City #2214', 8, 40, 178500, 0, 1, 0, 60, 0, 0),
(2215, 0, 0, 0, 0, 0, 'Viridian City #2215', 8, 29, 121975, 0, 1, 0, 41, 0, 0),
(2216, 0, 0, 0, 0, 0, 'Viridian City #2216', 8, 36, 181475, 0, 1, 0, 61, 0, 0),
(2217, 0, 0, 0, 0, 0, 'Viridian City #2217', 8, 151, 609875, 0, 1, 0, 205, 0, 0),
(2218, 0, 0, 0, 0, 0, 'Viridian City #2218', 8, 152, 657475, 0, 1, 0, 221, 0, 0),
(2219, 0, 0, 0, 0, 0, 'Viridian City #2219', 8, 55, 270725, 0, 1, 0, 91, 0, 0),
(2220, 0, 0, 0, 0, 0, 'Viridian City #2220', 8, 226, 889525, 0, 2, 0, 299, 0, 0),
(2221, 0, 0, 0, 0, 0, 'Viridian City #2221', 8, 44, 199325, 0, 1, 0, 67, 0, 0),
(2222, 0, 0, 0, 0, 0, 'Viridian City #2222', 8, 77, 291550, 0, 1, 0, 98, 0, 0),
(2223, 0, 0, 0, 0, 0, 'Viridian City #2223', 8, 77, 351050, 0, 1, 0, 118, 0, 0),
(2224, 0, 0, 0, 0, 0, 'Viridian City #2224', 8, 85, 339150, 0, 1, 0, 114, 0, 0),
(2225, 0, 0, 0, 0, 0, 'Viridian City #2225', 8, 61, 238000, 0, 1, 0, 80, 0, 0),
(2226, 0, 0, 0, 0, 0, 'Viridian City #2226', 8, 58, 214200, 0, 1, 0, 72, 0, 0),
(2227, 0, 0, 0, 0, 0, 'Viridian City #2227', 8, 176, 675325, 0, 1, 0, 227, 0, 0),
(2228, 0, 0, 0, 0, 0, 'Viridian City #2228', 8, 36, 166600, 0, 1, 0, 56, 0, 0),
(2229, 0, 0, 0, 0, 0, 'Viridian City #2229', 8, 36, 166600, 0, 1, 0, 56, 0, 0),
(2230, 0, 0, 0, 0, 0, 'Viridian City #2230', 8, 78, 270725, 0, 1, 0, 91, 0, 0),
(2231, 0, 0, 0, 0, 0, 'Viridian City #2231', 8, 60, 229075, 0, 1, 0, 77, 0, 0),
(2232, 0, 0, 0, 0, 0, 'Viridian City #2232', 8, 60, 229075, 0, 2, 0, 77, 0, 0),
(2233, 0, 0, 0, 0, 0, 'Viridian City #2233', 8, 50, 196350, 0, 1, 0, 66, 0, 0),
(2234, 0, 0, 0, 0, 0, 'Viridian City #2234', 8, 60, 223125, 0, 1, 0, 75, 0, 0),
(2235, 0, 0, 0, 0, 0, 'Viridian City #2235', 8, 29, 124950, 0, 1, 0, 42, 0, 0),
(2236, 0, 0, 0, 0, 0, 'Viridian City #2236', 8, 94, 359975, 0, 1, 0, 121, 0, 0),
(2237, 0, 0, 0, 0, 0, 'Viridian City #2237', 8, 54, 208250, 0, 1, 0, 70, 0, 0),
(2238, 0, 0, 0, 0, 0, 'Viridian City #2238', 8, 54, 187425, 0, 1, 0, 63, 0, 0),
(2239, 0, 0, 0, 0, 0, 'Viridian City #2239', 8, 70, 220150, 0, 1, 0, 74, 0, 0),
(2240, 0, 0, 0, 0, 0, 'Viridian City #2240', 8, 60, 261800, 0, 1, 0, 88, 0, 0),
(2241, 0, 0, 0, 0, 0, 'Viridian City #2241', 8, 72, 294525, 0, 1, 0, 99, 0, 0),
(2242, 0, 0, 0, 0, 0, 'Viridian City #2242', 8, 148, 559300, 0, 1, 0, 188, 0, 0),
(2243, 0, 0, 0, 0, 0, 'Viridian City #2243', 8, 52, 208250, 0, 1, 0, 70, 0, 0),
(2244, 0, 0, 0, 0, 0, 'Viridian City #2244', 8, 132, 499800, 0, 1, 0, 168, 0, 0),
(2245, 0, 0, 0, 0, 0, 'Viridian City #2245', 8, 132, 458150, 0, 1, 0, 154, 0, 0),
(2246, 0, 0, 0, 0, 0, 'Viridian City #2246', 8, 143, 571200, 0, 1, 0, 192, 0, 0),
(2247, 0, 0, 0, 0, 0, 'Viridian City #2247', 8, 126, 514675, 0, 1, 0, 173, 0, 0),
(2248, 0, 0, 0, 0, 0, 'Viridian City #2248', 8, 172, 651525, 0, 1, 0, 219, 0, 0),
(2249, 0, 0, 0, 0, 0, 'Viridian City #2249', 8, 72, 261800, 0, 1, 0, 88, 0, 0),
(2250, 0, 0, 0, 0, 0, 'Viridian City #2250', 8, 96, 345100, 0, 1, 0, 116, 0, 0),
(2251, 0, 0, 0, 0, 0, 'Viridian City #2251', 8, 104, 357000, 0, 1, 0, 120, 0, 0),
(2252, 0, 0, 0, 0, 0, 'Viridian City #2252', 8, 104, 374850, 0, 1, 0, 126, 0, 0),
(2253, 0, 0, 0, 0, 0, 'Viridian City #2253', 8, 93, 395675, 0, 1, 0, 133, 0, 0),
(2254, 0, 0, 0, 0, 0, 'Viridian City #2254', 8, 93, 404600, 0, 1, 0, 136, 0, 0),
(2255, 0, 0, 0, 0, 0, 'Viridian City #2255', 8, 172, 672350, 0, 1, 0, 226, 0, 0),
(2256, 0, 0, 0, 0, 0, 'Viridian City #2256', 8, 130, 511700, 0, 1, 0, 172, 0, 0),
(2257, 0, 0, 0, 0, 0, 'Viridian City #2257', 8, 230, 934150, 0, 2, 0, 314, 0, 0),
(2258, 0, 0, 0, 0, 0, 'Viridian City #2258', 8, 178, 663425, 0, 1, 0, 223, 0, 0),
(2259, 0, 0, 0, 0, 0, 'Viridian City #2259', 8, 48, 187425, 0, 1, 0, 63, 0, 0),
(2260, 0, 0, 0, 0, 0, 'Viridian City #2260', 8, 48, 187425, 0, 1, 0, 63, 0, 0),
(2261, 0, 0, 0, 0, 0, 'Viridian City #2261', 8, 72, 264775, 0, 1, 0, 89, 0, 0),
(2262, 0, 0, 0, 0, 0, 'Viridian City #2262', 8, 161, 654500, 0, 1, 0, 220, 0, 0),
(2263, 0, 0, 0, 0, 0, 'Viridian City #2263', 8, 178, 714000, 0, 1, 0, 240, 0, 0),
(2264, 0, 0, 0, 0, 0, 'Viridian City #2264', 8, 68, 258825, 0, 1, 0, 87, 0, 0),
(2265, 0, 0, 0, 0, 0, 'Viridian City #2265', 8, 68, 270725, 0, 1, 0, 91, 0, 0),
(2266, 0, 0, 0, 0, 0, 'Viridian City #2266', 8, 66, 261800, 0, 1, 0, 88, 0, 0),
(2267, 0, 0, 0, 0, 0, 'Viridian City #2267', 8, 48, 187425, 0, 1, 0, 63, 0, 0),
(2268, 0, 0, 0, 0, 0, 'Viridian City #2268', 8, 32, 133875, 0, 1, 0, 45, 0, 0),
(2269, 0, 0, 0, 0, 0, 'Viridian City #2269', 8, 57, 217175, 0, 1, 0, 73, 0, 0),
(2270, 0, 0, 0, 0, 0, 'Cinnabar City #2270', 9, 58, 100, 100, 1, 0, 75, 0, 0),
(2271, 0, 0, 0, 0, 0, 'Cinnabar City #2271', 9, 72, 100, 100, 1, 0, 94, 0, 0),
(2272, 0, 0, 0, 0, 0, 'Cinnabar City #2272', 9, 56, 100, 100, 1, 0, 69, 0, 0),
(2273, 0, 0, 0, 0, 0, 'Cinnabar City #2273', 9, 116, 100, 100, 1, 0, 149, 0, 0),
(2274, 0, 0, 0, 0, 0, 'Cinnabar City #2274', 9, 55, 100, 100, 1, 0, 69, 0, 0),
(2275, 0, 0, 0, 0, 0, 'Cinnabar City #2275', 9, 60, 100, 100, 1, 0, 72, 0, 0),
(2276, 0, 0, 0, 0, 0, 'Cinnabar City #2276', 9, 63, 100, 100, 2, 0, 94, 0, 0),
(2277, 0, 0, 0, 0, 0, 'Cinnabar City #2277', 9, 62, 100, 100, 1, 0, 79, 0, 0),
(2278, 0, 0, 0, 0, 0, 'Cinnabar City #2278', 9, 64, 100, 100, 1, 0, 68, 0, 0),
(2279, 0, 0, 0, 0, 0, 'Cinnabar City #2279', 9, 48, 100, 100, 1, 0, 81, 0, 0),
(2280, 0, 0, 0, 0, 0, 'Cinnabar City #2280', 9, 42, 100, 100, 1, 0, 56, 0, 0),
(2281, 0, 0, 0, 0, 0, 'Cinnabar City #2281', 9, 58, 100, 100, 1, 0, 81, 0, 0),
(2282, 0, 0, 0, 0, 0, 'Cinnabar City #2282', 9, 64, 100, 100, 1, 0, 94, 0, 0),
(2283, 0, 0, 0, 0, 0, 'Cinnabar City #2283', 9, 54, 100, 100, 1, 0, 69, 0, 0),
(2284, 0, 0, 0, 0, 0, 'Cinnabar City #2284', 9, 54, 100, 100, 1, 0, 73, 0, 0),
(2285, 0, 0, 0, 0, 0, 'Cinnabar City #2285', 9, 66, 100, 100, 0, 0, 67, 0, 0),
(2286, 0, 0, 0, 0, 0, 'Cinnabar City #2286', 9, 79, 100, 100, 1, 0, 112, 0, 0),
(2287, 0, 0, 0, 0, 0, 'Cinnabar City  #2287', 9, 66, 100, 100, 1, 0, 74, 0, 0),
(2288, 0, 0, 0, 0, 0, 'Cinnabar City #2288', 9, 74, 100, 100, 0, 0, 108, 0, 0),
(2289, 0, 0, 0, 0, 0, 'Cinnabar City #2289', 9, 62, 100, 100, 0, 0, 88, 0, 0),
(2290, 0, 0, 0, 0, 0, 'Cinnabar City #2290', 9, 37, 100, 100, 1, 0, 44, 0, 0),
(2291, 0, 0, 0, 0, 0, 'Cinnabar City #2291', 9, 60, 100, 100, 1, 0, 90, 0, 0),
(2292, 0, 0, 0, 0, 0, 'Cinnabar City #2292', 9, 45, 100, 100, 1, 0, 57, 0, 0),
(2293, 0, 0, 0, 0, 0, 'Cinnabar City #2293', 9, 82, 100, 100, 0, 0, 100, 0, 0),
(2296, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 100, 0, 0),
(2297, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 121, 0, 0),
(2298, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 155, 0, 0),
(2299, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 99, 0, 0),
(2300, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 133, 0, 0),
(2301, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 237, 0, 0),
(2302, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 231, 0, 0),
(2303, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 252, 0, 0),
(2304, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 84, 0, 0),
(2305, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 81, 0, 0),
(2306, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 63, 0, 0),
(2307, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 75, 0, 0),
(2308, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 90, 0, 0),
(2309, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 113, 0, 0),
(2310, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 249, 0, 0),
(2311, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 66, 0, 0),
(2312, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 48, 0, 0),
(2313, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 173, 0, 0),
(2314, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 54, 0, 0),
(2315, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 88, 0, 0),
(2316, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 225, 0, 0),
(2317, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 148, 0, 0),
(2318, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 174, 0, 0),
(2319, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 131, 0, 0),
(2320, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 184, 0, 0),
(2321, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 206, 0, 0),
(2322, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 125, 0, 0),
(2323, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 94, 0, 0),
(2324, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 67, 0, 0),
(2325, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 216, 0, 0),
(2326, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 235, 0, 0),
(2327, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 173, 0, 0),
(2328, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 161, 0, 0),
(2329, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 132, 0, 0),
(2330, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 66, 0, 0),
(2331, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 289, 0, 0),
(2333, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 202, 0, 0),
(2334, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 170, 0, 0),
(2335, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 224, 0, 0),
(2336, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 199, 0, 0),
(2337, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 329, 0, 0),
(2338, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 209, 0, 0),
(2339, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 82, 0, 0),
(2340, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 190, 0, 0),
(2341, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 226, 0, 0),
(2342, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 60, 0, 0),
(2343, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 85, 0, 0),
(2344, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 87, 0, 0),
(2345, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 58, 0, 0),
(2346, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 51, 0, 0),
(2347, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 61, 0, 0),
(2348, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 243, 0, 0),
(2349, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 192, 0, 0),
(2350, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 149, 0, 0),
(2351, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 120, 0, 0),
(2353, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 80, 0, 0),
(2354, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 189, 0, 0),
(2355, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 223, 0, 0),
(2356, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 4, 0, 0),
(2357, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 6, 0, 0),
(2362, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 70, 0, 0),
(2363, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 48, 0, 0),
(2364, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 70, 0, 0),
(2365, 0, 2455, 0, 0, 1658702726, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 63, 0, 0),
(2366, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 49, 0, 0),
(2367, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 35, 0, 0),
(2368, 0, 2387, 0, 0, 1658767499, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 41, 0, 0),
(2369, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 88, 0, 0),
(2370, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 64, 0, 0),
(2371, 0, 2739, 0, 0, 1658205302, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 58, 0, 0),
(2372, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 88, 0, 0),
(2373, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 55, 0, 0),
(2374, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 35, 0, 0),
(2375, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 90, 0, 0),
(2376, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 56, 0, 0),
(2377, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 51, 0, 0),
(2378, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 82, 0, 0),
(2379, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 57, 0, 0),
(2380, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 103, 0, 0),
(2381, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 56, 0, 0),
(2382, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 28, 0, 0),
(2383, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 46, 0, 0),
(2384, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 24, 0, 0),
(2385, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 32, 0, 0),
(2386, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 43, 0, 0),
(2387, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 60, 0, 0),
(2388, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 153, 0, 0),
(2389, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 60, 0, 0),
(2390, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 88, 0, 0),
(2391, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 10, 0, 200, 0, 0),
(2392, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 73, 0, 0),
(2393, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 176, 0, 0),
(2394, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 16, 0, 283, 0, 0),
(2395, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 13, 0, 247, 0, 0),
(2396, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 164, 0, 0),
(2397, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 261, 0, 0),
(2398, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 13, 0, 252, 0, 0),
(2399, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 160, 0, 0),
(2400, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 212, 0, 0),
(2401, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 240, 0, 0),
(2402, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 10, 0, 205, 0, 0),
(2403, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 12, 0, 161, 0, 0),
(2404, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 150, 0, 0),
(2405, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 13, 0, 198, 0, 0),
(2406, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 77, 0, 0),
(2407, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 55, 0, 0),
(2408, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 13, 0, 286, 0, 0),
(2409, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 15, 0, 255, 0, 0),
(2410, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 14, 0, 229, 0, 0),
(2411, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 12, 0, 222, 0, 0),
(2412, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 18, 0, 250, 0, 0),
(2413, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 117, 0, 0),
(2414, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 16, 0, 264, 0, 0),
(2415, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 213, 0, 0),
(2416, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 270, 0, 0),
(2417, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 213, 0, 0),
(2418, 0, 1899, 0, 0, 1656166997, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 96, 0, 0),
(2419, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 81, 0, 0),
(2420, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 187, 0, 0),
(2421, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 212, 0, 0),
(2422, 0, 1444, 0, 0, 1654591125, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 84, 0, 0),
(2423, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 84, 0, 0),
(2424, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 55, 0, 0),
(2425, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 55, 0, 0),
(2426, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 225, 0, 0),
(2427, 0, 1922, 0, 0, 1655808016, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 192, 0, 0),
(2428, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 209, 0, 0),
(2429, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 70, 0, 0),
(2430, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 227, 0, 0),
(2431, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 246, 0, 0),
(2432, 0, 2546, 0, 0, 1658021375, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 288, 0, 0),
(2433, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 10, 0, 240, 0, 0),
(2434, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 230, 0, 0),
(2435, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 88, 0, 0),
(2436, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 193, 0, 0),
(2437, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 176, 0, 0),
(2438, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 281, 0, 0),
(2439, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 10, 0, 227, 0, 0),
(2440, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 218, 0, 0),
(2441, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 90, 0, 0),
(2442, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 80, 0, 0),
(2443, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 10, 0, 116, 0, 0),
(2444, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 132, 0, 0),
(2445, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 88, 0, 0),
(2447, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 207, 0, 0),
(2448, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 225, 0, 0),
(2449, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 193, 0, 0),
(2450, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 168, 0, 0),
(2452, 0, 1377, 0, 0, 1654577206, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 126, 0, 0),
(2453, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 189, 0, 0),
(2454, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 211, 0, 0),
(2455, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 172, 0, 0),
(2456, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 140, 0, 0),
(2457, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 42, 0, 0),
(2458, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 49, 0, 0),
(2459, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 59, 0, 0),
(2460, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 70, 0, 0),
(2461, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 72, 0, 0);
INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(2462, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 70, 0, 0),
(2463, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 188, 0, 0),
(2464, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 48, 0, 0),
(2465, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 207, 0, 0),
(2466, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 143, 0, 0),
(2467, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 137, 0, 0),
(2468, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 134, 0, 0),
(2469, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 225, 0, 0),
(2470, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 168, 0, 0),
(2471, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 198, 0, 0),
(2472, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 126, 0, 0),
(2474, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 231, 0, 0),
(2475, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 257, 0, 0),
(2476, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 192, 0, 0),
(2477, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 158, 0, 0),
(2478, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 167, 0, 0),
(2479, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 253, 0, 0),
(2480, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 165, 0, 0),
(2481, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 165, 0, 0),
(2482, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 217, 0, 0),
(2483, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 160, 0, 0),
(2484, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 162, 0, 0),
(2485, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 207, 0, 0),
(2486, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 12, 0, 280, 0, 0),
(2487, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 195, 0, 0),
(2488, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 171, 0, 0),
(2489, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 196, 0, 0),
(2490, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 147, 0, 0),
(2491, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 56, 0, 0),
(2492, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 195, 0, 0),
(2493, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 180, 0, 0),
(2494, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 129, 0, 0),
(2495, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 94, 0, 0),
(2496, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 141, 0, 0),
(2497, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 126, 0, 0),
(2499, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 199, 0, 0),
(2500, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 206, 0, 0),
(2501, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 93, 0, 0),
(2502, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 108, 0, 0),
(2504, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 162, 0, 0),
(2505, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 123, 0, 0),
(2506, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 147, 0, 0),
(2507, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 149, 0, 0),
(2508, 0, 2258, 0, 0, 1656643275, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 70, 0, 0),
(2509, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 71, 0, 0),
(2510, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 47, 0, 0),
(2511, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 171, 0, 0),
(2512, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 62, 0, 0),
(2513, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 81, 0, 0),
(2514, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 111, 0, 0),
(2515, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 62, 0, 0),
(2516, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 84, 0, 0),
(2517, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 130, 0, 0),
(2518, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 79, 0, 0),
(2519, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 96, 0, 0),
(2520, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 156, 0, 0),
(2521, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 13, 0, 251, 0, 0),
(2522, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 12, 0, 218, 0, 0),
(2523, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 165, 0, 0),
(2524, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 178, 0, 0),
(2525, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 168, 0, 0),
(2526, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 204, 0, 0),
(2527, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 58, 0, 0),
(2528, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 48, 0, 0),
(2529, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 72, 0, 0),
(2530, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 145, 0, 0),
(2531, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 58, 0, 0),
(2532, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 9, 0, 143, 0, 0),
(2533, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 179, 0, 0),
(2534, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 88, 0, 0),
(2535, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 8, 0, 105, 0, 0),
(2536, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 0, 265, 0, 0),
(2537, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 81, 0, 0),
(2538, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 69, 0, 0),
(2539, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 64, 0, 0),
(2540, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 72, 0, 0),
(2541, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 72, 0, 0),
(2542, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 72, 0, 0),
(2543, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 72, 0, 0),
(2544, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 72, 0, 0),
(2545, 0, 2884, 0, 0, 1658857044, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 123, 0, 0),
(2546, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 0, 59, 0, 0),
(2547, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 0, 118, 0, 0),
(2548, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 11, 0, 303, 0, 0),
(2549, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 125, 0, 0),
(2550, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 71, 0, 0),
(2551, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 56, 0, 0),
(2552, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 12, 0, 146, 0, 0),
(2553, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 0, 152, 0, 0),
(2554, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 13, 0, 209, 0, 0),
(2555, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 0, 169, 0, 0),
(2557, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 4, 0, 0),
(2558, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 10, 4, 77, 0, 0),
(2559, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 2, 54, 0, 0),
(2560, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 2, 36, 0, 0),
(2561, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 36, 0, 0),
(2562, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 36, 0, 0),
(2563, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 37, 0, 0),
(2564, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 2, 35, 0, 0),
(2565, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 2, 40, 0, 0),
(2566, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 30, 0, 0),
(2567, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 4, 0, 42, 0, 0),
(2568, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 5, 4, 63, 0, 0),
(2569, 0, 0, 0, 0, 0, 'Unnamed House #2569', 2, 188, 856800, 0, 0, 0, 288, 0, 0),
(2570, 0, 0, 0, 0, 0, 'Unnamed House #2570', 3, 89, 428400, 0, 0, 0, 144, 0, 0),
(2571, 0, 0, 0, 0, 0, 'Vila Inicial #1', 2, 270, 1088850, 0, 0, 4, 366, 0, 0),
(2572, 0, 0, 0, 0, 0, 'Vila Inicial #2', 2, 163, 719950, 0, 0, 4, 242, 0, 0),
(2573, 0, 0, 0, 0, 0, 'Vila Inicial #3', 2, 173, 719950, 0, 0, 2, 242, 0, 0),
(2574, 0, 0, 0, 0, 0, 'Vila Inicial #4', 2, 109, 502775, 0, 0, 2, 169, 0, 0),
(2575, 0, 0, 0, 0, 0, 'Vila Inicial #5', 2, 118, 541450, 0, 0, 2, 182, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_auctions`
--

CREATE TABLE `house_auctions` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `limit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `endtime` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_data`
--

CREATE TABLE `house_data` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `house_lists`
--

INSERT INTO `house_lists` (`house_id`, `world_id`, `listid`, `list`) VALUES
(1501, 0, 256, 'Guipelado\nJb Jabels'),
(1502, 0, 256, 'Ace'),
(1505, 0, 256, 'Alizinho'),
(1506, 0, 256, 'Testnumb\nCaradryan\n'),
(1531, 0, 256, 'Lordwerli'),
(1531, 0, 257, 'Account Manager\nNightmare'),
(1556, 0, 256, 'Sensei'),
(1559, 0, 256, 'Kirito212s2'),
(1626, 0, 256, 'Venancio Te Odeia'),
(1627, 0, 256, 'Eustass'),
(1630, 0, 257, 'Mitsuri Kanroji\nPay To See\nPay To Win\n'),
(1633, 0, 256, 'Noob\n\n\n\n\n\n'),
(1635, 0, 256, 'Japonesa\n'),
(1637, 0, 256, 'Brother Hood\nRoyal Paladin\n'),
(1640, 0, 257, 'pay to win\nsatan the one'),
(1645, 0, 257, 'Satan the One'),
(1646, 0, 256, 'F3nix'),
(1648, 0, 256, 'Dark Lucky \nLios'),
(1651, 0, 256, 'Ashkyzx'),
(1655, 0, 256, 'roben hood'),
(1656, 0, 256, 'I Love you\nDark Massacre'),
(1660, 0, 257, 'satan the one'),
(1681, 0, 256, 'chamado do mal'),
(1682, 0, 256, 'chamado do mal'),
(1689, 0, 256, 'tanatos'),
(1691, 0, 256, 'Lopenog\nHenri Foster\ndeleted\nmii xas'),
(1693, 0, 256, 'Alisonzkn\nBrabo\nMath\n'),
(1694, 0, 256, 'Mii Xas\nAobaq'),
(1695, 0, 256, 'Shadow Bischop  \nMonkey\nSakura\nAleks\nHinata\nJaya Luck\nMew\nTekashi\nJuice 666999\nAndroid 17\nMaldosa The One\n'),
(1700, 0, 256, 'sole\nace\norckrucks\n'),
(1701, 0, 256, 'XaZaum\n'),
(1702, 0, 256, 'Alizinho\nSole Ajudas'),
(1703, 0, 256, 'Xner'),
(1704, 0, 256, 'Mikhail'),
(1706, 0, 256, 'Rafa lordxx\nGustavo lordx \nRafa lordxxx'),
(1707, 0, 256, 'MuDin Zs\nDangamer\nMaldoso\nDeszo\nAbsolut sky\n'),
(1710, 0, 256, 'Boxewin\nmakeboost\nMrxp\nMactrab\nmakerboost\nBoxewin\n\n'),
(1712, 0, 256, 'Bugador\nAlizinho\n'),
(2432, 0, 256, 'I Love You\nDangamer');

-- --------------------------------------------------------

--
-- Estrutura da tabela `killers`
--

CREATE TABLE `killers` (
  `id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `war` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_items`
--

CREATE TABLE `market_items` (
  `id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `cost` bigint(20) DEFAULT NULL,
  `itemtype` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `attributes` blob NOT NULL,
  `time` bigint(20) NOT NULL DEFAULT 0,
  `money` tinyint(1) NOT NULL DEFAULT 0,
  `stack` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `market_items`
--

INSERT INTO `market_items` (`id`, `player_id`, `cost`, `itemtype`, `count`, `attributes`, `time`, `money`, `stack`) VALUES
(56, 209, 100000, 2392, 27, '', 1701442456, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `text` tinytext DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `delete_from` tinyint(1) DEFAULT NULL,
  `delete_to` tinyint(1) DEFAULT NULL,
  `unread` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '',
  `body` longtext DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `news`
--

INSERT INTO `news` (`id`, `title`, `body`, `username`, `time`) VALUES
(7, 'Atualização V0.3', '<span id=\\\"docs-internal-guid-ebea7605-7fff-69d3-ff3f-1523304b9e5b\\\"><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">Atualizações V0.3 (20/12/21)</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Pesca desativada até completarmos alguns testes</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Ditto Arrumado</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Colocado sistema de level separado do nick</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Arrumado nick system que atrapalhava o target</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Adicionado prêmio de  mais 4 quests (premios estão sendo revidos então a maioria dos baús do mapa estão sem nada, estamos revendo tudo e atualizando os baús em cada atualização)</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Removido mensagem ao entrar no chanel help até correção de algumas coisas</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Refeitos itens iniciais</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Facilitado base xp geral</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Automatização de donates do site implementada, agora a entrega de diamantes ao comprar pontos é feita 100% automática</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Evento bag corrigido, agora pode pegar somente um prêmio por evento</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Baby pikachu adicionado</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Arrumado catch system geral, refeita a fórmula, adicionado catch por perssistência e corrigido bugs (bug de queda e rollback e bug de quando tem 6 pokes e captutar um, não ir pro dp)</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Arrumado prêmios do daily items</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Revisto loot de todos os pokémons que dropavam stone, o drop de stones foi dificultado e padronizado</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Corrigido dano de todas as spells do servidor</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Colocado um auto reboot no servidor as 6:00 AM, para aplicar atualizações e otimização</span></p><div><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\"><br></span></div></span>', 'Numb', 1653825764),
(8, 'Atualização V0.4', '<span id=\\\"docs-internal-guid-c4ae99af-7fff-4d7c-6b19-4e024059b1c9\\\"><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">Atualização V0.4 (20/01)</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Adicionado mais de 6 hunts, uma quest e algumas correções e edições no mapa</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Correções no Ditto/Shiny Ditto</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Ativado e testado sistema de pesca</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Corrigido speed da bike</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Corrigido HeldBox</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Arrumado Full Restore</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Adicionado Sistema anti-bot (Vai ser ativado futuramente)</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Refeito sistema de catch, agora você tem uma quantidade máxima de balls que pode jogar em um determinado pokémon, essa quantidade equivale ao preço do pokememon, você gasta mais ou menos o preço dele em balls, em compensação ao novo sistema de média, agora o catch de sorte foi dificultado, para balanceamento no sistema</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Miss foi diminuido, de 50% de chance de um atk levar miss, agora são 15%</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Prêmios por level foram revistos e diminuidos</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Mensagem sobre o AutoLoot adicionada ao login</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Refeito balanceamento de XP</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Refeito balanceamento de level dos pokémons selvagens</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Revisto level que os pokémons precisavam para evoluir</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Revisto level das skills do Pikachu</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Removido Essence Shiny (conseguida apenas por eventos ou power ups agora) e Particle aura (Até adição do sistema de particle no client) do shop</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Arrumado DPS de cidades</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Adicionado teleports para se tornar cidadão das cidades</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Revisto surf e corrigido speed</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Arrumado tempo de !bug para um dia</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Arrumado teleport</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Adicionadas correções no Client, em breve colocaremos a Att no Launcher</span></p><p dir=\\\"ltr\\\" style=\\\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\\\"><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\">- Feito client mobile, ainda em sua versão inicial, link já disponível no site</span></p><div><span style=\\\"font-size: 11pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\\\"><br></span></div></span>', 'Numb', 1653825764),
(10, 'Atualização V0.5', 'Atualização V0.5 (20/02)<div><div>- Arrumada Shiny Stone</div><div>- Adicionado comando !comandos</div><div>- Adicionado comando !shinystone</div><div>- Adicionado comando !expbooster</div><div>- Adicionado comando !shinycharm</div><div>- Arrumado sistema de evolução, agora você pode evoluir seu pokémon em qualquer lugar que ele não buga mais...</div><div>- Arrumado uso de iscas infinitas</div><div>- Arrumado um bug crítico do Surf</div><div>- Arrumado pokemons pescados andarem em cima da agua</div><div>- Aumentado o range de click no mapa</div><div>- Arrumado bug crítico no autoLoot</div><div>- Adicionado Auto Stack itens, pra juntar sozinho tudo, seja ao arrastar pra bag ou fazer alguma quest</div><div>- Aumentado Speed de bikes</div><div>- Arrumado HeldBoxs</div><div>- Lista de pokemons shinys que aparecem aleatoriamente pelo mapa atualizada, agora todos os shinys que estão no servidor podem apareceer pelo mapa</div><div>- Colocado coowdown no revive</div><div>- Arrumado bug ao morrer no fly, surf</div><div>- Arrumado a abertura de box com 6 pokemons e o pokemon não ir pro dp</div><div>- Agora quando você cria conta o AutoLoot vem por padrão habilitado</div><div>- Algumas correções no Ditto/Shiny Ditto</div><div>- Adicionado sistema de torneio, feito todo dia às 15:00 e 20:00 horas</div><div>- Arrumado o PVP</div><div>- Arrumado item Butterfly wings</div><div>- Colocado efeito ao dropar Feather Stone</div><div>- Arrumado evolução do Larvitar</div><div>- Arrumado efeito da spell water gun</div><div>- Arrumado daily itens</div><div>- Adicionado area de TC, cheia de novas coisas como pvp, tasks e clans</div><div>- Adicionado stones no Henry, e diminuido preço de venda de stones no mesmo de 50 pra 25</div><div>- O máximo de cada bag que você pode comprar no mark agora é 20</div><div>- Arrumado alguns npcs</div><div>- Correções de algumas spells</div><div>- Agora não pode dar h1, h2 em zona segura</div><div>- Arrumado shop no mobile</div><div>- Janela de trade no mobile 50% arrumada</div></div>', 'Numb', 1653825764),
(11, 'Atualização V0.6', '<div>Atualização V0.6 (20/03)</div><div>- Substituído os 4 npcs de task do TC, mudado completamente o sistema</div><div>- Agora pokémons ganhos em qualquer box, são únicos</div><div>- Removido necessidade de Sun stone para bellossom</div><div>- Editado sistema de pesca, corrigido bugs, colocado uma proteção melhor contra bot, nerfado um pouco a quantidade dos pokemons pescados</div><div>- Adicionado evento darkrai</div><div>- Arrumado o pvp, além de ter adicionado área de pvp também corrigimos, para não perder mais XP quando morre</div><div>- Correções no Ditto e Shiny Ditto</div><div>- Facilitado o XP até o level 50</div><div>- CD dos pokemons iniciais divididos por 2, e buff em todos eles</div><div>- Adicionado torneio</div><div>- Editado o sistema de roupa de mergulho, agora os itens são conseguíveis atraves do npc Catch Token, localizado no segundo andar do tc</div><div>- Arrumado Megaphone</div><div>- Aumentado level de evolução de Metapod para 15</div><div>- Correções no order</div><div>- Adicionado Boost Stone e Guardian Shiny Gengar no Shop</div><div>- Nerf nas passivas do Golduck, Psyduck, Wobbuffet, Oddish, Gloom, Kabuto, Kabutops, Paras, Parasect, Venonat, Venomoth, Hopip, Skiploom, Jumpluff, Shiny Oddish, Shiny Venonat, Shiny Venomoth, Shiny Vileplume, Shiny Paras, Shiny Parasect e Shiny Tangela</div><div>- Buff nas passivas do Vileplume e Bellossom</div><div>- Arrumado preço do Electabuzz</div><div>- Adicionado sistema de Guardian (É um pokémon que, fora o seu pokémon principal te ajuda por determinado tempo, para os iniciais o shiny gengar amulet, embora seja de uso único, ajuda muito) similar ao sistema de card da pxg</div><div>- Agora, pra evoluir um pokémon por stone, ele pega o level necessário de evoluir por level e divide por dois</div><div>- Balanceamento na Boost Stone e Held Boost</div><div>- Nerfado Tier Lucky</div><div>- Arrumado Daily items</div>', 'Numb', 1653825764),
(12, 'Atualização V0.7', '<div>Atualização V0.7 (20/04)</div><div>- Adicionado Sistema AntiBot</div><div>- Correções na Shiny Stone</div><div>- Várias correções e coisas novas no cliente, que irão vir assim que o launcher novo chegar</div><div>- Adicionado prêmio em todos os baús do mapa, ao todo mais de 20 quests desbloqueadas</div><div>- Revisto prêmio das Daily Tasks</div><div>- Correções na VBall</div><div>- Correções no sistema de evolução</div><div>- Refeito o MoveSet de todos os pokémons</div><div>- Refeito a força dos moves dos pokémons, foi diminuída bastante por conta de termos reduzido muito o CD das magias</div><div>- Balanceamento nas passivas gerais</div><div>- Arrumado o level do pokémon que não aparecia em algumas situações</div><div>- Adicionada FirstBox no shop</div><div>- Algumas correções e alterações no sistema de order</div><div>- Atualizada as sprites de diversos pokémons, corpos e portraits</div><div>- Refeita PokeDex, a nova vai vir quando o launcher novo chegar</div><div>- Refeito loot de todos os pokémons</div><div>- Refeito sistema de loot</div><div>- Adicionado um módulo de tempo de guardian (Uma janela que mostra o tempo que seu guardian ainda tem)</div><div>- Refeito efeitos de drop de stones</div><div>- Daily reward desativado temporariamente</div><div>- Movebar some ao seu pokemon morrer</div><div>- Alterações no sistema de Idle (ser deslogado se parado por muito tempo)</div><div>- Prêmios por level alterados</div><div>- Balanceamento no XP</div><div>- Adicionado muitos itens de loot novos</div><div>- Edições no sistema de guardian</div><div>- Correções no Shiny Ditto</div><div>- Correções na roupa de mergulho</div><div>- Edições no Mark e Hugh</div><div>- Correções no AutoLoot</div><div>- Adição de alguns comandos novos</div><div>- Correções na PokeBar</div><div>- Atualizações no mapa, adição de quests, hunts e correções de bugs</div>', 'Numb', 1653825764),
(15, 'Diamond Green Event', '<div>Boa noite a todos, venho anunciar que o servidor será aberto as 13:00 de hoje, dia 29/05. </div><div>Para comemorar o lançamento do servidor vamos deixar um evento rolando por duas semanas!</div><div>O evento chama Diamond Green Event, todos os pokémons do servidor estão dropando um diamante verde por tempo limitado, esse diamante pode ser negociado em um npc que está localizado no TC. Aproveitem  evento!!</div><div><br></div><div><img src=\'https://i.imgur.com/F7MX3f7.jpg\\\'/></div>', 'Numb', 1653825764),
(16, 'Atualização V1.0 (04/06)', '<div><span style=\"background-color: transparent; font-size: 14px;\">- Desativada Shiny Stone</span></div><div>- Arrumadas HeldBoxs 1 à 4</div><div>- Refeito sistema completo de Catch, agora ele é feito por persistência e sorte, a cada ball que você joga te dá pontos para o sistema de persistência, com a poke tendo 1 ponto, great 2, super 3 e ultra 5. A Vball tem originalmente 4 pontos, mas ao jogar no shiny ela sobe pra 8, quanto mais pontos você tiver maior a sua chance de catch. Obviamente tem valores máximos para captura da maioria dos pokémons</div><div>- Refeito sistema completo de XP, incluindo a tabela de xp de cada poke em particular, estava horrível, tinha poke que dava muito e poke que dava muito pouco comparado a sua força, isso foi balanceado. O sistema em si sofreu várias modificações também</div><div>- Adicionado XP quando da catch pela primeira vez e catch window, também na primeira vez, mostrando quantas balls você jogou até capturar</div><div>- A pesca agora varia entre 2 e x segundos (min 8, depende da isca) o segundo efeito de pesca, que é quando você puxa o peixe da isca. Você agora tem um pouco menos de 2 segundos para puxar a isca de volta, tornando muito difícil o uso de bots de pesca</div><div>- Arrumado Autoloot, agora ele pega o loot na última bag com ao menos um slot livre, e se nenhuma bag tiver espaço nenhum vai pra bag principal</div><div>- Adicionadas mais 8 quests pelo mapa, adicionados prêmios na maioria dos baús</div><div>- Arrumado xp ao matar poke junto</div><div>- Editados prêmios de level</div><div>- Nerfado um pouco a aparição de shinys</div><div>- Editados os leveis que os pokes aparecem no mapa</div><div>- Evento Darkrai desativado temporariamente</div><div>- Evento Invasão ativado</div><div>- Diminuída chanches da passiva spores reaction e absorb</div><div>- Arrumada dex nos Shinys</div><div>- Arrumado erro no logoult tendo Farfetch\'d</div><div>- Diminuido level que os pokes vem quando ganha em box</div><div>- Colocado prêmios do PowerUp agora como unique item</div><div>- Aumentado um pouco a rate de loot</div><div>- Editados prêmios do evento bag</div><div>- Diminuído coowdown das spells no geral (se houver alguma spell com status negativo tipo confusion, sem cd depois que acaba o status peço que reportem o poke e a spell)</div><div>- Teleports do !h arrumados </div><div>- Diminuido hp de players</div><div>- Arrumado as bordas de praias no qual impossibilitava o surf</div><div>- Adicionado + 5 power ups no mapa</div><div>- Refeito o loot de todos os pokes shiny</div><div>- Arrumadas algumas spells sem dano</div>', 'Fallcon', 1654537701);

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsticker`
--

CREATE TABLE `newsticker` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagsegurotransacoes`
--

CREATE TABLE `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text DEFAULT NULL,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ProdQuantidade_x` int(5) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `soul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `skulltime` int(11) NOT NULL DEFAULT 0,
  `rank_id` int(11) NOT NULL DEFAULT 0,
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(2) NOT NULL DEFAULT 0,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `stamina` int(11) NOT NULL DEFAULT 151200000,
  `direction` int(11) NOT NULL DEFAULT 2,
  `loss_experience` int(11) NOT NULL DEFAULT 100,
  `loss_mana` int(11) NOT NULL DEFAULT 100,
  `loss_skills` int(11) NOT NULL DEFAULT 100,
  `loss_containers` int(11) NOT NULL DEFAULT 100,
  `loss_items` int(11) NOT NULL DEFAULT 100,
  `premend` int(11) NOT NULL DEFAULT 0 COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT 0,
  `marriage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `promotion` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `cast` tinyint(4) NOT NULL DEFAULT 0,
  `castViewers` int(11) NOT NULL DEFAULT 0,
  `castDescription` varchar(255) NOT NULL DEFAULT '',
  `old_name` varchar(255) DEFAULT NULL,
  `hide_char` int(11) DEFAULT NULL,
  `worldtransfer` int(11) DEFAULT NULL,
  `created` int(16) DEFAULT NULL,
  `nick_verify` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `exphist_lastexp` bigint(255) NOT NULL DEFAULT 0,
  `exphist1` bigint(255) NOT NULL DEFAULT 0,
  `exphist2` bigint(255) NOT NULL DEFAULT 0,
  `exphist3` bigint(255) NOT NULL DEFAULT 0,
  `exphist4` bigint(255) NOT NULL DEFAULT 0,
  `exphist5` bigint(255) NOT NULL DEFAULT 0,
  `exphist6` bigint(255) NOT NULL DEFAULT 0,
  `exphist7` bigint(255) NOT NULL DEFAULT 0,
  `onlinetimetoday` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime1` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime2` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime3` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime4` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime5` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime6` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime7` bigint(255) NOT NULL DEFAULT 0,
  `onlinetimeall` bigint(255) NOT NULL DEFAULT 0,
  `event_points` int(11) NOT NULL DEFAULT 0,
  `market_d` bigint(20) DEFAULT NULL,
  `market_p` bigint(20) DEFAULT NULL,
  `torneio` int(11) DEFAULT NULL,
  `Golden` int(11) NOT NULL DEFAULT 0,
  `image_profile` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`, `cast`, `castViewers`, `castDescription`, `old_name`, `hide_char`, `worldtransfer`, `created`, `nick_verify`, `comment`, `exphist_lastexp`, `exphist1`, `exphist2`, `exphist3`, `exphist4`, `exphist5`, `exphist6`, `exphist7`, `onlinetimetoday`, `onlinetime1`, `onlinetime2`, `onlinetime3`, `onlinetime4`, `onlinetime5`, `onlinetime6`, `onlinetime7`, `onlinetimeall`, `event_points`, `market_d`, `market_p`, `torneio`, `Golden`, `image_profile`) VALUES
(1, 'Teste', 0, 1, 1, 10, 0, 500, 500, 0, 0, 0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 1, 1032, 1024, 7, '', 400, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1617277427, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, ''),
(2, 'Testee', 0, 1, 1, 10, 0, 500, 500, 0, 0, 0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 1, 1032, 1024, 7, '', 400, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1617277433, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, ''),
(3, 'Testeee', 0, 1, 1, 10, 0, 500, 500, 0, 0, 0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 1, 1032, 1024, 7, '', 400, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1617277439, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, ''),
(4, 'Testeeee', 0, 1, 1, 10, 0, 500, 500, 0, 0, 0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 1, 1032, 1024, 7, '', 400, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1617277444, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, ''),
(5, 'Testeeeee', 0, 1, 1, 10, 0, 500, 500, 0, 0, 0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 1, 1032, 1024, 7, '', 400, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1617277453, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, ''),
(6, 'Testefive', 0, 1, 1, 10, 0, 500, 500, 0, 0, 0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 1, 1032, 1024, 7, '', 400, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1617277459, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, ''),
(7, 'Quinn', 0, 6, 3, 120, 1, 3330, 3330, 27674748, 86, 1, 92, 111, 2348, 3, 0, 6, 6, 0, 6, 1, 2241, 2130, 7, 0x0100004000020000000003ffffffff1a000000001b02000000fe010000400002ffffffff03ffffffff1a000000001b00000000fe, 0, 1, 1658272674, 4105548223, 1, 0, 0, 0, '', 1658273585, 0, 0, 151200000, 2, 60, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1629494593, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, ''),
(31, 'Lorddd D1095', 0, 1, 2, 98, 1, 2990, 2990, 15143482, 114, 94, 114, 114, 289, 0, 0, 3, 6, 0, 2, 1, 305, 1065, 6, '', 0, 1, 1631602897, 2377757119, 1, 0, 0, 0, '', 1631603067, 0, 0, 151200000, 2, 50, 100, 100, 100, 100, 0, 0, 0, 0, 1, '', 0, 0, '', NULL, NULL, NULL, 1630338739, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL),
(65, 'Ashney D1818', 0, 1, 3, 15, 1, 500, 500, 42458, 106, 111, 130, 39, 289, 0, 0, 1, 6, 0, 0, 1, 1178, 1903, 7, '', 0, 1, 1630770280, 2259988927, 1, 2, 0, 0, '', 1630770284, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 1, '', 0, 0, '', NULL, NULL, NULL, 1630461479, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL),
(86, 'Ice two D1512', 0, 6, 2, 53, 1, 1710, 1710, 2332992, 114, 88, 114, 114, 520, 0, 0, 6, 6, 0, 7, 1, 1569, 1531, 7, '', 0, 1, 1631755583, 2377757119, 1, 0, 0, 0, '', 1631755900, 0, 0, 151200000, 2, 26, 100, 100, 100, 100, 0, 0, 0, 0, 1, '', 0, 0, '', NULL, NULL, NULL, 1630645300, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL),
(87, 'Yreidn', 0, 6, 3, 163, 1, 3840, 3840, 70131018, 0, 85, 0, 114, 610, 3, 0, 4, 6, 0, 4, 8, 1043, 1034, 7, 0x0100004000020000000003ffffffff1a000000001b02000000fe010000400002ffffffff03ffffffff1a000000001b00000000fe, 0, 1, 1658447126, 4105548223, 1, 0, 0, 0, '', 1658453291, 0, 0, 151200000, 2, 81, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1630709291, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL),
(90, 'Msquinn', 0, 6, 3, 29, 1, 920, 920, 361736, 107, 9, 90, 26, 318, 0, 0, 5, 6, 0, 4, 1, 578, 585, 12, '', 0, 1, 1656781505, 4105548223, 1, 0, 0, 0, '', 1656781508, 0, 0, 151200000, 2, 14, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1630770791, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL),
(209, 'Mixlort', 0, 6, 2, 300, 1, 1500, 1500, 441207400, 9, 78, 64, 32, 289, 0, 0, 2, 6, 0, 0, 1, 1029, 1034, 7, '', 0, 1, 1705362114, 16777343, 1, 0, 0, 0, '', 1705363049, 0, 0, 151200000, 2, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1631068944, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 0, NULL),
(290, 'Pepsi', 0, 1, 2, 36, 1, 500, 500, 710707, 25, 94, 98, 79, 289, 0, 0, 0, 6, 0, 0, 1, 457, 240, 12, '', 0, 1, 1698633596, 16777343, 1, 0, 0, 0, '', 1698633601, 0, 0, 151200000, 2, 18, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', 0, 0, '', NULL, NULL, NULL, 1631755949, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0, NULL);

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players` FOR EACH ROW BEGIN INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10); INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10); INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10); INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10); INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10); INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10); INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10); END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN DELETE FROM `bans` WHERE `type` = 2 AND `value` = OLD.`id`; UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_autoloot`
--

CREATE TABLE `player_autoloot` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `autoloot_list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `player_autoloot`
--

INSERT INTO `player_autoloot` (`id`, `player_id`, `autoloot_list`) VALUES
(1, 290, ''),
(39, 209, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_catch`
--

CREATE TABLE `player_catch` (
  `player_id` int(11) NOT NULL,
  `poke` varchar(255) NOT NULL,
  `dex` tinyint(1) NOT NULL DEFAULT 0,
  `use` tinyint(1) NOT NULL DEFAULT 0,
  `catch` tinyint(1) NOT NULL DEFAULT 0,
  `pokeball` int(11) NOT NULL DEFAULT 0,
  `greatball` int(11) NOT NULL DEFAULT 0,
  `superball` int(11) NOT NULL DEFAULT 0,
  `ultraball` int(11) NOT NULL DEFAULT 0,
  `saffariball` int(11) NOT NULL DEFAULT 0,
  `masterball` int(11) NOT NULL DEFAULT 0,
  `premierball` int(11) NOT NULL DEFAULT 0,
  `vball` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_catchs`
--

CREATE TABLE `player_catchs` (
  `id` int(11) NOT NULL,
  `pokemon_id` varchar(30) NOT NULL,
  `player_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `player_catchs`
--

INSERT INTO `player_catchs` (`id`, `pokemon_id`, `player_name`) VALUES
(1, 'Shiny Marowak', 'Toshibakun');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL,
  `monster` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(290, 1, 101, 2120, 1, ''),
(290, 2, 102, 2580, 1, ''),
(290, 3, 103, 1987, 1, ''),
(290, 4, 104, 2550, 1, ''),
(290, 5, 105, 1988, 1, ''),
(290, 6, 106, 2382, 1, ''),
(290, 7, 107, 2395, 1, ''),
(290, 8, 108, 2152, 3, 0x0f038001000500756e69636f0201000000),
(290, 103, 109, 12349, 35, 0x0f238001000500756e69636f0201000000),
(290, 103, 110, 12344, 15, 0x0f0f8001000500756e69636f0201000000),
(290, 103, 111, 12346, 25, 0x0f198001000500756e69636f0201000000),
(290, 103, 112, 2394, 30, 0x0f1e8001000500756e69636f0201000000),
(290, 105, 113, 12260, 1, ''),
(290, 105, 114, 12261, 1, ''),
(290, 105, 115, 12262, 1, ''),
(290, 105, 116, 12263, 1, ''),
(290, 105, 117, 12265, 1, ''),
(290, 105, 118, 12264, 1, ''),
(290, 105, 119, 12266, 1, ''),
(290, 105, 120, 12267, 1, ''),
(209, 1, 101, 2120, 1, ''),
(209, 2, 102, 2580, 1, ''),
(209, 3, 103, 1987, 1, ''),
(209, 4, 104, 2550, 1, ''),
(209, 5, 105, 1988, 1, ''),
(209, 6, 106, 2382, 1, ''),
(209, 7, 107, 11994, 1, ''),
(209, 8, 108, 12921, 1, 0x8039000500427566663102ffffffff0500427566663202ffffffff0500427566663302ffffffff04004665617202ffffffff0400526f617202ffffffff08006164646f6e4e6f77022c020000040062616c6c01060000006e6f726d616c090062616c6c6f7264657202020000000500626c696e6b010d00000063643a313730313236393537330500626f6f7374026400000004006275726e02ffffffff07006275726e646d6703666672420600636f6c6f723102000000000600636f6c6f723202000000000600636f6c6f723302000000000600636f6c6f723402000000000700636f6e6675736502ffffffff0700636f6e74726f6c010d00000063643a313730313236393537330800646566656174656401020000006e6f0b006465736372697074696f6e0115000000436f6e7461696e7320612043686172697a6172642e02006576020000000003006578700200000000080066616b65646573630115000000436f6e7461696e7320612043686172697a6172642e04006665617202ffffffff02006870020100000002006976021200000005006c6565636802ffffffff05006c6576656c026400000004006d69737302ffffffff08006d6973735379737402ffffffff05006d6f766531010d00000063643a3137303132363935373306006d6f76653130010d00000063643a3137303132363935373306006d6f76653131010d00000063643a3137303132363935373306006d6f76653132010d00000063643a3137303132363935373306006d6f76653133010d00000063643a3137303132363935373306006d6f76653134010d00000063643a3137303132363935373306006d6f76653135010d00000063643a3137303132363935373305006d6f766532010d00000063643a3137303533363137353305006d6f766533010d00000063643a3137303132363935373305006d6f766534010d00000063643a3137303132363935373305006d6f766535010d00000063643a3137303132363935373305006d6f766536010d00000063643a3137303533363135323205006d6f766537010d00000063643a3137303533363137313005006d6f766538010d00000063643a3137303533363137313205006d6f766539010d00000063643a3137303533363138363809006d6f766542616c6c5401020000006f6e06006e61747572650105000000517569657404006e6f6d65010900000043686172697a6172640800706172616c797a6502ffffffff0600706f69736f6e02ffffffff0400706f6b65010900000043686172697a617264070073696c656e636502ffffffff0b0073696c656e63655379737402ffffffff0500736c65657002ffffffff0400736c6f7702ffffffff04007374756e02ffffffff0700746164706f727402da2e0000),
(209, 10, 109, 12344, 996, 0x0fe4),
(209, 103, 110, 13302, 1, 0x80370005003130303032010700000050696467656f7404004665617202ffffffff0400526f617202ffffffff08006164646f6e4e6f7702af010000040062616c6c01060000006e6f726d616c090062616c6c6f7264657202020000000500626c696e6b010d00000063643a313730353336313131340500626f6f7374020000000004006275726e02ffffffff0600636f6c6f723102000000000600636f6c6f723202000000000600636f6c6f723302000000000600636f6c6f723402000000000700636f6e6675736502ffffffff0700636f6e74726f6c010d00000063643a313730353336313131340800646566656174656401020000006e6f0b006465736372697074696f6e0113000000436f6e7461696e7320612050696467656f742e02006576020000000003006578700200000000080066616b65646573630113000000436f6e7461696e7320612050696467656f742e04006665617202ffffffff050068656c6479026101000002006870020100000002006976021700000005006c6565636802ffffffff05006c6576656c020e00000004006d69737302ffffffff08006d6973735379737402ffffffff05006d6f766531010d00000063643a3137303533363131313406006d6f76653130010d00000063643a3137303533363134383406006d6f76653131010d00000063643a3137303533363139363406006d6f76653132010d00000063643a3137303533363131313406006d6f76653133010d00000063643a3137303533363131313406006d6f76653134010d00000063643a3137303533363131313406006d6f76653135010d00000063643a3137303533363131313405006d6f766532010d00000063643a3137303533363131313405006d6f766533010d00000063643a3137303533363131313405006d6f766534010d00000063643a3137303533363131313405006d6f766535010d00000063643a3137303533363131313405006d6f766536010d00000063643a3137303533363139383005006d6f766537010d00000063643a3137303533363139383005006d6f766538010d00000063643a3137303533363230313205006d6f766539010d00000063643a3137303533363134383809006d6f766542616c6c5401020000006f6e06006e617475726501060000004c6f6e656c7904006e6f6d65010700000050696467656f740800706172616c797a6502ffffffff0600706f69736f6e02ffffffff0400706f6b65010700000050696467656f74070073696c656e636502ffffffff0b0073696c656e63655379737402ffffffff0500736c65657002ffffffff0400736c6f7702ffffffff04007374756e02ffffffff0700746164706f727402e62e0000),
(209, 103, 111, 2148, 30, 0x0f1e),
(209, 103, 112, 2160, 1000, 0x0fe8),
(209, 103, 113, 2392, 940, 0x0fac),
(209, 103, 114, 12349, 35, 0x0f238001000500756e69636f0201000000),
(209, 103, 115, 12346, 25, 0x0f198001000500756e69636f0201000000),
(209, 103, 116, 2394, 30, 0x0f1e8001000500756e69636f0201000000),
(209, 105, 117, 12260, 1, ''),
(209, 105, 118, 12261, 1, ''),
(209, 105, 119, 12262, 1, ''),
(209, 105, 120, 12263, 1, ''),
(209, 105, 121, 12265, 1, ''),
(209, 105, 122, 12264, 1, ''),
(209, 105, 123, 12266, 1, ''),
(209, 105, 124, 12267, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_killers`
--

CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_pokedex`
--

CREATE TABLE `player_pokedex` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `bulbasaur` varchar(5) NOT NULL DEFAULT '0-0',
  `ivysaur` varchar(5) NOT NULL DEFAULT '0-0',
  `venusaur` varchar(5) NOT NULL DEFAULT '0-0',
  `charmander` varchar(5) NOT NULL DEFAULT '0-0',
  `charmeleon` varchar(5) NOT NULL DEFAULT '0-0',
  `charizard` varchar(5) NOT NULL DEFAULT '0-0',
  `squirtle` varchar(5) NOT NULL DEFAULT '0-0',
  `wartortle` varchar(5) NOT NULL DEFAULT '0-0',
  `blastoise` varchar(5) NOT NULL DEFAULT '0-0',
  `caterpie` varchar(5) NOT NULL DEFAULT '0-0',
  `metapod` varchar(5) NOT NULL DEFAULT '0-0',
  `butterfree` varchar(5) NOT NULL DEFAULT '0-0',
  `weedle` varchar(5) NOT NULL DEFAULT '0-0',
  `kakuna` varchar(5) NOT NULL DEFAULT '0-0',
  `beedrill` varchar(5) NOT NULL DEFAULT '0-0',
  `pidgey` varchar(5) NOT NULL DEFAULT '0-0',
  `pidgeotto` varchar(5) NOT NULL DEFAULT '0-0',
  `pidgeot` varchar(5) NOT NULL DEFAULT '0-0',
  `rattata` varchar(5) NOT NULL DEFAULT '0-0',
  `raticate` varchar(5) NOT NULL DEFAULT '0-0',
  `spearow` varchar(5) NOT NULL DEFAULT '0-0',
  `fearow` varchar(5) NOT NULL DEFAULT '0-0',
  `ekans` varchar(5) NOT NULL DEFAULT '0-0',
  `arbok` varchar(5) NOT NULL DEFAULT '0-0',
  `pikachu` varchar(5) NOT NULL DEFAULT '0-0',
  `raichu` varchar(5) NOT NULL DEFAULT '0-0',
  `sandshrew` varchar(5) NOT NULL DEFAULT '0-0',
  `sandslash` varchar(5) NOT NULL DEFAULT '0-0',
  `nidoran_f` varchar(5) NOT NULL DEFAULT '0-0',
  `nidorina` varchar(5) NOT NULL DEFAULT '0-0',
  `nidoqueen` varchar(5) NOT NULL DEFAULT '0-0',
  `nidoran_m` varchar(5) NOT NULL DEFAULT '0-0',
  `nidorino` varchar(5) NOT NULL DEFAULT '0-0',
  `nidoking` varchar(5) NOT NULL DEFAULT '0-0',
  `clefairy` varchar(5) NOT NULL DEFAULT '0-0',
  `clefable` varchar(5) NOT NULL DEFAULT '0-0',
  `vulpix` varchar(5) NOT NULL DEFAULT '0-0',
  `ninetales` varchar(5) NOT NULL DEFAULT '0-0',
  `jigglypuff` varchar(5) NOT NULL DEFAULT '0-0',
  `wigglytuff` varchar(5) NOT NULL DEFAULT '0-0',
  `zubat` varchar(5) NOT NULL DEFAULT '0-0',
  `golbat` varchar(5) NOT NULL DEFAULT '0-0',
  `oddish` varchar(5) NOT NULL DEFAULT '0-0',
  `gloom` varchar(5) NOT NULL DEFAULT '0-0',
  `vileplume` varchar(5) NOT NULL DEFAULT '0-0',
  `paras` varchar(5) NOT NULL DEFAULT '0-0',
  `parasect` varchar(5) NOT NULL DEFAULT '0-0',
  `venonat` varchar(5) NOT NULL DEFAULT '0-0',
  `venomoth` varchar(5) NOT NULL DEFAULT '0-0',
  `diglett` varchar(5) NOT NULL DEFAULT '0-0',
  `dugtrio` varchar(5) NOT NULL DEFAULT '0-0',
  `meowth` varchar(5) NOT NULL DEFAULT '0-0',
  `persian` varchar(5) NOT NULL DEFAULT '0-0',
  `psyduck` varchar(5) NOT NULL DEFAULT '0-0',
  `golduck` varchar(5) NOT NULL DEFAULT '0-0',
  `mankey` varchar(5) NOT NULL DEFAULT '0-0',
  `primeape` varchar(5) NOT NULL DEFAULT '0-0',
  `growlithe` varchar(5) NOT NULL DEFAULT '0-0',
  `arcanine` varchar(5) NOT NULL DEFAULT '0-0',
  `poliwag` varchar(5) NOT NULL DEFAULT '0-0',
  `poliwhirl` varchar(5) NOT NULL DEFAULT '0-0',
  `poliwrath` varchar(5) NOT NULL DEFAULT '0-0',
  `abra` varchar(5) NOT NULL DEFAULT '0-0',
  `kadabra` varchar(5) NOT NULL DEFAULT '0-0',
  `alakazam` varchar(5) NOT NULL DEFAULT '0-0',
  `machop` varchar(5) NOT NULL DEFAULT '0-0',
  `machoke` varchar(5) NOT NULL DEFAULT '0-0',
  `machamp` varchar(5) NOT NULL DEFAULT '0-0',
  `bellsprout` varchar(5) NOT NULL DEFAULT '0-0',
  `weepinbell` varchar(5) NOT NULL DEFAULT '0-0',
  `victreebel` varchar(5) NOT NULL DEFAULT '0-0',
  `tentacool` varchar(5) NOT NULL DEFAULT '0-0',
  `tentacruel` varchar(5) NOT NULL DEFAULT '0-0',
  `geodude` varchar(5) NOT NULL DEFAULT '0-0',
  `graveler` varchar(5) NOT NULL DEFAULT '0-0',
  `golem` varchar(5) NOT NULL DEFAULT '0-0',
  `ponyta` varchar(5) NOT NULL DEFAULT '0-0',
  `rapidash` varchar(5) NOT NULL DEFAULT '0-0',
  `slowpoke` varchar(5) NOT NULL DEFAULT '0-0',
  `slowbro` varchar(5) NOT NULL DEFAULT '0-0',
  `magnemite` varchar(5) NOT NULL DEFAULT '0-0',
  `magneton` varchar(5) NOT NULL DEFAULT '0-0',
  `farfetch_d` varchar(5) NOT NULL DEFAULT '0-0',
  `doduo` varchar(5) NOT NULL DEFAULT '0-0',
  `dodrio` varchar(5) NOT NULL DEFAULT '0-0',
  `seel` varchar(5) NOT NULL DEFAULT '0-0',
  `dewgong` varchar(5) NOT NULL DEFAULT '0-0',
  `grimer` varchar(5) NOT NULL DEFAULT '0-0',
  `muk` varchar(5) NOT NULL DEFAULT '0-0',
  `shellder` varchar(5) NOT NULL DEFAULT '0-0',
  `cloyster` varchar(5) NOT NULL DEFAULT '0-0',
  `gastly` varchar(5) NOT NULL DEFAULT '0-0',
  `haunter` varchar(5) NOT NULL DEFAULT '0-0',
  `gengar` varchar(5) NOT NULL DEFAULT '0-0',
  `onix` varchar(5) NOT NULL DEFAULT '0-0',
  `drowzee` varchar(5) NOT NULL DEFAULT '0-0',
  `hypno` varchar(5) NOT NULL DEFAULT '0-0',
  `krabby` varchar(5) NOT NULL DEFAULT '0-0',
  `kingler` varchar(5) NOT NULL DEFAULT '0-0',
  `voltorb` varchar(5) NOT NULL DEFAULT '0-0',
  `electrode` varchar(5) NOT NULL DEFAULT '0-0',
  `exeggcute` varchar(5) NOT NULL DEFAULT '0-0',
  `exeggutor` varchar(5) NOT NULL DEFAULT '0-0',
  `cubone` varchar(5) NOT NULL DEFAULT '0-0',
  `marowak` varchar(5) NOT NULL DEFAULT '0-0',
  `hitmonlee` varchar(5) NOT NULL DEFAULT '0-0',
  `hitmonchan` varchar(5) NOT NULL DEFAULT '0-0',
  `lickitung` varchar(5) NOT NULL DEFAULT '0-0',
  `koffing` varchar(5) NOT NULL DEFAULT '0-0',
  `weezing` varchar(5) NOT NULL DEFAULT '0-0',
  `rhyhorn` varchar(5) NOT NULL DEFAULT '0-0',
  `rhydon` varchar(5) NOT NULL DEFAULT '0-0',
  `chansey` varchar(5) NOT NULL DEFAULT '0-0',
  `tangela` varchar(5) NOT NULL DEFAULT '0-0',
  `kangaskhan` varchar(5) NOT NULL DEFAULT '0-0',
  `horsea` varchar(5) NOT NULL DEFAULT '0-0',
  `seadra` varchar(5) NOT NULL DEFAULT '0-0',
  `goldeen` varchar(5) NOT NULL DEFAULT '0-0',
  `seaking` varchar(5) NOT NULL DEFAULT '0-0',
  `staryu` varchar(5) NOT NULL DEFAULT '0-0',
  `starmie` varchar(5) NOT NULL DEFAULT '0-0',
  `mr_mime` varchar(5) NOT NULL DEFAULT '0-0',
  `scyther` varchar(5) NOT NULL DEFAULT '0-0',
  `jynx` varchar(5) NOT NULL DEFAULT '0-0',
  `electabuzz` varchar(5) NOT NULL DEFAULT '0-0',
  `magmar` varchar(5) NOT NULL DEFAULT '0-0',
  `pinsir` varchar(5) NOT NULL DEFAULT '0-0',
  `tauros` varchar(5) NOT NULL DEFAULT '0-0',
  `magikarp` varchar(5) NOT NULL DEFAULT '0-0',
  `gyarados` varchar(5) NOT NULL DEFAULT '0-0',
  `lapras` varchar(5) NOT NULL DEFAULT '0-0',
  `ditto` varchar(5) NOT NULL DEFAULT '0-0',
  `eevee` varchar(5) NOT NULL DEFAULT '0-0',
  `vaporeon` varchar(5) NOT NULL DEFAULT '0-0',
  `jolteon` varchar(5) NOT NULL DEFAULT '0-0',
  `flareon` varchar(5) NOT NULL DEFAULT '0-0',
  `porygon` varchar(5) NOT NULL DEFAULT '0-0',
  `omanyte` varchar(5) NOT NULL DEFAULT '0-0',
  `omastar` varchar(5) NOT NULL DEFAULT '0-0',
  `kabuto` varchar(5) NOT NULL DEFAULT '0-0',
  `kabutops` varchar(5) NOT NULL DEFAULT '0-0',
  `aerodactyl` varchar(5) NOT NULL DEFAULT '0-0',
  `snorlax` varchar(5) NOT NULL DEFAULT '0-0',
  `articuno` varchar(5) NOT NULL DEFAULT '0-0',
  `zapdos` varchar(5) NOT NULL DEFAULT '0-0',
  `moltres` varchar(5) NOT NULL DEFAULT '0-0',
  `dratini` varchar(5) NOT NULL DEFAULT '0-0',
  `dragonair` varchar(5) NOT NULL DEFAULT '0-0',
  `dragonite` varchar(5) NOT NULL DEFAULT '0-0',
  `mewtwo` varchar(5) NOT NULL DEFAULT '0-0',
  `mew` varchar(5) NOT NULL DEFAULT '0-0',
  `chikorita` varchar(5) NOT NULL DEFAULT '0-0',
  `bayleef` varchar(5) NOT NULL DEFAULT '0-0',
  `meganium` varchar(5) NOT NULL DEFAULT '0-0',
  `cyndaquil` varchar(5) NOT NULL DEFAULT '0-0',
  `quilava` varchar(5) NOT NULL DEFAULT '0-0',
  `typhlosion` varchar(5) NOT NULL DEFAULT '0-0',
  `totodile` varchar(5) NOT NULL DEFAULT '0-0',
  `croconaw` varchar(5) NOT NULL DEFAULT '0-0',
  `feraligatr` varchar(5) NOT NULL DEFAULT '0-0',
  `sentret` varchar(5) NOT NULL DEFAULT '0-0',
  `furret` varchar(5) NOT NULL DEFAULT '0-0',
  `hoothoot` varchar(5) NOT NULL DEFAULT '0-0',
  `noctowl` varchar(5) NOT NULL DEFAULT '0-0',
  `ledyba` varchar(5) NOT NULL DEFAULT '0-0',
  `ledian` varchar(5) NOT NULL DEFAULT '0-0',
  `spinarak` varchar(5) NOT NULL DEFAULT '0-0',
  `ariados` varchar(5) NOT NULL DEFAULT '0-0',
  `crobat` varchar(5) NOT NULL DEFAULT '0-0',
  `chinchou` varchar(5) NOT NULL DEFAULT '0-0',
  `lanturn` varchar(5) NOT NULL DEFAULT '0-0',
  `pichu` varchar(5) NOT NULL DEFAULT '0-0',
  `cleffa` varchar(5) NOT NULL DEFAULT '0-0',
  `igglybuff` varchar(5) NOT NULL DEFAULT '0-0',
  `togepi` varchar(5) NOT NULL DEFAULT '0-0',
  `togetic` varchar(5) NOT NULL DEFAULT '0-0',
  `natu` varchar(5) NOT NULL DEFAULT '0-0',
  `xatu` varchar(5) NOT NULL DEFAULT '0-0',
  `mareep` varchar(5) NOT NULL DEFAULT '0-0',
  `flaaffy` varchar(5) NOT NULL DEFAULT '0-0',
  `ampharos` varchar(5) NOT NULL DEFAULT '0-0',
  `bellossom` varchar(5) NOT NULL DEFAULT '0-0',
  `marill` varchar(5) NOT NULL DEFAULT '0-0',
  `azumarill` varchar(5) NOT NULL DEFAULT '0-0',
  `sudowoodo` varchar(5) NOT NULL DEFAULT '0-0',
  `politoed` varchar(5) NOT NULL DEFAULT '0-0',
  `hoppip` varchar(5) NOT NULL DEFAULT '0-0',
  `skiploom` varchar(5) NOT NULL DEFAULT '0-0',
  `jumpluff` varchar(5) NOT NULL DEFAULT '0-0',
  `aipom` varchar(5) NOT NULL DEFAULT '0-0',
  `sunkern` varchar(5) NOT NULL DEFAULT '0-0',
  `sunflora` varchar(5) NOT NULL DEFAULT '0-0',
  `yanma` varchar(5) NOT NULL DEFAULT '0-0',
  `wooper` varchar(5) NOT NULL DEFAULT '0-0',
  `quagsire` varchar(5) NOT NULL DEFAULT '0-0',
  `espeon` varchar(5) NOT NULL DEFAULT '0-0',
  `umbreon` varchar(5) NOT NULL DEFAULT '0-0',
  `murkrow` varchar(5) NOT NULL DEFAULT '0-0',
  `slowking` varchar(5) NOT NULL DEFAULT '0-0',
  `misdreavus` varchar(5) NOT NULL DEFAULT '0-0',
  `unown` varchar(5) NOT NULL DEFAULT '0-0',
  `wobbuffet` varchar(5) NOT NULL DEFAULT '0-0',
  `girafarig` varchar(5) NOT NULL DEFAULT '0-0',
  `pineco` varchar(5) NOT NULL DEFAULT '0-0',
  `forretress` varchar(5) NOT NULL DEFAULT '0-0',
  `dunsparce` varchar(5) NOT NULL DEFAULT '0-0',
  `gligar` varchar(5) NOT NULL DEFAULT '0-0',
  `steelix` varchar(5) NOT NULL DEFAULT '0-0',
  `snubbull` varchar(5) NOT NULL DEFAULT '0-0',
  `granbull` varchar(5) NOT NULL DEFAULT '0-0',
  `qwilfish` varchar(5) NOT NULL DEFAULT '0-0',
  `scizor` varchar(5) NOT NULL DEFAULT '0-0',
  `shuckle` varchar(5) NOT NULL DEFAULT '0-0',
  `heracross` varchar(5) NOT NULL DEFAULT '0-0',
  `sneasel` varchar(5) NOT NULL DEFAULT '0-0',
  `teddiursa` varchar(5) NOT NULL DEFAULT '0-0',
  `ursaring` varchar(5) NOT NULL DEFAULT '0-0',
  `slugma` varchar(5) NOT NULL DEFAULT '0-0',
  `magcargo` varchar(5) NOT NULL DEFAULT '0-0',
  `swinub` varchar(5) NOT NULL DEFAULT '0-0',
  `piloswine` varchar(5) NOT NULL DEFAULT '0-0',
  `corsola` varchar(5) NOT NULL DEFAULT '0-0',
  `remoraid` varchar(5) NOT NULL DEFAULT '0-0',
  `octillery` varchar(5) NOT NULL DEFAULT '0-0',
  `delibird` varchar(5) NOT NULL DEFAULT '0-0',
  `mantine` varchar(5) NOT NULL DEFAULT '0-0',
  `skarmory` varchar(5) NOT NULL DEFAULT '0-0',
  `houndour` varchar(5) NOT NULL DEFAULT '0-0',
  `houndoom` varchar(5) NOT NULL DEFAULT '0-0',
  `kingdra` varchar(5) NOT NULL DEFAULT '0-0',
  `phanpy` varchar(5) NOT NULL DEFAULT '0-0',
  `donphan` varchar(5) NOT NULL DEFAULT '0-0',
  `porygon2` varchar(5) NOT NULL DEFAULT '0-0',
  `stantler` varchar(5) NOT NULL DEFAULT '0-0',
  `smeargle` varchar(5) NOT NULL DEFAULT '0-0',
  `tyrogue` varchar(5) NOT NULL DEFAULT '0-0',
  `hitmontop` varchar(5) NOT NULL DEFAULT '0-0',
  `smoochum` varchar(5) NOT NULL DEFAULT '0-0',
  `elekid` varchar(5) NOT NULL DEFAULT '0-0',
  `magby` varchar(5) NOT NULL DEFAULT '0-0',
  `miltank` varchar(5) NOT NULL DEFAULT '0-0',
  `blissey` varchar(5) NOT NULL DEFAULT '0-0',
  `raikou` varchar(5) NOT NULL DEFAULT '0-0',
  `entei` varchar(5) NOT NULL DEFAULT '0-0',
  `suicune` varchar(5) NOT NULL DEFAULT '0-0',
  `larvitar` varchar(5) NOT NULL DEFAULT '0-0',
  `pupitar` varchar(5) NOT NULL DEFAULT '0-0',
  `tyranitar` varchar(5) NOT NULL DEFAULT '0-0',
  `lugia` varchar(5) NOT NULL DEFAULT '0-0',
  `ho_oh` varchar(5) NOT NULL DEFAULT '0-0',
  `celebi` varchar(5) NOT NULL DEFAULT '0-0',
  `treecko` varchar(5) NOT NULL DEFAULT '0-0',
  `grovyle` varchar(5) NOT NULL DEFAULT '0-0',
  `sceptile` varchar(5) NOT NULL DEFAULT '0-0',
  `torchic` varchar(5) NOT NULL DEFAULT '0-0',
  `combusken` varchar(5) NOT NULL DEFAULT '0-0',
  `blaziken` varchar(5) NOT NULL DEFAULT '0-0',
  `mudkip` varchar(5) NOT NULL DEFAULT '0-0',
  `marshtomp` varchar(5) NOT NULL DEFAULT '0-0',
  `swampert` varchar(5) NOT NULL DEFAULT '0-0',
  `poochyena` varchar(5) NOT NULL DEFAULT '0-0',
  `mightyena` varchar(5) NOT NULL DEFAULT '0-0',
  `zigzagoon` varchar(5) NOT NULL DEFAULT '0-0',
  `linoone` varchar(5) NOT NULL DEFAULT '0-0',
  `wurmple` varchar(5) NOT NULL DEFAULT '0-0',
  `silcoon` varchar(5) NOT NULL DEFAULT '0-0',
  `beautifly` varchar(5) NOT NULL DEFAULT '0-0',
  `cascoon` varchar(5) NOT NULL DEFAULT '0-0',
  `dustox` varchar(5) NOT NULL DEFAULT '0-0',
  `lotad` varchar(5) NOT NULL DEFAULT '0-0',
  `lombre` varchar(5) NOT NULL DEFAULT '0-0',
  `ludicolo` varchar(5) NOT NULL DEFAULT '0-0',
  `seedot` varchar(5) NOT NULL DEFAULT '0-0',
  `nuzleaf` varchar(5) NOT NULL DEFAULT '0-0',
  `shiftry` varchar(5) NOT NULL DEFAULT '0-0',
  `taillow` varchar(5) NOT NULL DEFAULT '0-0',
  `swellow` varchar(5) NOT NULL DEFAULT '0-0',
  `wingull` varchar(5) NOT NULL DEFAULT '0-0',
  `pelipper` varchar(5) NOT NULL DEFAULT '0-0',
  `ralts` varchar(5) NOT NULL DEFAULT '0-0',
  `kirlia` varchar(5) NOT NULL DEFAULT '0-0',
  `gardevoir` varchar(5) NOT NULL DEFAULT '0-0',
  `surskit` varchar(5) NOT NULL DEFAULT '0-0',
  `masquerain` varchar(5) NOT NULL DEFAULT '0-0',
  `shroomish` varchar(5) NOT NULL DEFAULT '0-0',
  `breloom` varchar(5) NOT NULL DEFAULT '0-0',
  `slakoth` varchar(5) NOT NULL DEFAULT '0-0',
  `vigoroth` varchar(5) NOT NULL DEFAULT '0-0',
  `slaking` varchar(5) NOT NULL DEFAULT '0-0',
  `nincada` varchar(5) NOT NULL DEFAULT '0-0',
  `ninjask` varchar(5) NOT NULL DEFAULT '0-0',
  `shedinja` varchar(5) NOT NULL DEFAULT '0-0',
  `whismur` varchar(5) NOT NULL DEFAULT '0-0',
  `loudred` varchar(5) NOT NULL DEFAULT '0-0',
  `exploud` varchar(5) NOT NULL DEFAULT '0-0',
  `makuhita` varchar(5) NOT NULL DEFAULT '0-0',
  `hariyama` varchar(5) NOT NULL DEFAULT '0-0',
  `azurill` varchar(5) NOT NULL DEFAULT '0-0',
  `nosepass` varchar(5) NOT NULL DEFAULT '0-0',
  `skitty` varchar(5) NOT NULL DEFAULT '0-0',
  `delcatty` varchar(5) NOT NULL DEFAULT '0-0',
  `sableye` varchar(5) NOT NULL DEFAULT '0-0',
  `mawile` varchar(5) NOT NULL DEFAULT '0-0',
  `aron` varchar(5) NOT NULL DEFAULT '0-0',
  `lairon` varchar(5) NOT NULL DEFAULT '0-0',
  `aggron` varchar(5) NOT NULL DEFAULT '0-0',
  `meditite` varchar(5) NOT NULL DEFAULT '0-0',
  `medicham` varchar(5) NOT NULL DEFAULT '0-0',
  `electrike` varchar(5) NOT NULL DEFAULT '0-0',
  `manectric` varchar(5) NOT NULL DEFAULT '0-0',
  `plusle` varchar(5) NOT NULL DEFAULT '0-0',
  `minun` varchar(5) NOT NULL DEFAULT '0-0',
  `volbeat` varchar(5) NOT NULL DEFAULT '0-0',
  `illumise` varchar(5) NOT NULL DEFAULT '0-0',
  `roselia` varchar(5) NOT NULL DEFAULT '0-0',
  `gulpin` varchar(5) NOT NULL DEFAULT '0-0',
  `swalot` varchar(5) NOT NULL DEFAULT '0-0',
  `carvanha` varchar(5) NOT NULL DEFAULT '0-0',
  `sharpedo` varchar(5) NOT NULL DEFAULT '0-0',
  `wailmer` varchar(5) NOT NULL DEFAULT '0-0',
  `wailord` varchar(5) NOT NULL DEFAULT '0-0',
  `numel` varchar(5) NOT NULL DEFAULT '0-0',
  `camerupt` varchar(5) NOT NULL DEFAULT '0-0',
  `torkoal` varchar(5) NOT NULL DEFAULT '0-0',
  `spoink` varchar(5) NOT NULL DEFAULT '0-0',
  `grumpig` varchar(5) NOT NULL DEFAULT '0-0',
  `spinda` varchar(5) NOT NULL DEFAULT '0-0',
  `trapinch` varchar(5) NOT NULL DEFAULT '0-0',
  `vibrava` varchar(5) NOT NULL DEFAULT '0-0',
  `flygon` varchar(5) NOT NULL DEFAULT '0-0',
  `cacnea` varchar(5) NOT NULL DEFAULT '0-0',
  `cacturne` varchar(5) NOT NULL DEFAULT '0-0',
  `swablu` varchar(5) NOT NULL DEFAULT '0-0',
  `altaria` varchar(5) NOT NULL DEFAULT '0-0',
  `zangoose` varchar(5) NOT NULL DEFAULT '0-0',
  `seviper` varchar(5) NOT NULL DEFAULT '0-0',
  `lunatone` varchar(5) NOT NULL DEFAULT '0-0',
  `solrock` varchar(5) NOT NULL DEFAULT '0-0',
  `barboach` varchar(5) NOT NULL DEFAULT '0-0',
  `whiscash` varchar(5) NOT NULL DEFAULT '0-0',
  `corphish` varchar(5) NOT NULL DEFAULT '0-0',
  `crawdaunt` varchar(5) NOT NULL DEFAULT '0-0',
  `baltoy` varchar(5) NOT NULL DEFAULT '0-0',
  `claydol` varchar(5) NOT NULL DEFAULT '0-0',
  `lileep` varchar(5) NOT NULL DEFAULT '0-0',
  `cradily` varchar(5) NOT NULL DEFAULT '0-0',
  `anorith` varchar(5) NOT NULL DEFAULT '0-0',
  `armaldo` varchar(5) NOT NULL DEFAULT '0-0',
  `feebas` varchar(5) NOT NULL DEFAULT '0-0',
  `milotic` varchar(5) NOT NULL DEFAULT '0-0',
  `castform` varchar(5) NOT NULL DEFAULT '0-0',
  `kecleon` varchar(5) NOT NULL DEFAULT '0-0',
  `shuppet` varchar(5) NOT NULL DEFAULT '0-0',
  `banette` varchar(5) NOT NULL DEFAULT '0-0',
  `duskull` varchar(5) NOT NULL DEFAULT '0-0',
  `dusclops` varchar(5) NOT NULL DEFAULT '0-0',
  `tropius` varchar(5) NOT NULL DEFAULT '0-0',
  `chimecho` varchar(5) NOT NULL DEFAULT '0-0',
  `absol` varchar(5) NOT NULL DEFAULT '0-0',
  `wynaut` varchar(5) NOT NULL DEFAULT '0-0',
  `snorunt` varchar(5) NOT NULL DEFAULT '0-0',
  `glalie` varchar(5) NOT NULL DEFAULT '0-0',
  `spheal` varchar(5) NOT NULL DEFAULT '0-0',
  `sealeo` varchar(5) NOT NULL DEFAULT '0-0',
  `walrein` varchar(5) NOT NULL DEFAULT '0-0',
  `clamperl` varchar(5) NOT NULL DEFAULT '0-0',
  `huntail` varchar(5) NOT NULL DEFAULT '0-0',
  `gorebyss` varchar(5) NOT NULL DEFAULT '0-0',
  `relicanth` varchar(5) NOT NULL DEFAULT '0-0',
  `luvdisc` varchar(5) NOT NULL DEFAULT '0-0',
  `bagon` varchar(5) NOT NULL DEFAULT '0-0',
  `shelgon` varchar(5) NOT NULL DEFAULT '0-0',
  `salamence` varchar(5) NOT NULL DEFAULT '0-0',
  `beldum` varchar(5) NOT NULL DEFAULT '0-0',
  `metang` varchar(5) NOT NULL DEFAULT '0-0',
  `metagross` varchar(5) NOT NULL DEFAULT '0-0',
  `regirock` varchar(5) NOT NULL DEFAULT '0-0',
  `regice` varchar(5) NOT NULL DEFAULT '0-0',
  `registeel` varchar(5) NOT NULL DEFAULT '0-0',
  `latias` varchar(5) NOT NULL DEFAULT '0-0',
  `latios` varchar(5) NOT NULL DEFAULT '0-0',
  `kyogre` varchar(5) NOT NULL DEFAULT '0-0',
  `groudon` varchar(5) NOT NULL DEFAULT '0-0',
  `rayquaza` varchar(5) NOT NULL DEFAULT '0-0',
  `jirachi` varchar(5) NOT NULL DEFAULT '0-0',
  `deoxys` varchar(5) NOT NULL DEFAULT '0-0',
  `turtwig` varchar(5) NOT NULL DEFAULT '0-0',
  `grotle` varchar(5) NOT NULL DEFAULT '0-0',
  `torterra` varchar(5) NOT NULL DEFAULT '0-0',
  `chimchar` varchar(5) NOT NULL DEFAULT '0-0',
  `monferno` varchar(5) NOT NULL DEFAULT '0-0',
  `infernape` varchar(5) NOT NULL DEFAULT '0-0',
  `piplup` varchar(5) NOT NULL DEFAULT '0-0',
  `prinplup` varchar(5) NOT NULL DEFAULT '0-0',
  `empoleon` varchar(5) NOT NULL DEFAULT '0-0',
  `starly` varchar(5) NOT NULL DEFAULT '0-0',
  `staravia` varchar(5) NOT NULL DEFAULT '0-0',
  `staraptor` varchar(5) NOT NULL DEFAULT '0-0',
  `bidoof` varchar(5) NOT NULL DEFAULT '0-0',
  `bibarel` varchar(5) NOT NULL DEFAULT '0-0',
  `kricketot` varchar(5) NOT NULL DEFAULT '0-0',
  `kricketune` varchar(5) NOT NULL DEFAULT '0-0',
  `shinx` varchar(5) NOT NULL DEFAULT '0-0',
  `luxio` varchar(5) NOT NULL DEFAULT '0-0',
  `luxray` varchar(5) NOT NULL DEFAULT '0-0',
  `budew` varchar(5) NOT NULL DEFAULT '0-0',
  `roserade` varchar(5) NOT NULL DEFAULT '0-0',
  `cranidos` varchar(5) NOT NULL DEFAULT '0-0',
  `rampardos` varchar(5) NOT NULL DEFAULT '0-0',
  `shieldon` varchar(5) NOT NULL DEFAULT '0-0',
  `bastiodon` varchar(5) NOT NULL DEFAULT '0-0',
  `burmy` varchar(5) NOT NULL DEFAULT '0-0',
  `wormadam` varchar(5) NOT NULL DEFAULT '0-0',
  `mothim` varchar(5) NOT NULL DEFAULT '0-0',
  `combee` varchar(5) NOT NULL DEFAULT '0-0',
  `vespiquen` varchar(5) NOT NULL DEFAULT '0-0',
  `pachirisu` varchar(5) NOT NULL DEFAULT '0-0',
  `buizel` varchar(5) NOT NULL DEFAULT '0-0',
  `floatzel` varchar(5) NOT NULL DEFAULT '0-0',
  `cherubi` varchar(5) NOT NULL DEFAULT '0-0',
  `cherrim` varchar(5) NOT NULL DEFAULT '0-0',
  `shellos` varchar(5) NOT NULL DEFAULT '0-0',
  `gastrodon` varchar(5) NOT NULL DEFAULT '0-0',
  `ambipom` varchar(5) NOT NULL DEFAULT '0-0',
  `drifloon` varchar(5) NOT NULL DEFAULT '0-0',
  `drifblim` varchar(5) NOT NULL DEFAULT '0-0',
  `buneary` varchar(5) NOT NULL DEFAULT '0-0',
  `lopunny` varchar(5) NOT NULL DEFAULT '0-0',
  `mismagius` varchar(5) NOT NULL DEFAULT '0-0',
  `honchkrow` varchar(5) NOT NULL DEFAULT '0-0',
  `glameow` varchar(5) NOT NULL DEFAULT '0-0',
  `purugly` varchar(5) NOT NULL DEFAULT '0-0',
  `chingling` varchar(5) NOT NULL DEFAULT '0-0',
  `stunky` varchar(5) NOT NULL DEFAULT '0-0',
  `skuntank` varchar(5) NOT NULL DEFAULT '0-0',
  `bronzor` varchar(5) NOT NULL DEFAULT '0-0',
  `bronzong` varchar(5) NOT NULL DEFAULT '0-0',
  `bonsly` varchar(5) NOT NULL DEFAULT '0-0',
  `mime_jr` varchar(5) NOT NULL DEFAULT '0-0',
  `happiny` varchar(5) NOT NULL DEFAULT '0-0',
  `chatot` varchar(5) NOT NULL DEFAULT '0-0',
  `spiritomb` varchar(5) NOT NULL DEFAULT '0-0',
  `gible` varchar(5) NOT NULL DEFAULT '0-0',
  `gabite` varchar(5) NOT NULL DEFAULT '0-0',
  `garchomp` varchar(5) NOT NULL DEFAULT '0-0',
  `munchlax` varchar(5) NOT NULL DEFAULT '0-0',
  `riolu` varchar(5) NOT NULL DEFAULT '0-0',
  `lucario` varchar(5) NOT NULL DEFAULT '0-0',
  `hippopotas` varchar(5) NOT NULL DEFAULT '0-0',
  `hippowdon` varchar(5) NOT NULL DEFAULT '0-0',
  `skorupi` varchar(5) NOT NULL DEFAULT '0-0',
  `drapion` varchar(5) NOT NULL DEFAULT '0-0',
  `croagunk` varchar(5) NOT NULL DEFAULT '0-0',
  `toxicroak` varchar(5) NOT NULL DEFAULT '0-0',
  `carnivine` varchar(5) NOT NULL DEFAULT '0-0',
  `finneon` varchar(5) NOT NULL DEFAULT '0-0',
  `lumineon` varchar(5) NOT NULL DEFAULT '0-0',
  `mantyke` varchar(5) NOT NULL DEFAULT '0-0',
  `snover` varchar(5) NOT NULL DEFAULT '0-0',
  `abomasnow` varchar(5) NOT NULL DEFAULT '0-0',
  `weavile` varchar(5) NOT NULL DEFAULT '0-0',
  `magnezone` varchar(5) NOT NULL DEFAULT '0-0',
  `lickilicky` varchar(5) NOT NULL DEFAULT '0-0',
  `rhyperior` varchar(5) NOT NULL DEFAULT '0-0',
  `tangrowth` varchar(5) NOT NULL DEFAULT '0-0',
  `electivire` varchar(5) NOT NULL DEFAULT '0-0',
  `magmortar` varchar(5) NOT NULL DEFAULT '0-0',
  `togekiss` varchar(5) NOT NULL DEFAULT '0-0',
  `yanmega` varchar(5) NOT NULL DEFAULT '0-0',
  `leafeon` varchar(5) NOT NULL DEFAULT '0-0',
  `glaceon` varchar(5) NOT NULL DEFAULT '0-0',
  `gliscor` varchar(5) NOT NULL DEFAULT '0-0',
  `mamoswine` varchar(5) NOT NULL DEFAULT '0-0',
  `porygon_z` varchar(5) NOT NULL DEFAULT '0-0',
  `gallade` varchar(5) NOT NULL DEFAULT '0-0',
  `probopass` varchar(5) NOT NULL DEFAULT '0-0',
  `dusknoir` varchar(5) NOT NULL DEFAULT '0-0',
  `froslass` varchar(5) NOT NULL DEFAULT '0-0',
  `rotom` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_venusaur` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny venusaur` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_charizard` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny charizard` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_blastoise` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny blastoise` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_butterfree` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny butterfree` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_beedrill` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny beedrill` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_pidgeot` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny pidgeot` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_rattata` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny rattata` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_raticate` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny raticate` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_fearow` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny fearow` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_raichu` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny raichu` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_sandslash` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny sandslash` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_nidoking` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny nidoking` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_ninetales` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny ninetales` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_zubat` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny zubat` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_golbat` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny golbat` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_oddish` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny oddish` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_vileplume` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny vileplume` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_paras` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny paras` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_parasect` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny parasect` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_venonat` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny venonat` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_venomoth` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny venomoth` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_growlithe` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny growlithe` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_arcanine` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny arcanine` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_alakazam` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny alakazam` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_machamp` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny machamp` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_tentacool` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny tentacool` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_tentacruel` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny tentacruel` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_golem` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny golem` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_magneton` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny magneton` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_farfetchd` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny farfetchd` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_dodrio` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny dodrio` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_grimer` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny grimer` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_muk` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny muk` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_gengar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny gengar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_onix` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny onix` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_hypno` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny hypno` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_krabby` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny krabby` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_kingler` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny kingler` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_voltorb` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny voltorb` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_electrode` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny electrode` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_cubone` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny cubone` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_marowak` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny marowak` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_hitmonlee` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny hitmonlee` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_hitmonchan` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny hitmonchan` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_weezing` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny weezing` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_rhydon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny rhydon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_tangela` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny tangela` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_horsea` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny horsea` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_seadra` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny seadra` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_mr_mime` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny mr_mime` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_scyther` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny scyther` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_jynx` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny jynx` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_electabuzz` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny electabuzz` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_magmar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny magmar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_pinsir` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny pinsir` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_tauros` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny tauros` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_magikarp` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny magikarp` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_gyarados` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny gyarados` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_ditto` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny ditto` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_vaporeon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny vaporeon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_jolteon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny jolteon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_flareon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny flareon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_snorlax` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny snorlax` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_dratini` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny dratini` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_dragonair` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny dragonair` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_dragonite` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny dragonite` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_meganium` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny meganium` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_typhlosion` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny typhlosion` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_feraligatr` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny feraligatr` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_ariados` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny ariados` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_crobat` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny crobat` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_lanturn` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny lanturn` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_xatu` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny xatu` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_ampharos` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny ampharos` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_sudowoodo` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny sudowoodo` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_politoed` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny politoed` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_espeon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny espeon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_umbreon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny mbreon` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_steelix` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny steelix` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_magcargo` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny magcargo` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_skarmory` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny skarmory` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_hitmontop` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny hitmontop` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_larvitar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny larvitar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_pupitar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny pupitar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_tyranitar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny tyranitar` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny_lucario` varchar(5) NOT NULL DEFAULT '0-0',
  `shiny lucario` varchar(5) NOT NULL DEFAULT '0-0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `player_pokedex`
--

INSERT INTO `player_pokedex` (`player_id`, `bulbasaur`, `ivysaur`, `venusaur`, `charmander`, `charmeleon`, `charizard`, `squirtle`, `wartortle`, `blastoise`, `caterpie`, `metapod`, `butterfree`, `weedle`, `kakuna`, `beedrill`, `pidgey`, `pidgeotto`, `pidgeot`, `rattata`, `raticate`, `spearow`, `fearow`, `ekans`, `arbok`, `pikachu`, `raichu`, `sandshrew`, `sandslash`, `nidoran_f`, `nidorina`, `nidoqueen`, `nidoran_m`, `nidorino`, `nidoking`, `clefairy`, `clefable`, `vulpix`, `ninetales`, `jigglypuff`, `wigglytuff`, `zubat`, `golbat`, `oddish`, `gloom`, `vileplume`, `paras`, `parasect`, `venonat`, `venomoth`, `diglett`, `dugtrio`, `meowth`, `persian`, `psyduck`, `golduck`, `mankey`, `primeape`, `growlithe`, `arcanine`, `poliwag`, `poliwhirl`, `poliwrath`, `abra`, `kadabra`, `alakazam`, `machop`, `machoke`, `machamp`, `bellsprout`, `weepinbell`, `victreebel`, `tentacool`, `tentacruel`, `geodude`, `graveler`, `golem`, `ponyta`, `rapidash`, `slowpoke`, `slowbro`, `magnemite`, `magneton`, `farfetch_d`, `doduo`, `dodrio`, `seel`, `dewgong`, `grimer`, `muk`, `shellder`, `cloyster`, `gastly`, `haunter`, `gengar`, `onix`, `drowzee`, `hypno`, `krabby`, `kingler`, `voltorb`, `electrode`, `exeggcute`, `exeggutor`, `cubone`, `marowak`, `hitmonlee`, `hitmonchan`, `lickitung`, `koffing`, `weezing`, `rhyhorn`, `rhydon`, `chansey`, `tangela`, `kangaskhan`, `horsea`, `seadra`, `goldeen`, `seaking`, `staryu`, `starmie`, `mr_mime`, `scyther`, `jynx`, `electabuzz`, `magmar`, `pinsir`, `tauros`, `magikarp`, `gyarados`, `lapras`, `ditto`, `eevee`, `vaporeon`, `jolteon`, `flareon`, `porygon`, `omanyte`, `omastar`, `kabuto`, `kabutops`, `aerodactyl`, `snorlax`, `articuno`, `zapdos`, `moltres`, `dratini`, `dragonair`, `dragonite`, `mewtwo`, `mew`, `chikorita`, `bayleef`, `meganium`, `cyndaquil`, `quilava`, `typhlosion`, `totodile`, `croconaw`, `feraligatr`, `sentret`, `furret`, `hoothoot`, `noctowl`, `ledyba`, `ledian`, `spinarak`, `ariados`, `crobat`, `chinchou`, `lanturn`, `pichu`, `cleffa`, `igglybuff`, `togepi`, `togetic`, `natu`, `xatu`, `mareep`, `flaaffy`, `ampharos`, `bellossom`, `marill`, `azumarill`, `sudowoodo`, `politoed`, `hoppip`, `skiploom`, `jumpluff`, `aipom`, `sunkern`, `sunflora`, `yanma`, `wooper`, `quagsire`, `espeon`, `umbreon`, `murkrow`, `slowking`, `misdreavus`, `unown`, `wobbuffet`, `girafarig`, `pineco`, `forretress`, `dunsparce`, `gligar`, `steelix`, `snubbull`, `granbull`, `qwilfish`, `scizor`, `shuckle`, `heracross`, `sneasel`, `teddiursa`, `ursaring`, `slugma`, `magcargo`, `swinub`, `piloswine`, `corsola`, `remoraid`, `octillery`, `delibird`, `mantine`, `skarmory`, `houndour`, `houndoom`, `kingdra`, `phanpy`, `donphan`, `porygon2`, `stantler`, `smeargle`, `tyrogue`, `hitmontop`, `smoochum`, `elekid`, `magby`, `miltank`, `blissey`, `raikou`, `entei`, `suicune`, `larvitar`, `pupitar`, `tyranitar`, `lugia`, `ho_oh`, `celebi`, `treecko`, `grovyle`, `sceptile`, `torchic`, `combusken`, `blaziken`, `mudkip`, `marshtomp`, `swampert`, `poochyena`, `mightyena`, `zigzagoon`, `linoone`, `wurmple`, `silcoon`, `beautifly`, `cascoon`, `dustox`, `lotad`, `lombre`, `ludicolo`, `seedot`, `nuzleaf`, `shiftry`, `taillow`, `swellow`, `wingull`, `pelipper`, `ralts`, `kirlia`, `gardevoir`, `surskit`, `masquerain`, `shroomish`, `breloom`, `slakoth`, `vigoroth`, `slaking`, `nincada`, `ninjask`, `shedinja`, `whismur`, `loudred`, `exploud`, `makuhita`, `hariyama`, `azurill`, `nosepass`, `skitty`, `delcatty`, `sableye`, `mawile`, `aron`, `lairon`, `aggron`, `meditite`, `medicham`, `electrike`, `manectric`, `plusle`, `minun`, `volbeat`, `illumise`, `roselia`, `gulpin`, `swalot`, `carvanha`, `sharpedo`, `wailmer`, `wailord`, `numel`, `camerupt`, `torkoal`, `spoink`, `grumpig`, `spinda`, `trapinch`, `vibrava`, `flygon`, `cacnea`, `cacturne`, `swablu`, `altaria`, `zangoose`, `seviper`, `lunatone`, `solrock`, `barboach`, `whiscash`, `corphish`, `crawdaunt`, `baltoy`, `claydol`, `lileep`, `cradily`, `anorith`, `armaldo`, `feebas`, `milotic`, `castform`, `kecleon`, `shuppet`, `banette`, `duskull`, `dusclops`, `tropius`, `chimecho`, `absol`, `wynaut`, `snorunt`, `glalie`, `spheal`, `sealeo`, `walrein`, `clamperl`, `huntail`, `gorebyss`, `relicanth`, `luvdisc`, `bagon`, `shelgon`, `salamence`, `beldum`, `metang`, `metagross`, `regirock`, `regice`, `registeel`, `latias`, `latios`, `kyogre`, `groudon`, `rayquaza`, `jirachi`, `deoxys`, `turtwig`, `grotle`, `torterra`, `chimchar`, `monferno`, `infernape`, `piplup`, `prinplup`, `empoleon`, `starly`, `staravia`, `staraptor`, `bidoof`, `bibarel`, `kricketot`, `kricketune`, `shinx`, `luxio`, `luxray`, `budew`, `roserade`, `cranidos`, `rampardos`, `shieldon`, `bastiodon`, `burmy`, `wormadam`, `mothim`, `combee`, `vespiquen`, `pachirisu`, `buizel`, `floatzel`, `cherubi`, `cherrim`, `shellos`, `gastrodon`, `ambipom`, `drifloon`, `drifblim`, `buneary`, `lopunny`, `mismagius`, `honchkrow`, `glameow`, `purugly`, `chingling`, `stunky`, `skuntank`, `bronzor`, `bronzong`, `bonsly`, `mime_jr`, `happiny`, `chatot`, `spiritomb`, `gible`, `gabite`, `garchomp`, `munchlax`, `riolu`, `lucario`, `hippopotas`, `hippowdon`, `skorupi`, `drapion`, `croagunk`, `toxicroak`, `carnivine`, `finneon`, `lumineon`, `mantyke`, `snover`, `abomasnow`, `weavile`, `magnezone`, `lickilicky`, `rhyperior`, `tangrowth`, `electivire`, `magmortar`, `togekiss`, `yanmega`, `leafeon`, `glaceon`, `gliscor`, `mamoswine`, `porygon_z`, `gallade`, `probopass`, `dusknoir`, `froslass`, `rotom`, `shiny_venusaur`, `shiny venusaur`, `shiny_charizard`, `shiny charizard`, `shiny_blastoise`, `shiny blastoise`, `shiny_butterfree`, `shiny butterfree`, `shiny_beedrill`, `shiny beedrill`, `shiny_pidgeot`, `shiny pidgeot`, `shiny_rattata`, `shiny rattata`, `shiny_raticate`, `shiny raticate`, `shiny_fearow`, `shiny fearow`, `shiny_raichu`, `shiny raichu`, `shiny_sandslash`, `shiny sandslash`, `shiny_nidoking`, `shiny nidoking`, `shiny_ninetales`, `shiny ninetales`, `shiny_zubat`, `shiny zubat`, `shiny_golbat`, `shiny golbat`, `shiny_oddish`, `shiny oddish`, `shiny_vileplume`, `shiny vileplume`, `shiny_paras`, `shiny paras`, `shiny_parasect`, `shiny parasect`, `shiny_venonat`, `shiny venonat`, `shiny_venomoth`, `shiny venomoth`, `shiny_growlithe`, `shiny growlithe`, `shiny_arcanine`, `shiny arcanine`, `shiny_alakazam`, `shiny alakazam`, `shiny_machamp`, `shiny machamp`, `shiny_tentacool`, `shiny tentacool`, `shiny_tentacruel`, `shiny tentacruel`, `shiny_golem`, `shiny golem`, `shiny_magneton`, `shiny magneton`, `shiny_farfetchd`, `shiny farfetchd`, `shiny_dodrio`, `shiny dodrio`, `shiny_grimer`, `shiny grimer`, `shiny_muk`, `shiny muk`, `shiny_gengar`, `shiny gengar`, `shiny_onix`, `shiny onix`, `shiny_hypno`, `shiny hypno`, `shiny_krabby`, `shiny krabby`, `shiny_kingler`, `shiny kingler`, `shiny_voltorb`, `shiny voltorb`, `shiny_electrode`, `shiny electrode`, `shiny_cubone`, `shiny cubone`, `shiny_marowak`, `shiny marowak`, `shiny_hitmonlee`, `shiny hitmonlee`, `shiny_hitmonchan`, `shiny hitmonchan`, `shiny_weezing`, `shiny weezing`, `shiny_rhydon`, `shiny rhydon`, `shiny_tangela`, `shiny tangela`, `shiny_horsea`, `shiny horsea`, `shiny_seadra`, `shiny seadra`, `shiny_mr_mime`, `shiny mr_mime`, `shiny_scyther`, `shiny scyther`, `shiny_jynx`, `shiny jynx`, `shiny_electabuzz`, `shiny electabuzz`, `shiny_magmar`, `shiny magmar`, `shiny_pinsir`, `shiny pinsir`, `shiny_tauros`, `shiny tauros`, `shiny_magikarp`, `shiny magikarp`, `shiny_gyarados`, `shiny gyarados`, `shiny_ditto`, `shiny ditto`, `shiny_vaporeon`, `shiny vaporeon`, `shiny_jolteon`, `shiny jolteon`, `shiny_flareon`, `shiny flareon`, `shiny_snorlax`, `shiny snorlax`, `shiny_dratini`, `shiny dratini`, `shiny_dragonair`, `shiny dragonair`, `shiny_dragonite`, `shiny dragonite`, `shiny_meganium`, `shiny meganium`, `shiny_typhlosion`, `shiny typhlosion`, `shiny_feraligatr`, `shiny feraligatr`, `shiny_ariados`, `shiny ariados`, `shiny_crobat`, `shiny crobat`, `shiny_lanturn`, `shiny lanturn`, `shiny_xatu`, `shiny xatu`, `shiny_ampharos`, `shiny ampharos`, `shiny_sudowoodo`, `shiny sudowoodo`, `shiny_politoed`, `shiny politoed`, `shiny_espeon`, `shiny espeon`, `shiny_umbreon`, `shiny mbreon`, `shiny_steelix`, `shiny steelix`, `shiny_magcargo`, `shiny magcargo`, `shiny_skarmory`, `shiny skarmory`, `shiny_hitmontop`, `shiny hitmontop`, `shiny_larvitar`, `shiny larvitar`, `shiny_pupitar`, `shiny pupitar`, `shiny_tyranitar`, `shiny tyranitar`, `shiny_lucario`, `shiny lucario`) VALUES
(209, '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0'),
(290, '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0', '0-0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_pokemon`
--

CREATE TABLE `player_pokemon` (
  `player_id` int(11) NOT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL,
  `pokemon_number` smallint(5) UNSIGNED NOT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `player_pokemon`
--

INSERT INTO `player_pokemon` (`player_id`, `slot`, `pokemon_number`, `description`) VALUES
(209, 1, 6, 'Contains a Charizard.'),
(209, 2, 18, 'Contains a Pidgeot.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_recover`
--

CREATE TABLE `player_recover` (
  `id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `code` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_seller`
--

CREATE TABLE `player_seller` (
  `id` int(11) NOT NULL,
  `account_seller` int(11) NOT NULL,
  `char_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_skills`
--

CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `skillid` tinyint(2) NOT NULL DEFAULT 0,
  `value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(1, 0, 10, 0),
(1, 1, 10, 0),
(1, 2, 10, 0),
(1, 3, 10, 0),
(1, 4, 10, 0),
(1, 5, 10, 0),
(1, 6, 10, 0),
(2, 0, 10, 0),
(2, 1, 10, 0),
(2, 2, 10, 0),
(2, 3, 10, 0),
(2, 4, 10, 0),
(2, 5, 10, 0),
(2, 6, 10, 0),
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0),
(7, 0, 10, 0),
(7, 1, 10, 0),
(7, 2, 10, 0),
(7, 3, 10, 0),
(7, 4, 10, 0),
(7, 5, 10, 0),
(7, 6, 10, 0),
(31, 0, 10, 0),
(31, 1, 10, 0),
(31, 2, 10, 0),
(31, 3, 10, 0),
(31, 4, 10, 0),
(31, 5, 10, 0),
(31, 6, 10, 0),
(65, 0, 10, 0),
(65, 1, 10, 0),
(65, 2, 10, 0),
(65, 3, 10, 0),
(65, 4, 10, 0),
(65, 5, 10, 0),
(65, 6, 10, 0),
(86, 0, 10, 0),
(86, 1, 10, 0),
(86, 2, 10, 0),
(86, 3, 10, 0),
(86, 4, 10, 0),
(86, 5, 10, 0),
(86, 6, 10, 0),
(87, 0, 10, 0),
(87, 1, 10, 0),
(87, 2, 10, 0),
(87, 3, 10, 0),
(87, 4, 10, 0),
(87, 5, 10, 0),
(87, 6, 10, 0),
(90, 0, 10, 0),
(90, 1, 10, 0),
(90, 2, 10, 0),
(90, 3, 10, 0),
(90, 4, 10, 0),
(90, 5, 10, 0),
(90, 6, 10, 0),
(209, 0, 10, 0),
(209, 1, 10, 0),
(209, 2, 10, 0),
(209, 3, 10, 0),
(209, 4, 10, 0),
(209, 5, 10, 0),
(209, 6, 10, 0),
(290, 0, 10, 0),
(290, 1, 10, 0),
(290, 2, 10, 0),
(290, 3, 10, 0),
(290, 4, 10, 0),
(290, 5, 10, 0),
(290, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(209, 1008, 'Wartortle: use,'),
(209, 1009, 'Blastoise: use,'),
(209, 7080, '-1'),
(209, 19898, '0'),
(209, 20025, 'all'),
(209, 20026, '1'),
(209, 23589, '1705362119'),
(209, 23592, '1705362120'),
(209, 43534, '1705362124'),
(209, 53940, '0'),
(209, 54178, '1705361118'),
(209, 54843, '33'),
(209, 58769, '1'),
(209, 65117, '1705372914'),
(209, 65118, '0'),
(209, 65119, '0'),
(209, 65121, '0'),
(209, 76001, '1'),
(209, 131006, '33'),
(209, 212124, '0'),
(209, 7222702, '0'),
(290, 7080, '-1'),
(290, 19898, '0'),
(290, 20025, 'all'),
(290, 20026, '1'),
(290, 43534, '1698633606'),
(290, 53940, '0'),
(290, 58769, '1'),
(290, 76001, '1'),
(290, 7222702, '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_viplist`
--

CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pokedex`
--

CREATE TABLE `pokedex` (
  `wild_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `type1` varchar(20) NOT NULL,
  `type2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `pokedex`
--

INSERT INTO `pokedex` (`wild_id`, `name`, `type1`, `type2`) VALUES
(1, 'Bulbasaur', 'Grass', 'Poison'),
(2, 'Ivysaur', 'Grass', 'Poison'),
(3, 'Venusaur', 'Grass', 'Poison'),
(4, 'Charmander', 'Fire', ''),
(5, 'Charmeleon', 'Fire', ''),
(6, 'Charizard', 'Fire', 'Flying'),
(7, 'Squirtle', 'Water', ''),
(8, 'Wartortle', 'Water', ''),
(9, 'Blastoise', 'Water', ''),
(10, 'Caterpie', 'Bug', ''),
(11, 'Metapod', 'Bug', ''),
(12, 'Butterfree', 'Bug', 'Flying'),
(13, 'Weedle', 'Bug', 'Poison'),
(14, 'Kakuna', 'Bug', 'Poison'),
(15, 'Beedrill', 'Bug', 'Poison'),
(16, 'Pidgey', 'Normal', 'Flying'),
(17, 'Pidgeotto', 'Normal', 'Flying'),
(18, 'Pidgeot', 'Normal', 'Flying'),
(19, 'Rattata', 'Normal', ''),
(20, 'Raticate', 'Normal', ''),
(21, 'Spearow', 'Normal', 'Flying'),
(22, 'Fearow', 'Normal', 'Flying'),
(23, 'Ekans', 'Poison', ''),
(24, 'Arbok', 'Poison', ''),
(25, 'Pikachu', 'Electric', ''),
(26, 'Raichu', 'Electric', ''),
(27, 'Sandshrew', 'Ground', ''),
(28, 'Sandslash', 'Ground', ''),
(29, 'Nidoran f', 'Poison', ''),
(30, 'Nidorina', 'Poison', ''),
(31, 'Nidoqueen', 'Poison', 'Ground'),
(32, 'Nidoran m', 'Poison', ''),
(33, 'Nidorino', 'Poison', ''),
(34, 'Nidoking', 'Poison', 'Ground'),
(35, 'Clefairy', 'Fairy', ''),
(36, 'Clefable', 'Fairy', ''),
(37, 'Vulpix', 'Fire', ''),
(38, 'Ninetales', 'Fire', ''),
(39, 'Jigglypuff', 'Normal', 'Fairy'),
(40, 'Wigglytuff', 'Normal', 'Fairy'),
(41, 'Zubat', 'Poison', 'Flying'),
(42, 'Golbat', 'Poison', 'Flying'),
(43, 'Oddish', 'Grass', 'Poison'),
(44, 'Gloom', 'Grass', 'Poison'),
(45, 'Vileplume', 'Grass', 'Poison'),
(46, 'Paras', 'Bug', 'Grass'),
(47, 'Parasect', 'Bug', 'Grass'),
(48, 'Venonat', 'Bug', 'Poison'),
(49, 'Venomoth', 'Bug', 'Poison'),
(50, 'Diglett', 'Ground', ''),
(51, 'Dugtrio', 'Ground', ''),
(52, 'Meowth', 'Normal', ''),
(53, 'Persian', 'Normal', ''),
(54, 'Psyduck', 'Water', ''),
(55, 'Golduck', 'Water', ''),
(56, 'Mankey', 'Fighting', ''),
(57, 'Primeape', 'Fighting', ''),
(58, 'Growlithe', 'Fire', ''),
(59, 'Arcanine', 'Fire', ''),
(60, 'Poliwag', 'Water', ''),
(61, 'Poliwhirl', 'Water', ''),
(62, 'Poliwrath', 'Water', 'Fighting'),
(63, 'Abra', 'Psychic', ''),
(64, 'Kadabra', 'Psychic', ''),
(65, 'Alakazam', 'Psychic', ''),
(66, 'Machop', 'Fighting', ''),
(67, 'Machoke', 'Fighting', ''),
(68, 'Machamp', 'Fighting', ''),
(69, 'Bellsprout', 'Grass', 'Poison'),
(70, 'Weepinbell', 'Grass', 'Poison'),
(71, 'Victreebel', 'Grass', 'Poison'),
(72, 'Tentacool', 'Water', 'Poison'),
(73, 'Tentacruel', 'Water', 'Poison'),
(74, 'Geodude', 'Rock', 'Ground'),
(75, 'Graveler', 'Rock', 'Ground'),
(76, 'Golem', 'Rock', 'Ground'),
(77, 'Ponyta', 'Fire', ''),
(78, 'Rapidash', 'Fire', ''),
(79, 'Slowpoke', 'Water', 'Psychic'),
(80, 'Slowbro', 'Water', 'Psychic'),
(81, 'Magnemite', 'Electric', 'Steel'),
(82, 'Magneton', 'Electric', 'Steel'),
(83, 'Farfetchd', 'Normal', 'Flying'),
(84, 'Doduo', 'Normal', 'Flying'),
(85, 'Dodrio', 'Normal', 'Flying'),
(86, 'Seel', 'Water', ''),
(87, 'Dewgong', 'Water', 'Ice'),
(88, 'Grimer', 'Poison', ''),
(89, 'Muk', 'Poison', ''),
(90, 'Shellder', 'Water', ''),
(91, 'Cloyster', 'Water', 'Ice'),
(92, 'Gastly', 'Ghost', 'Poison'),
(93, 'Haunter', 'Ghost', 'Poison'),
(94, 'Gengar', 'Ghost', 'Poison'),
(95, 'Onix', 'Rock', 'Ground'),
(96, 'Drowzee', 'Psychic', ''),
(97, 'Hypno', 'Psychic', ''),
(98, 'Krabby', 'Water', ''),
(99, 'Kingler', 'Water', ''),
(100, 'Voltorb', 'Electric', ''),
(101, 'Electrode', 'Electric', ''),
(102, 'Exeggcute', 'Grass', 'Psychic'),
(103, 'Exeggutor', 'Grass', 'Psychic'),
(104, 'Cubone', 'Ground', ''),
(105, 'Marowak', 'Ground', ''),
(106, 'Hitmonlee', 'Fighting', ''),
(107, 'Hitmonchan', 'Fighting', ''),
(108, 'Lickitung', 'Normal', ''),
(109, 'Koffing', 'Poison', ''),
(110, 'Weezing', 'Poison', ''),
(111, 'Rhyhorn', 'Ground', 'Rock'),
(112, 'Rhydon', 'Ground', 'Rock'),
(113, 'Chansey', 'Normal', ''),
(114, 'Tangela', 'Grass', ''),
(115, 'Kangaskhan', 'Normal', ''),
(116, 'Horsea', 'Water', ''),
(117, 'Seadra', 'Water', ''),
(118, 'Goldeen', 'Water', ''),
(119, 'Seaking', 'Water', ''),
(120, 'Staryu', 'Water', ''),
(121, 'Starmie', 'Water', 'Psychic'),
(122, 'Mr. Mime', 'Psychic', 'Fairy'),
(123, 'Scyther', 'Bug', 'Flying'),
(124, 'Jynx', 'Ice', 'Psychic'),
(125, 'Electabuzz', 'Electric', ''),
(126, 'Magmar', 'Fire', ''),
(127, 'Pinsir', 'Bug', ''),
(128, 'Tauros', 'Normal', ''),
(129, 'Magikarp', 'Water', ''),
(130, 'Gyarados', 'Water', 'Flying'),
(131, 'Lapras', 'Water', 'Ice'),
(132, 'Ditto', 'Normal', ''),
(133, 'Eevee', 'Normal', ''),
(134, 'Vaporeon', 'Water', ''),
(135, 'Jolteon', 'Electric', ''),
(136, 'Flareon', 'Fire', ''),
(137, 'Porygon', 'Normal', ''),
(138, 'Omanyte', 'Rock', 'Water'),
(139, 'Omastar', 'Rock', 'Water'),
(140, 'Kabuto', 'Rock', 'Water'),
(141, 'Kabutops', 'Rock', 'Water'),
(142, 'Aerodactyl', 'Rock', 'Flying'),
(143, 'Snorlax', 'Normal', ''),
(144, 'Articuno', 'Ice', 'Flying'),
(145, 'Zapdos', 'Electric', 'Flying'),
(146, 'Moltres', 'Fire', 'Flying'),
(147, 'Dratini', 'Dragon', ''),
(148, 'Dragonair', 'Dragon', ''),
(149, 'Dragonite', 'Dragon', 'Flying'),
(150, 'Mewtwo', 'Psychic', ''),
(151, 'Mew', 'Psychic', ''),
(152, 'Chikorita', 'Grass', ''),
(153, 'Bayleef', 'Grass', ''),
(154, 'Meganium', 'Grass', ''),
(155, 'Cyndaquil', 'Fire', ''),
(156, 'Quilava', 'Fire', ''),
(157, 'Typhlosion', 'Fire', ''),
(158, 'Totodile', 'Water', ''),
(159, 'Croconaw', 'Water', ''),
(160, 'Feraligatr', 'Water', ''),
(161, 'Sentret', 'Normal', ''),
(162, 'Furret', 'Normal', ''),
(163, 'Hoothoot', 'Normal', 'Flying'),
(164, 'Noctowl', 'Normal', 'Flying'),
(165, 'Ledyba', 'Bug', 'Flying'),
(166, 'Ledian', 'Bug', 'Flying'),
(167, 'Spinarak', 'Bug', 'Poison'),
(168, 'Ariados', 'Bug', 'Poison'),
(169, 'Crobat', 'Poison', 'Flying'),
(170, 'Chinchou', 'Water', 'Electric'),
(171, 'Lanturn', 'Water', 'Electric'),
(172, 'Pichu', 'Electric', ''),
(173, 'Cleffa', 'Fairy', ''),
(174, 'Igglybuff', 'Normal', 'Fairy'),
(175, 'Togepi', 'Fairy', ''),
(176, 'Togetic', 'Fairy', 'Flying'),
(177, 'Natu', 'Psychic', 'Flying'),
(178, 'Xatu', 'Psychic', 'Flying'),
(179, 'Mareep', 'Electric', ''),
(180, 'Flaaffy', 'Electric', ''),
(181, 'Ampharos', 'Electric', ''),
(182, 'Bellossom', 'Grass', ''),
(183, 'Marill', 'Water', 'Fairy'),
(184, 'Azumarill', 'Water', 'Fairy'),
(185, 'Sudowoodo', 'Rock', ''),
(186, 'Politoed', 'Water', ''),
(187, 'Hoppip', 'Grass', 'Flying'),
(188, 'Skiploom', 'Grass', 'Flying'),
(189, 'Jumpluff', 'Grass', 'Flying'),
(190, 'Aipom', 'Normal', ''),
(191, 'Sunkern', 'Grass', ''),
(192, 'Sunflora', 'Grass', ''),
(193, 'Yanma', 'Bug', 'Flying'),
(194, 'Wooper', 'Water', 'Ground'),
(195, 'Quagsire', 'Water', 'Ground'),
(196, 'Espeon', 'Psychic', ''),
(197, 'Umbreon', 'Dark', ''),
(198, 'Murkrow', 'Dark', 'Flying'),
(199, 'Slowking', 'Water', 'Psychic'),
(200, 'Misdreavus', 'Ghost', ''),
(201, 'Unown', 'Psychic', ''),
(202, 'Wobbuffet', 'Psychic', ''),
(203, 'Girafarig', 'Normal', 'Psychic'),
(204, 'Pineco', 'Bug', ''),
(205, 'Forretress', 'Bug', 'Steel'),
(206, 'Dunsparce', 'Normal', ''),
(207, 'Gligar', 'Ground', 'Flying'),
(208, 'Steelix', 'Steel', 'Ground'),
(209, 'Snubbull', 'Fairy', ''),
(210, 'Granbull', 'Fairy', ''),
(211, 'Qwilfish', 'Water', 'Poison'),
(212, 'Scizor', 'Bug', 'Steel'),
(213, 'Shuckle', 'Bug', 'Rock'),
(214, 'Heracross', 'Bug', 'Fighting'),
(215, 'Sneasel', 'Dark', 'Ice'),
(216, 'Teddiursa', 'Normal', ''),
(217, 'Ursaring', 'Normal', ''),
(218, 'Slugma', 'Fire', ''),
(219, 'Magcargo', 'Fire', 'Rock'),
(220, 'Swinub', 'Ice', 'Ground'),
(221, 'Piloswine', 'Ice', 'Ground'),
(222, 'Corsola', 'Water', 'Rock'),
(223, 'Remoraid', 'Water', ''),
(224, 'Octillery', 'Water', ''),
(225, 'Delibird', 'Ice', 'Flying'),
(226, 'Mantine', 'Water', 'Flying'),
(227, 'Skarmory', 'Steel', 'Flying'),
(228, 'Houndour', 'Dark', 'Fire'),
(229, 'Houndoom', 'Dark', 'Fire'),
(230, 'Kingdra', 'Water', 'Dragon'),
(231, 'Phanpy', 'Ground', ''),
(232, 'Donphan', 'Ground', ''),
(233, 'Porygon2', 'Normal', ''),
(234, 'Stantler', 'Normal', ''),
(235, 'Smeargle', 'Normal', ''),
(236, 'Tyrogue', 'Fighting', ''),
(237, 'Hitmontop', 'Fighting', ''),
(238, 'Smoochum', 'Ice', 'Psychic'),
(239, 'Elekid', 'Electric', ''),
(240, 'Magby', 'Fire', ''),
(241, 'Miltank', 'Normal', ''),
(242, 'Blissey', 'Normal', ''),
(243, 'Raikou', 'Electric', ''),
(244, 'Entei', 'Fire', ''),
(245, 'Suicune', 'Water', ''),
(246, 'Larvitar', 'Rock', 'Ground'),
(247, 'Pupitar', 'Rock', 'Ground'),
(248, 'Tyranitar', 'Rock', 'Dark'),
(249, 'Lugia', 'Psychic', 'Flying'),
(250, 'Ho-oh', 'Fire', 'Flying'),
(251, 'Celebi', 'Psychic', 'Grass'),
(252, 'Treecko', 'Grass', ''),
(253, 'Grovyle', 'Grass', ''),
(254, 'Sceptile', 'Grass', ''),
(255, 'Torchic', 'Fire', ''),
(256, 'Combusken', 'Fire', 'Fighting'),
(257, 'Blaziken', 'Fire', 'Fighting'),
(258, 'Mudkip', 'Water', ''),
(259, 'Marshtomp', 'Water', 'Ground'),
(260, 'Swampert', 'Water', 'Ground'),
(261, 'Poochyena', 'Dark', ''),
(262, 'Mightyena', 'Dark', ''),
(263, 'Zigzagoon', 'Normal', ''),
(264, 'Linoone', 'Normal', ''),
(265, 'Wurmple', 'Bug', ''),
(266, 'Silcoon', 'Bug', ''),
(267, 'Beautifly', 'Bug', 'Flying'),
(268, 'Cascoon', 'Bug', ''),
(269, 'Dustox', 'Bug', 'Poison'),
(270, 'Lotad', 'Water', 'Grass'),
(271, 'Lombre', 'Water', 'Grass'),
(272, 'Ludicolo', 'Water', 'Grass'),
(273, 'Seedot', 'Grass', ''),
(274, 'Nuzleaf', 'Grass', 'Dark'),
(275, 'Shiftry', 'Grass', 'Dark'),
(276, 'Taillow', 'Normal', 'Flying'),
(277, 'Swellow', 'Normal', 'Flying'),
(278, 'Wingull', 'Water', 'Flying'),
(279, 'Pelipper', 'Water', 'Flying'),
(280, 'Ralts', 'Psychic', 'Fairy'),
(281, 'Kirlia', 'Psychic', 'Fairy'),
(282, 'Gardevoir', 'Psychic', 'Fairy'),
(283, 'Surskit', 'Bug', 'Water'),
(284, 'Masquerain', 'Bug', 'Flying'),
(285, 'Shroomish', 'Grass', ''),
(286, 'Breloom', 'Grass', 'Fighting'),
(287, 'Slakoth', 'Normal', ''),
(288, 'Vigoroth', 'Normal', ''),
(289, 'Slaking', 'Normal', ''),
(290, 'Nincada', 'Bug', 'Ground'),
(291, 'Ninjask', 'Bug', 'Flying'),
(292, 'Shedinja', 'Bug', 'Ghost'),
(293, 'Whismur', 'Normal', ''),
(294, 'Loudred', 'Normal', ''),
(295, 'Exploud', 'Normal', ''),
(296, 'Makuhita', 'Fighting', ''),
(297, 'Hariyama', 'Fighting', ''),
(298, 'Azurill', 'Normal', 'Fairy'),
(299, 'Nosepass', 'Rock', ''),
(300, 'Skitty', 'Normal', ''),
(301, 'Delcatty', 'Normal', ''),
(302, 'Sableye', 'Dark', 'Ghost'),
(303, 'Mawile', 'Steel', 'Fairy'),
(304, 'Aron', 'Steel', 'Rock'),
(305, 'Lairon', 'Steel', 'Rock'),
(306, 'Aggron', 'Steel', 'Rock'),
(307, 'Meditite', 'Fighting', 'Psychic'),
(308, 'Medicham', 'Fighting', 'Psychic'),
(309, 'Electrike', 'Electric', ''),
(310, 'Manectric', 'Electric', ''),
(311, 'Plusle', 'Electric', ''),
(312, 'Minun', 'Electric', ''),
(313, 'Volbeat', 'Bug', ''),
(314, 'Illumise', 'Bug', ''),
(315, 'Roselia', 'Grass', 'Poison'),
(316, 'Gulpin', 'Poison', ''),
(317, 'Swalot', 'Poison', ''),
(318, 'Carvanha', 'Water', 'Dark'),
(319, 'Sharpedo', 'Water', 'Dark'),
(320, 'Wailmer', 'Water', ''),
(321, 'Wailord', 'Water', ''),
(322, 'Numel', 'Fire', 'Ground'),
(323, 'Camerupt', 'Fire', 'Ground'),
(324, 'Torkoal', 'Fire', ''),
(325, 'Spoink', 'Psychic', ''),
(326, 'Grumpig', 'Psychic', ''),
(327, 'Spinda', 'Normal', ''),
(328, 'Trapinch', 'Ground', ''),
(329, 'Vibrava', 'Ground', 'Dragon'),
(330, 'Flygon', 'Ground', 'Dragon'),
(331, 'Cacnea', 'Grass', ''),
(332, 'Cacturne', 'Grass', 'Dark'),
(333, 'Swablu', 'Normal', 'Flying'),
(334, 'Altaria', 'Dragon', 'Flying'),
(335, 'Zangoose', 'Normal', ''),
(336, 'Seviper', 'Poison', ''),
(337, 'Lunatone', 'Rock', 'Psychic'),
(338, 'Solrock', 'Rock', 'Psychic'),
(339, 'Barboach', 'Water', 'Ground'),
(340, 'Whiscash', 'Water', 'Ground'),
(341, 'Corphish', 'Water', ''),
(342, 'Crawdaunt', 'Water', 'Dark'),
(343, 'Baltoy', 'Ground', 'Psychic'),
(344, 'Claydol', 'Ground', 'Psychic'),
(345, 'Lileep', 'Rock', 'Grass'),
(346, 'Cradily', 'Rock', 'Grass'),
(347, 'Anorith', 'Rock', 'Bug'),
(348, 'Armaldo', 'Rock', 'Bug'),
(349, 'Feebas', 'Water', ''),
(350, 'Milotic', 'Water', ''),
(351, 'Castform', 'Normal', ''),
(352, 'Kecleon', 'Normal', ''),
(353, 'Shuppet', 'Ghost', ''),
(354, 'Banette', 'Ghost', ''),
(355, 'Duskull', 'Ghost', ''),
(356, 'Dusclops', 'Ghost', ''),
(357, 'Tropius', 'Grass', 'Flying'),
(358, 'Chimecho', 'Psychic', ''),
(359, 'Absol', 'Dark', ''),
(360, 'Wynaut', 'Psychic', ''),
(361, 'Snorunt', 'Ice', ''),
(362, 'Glalie', 'Ice', ''),
(363, 'Spheal', 'Ice', 'Water'),
(364, 'Sealeo', 'Ice', 'Water'),
(365, 'Walrein', 'Ice', 'Water'),
(366, 'Clamperl', 'Water', ''),
(367, 'Huntail', 'Water', ''),
(368, 'Gorebyss', 'Water', ''),
(369, 'Relicanth', 'Water', 'Rock'),
(370, 'Luvdisc', 'Water', ''),
(371, 'Bagon', 'Dragon', ''),
(372, 'Shelgon', 'Dragon', ''),
(373, 'Salamence', 'Dragon', 'Flying'),
(374, 'Beldum', 'Steel', 'Psychic'),
(375, 'Metang', 'Steel', 'Psychic'),
(376, 'Metagross', 'Steel', 'Psychic'),
(377, 'Regirock', 'Rock', ''),
(378, 'Regice', 'Ice', ''),
(379, 'Registeel', 'Steel', ''),
(380, 'Latias', 'Dragon', 'Psychic'),
(381, 'Latios', 'Dragon', 'Psychic'),
(382, 'Kyogre', 'Water', ''),
(383, 'Groudon', 'Ground', ''),
(384, 'Rayquaza', 'Dragon', 'Flying'),
(385, 'Jirachi', 'Steel', 'Psychic'),
(386, 'Deoxys', 'Psychic', ''),
(387, 'Turtwig', 'Grass', ''),
(388, 'Grotle', 'Grass', ''),
(389, 'Torterra', 'Grass', 'Ground'),
(390, 'Chimchar', 'Fire', ''),
(391, 'Monferno', 'Fire', 'Fighting'),
(392, 'Infernape', 'Fire', 'Fighting'),
(393, 'Piplup', 'Water', ''),
(394, 'Prinplup', 'Water', ''),
(395, 'Empoleon', 'Water', 'Steel'),
(396, 'Starly', 'Normal', 'Flying'),
(397, 'Staravia', 'Normal', 'Flying'),
(398, 'Staraptor', 'Normal', 'Flying'),
(399, 'Bidoof', 'Normal', ''),
(400, 'Bibarel', 'Normal', 'Water'),
(401, 'Kricketot', 'Bug', ''),
(402, 'Kricketune', 'Bug', ''),
(403, 'Shinx', 'Electric', ''),
(404, 'Luxio', 'Electric', ''),
(405, 'Luxray', 'Electric', ''),
(406, 'Budew', 'Grass', 'Poison'),
(407, 'Roserade', 'Grass', 'Poison'),
(408, 'Cranidos', 'Rock', ''),
(409, 'Rampardos', 'Rock', ''),
(410, 'Shieldon', 'Rock', 'Steel'),
(411, 'Bastiodon', 'Rock', 'Steel'),
(412, 'Burmy', 'Bug', ''),
(413, 'Wormadam', 'Bug', 'Grass'),
(414, 'Mothim', 'Bug', 'Flying'),
(415, 'Combee', 'Bug', 'Flying'),
(416, 'Vespiquen', 'Bug', 'Flying'),
(417, 'Pachirisu', 'Electric', ''),
(418, 'Buizel', 'Water', ''),
(419, 'Floatzel', 'Water', ''),
(420, 'Cherubi', 'Grass', ''),
(421, 'Cherrim', 'Grass', ''),
(422, 'Shellos', 'Water', ''),
(423, 'Gastrodon', 'Water', 'Ground'),
(424, 'Ambipom', 'Normal', ''),
(425, 'Drifloon', 'Ghost', 'Flying'),
(426, 'Drifblim', 'Ghost', 'Flying'),
(427, 'Buneary', 'Normal', ''),
(428, 'Lopunny', 'Normal', ''),
(429, 'Mismagius', 'Ghost', ''),
(430, 'Honchkrow', 'Dark', 'Flying'),
(431, 'Glameow', 'Normal', ''),
(432, 'Purugly', 'Normal', ''),
(433, 'Chingling', 'Psychic', ''),
(434, 'Stunky', 'Poison', 'Dark'),
(435, 'Skuntank', 'Poison', 'Dark'),
(436, 'Bronzor', 'Steel', 'Psychic'),
(437, 'Bronzong', 'Steel', 'Psychic'),
(438, 'Bonsly', 'Rock', ''),
(439, 'Mime Jr.', 'Psychic', 'Fairy'),
(440, 'Happiny', 'Normal', ''),
(441, 'Chatot', 'Normal', 'Flying'),
(442, 'Spiritomb', 'Ghost', 'Dark'),
(443, 'Gible', 'Dragon', 'Ground'),
(444, 'Gabite', 'Dragon', 'Ground'),
(445, 'Garchomp', 'Dragon', 'Ground'),
(446, 'Munchlax', 'Normal', ''),
(447, 'Riolu', 'Fighting', ''),
(448, 'Lucario', 'Fighting', 'Steel'),
(449, 'Hippopotas', 'Ground', ''),
(450, 'Hippowdon', 'Ground', ''),
(451, 'Skorupi', 'Poison', 'Bug'),
(452, 'Drapion', 'Poison', 'Dark'),
(453, 'Croagunk', 'Poison', 'Fighting'),
(454, 'Toxicroak', 'Poison', 'Fighting'),
(455, 'Carnivine', 'Grass', ''),
(456, 'Finneon', 'Water', ''),
(457, 'Lumineon', 'Water', ''),
(458, 'Mantyke', 'Water', 'Flying'),
(459, 'Snover', 'Grass', 'Ice'),
(460, 'Abomasnow', 'Grass', 'Ice'),
(461, 'Weavile', 'Dark', 'Ice'),
(462, 'Magnezone', 'Electric', 'Steel'),
(463, 'Lickilicky', 'Normal', ''),
(464, 'Rhyperior', 'Ground', 'Rock'),
(465, 'Tangrowth', 'Grass', ''),
(466, 'Electivire', 'Electric', ''),
(467, 'Magmortar', 'Fire', ''),
(468, 'Togekiss', 'Fairy', 'Flying'),
(469, 'Yanmega', 'Bug', 'Flying'),
(470, 'Leafeon', 'Grass', ''),
(471, 'Glaceon', 'Ice', ''),
(472, 'Gliscor', 'Ground', 'Flying'),
(473, 'Mamoswine', 'Ice', 'Ground'),
(474, 'Porygon-Z', 'Normal', ''),
(475, 'Gallade', 'Psychic', 'Fighting'),
(476, 'Probopass', 'Rock', 'Steel'),
(477, 'Dusknoir', 'Ghost', ''),
(478, 'Froslass', 'Ice', 'Ghost'),
(479, 'Rotom', 'Electric', 'Ghost'),
(480, 'Uxie', 'Psychic', ''),
(481, 'Mesprit', 'Psychic', ''),
(482, 'Azelf', 'Psychic', ''),
(483, 'Dialga', 'Steel', 'Dragon'),
(484, 'Palkia', 'Water', 'Dragon'),
(485, 'Heatran', 'Fire', 'Steel'),
(486, 'Regigigas', 'Normal', ''),
(487, 'Giratina', 'Ghost', 'Dragon'),
(488, 'Cresselia', 'Psychic', ''),
(489, 'Phione', 'Water', ''),
(490, 'Manaphy', 'Water', ''),
(491, 'Darkrai', 'Dark', ''),
(492, 'Shaymin', 'Grass', ''),
(493, 'Arceus', 'Normal', ''),
(494, 'Victini', 'Psychic', 'Fire'),
(495, 'Snivy', 'Grass', ''),
(496, 'Servine', 'Grass', ''),
(497, 'Serperior', 'Grass', ''),
(498, 'Tepig', 'Fire', ''),
(499, 'Pignite', 'Fire', 'Fighting'),
(500, 'Emboar', 'Fire', 'Fighting'),
(501, 'Oshawott', 'Water', ''),
(502, 'Dewott', 'Water', ''),
(503, 'Samurott', 'Water', ''),
(504, 'Patrat', 'Normal', ''),
(505, 'Watchog', 'Normal', ''),
(506, 'Lillipup', 'Normal', ''),
(507, 'Herdier', 'Normal', ''),
(508, 'Stoutland', 'Normal', ''),
(509, 'Purrloin', 'Dark', ''),
(510, 'Liepard', 'Dark', ''),
(511, 'Pansage', 'Grass', ''),
(512, 'Simisage', 'Grass', ''),
(513, 'Pansear', 'Fire', ''),
(514, 'Simisear', 'Fire', ''),
(515, 'Panpour', 'Water', ''),
(516, 'Simipour', 'Water', ''),
(517, 'Munna', 'Psychic', ''),
(518, 'Musharna', 'Psychic', ''),
(519, 'Pidove', 'Normal', 'Flying'),
(520, 'Tranquill', 'Normal', 'Flying'),
(521, 'Unfezant', 'Normal', 'Flying'),
(522, 'Blitzle', 'Electric', ''),
(523, 'Zebstrika', 'Electric', ''),
(524, 'Roggenrola', 'Rock', ''),
(525, 'Boldore', 'Rock', ''),
(526, 'Gigalith', 'Rock', ''),
(527, 'Woobat', 'Psychic', 'Flying'),
(528, 'Swoobat', 'Psychic', 'Flying'),
(529, 'Drilbur', 'Ground', ''),
(530, 'Excadrill', 'Ground', 'Steel'),
(531, 'Audino', 'Normal', ''),
(532, 'Timburr', 'Fighting', ''),
(533, 'Gurdurr', 'Fighting', ''),
(534, 'Conkeldurr', 'Fighting', ''),
(535, 'Tympole', 'Water', ''),
(536, 'Palpitoad', 'Water', 'Ground'),
(537, 'Seismitoad', 'Water', 'Ground'),
(538, 'Throh', 'Fighting', ''),
(539, 'Sawk', 'Fighting', ''),
(540, 'Sewaddle', 'Bug', 'Grass'),
(541, 'Swadloon', 'Bug', 'Grass'),
(542, 'Leavanny', 'Bug', 'Grass'),
(543, 'Venipede', 'Bug', 'Poison'),
(544, 'Whirlipede', 'Bug', 'Poison'),
(545, 'Scolipede', 'Bug', 'Poison'),
(546, 'Cottonee', 'Grass', 'Fairy'),
(547, 'Whimsicott', 'Grass', 'Fairy'),
(548, 'Petilil', 'Grass', ''),
(549, 'Lilligant', 'Grass', ''),
(550, 'Basculin', 'Water', ''),
(551, 'Sandile', 'Ground', 'Dark'),
(552, 'Krokorok', 'Ground', 'Dark'),
(553, 'Krookodile', 'Ground', 'Dark'),
(554, 'Darumaka', 'Fire', ''),
(555, 'Darmanitan', 'Fire', ''),
(556, 'Maractus', 'Grass', ''),
(557, 'Dwebble', 'Bug', 'Rock'),
(558, 'Crustle', 'Bug', 'Rock'),
(559, 'Scraggy', 'Dark', 'Fighting'),
(560, 'Scrafty', 'Dark', 'Fighting'),
(561, 'Sigilyph', 'Psychic', 'Flying'),
(562, 'Yamask', 'Ghost', ''),
(563, 'Cofagrigus', 'Ghost', ''),
(564, 'Tirtouga', 'Water', 'Rock'),
(565, 'Carracosta', 'Water', 'Rock'),
(566, 'Archen', 'Rock', 'Flying'),
(567, 'Archeops', 'Rock', 'Flying'),
(568, 'Trubbish', 'Poison', ''),
(569, 'Garbodor', 'Poison', ''),
(570, 'Zorua', 'Dark', ''),
(571, 'Zoroark', 'Dark', ''),
(572, 'Minccino', 'Normal', ''),
(573, 'Cinccino', 'Normal', ''),
(574, 'Gothita', 'Psychic', ''),
(575, 'Gothorita', 'Psychic', ''),
(576, 'Gothitelle', 'Psychic', ''),
(577, 'Solosis', 'Psychic', ''),
(578, 'Duosion', 'Psychic', ''),
(579, 'Reuniclus', 'Psychic', ''),
(580, 'Ducklett', 'Water', 'Flying'),
(581, 'Swanna', 'Water', 'Flying'),
(582, 'Vanillite', 'Ice', ''),
(583, 'Vanillish', 'Ice', ''),
(584, 'Vanilluxe', 'Ice', ''),
(585, 'Deerling', 'Normal', 'Grass'),
(586, 'Sawsbuck', 'Normal', 'Grass'),
(587, 'Emolga', 'Electric', 'Flying'),
(588, 'Karrablast', 'Bug', ''),
(589, 'Escavalier', 'Bug', 'Steel'),
(590, 'Foongus', 'Grass', 'Poison'),
(591, 'Amoonguss', 'Grass', 'Poison'),
(592, 'Frillish', 'Water', 'Ghost'),
(593, 'Jellicent', 'Water', 'Ghost'),
(594, 'Alomomola', 'Water', ''),
(595, 'Joltik', 'Bug', 'Electric'),
(596, 'Galvantula', 'Bug', 'Electric'),
(597, 'Ferroseed', 'Grass', 'Steel'),
(598, 'Ferrothorn', 'Grass', 'Steel'),
(599, 'Klink', 'Steel', ''),
(600, 'Klang', 'Steel', ''),
(601, 'Klinklang', 'Steel', ''),
(602, 'Tynamo', 'Electric', ''),
(603, 'Eelektrik', 'Electric', ''),
(604, 'Eelektross', 'Electric', ''),
(605, 'Elgyem', 'Psychic', ''),
(606, 'Beheeyem', 'Psychic', ''),
(607, 'Litwick', 'Ghost', 'Fire'),
(608, 'Lampent', 'Ghost', 'Fire'),
(609, 'Chandelure', 'Ghost', 'Fire'),
(610, 'Axew', 'Dragon', ''),
(611, 'Fraxure', 'Dragon', ''),
(612, 'Haxorus', 'Dragon', ''),
(613, 'Cubchoo', 'Ice', ''),
(614, 'Beartic', 'Ice', ''),
(615, 'Cryogonal', 'Ice', ''),
(616, 'Shelmet', 'Bug', ''),
(617, 'Accelgor', 'Bug', ''),
(618, 'Stunfisk', 'Ground', 'Electric'),
(619, 'Mienfoo', 'Fighting', ''),
(620, 'Mienshao', 'Fighting', ''),
(621, 'Druddigon', 'Dragon', ''),
(622, 'Golett', 'Ground', 'Ghost'),
(623, 'Golurk', 'Ground', 'Ghost'),
(624, 'Pawniard', 'Dark', 'Steel'),
(625, 'Bisharp', 'Dark', 'Steel'),
(626, 'Bouffalant', 'Normal', ''),
(627, 'Rufflet', 'Normal', 'Flying'),
(628, 'Braviary', 'Normal', 'Flying'),
(629, 'Vullaby', 'Dark', 'Flying'),
(630, 'Mandibuzz', 'Dark', 'Flying'),
(631, 'Heatmor', 'Fire', ''),
(632, 'Durant', 'Bug', 'Steel'),
(633, 'Deino', 'Dark', 'Dragon'),
(634, 'Zweilous', 'Dark', 'Dragon'),
(635, 'Hydreigon', 'Dark', 'Dragon'),
(636, 'Larvesta', 'Bug', 'Fire'),
(637, 'Volcarona', 'Bug', 'Fire'),
(638, 'Cobalion', 'Steel', 'Fighting'),
(639, 'Terrakion', 'Rock', 'Fighting'),
(640, 'Virizion', 'Grass', 'Fighting'),
(641, 'Tornadus', 'Flying', ''),
(642, 'Thundurus', 'Electric', 'Flying'),
(643, 'Reshiram', 'Dragon', 'Fire'),
(644, 'Zekrom', 'Dragon', 'Electric'),
(645, 'Landorus', 'Ground', 'Flying'),
(646, 'Kyurem', 'Dragon', 'Ice'),
(647, 'Keldeo', 'Water', 'Fighting'),
(648, 'Meloetta', 'Normal', 'Psychic'),
(649, 'Genesect', 'Bug', 'Steel'),
(650, 'Chespin', 'Grass', ''),
(651, 'Quilladin', 'Grass', ''),
(652, 'Chesnaught', 'Grass', 'Fighting'),
(653, 'Fennekin', 'Fire', ''),
(654, 'Braixen', 'Fire', ''),
(655, 'Delphox', 'Fire', 'Psychic'),
(656, 'Froakie', 'Water', ''),
(657, 'Frogadier', 'Water', ''),
(658, 'Greninja', 'Water', 'Dark'),
(659, 'Bunnelby', 'Normal', ''),
(660, 'Diggersby', 'Normal', 'Ground'),
(661, 'Fletchling', 'Normal', 'Flying'),
(662, 'Fletchinder', 'Fire', 'Flying'),
(663, 'Talonflame', 'Fire', 'Flying'),
(664, 'Scatterbug', 'Bug', ''),
(665, 'Spewpa', 'Bug', ''),
(666, 'Vivillon', 'Bug', 'Flying'),
(667, 'Litleo', 'Fire', 'Normal'),
(668, 'Pyroar', 'Fire', 'Normal'),
(669, 'Flabebe', 'Fairy', ''),
(670, 'Floette', 'Fairy', ''),
(671, 'Florges', 'Fairy', ''),
(672, 'Skiddo', 'Grass', ''),
(673, 'Gogoat', 'Grass', ''),
(674, 'Pancham', 'Fighting', ''),
(675, 'Pangoro', 'Fighting', 'Dark'),
(676, 'Furfrou', 'Normal', ''),
(677, 'Espurr', 'Psychic', ''),
(678, 'Meowstic', 'Psychic', ''),
(679, 'Honedge', 'Steel', 'Ghost'),
(680, 'Doublade', 'Steel', 'Ghost'),
(681, 'Aegislash', 'Steel', 'Ghost'),
(682, 'Spritzee', 'Fairy', ''),
(683, 'Aromatisse', 'Fairy', ''),
(684, 'Swirlix', 'Fairy', ''),
(685, 'Slurpuff', 'Fairy', ''),
(686, 'Inkay', 'Dark', 'Psychic'),
(687, 'Malamar', 'Dark', 'Psychic'),
(688, 'Binacle', 'Rock', 'Water'),
(689, 'Barbaracle', 'Rock', 'Water'),
(690, 'Skrelp', 'Poison', 'Water'),
(691, 'Dragalge', 'Poison', 'Dragon'),
(692, 'Clauncher', 'Water', ''),
(693, 'Clawitzer', 'Water', ''),
(694, 'Helioptile', 'Electric', 'Normal'),
(695, 'Heliolisk', 'Electric', 'Normal'),
(696, 'Tyrunt', 'Rock', 'Dragon'),
(697, 'Tyrantrum', 'Rock', 'Dragon'),
(698, 'Amaura', 'Rock', 'Ice'),
(699, 'Aurorus', 'Rock', 'Ice'),
(700, 'Sylveon', 'Fairy', ''),
(701, 'Hawlucha', 'Fighting', 'Flying'),
(702, 'Dedenne', 'Electric', 'Fairy'),
(703, 'Carbink', 'Rock', 'Fairy'),
(704, 'Goomy', 'Dragon', ''),
(705, 'Sliggoo', 'Dragon', ''),
(706, 'Goodra', 'Dragon', ''),
(707, 'Klefki', 'Steel', 'Fairy'),
(708, 'Phantump', 'Ghost', 'Grass'),
(709, 'Trevenant', 'Ghost', 'Grass'),
(710, 'Pumpkaboo', 'Ghost', 'Grass'),
(711, 'Gourgeist', 'Ghost', 'Grass'),
(712, 'Bergmite', 'Ice', ''),
(713, 'Avalugg', 'Ice', ''),
(714, 'Noibat', 'Flying', 'Dragon'),
(715, 'Noivern', 'Flying', 'Dragon'),
(716, 'Xerneas', 'Fairy', ''),
(717, 'Yveltal', 'Dark', 'Flying'),
(718, 'Zygarde', 'Dragon', 'Ground'),
(719, 'Diancie', 'Rock', 'Fairy'),
(720, 'Hoopa', 'Psychic', 'Ghost'),
(721, 'Volcanion', 'Fire', 'Water'),
(722, 'Rowlet', 'Grass', 'Flying'),
(723, 'Dartrix', 'Grass', 'Flying'),
(724, 'Decidueye', 'Grass', 'Ghost'),
(725, 'Litten', 'Fire', ''),
(726, 'Torracat', 'Fire', ''),
(727, 'Incineroar', 'Fire', 'Dark'),
(728, 'Popplio', 'Water', ''),
(729, 'Brionne', 'Water', ''),
(730, 'Primarina', 'Water', 'Fairy'),
(731, 'Pikipek', 'Normal', 'Flying'),
(732, 'Trumbeak', 'Normal', 'Flying'),
(733, 'Toucannon', 'Normal', 'Flying'),
(734, 'Yungoos', 'Normal', ''),
(735, 'Gumshoos', 'Normal', ''),
(736, 'Grubbin', 'Bug', ''),
(737, 'Charjabug', 'Bug', 'Electric'),
(738, 'Vikavolt', 'Bug', 'Electric'),
(739, 'Crabrawler', 'Fighting', ''),
(740, 'Crabominable', 'Fighting', 'Ice'),
(741, 'Oricorio Baile', 'Fire', 'Flying'),
(742, 'Cutiefly', 'Bug', 'Fairy'),
(743, 'Ribombee', 'Bug', 'Fairy'),
(744, 'Rockruff', 'Rock', ''),
(745, 'Lycanroc Midday', 'Rock', ''),
(746, 'Wishiwashi', 'Water', ''),
(747, 'Mareanie', 'Poison', 'Water'),
(748, 'Toxapex', 'Poison', 'Water'),
(749, 'Mudbray', 'Ground', ''),
(750, 'Mudsdale', 'Ground', ''),
(751, 'Dewpider', 'Water', 'Bug'),
(752, 'Araquanid', 'Water', 'Bug'),
(753, 'Fomantis', 'Grass', ''),
(754, 'Lurantis', 'Grass', ''),
(755, 'Morelull', 'Grass', 'Fairy'),
(756, 'Shiinotic', 'Grass', 'Fairy'),
(757, 'Salandit', 'Poison', 'Fire'),
(758, 'Salazzle', 'Poison', 'Fire'),
(759, 'Stufful', 'Normal', 'Fighting'),
(760, 'Bewear', 'Normal', 'Fighting'),
(761, 'Bounsweet', 'Grass', ''),
(762, 'Steenee', 'Grass', ''),
(763, 'Tsareena', 'Grass', ''),
(764, 'Comfey', 'Fairy', ''),
(765, 'Oranguru', 'Normal', 'Psychic'),
(766, 'Passimian', 'Fighting', ''),
(767, 'Wimpod', 'Bug', 'Water'),
(768, 'Golisopod', 'Bug', 'Water'),
(769, 'Sandygast', 'Ghost', 'Ground'),
(770, 'Palossand', 'Ghost', 'Ground'),
(771, 'Pyukumuku', 'Water', ''),
(772, 'Type: Null', 'Normal', ''),
(773, 'Silvally', 'Normal', ''),
(774, 'Minior Meteor', 'Rock', 'Flying'),
(775, 'Komala', 'Normal', ''),
(776, 'Turtonator', 'Fire', 'Dragon'),
(777, 'Togedemaru', 'Electric', 'Steel'),
(778, 'Mimikyu', 'Ghost', 'Fairy'),
(779, 'Bruxish', 'Water', 'Psychic'),
(780, 'Drampa', 'Normal', 'Dragon'),
(781, 'Dhelmise', 'Ghost', 'Grass'),
(782, 'Jangmo-o', 'Dragon', ''),
(783, 'Hakamo-o', 'Dragon', 'Fighting'),
(784, 'Kommo-o', 'Dragon', 'Fighting'),
(785, 'Tapu Koko', 'Electric', 'Fairy'),
(786, 'Tapu Lele', 'Psychic', 'Fairy'),
(787, 'Tapu Bulu', 'Grass', 'Fairy'),
(788, 'Tapu Fini', 'Water', 'Fairy'),
(789, 'Cosmog', 'Psychic', ''),
(790, 'Cosmoem', 'Psychic', ''),
(791, 'Solgaleo', 'Psychic', 'Steel'),
(792, 'Lunala', 'Psychic', 'Ghost'),
(793, 'Nihilego', 'Rock', 'Poison'),
(794, 'Buzzwole', 'Bug', 'Fighting'),
(795, 'Pheromosa', 'Bug', 'Fighting'),
(796, 'Xurkitree', 'Electric', ''),
(797, 'Celesteela', 'Steel', 'Flying'),
(798, 'Kartana', 'Grass', 'Steel'),
(799, 'Guzzlord', 'Dark', 'Dragon'),
(800, 'Necrozma', 'Psychic', ''),
(801, 'Magearna', 'Steel', 'Fairy'),
(802, 'Marshadow', 'Fighting', 'Ghost'),
(803, 'Poipole', 'Poison', ''),
(804, 'Naganadel', 'Poison', 'Dragon'),
(805, 'Stakataka', 'Rock', 'Steel'),
(806, 'Blacephalon', 'Fire', 'Ghost'),
(807, 'Zeraora', 'Electric', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pokemon_serial`
--

CREATE TABLE `pokemon_serial` (
  `id` int(11) NOT NULL,
  `pokemon` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `boost` int(11) DEFAULT NULL,
  `heldx` int(11) DEFAULT NULL,
  `heldy` int(11) DEFAULT NULL,
  `nature` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll`
--

CREATE TABLE `poll` (
  `id` int(11) NOT NULL,
  `question` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll_answer`
--

CREATE TABLE `poll_answer` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `poll_votes`
--

CREATE TABLE `poll_votes` (
  `id` int(11) NOT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `poll_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(120) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `raids`
--

CREATE TABLE `raids` (
  `id` int(11) NOT NULL,
  `raid` smallint(6) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '23'),
('encryption', '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_motd`
--

CREATE TABLE `server_motd` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(486, 0, '[PT] Ola companheiro, bem vindo ao mundo do Pokemon MS.\n[EN] Hello fellow, welcome to the world of Pokemon MS.\n[ES] Ola companero, bienvenido al mundo de Pokemon MS.'),
(487, 0, '[BR] Bem-vindo(a) ao Pokemon BS, por favor logue em seu personagem.\n[EN] Welcome to Pokemon BS, please log in your character.\n[ES] Bienvenido(a) a Pokemon BS, por favor, acceda a su carácter.'),
(488, 0, '[BR] Bem-vindo(a) ao Pokemon BS, por favor logue em seu personagem.\n[EN] Welcome to Pokemon BS, please log in your character.\n[ES] Bienvenido(a) a Pokemon BS, por favor, acceda a su carÃ¡cter.'),
(489, 0, '[BR] Bem-vindo(a) ao Pokemon BS, por favor logue em seu personagem.\n[EN] Welcome to Pokemon BS, please log in your character.\n[ES] Bienvenido(a) a Pokemon BS, por favor, acceda a su carácter.'),
(490, 0, '[BR] Bem-vindo(a) ao Pokemon BS, por favor logue em seu personagem.\n[EN] Welcome to Pokemon BS, please log in your character.\n[ES] Bienvenido(a) a Pokemon BS, por favor, acceda a su carÃ¡cter.'),
(491, 0, '[BR] Bem-vindo(a) ao Pokemon BS, por favor logue em seu personagem.\n[EN] Welcome to Pokemon BS, please log in your character.\n[ES] Bienvenido(a) a Pokemon BS, por favor, acceda a su carácter.'),
(492, 0, '[PT] Ola companheiro, bem vindo ao mundo do Pokemon MS.\n[EN] Hello fellow, welcome to the world of Pokemon MS.\n[ES] Ola companero, bienvenido al mundo de Pokemon MS.'),
(493, 0, 'Bem vindo ao BrPokeOT.com'),
(494, 0, 'SejÃ¡ bem vindo ao Pokemon MS, Treinador(a)'),
(495, 0, 'Bem vindo ao BrPokeOT.com'),
(496, 0, 'SejÃ¡ bem vindo ao Pokemon MS, Treinador(a)'),
(497, 0, 'SejÃ¡ bem vindo ao Pokemon Numb, Treinador(a)'),
(498, 0, 'Sejá bem vindo ao Pokemon Numb, Treinador(a)'),
(499, 0, 'SejÃ¡ bem vindo ao Pokemon Numb, Treinador(a)');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_record`
--

CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(1, 0, 1601751872),
(2, 0, 1616345488),
(3, 0, 1617222504),
(4, 0, 1617223130),
(5, 0, 1629684971),
(6, 0, 1629685179),
(7, 0, 1629685566),
(8, 0, 1629687289),
(9, 0, 1629821002),
(10, 0, 1629821184),
(11, 0, 1629821250),
(12, 0, 1629821341),
(13, 0, 1629821551),
(14, 0, 1629821554),
(15, 0, 1629821864),
(16, 0, 1629824561),
(17, 0, 1629832060),
(18, 0, 1629832098),
(19, 0, 1629832221);

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_reports`
--

CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 1,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL DEFAULT 0,
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `shop_convert`
--

CREATE TABLE `shop_convert` (
  `id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `player` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `shop_convert`
--

INSERT INTO `shop_convert` (`id`, `account`, `player`, `count`, `date`) VALUES
(1, 55, 'Liipz', 83, '24-08-2021 14:17:41'),
(2, 3, 'Quinn', 2, '24-08-2021 17:11:49'),
(3, 2, 'Mixlort', 2, '24-08-2021 17:11:51'),
(4, 2, 'Mixlort', 2, '24-08-2021 17:13:01'),
(5, 55, 'Liipz', 75, '24-08-2021 17:15:45'),
(6, 49, 'Mlester', 84, '24-08-2021 18:44:01'),
(7, 49, 'Mlester', 84, '30-08-2021 13:20:11'),
(8, 48, 'Beemo', 75, '30-08-2021 13:43:13'),
(9, 23, 'Ashkashi', 10, '30-08-2021 14:12:01'),
(10, 34, 'Aqua', 38, '30-08-2021 15:10:13'),
(11, 55, 'Marido Gostoso', 157, '30-08-2021 21:40:10'),
(12, 95, 'Lazarento', 10, '31-08-2021 18:37:31'),
(13, 23, 'Ashkashi', 10, '02-09-2021 16:50:48'),
(14, 23, 'Ashkashi', 30, '02-09-2021 16:52:35'),
(15, 80, 'Let Me Show You', 45, '03-09-2021 04:02:25'),
(16, 87, 'Swolloh', 19, '03-09-2021 17:27:55'),
(17, 23, 'Ashkashi', 80, '03-09-2021 17:54:46'),
(18, 3, 'Yreidn', 45, '03-09-2021 20:11:13'),
(19, 87, 'Swolloh', 19, '03-09-2021 20:39:18'),
(20, 102, 'Trg Ownsz', 45, '07-09-2021 01:56:32'),
(21, 102, 'Trg Ownsz', 45, '07-09-2021 07:37:21'),
(22, 145, 'Godofspeed', 30, '07-09-2021 13:50:36'),
(23, 102, 'Trg Ownsz', 45, '07-09-2021 15:10:29'),
(24, 145, 'Godofspeed', 100, '09-09-2021 13:58:39'),
(25, 48, 'Beemo', 75, '09-09-2021 15:38:12'),
(26, 123, 'Malvadao', 15, '11-09-2021 02:30:00'),
(27, 159, 'Engelwood', 15, '11-09-2021 15:01:13'),
(28, 3, 'Yreidn', 15, '12-09-2021 17:26:34'),
(29, 9, 'Aidyn', 10, '12-09-2021 22:00:42'),
(30, 9, 'Aidyn', 50, '12-09-2021 22:05:38'),
(31, 3, 'Yreidn', 50, '12-09-2021 22:22:45'),
(32, 9, 'Aidyn', 25, '12-09-2021 22:27:04'),
(33, 228, 'Inkedz', 52, '13-09-2021 20:38:58'),
(34, 123, 'Malvadao', 5, '13-09-2021 23:51:19'),
(35, 228, 'Inkedz', 60, '14-09-2021 22:03:17'),
(36, 199, 'Allisson', 200, '14-09-2021 23:38:02'),
(37, 3, 'Msquinn', 60, '15-09-2021 23:17:16'),
(38, 274, 'Dkzinms', 60, '16-09-2021 01:41:22'),
(39, 274, 'Dkzinms', 60, '16-09-2021 02:06:38'),
(40, 30, 'Telos Spiritshine', 30, '16-09-2021 17:25:46'),
(41, 30, 'Telos Spiritshine', 15, '16-09-2021 17:42:51'),
(42, 28, 'Akuma', 15, '17-09-2021 06:55:27'),
(43, 28, 'Akuma', 3, '17-09-2021 07:06:13'),
(44, 318, 'Nayeon', 18, '18-09-2021 15:24:20'),
(45, 281, 'Kirah', 75, '19-09-2021 19:03:29'),
(46, 239, 'Hedotensey', 40, '21-09-2021 10:43:00'),
(47, 318, 'Nayeon', 75, '22-09-2021 12:23:09'),
(48, 228, 'Namaste', 142, '22-09-2021 13:49:53'),
(49, 342, 'Namastex', 83, '23-09-2021 17:00:45'),
(50, 342, 'Namastex', 7, '23-09-2021 23:09:53'),
(51, 217, 'Rns', 60, '24-09-2021 13:48:01'),
(52, 318, 'Nayeon', 90, '25-09-2021 14:25:42'),
(53, 318, 'Nayeon', 90, '25-09-2021 17:58:58'),
(54, 360, 'Liwight', 75, '25-09-2021 20:49:34'),
(55, 316, 'Curumin', 75, '28-09-2021 01:57:58'),
(56, 316, 'Curumin', 75, '28-09-2021 02:32:43'),
(57, 360, 'Liwight', 30, '29-09-2021 15:04:56'),
(58, 360, 'Liwight', 15, '29-09-2021 16:37:06'),
(59, 26, 'Trembala Rs', 65, '29-09-2021 18:57:01'),
(60, 26, 'Trembala Rs', 10, '29-09-2021 19:02:10'),
(61, 26, 'NeeeewT', 25, '29-09-2021 19:08:52'),
(62, 281, 'Kirah', 8, '01-10-2021 21:13:27'),
(63, 131, 'Pescador', 75, '10-10-2021 16:56:54'),
(64, 446, 'Gabriel', 30, '30-10-2021 14:34:00'),
(65, 598, 'Stkbral', 18, '31-10-2021 09:33:07'),
(66, 613, 'Sabotage', 413, '31-10-2021 15:14:54'),
(67, 613, 'Sabotage', 82, '31-10-2021 15:30:39'),
(68, 2, 'Lord Of Ice', 10, '31-10-2021 15:39:08'),
(69, 613, 'Sabotage', 263, '31-10-2021 16:36:16'),
(70, 613, 'Sabotage', 165, '03-11-2021 14:56:30'),
(71, 598, 'Arilton', 6, '03-11-2021 17:12:02'),
(72, 650, 'Taroila', 90, '03-11-2021 21:48:02'),
(73, 641, 'Allenrain', 15, '03-11-2021 21:57:05'),
(74, 688, 'Aodh', 15, '05-11-2021 22:01:42'),
(75, 446, 'Gabriel', 30, '07-11-2021 17:34:44'),
(76, 639, 'Riby', 75, '08-11-2021 20:53:10'),
(77, 38, 'Alcapone', 45, '21-11-2021 01:19:20'),
(78, 239, 'Hedotensey', 75, '21-11-2021 18:13:07'),
(79, 765, 'Pierre Do Ms', 8, '22-11-2021 02:07:18'),
(80, 23, 'Note', 8, '22-11-2021 02:08:43'),
(81, 23, 'Note', 15, '22-11-2021 02:28:28'),
(82, 3, 'Yreidn', 250, '23-11-2021 21:30:22'),
(83, 38, 'Alcapone', 8, '23-11-2021 21:30:26'),
(84, 3, 'Yreidn', 100, '23-11-2021 21:33:03'),
(85, 3, 'Yreidn', 130, '23-11-2021 22:09:42'),
(86, 3, 'Yreidn', 200, '24-11-2021 21:02:14'),
(87, 783, 'Darkin', 30, '27-11-2021 19:13:19'),
(88, 2, 'Pepsi', 115, '30-05-2022 00:52:12'),
(89, 44, 'Gabriel', 39, '31-05-2022 08:14:06'),
(90, 27, 'Rocket', 10, '31-05-2022 10:37:39'),
(91, 5, 'Math', 23, '31-05-2022 19:39:44'),
(92, 28, 'Noob', 6, '31-05-2022 19:44:12'),
(93, 37, 'Morin', 22, '31-05-2022 20:25:40'),
(94, 44, 'Gabriel', 300, '31-05-2022 23:16:06'),
(95, 75, 'Giovani', 4, '01-06-2022 18:33:22'),
(96, 29, 'Blizzard', 8, '01-06-2022 19:35:44'),
(97, 3, 'Yreidn', 20, '01-06-2022 19:41:58'),
(98, 9, 'Raladinho', 150, '01-06-2022 21:07:07'),
(99, 3, 'Ashynxa', 20, '01-06-2022 21:25:44'),
(100, 40, 'Lopenog', 75, '01-06-2022 22:31:20'),
(101, 44, 'Gabriel', 20, '01-06-2022 23:16:32'),
(102, 5, 'Math', 26, '02-06-2022 12:57:26'),
(103, 167, 'Boa Hancock', 15, '02-06-2022 17:16:16'),
(104, 9, 'Raladinho', 160, '02-06-2022 19:11:49'),
(105, 44, 'Gabriel', 70, '03-06-2022 07:55:17'),
(106, 14, 'Theokz', 50, '03-06-2022 14:38:01'),
(107, 167, 'Boa Hancock', 22, '03-06-2022 14:42:01'),
(108, 48, 'Mii Xas', 7, '03-06-2022 14:57:04'),
(109, 75, 'Giovani', 40, '03-06-2022 18:41:39'),
(110, 31, 'Noxdocorre', 10, '03-06-2022 20:08:13'),
(111, 28, 'Noob', 11, '03-06-2022 21:17:39'),
(112, 81, 'Sentaki Nageba', 12, '03-06-2022 22:09:28'),
(113, 81, 'Sentaki Nageba', 3, '03-06-2022 22:54:48'),
(114, 167, 'Boa Hancock', 15, '03-06-2022 23:54:36'),
(115, 40, 'Lopenog', 43, '04-06-2022 14:20:36'),
(116, 31, 'Noxdocorre', 5, '04-06-2022 16:48:41'),
(117, 167, 'Boa Hancock', 15, '06-06-2022 14:52:46'),
(118, 231, 'Royal Paladin', 33, '07-06-2022 17:57:50'),
(119, 55, 'Lord', 600, '07-06-2022 18:42:40'),
(120, 217, 'Alizinho', 30, '07-06-2022 23:19:14'),
(121, 186, 'Nightcat', 10, '08-06-2022 16:10:45'),
(122, 348, 'Lady Kssn', 150, '09-06-2022 10:54:21'),
(123, 309, 'Beemo', 45, '09-06-2022 13:35:18'),
(124, 355, 'Banshoutein', 30, '09-06-2022 19:16:37'),
(125, 351, 'Ace', 77, '09-06-2022 21:17:11'),
(126, 267, 'Baconxisd', 150, '10-06-2022 20:48:34'),
(127, 398, 'Maldoso', 80, '10-06-2022 21:20:08'),
(128, 349, 'Exsom', 75, '10-06-2022 22:17:13'),
(129, 167, 'Boa Hancock', 99, '10-06-2022 23:02:28'),
(130, 357, 'Sole', 38, '11-06-2022 03:17:48'),
(131, 3, 'Ashynxa', 50, '11-06-2022 03:31:24'),
(132, 3, 'Ashynxa', 50, '11-06-2022 03:33:09'),
(133, 55, 'Lord', 80, '11-06-2022 20:46:31'),
(134, 351, 'Ace', 105, '11-06-2022 21:38:02'),
(135, 382, 'Jb Jabels', 51, '12-06-2022 04:50:05'),
(136, 437, 'Allenrain', 83, '12-06-2022 13:10:33'),
(137, 382, 'Jb Jabels', 33, '12-06-2022 16:04:27'),
(138, 445, 'Kingjamesbr', 66, '12-06-2022 17:38:04'),
(139, 400, 'Hatiche', 83, '12-06-2022 19:14:12'),
(140, 404, 'Marceloves', 50, '12-06-2022 19:28:28'),
(141, 3, 'Ashynxa', 50, '13-06-2022 00:59:43'),
(142, 44, 'Gabriel', 50, '13-06-2022 10:51:38'),
(143, 209, 'Koiakinho', 60, '13-06-2022 12:48:53'),
(144, 167, 'Boa Hancock', 82, '13-06-2022 13:13:45'),
(145, 357, 'Sole', 41, '14-06-2022 00:24:33'),
(146, 482, 'Cltzaraki', 45, '14-06-2022 10:36:35'),
(147, 567, 'Endeavor', 33, '14-06-2022 19:42:46'),
(148, 398, 'Maldoso', 50, '14-06-2022 20:14:23'),
(149, 424, 'Lost Xazam', 28, '15-06-2022 01:05:07'),
(150, 28, 'Noob', 8, '15-06-2022 12:30:27'),
(151, 424, 'Lost Xazam', 28, '15-06-2022 13:06:03'),
(152, 424, 'Lost Xazam', 28, '15-06-2022 14:44:56'),
(153, 452, 'Good Rashi', 6, '15-06-2022 15:44:19'),
(154, 384, 'Zeca Modestinho', 82, '15-06-2022 19:34:17'),
(155, 424, 'Lost Xazam', 28, '15-06-2022 19:37:02'),
(156, 217, 'Alizinho', 24, '15-06-2022 20:18:27'),
(157, 424, 'Lost Xazam', 28, '15-06-2022 20:39:09'),
(158, 348, 'Lady Lairem', 330, '16-06-2022 12:25:30'),
(159, 12, 'Guedao', 24, '16-06-2022 15:25:27'),
(160, 364, 'Burori', 20, '16-06-2022 16:24:33'),
(161, 693, 'Lunisam', 150, '17-06-2022 21:46:12'),
(162, 424, 'Lost Xazam', 25, '18-06-2022 00:33:37'),
(163, 482, 'Cltzaraki', 30, '18-06-2022 15:55:56'),
(164, 353, 'Mateus Walker ', 40, '18-06-2022 18:20:09'),
(165, 596, 'Toshibakun', 30, '21-06-2022 08:08:05'),
(166, 590, 'Diocklin', 20, '23-06-2022 00:59:37'),
(167, 857, 'Wasenhoo', 20, '23-06-2022 20:53:42'),
(168, 707, 'Satan The One', 10, '24-06-2022 10:57:25'),
(169, 718, 'Kento Destroyer', 5, '24-06-2022 14:19:59'),
(170, 894, 'Nobruste', 16, '25-06-2022 16:35:06'),
(171, 886, 'Psyduck', 13, '25-06-2022 19:48:00'),
(172, 482, 'Cltzaraki', 50, '25-06-2022 20:40:53'),
(173, 742, 'Greed', 65, '25-06-2022 21:10:14'),
(174, 707, 'Satan The One', 5, '25-06-2022 21:46:56'),
(175, 404, 'Marceloves', 39, '25-06-2022 22:38:34'),
(176, 716, 'Soba Mask', 5, '26-06-2022 07:46:28'),
(177, 892, 'Bruxo', 39, '26-06-2022 11:22:36'),
(178, 915, 'Luanmcz', 52, '26-06-2022 12:12:00'),
(179, 482, 'Cltzaraki', 36, '26-06-2022 14:27:56'),
(180, 192, 'Kyoshi', 80, '26-06-2022 17:11:18'),
(181, 44, 'Gabriel', 12, '26-06-2022 20:04:21'),
(182, 918, 'Flint', 15, '27-06-2022 12:09:19'),
(183, 963, 'Brunaogod', 15, '27-06-2022 14:21:41'),
(184, 915, 'Luanmcz', 420, '27-06-2022 14:42:51'),
(185, 979, 'Yamazaki', 25, '27-06-2022 15:18:12'),
(186, 915, 'Luanmcz', 50, '27-06-2022 15:18:52'),
(187, 963, 'Brunaogod', 20, '28-06-2022 19:43:01'),
(188, 1034, 'Dudu Do Gera', 5, '30-06-2022 22:09:05'),
(189, 1019, 'Cyclone', 30, '01-07-2022 00:03:15'),
(190, 596, 'Toshibakun', 70, '01-07-2022 20:55:58'),
(191, 3, 'Ashkyzx', 100, '01-07-2022 21:20:56'),
(192, 1108, 'Kvguene', 20, '03-07-2022 02:18:47'),
(193, 1066, 'Omega Briza', 70, '03-07-2022 21:50:39'),
(194, 1153, 'Mudin Zs', 14, '04-07-2022 15:52:49'),
(195, 1150, 'Gruguinho', 9, '05-07-2022 20:31:47'),
(196, 1180, 'Aleks', 150, '05-07-2022 22:02:34'),
(197, 3, 'Ashkyzx', 100, '05-07-2022 22:39:55'),
(198, 64, 'Clubhouse', 21, '06-07-2022 02:11:20'),
(199, 1227, 'Lord Killzooone ', 10, '06-07-2022 23:09:35'),
(200, 1227, 'Lordkill', 14, '07-07-2022 09:41:47'),
(201, 921, 'Yagoalmeida', 10, '07-07-2022 09:48:56'),
(202, 1182, 'Kazzu', 14, '07-07-2022 10:48:09'),
(203, 1102, 'Feelix', 16, '07-07-2022 14:01:13'),
(204, 999, 'Pedrita', 63, '07-07-2022 18:13:20'),
(205, 1241, 'Halaand', 14, '07-07-2022 19:20:00'),
(206, 479, 'Lawkzm', 112, '07-07-2022 19:26:19'),
(207, 1227, 'Lordkill', 28, '07-07-2022 22:01:18'),
(208, 641, 'Hoffman', 7, '07-07-2022 23:04:36'),
(209, 1181, 'Kalesky', 35, '08-07-2022 13:02:33'),
(210, 1167, 'Kyoto Mtr', 140, '08-07-2022 14:27:49'),
(211, 1160, 'Rafa Lordx', 50, '08-07-2022 18:34:06'),
(212, 1285, 'Noob On', 14, '08-07-2022 20:38:06'),
(213, 985, 'Venancio Te Odeia', 49, '08-07-2022 22:15:13'),
(214, 1270, 'Dark Massacre', 75, '09-07-2022 20:59:05'),
(215, 976, 'Eveemaster', 10, '09-07-2022 21:29:15'),
(216, 866, 'Dangamer', 20, '09-07-2022 21:55:03'),
(217, 404, 'Marceloves', 50, '10-07-2022 00:05:22'),
(218, 1270, 'Dark Massacre', 20, '10-07-2022 10:32:20'),
(219, 1180, 'Aleks', 66, '10-07-2022 11:49:02'),
(220, 846, 'Mestrail', 15, '10-07-2022 14:10:03'),
(221, 1299, 'Zeus Black', 5, '10-07-2022 14:41:14'),
(222, 3, 'Ashkyzx', 100, '10-07-2022 15:14:34'),
(223, 3, 'Ashkyzx', 240, '10-07-2022 16:31:46'),
(224, 398, 'Maldoso', 80, '11-07-2022 13:30:13'),
(225, 1373, 'Sensei', 50, '11-07-2022 18:11:11'),
(226, 1270, 'Dark Massacre', 15, '11-07-2022 20:12:51'),
(227, 1270, 'Dark Massacre', 30, '11-07-2022 20:13:04'),
(228, 1397, 'Lynked', 120, '11-07-2022 23:23:04'),
(229, 413, 'Pasteleiro', 20, '12-07-2022 15:26:24'),
(230, 1299, 'Zeus Black', 2, '12-07-2022 16:43:55'),
(231, 1270, 'Dark Massacre', 20, '13-07-2022 12:13:19'),
(232, 1286, 'Giovaninany', 50, '14-07-2022 14:10:35'),
(233, 1270, 'Dark Massacre', 70, '15-07-2022 19:55:35'),
(234, 1451, 'Bignex', 8, '15-07-2022 22:13:11'),
(235, 1472, 'Tora', 65, '16-07-2022 23:56:53'),
(236, 1160, 'Rafa Lordx', 15, '17-07-2022 01:46:32'),
(237, 1270, 'Dark Massacre', 85, '17-07-2022 14:41:52'),
(238, 866, 'Dangamer', 60, '18-07-2022 13:45:21'),
(239, 1438, 'Mukamuka', 10, '18-07-2022 16:08:33'),
(240, 1472, 'Tora', 408, '19-07-2022 00:18:13'),
(241, 1508, 'Monochromatic', 12, '19-07-2022 15:15:54'),
(242, 1286, 'Giovaninany', 15, '19-07-2022 17:08:35'),
(243, 1510, 'Hiquezika', 22, '19-07-2022 19:28:41'),
(244, 1160, 'Rafa Lordx', 88, '19-07-2022 19:36:49'),
(245, 1227, 'Lordkill', 24, '19-07-2022 21:56:51'),
(246, 3, 'Ashkyzx', 77, '19-07-2022 22:42:52'),
(247, 1111, 'Mrxp', 30, '20-07-2022 14:33:05'),
(248, 1238, 'Shiny', 11, '21-07-2022 16:41:24'),
(249, 641, 'Hoffman', 25, '22-07-2022 22:40:50'),
(250, 1286, 'Giovaninany', 24, '23-07-2022 13:57:24'),
(251, 1227, 'Lordkill', 88, '23-07-2022 15:18:58'),
(252, 1299, 'Zeus Black', 10, '23-07-2022 18:33:43'),
(253, 1150, 'Gruguinho', 1, '24-07-2022 15:22:51'),
(254, 1559, 'Clariel', 10, '26-07-2022 06:53:08'),
(255, 1559, 'Clariel', 2, '28-07-2022 08:30:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `shop_donation_history`
--

CREATE TABLE `shop_donation_history` (
  `id` int(11) NOT NULL,
  `method` varchar(256) NOT NULL,
  `receiver` varchar(256) NOT NULL,
  `buyer` varchar(256) NOT NULL,
  `account` varchar(256) NOT NULL,
  `points` int(11) NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `shop_history`
--

CREATE TABLE `shop_history` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `session` varchar(256) NOT NULL,
  `player` varchar(256) NOT NULL,
  `date` int(10) NOT NULL,
  `quanty` int(10) NOT NULL,
  `processed` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `shop_items`
--

CREATE TABLE `shop_items` (
  `_id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `tooltip` varchar(256) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `category_type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `shop_offer`
--

CREATE TABLE `shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 1,
  `type` int(11) NOT NULL DEFAULT 1,
  `item` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `name` varchar(256) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `threads`
--

CREATE TABLE `threads` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `sticked` tinyint(1) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `closed` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticketsmessage`
--

CREATE TABLE `ticketsmessage` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `anexo` varchar(255) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiles`
--

CREATE TABLE `tiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `house_id` int(10) UNSIGNED NOT NULL,
  `x` int(5) UNSIGNED NOT NULL,
  `y` int(5) UNSIGNED NOT NULL,
  `z` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `tiles`
--

INSERT INTO `tiles` (`id`, `world_id`, `house_id`, `x`, `y`, `z`) VALUES
(0, 0, 877, 803, 1060, 5),
(1, 0, 878, 850, 1033, 6),
(2, 0, 879, 841, 1030, 6),
(3, 0, 879, 841, 1033, 6),
(4, 0, 880, 871, 1040, 6),
(5, 0, 880, 865, 1044, 6),
(6, 0, 881, 779, 1027, 5),
(7, 0, 881, 865, 1049, 6),
(8, 0, 1501, 1007, 990, 6),
(9, 0, 1501, 1010, 987, 6),
(10, 0, 1501, 1008, 987, 7),
(11, 0, 1501, 1010, 984, 7),
(12, 0, 1501, 1013, 987, 7),
(13, 0, 1501, 1013, 990, 6),
(14, 0, 1501, 1010, 993, 7),
(15, 0, 1502, 1002, 985, 7),
(16, 0, 1502, 1000, 993, 7),
(17, 0, 1503, 1029, 982, 7),
(18, 0, 1503, 1036, 983, 7),
(19, 0, 1503, 1025, 984, 7),
(20, 0, 1503, 1029, 987, 7),
(21, 0, 1504, 1029, 977, 7),
(22, 0, 1504, 1033, 977, 6),
(23, 0, 1504, 1036, 977, 7),
(24, 0, 1505, 1029, 972, 7),
(25, 0, 1505, 1033, 972, 6),
(26, 0, 1505, 1036, 972, 7),
(27, 0, 1506, 1030, 1006, 7),
(28, 0, 1506, 1036, 1006, 7),
(29, 0, 1507, 1028, 993, 7),
(30, 0, 1507, 1031, 997, 7),
(31, 0, 1507, 1036, 997, 7),
(32, 0, 1508, 1015, 1002, 7),
(33, 0, 1508, 1020, 1002, 7),
(34, 0, 1508, 1023, 1004, 7),
(35, 0, 1509, 1022, 994, 7),
(36, 0, 1509, 1015, 996, 7),
(37, 0, 1510, 803, 1054, 5),
(38, 0, 1511, 825, 1045, 6),
(39, 0, 1512, 831, 1048, 6),
(40, 0, 1512, 834, 1045, 6),
(41, 0, 1513, 818, 1063, 6),
(42, 0, 1513, 821, 1065, 6),
(43, 0, 1514, 833, 1065, 6),
(44, 0, 1515, 781, 1051, 5),
(45, 0, 1515, 783, 1048, 6),
(46, 0, 1516, 787, 1055, 6),
(47, 0, 1517, 807, 1052, 6),
(48, 0, 1517, 807, 1064, 6),
(49, 0, 1518, 827, 1078, 6),
(50, 0, 1519, 822, 1078, 6),
(51, 0, 1520, 821, 1083, 6),
(52, 0, 1521, 821, 1078, 5),
(53, 0, 1522, 826, 1080, 5),
(54, 0, 1523, 821, 1083, 5),
(55, 0, 1524, 844, 1073, 6),
(56, 0, 1524, 839, 1077, 6),
(57, 0, 1525, 852, 1073, 6),
(58, 0, 1526, 870, 1058, 6),
(59, 0, 1527, 880, 1054, 6),
(60, 0, 1527, 881, 1058, 6),
(61, 0, 1528, 888, 1058, 6),
(62, 0, 1529, 869, 1066, 6),
(63, 0, 1529, 870, 1073, 5),
(64, 0, 1530, 881, 1066, 6),
(65, 0, 1531, 891, 1066, 6),
(66, 0, 1531, 894, 1070, 5),
(67, 0, 1531, 892, 1074, 6),
(68, 0, 1532, 865, 1080, 6),
(69, 0, 1532, 869, 1082, 6),
(70, 0, 1533, 862, 1091, 6),
(71, 0, 1534, 853, 1094, 6),
(72, 0, 1534, 855, 1101, 6),
(73, 0, 1534, 856, 1103, 6),
(74, 0, 1535, 847, 1094, 6),
(75, 0, 1535, 839, 1103, 6),
(76, 0, 1536, 837, 1089, 6),
(77, 0, 1536, 836, 1095, 6),
(78, 0, 1537, 821, 1096, 6),
(79, 0, 1537, 816, 1101, 6),
(80, 0, 1537, 826, 1101, 6),
(81, 0, 1538, 809, 1107, 6),
(82, 0, 1539, 805, 1099, 6),
(83, 0, 1540, 785, 1100, 6),
(84, 0, 1541, 778, 1100, 6),
(85, 0, 1542, 764, 1108, 6),
(86, 0, 1543, 757, 1098, 6),
(87, 0, 1543, 764, 1098, 6),
(88, 0, 1544, 764, 1091, 6),
(89, 0, 1545, 756, 1081, 6),
(90, 0, 1545, 759, 1085, 6),
(91, 0, 1546, 756, 1078, 5),
(92, 0, 1547, 761, 1082, 5),
(93, 0, 1547, 754, 1087, 5),
(94, 0, 1547, 761, 1085, 5),
(95, 0, 1548, 761, 1080, 4),
(96, 0, 1549, 756, 1080, 4),
(97, 0, 1550, 757, 1075, 4),
(98, 0, 1551, 772, 1073, 6),
(99, 0, 1552, 777, 1079, 6),
(100, 0, 1552, 772, 1080, 6),
(101, 0, 1553, 772, 1088, 6),
(102, 0, 1554, 785, 1086, 6),
(103, 0, 1554, 786, 1092, 6),
(104, 0, 1555, 858, 1033, 6),
(105, 0, 1556, 822, 1027, 6),
(106, 0, 1557, 830, 1027, 6),
(107, 0, 1558, 831, 1021, 6),
(108, 0, 1559, 819, 1021, 6),
(109, 0, 1560, 820, 1021, 5),
(110, 0, 1561, 831, 1021, 5),
(111, 0, 1562, 831, 1027, 5),
(112, 0, 1563, 820, 1027, 5),
(113, 0, 1564, 815, 1008, 6),
(114, 0, 1565, 831, 1004, 6),
(115, 0, 1566, 813, 998, 6),
(116, 0, 1566, 828, 999, 6),
(117, 0, 1567, 805, 998, 6),
(118, 0, 1568, 796, 998, 6),
(119, 0, 1569, 791, 988, 6),
(120, 0, 1570, 783, 997, 6),
(121, 0, 1571, 772, 994, 6),
(122, 0, 1572, 764, 994, 6),
(123, 0, 1573, 757, 994, 6),
(124, 0, 1574, 752, 1009, 6),
(125, 0, 1575, 743, 1018, 6),
(126, 0, 1576, 729, 1018, 6),
(127, 0, 1577, 728, 1026, 6),
(128, 0, 1578, 745, 1026, 6),
(129, 0, 1579, 749, 1046, 6),
(130, 0, 1580, 764, 1053, 6),
(131, 0, 1581, 764, 1060, 6),
(132, 0, 1582, 764, 1068, 6),
(133, 0, 1583, 751, 1076, 6),
(134, 0, 1583, 759, 1079, 6),
(135, 0, 1584, 770, 1006, 6),
(136, 0, 1584, 773, 1011, 6),
(137, 0, 1585, 779, 1006, 6),
(138, 0, 1586, 789, 1016, 6),
(139, 0, 1587, 803, 1006, 6),
(140, 0, 1588, 807, 1022, 6),
(141, 0, 1589, 779, 1022, 6),
(142, 0, 1590, 755, 1021, 6),
(143, 0, 1591, 764, 1027, 6),
(144, 0, 1591, 755, 1030, 6),
(145, 0, 1591, 764, 1032, 6),
(146, 0, 1592, 779, 1031, 6),
(147, 0, 1593, 760, 1041, 6),
(148, 0, 1594, 772, 1041, 6),
(149, 0, 1595, 781, 1041, 6),
(150, 0, 1596, 782, 1028, 5),
(151, 0, 1597, 784, 1022, 5),
(152, 0, 1598, 775, 1020, 4),
(153, 0, 1599, 777, 1028, 4),
(154, 0, 1600, 769, 990, 4),
(155, 0, 1601, 759, 990, 4),
(156, 0, 1602, 767, 996, 5),
(157, 0, 1602, 771, 990, 5),
(158, 0, 1602, 770, 993, 5),
(159, 0, 1603, 757, 990, 5),
(160, 0, 1603, 757, 996, 5),
(161, 0, 1603, 762, 996, 5),
(162, 0, 1604, 819, 998, 5),
(163, 0, 1605, 826, 998, 5),
(164, 0, 1606, 829, 1002, 5),
(165, 0, 1607, 824, 1002, 5),
(166, 0, 1608, 827, 996, 4),
(167, 0, 1609, 824, 1002, 4),
(168, 0, 1610, 830, 1002, 4),
(169, 0, 1611, 874, 1050, 5),
(170, 0, 1611, 875, 1055, 5),
(171, 0, 1612, 874, 1052, 4),
(172, 0, 1613, 868, 1053, 4),
(173, 0, 1614, 854, 1036, 5),
(174, 0, 1615, 853, 1029, 5),
(175, 0, 1616, 846, 1029, 5),
(176, 0, 1617, 844, 1034, 5),
(177, 0, 1618, 840, 1093, 5),
(178, 0, 1618, 841, 1096, 5),
(179, 0, 1619, 841, 1101, 5),
(180, 0, 1620, 846, 1096, 5),
(181, 0, 1621, 862, 1099, 5),
(182, 0, 1621, 850, 1102, 5),
(183, 0, 1622, 853, 1100, 4),
(184, 0, 1623, 851, 1096, 4),
(185, 0, 1624, 846, 1096, 4),
(186, 0, 1625, 842, 1100, 4),
(187, 0, 1626, 1044, 971, 7),
(188, 0, 1626, 1047, 969, 7),
(189, 0, 1626, 1053, 969, 5),
(190, 0, 1626, 1053, 969, 7),
(191, 0, 1626, 1044, 974, 7),
(192, 0, 1626, 1051, 972, 7),
(193, 0, 1626, 1053, 974, 5),
(194, 0, 1626, 1053, 973, 6),
(195, 0, 1626, 1044, 976, 7),
(196, 0, 1626, 1049, 976, 6),
(197, 0, 1626, 1051, 977, 7),
(198, 0, 1627, 1044, 981, 7),
(199, 0, 1627, 1044, 983, 7),
(200, 0, 1627, 1049, 981, 7),
(201, 0, 1627, 1044, 985, 7),
(202, 0, 1627, 1049, 984, 6),
(203, 0, 1627, 1049, 986, 7),
(204, 0, 1628, 1056, 979, 6),
(205, 0, 1628, 1064, 979, 6),
(206, 0, 1628, 1059, 982, 5),
(207, 0, 1628, 1060, 983, 6),
(208, 0, 1628, 1060, 982, 7),
(209, 0, 1628, 1063, 980, 7),
(210, 0, 1628, 1064, 982, 5),
(211, 0, 1628, 1064, 980, 6),
(212, 0, 1628, 1067, 983, 6),
(213, 0, 1628, 1071, 981, 7),
(214, 0, 1628, 1071, 983, 7),
(215, 0, 1628, 1056, 985, 6),
(216, 0, 1628, 1063, 985, 7),
(217, 0, 1628, 1064, 985, 6),
(218, 0, 1628, 1067, 985, 6),
(219, 0, 1628, 1071, 985, 7),
(220, 0, 1629, 1061, 971, 5),
(221, 0, 1629, 1060, 969, 7),
(222, 0, 1629, 1064, 971, 7),
(223, 0, 1629, 1068, 969, 7),
(224, 0, 1629, 1071, 971, 7),
(225, 0, 1629, 1062, 973, 6),
(226, 0, 1629, 1060, 973, 7),
(227, 0, 1629, 1065, 973, 5),
(228, 0, 1629, 1064, 975, 7),
(229, 0, 1629, 1068, 973, 6),
(230, 0, 1629, 1071, 973, 7),
(231, 0, 1629, 1071, 975, 7),
(232, 0, 1630, 1061, 991, 6),
(233, 0, 1630, 1067, 991, 6),
(234, 0, 1630, 1065, 991, 7),
(235, 0, 1630, 1061, 995, 5),
(236, 0, 1630, 1060, 993, 7),
(237, 0, 1630, 1064, 992, 5),
(238, 0, 1630, 1071, 992, 7),
(239, 0, 1630, 1071, 993, 7),
(240, 0, 1630, 1071, 995, 7),
(241, 0, 1630, 1061, 996, 6),
(242, 0, 1630, 1062, 996, 7),
(243, 0, 1630, 1067, 996, 6),
(244, 0, 1631, 1061, 1002, 5),
(245, 0, 1631, 1061, 1002, 6),
(246, 0, 1631, 1067, 1003, 6),
(247, 0, 1631, 1064, 1001, 7),
(248, 0, 1631, 1071, 1001, 7),
(249, 0, 1631, 1071, 1003, 7),
(250, 0, 1631, 1060, 1006, 7),
(251, 0, 1631, 1064, 1004, 7),
(252, 0, 1631, 1068, 1006, 7),
(253, 0, 1631, 1071, 1004, 7),
(254, 0, 1632, 1044, 1001, 7),
(255, 0, 1632, 1044, 1002, 7),
(256, 0, 1632, 1044, 1003, 7),
(257, 0, 1632, 1049, 1002, 6),
(258, 0, 1632, 1047, 1006, 7),
(259, 0, 1632, 1050, 1004, 7),
(260, 0, 1632, 1054, 1006, 7),
(261, 0, 1633, 1044, 991, 7),
(262, 0, 1633, 1049, 990, 5),
(263, 0, 1633, 1049, 991, 6),
(264, 0, 1633, 1051, 991, 7),
(265, 0, 1633, 1044, 993, 7),
(266, 0, 1633, 1044, 995, 7),
(267, 0, 1633, 1049, 995, 5),
(268, 0, 1633, 1049, 994, 6),
(269, 0, 1633, 1049, 995, 6),
(270, 0, 1633, 1053, 993, 5),
(271, 0, 1633, 1053, 992, 6),
(272, 0, 1633, 1049, 996, 6),
(273, 0, 1633, 1051, 996, 7),
(274, 0, 1634, 1083, 970, 7),
(275, 0, 1634, 1079, 972, 7),
(276, 0, 1634, 1079, 974, 7),
(277, 0, 1634, 1079, 976, 7),
(278, 0, 1634, 1085, 976, 7),
(279, 0, 1634, 1089, 970, 7),
(280, 0, 1635, 1079, 982, 7),
(281, 0, 1635, 1079, 983, 7),
(282, 0, 1635, 1084, 981, 6),
(283, 0, 1635, 1087, 981, 7),
(284, 0, 1635, 1079, 984, 7),
(285, 0, 1635, 1084, 986, 6),
(286, 0, 1635, 1087, 985, 7),
(287, 0, 1635, 1088, 983, 6),
(288, 0, 1635, 1091, 983, 7),
(289, 0, 1636, 1079, 990, 7),
(290, 0, 1636, 1087, 991, 7),
(291, 0, 1636, 1079, 992, 7),
(292, 0, 1636, 1079, 994, 7),
(293, 0, 1637, 1079, 998, 7),
(294, 0, 1637, 1085, 999, 6),
(295, 0, 1637, 1087, 999, 7),
(296, 0, 1637, 1079, 1000, 7),
(297, 0, 1637, 1079, 1002, 7),
(298, 0, 1637, 1087, 1002, 6),
(299, 0, 1637, 1087, 1004, 7),
(300, 0, 1637, 1091, 1002, 7),
(301, 0, 1637, 1092, 1002, 6),
(302, 0, 1638, 1082, 1010, 7),
(303, 0, 1638, 1082, 1012, 7),
(304, 0, 1638, 1082, 1014, 7),
(305, 0, 1638, 1087, 1014, 7),
(306, 0, 1638, 1094, 1011, 7),
(307, 0, 1638, 1091, 1012, 7),
(308, 0, 1638, 1094, 1014, 7),
(309, 0, 1639, 1082, 1019, 7),
(310, 0, 1639, 1082, 1021, 7),
(311, 0, 1639, 1086, 1023, 7),
(312, 0, 1639, 1094, 1018, 7),
(313, 0, 1639, 1088, 1020, 7),
(314, 0, 1639, 1090, 1023, 7),
(315, 0, 1639, 1091, 1023, 7),
(316, 0, 1639, 1092, 1023, 7),
(317, 0, 1639, 1094, 1021, 7),
(318, 0, 1640, 1099, 1011, 7),
(319, 0, 1640, 1096, 1013, 6),
(320, 0, 1640, 1096, 1014, 7),
(321, 0, 1640, 1096, 1017, 6),
(322, 0, 1640, 1099, 1019, 6),
(323, 0, 1640, 1096, 1019, 7),
(324, 0, 1640, 1099, 1016, 7),
(325, 0, 1640, 1096, 1021, 7),
(326, 0, 1640, 1098, 1023, 7),
(327, 0, 1640, 1099, 1023, 7),
(328, 0, 1640, 1100, 1023, 7),
(329, 0, 1641, 1107, 1011, 7),
(330, 0, 1641, 1109, 1013, 6),
(331, 0, 1641, 1106, 1019, 6),
(332, 0, 1641, 1106, 1016, 7),
(333, 0, 1641, 1109, 1017, 6),
(334, 0, 1641, 1105, 1023, 7),
(335, 0, 1641, 1106, 1023, 7),
(336, 0, 1641, 1107, 1023, 7),
(337, 0, 1642, 1101, 1031, 7),
(338, 0, 1642, 1103, 1031, 7),
(339, 0, 1642, 1102, 1035, 6),
(340, 0, 1642, 1103, 1038, 7),
(341, 0, 1642, 1105, 1031, 7),
(342, 0, 1642, 1104, 1035, 6),
(343, 0, 1642, 1106, 1035, 6),
(344, 0, 1642, 1107, 1035, 7),
(345, 0, 1642, 1102, 1041, 6),
(346, 0, 1642, 1101, 1041, 7),
(347, 0, 1642, 1106, 1041, 6),
(348, 0, 1642, 1106, 1041, 7),
(349, 0, 1643, 1091, 1031, 7),
(350, 0, 1643, 1093, 1031, 7),
(351, 0, 1643, 1095, 1031, 7),
(352, 0, 1643, 1091, 1035, 6),
(353, 0, 1643, 1093, 1035, 6),
(354, 0, 1643, 1095, 1035, 6),
(355, 0, 1643, 1092, 1039, 7),
(356, 0, 1643, 1095, 1036, 7),
(357, 0, 1643, 1091, 1041, 6),
(358, 0, 1643, 1090, 1041, 7),
(359, 0, 1643, 1095, 1041, 6),
(360, 0, 1643, 1095, 1041, 7),
(361, 0, 1644, 1091, 1044, 7),
(362, 0, 1644, 1093, 1046, 7),
(363, 0, 1644, 1095, 1044, 7),
(364, 0, 1644, 1091, 1048, 7),
(365, 0, 1644, 1096, 1048, 7),
(366, 0, 1644, 1091, 1053, 7),
(367, 0, 1644, 1093, 1053, 7),
(368, 0, 1644, 1095, 1053, 7),
(369, 0, 1645, 1101, 1044, 7),
(370, 0, 1645, 1103, 1046, 7),
(371, 0, 1645, 1101, 1048, 7),
(372, 0, 1645, 1103, 1053, 7),
(373, 0, 1645, 1106, 1044, 7),
(374, 0, 1645, 1106, 1048, 7),
(375, 0, 1645, 1104, 1053, 7),
(376, 0, 1645, 1105, 1053, 7),
(377, 0, 1646, 1103, 1061, 7),
(378, 0, 1646, 1099, 1067, 6),
(379, 0, 1646, 1099, 1071, 6),
(380, 0, 1646, 1105, 1061, 7),
(381, 0, 1646, 1107, 1061, 7),
(382, 0, 1646, 1105, 1065, 6),
(383, 0, 1646, 1107, 1065, 6),
(384, 0, 1646, 1109, 1065, 6),
(385, 0, 1646, 1108, 1066, 7),
(386, 0, 1646, 1105, 1071, 6),
(387, 0, 1646, 1111, 1068, 6),
(388, 0, 1646, 1111, 1071, 6),
(389, 0, 1646, 1103, 1074, 6),
(390, 0, 1646, 1104, 1072, 7),
(391, 0, 1646, 1109, 1074, 6),
(392, 0, 1647, 1089, 1063, 7),
(393, 0, 1647, 1092, 1061, 7),
(394, 0, 1647, 1094, 1061, 7),
(395, 0, 1647, 1096, 1061, 7),
(396, 0, 1647, 1089, 1065, 7),
(397, 0, 1647, 1092, 1067, 7),
(398, 0, 1647, 1097, 1067, 7),
(399, 0, 1647, 1089, 1070, 7),
(400, 0, 1647, 1094, 1071, 7),
(401, 0, 1647, 1089, 1072, 7),
(402, 0, 1648, 1077, 1066, 6),
(403, 0, 1648, 1077, 1066, 7),
(404, 0, 1648, 1080, 1064, 6),
(405, 0, 1648, 1082, 1064, 6),
(406, 0, 1648, 1082, 1064, 7),
(407, 0, 1648, 1084, 1064, 6),
(408, 0, 1648, 1085, 1066, 6),
(409, 0, 1648, 1077, 1069, 6),
(410, 0, 1648, 1082, 1069, 6),
(411, 0, 1648, 1087, 1068, 6),
(412, 0, 1648, 1087, 1070, 6),
(413, 0, 1649, 1077, 1077, 7),
(414, 0, 1649, 1085, 1077, 7),
(415, 0, 1649, 1082, 1080, 7),
(416, 0, 1650, 1077, 1088, 7),
(417, 0, 1650, 1081, 1090, 7),
(418, 0, 1650, 1085, 1088, 7),
(419, 0, 1651, 1077, 1103, 7),
(420, 0, 1651, 1072, 1105, 7),
(421, 0, 1651, 1080, 1105, 7),
(422, 0, 1651, 1077, 1108, 7),
(423, 0, 1652, 1072, 1097, 7),
(424, 0, 1653, 1064, 1061, 7),
(425, 0, 1653, 1063, 1065, 6),
(426, 0, 1653, 1065, 1065, 6),
(427, 0, 1653, 1067, 1065, 6),
(428, 0, 1653, 1066, 1066, 7),
(429, 0, 1653, 1069, 1064, 7),
(430, 0, 1653, 1064, 1068, 7),
(431, 0, 1653, 1069, 1068, 6),
(432, 0, 1653, 1069, 1068, 7),
(433, 0, 1654, 1047, 1063, 7),
(434, 0, 1654, 1053, 1061, 7),
(435, 0, 1654, 1047, 1067, 6),
(436, 0, 1654, 1050, 1065, 6),
(437, 0, 1654, 1051, 1066, 7),
(438, 0, 1654, 1053, 1065, 6),
(439, 0, 1654, 1047, 1069, 6),
(440, 0, 1654, 1047, 1069, 7),
(441, 0, 1654, 1053, 1069, 7),
(442, 0, 1654, 1057, 1065, 6),
(443, 0, 1654, 1056, 1066, 7),
(444, 0, 1655, 1047, 1073, 7),
(445, 0, 1655, 1047, 1075, 7),
(446, 0, 1655, 1052, 1075, 6),
(447, 0, 1655, 1047, 1077, 7),
(448, 0, 1655, 1052, 1076, 6),
(449, 0, 1655, 1052, 1077, 6),
(450, 0, 1655, 1053, 1078, 7),
(451, 0, 1656, 1047, 1083, 7),
(452, 0, 1656, 1047, 1084, 7),
(453, 0, 1656, 1047, 1085, 7),
(454, 0, 1656, 1054, 1084, 7),
(455, 0, 1657, 1047, 1091, 7),
(456, 0, 1657, 1047, 1092, 7),
(457, 0, 1657, 1047, 1093, 7),
(458, 0, 1658, 1064, 1090, 7),
(459, 0, 1658, 1064, 1094, 7),
(460, 0, 1658, 1060, 1096, 7),
(461, 0, 1659, 1063, 1081, 7),
(462, 0, 1659, 1069, 1080, 7),
(463, 0, 1659, 1069, 1082, 7),
(464, 0, 1659, 1069, 1084, 7),
(465, 0, 1660, 1064, 1073, 7),
(466, 0, 1660, 1069, 1073, 7),
(467, 0, 1660, 1069, 1074, 7),
(468, 0, 1660, 1069, 1075, 7),
(469, 0, 1661, 1060, 1102, 7),
(470, 0, 1661, 1060, 1106, 7),
(471, 0, 1662, 1047, 1104, 7),
(472, 0, 1662, 1047, 1106, 7),
(473, 0, 1662, 1047, 1108, 7),
(474, 0, 1663, 1034, 1083, 7),
(475, 0, 1663, 1032, 1086, 7),
(476, 0, 1663, 1037, 1086, 7),
(477, 0, 1663, 1039, 1085, 7),
(478, 0, 1663, 1033, 1090, 7),
(479, 0, 1663, 1036, 1090, 7),
(480, 0, 1663, 1039, 1088, 7),
(481, 0, 1664, 1033, 1066, 7),
(482, 0, 1664, 1037, 1066, 7),
(483, 0, 1664, 1035, 1069, 7),
(484, 0, 1664, 1039, 1070, 7),
(485, 0, 1664, 1033, 1072, 7),
(486, 0, 1664, 1037, 1072, 7),
(487, 0, 1664, 1039, 1074, 7),
(488, 0, 1664, 1035, 1077, 7),
(489, 0, 1665, 1028, 1076, 7),
(490, 0, 1666, 1016, 1070, 7),
(491, 0, 1666, 1016, 1075, 7),
(492, 0, 1666, 1022, 1076, 7),
(493, 0, 1667, 1020, 1059, 7),
(494, 0, 1667, 1016, 1062, 7),
(495, 0, 1667, 1020, 1063, 7),
(496, 0, 1667, 1016, 1065, 7),
(497, 0, 1668, 1027, 1059, 7),
(498, 0, 1668, 1028, 1059, 7),
(499, 0, 1668, 1025, 1063, 7),
(500, 0, 1668, 1029, 1063, 7),
(501, 0, 1668, 1027, 1066, 7),
(502, 0, 1669, 1019, 1086, 7),
(503, 0, 1669, 1022, 1087, 7),
(504, 0, 1669, 1023, 1090, 7),
(505, 0, 1669, 1024, 1083, 7),
(506, 0, 1669, 1025, 1086, 7),
(507, 0, 1670, 1023, 1082, 6),
(508, 0, 1670, 1019, 1084, 6),
(509, 0, 1670, 1019, 1088, 6),
(510, 0, 1670, 1022, 1090, 6),
(511, 0, 1670, 1024, 1090, 6),
(512, 0, 1671, 1029, 1082, 6),
(513, 0, 1671, 1028, 1090, 6),
(514, 0, 1671, 1030, 1090, 6),
(515, 0, 1672, 1036, 1082, 6),
(516, 0, 1672, 1039, 1085, 6),
(517, 0, 1672, 1035, 1090, 6),
(518, 0, 1672, 1037, 1090, 6),
(519, 0, 1672, 1039, 1088, 6),
(520, 0, 1673, 1028, 1064, 6),
(521, 0, 1673, 1034, 1066, 6),
(522, 0, 1673, 1034, 1071, 6),
(523, 0, 1673, 1036, 1069, 6),
(524, 0, 1673, 1036, 1073, 6),
(525, 0, 1673, 1034, 1076, 6),
(526, 0, 1674, 1027, 1076, 6),
(527, 0, 1675, 1016, 1066, 6),
(528, 0, 1675, 1020, 1064, 6),
(529, 0, 1675, 1022, 1064, 6),
(530, 0, 1675, 1023, 1067, 6),
(531, 0, 1675, 1016, 1070, 6),
(532, 0, 1675, 1016, 1074, 6),
(533, 0, 1675, 1021, 1076, 6),
(534, 0, 1676, 1007, 1084, 6),
(535, 0, 1676, 1006, 1089, 6),
(536, 0, 1677, 1007, 1073, 6),
(537, 0, 1677, 1004, 1076, 6),
(538, 0, 1677, 1011, 1073, 6),
(539, 0, 1677, 1013, 1075, 6),
(540, 0, 1677, 1013, 1077, 6),
(541, 0, 1678, 1010, 1081, 6),
(542, 0, 1678, 1016, 1083, 6),
(543, 0, 1678, 1016, 1086, 6),
(544, 0, 1678, 1013, 1089, 6),
(545, 0, 1679, 990, 1083, 6),
(546, 0, 1679, 990, 1087, 6),
(547, 0, 1679, 996, 1082, 6),
(548, 0, 1679, 992, 1084, 6),
(549, 0, 1679, 994, 1087, 6),
(550, 0, 1680, 990, 1075, 6),
(551, 0, 1680, 990, 1077, 6),
(552, 0, 1680, 994, 1073, 6),
(553, 0, 1680, 997, 1076, 6),
(554, 0, 1681, 983, 1079, 7),
(555, 0, 1681, 986, 1079, 7),
(556, 0, 1681, 986, 1082, 6),
(557, 0, 1681, 987, 1083, 7),
(558, 0, 1681, 985, 1086, 6),
(559, 0, 1681, 984, 1086, 7),
(560, 0, 1681, 982, 1089, 7),
(561, 0, 1681, 986, 1089, 7),
(562, 0, 1681, 987, 1089, 7),
(563, 0, 1681, 988, 1089, 7),
(564, 0, 1682, 973, 1083, 7),
(565, 0, 1682, 971, 1086, 6),
(566, 0, 1682, 975, 1087, 7),
(567, 0, 1682, 977, 1083, 7),
(568, 0, 1682, 975, 1091, 6),
(569, 0, 1682, 971, 1093, 6),
(570, 0, 1682, 973, 1095, 7),
(571, 0, 1682, 978, 1091, 7),
(572, 0, 1682, 976, 1095, 7),
(573, 0, 1682, 978, 1092, 7),
(574, 0, 1682, 978, 1093, 7),
(575, 0, 1683, 975, 1073, 7),
(576, 0, 1683, 975, 1080, 7),
(577, 0, 1683, 978, 1077, 7),
(578, 0, 1684, 985, 1073, 7),
(579, 0, 1685, 990, 1076, 7),
(580, 0, 1685, 993, 1073, 7),
(581, 0, 1685, 995, 1073, 7),
(582, 0, 1685, 997, 1077, 7),
(583, 0, 1686, 990, 1085, 7),
(584, 0, 1686, 997, 1086, 7),
(585, 0, 1686, 993, 1089, 7),
(586, 0, 1686, 995, 1089, 7),
(587, 0, 1687, 1004, 1085, 7),
(588, 0, 1687, 1016, 1082, 7),
(589, 0, 1687, 1016, 1087, 7),
(590, 0, 1687, 1008, 1089, 7),
(591, 0, 1687, 1013, 1089, 7),
(592, 0, 1688, 1004, 1078, 7),
(593, 0, 1688, 1008, 1075, 7),
(594, 0, 1688, 1013, 1075, 7),
(595, 0, 1688, 1011, 1077, 7),
(596, 0, 1688, 1013, 1078, 7),
(597, 0, 1688, 1008, 1080, 7),
(598, 0, 1689, 996, 1059, 7),
(599, 0, 1689, 1001, 1059, 7),
(600, 0, 1689, 999, 1062, 7),
(601, 0, 1689, 996, 1064, 7),
(602, 0, 1689, 1000, 1066, 7),
(603, 0, 1689, 1004, 1066, 7),
(604, 0, 1689, 1008, 1061, 7),
(605, 0, 1690, 1002, 1047, 7),
(606, 0, 1690, 999, 1049, 7),
(607, 0, 1690, 1002, 1052, 7),
(608, 0, 1690, 1008, 1048, 7),
(609, 0, 1691, 1019, 1046, 7),
(610, 0, 1691, 1022, 1050, 7),
(611, 0, 1691, 1025, 1043, 7),
(612, 0, 1691, 1028, 1048, 7),
(613, 0, 1692, 1034, 1048, 7),
(614, 0, 1692, 1040, 1050, 7),
(615, 0, 1693, 1034, 1047, 6),
(616, 0, 1693, 1039, 1047, 6),
(617, 0, 1693, 1037, 1049, 6),
(618, 0, 1693, 1043, 1044, 6),
(619, 0, 1693, 1043, 1049, 6),
(620, 0, 1694, 1026, 1044, 6),
(621, 0, 1694, 1028, 1048, 6),
(622, 0, 1695, 1055, 1039, 7),
(623, 0, 1695, 1054, 1044, 7),
(624, 0, 1695, 1051, 1050, 6),
(625, 0, 1695, 1057, 1044, 6),
(626, 0, 1695, 1059, 1048, 6),
(627, 0, 1695, 1056, 1051, 7),
(628, 0, 1695, 1059, 1048, 7),
(629, 0, 1696, 1066, 1030, 7),
(630, 0, 1696, 1060, 1032, 7),
(631, 0, 1696, 1071, 1033, 7),
(632, 0, 1697, 1065, 1015, 7),
(633, 0, 1697, 1060, 1018, 7),
(634, 0, 1697, 1067, 1017, 7),
(635, 0, 1698, 999, 1023, 7),
(636, 0, 1698, 1002, 1020, 7),
(637, 0, 1698, 1008, 1023, 7),
(638, 0, 1699, 999, 1035, 6),
(639, 0, 1699, 999, 1034, 7),
(640, 0, 1699, 1001, 1033, 6),
(641, 0, 1699, 1005, 1035, 6),
(642, 0, 1699, 1002, 1038, 7),
(643, 0, 1700, 991, 1035, 6),
(644, 0, 1700, 990, 1033, 7),
(645, 0, 1700, 991, 1038, 7),
(646, 0, 1701, 983, 1038, 7),
(647, 0, 1702, 970, 1031, 7),
(648, 0, 1702, 967, 1033, 7),
(649, 0, 1702, 975, 1034, 7),
(650, 0, 1702, 970, 1036, 7),
(651, 0, 1702, 976, 1038, 7),
(652, 0, 1703, 970, 1042, 6),
(653, 0, 1703, 968, 1043, 7),
(654, 0, 1703, 973, 1045, 7),
(655, 0, 1704, 968, 1061, 7),
(656, 0, 1704, 968, 1066, 7),
(657, 0, 1705, 981, 1053, 7),
(658, 0, 1705, 986, 1053, 7),
(659, 0, 1705, 988, 1053, 7),
(660, 0, 1705, 990, 1053, 7),
(661, 0, 1705, 984, 1056, 7),
(662, 0, 1705, 993, 1056, 7),
(663, 0, 1706, 975, 1052, 7),
(664, 0, 1707, 987, 1063, 6),
(665, 0, 1707, 984, 1061, 7),
(666, 0, 1707, 987, 1061, 7),
(667, 0, 1707, 990, 1063, 7),
(668, 0, 1707, 984, 1064, 7),
(669, 0, 1707, 987, 1066, 7),
(670, 0, 1707, 989, 1066, 7),
(671, 0, 1707, 991, 1066, 7),
(672, 0, 1707, 993, 1062, 7),
(673, 0, 1708, 968, 1017, 7),
(674, 0, 1708, 966, 1022, 7),
(675, 0, 1708, 971, 1022, 7),
(676, 0, 1708, 968, 1026, 7),
(677, 0, 1709, 979, 1017, 7),
(678, 0, 1709, 976, 1021, 7),
(679, 0, 1709, 981, 1021, 7),
(680, 0, 1709, 978, 1024, 7),
(681, 0, 1710, 990, 1017, 7),
(682, 0, 1710, 988, 1021, 7),
(683, 0, 1710, 992, 1021, 7),
(684, 0, 1710, 990, 1024, 7),
(685, 0, 1711, 993, 1004, 7),
(686, 0, 1711, 994, 1009, 7),
(687, 0, 1712, 988, 1002, 7),
(688, 0, 1712, 987, 1009, 7),
(689, 0, 1713, 973, 1003, 7),
(690, 0, 1713, 968, 1004, 7),
(691, 0, 1713, 978, 1001, 7),
(692, 0, 1713, 980, 1005, 7),
(693, 0, 1714, 970, 1011, 7),
(694, 0, 1714, 976, 1009, 7),
(695, 0, 1715, 991, 1095, 7),
(696, 0, 1715, 987, 1103, 5),
(697, 0, 1715, 987, 1103, 6),
(698, 0, 1715, 989, 1100, 5),
(699, 0, 1715, 991, 1100, 5),
(700, 0, 1715, 990, 1100, 6),
(701, 0, 1715, 994, 1099, 7),
(702, 0, 1715, 994, 1100, 5),
(703, 0, 1715, 992, 1100, 6),
(704, 0, 1715, 995, 1100, 6),
(705, 0, 1715, 996, 1100, 5),
(706, 0, 1715, 996, 1103, 7),
(707, 0, 1715, 987, 1108, 5),
(708, 0, 1715, 987, 1108, 6),
(709, 0, 1715, 989, 1110, 5),
(710, 0, 1715, 991, 1110, 5),
(711, 0, 1715, 990, 1110, 6),
(712, 0, 1715, 992, 1107, 6),
(713, 0, 1715, 993, 1107, 7),
(714, 0, 1715, 994, 1110, 5),
(715, 0, 1715, 996, 1110, 5),
(716, 0, 1715, 996, 1110, 6),
(717, 0, 1716, 1004, 1095, 7),
(718, 0, 1716, 1007, 1098, 7),
(719, 0, 1716, 1001, 1100, 6),
(720, 0, 1716, 1003, 1100, 6),
(721, 0, 1716, 1002, 1102, 7),
(722, 0, 1716, 1005, 1100, 6),
(723, 0, 1716, 1004, 1100, 7),
(724, 0, 1716, 1008, 1100, 6),
(725, 0, 1716, 1010, 1103, 6),
(726, 0, 1716, 1001, 1105, 6),
(727, 0, 1716, 1001, 1110, 6),
(728, 0, 1716, 1003, 1108, 6),
(729, 0, 1716, 1007, 1110, 6),
(730, 0, 1716, 1010, 1108, 6),
(731, 0, 1717, 1015, 1097, 7),
(732, 0, 1717, 1013, 1107, 7),
(733, 0, 1717, 1016, 1104, 7),
(734, 0, 1718, 1023, 1097, 7),
(735, 0, 1718, 1021, 1103, 7),
(736, 0, 1718, 1023, 1107, 7),
(737, 0, 1718, 1025, 1103, 7),
(738, 0, 1719, 1030, 1103, 7),
(739, 0, 1719, 1035, 1102, 6),
(740, 0, 1719, 1033, 1105, 6),
(741, 0, 1719, 1032, 1107, 7),
(742, 0, 1719, 1039, 1107, 7),
(743, 0, 1720, 998, 1062, 6),
(744, 0, 1720, 1006, 1061, 6),
(745, 0, 1720, 1000, 1064, 6),
(746, 0, 1721, 1006, 1049, 6),
(747, 0, 1722, 1004, 1025, 6),
(748, 0, 1803, 1036, 1187, 7),
(749, 0, 1803, 1030, 1190, 6),
(750, 0, 1803, 1031, 1190, 7),
(751, 0, 1803, 1035, 1188, 5),
(752, 0, 1803, 1035, 1188, 6),
(753, 0, 1803, 1034, 1190, 7),
(754, 0, 1803, 1037, 1188, 5),
(755, 0, 1803, 1036, 1188, 6),
(756, 0, 1803, 1037, 1188, 6),
(757, 0, 1803, 1038, 1190, 7),
(758, 0, 1805, 1016, 1189, 5),
(759, 0, 1805, 1018, 1189, 6),
(760, 0, 1805, 1020, 1189, 6),
(761, 0, 1805, 1023, 1189, 6),
(762, 0, 1805, 1023, 1190, 7),
(763, 0, 1805, 1017, 1193, 7),
(764, 0, 1805, 1019, 1193, 7),
(765, 0, 1805, 1021, 1193, 7),
(766, 0, 1805, 1025, 1189, 5),
(767, 0, 1805, 1025, 1193, 7),
(768, 0, 1806, 1006, 1190, 6),
(769, 0, 1806, 1006, 1193, 7),
(770, 0, 1806, 1007, 1193, 7),
(771, 0, 1806, 1009, 1190, 6),
(772, 0, 1806, 1008, 1190, 7),
(773, 0, 1806, 1010, 1193, 7),
(774, 0, 1807, 1009, 1201, 7),
(775, 0, 1807, 1010, 1201, 7),
(776, 0, 1807, 1011, 1201, 7),
(777, 0, 1807, 1014, 1201, 7),
(778, 0, 1807, 1012, 1205, 7),
(779, 0, 1807, 1014, 1207, 7),
(780, 0, 1807, 1011, 1211, 6),
(781, 0, 1807, 1010, 1211, 7),
(782, 0, 1807, 1013, 1211, 6),
(783, 0, 1807, 1014, 1211, 7),
(784, 0, 1808, 1017, 1201, 7),
(785, 0, 1808, 1019, 1201, 7),
(786, 0, 1808, 1021, 1201, 7),
(787, 0, 1808, 1018, 1208, 7),
(788, 0, 1808, 1020, 1208, 7),
(789, 0, 1809, 1026, 1201, 7),
(790, 0, 1809, 1027, 1201, 7),
(791, 0, 1809, 1028, 1201, 7),
(792, 0, 1810, 1047, 1183, 7),
(793, 0, 1810, 1051, 1183, 6),
(794, 0, 1810, 1055, 1180, 6),
(795, 0, 1810, 1055, 1180, 7),
(796, 0, 1811, 1054, 1190, 6),
(797, 0, 1811, 1053, 1188, 7),
(798, 0, 1811, 1049, 1193, 6),
(799, 0, 1811, 1051, 1193, 7),
(800, 0, 1811, 1053, 1193, 7),
(801, 0, 1811, 1054, 1193, 7),
(802, 0, 1811, 1056, 1190, 6),
(803, 0, 1811, 1058, 1190, 6),
(804, 0, 1811, 1058, 1193, 7),
(805, 0, 1812, 1069, 1190, 7),
(806, 0, 1812, 1065, 1193, 6),
(807, 0, 1812, 1067, 1193, 6),
(808, 0, 1812, 1065, 1193, 7),
(809, 0, 1812, 1066, 1193, 7),
(810, 0, 1812, 1067, 1193, 7),
(811, 0, 1812, 1071, 1198, 7),
(812, 0, 1812, 1073, 1198, 7),
(813, 0, 1813, 1083, 1189, 6),
(814, 0, 1813, 1081, 1188, 7),
(815, 0, 1813, 1086, 1189, 7),
(816, 0, 1813, 1078, 1192, 6),
(817, 0, 1814, 1078, 1197, 6),
(818, 0, 1814, 1079, 1197, 6),
(819, 0, 1814, 1076, 1197, 7),
(820, 0, 1814, 1080, 1197, 6),
(821, 0, 1814, 1079, 1200, 7),
(822, 0, 1814, 1080, 1200, 7),
(823, 0, 1814, 1081, 1200, 7),
(824, 0, 1815, 1096, 1182, 7),
(825, 0, 1815, 1100, 1182, 7),
(826, 0, 1815, 1101, 1182, 7),
(827, 0, 1815, 1094, 1186, 7),
(828, 0, 1815, 1098, 1186, 6),
(829, 0, 1815, 1098, 1184, 7),
(830, 0, 1816, 1097, 1193, 6),
(831, 0, 1816, 1095, 1198, 7),
(832, 0, 1816, 1099, 1199, 6),
(833, 0, 1816, 1097, 1203, 6),
(834, 0, 1817, 1095, 1205, 7),
(835, 0, 1818, 1082, 1207, 7),
(836, 0, 1818, 1086, 1207, 7),
(837, 0, 1818, 1084, 1210, 6),
(838, 0, 1818, 1080, 1213, 7),
(839, 0, 1818, 1083, 1214, 7),
(840, 0, 1818, 1089, 1207, 7),
(841, 0, 1818, 1081, 1217, 6),
(842, 0, 1818, 1083, 1217, 6),
(843, 0, 1819, 1068, 1222, 7),
(844, 0, 1819, 1072, 1218, 7),
(845, 0, 1819, 1075, 1218, 7),
(846, 0, 1819, 1077, 1218, 7),
(847, 0, 1819, 1075, 1222, 6),
(848, 0, 1819, 1075, 1222, 7),
(849, 0, 1820, 1065, 1215, 7),
(850, 0, 1820, 1070, 1215, 7),
(851, 0, 1821, 1065, 1203, 7),
(852, 0, 1821, 1066, 1203, 7),
(853, 0, 1821, 1067, 1203, 7),
(854, 0, 2010, 958, 218, 7),
(855, 0, 2010, 954, 221, 7),
(856, 0, 2010, 954, 224, 7),
(857, 0, 2010, 954, 229, 7),
(858, 0, 2010, 958, 231, 7),
(859, 0, 2010, 962, 222, 7),
(860, 0, 2010, 962, 227, 7),
(861, 0, 2010, 960, 229, 7),
(862, 0, 2010, 960, 230, 7),
(863, 0, 2010, 961, 229, 7),
(864, 0, 2010, 961, 230, 7),
(865, 0, 2011, 946, 223, 7),
(866, 0, 2011, 948, 220, 7),
(867, 0, 2011, 948, 221, 7),
(868, 0, 2011, 948, 222, 7),
(869, 0, 2011, 947, 224, 7),
(870, 0, 2011, 947, 225, 7),
(871, 0, 2011, 948, 225, 7),
(872, 0, 2011, 948, 227, 7),
(873, 0, 2011, 948, 229, 7),
(874, 0, 2012, 954, 206, 7),
(875, 0, 2012, 957, 204, 7),
(876, 0, 2012, 958, 204, 7),
(877, 0, 2012, 954, 210, 7),
(878, 0, 2012, 956, 212, 7),
(879, 0, 2012, 960, 204, 7),
(880, 0, 2012, 963, 206, 7),
(881, 0, 2012, 961, 210, 7),
(882, 0, 2012, 961, 211, 7),
(883, 0, 2012, 962, 210, 7),
(884, 0, 2012, 962, 211, 7),
(885, 0, 2012, 963, 211, 7),
(886, 0, 2012, 961, 212, 7),
(887, 0, 2013, 954, 199, 7),
(888, 0, 2013, 955, 197, 7),
(889, 0, 2013, 955, 198, 7),
(890, 0, 2013, 959, 196, 7),
(891, 0, 2013, 957, 201, 7),
(892, 0, 2013, 958, 201, 7),
(893, 0, 2013, 959, 201, 7),
(894, 0, 2013, 963, 199, 7),
(895, 0, 2014, 954, 190, 7),
(896, 0, 2015, 939, 187, 7),
(897, 0, 2015, 939, 188, 7),
(898, 0, 2015, 943, 188, 6),
(899, 0, 2015, 941, 189, 7),
(900, 0, 2015, 947, 189, 7),
(901, 0, 2015, 906, 219, 7),
(902, 0, 2015, 909, 218, 7),
(903, 0, 2015, 905, 221, 7),
(904, 0, 2015, 906, 220, 7),
(905, 0, 2015, 912, 218, 7),
(906, 0, 2015, 915, 220, 7),
(907, 0, 2015, 915, 223, 7),
(908, 0, 2015, 908, 224, 7),
(909, 0, 2015, 909, 224, 7),
(910, 0, 2015, 911, 224, 7),
(911, 0, 2017, 907, 227, 7),
(912, 0, 2017, 908, 227, 7),
(913, 0, 2017, 909, 227, 7),
(914, 0, 2017, 905, 231, 7),
(915, 0, 2017, 911, 231, 7),
(916, 0, 2017, 907, 234, 7),
(917, 0, 2017, 910, 232, 7),
(918, 0, 2017, 910, 233, 7),
(919, 0, 2018, 895, 229, 7),
(920, 0, 2018, 895, 232, 7),
(921, 0, 2018, 896, 228, 7),
(922, 0, 2018, 896, 229, 7),
(923, 0, 2018, 900, 229, 7),
(924, 0, 2018, 900, 231, 7),
(925, 0, 2018, 898, 234, 7),
(926, 0, 2019, 896, 219, 7),
(927, 0, 2019, 896, 220, 7),
(928, 0, 2019, 900, 220, 7),
(929, 0, 2019, 900, 221, 7),
(930, 0, 2019, 900, 224, 7),
(931, 0, 2020, 899, 219, 6),
(932, 0, 2020, 898, 223, 6),
(933, 0, 2020, 899, 220, 6),
(934, 0, 2020, 900, 221, 6),
(935, 0, 2021, 913, 219, 6),
(936, 0, 2021, 914, 219, 6),
(937, 0, 2021, 913, 220, 6),
(938, 0, 2021, 914, 220, 6),
(939, 0, 2021, 913, 224, 6),
(940, 0, 2022, 888, 188, 7),
(941, 0, 2022, 888, 189, 7),
(942, 0, 2022, 891, 192, 7),
(943, 0, 2023, 894, 195, 7),
(944, 0, 2023, 888, 196, 7),
(945, 0, 2023, 888, 197, 7),
(946, 0, 2023, 892, 198, 7),
(947, 0, 2024, 892, 191, 6),
(948, 0, 2024, 892, 197, 6),
(949, 0, 2025, 869, 195, 7),
(950, 0, 2025, 871, 195, 7),
(951, 0, 2025, 873, 195, 7),
(952, 0, 2025, 875, 195, 7),
(953, 0, 2025, 874, 198, 6),
(954, 0, 2025, 872, 199, 7),
(955, 0, 2025, 878, 199, 7),
(956, 0, 2025, 878, 200, 7),
(957, 0, 2025, 878, 201, 7),
(958, 0, 2026, 855, 195, 7),
(959, 0, 2026, 857, 195, 7),
(960, 0, 2026, 859, 195, 7),
(961, 0, 2026, 861, 195, 7),
(962, 0, 2026, 859, 199, 6),
(963, 0, 2026, 854, 200, 7),
(964, 0, 2026, 854, 201, 7),
(965, 0, 2026, 859, 200, 7),
(966, 0, 2027, 868, 186, 7),
(967, 0, 2027, 866, 188, 7),
(968, 0, 2028, 878, 205, 7),
(969, 0, 2028, 878, 206, 7),
(970, 0, 2028, 879, 207, 7),
(971, 0, 2028, 874, 211, 7),
(972, 0, 2028, 875, 211, 7),
(973, 0, 2028, 876, 211, 7),
(974, 0, 2028, 877, 211, 7),
(975, 0, 2028, 879, 209, 7),
(976, 0, 2028, 879, 210, 7),
(977, 0, 2029, 868, 205, 7),
(978, 0, 2029, 868, 206, 7),
(979, 0, 2029, 869, 205, 7),
(980, 0, 2029, 869, 206, 7),
(981, 0, 2029, 869, 211, 7),
(982, 0, 2029, 870, 211, 7),
(983, 0, 2029, 871, 211, 7),
(984, 0, 2030, 853, 205, 7),
(985, 0, 2030, 853, 206, 7),
(986, 0, 2030, 854, 205, 7),
(987, 0, 2030, 854, 206, 7),
(988, 0, 2030, 854, 211, 7),
(989, 0, 2030, 855, 211, 7),
(990, 0, 2030, 856, 211, 7),
(991, 0, 2030, 857, 211, 7),
(992, 0, 2030, 858, 209, 7),
(993, 0, 2030, 860, 211, 7),
(994, 0, 2031, 832, 205, 7),
(995, 0, 2031, 832, 206, 7),
(996, 0, 2031, 834, 211, 7),
(997, 0, 2031, 836, 208, 7),
(998, 0, 2032, 844, 205, 7),
(999, 0, 2032, 844, 206, 7),
(1000, 0, 2032, 845, 206, 7),
(1001, 0, 2032, 839, 208, 7),
(1002, 0, 2032, 842, 211, 7),
(1003, 0, 2032, 845, 209, 7),
(1004, 0, 2033, 860, 220, 7),
(1005, 0, 2033, 853, 225, 7),
(1006, 0, 2033, 853, 226, 7),
(1007, 0, 2033, 854, 225, 7),
(1008, 0, 2033, 854, 226, 7),
(1009, 0, 2033, 855, 227, 7),
(1010, 0, 2033, 857, 225, 7),
(1011, 0, 2034, 867, 220, 7),
(1012, 0, 2034, 869, 222, 7),
(1013, 0, 2034, 874, 220, 7),
(1014, 0, 2034, 873, 225, 7),
(1015, 0, 2034, 873, 226, 7),
(1016, 0, 2034, 874, 225, 7),
(1017, 0, 2035, 853, 219, 6),
(1018, 0, 2035, 853, 220, 6),
(1019, 0, 2035, 859, 224, 6),
(1020, 0, 2036, 873, 219, 6),
(1021, 0, 2036, 873, 220, 6),
(1022, 0, 2036, 867, 225, 6),
(1023, 0, 2037, 871, 207, 6),
(1024, 0, 2037, 875, 204, 6),
(1025, 0, 2037, 879, 206, 5),
(1026, 0, 2037, 879, 207, 6),
(1027, 0, 2037, 871, 208, 6),
(1028, 0, 2037, 871, 209, 6),
(1029, 0, 2037, 873, 211, 6),
(1030, 0, 2037, 877, 208, 5),
(1031, 0, 2037, 878, 211, 6),
(1032, 0, 2037, 879, 210, 6),
(1033, 0, 2152, 486, 859, 7),
(1034, 0, 2152, 488, 862, 6),
(1035, 0, 2153, 474, 853, 6),
(1036, 0, 2153, 477, 855, 7),
(1037, 0, 2154, 465, 858, 6),
(1038, 0, 2155, 458, 850, 5),
(1039, 0, 2155, 456, 849, 6),
(1040, 0, 2155, 459, 853, 6),
(1041, 0, 2156, 449, 859, 6),
(1042, 0, 2156, 451, 862, 6),
(1043, 0, 2157, 458, 871, 6),
(1044, 0, 2158, 455, 875, 6),
(1045, 0, 2158, 455, 878, 5),
(1046, 0, 2158, 453, 878, 6),
(1047, 0, 2159, 468, 887, 6),
(1048, 0, 2159, 471, 886, 7),
(1049, 0, 2160, 480, 882, 7),
(1050, 0, 2160, 483, 881, 7),
(1051, 0, 2160, 484, 882, 6),
(1052, 0, 2160, 486, 885, 7),
(1053, 0, 2161, 492, 878, 7),
(1054, 0, 2161, 492, 881, 6),
(1055, 0, 2162, 506, 853, 6),
(1056, 0, 2162, 503, 856, 7),
(1057, 0, 2163, 521, 853, 7),
(1058, 0, 2164, 535, 850, 6),
(1059, 0, 2164, 533, 852, 7),
(1060, 0, 2165, 547, 840, 7),
(1061, 0, 2166, 546, 829, 7),
(1062, 0, 2166, 548, 831, 7),
(1063, 0, 2167, 543, 817, 7),
(1064, 0, 2167, 545, 816, 6),
(1065, 0, 2167, 548, 817, 7),
(1066, 0, 2168, 531, 812, 7),
(1067, 0, 2168, 532, 816, 7),
(1068, 0, 2169, 519, 812, 7),
(1069, 0, 2169, 519, 815, 7),
(1070, 0, 2170, 512, 812, 7),
(1071, 0, 2171, 511, 799, 6),
(1072, 0, 2171, 510, 798, 7),
(1073, 0, 2171, 514, 798, 7),
(1074, 0, 2171, 512, 802, 7),
(1075, 0, 2173, 519, 802, 7),
(1076, 0, 2173, 522, 800, 6),
(1077, 0, 2174, 533, 804, 6),
(1078, 0, 2174, 532, 807, 7),
(1079, 0, 2175, 500, 805, 6),
(1080, 0, 2176, 500, 797, 5),
(1081, 0, 2176, 500, 798, 6),
(1082, 0, 2177, 490, 795, 6),
(1083, 0, 2177, 487, 796, 5),
(1084, 0, 2177, 487, 798, 6),
(1085, 0, 2178, 560, 806, 7),
(1086, 0, 2178, 567, 806, 6),
(1087, 0, 2178, 564, 808, 6),
(1088, 0, 2178, 564, 808, 7),
(1089, 0, 2179, 562, 813, 7),
(1090, 0, 2179, 556, 818, 7),
(1091, 0, 2179, 558, 816, 7),
(1092, 0, 2180, 546, 801, 6),
(1093, 0, 2181, 537, 796, 6),
(1094, 0, 2181, 539, 799, 6),
(1095, 0, 2181, 542, 799, 6),
(1096, 0, 2182, 553, 794, 5),
(1097, 0, 2182, 552, 797, 6),
(1098, 0, 2183, 560, 826, 7),
(1099, 0, 2183, 562, 824, 7),
(1100, 0, 2184, 554, 852, 7),
(1101, 0, 2185, 539, 859, 7),
(1102, 0, 2185, 536, 862, 6),
(1103, 0, 2186, 544, 859, 7),
(1104, 0, 2186, 545, 862, 6),
(1105, 0, 2187, 517, 862, 7),
(1106, 0, 2187, 514, 870, 6),
(1107, 0, 2188, 484, 896, 6),
(1108, 0, 2188, 480, 900, 7),
(1109, 0, 2189, 461, 899, 6),
(1110, 0, 2189, 464, 898, 7),
(1111, 0, 2190, 459, 892, 7),
(1112, 0, 2190, 461, 893, 6),
(1113, 0, 2190, 464, 893, 7),
(1114, 0, 2191, 476, 864, 6),
(1115, 0, 2270, 410, 1336, 7),
(1116, 0, 2271, 400, 1345, 7),
(1117, 0, 2272, 394, 1346, 7),
(1118, 0, 2273, 387, 1346, 7),
(1119, 0, 2274, 398, 1344, 6),
(1120, 0, 2275, 400, 1342, 6),
(1121, 0, 2276, 407, 1339, 6),
(1122, 0, 2276, 402, 1344, 6),
(1123, 0, 2277, 429, 1335, 6),
(1124, 0, 2278, 429, 1343, 6),
(1125, 0, 2279, 433, 1338, 6),
(1126, 0, 2280, 425, 1342, 5),
(1127, 0, 2281, 427, 1337, 5),
(1128, 0, 2282, 398, 1341, 5),
(1129, 0, 2283, 400, 1339, 5),
(1130, 0, 2284, 402, 1341, 5),
(1131, 0, 2286, 403, 1337, 4),
(1132, 0, 2287, 398, 1341, 3),
(1133, 0, 2290, 463, 1327, 6),
(1134, 0, 2291, 469, 1325, 6),
(1135, 0, 2292, 461, 1328, 5),
(1136, 0, 2298, 490, 1352, 7),
(1137, 0, 2301, 456, 1351, 7),
(1138, 0, 2302, 434, 1351, 7),
(1139, 0, 2302, 433, 1359, 7),
(1140, 0, 2303, 419, 1351, 7),
(1141, 0, 2303, 420, 1356, 7),
(1142, 0, 2304, 405, 1352, 7),
(1143, 0, 2304, 406, 1352, 7),
(1144, 0, 2304, 407, 1352, 7),
(1145, 0, 2305, 394, 1352, 7),
(1146, 0, 2305, 395, 1352, 7),
(1147, 0, 2305, 396, 1352, 7),
(1148, 0, 2306, 395, 1367, 7),
(1149, 0, 2306, 396, 1367, 7),
(1150, 0, 2306, 397, 1367, 7),
(1151, 0, 2307, 411, 1363, 7),
(1152, 0, 2308, 424, 1368, 7),
(1153, 0, 2308, 425, 1368, 7),
(1154, 0, 2308, 426, 1368, 7),
(1155, 0, 2309, 411, 1372, 7),
(1156, 0, 2309, 412, 1372, 7),
(1157, 0, 2309, 413, 1372, 7),
(1158, 0, 2310, 404, 1373, 7),
(1159, 0, 2310, 405, 1373, 7),
(1160, 0, 2310, 406, 1373, 7),
(1161, 0, 2310, 397, 1382, 6),
(1162, 0, 2310, 403, 1377, 6),
(1163, 0, 2310, 406, 1377, 6),
(1164, 0, 2310, 402, 1382, 6),
(1165, 0, 2310, 406, 1382, 6),
(1166, 0, 2311, 415, 1374, 6),
(1167, 0, 2311, 417, 1376, 6),
(1168, 0, 2311, 418, 1376, 6),
(1169, 0, 2312, 425, 1372, 6),
(1170, 0, 2312, 422, 1376, 6),
(1171, 0, 2314, 426, 1390, 6),
(1172, 0, 2314, 427, 1390, 6),
(1173, 0, 2314, 428, 1390, 6),
(1174, 0, 2315, 437, 1383, 6),
(1175, 0, 2315, 437, 1387, 6),
(1176, 0, 2315, 433, 1390, 6),
(1177, 0, 2315, 434, 1390, 6),
(1178, 0, 2315, 435, 1390, 6),
(1179, 0, 2316, 466, 1363, 6),
(1180, 0, 2317, 450, 1375, 6),
(1181, 0, 2317, 448, 1376, 6),
(1182, 0, 2318, 464, 1368, 6),
(1183, 0, 2319, 478, 1368, 6),
(1184, 0, 2320, 491, 1368, 6),
(1185, 0, 2321, 496, 1366, 6),
(1186, 0, 2321, 500, 1374, 6),
(1187, 0, 2322, 477, 1360, 6),
(1188, 0, 2322, 483, 1360, 6),
(1189, 0, 2323, 479, 1360, 5),
(1190, 0, 2324, 477, 1357, 4),
(1191, 0, 2325, 498, 1383, 7),
(1192, 0, 2325, 504, 1383, 7),
(1193, 0, 2325, 504, 1387, 7),
(1194, 0, 2326, 487, 1391, 7),
(1195, 0, 2326, 490, 1389, 7),
(1196, 0, 2327, 500, 1394, 7),
(1197, 0, 2328, 523, 1397, 7),
(1198, 0, 2329, 526, 1402, 7),
(1199, 0, 2330, 526, 1408, 7),
(1200, 0, 2331, 515, 1402, 7),
(1201, 0, 2333, 462, 1400, 6),
(1202, 0, 2333, 453, 1405, 5),
(1203, 0, 2333, 466, 1404, 5),
(1204, 0, 2335, 423, 1395, 6),
(1205, 0, 2335, 429, 1395, 6),
(1206, 0, 2335, 430, 1395, 6),
(1207, 0, 2335, 431, 1395, 6),
(1208, 0, 2335, 423, 1403, 5),
(1209, 0, 2335, 426, 1400, 6),
(1210, 0, 2335, 430, 1403, 5),
(1211, 0, 2335, 433, 1401, 5),
(1212, 0, 2336, 401, 1404, 7),
(1213, 0, 2337, 394, 1388, 5),
(1214, 0, 2337, 397, 1391, 6),
(1215, 0, 2337, 404, 1389, 6),
(1216, 0, 2338, 412, 1409, 7),
(1217, 0, 2339, 392, 1409, 7),
(1218, 0, 2340, 385, 1358, 7),
(1219, 0, 2341, 388, 1377, 7),
(1220, 0, 2342, 393, 1367, 6),
(1221, 0, 2342, 398, 1367, 6),
(1222, 0, 2342, 400, 1364, 6),
(1223, 0, 2342, 400, 1365, 6),
(1224, 0, 2343, 400, 1359, 6),
(1225, 0, 2344, 404, 1359, 6),
(1226, 0, 2345, 396, 1364, 5),
(1227, 0, 2346, 399, 1359, 5),
(1228, 0, 2347, 408, 1358, 5),
(1229, 0, 2349, 456, 1418, 5),
(1230, 0, 2349, 457, 1418, 5),
(1231, 0, 2349, 461, 1418, 5),
(1232, 0, 2349, 463, 1418, 5),
(1233, 0, 2349, 465, 1411, 5),
(1234, 0, 2349, 465, 1412, 4),
(1235, 0, 2349, 465, 1415, 4),
(1236, 0, 2349, 465, 1415, 5),
(1237, 0, 2350, 458, 1423, 5),
(1238, 0, 2350, 460, 1423, 5),
(1239, 0, 2351, 465, 1423, 5),
(1240, 0, 2351, 467, 1423, 5),
(1241, 0, 2351, 469, 1423, 5),
(1242, 0, 2351, 465, 1426, 4),
(1243, 0, 2351, 468, 1426, 4),
(1244, 0, 2353, 443, 1426, 5),
(1245, 0, 2354, 442, 1419, 4),
(1246, 0, 2354, 442, 1419, 5),
(1247, 0, 2354, 441, 1422, 4),
(1248, 0, 2354, 446, 1422, 4),
(1249, 0, 2354, 448, 1414, 4),
(1250, 0, 2354, 448, 1414, 5),
(1251, 0, 2354, 448, 1419, 5),
(1252, 0, 2354, 448, 1420, 4),
(1253, 0, 2355, 430, 1414, 4),
(1254, 0, 2355, 430, 1418, 5),
(1255, 0, 2355, 435, 1414, 4),
(1256, 0, 2355, 434, 1418, 5),
(1257, 0, 2355, 435, 1418, 5),
(1258, 0, 2356, 417, 1343, 7),
(1259, 0, 2357, 417, 1336, 7),
(1260, 0, 2362, 1025, 984, 6),
(1261, 0, 2362, 1028, 987, 6),
(1262, 0, 2363, 1032, 985, 6),
(1263, 0, 2364, 1029, 994, 6),
(1264, 0, 2364, 1034, 994, 6),
(1265, 0, 2364, 1029, 997, 6),
(1266, 0, 2365, 1021, 997, 6),
(1267, 0, 2366, 1019, 997, 5),
(1268, 0, 2367, 1027, 997, 5),
(1269, 0, 2368, 1033, 997, 5),
(1270, 0, 2369, 1033, 1001, 5),
(1271, 0, 2369, 1033, 1005, 5),
(1272, 0, 2370, 1020, 1001, 5),
(1273, 0, 2370, 1022, 1005, 5),
(1274, 0, 2371, 1019, 1001, 6),
(1275, 0, 2372, 1029, 1005, 6),
(1276, 0, 2372, 1032, 1007, 6),
(1277, 0, 2373, 971, 1056, 6),
(1278, 0, 2374, 969, 1063, 6),
(1279, 0, 2375, 1071, 1030, 6),
(1280, 0, 2375, 1063, 1033, 6),
(1281, 0, 2375, 1067, 1032, 6),
(1282, 0, 2376, 1063, 1017, 6),
(1283, 0, 2376, 1063, 1023, 6),
(1284, 0, 2377, 1068, 1020, 6),
(1285, 0, 2377, 1072, 1016, 6),
(1286, 0, 2378, 1067, 1016, 5),
(1287, 0, 2378, 1072, 1018, 5),
(1288, 0, 2379, 1063, 1024, 5),
(1289, 0, 2379, 1065, 1026, 5),
(1290, 0, 2379, 1068, 1024, 5),
(1291, 0, 2380, 1065, 1034, 5),
(1292, 0, 2380, 1072, 1030, 5),
(1293, 0, 2381, 997, 1083, 5),
(1294, 0, 2381, 994, 1089, 5),
(1295, 0, 2382, 1001, 1085, 5),
(1296, 0, 2383, 997, 1079, 5),
(1297, 0, 2384, 1001, 1077, 5),
(1298, 0, 2385, 1007, 1077, 5),
(1299, 0, 2386, 1013, 1079, 5),
(1300, 0, 2386, 1009, 1081, 5),
(1301, 0, 2387, 1007, 1085, 5),
(1302, 0, 2387, 1016, 1087, 5),
(1303, 0, 2387, 1009, 1089, 5),
(1304, 0, 2387, 1013, 1089, 5),
(1305, 0, 2388, 1082, 815, 7),
(1306, 0, 2388, 1083, 815, 7),
(1307, 0, 2388, 1084, 815, 7),
(1308, 0, 2388, 1079, 818, 6),
(1309, 0, 2388, 1080, 818, 6),
(1310, 0, 2388, 1081, 818, 6),
(1311, 0, 2388, 1080, 818, 7),
(1312, 0, 2388, 1087, 820, 6),
(1313, 0, 2389, 1075, 808, 7),
(1314, 0, 2389, 1076, 808, 7),
(1315, 0, 2389, 1077, 808, 7),
(1316, 0, 2390, 1075, 795, 7),
(1317, 0, 2390, 1077, 795, 7),
(1318, 0, 2390, 1079, 795, 7),
(1319, 0, 2390, 1082, 797, 7),
(1320, 0, 2390, 1082, 799, 7),
(1321, 0, 2391, 1064, 803, 6),
(1322, 0, 2391, 1071, 803, 6),
(1323, 0, 2391, 1061, 805, 6),
(1324, 0, 2391, 1061, 804, 7),
(1325, 0, 2391, 1066, 805, 6),
(1326, 0, 2391, 1068, 805, 6),
(1327, 0, 2391, 1068, 804, 7),
(1328, 0, 2391, 1064, 808, 7),
(1329, 0, 2391, 1065, 808, 7),
(1330, 0, 2391, 1066, 808, 7),
(1331, 0, 2392, 1063, 794, 7),
(1332, 0, 2392, 1065, 794, 7),
(1333, 0, 2392, 1067, 794, 7),
(1334, 0, 2393, 1053, 790, 7),
(1335, 0, 2393, 1054, 790, 7),
(1336, 0, 2393, 1055, 790, 7),
(1337, 0, 2393, 1051, 795, 7),
(1338, 0, 2393, 1052, 793, 6),
(1339, 0, 2393, 1056, 793, 6),
(1340, 0, 2393, 1051, 801, 6),
(1341, 0, 2393, 1056, 801, 6),
(1342, 0, 2394, 1060, 824, 7),
(1343, 0, 2394, 1063, 827, 7),
(1344, 0, 2394, 1066, 824, 7),
(1345, 0, 2394, 1067, 824, 7),
(1346, 0, 2394, 1068, 824, 7),
(1347, 0, 2394, 1060, 828, 6),
(1348, 0, 2394, 1061, 828, 6),
(1349, 0, 2394, 1062, 828, 6),
(1350, 0, 2394, 1060, 829, 7),
(1351, 0, 2394, 1064, 831, 6),
(1352, 0, 2394, 1067, 828, 6),
(1353, 0, 2394, 1067, 829, 7),
(1354, 0, 2394, 1068, 828, 6),
(1355, 0, 2394, 1069, 828, 6),
(1356, 0, 2394, 1072, 826, 7),
(1357, 0, 2394, 1061, 835, 6),
(1358, 0, 2395, 1047, 826, 7),
(1359, 0, 2395, 1048, 826, 7),
(1360, 0, 2395, 1049, 826, 7),
(1361, 0, 2395, 1048, 830, 6),
(1362, 0, 2395, 1049, 830, 6),
(1363, 0, 2395, 1050, 830, 6),
(1364, 0, 2395, 1050, 831, 7),
(1365, 0, 2395, 1053, 828, 7),
(1366, 0, 2395, 1048, 835, 7),
(1367, 0, 2395, 1053, 832, 6),
(1368, 0, 2395, 1053, 835, 7),
(1369, 0, 2395, 1046, 838, 7),
(1370, 0, 2395, 1051, 838, 7),
(1371, 0, 2396, 1038, 830, 6),
(1372, 0, 2396, 1039, 830, 6),
(1373, 0, 2396, 1036, 829, 7),
(1374, 0, 2396, 1040, 830, 6),
(1375, 0, 2396, 1039, 832, 7),
(1376, 0, 2396, 1041, 836, 7),
(1377, 0, 2397, 1038, 807, 6),
(1378, 0, 2397, 1033, 808, 7),
(1379, 0, 2397, 1036, 809, 6),
(1380, 0, 2397, 1036, 811, 7),
(1381, 0, 2397, 1038, 808, 7),
(1382, 0, 2397, 1033, 814, 7),
(1383, 0, 2397, 1037, 814, 6),
(1384, 0, 2397, 1038, 814, 6),
(1385, 0, 2397, 1039, 814, 6),
(1386, 0, 2397, 1041, 811, 7),
(1387, 0, 2398, 1049, 807, 7),
(1388, 0, 2398, 1053, 807, 6),
(1389, 0, 2398, 1048, 808, 6),
(1390, 0, 2398, 1053, 808, 7),
(1391, 0, 2398, 1046, 813, 7),
(1392, 0, 2398, 1048, 814, 6),
(1393, 0, 2398, 1049, 814, 6),
(1394, 0, 2398, 1050, 814, 6),
(1395, 0, 2398, 1053, 812, 6),
(1396, 0, 2398, 1053, 815, 7),
(1397, 0, 2398, 1047, 817, 7),
(1398, 0, 2398, 1048, 817, 7),
(1399, 0, 2398, 1049, 817, 7),
(1400, 0, 2399, 1040, 794, 6),
(1401, 0, 2399, 1042, 794, 6),
(1402, 0, 2399, 1044, 794, 6),
(1403, 0, 2399, 1044, 795, 7),
(1404, 0, 2399, 1046, 793, 7),
(1405, 0, 2399, 1046, 797, 6),
(1406, 0, 2399, 1046, 798, 7),
(1407, 0, 2400, 1037, 780, 6),
(1408, 0, 2400, 1038, 780, 6),
(1409, 0, 2400, 1039, 780, 6),
(1410, 0, 2400, 1037, 780, 7),
(1411, 0, 2400, 1039, 783, 7),
(1412, 0, 2400, 1041, 777, 7),
(1413, 0, 2400, 1047, 777, 6),
(1414, 0, 2400, 1041, 783, 7),
(1415, 0, 2400, 1043, 783, 7),
(1416, 0, 2400, 1044, 780, 6),
(1417, 0, 2400, 1045, 780, 7),
(1418, 0, 2401, 1053, 778, 7),
(1419, 0, 2401, 1054, 780, 6),
(1420, 0, 2401, 1055, 780, 6),
(1421, 0, 2401, 1054, 783, 7),
(1422, 0, 2401, 1055, 783, 7),
(1423, 0, 2401, 1058, 775, 6),
(1424, 0, 2401, 1058, 778, 7),
(1425, 0, 2401, 1056, 780, 6),
(1426, 0, 2401, 1056, 783, 7),
(1427, 0, 2402, 1067, 776, 6),
(1428, 0, 2402, 1067, 779, 6),
(1429, 0, 2402, 1066, 776, 7),
(1430, 0, 2402, 1063, 781, 6),
(1431, 0, 2402, 1064, 781, 6),
(1432, 0, 2402, 1065, 781, 6),
(1433, 0, 2402, 1066, 782, 7),
(1434, 0, 2402, 1069, 781, 6),
(1435, 0, 2402, 1064, 784, 7),
(1436, 0, 2402, 1065, 784, 7),
(1437, 0, 2403, 1011, 821, 7),
(1438, 0, 2403, 1012, 821, 7),
(1439, 0, 2403, 1013, 821, 7),
(1440, 0, 2403, 1016, 823, 7),
(1441, 0, 2403, 1011, 824, 6),
(1442, 0, 2403, 1010, 825, 7),
(1443, 0, 2403, 1012, 824, 6),
(1444, 0, 2403, 1013, 824, 6),
(1445, 0, 2403, 1016, 827, 6),
(1446, 0, 2403, 1012, 830, 6),
(1447, 0, 2403, 1012, 828, 7),
(1448, 0, 2403, 1016, 828, 7),
(1449, 0, 2404, 1002, 821, 7),
(1450, 0, 2404, 1003, 821, 7),
(1451, 0, 2404, 1004, 821, 7),
(1452, 0, 2404, 1002, 824, 6),
(1453, 0, 2404, 1003, 824, 6),
(1454, 0, 2404, 1004, 824, 6),
(1455, 0, 2404, 1001, 830, 6),
(1456, 0, 2404, 1003, 828, 7),
(1457, 0, 2404, 1005, 830, 6),
(1458, 0, 2405, 1006, 806, 6),
(1459, 0, 2405, 1002, 810, 6),
(1460, 0, 2405, 1003, 810, 6),
(1461, 0, 2405, 1003, 809, 7),
(1462, 0, 2405, 1004, 810, 6),
(1463, 0, 2405, 1005, 813, 7),
(1464, 0, 2405, 1006, 813, 7),
(1465, 0, 2405, 1007, 813, 7),
(1466, 0, 2405, 1011, 807, 6),
(1467, 0, 2405, 1011, 807, 7),
(1468, 0, 2405, 1009, 810, 6),
(1469, 0, 2405, 1009, 809, 7),
(1470, 0, 2405, 1011, 811, 7),
(1471, 0, 2406, 994, 813, 7),
(1472, 0, 2406, 996, 813, 7),
(1473, 0, 2406, 998, 813, 7),
(1474, 0, 2407, 989, 804, 7),
(1475, 0, 2407, 993, 802, 7),
(1476, 0, 2407, 994, 802, 7),
(1477, 0, 2407, 995, 802, 7),
(1478, 0, 2408, 996, 787, 7),
(1479, 0, 2408, 994, 789, 7),
(1480, 0, 2408, 996, 788, 6),
(1481, 0, 2408, 997, 788, 6),
(1482, 0, 2408, 998, 788, 6),
(1483, 0, 2408, 1002, 788, 7),
(1484, 0, 2408, 994, 792, 6),
(1485, 0, 2408, 996, 795, 7),
(1486, 0, 2408, 1002, 793, 7),
(1487, 0, 2408, 995, 797, 6),
(1488, 0, 2408, 994, 797, 7),
(1489, 0, 2408, 1000, 797, 6),
(1490, 0, 2408, 1000, 797, 7),
(1491, 0, 2409, 1004, 787, 7),
(1492, 0, 2409, 1007, 784, 7),
(1493, 0, 2409, 1007, 788, 6),
(1494, 0, 2409, 1004, 793, 7),
(1495, 0, 2409, 1007, 796, 6),
(1496, 0, 2409, 1009, 784, 7),
(1497, 0, 2409, 1009, 788, 6),
(1498, 0, 2409, 1011, 788, 6),
(1499, 0, 2409, 1012, 791, 6),
(1500, 0, 2409, 1012, 790, 7),
(1501, 0, 2409, 1009, 794, 6),
(1502, 0, 2409, 1009, 793, 7),
(1503, 0, 2409, 1008, 796, 7),
(1504, 0, 2409, 1012, 796, 6),
(1505, 0, 2409, 1012, 796, 7),
(1506, 0, 2410, 1018, 785, 7),
(1507, 0, 2410, 1022, 785, 7),
(1508, 0, 2410, 1017, 791, 7),
(1509, 0, 2410, 1021, 788, 6),
(1510, 0, 2410, 1021, 789, 6),
(1511, 0, 2410, 1021, 790, 6),
(1512, 0, 2410, 1020, 788, 7),
(1513, 0, 2410, 1021, 794, 6),
(1514, 0, 2410, 1016, 796, 6),
(1515, 0, 2410, 1019, 796, 6),
(1516, 0, 2410, 1018, 796, 7),
(1517, 0, 2410, 1024, 789, 7),
(1518, 0, 2410, 1024, 791, 7),
(1519, 0, 2410, 1024, 793, 7),
(1520, 0, 2411, 1016, 805, 7),
(1521, 0, 2411, 1018, 805, 7),
(1522, 0, 2411, 1020, 805, 7),
(1523, 0, 2411, 1016, 809, 6),
(1524, 0, 2411, 1017, 809, 6),
(1525, 0, 2411, 1018, 809, 6),
(1526, 0, 2411, 1017, 809, 7),
(1527, 0, 2411, 1023, 809, 6),
(1528, 0, 2411, 1020, 813, 7),
(1529, 0, 2411, 1023, 816, 6),
(1530, 0, 2411, 1023, 816, 7),
(1531, 0, 2411, 1025, 812, 7),
(1532, 0, 2412, 977, 819, 7),
(1533, 0, 2412, 982, 819, 6),
(1534, 0, 2412, 985, 819, 7),
(1535, 0, 2412, 977, 823, 7),
(1536, 0, 2412, 980, 821, 6),
(1537, 0, 2412, 981, 821, 7),
(1538, 0, 2412, 986, 820, 6),
(1539, 0, 2412, 986, 821, 6),
(1540, 0, 2412, 986, 822, 6),
(1541, 0, 2412, 989, 820, 7),
(1542, 0, 2412, 989, 821, 7),
(1543, 0, 2412, 989, 822, 7),
(1544, 0, 2412, 980, 826, 6),
(1545, 0, 2412, 982, 824, 6),
(1546, 0, 2412, 982, 826, 7),
(1547, 0, 2412, 984, 826, 6),
(1548, 0, 2412, 985, 824, 7),
(1549, 0, 2412, 988, 826, 7),
(1550, 0, 2413, 983, 807, 7),
(1551, 0, 2413, 984, 807, 7),
(1552, 0, 2413, 985, 807, 7),
(1553, 0, 2413, 977, 809, 7),
(1554, 0, 2413, 980, 811, 7),
(1555, 0, 2413, 986, 811, 7),
(1556, 0, 2413, 977, 813, 7),
(1557, 0, 2413, 983, 814, 7),
(1558, 0, 2414, 967, 811, 7),
(1559, 0, 2414, 969, 811, 7),
(1560, 0, 2414, 971, 811, 7),
(1561, 0, 2414, 971, 814, 6),
(1562, 0, 2414, 972, 814, 6),
(1563, 0, 2414, 973, 814, 6),
(1564, 0, 2414, 972, 815, 7),
(1565, 0, 2414, 975, 813, 7),
(1566, 0, 2414, 975, 816, 6),
(1567, 0, 2414, 975, 818, 7),
(1568, 0, 2414, 967, 823, 7),
(1569, 0, 2414, 969, 821, 6),
(1570, 0, 2414, 969, 820, 7),
(1571, 0, 2414, 975, 821, 6),
(1572, 0, 2414, 972, 823, 7),
(1573, 0, 2414, 975, 821, 7),
(1574, 0, 2415, 959, 801, 6),
(1575, 0, 2415, 959, 802, 7),
(1576, 0, 2415, 956, 807, 6),
(1577, 0, 2415, 959, 806, 6),
(1578, 0, 2415, 959, 807, 6),
(1579, 0, 2415, 956, 805, 7),
(1580, 0, 2415, 958, 811, 6),
(1581, 0, 2415, 959, 808, 6),
(1582, 0, 2415, 959, 808, 7),
(1583, 0, 2416, 958, 794, 7),
(1584, 0, 2416, 968, 791, 6),
(1585, 0, 2416, 968, 791, 7),
(1586, 0, 2416, 963, 795, 6),
(1587, 0, 2416, 962, 792, 7),
(1588, 0, 2416, 964, 795, 6),
(1589, 0, 2416, 965, 795, 6),
(1590, 0, 2416, 965, 794, 7),
(1591, 0, 2416, 968, 793, 6),
(1592, 0, 2416, 965, 798, 7),
(1593, 0, 2416, 968, 796, 7),
(1594, 0, 2417, 977, 790, 6),
(1595, 0, 2417, 976, 790, 7),
(1596, 0, 2417, 977, 795, 6),
(1597, 0, 2417, 979, 792, 6),
(1598, 0, 2417, 979, 793, 7),
(1599, 0, 2417, 976, 797, 7),
(1600, 0, 2417, 977, 797, 7),
(1601, 0, 2417, 978, 797, 7),
(1602, 0, 2418, 958, 782, 7),
(1603, 0, 2418, 961, 780, 7),
(1604, 0, 2418, 966, 782, 7),
(1605, 0, 2418, 961, 784, 7),
(1606, 0, 2419, 963, 769, 7),
(1607, 0, 2420, 978, 767, 6),
(1608, 0, 2420, 975, 774, 7),
(1609, 0, 2420, 977, 771, 6),
(1610, 0, 2420, 976, 768, 7),
(1611, 0, 2420, 977, 774, 7),
(1612, 0, 2420, 979, 774, 7),
(1613, 0, 2421, 986, 767, 6),
(1614, 0, 2421, 985, 767, 7),
(1615, 0, 2421, 984, 771, 6),
(1616, 0, 2421, 986, 774, 7),
(1617, 0, 2422, 999, 776, 7),
(1618, 0, 2423, 999, 763, 7),
(1619, 0, 2423, 999, 767, 7),
(1620, 0, 2423, 1005, 765, 7),
(1621, 0, 2424, 996, 766, 6),
(1622, 0, 2424, 996, 772, 6),
(1623, 0, 2425, 1002, 766, 6),
(1624, 0, 2425, 1003, 772, 6),
(1625, 0, 2426, 1018, 755, 6),
(1626, 0, 2426, 1017, 755, 7),
(1627, 0, 2426, 1021, 752, 6),
(1628, 0, 2426, 1021, 758, 7),
(1629, 0, 2427, 996, 755, 6),
(1630, 0, 2427, 996, 755, 7),
(1631, 0, 2427, 1002, 755, 6),
(1632, 0, 2427, 1005, 755, 7),
(1633, 0, 2427, 999, 757, 7),
(1634, 0, 2428, 984, 751, 7),
(1635, 0, 2428, 985, 751, 7),
(1636, 0, 2428, 986, 751, 7),
(1637, 0, 2428, 985, 754, 6),
(1638, 0, 2428, 989, 754, 7),
(1639, 0, 2428, 986, 756, 7),
(1640, 0, 2428, 989, 757, 6),
(1641, 0, 2428, 989, 758, 7),
(1642, 0, 2428, 987, 761, 7),
(1643, 0, 2429, 975, 751, 7),
(1644, 0, 2429, 976, 751, 7),
(1645, 0, 2429, 977, 751, 7),
(1646, 0, 2430, 961, 748, 7),
(1647, 0, 2430, 962, 748, 7),
(1648, 0, 2430, 961, 753, 6),
(1649, 0, 2430, 961, 752, 7),
(1650, 0, 2430, 964, 755, 7),
(1651, 0, 2430, 964, 756, 6),
(1652, 0, 2431, 952, 741, 6),
(1653, 0, 2431, 952, 742, 6),
(1654, 0, 2431, 952, 743, 6),
(1655, 0, 2431, 955, 742, 7),
(1656, 0, 2431, 955, 743, 7),
(1657, 0, 2431, 949, 745, 6),
(1658, 0, 2431, 955, 744, 7),
(1659, 0, 2431, 951, 748, 7),
(1660, 0, 2432, 956, 733, 6),
(1661, 0, 2432, 959, 738, 7),
(1662, 0, 2432, 960, 735, 6),
(1663, 0, 2432, 961, 735, 6),
(1664, 0, 2432, 962, 735, 6),
(1665, 0, 2432, 961, 734, 7),
(1666, 0, 2432, 965, 733, 6),
(1667, 0, 2432, 960, 738, 7),
(1668, 0, 2432, 962, 738, 7),
(1669, 0, 2433, 972, 734, 6),
(1670, 0, 2433, 972, 737, 6),
(1671, 0, 2433, 975, 736, 6),
(1672, 0, 2433, 972, 736, 7),
(1673, 0, 2433, 971, 740, 7),
(1674, 0, 2433, 973, 740, 7),
(1675, 0, 2433, 974, 740, 7),
(1676, 0, 2433, 976, 737, 6),
(1677, 0, 2433, 977, 737, 6),
(1678, 0, 2433, 978, 737, 6),
(1679, 0, 2434, 984, 734, 7),
(1680, 0, 2434, 989, 733, 6),
(1681, 0, 2434, 984, 737, 6),
(1682, 0, 2434, 988, 737, 7),
(1683, 0, 2434, 982, 740, 6),
(1684, 0, 2434, 983, 743, 7),
(1685, 0, 2434, 986, 740, 6),
(1686, 0, 2434, 987, 740, 6),
(1687, 0, 2434, 985, 743, 7),
(1688, 0, 2434, 987, 743, 7),
(1689, 0, 2434, 988, 740, 6),
(1690, 0, 2435, 983, 723, 7),
(1691, 0, 2435, 985, 723, 7),
(1692, 0, 2435, 987, 723, 7),
(1693, 0, 2436, 1016, 739, 7),
(1694, 0, 2436, 1020, 738, 7),
(1695, 0, 2436, 1020, 740, 6),
(1696, 0, 2437, 943, 723, 6),
(1697, 0, 2437, 943, 721, 7),
(1698, 0, 2437, 943, 724, 6),
(1699, 0, 2437, 943, 725, 6),
(1700, 0, 2437, 941, 729, 6),
(1701, 0, 2437, 940, 729, 7),
(1702, 0, 2437, 946, 724, 7),
(1703, 0, 2437, 944, 729, 7),
(1704, 0, 2438, 942, 713, 7),
(1705, 0, 2438, 944, 711, 6),
(1706, 0, 2438, 952, 711, 6),
(1707, 0, 2438, 952, 710, 7),
(1708, 0, 2438, 948, 714, 6),
(1709, 0, 2438, 949, 714, 6),
(1710, 0, 2438, 950, 714, 6),
(1711, 0, 2438, 949, 717, 7),
(1712, 0, 2438, 950, 717, 7),
(1713, 0, 2438, 951, 717, 7),
(1714, 0, 2438, 952, 716, 7),
(1715, 0, 2439, 959, 715, 6),
(1716, 0, 2439, 960, 715, 6),
(1717, 0, 2439, 961, 715, 6),
(1718, 0, 2439, 963, 712, 6),
(1719, 0, 2439, 967, 715, 6),
(1720, 0, 2439, 966, 713, 7),
(1721, 0, 2439, 970, 712, 6),
(1722, 0, 2439, 964, 718, 7),
(1723, 0, 2439, 965, 718, 7),
(1724, 0, 2439, 966, 718, 7),
(1725, 0, 2440, 1036, 731, 4),
(1726, 0, 2440, 1036, 733, 4),
(1727, 0, 2440, 1048, 732, 4),
(1728, 0, 2440, 1038, 739, 4),
(1729, 0, 2440, 1040, 736, 4),
(1730, 0, 2440, 1048, 737, 4),
(1731, 0, 2441, 1224, 1022, 7),
(1732, 0, 2441, 1226, 1026, 7),
(1733, 0, 2441, 1227, 1026, 7),
(1734, 0, 2441, 1228, 1026, 7),
(1735, 0, 2442, 1242, 1019, 7),
(1736, 0, 2442, 1236, 1021, 7),
(1737, 0, 2442, 1237, 1026, 7),
(1738, 0, 2442, 1238, 1026, 7),
(1739, 0, 2442, 1239, 1026, 7),
(1740, 0, 2442, 1242, 1024, 7),
(1741, 0, 2443, 1222, 1034, 7),
(1742, 0, 2443, 1226, 1032, 7),
(1743, 0, 2443, 1228, 1032, 7),
(1744, 0, 2443, 1231, 1032, 7),
(1745, 0, 2443, 1222, 1037, 7),
(1746, 0, 2443, 1229, 1037, 7),
(1747, 0, 2443, 1233, 1035, 7),
(1748, 0, 2443, 1228, 1042, 7),
(1749, 0, 2443, 1231, 1042, 7),
(1750, 0, 2443, 1233, 1040, 7),
(1751, 0, 2444, 1242, 1032, 7),
(1752, 0, 2444, 1243, 1032, 7),
(1753, 0, 2444, 1244, 1032, 7),
(1754, 0, 2444, 1240, 1037, 7),
(1755, 0, 2444, 1248, 1035, 7),
(1756, 0, 2444, 1239, 1043, 7),
(1757, 0, 2444, 1246, 1043, 7);
INSERT INTO `tiles` (`id`, `world_id`, `house_id`, `x`, `y`, `z`) VALUES
(1758, 0, 2444, 1248, 1040, 7),
(1759, 0, 2445, 1260, 1019, 7),
(1760, 0, 2445, 1262, 1016, 7),
(1761, 0, 2445, 1260, 1023, 7),
(1762, 0, 2445, 1264, 1019, 7),
(1763, 0, 2445, 1266, 1016, 7),
(1764, 0, 2445, 1260, 1024, 7),
(1765, 0, 2445, 1260, 1025, 7),
(1766, 0, 2445, 1263, 1026, 7),
(1767, 0, 2445, 1266, 1026, 7),
(1768, 0, 2447, 1026, 1214, 7),
(1769, 0, 2447, 1030, 1214, 6),
(1770, 0, 2447, 1033, 1213, 7),
(1771, 0, 2448, 1031, 1226, 7),
(1772, 0, 2448, 1033, 1224, 6),
(1773, 0, 2448, 1036, 1225, 7),
(1774, 0, 2449, 1029, 1234, 5),
(1775, 0, 2449, 1031, 1234, 6),
(1776, 0, 2449, 1034, 1234, 5),
(1777, 0, 2449, 1032, 1234, 6),
(1778, 0, 2449, 1033, 1234, 6),
(1779, 0, 2449, 1031, 1236, 7),
(1780, 0, 2449, 1033, 1236, 7),
(1781, 0, 2449, 1035, 1236, 7),
(1782, 0, 2450, 1022, 1236, 6),
(1783, 0, 2450, 1023, 1236, 6),
(1784, 0, 2450, 1021, 1236, 7),
(1785, 0, 2450, 1021, 1239, 7),
(1786, 0, 2450, 1022, 1239, 7),
(1787, 0, 2450, 1023, 1239, 7),
(1788, 0, 2450, 1024, 1236, 6),
(1789, 0, 2452, 1014, 1237, 6),
(1790, 0, 2452, 1015, 1237, 6),
(1791, 0, 2452, 1013, 1239, 7),
(1792, 0, 2452, 1014, 1239, 7),
(1793, 0, 2452, 1015, 1239, 7),
(1794, 0, 2452, 1016, 1237, 6),
(1795, 0, 2453, 1007, 1232, 6),
(1796, 0, 2453, 1003, 1239, 7),
(1797, 0, 2453, 1004, 1237, 6),
(1798, 0, 2453, 1005, 1237, 6),
(1799, 0, 2453, 1006, 1237, 6),
(1800, 0, 2453, 1005, 1239, 7),
(1801, 0, 2453, 1007, 1236, 7),
(1802, 0, 2453, 1009, 1239, 7),
(1803, 0, 2454, 989, 1240, 6),
(1804, 0, 2454, 991, 1240, 6),
(1805, 0, 2454, 991, 1243, 7),
(1806, 0, 2454, 992, 1245, 6),
(1807, 0, 2454, 995, 1245, 7),
(1808, 0, 2454, 988, 1249, 5),
(1809, 0, 2454, 990, 1249, 5),
(1810, 0, 2454, 988, 1249, 6),
(1811, 0, 2454, 991, 1249, 6),
(1812, 0, 2454, 989, 1249, 7),
(1813, 0, 2454, 993, 1249, 7),
(1814, 0, 2455, 1006, 1245, 7),
(1815, 0, 2455, 1008, 1245, 7),
(1816, 0, 2455, 1010, 1245, 7),
(1817, 0, 2455, 1007, 1248, 6),
(1818, 0, 2455, 1008, 1248, 6),
(1819, 0, 2455, 1009, 1248, 6),
(1820, 0, 2456, 1015, 1245, 7),
(1821, 0, 2456, 1016, 1245, 7),
(1822, 0, 2456, 1017, 1245, 7),
(1823, 0, 2456, 1016, 1252, 7),
(1824, 0, 2456, 1015, 1256, 7),
(1825, 0, 2457, 1021, 1245, 7),
(1826, 0, 2457, 1022, 1245, 7),
(1827, 0, 2457, 1023, 1245, 7),
(1828, 0, 2458, 1025, 1256, 7),
(1829, 0, 2459, 1028, 1259, 7),
(1830, 0, 2459, 1030, 1259, 7),
(1831, 0, 2459, 1032, 1259, 7),
(1832, 0, 2460, 1036, 1247, 7),
(1833, 0, 2460, 1039, 1247, 7),
(1834, 0, 2460, 1041, 1252, 7),
(1835, 0, 2461, 1043, 1263, 7),
(1836, 0, 2462, 1046, 1200, 7),
(1837, 0, 2462, 1047, 1200, 7),
(1838, 0, 2462, 1048, 1200, 7),
(1839, 0, 2463, 1047, 1209, 6),
(1840, 0, 2463, 1048, 1210, 7),
(1841, 0, 2463, 1050, 1218, 6),
(1842, 0, 2464, 1045, 1221, 7),
(1843, 0, 2464, 1047, 1224, 7),
(1844, 0, 2464, 1051, 1224, 7),
(1845, 0, 2465, 1055, 1224, 7),
(1846, 0, 2465, 1057, 1218, 7),
(1847, 0, 2465, 1057, 1224, 7),
(1848, 0, 2465, 1058, 1224, 7),
(1849, 0, 2466, 1059, 1227, 7),
(1850, 0, 2467, 1048, 1231, 6),
(1851, 0, 2467, 1053, 1231, 6),
(1852, 0, 2467, 1046, 1235, 7),
(1853, 0, 2467, 1048, 1237, 6),
(1854, 0, 2467, 1049, 1237, 7),
(1855, 0, 2467, 1052, 1237, 6),
(1856, 0, 2467, 1053, 1237, 7),
(1857, 0, 2468, 1056, 1241, 7),
(1858, 0, 2468, 1060, 1241, 6),
(1859, 0, 2469, 1074, 1233, 6),
(1860, 0, 2469, 1077, 1233, 7),
(1861, 0, 2470, 1074, 1241, 6),
(1862, 0, 2470, 1077, 1240, 7),
(1863, 0, 2471, 1071, 1251, 6),
(1864, 0, 2471, 1067, 1255, 6),
(1865, 0, 2471, 1069, 1255, 6),
(1866, 0, 2471, 1068, 1255, 7),
(1867, 0, 2471, 1074, 1250, 7),
(1868, 0, 2471, 1072, 1255, 7),
(1869, 0, 2472, 1056, 1247, 7),
(1870, 0, 2472, 1060, 1248, 6),
(1871, 0, 2472, 1056, 1252, 6),
(1872, 0, 2472, 1058, 1252, 6),
(1873, 0, 2474, 1058, 1256, 5),
(1874, 0, 2474, 1057, 1259, 6),
(1875, 0, 2474, 1058, 1259, 7),
(1876, 0, 2474, 1061, 1256, 5),
(1877, 0, 2474, 1062, 1259, 6),
(1878, 0, 2474, 1060, 1259, 7),
(1879, 0, 2474, 1062, 1259, 7),
(1880, 0, 2475, 1093, 1230, 5),
(1881, 0, 2475, 1091, 1235, 6),
(1882, 0, 2475, 1089, 1232, 7),
(1883, 0, 2475, 1093, 1233, 7),
(1884, 0, 2475, 1096, 1235, 6),
(1885, 0, 2475, 1099, 1235, 6),
(1886, 0, 2476, 1092, 1242, 7),
(1887, 0, 2476, 1088, 1246, 7),
(1888, 0, 2476, 1092, 1244, 6),
(1889, 0, 2477, 1085, 1255, 7),
(1890, 0, 2477, 1091, 1252, 6),
(1891, 0, 2478, 1085, 1261, 7),
(1892, 0, 2478, 1089, 1261, 6),
(1893, 0, 2478, 1092, 1263, 7),
(1894, 0, 2478, 1091, 1265, 7),
(1895, 0, 2478, 1092, 1265, 6),
(1896, 0, 2478, 1095, 1265, 6),
(1897, 0, 2478, 1095, 1265, 7),
(1898, 0, 2479, 1081, 1265, 7),
(1899, 0, 2479, 1079, 1271, 7),
(1900, 0, 2479, 1083, 1269, 7),
(1901, 0, 2480, 1085, 1288, 7),
(1902, 0, 2480, 1087, 1288, 7),
(1903, 0, 2481, 1070, 1285, 7),
(1904, 0, 2481, 1071, 1285, 7),
(1905, 0, 2481, 1064, 1288, 6),
(1906, 0, 2481, 1071, 1288, 6),
(1907, 0, 2481, 1073, 1290, 6),
(1908, 0, 2482, 1071, 1295, 6),
(1909, 0, 2482, 1071, 1298, 6),
(1910, 0, 2482, 1070, 1296, 7),
(1911, 0, 2482, 1071, 1301, 6),
(1912, 0, 2482, 1067, 1305, 7),
(1913, 0, 2482, 1071, 1306, 7),
(1914, 0, 2482, 1074, 1297, 7),
(1915, 0, 2482, 1072, 1305, 6),
(1916, 0, 2483, 1057, 1298, 6),
(1917, 0, 2483, 1057, 1298, 7),
(1918, 0, 2484, 1051, 1303, 6),
(1919, 0, 2484, 1051, 1305, 6),
(1920, 0, 2484, 1051, 1307, 6),
(1921, 0, 2485, 1051, 1312, 6),
(1922, 0, 2485, 1051, 1314, 6),
(1923, 0, 2485, 1053, 1313, 7),
(1924, 0, 2485, 1051, 1316, 6),
(1925, 0, 2485, 1051, 1322, 7),
(1926, 0, 2485, 1053, 1320, 7),
(1927, 0, 2485, 1056, 1322, 7),
(1928, 0, 2486, 1037, 1317, 7),
(1929, 0, 2486, 1037, 1327, 7),
(1930, 0, 2486, 1041, 1317, 7),
(1931, 0, 2486, 1042, 1317, 7),
(1932, 0, 2486, 1043, 1317, 7),
(1933, 0, 2486, 1047, 1317, 7),
(1934, 0, 2486, 1041, 1320, 6),
(1935, 0, 2486, 1043, 1320, 6),
(1936, 0, 2486, 1045, 1320, 6),
(1937, 0, 2486, 1045, 1320, 7),
(1938, 0, 2486, 1046, 1327, 7),
(1939, 0, 2486, 1048, 1325, 6),
(1940, 0, 2487, 1035, 1314, 7),
(1941, 0, 2487, 1035, 1315, 7),
(1942, 0, 2487, 1031, 1316, 6),
(1943, 0, 2487, 1031, 1317, 6),
(1944, 0, 2487, 1031, 1318, 6),
(1945, 0, 2487, 1035, 1316, 7),
(1946, 0, 2487, 1025, 1321, 6),
(1947, 0, 2487, 1029, 1321, 6),
(1948, 0, 2488, 1031, 1308, 6),
(1949, 0, 2488, 1031, 1309, 6),
(1950, 0, 2488, 1031, 1310, 6),
(1951, 0, 2488, 1030, 1308, 7),
(1952, 0, 2488, 1034, 1308, 7),
(1953, 0, 2489, 1026, 1301, 7),
(1954, 0, 2489, 1031, 1300, 6),
(1955, 0, 2489, 1031, 1303, 6),
(1956, 0, 2489, 1034, 1301, 7),
(1957, 0, 2490, 1036, 1298, 6),
(1958, 0, 2490, 1039, 1298, 6),
(1959, 0, 2490, 1037, 1298, 7),
(1960, 0, 2490, 1038, 1298, 7),
(1961, 0, 2490, 1039, 1298, 7),
(1962, 0, 2491, 1044, 1293, 7),
(1963, 0, 2491, 1045, 1293, 7),
(1964, 0, 2491, 1046, 1293, 7),
(1965, 0, 2492, 1085, 1305, 7),
(1966, 0, 2492, 1089, 1304, 6),
(1967, 0, 2492, 1089, 1306, 6),
(1968, 0, 2492, 1095, 1305, 6),
(1969, 0, 2492, 1093, 1307, 7),
(1970, 0, 2492, 1089, 1308, 6),
(1971, 0, 2492, 1095, 1311, 6),
(1972, 0, 2492, 1091, 1312, 6),
(1973, 0, 2492, 1094, 1313, 7),
(1974, 0, 2493, 1080, 1315, 7),
(1975, 0, 2493, 1086, 1315, 6),
(1976, 0, 2493, 1077, 1317, 7),
(1977, 0, 2493, 1080, 1322, 6),
(1978, 0, 2493, 1084, 1322, 6),
(1979, 0, 2493, 1086, 1320, 6),
(1980, 0, 2494, 1073, 1322, 7),
(1981, 0, 2494, 1074, 1322, 7),
(1982, 0, 2494, 1075, 1322, 7),
(1983, 0, 2494, 1074, 1331, 7),
(1984, 0, 2494, 1079, 1331, 7),
(1985, 0, 2494, 1084, 1331, 7),
(1986, 0, 2495, 1069, 1322, 7),
(1987, 0, 2495, 1070, 1322, 7),
(1988, 0, 2496, 1062, 1314, 6),
(1989, 0, 2496, 1062, 1317, 6),
(1990, 0, 2496, 1062, 1318, 6),
(1991, 0, 2496, 1062, 1319, 6),
(1992, 0, 2496, 1065, 1319, 7),
(1993, 0, 2497, 1064, 1307, 6),
(1994, 0, 2497, 1062, 1309, 6),
(1995, 0, 2497, 1062, 1310, 6),
(1996, 0, 2497, 1062, 1311, 6),
(1997, 0, 2497, 1065, 1311, 7),
(1998, 0, 2499, 1054, 1204, 6),
(1999, 0, 2499, 1059, 1201, 7),
(2000, 0, 2499, 1058, 1205, 6),
(2001, 0, 2499, 1059, 1205, 6),
(2002, 0, 2499, 1057, 1204, 7),
(2003, 0, 2499, 1060, 1205, 6),
(2004, 0, 2500, 992, 1211, 6),
(2005, 0, 2500, 992, 1211, 7),
(2006, 0, 2500, 998, 1212, 7),
(2007, 0, 2500, 989, 1216, 6),
(2008, 0, 2500, 993, 1219, 7),
(2009, 0, 2501, 995, 1205, 6),
(2010, 0, 2501, 993, 1205, 7),
(2011, 0, 2501, 998, 1205, 7),
(2012, 0, 2502, 998, 1199, 7),
(2013, 0, 2504, 1078, 1446, 6),
(2014, 0, 2504, 1080, 1454, 5),
(2015, 0, 2504, 1080, 1455, 5),
(2016, 0, 2504, 1078, 1457, 6),
(2017, 0, 2504, 1080, 1456, 5),
(2018, 0, 2504, 1083, 1456, 6),
(2019, 0, 2505, 1086, 1454, 6),
(2020, 0, 2505, 1087, 1453, 6),
(2021, 0, 2505, 1088, 1451, 5),
(2022, 0, 2505, 1089, 1451, 5),
(2023, 0, 2505, 1090, 1451, 5),
(2024, 0, 2505, 1090, 1454, 6),
(2025, 0, 2505, 1091, 1454, 6),
(2026, 0, 2505, 1092, 1454, 6),
(2027, 0, 2506, 1100, 1445, 5),
(2028, 0, 2506, 1098, 1448, 5),
(2029, 0, 2506, 1096, 1449, 6),
(2030, 0, 2506, 1101, 1449, 6),
(2031, 0, 2506, 1102, 1448, 6),
(2032, 0, 2506, 1102, 1451, 6),
(2033, 0, 2506, 1097, 1453, 5),
(2034, 0, 2506, 1096, 1453, 6),
(2035, 0, 2506, 1099, 1453, 6),
(2036, 0, 2506, 1100, 1453, 5),
(2037, 0, 2506, 1101, 1453, 6),
(2038, 0, 2507, 1083, 1461, 5),
(2039, 0, 2507, 1083, 1463, 5),
(2040, 0, 2507, 1086, 1460, 6),
(2041, 0, 2507, 1086, 1463, 6),
(2042, 0, 2507, 1079, 1467, 5),
(2043, 0, 2507, 1079, 1467, 6),
(2044, 0, 2507, 1082, 1467, 5),
(2045, 0, 2507, 1083, 1465, 5),
(2046, 0, 2507, 1084, 1467, 6),
(2047, 0, 2507, 1086, 1464, 6),
(2048, 0, 2507, 1086, 1465, 6),
(2049, 0, 2508, 1089, 1487, 6),
(2050, 0, 2508, 1093, 1486, 6),
(2051, 0, 2509, 1100, 1503, 6),
(2052, 0, 2509, 1104, 1495, 6),
(2053, 0, 2509, 1104, 1496, 6),
(2054, 0, 2509, 1104, 1498, 6),
(2055, 0, 2510, 1099, 1489, 6),
(2056, 0, 2510, 1100, 1489, 6),
(2057, 0, 2510, 1101, 1489, 6),
(2058, 0, 2511, 1107, 1483, 6),
(2059, 0, 2511, 1111, 1481, 6),
(2060, 0, 2511, 1113, 1481, 6),
(2061, 0, 2511, 1115, 1481, 6),
(2062, 0, 2511, 1113, 1484, 5),
(2063, 0, 2511, 1115, 1487, 5),
(2064, 0, 2511, 1116, 1486, 5),
(2065, 0, 2511, 1116, 1491, 5),
(2066, 0, 2512, 1125, 1479, 6),
(2067, 0, 2512, 1127, 1483, 6),
(2068, 0, 2513, 1127, 1490, 6),
(2069, 0, 2513, 1128, 1493, 6),
(2070, 0, 2513, 1131, 1494, 6),
(2071, 0, 2514, 1118, 1493, 5),
(2072, 0, 2514, 1118, 1494, 5),
(2073, 0, 2514, 1118, 1495, 5),
(2074, 0, 2515, 1087, 1489, 5),
(2075, 0, 2515, 1089, 1483, 5),
(2076, 0, 2515, 1093, 1487, 5),
(2077, 0, 2515, 1093, 1489, 5),
(2078, 0, 2516, 1102, 1494, 5),
(2079, 0, 2516, 1099, 1496, 5),
(2080, 0, 2516, 1100, 1498, 5),
(2081, 0, 2516, 1102, 1498, 5),
(2082, 0, 2516, 1104, 1491, 5),
(2083, 0, 2516, 1104, 1493, 5),
(2084, 0, 2516, 1104, 1497, 5),
(2085, 0, 2517, 1094, 1492, 4),
(2086, 0, 2517, 1094, 1495, 4),
(2087, 0, 2517, 1100, 1495, 4),
(2088, 0, 2517, 1101, 1495, 4),
(2089, 0, 2517, 1102, 1495, 4),
(2090, 0, 2517, 1096, 1497, 3),
(2091, 0, 2517, 1104, 1491, 3),
(2092, 0, 2517, 1104, 1491, 4),
(2093, 0, 2517, 1104, 1494, 4),
(2094, 0, 2518, 1128, 1479, 5),
(2095, 0, 2518, 1122, 1483, 5),
(2096, 0, 2518, 1125, 1481, 5),
(2097, 0, 2519, 1135, 1486, 5),
(2098, 0, 2519, 1135, 1490, 5),
(2099, 0, 2520, 1133, 1478, 7),
(2100, 0, 2520, 1138, 1473, 6),
(2101, 0, 2520, 1139, 1473, 6),
(2102, 0, 2520, 1140, 1473, 6),
(2103, 0, 2520, 1142, 1473, 7),
(2104, 0, 2520, 1142, 1474, 7),
(2105, 0, 2520, 1142, 1475, 7),
(2106, 0, 2520, 1140, 1477, 7),
(2107, 0, 2521, 1154, 1467, 6),
(2108, 0, 2521, 1163, 1467, 6),
(2109, 0, 2521, 1163, 1467, 7),
(2110, 0, 2521, 1163, 1470, 6),
(2111, 0, 2521, 1161, 1471, 7),
(2112, 0, 2521, 1163, 1470, 7),
(2113, 0, 2521, 1158, 1474, 6),
(2114, 0, 2521, 1163, 1474, 6),
(2115, 0, 2521, 1163, 1474, 7),
(2116, 0, 2521, 1158, 1477, 6),
(2117, 0, 2521, 1158, 1478, 6),
(2118, 0, 2521, 1163, 1477, 6),
(2119, 0, 2521, 1163, 1477, 7),
(2120, 0, 2522, 1156, 1486, 7),
(2121, 0, 2522, 1158, 1484, 7),
(2122, 0, 2522, 1163, 1484, 7),
(2123, 0, 2522, 1163, 1487, 7),
(2124, 0, 2522, 1154, 1488, 7),
(2125, 0, 2522, 1154, 1489, 7),
(2126, 0, 2522, 1154, 1490, 7),
(2127, 0, 2522, 1161, 1488, 6),
(2128, 0, 2522, 1157, 1494, 7),
(2129, 0, 2522, 1158, 1492, 7),
(2130, 0, 2522, 1161, 1494, 7),
(2131, 0, 2522, 1163, 1492, 7),
(2132, 0, 2523, 1143, 1481, 7),
(2133, 0, 2523, 1140, 1484, 6),
(2134, 0, 2523, 1140, 1485, 6),
(2135, 0, 2523, 1140, 1486, 6),
(2136, 0, 2523, 1143, 1485, 7),
(2137, 0, 2523, 1143, 1486, 7),
(2138, 0, 2523, 1139, 1491, 7),
(2139, 0, 2523, 1142, 1491, 7),
(2140, 0, 2523, 1143, 1490, 7),
(2141, 0, 2524, 1144, 1505, 6),
(2142, 0, 2524, 1144, 1506, 6),
(2143, 0, 2524, 1144, 1507, 6),
(2144, 0, 2524, 1146, 1505, 7),
(2145, 0, 2524, 1140, 1510, 7),
(2146, 0, 2524, 1141, 1510, 7),
(2147, 0, 2524, 1142, 1510, 7),
(2148, 0, 2524, 1153, 1505, 6),
(2149, 0, 2525, 1153, 1511, 7),
(2150, 0, 2525, 1153, 1518, 7),
(2151, 0, 2526, 1140, 1516, 7),
(2152, 0, 2526, 1141, 1516, 7),
(2153, 0, 2526, 1142, 1516, 7),
(2154, 0, 2526, 1144, 1520, 6),
(2155, 0, 2526, 1144, 1521, 6),
(2156, 0, 2526, 1144, 1522, 6),
(2157, 0, 2526, 1146, 1522, 7),
(2158, 0, 2526, 1143, 1525, 7),
(2159, 0, 2526, 1147, 1525, 6),
(2160, 0, 2526, 1151, 1525, 6),
(2161, 0, 2526, 1153, 1523, 7),
(2162, 0, 2527, 1122, 1523, 7),
(2163, 0, 2527, 1123, 1523, 7),
(2164, 0, 2527, 1124, 1523, 7),
(2165, 0, 2528, 1129, 1523, 7),
(2166, 0, 2528, 1130, 1523, 7),
(2167, 0, 2528, 1131, 1523, 7),
(2168, 0, 2529, 1135, 1520, 7),
(2169, 0, 2529, 1135, 1531, 7),
(2170, 0, 2529, 1136, 1520, 7),
(2171, 0, 2529, 1137, 1520, 7),
(2172, 0, 2529, 1139, 1527, 7),
(2173, 0, 2529, 1137, 1531, 7),
(2174, 0, 2529, 1139, 1530, 7),
(2175, 0, 2530, 1115, 1514, 6),
(2176, 0, 2530, 1113, 1513, 7),
(2177, 0, 2530, 1118, 1513, 7),
(2178, 0, 2530, 1112, 1516, 6),
(2179, 0, 2530, 1114, 1516, 7),
(2180, 0, 2530, 1115, 1516, 7),
(2181, 0, 2530, 1119, 1516, 6),
(2182, 0, 2530, 1116, 1516, 7),
(2183, 0, 2531, 1123, 1516, 7),
(2184, 0, 2531, 1124, 1516, 7),
(2185, 0, 2531, 1125, 1516, 7),
(2186, 0, 2532, 1127, 1498, 7),
(2187, 0, 2532, 1123, 1501, 6),
(2188, 0, 2532, 1123, 1502, 6),
(2189, 0, 2532, 1123, 1503, 6),
(2190, 0, 2532, 1122, 1502, 7),
(2191, 0, 2532, 1127, 1500, 7),
(2192, 0, 2532, 1127, 1502, 7),
(2193, 0, 2532, 1127, 1503, 7),
(2194, 0, 2533, 1110, 1524, 7),
(2195, 0, 2533, 1111, 1524, 7),
(2196, 0, 2533, 1110, 1529, 6),
(2197, 0, 2534, 1097, 1526, 7),
(2198, 0, 2534, 1098, 1526, 7),
(2199, 0, 2534, 1093, 1530, 7),
(2200, 0, 2535, 1086, 1536, 7),
(2201, 0, 2535, 1086, 1537, 7),
(2202, 0, 2535, 1086, 1538, 7),
(2203, 0, 2535, 1100, 1536, 7),
(2204, 0, 2535, 1100, 1538, 7),
(2205, 0, 2535, 1089, 1540, 7),
(2206, 0, 2535, 1094, 1540, 7),
(2207, 0, 2535, 1098, 1540, 7),
(2208, 0, 2536, 1076, 1538, 7),
(2209, 0, 2536, 1078, 1539, 7),
(2210, 0, 2536, 1079, 1539, 7),
(2211, 0, 2536, 1080, 1539, 7),
(2212, 0, 2536, 1078, 1547, 6),
(2213, 0, 2536, 1082, 1545, 6),
(2214, 0, 2536, 1082, 1545, 7),
(2215, 0, 2537, 1062, 1526, 7),
(2216, 0, 2537, 1060, 1534, 7),
(2217, 0, 2538, 1071, 1526, 7),
(2218, 0, 2538, 1075, 1528, 7),
(2219, 0, 2538, 1075, 1532, 7),
(2220, 0, 2539, 1062, 1521, 7),
(2221, 0, 2540, 1075, 1516, 7),
(2222, 0, 2540, 1071, 1521, 7),
(2223, 0, 2540, 1075, 1520, 7),
(2224, 0, 2541, 1062, 1521, 6),
(2225, 0, 2542, 1075, 1516, 6),
(2226, 0, 2542, 1071, 1521, 6),
(2227, 0, 2542, 1075, 1520, 6),
(2228, 0, 2543, 1062, 1526, 6),
(2229, 0, 2543, 1060, 1534, 6),
(2230, 0, 2544, 1071, 1526, 6),
(2231, 0, 2544, 1075, 1528, 6),
(2232, 0, 2544, 1075, 1532, 6),
(2233, 0, 2545, 1060, 1526, 5),
(2234, 0, 2545, 1068, 1524, 5),
(2235, 0, 2546, 1072, 1528, 5),
(2236, 0, 2546, 1075, 1529, 5),
(2237, 0, 2546, 1075, 1532, 5),
(2238, 0, 2547, 1070, 1513, 5),
(2239, 0, 2547, 1066, 1517, 5),
(2240, 0, 2547, 1073, 1513, 5),
(2241, 0, 2547, 1075, 1515, 5),
(2242, 0, 2547, 1075, 1519, 5),
(2243, 0, 2547, 1072, 1520, 5),
(2244, 0, 2548, 1067, 1507, 7),
(2245, 0, 2548, 1067, 1509, 6),
(2246, 0, 2548, 1070, 1511, 6),
(2247, 0, 2548, 1070, 1511, 7),
(2248, 0, 2548, 1072, 1506, 6),
(2249, 0, 2548, 1072, 1507, 6),
(2250, 0, 2548, 1075, 1506, 7),
(2251, 0, 2548, 1075, 1507, 7),
(2252, 0, 2548, 1072, 1508, 6),
(2253, 0, 2548, 1073, 1511, 7),
(2254, 0, 2548, 1075, 1508, 7),
(2255, 0, 2549, 1065, 1494, 7),
(2256, 0, 2549, 1063, 1496, 7),
(2257, 0, 2549, 1073, 1495, 7),
(2258, 0, 2549, 1073, 1496, 7),
(2259, 0, 2549, 1073, 1497, 7),
(2260, 0, 2550, 1063, 1491, 6),
(2261, 0, 2550, 1067, 1491, 6),
(2262, 0, 2550, 1071, 1491, 6),
(2263, 0, 2550, 1064, 1500, 6),
(2264, 0, 2551, 1069, 1498, 6),
(2265, 0, 2551, 1070, 1498, 6),
(2266, 0, 2551, 1071, 1498, 6),
(2267, 0, 2551, 1073, 1494, 6),
(2268, 0, 2551, 1073, 1496, 6),
(2269, 0, 2552, 1082, 1494, 7),
(2270, 0, 2552, 1082, 1495, 7),
(2271, 0, 2552, 1086, 1493, 6),
(2272, 0, 2552, 1086, 1494, 6),
(2273, 0, 2552, 1086, 1495, 6),
(2274, 0, 2552, 1082, 1496, 7),
(2275, 0, 2552, 1085, 1499, 7),
(2276, 0, 2552, 1086, 1496, 7),
(2277, 0, 2552, 1090, 1492, 6),
(2278, 0, 2552, 1091, 1495, 7),
(2279, 0, 2552, 1089, 1499, 7),
(2280, 0, 2552, 1091, 1497, 7),
(2281, 0, 2553, 1087, 1501, 7),
(2282, 0, 2553, 1092, 1501, 7),
(2283, 0, 2553, 1089, 1506, 6),
(2284, 0, 2553, 1089, 1505, 7),
(2285, 0, 2553, 1093, 1509, 6),
(2286, 0, 2554, 1090, 1514, 7),
(2287, 0, 2554, 1094, 1515, 7),
(2288, 0, 2554, 1102, 1515, 7),
(2289, 0, 2554, 1090, 1517, 7),
(2290, 0, 2554, 1093, 1518, 6),
(2291, 0, 2554, 1095, 1518, 7),
(2292, 0, 2554, 1097, 1518, 6),
(2293, 0, 2554, 1098, 1518, 7),
(2294, 0, 2554, 1102, 1518, 6),
(2295, 0, 2554, 1101, 1518, 7),
(2296, 0, 2554, 1104, 1512, 6),
(2297, 0, 2554, 1104, 1513, 7),
(2298, 0, 2554, 1104, 1516, 6),
(2299, 0, 2557, 858, 234, 7),
(2300, 0, 2558, 816, 235, 7),
(2301, 0, 2558, 818, 234, 7),
(2302, 0, 2558, 819, 234, 7),
(2303, 0, 2558, 821, 234, 7),
(2304, 0, 2558, 823, 234, 7),
(2305, 0, 2558, 816, 236, 7),
(2306, 0, 2558, 822, 238, 7),
(2307, 0, 2558, 824, 237, 7),
(2308, 0, 2558, 818, 241, 7),
(2309, 0, 2558, 818, 242, 7),
(2310, 0, 2558, 820, 243, 7),
(2311, 0, 2558, 822, 243, 7),
(2312, 0, 2558, 824, 240, 7),
(2313, 0, 2558, 824, 241, 7),
(2314, 0, 2559, 816, 219, 7),
(2315, 0, 2559, 817, 218, 7),
(2316, 0, 2559, 819, 218, 7),
(2317, 0, 2559, 821, 218, 7),
(2318, 0, 2559, 822, 218, 7),
(2319, 0, 2559, 823, 218, 7),
(2320, 0, 2559, 816, 220, 7),
(2321, 0, 2559, 824, 221, 7),
(2322, 0, 2560, 815, 225, 7),
(2323, 0, 2560, 816, 225, 7),
(2324, 0, 2560, 816, 226, 7),
(2325, 0, 2560, 819, 227, 7),
(2326, 0, 2560, 821, 227, 7),
(2327, 0, 2560, 822, 227, 7),
(2328, 0, 2561, 816, 205, 7),
(2329, 0, 2561, 816, 206, 7),
(2330, 0, 2561, 821, 208, 7),
(2331, 0, 2562, 821, 207, 6),
(2332, 0, 2562, 816, 209, 6),
(2333, 0, 2562, 816, 210, 6),
(2334, 0, 2563, 821, 208, 5),
(2335, 0, 2564, 832, 209, 6),
(2336, 0, 2564, 832, 210, 6),
(2337, 0, 2564, 833, 211, 6),
(2338, 0, 2564, 834, 211, 6),
(2339, 0, 2564, 836, 209, 6),
(2340, 0, 2565, 845, 206, 6),
(2341, 0, 2565, 845, 207, 6),
(2342, 0, 2565, 839, 209, 6),
(2343, 0, 2565, 844, 209, 6),
(2344, 0, 2565, 844, 210, 6),
(2345, 0, 2565, 845, 209, 6),
(2346, 0, 2566, 836, 209, 5),
(2347, 0, 2567, 845, 206, 5),
(2348, 0, 2567, 839, 209, 5),
(2349, 0, 2567, 845, 208, 5),
(2350, 0, 2567, 845, 209, 5),
(2351, 0, 2568, 853, 205, 6),
(2352, 0, 2568, 853, 206, 6),
(2353, 0, 2568, 854, 205, 6),
(2354, 0, 2568, 854, 206, 6),
(2355, 0, 2568, 854, 211, 6),
(2356, 0, 2568, 857, 211, 6),
(2357, 0, 2568, 858, 211, 6),
(2358, 0, 2568, 859, 211, 6),
(2359, 0, 2568, 860, 211, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_items`
--

CREATE TABLE `tile_items` (
  `tile_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `tile_items`
--

INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(0, 0, 1, 0, 16999, 1, ''),
(0, 0, 2, 0, 17020, 1, ''),
(1, 0, 1, 0, 17020, 1, ''),
(2, 0, 1, 0, 17020, 1, ''),
(3, 0, 1, 0, 17020, 1, ''),
(4, 0, 1, 0, 17020, 1, ''),
(5, 0, 1, 0, 17022, 1, ''),
(6, 0, 1, 0, 17001, 1, ''),
(7, 0, 1, 0, 17022, 1, ''),
(8, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353031272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(9, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353031272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(10, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353031272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(11, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353031272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(12, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353031272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(13, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353031272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(14, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353031272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(15, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353032272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(16, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353032272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(17, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353033272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(18, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353033272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(19, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353033272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(20, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353033272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(21, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353034272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(22, 0, 1, 0, 1251, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353034272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(23, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353034272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(24, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353035272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(25, 0, 1, 0, 1249, 1, ''),
(26, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353035272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(27, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353036272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(28, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353036272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(29, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353037272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(30, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353037272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(31, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353037272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(32, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353038272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(33, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353038272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(34, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353038272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(35, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(36, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331353039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(37, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353130272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(38, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(39, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(40, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(41, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(42, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(43, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323832303020676f6c6420636f696e732e0600646f6f7269640201000000),
(44, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640202000000),
(45, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640201000000),
(46, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323234353020676f6c6420636f696e732e0600646f6f7269640201000000),
(47, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353137272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(48, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353137272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(49, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(50, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313731373520676f6c6420636f696e732e0600646f6f7269640201000000),
(51, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353838323520676f6c6420636f696e732e0600646f6f7269640201000000),
(52, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(53, 0, 1, 0, 17024, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303334353020676f6c6420636f696e732e0600646f6f7269640201000000),
(54, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(55, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640201000000),
(56, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640201000000),
(57, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343236303020676f6c6420636f696e732e0600646f6f7269640201000000),
(58, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(59, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313635303020676f6c6420636f696e732e0600646f6f7269640201000000),
(60, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313635303020676f6c6420636f696e732e0600646f6f7269640201000000),
(61, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640201000000),
(62, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313831323520676f6c6420636f696e732e0600646f6f7269640201000000),
(63, 0, 1, 0, 17026, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038313831323520676f6c6420636f696e732e0600646f6f7269640202000000),
(64, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(65, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(66, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353331272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(67, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353331272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(68, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131333035303020676f6c6420636f696e732e0600646f6f7269640201000000),
(69, 0, 1, 0, 17026, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131333035303020676f6c6420636f696e732e0600646f6f7269640201000000),
(70, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640201000000),
(71, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303436303020676f6c6420636f696e732e0600646f6f7269640202000000),
(72, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303436303020676f6c6420636f696e732e0600646f6f7269640201000000),
(73, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303436303020676f6c6420636f696e732e0600646f6f7269640201000000),
(74, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343932323520676f6c6420636f696e732e0600646f6f7269640201000000),
(75, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343932323520676f6c6420636f696e732e0600646f6f7269640202000000),
(76, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383536303020676f6c6420636f696e732e0600646f6f7269640201000000),
(77, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383536303020676f6c6420636f696e732e0600646f6f7269640201000000),
(78, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353337272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(79, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353337272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(80, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353337272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(81, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343031303020676f6c6420636f696e732e0600646f6f7269640201000000),
(82, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038363237353020676f6c6420636f696e732e0600646f6f7269640201000000),
(83, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343236303020676f6c6420636f696e732e0600646f6f7269640201000000),
(84, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343236303020676f6c6420636f696e732e0600646f6f7269640201000000),
(85, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(86, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(87, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(88, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393633353020676f6c6420636f696e732e0600646f6f7269640201000000),
(89, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363437373520676f6c6420636f696e732e0600646f6f7269640201000000),
(90, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363437373520676f6c6420636f696e732e0600646f6f7269640201000000),
(91, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(92, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303136323520676f6c6420636f696e732e0600646f6f7269640202000000),
(93, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303136323520676f6c6420636f696e732e0600646f6f7269640201000000),
(94, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303136323520676f6c6420636f696e732e0600646f6f7269640202000000),
(95, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(96, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(97, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323031353020676f6c6420636f696e732e0600646f6f7269640201000000),
(98, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039363039323520676f6c6420636f696e732e0600646f6f7269640201000000),
(99, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037393433323520676f6c6420636f696e732e0600646f6f7269640201000000),
(100, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037393433323520676f6c6420636f696e732e0600646f6f7269640201000000),
(101, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(102, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035343434323520676f6c6420636f696e732e0600646f6f7269640201000000),
(103, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035343434323520676f6c6420636f696e732e0600646f6f7269640201000000),
(104, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323732353020676f6c6420636f696e732e0600646f6f7269640201000000),
(105, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353536272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(106, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353537272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(107, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353538272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(108, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353539272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(109, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393735303020676f6c6420636f696e732e0600646f6f7269640201000000),
(110, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323732353020676f6c6420636f696e732e0600646f6f7269640201000000),
(111, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353939373520676f6c6420636f696e732e0600646f6f7269640201000000),
(112, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323732353020676f6c6420636f696e732e0600646f6f7269640201000000),
(113, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640201000000),
(114, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323432373520676f6c6420636f696e732e0600646f6f7269640201000000),
(115, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303339323520676f6c6420636f696e732e0600646f6f7269640202000000),
(116, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303339323520676f6c6420636f696e732e0600646f6f7269640201000000),
(117, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353637272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(118, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353638272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393034303020676f6c6420636f696e732e0600646f6f7269640201000000),
(119, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393034303020676f6c6420636f696e732e0600646f6f7269640201000000),
(120, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(121, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(122, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393034303020676f6c6420636f696e732e0600646f6f7269640201000000),
(123, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353733272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(124, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393032303020676f6c6420636f696e732e0600646f6f7269640202000000),
(125, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383536303020676f6c6420636f696e732e0600646f6f7269640201000000),
(126, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039343930323520676f6c6420636f696e732e0600646f6f7269640201000000),
(127, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393936303020676f6c6420636f696e732e0600646f6f7269640201000000),
(128, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(129, 0, 1, 0, 17001, 1, ''),
(130, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393735303020676f6c6420636f696e732e0600646f6f7269640201000000),
(131, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640201000000),
(132, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383536303020676f6c6420636f696e732e0600646f6f7269640201000000),
(133, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333631373520676f6c6420636f696e732e0600646f6f7269640202000000),
(134, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333631373520676f6c6420636f696e732e0600646f6f7269640201000000),
(135, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036353435303020676f6c6420636f696e732e0600646f6f7269640201000000),
(136, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036353435303020676f6c6420636f696e732e0600646f6f7269640201000000),
(137, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(138, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036353435303020676f6c6420636f696e732e0600646f6f7269640201000000),
(139, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039383137353020676f6c6420636f696e732e0600646f6f7269640201000000),
(140, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e013c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353838272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(141, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323133303020676f6c6420636f696e732e0600646f6f7269640201000000),
(142, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313838303020676f6c6420636f696e732e0600646f6f7269640201000000),
(143, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393631353020676f6c6420636f696e732e0600646f6f7269640201000000),
(144, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393631353020676f6c6420636f696e732e0600646f6f7269640201000000),
(145, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393631353020676f6c6420636f696e732e0600646f6f7269640201000000),
(146, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323133303020676f6c6420636f696e732e0600646f6f7269640201000000),
(147, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(148, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353934272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(149, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353935272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323437353020676f6c6420636f696e732e0600646f6f7269640201000000),
(150, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353936272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323031353020676f6c6420636f696e732e0600646f6f7269640201000000),
(151, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353937272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333032323520676f6c6420636f696e732e0600646f6f7269640201000000),
(152, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353938272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(153, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331353939272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(154, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363030272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393135353020676f6c6420636f696e732e0600646f6f7269640201000000),
(155, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(156, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(157, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(158, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(159, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(160, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(161, 0, 1, 0, 17001, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(162, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(163, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(164, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313335323520676f6c6420636f696e732e0600646f6f7269640201000000),
(165, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373337303020676f6c6420636f696e732e0600646f6f7269640201000000),
(166, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640201000000),
(167, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303334353020676f6c6420636f696e732e0600646f6f7269640201000000),
(168, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640201000000),
(169, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(170, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(171, 0, 1, 0, 16999, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333230353020676f6c6420636f696e732e0600646f6f7269640201000000),
(172, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333039303020676f6c6420636f696e732e0600646f6f7269640201000000),
(173, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303532373520676f6c6420636f696e732e0600646f6f7269640201000000),
(174, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393135353020676f6c6420636f696e732e0600646f6f7269640201000000),
(175, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303532373520676f6c6420636f696e732e0600646f6f7269640201000000),
(176, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(177, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(178, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(179, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(180, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303334353020676f6c6420636f696e732e0600646f6f7269640201000000),
(181, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303136323520676f6c6420636f696e732e0600646f6f7269640202000000),
(182, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303136323520676f6c6420636f696e732e0600646f6f7269640201000000),
(183, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363839303020676f6c6420636f696e732e0600646f6f7269640201000000),
(184, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313731373520676f6c6420636f696e732e0600646f6f7269640201000000),
(185, 0, 1, 0, 17020, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383835373520676f6c6420636f696e732e0600646f6f7269640201000000),
(186, 0, 1, 0, 17022, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331363235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640201000000),
(187, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(188, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(189, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(190, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(191, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(192, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(193, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(194, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(195, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(196, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(197, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363236272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(198, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363237272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(199, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363237272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(200, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363237272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(201, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363237272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(202, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363237272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(203, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363237272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(204, 0, 1, 0, 5304, 1, ''),
(205, 0, 1, 0, 5304, 1, ''),
(206, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(207, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(208, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(209, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(210, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(211, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(212, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(213, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(214, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(215, 0, 1, 0, 5304, 1, ''),
(216, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(217, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(218, 0, 1, 0, 5304, 1, ''),
(219, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363238272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(220, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(221, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(222, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(223, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(224, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(225, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(226, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(227, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(228, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(229, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(230, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(231, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363239272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(232, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(233, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(234, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(235, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(236, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(237, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(238, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(239, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(240, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(241, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(242, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(243, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363330272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(244, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(245, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(246, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(247, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(248, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(249, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(250, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(251, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(252, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(253, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(254, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363332272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(255, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363332272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(256, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363332272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(257, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363332272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(258, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363332272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(259, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363332272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(260, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363332272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(261, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(262, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(263, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(264, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(265, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(266, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(267, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(268, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(269, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(270, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(271, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(272, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(273, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363333272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(274, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363334272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(275, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363334272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(276, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363334272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(277, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363334272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(278, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363334272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(279, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363334272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(280, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(281, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(282, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(283, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(284, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(285, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(286, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(287, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(288, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363335272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(289, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363336272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(290, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363336272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(291, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363336272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(292, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363336272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(293, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363337272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(294, 0, 1, 0, 1250, 1, ''),
(295, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363337272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(296, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363337272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(297, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363337272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(298, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363337272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(299, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363337272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(300, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363337272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(301, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363337272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(302, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363338272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(303, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363338272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(304, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363338272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(305, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363338272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(306, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363338272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(307, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363338272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(308, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363338272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(309, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(310, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(311, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(312, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(313, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(314, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(315, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(316, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(317, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363339272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(318, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(319, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(320, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(321, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(322, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(323, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(324, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(325, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(326, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(327, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(328, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363430272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(329, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363431272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(330, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363431272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(331, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363431272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(332, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363431272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(333, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363431272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(334, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363431272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(335, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363431272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(336, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363431272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(337, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(338, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(339, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(340, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(341, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(342, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(343, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(344, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(345, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(346, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(347, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(348, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363432272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(349, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(350, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(351, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(352, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(353, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(354, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(355, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(356, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(357, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(358, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(359, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(360, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363433272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(361, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363434272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(362, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363434272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(363, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363434272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(364, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363434272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(365, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363434272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(366, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363434272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(367, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363434272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(368, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363434272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(369, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363435272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(370, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363435272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(371, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363435272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(372, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363435272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(373, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363435272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(374, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363435272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(375, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363435272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(376, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363435272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(377, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(378, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(379, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(380, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(381, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(382, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(383, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(384, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(385, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(386, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(387, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(388, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(389, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(390, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(391, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363436272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(392, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(393, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(394, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(395, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(396, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(397, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(398, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(399, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(400, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(401, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363437272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(402, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(403, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(404, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(405, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(406, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(407, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(408, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(409, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(410, 0, 1, 0, 1250, 1, ''),
(411, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(412, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363438272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(413, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363439272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(414, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363439272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(415, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363439272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(416, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363530272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(417, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363530272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(418, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363530272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(419, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363531272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(420, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363531272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(421, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363531272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(422, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363531272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(423, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(424, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(425, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(426, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(427, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(428, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(429, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(430, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(431, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(432, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363533272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(433, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(434, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(435, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(436, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(437, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(438, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(439, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(440, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(441, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(442, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(443, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363534272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(444, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363535272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(445, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363535272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(446, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363535272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(447, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363535272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(448, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363535272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(449, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363535272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(450, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363535272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(451, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363536272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(452, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363536272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(453, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363536272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(454, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363536272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(455, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363537272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(456, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363537272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(457, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363537272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(458, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(459, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(460, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(461, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323732353020676f6c6420636f696e732e0600646f6f7269640201000000),
(462, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323732353020676f6c6420636f696e732e0600646f6f7269640201000000),
(463, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323732353020676f6c6420636f696e732e0600646f6f7269640201000000),
(464, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323732353020676f6c6420636f696e732e0600646f6f7269640201000000),
(465, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363630272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(466, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363630272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(467, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363630272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(468, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363630272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(469, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(470, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(471, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(472, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(473, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(474, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(475, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(476, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(477, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(478, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(479, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(480, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(481, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363634272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(482, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363634272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(483, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363634272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(484, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363634272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(485, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363634272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(486, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363634272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(487, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363634272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(488, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363634272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(489, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(490, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(491, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(492, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(493, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363637272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(494, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363637272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(495, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363637272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(496, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363637272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(497, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363638272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(498, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363638272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(499, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363638272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(500, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363638272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(501, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363638272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(502, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(503, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(504, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(505, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(506, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(507, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(508, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(509, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(510, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(511, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(512, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(513, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(514, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(515, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(516, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(517, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(518, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(519, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(520, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640202000000),
(521, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(522, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(523, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(524, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(525, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(526, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333638353020676f6c6420636f696e732e0600646f6f7269640201000000),
(527, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(528, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(529, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640202000000),
(530, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640202000000),
(531, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(532, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(533, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(534, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(535, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(536, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(537, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(538, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640202000000),
(539, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640203000000),
(540, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640203000000),
(541, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333230353020676f6c6420636f696e732e0600646f6f7269640201000000),
(542, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333230353020676f6c6420636f696e732e0600646f6f7269640202000000),
(543, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333230353020676f6c6420636f696e732e0600646f6f7269640202000000),
(544, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333230353020676f6c6420636f696e732e0600646f6f7269640202000000),
(545, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363739272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(546, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363739272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(547, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363739272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(548, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363739272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(549, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363739272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(550, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(551, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(552, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(553, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(554, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(555, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(556, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(557, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(558, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(559, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(560, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(561, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(562, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(563, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363831272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(564, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640204000000),
(565, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(566, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(567, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(568, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(569, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(570, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(571, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(572, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(573, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(574, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363832272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(575, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(576, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(577, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(578, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(579, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363835272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(580, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363835272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(581, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363835272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(582, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363835272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(583, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(584, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(585, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(586, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(587, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640201000000),
(588, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640202000000),
(589, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640201000000),
(590, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640201000000),
(591, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640201000000),
(592, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363838272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(593, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363838272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(594, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363838272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(595, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363838272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(596, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363838272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(597, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363838272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(598, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363839272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(599, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363839272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(600, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363839272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(601, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363839272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(602, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363839272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(603, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363839272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(604, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363839272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(605, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363930272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(606, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363930272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(607, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363930272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(608, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363930272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(609, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363931272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(610, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363931272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(611, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363931272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(612, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363931272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(613, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363932272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(614, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363932272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(615, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363933272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(616, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363933272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(617, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363933272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(618, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363933272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(619, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363933272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(620, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363934272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(621, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363934272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(622, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363935272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(623, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363935272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(624, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363935272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(625, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363935272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(626, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363935272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(627, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363935272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(628, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363935272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(629, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363936272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(630, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363936272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(631, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363936272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(632, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363937272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(633, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363937272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(634, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363937272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(635, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363938272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(636, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363938272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(637, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363938272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(638, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363939272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(639, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363939272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(640, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363939272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(641, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363939272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(642, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331363939272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(643, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373030272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(644, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373030272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(645, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373030272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(646, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373031272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(647, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373032272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(648, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373032272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(649, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373032272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(650, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373032272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(651, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373032272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(652, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373033272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(653, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373033272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(654, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373033272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(655, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373034272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(656, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373034272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(657, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373035272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(658, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373035272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(659, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373035272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(660, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373035272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(661, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373035272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(662, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373035272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(663, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373036272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(664, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(665, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(666, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(667, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(668, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(669, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(670, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(671, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(672, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373037272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(673, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373038272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(674, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373038272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(675, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373038272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(676, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373038272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(677, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373039272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(678, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373039272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(679, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373039272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(680, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373039272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(681, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373130272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(682, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373130272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(683, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373130272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(684, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373130272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(685, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(686, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(687, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373132272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(688, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373132272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(689, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373133272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(690, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373133272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(691, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373133272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(692, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373133272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(693, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373134272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(694, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373134272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(695, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(696, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(697, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(698, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(699, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(700, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(701, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(702, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(703, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(704, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(705, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(706, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(707, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(708, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(709, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(710, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(711, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(712, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(713, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(714, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(715, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(716, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373135272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(717, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(718, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(719, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(720, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(721, 0, 1, 0, 1252, 1, ''),
(722, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(723, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(724, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(725, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(726, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(727, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(728, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(729, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(730, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373136272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(731, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373137272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(732, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373137272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(733, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373137272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(734, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373138272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(735, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373138272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(736, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373138272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(737, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373138272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(738, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373139272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(739, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373139272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(740, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373139272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(741, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373139272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(742, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373139272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(743, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373230272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(744, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373230272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(745, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373230272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(746, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373231272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(747, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f757365202753616666726f6e2043697479202331373232272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(748, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(749, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640202000000),
(750, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640205000000),
(751, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640203000000),
(752, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640202000000),
(753, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640205000000),
(754, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640203000000),
(755, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640202000000),
(756, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640202000000),
(757, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(758, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640202000000),
(759, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640203000000),
(760, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640203000000),
(761, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640203000000),
(762, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640201000000),
(763, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640201000000),
(764, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640201000000),
(765, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640201000000),
(766, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640202000000),
(767, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039313932373520676f6c6420636f696e732e0600646f6f7269640201000000),
(768, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333931353020676f6c6420636f696e732e0600646f6f7269640202000000),
(769, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333931353020676f6c6420636f696e732e0600646f6f7269640201000000),
(770, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333931353020676f6c6420636f696e732e0600646f6f7269640201000000),
(771, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333931353020676f6c6420636f696e732e0600646f6f7269640202000000),
(772, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333931353020676f6c6420636f696e732e0600646f6f7269640201000000),
(773, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333931353020676f6c6420636f696e732e0600646f6f7269640201000000),
(774, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(775, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(776, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(777, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(778, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640203000000),
(779, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640203000000),
(780, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640202000000),
(781, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640203000000),
(782, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640202000000),
(783, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640203000000),
(784, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(785, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(786, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(787, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(788, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(789, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(790, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(791, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(792, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(793, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640202000000),
(794, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640202000000),
(795, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(796, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640202000000),
(797, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(798, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640202000000),
(799, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(800, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(801, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(802, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640202000000),
(803, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640202000000),
(804, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(805, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(806, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640203000000),
(807, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640203000000),
(808, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(809, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(810, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(811, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640202000000),
(812, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640202000000),
(813, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383439323520676f6c6420636f696e732e0600646f6f7269640203000000),
(814, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383439323520676f6c6420636f696e732e0600646f6f7269640202000000),
(815, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383439323520676f6c6420636f696e732e0600646f6f7269640204000000),
(816, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383439323520676f6c6420636f696e732e0600646f6f7269640201000000),
(817, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(818, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(819, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(820, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(821, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(822, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(823, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(824, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(825, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(826, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(827, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(828, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640202000000),
(829, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(830, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036353435303020676f6c6420636f696e732e0600646f6f7269640202000000),
(831, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036353435303020676f6c6420636f696e732e0600646f6f7269640201000000),
(832, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036353435303020676f6c6420636f696e732e0600646f6f7269640202000000),
(833, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036353435303020676f6c6420636f696e732e0600646f6f7269640202000000),
(834, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013d00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383137272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(835, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323532323520676f6c6420636f696e732e0600646f6f7269640201000000),
(836, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323532323520676f6c6420636f696e732e0600646f6f7269640201000000),
(837, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323532323520676f6c6420636f696e732e0600646f6f7269640202000000),
(838, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323532323520676f6c6420636f696e732e0600646f6f7269640201000000),
(839, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323532323520676f6c6420636f696e732e0600646f6f7269640201000000),
(840, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323532323520676f6c6420636f696e732e0600646f6f7269640201000000),
(841, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323532323520676f6c6420636f696e732e0600646f6f7269640202000000),
(842, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039323532323520676f6c6420636f696e732e0600646f6f7269640202000000),
(843, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363136303020676f6c6420636f696e732e0600646f6f7269640202000000),
(844, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363136303020676f6c6420636f696e732e0600646f6f7269640201000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(845, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363136303020676f6c6420636f696e732e0600646f6f7269640201000000),
(846, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363136303020676f6c6420636f696e732e0600646f6f7269640201000000),
(847, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363136303020676f6c6420636f696e732e0600646f6f7269640203000000),
(848, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363136303020676f6c6420636f696e732e0600646f6f7269640201000000),
(849, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(850, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(851, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343639323520676f6c6420636f696e732e0600646f6f7269640201000000),
(852, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343639323520676f6c6420636f696e732e0600646f6f7269640201000000),
(853, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520275665726d696c696f6e2043697479202331383231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343639323520676f6c6420636f696e732e0600646f6f7269640201000000),
(854, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(855, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(856, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(857, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(858, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(859, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(860, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(861, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(862, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(863, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(864, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(865, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640203000000),
(866, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(867, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(868, 0, 1, 0, 11811, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(869, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(870, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(871, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(872, 0, 1, 0, 11811, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(873, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(874, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(875, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(876, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(877, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(878, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(879, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(880, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(881, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(882, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(883, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(884, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(885, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(886, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(887, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(888, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(889, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(890, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(891, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(892, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(893, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(894, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(895, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383932353020676f6c6420636f696e732e0600646f6f7269640202000000),
(896, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(897, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(898, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640203000000),
(899, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640201000000),
(900, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640202000000),
(901, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(902, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(903, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(904, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(905, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(906, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(907, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(908, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(909, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(910, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(911, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(912, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(913, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(914, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(915, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(916, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(917, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(918, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(919, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(920, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(921, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(922, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(923, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(924, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(925, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(926, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(927, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(928, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640201000000),
(929, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640201000000),
(930, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640201000000),
(931, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(932, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373433373520676f6c6420636f696e732e0600646f6f7269640201000000),
(933, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(934, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373433373520676f6c6420636f696e732e0600646f6f7269640201000000),
(935, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(936, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(937, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(938, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(939, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(940, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(941, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(942, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640202000000),
(943, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323139373520676f6c6420636f696e732e0600646f6f7269640202000000),
(944, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(945, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(946, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323139373520676f6c6420636f696e732e0600646f6f7269640201000000),
(947, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640201000000),
(948, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640203000000),
(949, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343932323520676f6c6420636f696e732e0600646f6f7269640206000000),
(950, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343932323520676f6c6420636f696e732e0600646f6f7269640205000000),
(951, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343932323520676f6c6420636f696e732e0600646f6f7269640204000000),
(952, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343932323520676f6c6420636f696e732e0600646f6f7269640203000000),
(953, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343932323520676f6c6420636f696e732e0600646f6f7269640201000000),
(954, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343932323520676f6c6420636f696e732e0600646f6f7269640202000000),
(955, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(956, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(957, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(958, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640202000000),
(959, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640202000000),
(960, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640202000000),
(961, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640202000000),
(962, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640203000000),
(963, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(964, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(965, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640201000000),
(966, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(967, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(968, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(969, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(970, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(971, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(972, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(973, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(974, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(975, 0, 1, 0, 11811, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(976, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(977, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(978, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(979, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(980, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(981, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383333303020676f6c6420636f696e732e0600646f6f7269640201000000),
(982, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383333303020676f6c6420636f696e732e0600646f6f7269640201000000),
(983, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383333303020676f6c6420636f696e732e0600646f6f7269640201000000),
(984, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(985, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(986, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(987, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(988, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(989, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(990, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640202000000),
(991, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640202000000),
(992, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640202000000),
(993, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640202000000),
(994, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(995, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(996, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640201000000),
(997, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640201000000),
(998, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(999, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1000, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333338373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1001, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333338373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1002, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333338373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1003, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333338373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1004, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1005, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1006, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1007, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1008, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1009, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1010, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1011, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1012, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1013, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1014, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1015, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1016, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1017, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1018, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1019, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343837353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1020, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1021, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1022, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323139373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1022, 0, 2, 0, 1250, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1023, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1024, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1025, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1026, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1027, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1028, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1029, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1030, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1031, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1032, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f75736520274d616e646172696e2043697479202332303337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1033, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1034, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1035, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1036, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1037, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1038, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1039, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1040, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1041, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373337303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1042, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373337303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1043, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1044, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1045, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1046, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1047, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1048, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1049, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640204000000),
(1050, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1051, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1052, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1053, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333834373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1054, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333834373520676f6c6420636f696e732e0600646f6f7269640202000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(1055, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1056, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1057, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323331323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1058, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1059, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1060, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303237373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1061, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1062, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1063, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1064, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1065, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383038303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1066, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313638272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353538353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1067, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313638272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353538353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1068, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1069, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1070, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1071, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313035353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1072, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313035353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1073, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313035353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1074, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313035353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1075, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393836353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1076, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393836353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1077, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1078, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1079, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353736373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1080, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363239353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1081, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363239353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1082, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1083, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1084, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1085, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373330323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1086, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373330323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1087, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373330323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1088, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373330323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1089, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1090, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1091, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1092, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363935373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1093, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313831272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1094, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313831272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1095, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e013b00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313831272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1096, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1097, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1098, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1099, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1100, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363935373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1101, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1102, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1103, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393735303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1104, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032393735303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1105, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1106, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1107, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313838272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037323539303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1108, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313838272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037323539303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1109, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1110, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1111, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1112, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1113, 0, 1, 0, 9171, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520275065777465722043697479202332313930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1114, 0, 1, 0, 9173, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027506577746572204369747920202332313931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1115, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323331323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1116, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1117, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303532373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1118, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1119, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303532373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1120, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1121, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1122, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1123, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333530323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1124, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303233303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1125, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1126, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1127, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1128, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1129, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303532373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1130, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313731373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1131, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333332303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1132, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f757365202743696e6e61626172204369747920202332323837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323031353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1133, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333039303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1134, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1135, 0, 1, 0, 5110, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f757365202743696e6e616261722043697479202332323932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363935373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1136, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363131323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1137, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037303530373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1138, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1139, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1140, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1141, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1142, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1143, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1144, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1145, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1146, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1147, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1148, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1149, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1150, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1151, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323331323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1152, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1153, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1154, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1155, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333631373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1156, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333631373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1157, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333631373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1158, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343037373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1159, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343037373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1160, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343037373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1161, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343037373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1162, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343037373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1163, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343037373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1164, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343037373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1165, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343037373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1166, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393633353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1167, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393633353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1168, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393633353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1169, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1170, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1171, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1172, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1173, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1174, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1175, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1176, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1177, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1178, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1179, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1180, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343033303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1181, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343033303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1182, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313736353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1183, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383937323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1184, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035343734303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1185, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313238353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1186, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313238353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1187, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373138373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1188, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373138373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1189, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1190, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393933323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1191, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343236303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1192, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343236303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1193, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343236303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1194, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393931323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1195, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393931323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1196, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313436373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1197, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1198, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1199, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393633353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1200, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353937373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1201, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303039353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1202, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303039353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1203, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303039353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1204, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363634303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1205, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363634303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1206, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363634303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1207, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363634303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1208, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363634303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1209, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363634303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1210, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363634303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1211, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363634303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1212, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393230323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1213, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039373837373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1214, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039373837373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1215, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039373837373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1216, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1217, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343339353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1218, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363532353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1219, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373233353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1220, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1221, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1222, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1223, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1224, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353238373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1225, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032353838323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1226, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373235353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1227, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353137323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1228, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383134373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1229, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1230, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1231, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1232, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1233, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1234, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1235, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1236, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1237, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1238, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1239, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1240, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1241, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1242, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1243, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353730303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1244, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1245, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640203000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(1246, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1247, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1248, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1249, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1250, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1251, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1252, 0, 1, 0, 6441, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1253, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363334323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1254, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363334323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1255, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363334323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1256, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363334323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1257, 0, 1, 0, 6440, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363334323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1258, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014a00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313139303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1259, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e014a00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313738353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1260, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1261, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1262, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1263, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1264, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1265, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1266, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1267, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1268, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1269, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1270, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1271, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1272, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393034303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1273, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393034303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1274, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(1275, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1276, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1277, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1278, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1279, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1280, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1281, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1282, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1283, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1284, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353137323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1285, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353137323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1286, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343339353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1287, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343339353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1288, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363935373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1289, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363935373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1290, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363935373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1291, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303634323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1292, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303634323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1293, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1294, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1295, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014a00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383333303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1296, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333638353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1297, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014a00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320373134303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1298, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014a00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320393532303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1299, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323739323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1300, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323739323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1301, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1302, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1303, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1304, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1305, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353531373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1306, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353531373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1307, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353531373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1308, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353531373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1309, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353531373520676f6c6420636f696e732e0600646f6f7269640205000000),
(1310, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353531373520676f6c6420636f696e732e0600646f6f7269640205000000),
(1311, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353531373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1312, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353531373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1313, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1314, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1315, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373835303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1316, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1317, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1318, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1319, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1320, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1321, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1322, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1323, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1324, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1325, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1326, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1327, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1328, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1329, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1330, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1331, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313731373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1332, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313731373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1333, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313731373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1334, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1335, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1336, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1337, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1338, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1339, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1340, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1341, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1342, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1343, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1344, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640207000000),
(1345, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1346, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1347, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1348, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640208000000),
(1349, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640208000000),
(1350, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640205000000),
(1351, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f726964020a000000),
(1352, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640206000000),
(1353, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640206000000),
(1354, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640206000000),
(1355, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640209000000),
(1356, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1357, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038343139323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1358, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1359, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1360, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1361, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1362, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1363, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1364, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1365, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1366, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1367, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1368, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1369, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1370, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333438323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1371, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640204000000),
(1372, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640204000000),
(1373, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1374, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640204000000),
(1375, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1376, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383739303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1377, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1378, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1379, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1380, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1381, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1382, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1383, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1384, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1384, 0, 2, 0, 1253, 1, 0x8002000b006465736372697074696f6e016d00000049742062656c6f6e677320746f20686f7573652027466f72676f7474656e2068656164717561727465722028466c617420312c204172656120343229272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203020676f6c6420636f696e732e0600646f6f7269640202000000),
(1385, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1386, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037373634373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1387, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1388, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640204000000),
(1389, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640204000000),
(1390, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1391, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1392, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1393, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1394, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1395, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1396, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1397, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1398, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1399, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343937303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1400, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1401, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1402, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1403, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1404, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1405, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1406, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1407, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1408, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1409, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1410, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1411, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1412, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1413, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1414, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1415, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1416, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1417, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1418, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1419, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1420, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1421, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1422, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1423, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1424, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1425, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1426, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1427, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1428, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1429, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1430, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1431, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1432, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1433, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1434, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1435, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1436, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303938373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1437, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1438, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1439, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1440, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1441, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1442, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1443, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1444, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1445, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1446, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1447, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(1448, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373839373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1449, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1450, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1451, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1452, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1453, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1454, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1455, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1456, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1457, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343632353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1458, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1459, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1460, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1461, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1462, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1463, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1464, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1465, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1466, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1467, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1468, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1469, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1470, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1471, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1472, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1473, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1474, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1475, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1476, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1477, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1478, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1479, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1480, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1481, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1482, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1483, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1484, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1485, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1486, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1487, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1488, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1489, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1490, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038353038353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1491, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1492, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1493, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1494, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1495, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1496, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1497, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1498, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1499, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1500, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1501, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1502, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1503, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1504, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1505, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353836323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1506, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1507, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1508, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1509, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1510, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1511, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1512, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1513, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1514, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1515, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1516, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1517, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1518, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1519, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383132373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1520, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1521, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1522, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1523, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1524, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1525, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1526, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1527, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640207000000),
(1528, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640205000000),
(1529, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640205000000),
(1530, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1531, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363034353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1532, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1533, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1534, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1535, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1536, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1537, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1538, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1539, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1540, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1541, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1542, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1543, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1544, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1545, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1546, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1547, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1548, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1549, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343337353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1550, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343830373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1551, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343830373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1552, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343830373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1553, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343830373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1554, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343830373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1555, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343830373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1556, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343830373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1557, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343830373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1558, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1559, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1560, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1561, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1562, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1563, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1564, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1565, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1566, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1567, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1568, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1569, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1570, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1571, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1572, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1573, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383534303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1574, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1575, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1576, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1577, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1578, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1579, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1580, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1581, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1582, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1583, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1584, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1585, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1586, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1587, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1588, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1589, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1590, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1591, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1592, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1593, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038303332353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1594, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1595, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1596, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1597, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1598, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1599, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1600, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1601, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333336373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1602, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1603, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1604, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1605, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1606, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1607, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353633323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1608, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353633323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1609, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353633323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1610, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353633323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1611, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353633323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1612, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353633323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1613, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1614, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1615, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1616, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333037303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1617, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1618, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1619, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1620, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1621, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1622, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1623, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1624, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363336323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1625, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1626, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1627, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1628, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1629, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(1630, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1631, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(1632, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1633, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1634, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1635, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1636, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1637, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1638, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1639, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1640, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1641, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1642, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1643, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1644, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1645, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1646, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1647, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1648, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1649, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1650, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1651, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640205000000),
(1652, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640201000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(1653, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1654, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1655, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1656, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1657, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1658, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1659, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037333138353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1660, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640205000000),
(1661, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1662, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640204000000),
(1663, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640204000000),
(1664, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640204000000),
(1665, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1666, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640205000000),
(1667, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1668, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1669, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1670, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1671, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1672, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1673, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1674, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1675, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1676, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1677, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1678, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037313430303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1679, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1680, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1681, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1682, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1683, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1684, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1685, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1686, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1687, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1688, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1689, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383432353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1690, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1691, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1692, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1693, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1694, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1695, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1696, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1697, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1698, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1699, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1700, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1701, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1702, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1703, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323336303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1704, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1705, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640208000000),
(1706, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640207000000),
(1707, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1708, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640207000000),
(1709, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640207000000),
(1710, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640207000000),
(1711, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1712, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1713, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1714, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333539373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1715, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1716, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1717, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1718, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1719, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1720, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1721, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1722, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640205000000),
(1723, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1724, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373533323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1725, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1726, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640205000000),
(1727, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1728, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1729, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1730, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1731, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1732, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1733, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1734, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363737353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1735, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1736, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1737, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1738, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1739, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1740, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1741, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1742, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1743, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1744, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1745, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1746, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640204000000),
(1747, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1748, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1749, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1750, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033343531303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1751, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1752, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1753, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1754, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1755, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1756, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1757, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1758, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393237303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1759, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1760, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1761, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1762, 0, 1, 0, 6907, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1763, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1764, 0, 1, 0, 6907, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1765, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1766, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1767, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1768, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1769, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1770, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1771, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1772, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1773, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1774, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1775, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1776, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1777, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1778, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1779, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1780, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1781, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373431373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1782, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1783, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1784, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1785, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1786, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1787, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1788, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1789, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(1790, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(1791, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(1792, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(1793, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(1794, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(1795, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1796, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1797, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1798, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1799, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1800, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1801, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1802, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035363232373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1803, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1804, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1805, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1806, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1807, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1808, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640206000000),
(1809, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640205000000),
(1810, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1811, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1812, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1813, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323737323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1814, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313137303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1815, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313137303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1816, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313137303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1817, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313137303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1818, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313137303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1819, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035313137303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1820, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313635303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1821, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313635303020676f6c6420636f696e732e0600646f6f7269640205000000),
(1822, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313635303020676f6c6420636f696e732e0600646f6f7269640204000000),
(1823, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313635303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1824, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313635303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1825, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1826, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1827, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1828, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343537373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1829, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1830, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1831, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1832, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1833, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1834, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1835, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1836, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1837, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1838, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303832353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1839, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353933303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1840, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353933303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1841, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353933303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1842, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1843, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1844, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1845, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1846, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1847, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1848, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1849, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1850, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1851, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1852, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1853, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1854, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1855, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1856, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303735373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1857, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393836353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1858, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033393836353020676f6c6420636f696e732e0600646f6f7269640201000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(1859, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1860, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036363933373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1861, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1862, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1863, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1864, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1865, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1866, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1867, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1868, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383930353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1869, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1870, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1871, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640203000000),
(1872, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1873, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1874, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1875, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1876, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1877, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1878, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1879, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383732323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1880, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363435373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1881, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363435373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1882, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363435373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1883, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363435373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1884, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363435373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1885, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037363435373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1886, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1887, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1888, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035373132303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1889, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640202000000),
(1890, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373030353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1891, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393638323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1892, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393638323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1893, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393638323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1894, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393638323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1895, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393638323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1896, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393638323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1897, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393638323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1898, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353236373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1899, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353236373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1900, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037353236373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1901, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1902, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1903, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1904, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1905, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1906, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1907, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1908, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343535373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1909, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343535373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1910, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343535373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1911, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343535373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1912, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343535373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1913, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343535373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1914, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343535373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1915, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343535373520676f6c6420636f696e732e0600646f6f7269640204000000),
(1916, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1917, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034373630303020676f6c6420636f696e732e0600646f6f7269640203000000),
(1918, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1919, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1920, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1921, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1922, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1923, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1924, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1925, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1926, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1927, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313538323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1928, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1929, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1930, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1931, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1932, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1933, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1934, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1935, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1936, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1937, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1938, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1939, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732038333330303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1940, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1941, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1942, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1943, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1944, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1945, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1946, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1947, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1948, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1949, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1950, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1951, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1952, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1953, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383331303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1954, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383331303020676f6c6420636f696e732e0600646f6f7269640205000000),
(1955, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383331303020676f6c6420636f696e732e0600646f6f7269640205000000),
(1956, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383331303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1957, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1958, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1959, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1960, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1961, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1962, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1963, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1964, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1965, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640202000000),
(1966, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1967, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1968, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1969, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1970, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1971, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1972, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640203000000),
(1973, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035383031323520676f6c6420636f696e732e0600646f6f7269640204000000),
(1974, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1975, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1976, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640201000000),
(1977, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1978, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1979, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333535303020676f6c6420636f696e732e0600646f6f7269640202000000),
(1980, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1981, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640202000000),
(1982, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1983, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1984, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1985, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383337373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1986, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1987, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373936353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1988, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313934373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1989, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313934373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1990, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313934373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1991, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313934373520676f6c6420636f696e732e0600646f6f7269640203000000),
(1992, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034313934373520676f6c6420636f696e732e0600646f6f7269640201000000),
(1993, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1994, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1995, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1996, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640204000000),
(1997, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373438353020676f6c6420636f696e732e0600646f6f7269640201000000),
(1998, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393230323520676f6c6420636f696e732e0600646f6f7269640201000000),
(1999, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393230323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2000, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393230323520676f6c6420636f696e732e0600646f6f7269640204000000),
(2001, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393230323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2002, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393230323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2003, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393230323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2004, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313238353020676f6c6420636f696e732e0600646f6f7269640204000000),
(2005, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313238353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2006, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313238353020676f6c6420636f696e732e0600646f6f7269640204000000),
(2007, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313238353020676f6c6420636f696e732e0600646f6f7269640205000000),
(2008, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036313238353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2009, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373636373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2010, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373636373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2011, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373636373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2012, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033323133303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2013, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2014, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2015, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2016, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2017, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2018, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034383139353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2019, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2020, 0, 1, 0, 6903, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2021, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2022, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2023, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2024, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2025, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2026, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363539323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2027, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640204000000),
(2028, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640204000000),
(2029, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2030, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2031, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2032, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2033, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640204000000),
(2034, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2035, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2036, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640204000000),
(2037, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333733323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2038, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2039, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2040, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2041, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2042, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640204000000),
(2043, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2044, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2045, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2046, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2047, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2048, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343332373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2049, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(2050, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640203000000),
(2051, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640206000000),
(2052, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2053, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640205000000),
(2054, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640204000000),
(2055, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333938323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2056, 0, 1, 0, 6894, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333938323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2057, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031333938323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2058, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2059, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2060, 0, 1, 0, 6894, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2061, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640201000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(2062, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2063, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2064, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2065, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303837323520676f6c6420636f696e732e0600646f6f7269640205000000),
(2066, 0, 1, 0, 6894, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383434353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2067, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383434353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2068, 0, 1, 0, 6894, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2069, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2070, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2071, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333032323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2072, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333032323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2073, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333032323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2074, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383434353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2075, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383434353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2076, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383434353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2077, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383434353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2078, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2079, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2080, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2081, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640202000000),
(2082, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2083, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2084, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343939303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2085, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2086, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2087, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2088, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2089, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2090, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640204000000),
(2091, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2092, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2093, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033383637353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2094, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333530323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2095, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333530323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2096, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333530323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2097, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383536303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2098, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383536303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2099, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363431303020676f6c6420636f696e732e0600646f6f7269640202000000),
(2100, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363431303020676f6c6420636f696e732e0600646f6f7269640206000000),
(2101, 0, 1, 0, 6894, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363431303020676f6c6420636f696e732e0600646f6f7269640206000000),
(2102, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363431303020676f6c6420636f696e732e0600646f6f7269640206000000),
(2103, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363431303020676f6c6420636f696e732e0600646f6f7269640204000000),
(2104, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363431303020676f6c6420636f696e732e0600646f6f7269640206000000),
(2105, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363431303020676f6c6420636f696e732e0600646f6f7269640205000000),
(2106, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034363431303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2107, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2108, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2109, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2110, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2111, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2112, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2113, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2114, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2115, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2116, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2117, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2118, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2119, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037343637323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2120, 0, 1, 0, 6896, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2121, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2122, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2123, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2124, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2125, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2126, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640204000000),
(2127, 0, 1, 0, 6894, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2128, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2129, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2130, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2131, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036343835353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2132, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2133, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2134, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2135, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2136, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2137, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2138, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2139, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2140, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393038373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2141, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2142, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2143, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2144, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2145, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2146, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2147, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2148, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035323935353020676f6c6420636f696e732e0600646f6f7269640204000000),
(2149, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2150, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034393938303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2151, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2152, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2153, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2154, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640205000000),
(2155, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640206000000),
(2156, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640207000000),
(2157, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640202000000),
(2158, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2159, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640204000000),
(2160, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640204000000),
(2161, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303639303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2162, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373235353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2163, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373235353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2164, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373235353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2165, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2166, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2167, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343238303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2168, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2169, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2170, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640204000000),
(2171, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640202000000),
(2172, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2173, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2174, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2175, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333133373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2176, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333133373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2177, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333133373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2178, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333133373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2179, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333133373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2180, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333133373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2181, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333133373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2182, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333133373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2183, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373235353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2184, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373235353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2185, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373235353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2186, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2187, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640205000000),
(2188, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640205000000),
(2189, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2190, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2191, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2192, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640204000000),
(2192, 0, 2, 0, 6900, 1, 0x8002000b006465736372697074696f6e016d00000049742062656c6f6e677320746f20686f7573652027466f72676f7474656e2068656164717561727465722028466c617420312c204172656120343229272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203020676f6c6420636f696e732e0600646f6f7269640204000000),
(2193, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034323534323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2194, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333235323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2195, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333235323520676f6c6420636f696e732e0600646f6f7269640205000000),
(2196, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035333235323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2197, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2198, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(2199, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032363138303020676f6c6420636f696e732e0600646f6f7269640202000000),
(2200, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2201, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2202, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2203, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2204, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2205, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2206, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2207, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033313233373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2208, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383833373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2209, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383833373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2210, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383833373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2211, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383833373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2212, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383833373520676f6c6420636f696e732e0600646f6f7269640204000000),
(2213, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383833373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2214, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732037383833373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2215, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2216, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032343039373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2217, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303532373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2218, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303532373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2219, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303532373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2220, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393034303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2221, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2222, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2223, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2224, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2225, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2226, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2227, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2228, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2229, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2230, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2231, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2232, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313432303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2233, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640202000000),
(2234, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e012900000049742062656c6f6e677320746f20686f7573652027272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(2235, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2236, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2237, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031373535323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2238, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2239, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2240, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2241, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2242, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2243, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353130353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2244, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2245, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2246, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2247, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2248, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2249, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2250, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2251, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2252, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640203000000),
(2253, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2254, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039303134323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2255, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373138373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2256, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373138373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2257, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373138373520676f6c6420636f696e732e0600646f6f7269640205000000),
(2258, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373138373520676f6c6420636f696e732e0600646f6f7269640204000000),
(2259, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033373138373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2260, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2261, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2262, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2263, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313132323520676f6c6420636f696e732e0600646f6f7269640201000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(2264, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2265, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2266, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2267, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2268, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363636303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2269, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2270, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2271, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2272, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2273, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2274, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2275, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2276, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2277, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640203000000),
(2278, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2279, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2280, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333433353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2281, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353232303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2282, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353232303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2283, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353232303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2284, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353232303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2285, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353232303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2286, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2287, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2288, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2289, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2290, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2291, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2292, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2293, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2294, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2295, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2296, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2297, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2298, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036323137373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2299, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014a00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313139303020676f6c6420636f696e732e0600646f6f7269640203000000),
(2300, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2301, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2302, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2303, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2304, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2305, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2306, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2307, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2308, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2309, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2310, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640205000000),
(2311, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640203000000),
(2312, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2313, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032323930373520676f6c6420636f696e732e0600646f6f7269640202000000),
(2314, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2315, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2316, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2317, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2318, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2319, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2320, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2321, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031363036353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2322, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303731303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2323, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2324, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2325, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303731303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2326, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303731303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2327, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303731303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2328, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2329, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2330, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303731303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2331, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303731303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2332, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2333, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2334, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313030373520676f6c6420636f696e732e0600646f6f7269640201000000),
(2335, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2336, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2337, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2338, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2339, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031303431323520676f6c6420636f696e732e0600646f6f7269640202000000),
(2340, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2341, 0, 1, 0, 11811, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2342, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2343, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2344, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2345, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031313930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(2346, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014a00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320383932353020676f6c6420636f696e732e0600646f6f7269640202000000),
(2347, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2348, 0, 1, 0, 1250, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2349, 0, 1, 0, 11811, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2350, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323439353020676f6c6420636f696e732e0600646f6f7269640201000000),
(2351, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2352, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2353, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2354, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2355, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2356, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2357, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2358, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000),
(2359, 0, 1, 0, 11810, 1, 0x8002000b006465736372697074696f6e014b00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383734323520676f6c6420636f696e732e0600646f6f7269640201000000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `youtube` varchar(45) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `video_comments`
--

CREATE TABLE `video_comments` (
  `id` int(10) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `video` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `text` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote`
--

CREATE TABLE `znote` (
  `id` int(11) NOT NULL,
  `version` varchar(30) NOT NULL COMMENT 'Znote AAC version',
  `installed` int(11) NOT NULL,
  `cached` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `znote`
--

INSERT INTO `znote` (`id`, `version`, `installed`, `cached`) VALUES
(1, '1.6', 1705287600, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_accounts`
--

CREATE TABLE `znote_accounts` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `ip` bigint(20) UNSIGNED NOT NULL,
  `created` int(11) NOT NULL,
  `points` int(11) DEFAULT 0,
  `cooldown` int(11) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `active_email` tinyint(4) NOT NULL DEFAULT 0,
  `activekey` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(20) NOT NULL,
  `secret` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `znote_accounts`
--

INSERT INTO `znote_accounts` (`id`, `account_id`, `ip`, `created`, `points`, `cooldown`, `active`, `active_email`, `activekey`, `flag`, `secret`) VALUES
(1, 2, 0, 1705287600, 0, 0, 0, 0, 0, '', NULL),
(2, 1, 0, 1705287600, 0, 0, 0, 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_auction_player`
--

CREATE TABLE `znote_auction_player` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `original_account_id` int(11) NOT NULL,
  `bidder_account_id` int(11) NOT NULL,
  `time_begin` int(11) NOT NULL,
  `time_end` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `sold` tinyint(4) NOT NULL,
  `claimed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_changelog`
--

CREATE TABLE `znote_changelog` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_deleted_characters`
--

CREATE TABLE `znote_deleted_characters` (
  `id` int(11) NOT NULL,
  `original_account_id` int(11) NOT NULL,
  `character_name` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `done` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_forum`
--

CREATE TABLE `znote_forum` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `access` tinyint(4) NOT NULL,
  `closed` tinyint(4) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  `guild_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `znote_forum`
--

INSERT INTO `znote_forum` (`id`, `name`, `access`, `closed`, `hidden`, `guild_id`) VALUES
(1, 'Staff Board', 4, 0, 0, 0),
(2, 'Tutors Board', 2, 0, 0, 0),
(3, 'Discussion', 1, 0, 0, 0),
(4, 'Feedback', 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_forum_posts`
--

CREATE TABLE `znote_forum_posts` (
  `id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_forum_threads`
--

CREATE TABLE `znote_forum_threads` (
  `id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `sticky` tinyint(4) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  `closed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_global_storage`
--

CREATE TABLE `znote_global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_guild_wars`
--

CREATE TABLE `znote_guild_wars` (
  `id` int(11) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_images`
--

CREATE TABLE `znote_images` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `desc` text NOT NULL,
  `date` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `delhash` varchar(30) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_news`
--

CREATE TABLE `znote_news` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `text` text NOT NULL,
  `date` int(11) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_paygol`
--

CREATE TABLE `znote_paygol` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `service_id` varchar(255) NOT NULL,
  `shortcode` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_paypal`
--

CREATE TABLE `znote_paypal` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_players`
--

CREATE TABLE `znote_players` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `hide_char` tinyint(4) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `znote_players`
--

INSERT INTO `znote_players` (`id`, `player_id`, `created`, `hide_char`, `comment`) VALUES
(1, 1, 1705287600, 0, ''),
(2, 2, 1705287600, 0, ''),
(3, 3, 1705287600, 0, ''),
(4, 4, 1705287600, 0, ''),
(5, 5, 1705287600, 0, ''),
(6, 6, 1705287600, 0, ''),
(7, 7, 1705287600, 0, ''),
(8, 31, 1705287600, 0, ''),
(9, 65, 1705287600, 0, ''),
(10, 86, 1705287600, 0, ''),
(11, 87, 1705287600, 0, ''),
(12, 90, 1705287600, 0, ''),
(13, 209, 1705287600, 0, ''),
(14, 290, 1705287600, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_player_reports`
--

CREATE TABLE `znote_player_reports` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `posx` int(11) NOT NULL,
  `posy` int(11) NOT NULL,
  `posz` int(11) NOT NULL,
  `report_description` varchar(255) NOT NULL,
  `date` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_shop`
--

CREATE TABLE `znote_shop` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `itemid` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `description` varchar(255) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_shop_logs`
--

CREATE TABLE `znote_shop_logs` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_shop_orders`
--

CREATE TABLE `znote_shop_orders` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_tickets`
--

CREATE TABLE `znote_tickets` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `subject` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip` bigint(20) NOT NULL,
  `creation` int(11) NOT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_tickets_replies`
--

CREATE TABLE `znote_tickets_replies` (
  `id` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `username` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_visitors`
--

CREATE TABLE `znote_visitors` (
  `id` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `znote_visitors_details`
--

CREATE TABLE `znote_visitors_details` (
  `id` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `time` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id` (`world_id`);

--
-- Índices para tabela `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`value`),
  ADD KEY `active` (`active`);

--
-- Índices para tabela `bounty_hunters`
--
ALTER TABLE `bounty_hunters`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `bugtracker`
--
ALTER TABLE `bugtracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Índices para tabela `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `closed_key`
--
ALTER TABLE `closed_key`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `author` (`author`);

--
-- Índices para tabela `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD KEY `kill_id` (`kill_id`);

--
-- Índices para tabela `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `with` (`with`),
  ADD KEY `friend` (`friend`);

--
-- Índices para tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`,`world_id`),
  ADD UNIQUE KEY `key_2` (`key`,`world_id`),
  ADD UNIQUE KEY `key_3` (`key`,`world_id`);

--
-- Índices para tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`world_id`),
  ADD UNIQUE KEY `name_2` (`name`,`world_id`),
  ADD UNIQUE KEY `name_3` (`name`,`world_id`);

--
-- Índices para tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `war_id` (`war_id`),
  ADD KEY `death_id` (`death_id`);

--
-- Índices para tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `enemy_id` (`enemy_id`);

--
-- Índices para tabela `houses`
--
ALTER TABLE `houses`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD UNIQUE KEY `id_2` (`id`,`world_id`),
  ADD UNIQUE KEY `id_3` (`id`,`world_id`);

--
-- Índices para tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `house_data`
--
ALTER TABLE `house_data`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`);

--
-- Índices para tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`),
  ADD UNIQUE KEY `house_id_2` (`house_id`,`world_id`,`listid`),
  ADD UNIQUE KEY `house_id_3` (`house_id`,`world_id`,`listid`);

--
-- Índices para tabela `killers`
--
ALTER TABLE `killers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `death_id` (`death_id`);

--
-- Índices para tabela `market_items`
--
ALTER TABLE `market_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_player_id` (`player_id`);

--
-- Índices para tabela `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`);

--
-- Índices para tabela `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `newsticker`
--
ALTER TABLE `newsticker`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagsegurotransacoes`
--
ALTER TABLE `pagsegurotransacoes`
  ADD UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`),
  ADD KEY `Referencia` (`Referencia`),
  ADD KEY `status` (`status`);

--
-- Índices para tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`deleted`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `online` (`online`),
  ADD KEY `deleted` (`deleted`);

--
-- Índices para tabela `player_autoloot`
--
ALTER TABLE `player_autoloot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autoloot_id` (`player_id`);

--
-- Índices para tabela `player_catch`
--
ALTER TABLE `player_catch`
  ADD KEY `FK_CATCH` (`player_id`);

--
-- Índices para tabela `player_catchs`
--
ALTER TABLE `player_catchs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD KEY `kill_id` (`kill_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_pokedex`
--
ALTER TABLE `player_pokedex`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices para tabela `player_pokemon`
--
ALTER TABLE `player_pokemon`
  ADD UNIQUE KEY `player_id_slot` (`player_id`,`slot`);

--
-- Índices para tabela `player_recover`
--
ALTER TABLE `player_recover`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `player_seller`
--
ALTER TABLE `player_seller`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vip_id` (`vip_id`);

--
-- Índices para tabela `pokedex`
--
ALTER TABLE `pokedex`
  ADD PRIMARY KEY (`wild_id`);

--
-- Índices para tabela `pokemon_serial`
--
ALTER TABLE `pokemon_serial`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question` (`question`);

--
-- Índices para tabela `poll_answer`
--
ALTER TABLE `poll_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_id` (`poll_id`);

--
-- Índices para tabela `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `poll_id` (`poll_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `board_id` (`board_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Índices para tabela `raids`
--
ALTER TABLE `raids`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `server_config`
--
ALTER TABLE `server_config`
  ADD UNIQUE KEY `config` (`config`);

--
-- Índices para tabela `server_motd`
--
ALTER TABLE `server_motd`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD UNIQUE KEY `id_2` (`id`,`world_id`),
  ADD UNIQUE KEY `id_3` (`id`,`world_id`);

--
-- Índices para tabela `server_record`
--
ALTER TABLE `server_record`
  ADD UNIQUE KEY `record` (`record`,`world_id`,`timestamp`),
  ADD UNIQUE KEY `timestamp` (`timestamp`,`record`,`world_id`),
  ADD UNIQUE KEY `timestamp_2` (`timestamp`,`record`,`world_id`);

--
-- Índices para tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `world_id` (`world_id`),
  ADD KEY `reads` (`reads`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id_2` (`world_id`),
  ADD KEY `world_id_3` (`world_id`);

--
-- Índices para tabela `shop_convert`
--
ALTER TABLE `shop_convert`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `shop_donation_history`
--
ALTER TABLE `shop_donation_history`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `shop_history`
--
ALTER TABLE `shop_history`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `shop_items`
--
ALTER TABLE `shop_items`
  ADD PRIMARY KEY (`_id`);

--
-- Índices para tabela `shop_offer`
--
ALTER TABLE `shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `board_id` (`board_id`);

--
-- Índices para tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ticketsmessage`
--
ALTER TABLE `ticketsmessage`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tiles`
--
ALTER TABLE `tiles`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD UNIQUE KEY `id_2` (`id`,`world_id`),
  ADD UNIQUE KEY `id_3` (`id`,`world_id`),
  ADD KEY `x` (`x`,`y`,`z`),
  ADD KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `x_2` (`x`,`y`,`z`),
  ADD KEY `x_3` (`x`,`y`,`z`);

--
-- Índices para tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  ADD UNIQUE KEY `tile_id_2` (`tile_id`,`world_id`,`sid`),
  ADD UNIQUE KEY `tile_id_3` (`tile_id`,`world_id`,`sid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `sid_2` (`sid`),
  ADD KEY `sid_3` (`sid`);

--
-- Índices para tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices para tabela `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Índices para tabela `video_comments`
--
ALTER TABLE `video_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video` (`video`),
  ADD KEY `author` (`author`);

--
-- Índices para tabela `znote`
--
ALTER TABLE `znote`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_accounts`
--
ALTER TABLE `znote_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_auction_player`
--
ALTER TABLE `znote_auction_player`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_changelog`
--
ALTER TABLE `znote_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_deleted_characters`
--
ALTER TABLE `znote_deleted_characters`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_forum`
--
ALTER TABLE `znote_forum`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_forum_posts`
--
ALTER TABLE `znote_forum_posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_forum_threads`
--
ALTER TABLE `znote_forum_threads`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_global_storage`
--
ALTER TABLE `znote_global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Índices para tabela `znote_guild_wars`
--
ALTER TABLE `znote_guild_wars`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_images`
--
ALTER TABLE `znote_images`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_news`
--
ALTER TABLE `znote_news`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_paygol`
--
ALTER TABLE `znote_paygol`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_paypal`
--
ALTER TABLE `znote_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_players`
--
ALTER TABLE `znote_players`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_player_reports`
--
ALTER TABLE `znote_player_reports`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_shop`
--
ALTER TABLE `znote_shop`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_shop_logs`
--
ALTER TABLE `znote_shop_logs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_shop_orders`
--
ALTER TABLE `znote_shop_orders`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_tickets`
--
ALTER TABLE `znote_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_tickets_replies`
--
ALTER TABLE `znote_tickets_replies`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_visitors`
--
ALTER TABLE `znote_visitors`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `znote_visitors_details`
--
ALTER TABLE `znote_visitors_details`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bounty_hunters`
--
ALTER TABLE `bounty_hunters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bugtracker`
--
ALTER TABLE `bugtracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `closed_key`
--
ALTER TABLE `closed_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `fatura`
--
ALTER TABLE `fatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `forums`
--
ALTER TABLE `forums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `killers`
--
ALTER TABLE `killers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `market_items`
--
ALTER TABLE `market_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `newsticker`
--
ALTER TABLE `newsticker`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1063;

--
-- AUTO_INCREMENT de tabela `player_autoloot`
--
ALTER TABLE `player_autoloot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `player_catchs`
--
ALTER TABLE `player_catchs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `player_recover`
--
ALTER TABLE `player_recover`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player_seller`
--
ALTER TABLE `player_seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pokedex`
--
ALTER TABLE `pokedex`
  MODIFY `wild_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=808;

--
-- AUTO_INCREMENT de tabela `pokemon_serial`
--
ALTER TABLE `pokemon_serial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `poll`
--
ALTER TABLE `poll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `poll_answer`
--
ALTER TABLE `poll_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `raids`
--
ALTER TABLE `raids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `server_reports`
--
ALTER TABLE `server_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `shop_convert`
--
ALTER TABLE `shop_convert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT de tabela `shop_donation_history`
--
ALTER TABLE `shop_donation_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `shop_history`
--
ALTER TABLE `shop_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `shop_items`
--
ALTER TABLE `shop_items`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `shop_offer`
--
ALTER TABLE `shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ticketsmessage`
--
ALTER TABLE `ticketsmessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `video_comments`
--
ALTER TABLE `video_comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote`
--
ALTER TABLE `znote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `znote_accounts`
--
ALTER TABLE `znote_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `znote_auction_player`
--
ALTER TABLE `znote_auction_player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_changelog`
--
ALTER TABLE `znote_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_deleted_characters`
--
ALTER TABLE `znote_deleted_characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_forum`
--
ALTER TABLE `znote_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `znote_forum_posts`
--
ALTER TABLE `znote_forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_forum_threads`
--
ALTER TABLE `znote_forum_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_guild_wars`
--
ALTER TABLE `znote_guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_images`
--
ALTER TABLE `znote_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_news`
--
ALTER TABLE `znote_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_paygol`
--
ALTER TABLE `znote_paygol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_paypal`
--
ALTER TABLE `znote_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_players`
--
ALTER TABLE `znote_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `znote_player_reports`
--
ALTER TABLE `znote_player_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_shop`
--
ALTER TABLE `znote_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_shop_logs`
--
ALTER TABLE `znote_shop_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_shop_orders`
--
ALTER TABLE `znote_shop_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_tickets`
--
ALTER TABLE `znote_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_tickets_replies`
--
ALTER TABLE `znote_tickets_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_visitors`
--
ALTER TABLE `znote_visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `znote_visitors_details`
--
ALTER TABLE `znote_visitors_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`with`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_lists_ibfk_2` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_lists_ibfk_3` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_autoloot`
--
ALTER TABLE `player_autoloot`
  ADD CONSTRAINT `FK_autoloot` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Limitadores para a tabela `player_catch`
--
ALTER TABLE `player_catch`
  ADD CONSTRAINT `FK_CATCH` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_pokedex`
--
ALTER TABLE `player_pokedex`
  ADD CONSTRAINT `player_pokedex_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `poll_answer`
--
ALTER TABLE `poll_answer`
  ADD CONSTRAINT `poll_answer_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `poll_answer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poll_votes_ibfk_2` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poll_votes_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threads_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tiles_ibfk_2` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tiles_ibfk_3` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `video_comments`
--
ALTER TABLE `video_comments`
  ADD CONSTRAINT `video_comments_ibfk_1` FOREIGN KEY (`video`) REFERENCES `videos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_comments_ibfk_2` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
