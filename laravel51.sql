-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-11-19 14:45:57
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `laravel51`
--

-- --------------------------------------------------------

--
-- 表的结构 `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `thumbnail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '缩略图',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `slug` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '网址缩略名',
  `user_id` int(12) DEFAULT NULL COMMENT '文章编辑用户id',
  `category_id` int(10) NOT NULL COMMENT '文章分类id',
  `deleted_at` datetime DEFAULT NULL COMMENT '被软删除时间',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='内容数据（文章/单页）表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `articles`
--

INSERT INTO `articles` (`id`, `title`, `thumbnail`, `content`, `slug`, `user_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, '测试', NULL, '```\r\necho ''Hi Laravel!'';\r\n\r\n\r\n```', NULL, 1, 1, NULL, '2015-11-19 08:38:40', '2015-11-19 13:41:38'),
(4, '风从田野上吹过', NULL, '我请求成为天空的孩子\r\n\r\n即使它收回我内心的翅膀\r\n\r\n走过田野，冬意弥深\r\n\r\n风挂落了日子的一些颜色\r\n\r\n酒杯倒塌，无人扶起\r\n\r\n我醉在远方\r\n\r\n姿势泛黄\r\n\r\n麦子孤独地绿了\r\n\r\n容我没有意外地抵达下一个春\r\n\r\n总有个影子立在田头\r\n\r\n我想抽烟\r\n\r\n红高粱回家以后\r\n\r\n有多少土色柔情于我\r\n\r\n生存坐在香案上\r\n\r\n我的爱恨\r\n\r\n生怕提起\r\n\r\n风把我越吹越低\r\n\r\n低到泥里，获取水分\r\n\r\n我希望成为天空的孩子\r\n\r\n仿佛\r\n\r\n也触手可及', NULL, 1, 1, NULL, '2015-11-19 12:05:31', '2015-11-19 13:40:49'),
(5, '芒果笔记', NULL, '这是芒果笔记的内容\r\n\r\nhttp://note.mango.im', NULL, 1, 4, NULL, '2015-11-19 13:18:23', '2015-11-19 13:32:18');

-- --------------------------------------------------------

--
-- 表的结构 `article_tag`
--

CREATE TABLE IF NOT EXISTS `article_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tag_id` int(10) NOT NULL COMMENT '标签ID',
  `article_id` int(10) NOT NULL COMMENT '文章ID',
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `article_id` (`article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章和标签映射表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `article_tag`
--

INSERT INTO `article_tag` (`id`, `tag_id`, `article_id`) VALUES
(4, 1, 3),
(5, 1, 4),
(8, 4, 5),
(9, 5, 4);

-- --------------------------------------------------------

--
-- 表的结构 `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(10) DEFAULT '0' COMMENT '父级ID',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `slug` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '网址缩略名',
  `sort` int(6) unsigned DEFAULT '0' COMMENT '分类排序,数字越大排名靠前',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='分类表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `categories`
--

INSERT INTO `categories` (`id`, `pid`, `name`, `slug`, `sort`) VALUES
(1, 0, '生活', '', 0),
(4, 0, '技术', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '标签名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, '标签'),
(4, '芒果'),
(5, '诗');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'roy', 'roy@mango.im', '$2y$10$oqlb/UzDMuA5.hDN9QByaOkeJcWfUb1CcSU8JTIL1htbfhwNJyJhu', NULL, '2015-11-10 05:19:59', '2015-11-10 05:19:59');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
