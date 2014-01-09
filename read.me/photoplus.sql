-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.1.71-community-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных photo
CREATE DATABASE IF NOT EXISTS `photo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `photo`;


-- Дамп структуры для таблица photo.pp_blog_blog
CREATE TABLE IF NOT EXISTS `pp_blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `icon` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_blog_blog_slug_lang` (`slug`,`lang`),
  KEY `ix_pp_blog_blog_create_user` (`create_user_id`),
  KEY `ix_pp_blog_blog_update_user` (`update_user_id`),
  KEY `ix_pp_blog_blog_status` (`status`),
  KEY `ix_pp_blog_blog_type` (`type`),
  KEY `ix_pp_blog_blog_create_date` (`create_date`),
  KEY `ix_pp_blog_blog_update_date` (`update_date`),
  KEY `ix_pp_blog_blog_lang` (`lang`),
  KEY `ix_pp_blog_blog_slug` (`slug`),
  KEY `ix_pp_blog_blog_category_id` (`category_id`),
  CONSTRAINT `fk_pp_blog_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `pp_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_blog_blog_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_blog_blog_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_blog_blog: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_blog_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_blog_blog` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_blog_post
CREATE TABLE IF NOT EXISTS `pp_blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `publish_date` int(11) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `quote` varchar(250) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `link` varchar(250) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `comment_status` int(11) NOT NULL DEFAULT '1',
  `create_user_ip` varchar(20) NOT NULL,
  `access_type` int(11) NOT NULL DEFAULT '1',
  `keywords` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `image` varchar(300) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_blog_post_lang_slug` (`slug`,`lang`),
  KEY `ix_pp_blog_post_blog_id` (`blog_id`),
  KEY `ix_pp_blog_post_create_user_id` (`create_user_id`),
  KEY `ix_pp_blog_post_update_user_id` (`update_user_id`),
  KEY `ix_pp_blog_post_status` (`status`),
  KEY `ix_pp_blog_post_access_type` (`access_type`),
  KEY `ix_pp_blog_post_comment_status` (`comment_status`),
  KEY `ix_pp_blog_post_lang` (`lang`),
  KEY `ix_pp_blog_post_slug` (`slug`),
  KEY `ix_pp_blog_post_publish_date` (`publish_date`),
  KEY `ix_pp_blog_post_category_id` (`category_id`),
  CONSTRAINT `fk_pp_blog_post_blog` FOREIGN KEY (`blog_id`) REFERENCES `pp_blog_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_blog_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `pp_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_blog_post_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_blog_post_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_blog_post: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_blog_post` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_blog_post_to_tag
CREATE TABLE IF NOT EXISTS `pp_blog_post_to_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `ix_pp_blog_post_to_tag_post_id` (`post_id`),
  KEY `ix_pp_blog_post_to_tag_tag_id` (`tag_id`),
  CONSTRAINT `fk_pp_blog_post_to_tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `pp_blog_post` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_blog_post_to_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `pp_blog_tag` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_blog_post_to_tag: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_blog_post_to_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_blog_post_to_tag` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_blog_tag
CREATE TABLE IF NOT EXISTS `pp_blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_blog_tag_tag_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_blog_tag: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_blog_tag` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_blog_user_to_blog
CREATE TABLE IF NOT EXISTS `pp_blog_user_to_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `create_date` int(11) NOT NULL,
  `update_date` int(11) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `note` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_blog_user_to_blog_blog_user_to_blog_u_b` (`user_id`,`blog_id`),
  KEY `ix_pp_blog_user_to_blog_blog_user_to_blog_user_id` (`user_id`),
  KEY `ix_pp_blog_user_to_blog_blog_user_to_blog_id` (`blog_id`),
  KEY `ix_pp_blog_user_to_blog_blog_user_to_blog_status` (`status`),
  KEY `ix_pp_blog_user_to_blog_blog_user_to_blog_role` (`role`),
  CONSTRAINT `fk_pp_blog_user_to_blog_blog_user_to_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `pp_blog_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_blog_user_to_blog_blog_user_to_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_blog_user_to_blog: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_blog_user_to_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_blog_user_to_blog` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_catalog_good
CREATE TABLE IF NOT EXISTS `pp_catalog_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `price` decimal(19,3) NOT NULL DEFAULT '0.000',
  `article` varchar(100) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text NOT NULL,
  `alias` varchar(150) NOT NULL,
  `data` text,
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `change_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_catalog_good_alias` (`alias`),
  KEY `ix_pp_catalog_good_status` (`status`),
  KEY `ix_pp_catalog_good_category` (`category_id`),
  KEY `ix_pp_catalog_good_user` (`user_id`),
  KEY `ix_pp_catalog_good_change_user` (`change_user_id`),
  KEY `ix_pp_catalog_good_article` (`article`),
  KEY `ix_pp_catalog_good_price` (`price`),
  CONSTRAINT `fk_pp_catalog_good_category` FOREIGN KEY (`category_id`) REFERENCES `pp_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_catalog_good_change_user` FOREIGN KEY (`change_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_catalog_good_user` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_catalog_good: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_catalog_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_catalog_good` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_category_category
CREATE TABLE IF NOT EXISTS `pp_category_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `alias` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_category_category_alias_lang` (`alias`,`lang`),
  KEY `ix_pp_category_category_parent_id` (`parent_id`),
  KEY `ix_pp_category_category_status` (`status`),
  CONSTRAINT `fk_pp_category_category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `pp_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_category_category: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_category_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_category_category` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_comment_comment
CREATE TABLE IF NOT EXISTS `pp_comment_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `text` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_pp_comment_comment_status` (`status`),
  KEY `ix_pp_comment_comment_model_model_id` (`model`,`model_id`),
  KEY `ix_pp_comment_comment_model` (`model`),
  KEY `ix_pp_comment_comment_model_id` (`model_id`),
  KEY `ix_pp_comment_comment_user_id` (`user_id`),
  KEY `ix_pp_comment_comment_parent_id` (`parent_id`),
  CONSTRAINT `fk_pp_comment_comment_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `pp_comment_comment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_comment_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_comment_comment: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_comment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_comment_comment` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_contentblock_content_block
CREATE TABLE IF NOT EXISTS `pp_contentblock_content_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_contentblock_content_block_code` (`code`),
  KEY `ix_pp_contentblock_content_block_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_contentblock_content_block: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_contentblock_content_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_contentblock_content_block` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_dictionary_dictionary_data
CREATE TABLE IF NOT EXISTS `pp_dictionary_dictionary_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_dictionary_dictionary_data_code_unique` (`code`),
  KEY `ix_pp_dictionary_dictionary_data_group_id` (`group_id`),
  KEY `ix_pp_dictionary_dictionary_data_create_user_id` (`create_user_id`),
  KEY `ix_pp_dictionary_dictionary_data_update_user_id` (`update_user_id`),
  KEY `ix_pp_dictionary_dictionary_data_status` (`status`),
  CONSTRAINT `fk_pp_dictionary_dictionary_data_create_user_id` FOREIGN KEY (`create_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_dictionary_dictionary_data_data_group_id` FOREIGN KEY (`group_id`) REFERENCES `pp_dictionary_dictionary_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_dictionary_dictionary_data_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_dictionary_dictionary_data: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_dictionary_dictionary_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_dictionary_dictionary_data` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_dictionary_dictionary_group
CREATE TABLE IF NOT EXISTS `pp_dictionary_dictionary_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_dictionary_dictionary_group_code` (`code`),
  KEY `ix_pp_dictionary_dictionary_group_create_user_id` (`create_user_id`),
  KEY `ix_pp_dictionary_dictionary_group_update_user_id` (`update_user_id`),
  CONSTRAINT `fk_pp_dictionary_dictionary_group_create_user_id` FOREIGN KEY (`create_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_dictionary_dictionary_group_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_dictionary_dictionary_group: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_dictionary_dictionary_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_dictionary_dictionary_group` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_feedback_feedback
CREATE TABLE IF NOT EXISTS `pp_feedback_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `answer_user` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `theme` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `answer_date` datetime DEFAULT NULL,
  `is_faq` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_pp_feedback_feedback_category` (`category_id`),
  KEY `ix_pp_feedback_feedback_type` (`type`),
  KEY `ix_pp_feedback_feedback_status` (`status`),
  KEY `ix_pp_feedback_feedback_isfaq` (`is_faq`),
  KEY `ix_pp_feedback_feedback_answer_user` (`answer_user`),
  CONSTRAINT `fk_pp_feedback_feedback_answer_user` FOREIGN KEY (`answer_user`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_feedback_feedback_category` FOREIGN KEY (`category_id`) REFERENCES `pp_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_feedback_feedback: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_feedback_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_feedback_feedback` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_gallery_gallery
CREATE TABLE IF NOT EXISTS `pp_gallery_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_pp_gallery_gallery_status` (`status`),
  KEY `ix_pp_gallery_gallery_owner` (`owner`),
  CONSTRAINT `fk_pp_gallery_gallery_owner` FOREIGN KEY (`owner`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_gallery_gallery: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_gallery_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_gallery_gallery` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_gallery_image_to_gallery
CREATE TABLE IF NOT EXISTS `pp_gallery_image_to_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_gallery_image_to_gallery_gallery_to_image` (`image_id`,`gallery_id`),
  KEY `ix_pp_gallery_image_to_gallery_gallery_to_image_image` (`image_id`),
  KEY `ix_pp_gallery_image_to_gallery_gallery_to_image_gallery` (`gallery_id`),
  CONSTRAINT `fk_pp_gallery_image_to_gallery_gallery_to_image_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `pp_gallery_gallery` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_gallery_image_to_gallery_gallery_to_image_image` FOREIGN KEY (`image_id`) REFERENCES `pp_image_image` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_gallery_image_to_gallery: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_gallery_image_to_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_gallery_image_to_gallery` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_image_image
CREATE TABLE IF NOT EXISTS `pp_image_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `file` varchar(250) NOT NULL,
  `creation_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `alt` varchar(250) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_pp_image_image_status` (`status`),
  KEY `ix_pp_image_image_user` (`user_id`),
  KEY `ix_pp_image_image_type` (`type`),
  KEY `ix_pp_image_image_category_id` (`category_id`),
  KEY `fk_pp_image_image_parent_id` (`parent_id`),
  CONSTRAINT `fk_pp_image_image_category_id` FOREIGN KEY (`category_id`) REFERENCES `pp_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_image_image_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `pp_image_image` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_image_image_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_image_image: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_image_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_image_image` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_mail_mail_event
CREATE TABLE IF NOT EXISTS `pp_mail_mail_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_mail_mail_event_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_mail_mail_event: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_mail_mail_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_mail_mail_event` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_mail_mail_template
CREATE TABLE IF NOT EXISTS `pp_mail_mail_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(150) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  `from` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `theme` text NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_mail_mail_template_code` (`code`),
  KEY `ix_pp_mail_mail_template_status` (`status`),
  KEY `ix_pp_mail_mail_template_event_id` (`event_id`),
  CONSTRAINT `fk_pp_mail_mail_template_event_id` FOREIGN KEY (`event_id`) REFERENCES `pp_mail_mail_event` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_mail_mail_template: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_mail_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_mail_mail_template` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_menu_menu
CREATE TABLE IF NOT EXISTS `pp_menu_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_menu_menu_code` (`code`),
  KEY `ix_pp_menu_menu_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_menu_menu: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `pp_menu_menu` DISABLE KEYS */;
INSERT IGNORE INTO `pp_menu_menu` (`id`, `name`, `code`, `description`, `status`) VALUES
	(1, 'Верхнее меню', 'top-menu', 'Основное меню сайта, расположенное сверху в блоке mainmenu.', 1);
/*!40000 ALTER TABLE `pp_menu_menu` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_menu_menu_item
CREATE TABLE IF NOT EXISTS `pp_menu_menu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `regular_link` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL,
  `href` varchar(150) NOT NULL,
  `class` varchar(150) NOT NULL,
  `title_attr` varchar(150) NOT NULL,
  `before_link` varchar(150) NOT NULL,
  `after_link` varchar(150) NOT NULL,
  `target` varchar(150) NOT NULL,
  `rel` varchar(150) NOT NULL,
  `condition_name` varchar(150) DEFAULT '0',
  `condition_denial` int(11) DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_pp_menu_menu_item_menu_id` (`menu_id`),
  KEY `ix_pp_menu_menu_item_sort` (`sort`),
  KEY `ix_pp_menu_menu_item_status` (`status`),
  CONSTRAINT `fk_pp_menu_menu_item_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `pp_menu_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_menu_menu_item: ~11 rows (приблизительно)
/*!40000 ALTER TABLE `pp_menu_menu_item` DISABLE KEYS */;
INSERT IGNORE INTO `pp_menu_menu_item` (`id`, `parent_id`, `menu_id`, `regular_link`, `title`, `href`, `class`, `title_attr`, `before_link`, `after_link`, `target`, `rel`, `condition_name`, `condition_denial`, `sort`, `status`) VALUES
	(1, 0, 1, 0, 'Главная', '/site/index', '', 'Главная страница сайта', '', '', '', '', '', 0, 1, 1),
	(2, 0, 1, 0, 'Блоги', '/blog/blog/index', '', 'Блоги', '', '', '', '', '', 0, 2, 1),
	(4, 2, 1, 0, 'Пользователи', '/user/people/index', '', 'Пользователи', '', '', '', '', '', 0, 3, 1),
	(6, 3, 1, 0, 'Контакты', '/feedback/contact/index', '', 'Контакты', '', '', '', '', '', 0, 6, 1),
	(7, 0, 1, 0, 'Wiki', '/wiki/default/index', '', 'Wiki', '', '', '', '', '', 0, 9, 0),
	(8, 0, 1, 0, 'Войти', '/user/account/login', 'login-text', 'Войти на сайт', '', '', '', '', 'isAuthenticated', 1, 11, 1),
	(9, 0, 1, 0, 'Выйти', '/user/account/logout', 'login-text', 'Выйти', '', '', '', '', 'isAuthenticated', 0, 12, 1),
	(10, 0, 1, 0, 'Регистрация', '/user/account/registration', 'login-text', 'Регистрация на сайте', '', '', '', '', 'isAuthenticated', 1, 10, 1),
	(11, 0, 1, 0, 'Панель управления', '/yupe/backend/index', 'login-text', 'Панель управления сайтом', '', '', '', '', 'isSuperUser', 0, 13, 1),
	(12, 0, 1, 0, 'FAQ', '/feedback/contact/faq', '', 'FAQ', '', '', '', '', '', 0, 7, 1),
	(13, 0, 1, 0, 'Контакты', '/feedback/index/', '', 'Контакты', '', '', '', '', '', 0, 7, 1);
/*!40000 ALTER TABLE `pp_menu_menu_item` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_migrations
CREATE TABLE IF NOT EXISTS `pp_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_migrations_module` (`module`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_migrations: ~26 rows (приблизительно)
/*!40000 ALTER TABLE `pp_migrations` DISABLE KEYS */;
INSERT IGNORE INTO `pp_migrations` (`id`, `module`, `version`, `apply_time`) VALUES
	(1, 'user', 'm000000_000000_user_base', 1388873416),
	(2, 'yupe', 'm000000_000000_yupe_base', 1388873419),
	(3, 'yupe', 'm130527_154455_yupe_change_unique_index', 1388873419),
	(4, 'category', 'm000000_000000_category_base', 1388873422),
	(5, 'image', 'm000000_000000_image_base', 1388873424),
	(6, 'comment', 'm000000_000000_comment_base', 1388873428),
	(7, 'news', 'm000000_000000_news_base', 1388873430),
	(8, 'page', 'm000000_000000_page_base', 1388873434),
	(9, 'page', 'm130115_155600_columns_rename', 1388873435),
	(10, 'yeeki', 'm000000_000000_yeeki_base', 1388873439),
	(11, 'menu', 'm000000_000000_menu_base', 1388873442),
	(12, 'menu', 'm121220_001126_menu_test_data', 1388873442),
	(13, 'queue', 'm000000_000000_queue_base', 1388873444),
	(14, 'gallery', 'm000000_000000_gallery_base', 1388873447),
	(15, 'gallery', 'm130427_120500_gallery_creation_user', 1388873448),
	(16, 'contentblock', 'm000000_000000_contentblock_base', 1388873450),
	(17, 'catalog', 'm000000_000000_good_base', 1388873454),
	(18, 'dictionary', 'm000000_000000_dictionary_base', 1388873457),
	(19, 'blog', 'm000000_000000_blog_base', 1388873469),
	(20, 'blog', 'm130503_091124_BlogPostImage', 1388873469),
	(21, 'blog', 'm130529_151602_add_post_category', 1388873470),
	(22, 'feedback', 'm000000_000000_feedback_base', 1388873473),
	(23, 'mail', 'm000000_000000_mail_base', 1388873476),
	(28, 'photoplus', 'm000000_000000_photoplus_base', 1388873476),
	(29, 'photoplus', 'm000000_000002_photoplus_base', 1389191827),
	(30, 'photoplus', 'm000000_000001_photoplus_base', 1389191908);
/*!40000 ALTER TABLE `pp_migrations` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_news_news
CREATE TABLE IF NOT EXISTS `pp_news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `date` date NOT NULL,
  `title` varchar(250) NOT NULL,
  `alias` varchar(150) NOT NULL,
  `short_text` text,
  `full_text` text NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `keywords` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_news_news_alias_lang` (`alias`,`lang`),
  KEY `ix_pp_news_news_status` (`status`),
  KEY `ix_pp_news_news_user_id` (`user_id`),
  KEY `ix_pp_news_news_category_id` (`category_id`),
  KEY `ix_pp_news_news_date` (`date`),
  CONSTRAINT `fk_pp_news_news_category_id` FOREIGN KEY (`category_id`) REFERENCES `pp_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_news_news_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_news_news: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_news_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_news_news` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_page_page
CREATE TABLE IF NOT EXISTS `pp_page_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `change_user_id` int(11) DEFAULT NULL,
  `title_short` varchar(150) NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `body` text NOT NULL,
  `keywords` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_page_page_slug_lang` (`slug`,`lang`),
  KEY `ix_pp_page_page_status` (`status`),
  KEY `ix_pp_page_page_is_protected` (`is_protected`),
  KEY `ix_pp_page_page_user_id` (`user_id`),
  KEY `ix_pp_page_page_change_user_id` (`change_user_id`),
  KEY `ix_pp_page_page_menu_order` (`order`),
  KEY `ix_pp_page_page_category_id` (`category_id`),
  CONSTRAINT `fk_pp_page_page_category_id` FOREIGN KEY (`category_id`) REFERENCES `pp_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_page_page_change_user_id` FOREIGN KEY (`change_user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_pp_page_page_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_page_page: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_page_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_page_page` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_photoplus_order
CREATE TABLE IF NOT EXISTS `pp_photoplus_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `creation_date` int(11) NOT NULL,
  `change_date` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `alias` varchar(150) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  `suma` float NOT NULL,
  `discount_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pp_photoplus_order_user_id` (`user_id`),
  CONSTRAINT `fk_pp_photoplus_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_photoplus_order: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_photoplus_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_photoplus_order` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_photoplus_photo
CREATE TABLE IF NOT EXISTS `pp_photoplus_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_pp_photoplus_photo_status` (`status`),
  KEY `ix_pp_photoplus_photo_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_photoplus_photo: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_photoplus_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_photoplus_photo` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_photoplus_socialkey
CREATE TABLE IF NOT EXISTS `pp_photoplus_socialkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `vkAccessToken` varchar(250) NOT NULL,
  `fbAccessToken` varchar(250) NOT NULL,
  `inAccessToken` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pp_photoplus_socialkey_user_id` (`user_id`),
  CONSTRAINT `fk_pp_photoplus_socialkey_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_photoplus_socialkey: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_photoplus_socialkey` DISABLE KEYS */;
INSERT IGNORE INTO `pp_photoplus_socialkey` (`id`, `user_id`, `vkAccessToken`, `fbAccessToken`, `inAccessToken`) VALUES
	(1, 1, '1d0199cb7b9a7baa1e2d169f3fd64b9e4708d75ee1cf595d061b6f031f6d52e310869cd1c736bae11eaf2', '', '642329144.91d121b.c889d9fdaa5a491e93fc634a70107e67');
/*!40000 ALTER TABLE `pp_photoplus_socialkey` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_queue_queue
CREATE TABLE IF NOT EXISTS `pp_queue_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `task` text NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `complete_time` datetime DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_queue_queue_worker` (`worker`),
  UNIQUE KEY `ux_pp_queue_queue_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_queue_queue: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_queue_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_queue_queue` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_user_recovery_password
CREATE TABLE IF NOT EXISTS `pp_user_recovery_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `code` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_user_recovery_password_code` (`code`),
  KEY `ix_pp_user_recovery_password_user_id` (`user_id`),
  CONSTRAINT `fk_pp_user_recovery_password_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_user_recovery_password: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_user_recovery_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_user_recovery_password` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_user_user
CREATE TABLE IF NOT EXISTS `pp_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `middle_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `nick_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birth_date` date DEFAULT NULL,
  `site` varchar(250) NOT NULL DEFAULT '',
  `about` varchar(250) NOT NULL DEFAULT '',
  `location` varchar(250) NOT NULL DEFAULT '',
  `online_status` varchar(250) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL,
  `salt` char(32) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `access_level` int(11) NOT NULL DEFAULT '0',
  `last_visit` datetime DEFAULT NULL,
  `registration_date` datetime NOT NULL,
  `registration_ip` varchar(50) NOT NULL,
  `activation_ip` varchar(50) NOT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `use_gravatar` tinyint(1) NOT NULL DEFAULT '1',
  `activate_key` char(32) NOT NULL,
  `email_confirm` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_user_user_nick_name` (`nick_name`),
  UNIQUE KEY `ux_pp_user_user_email` (`email`),
  KEY `ix_pp_user_user_status` (`status`),
  KEY `ix_pp_user_user_email_confirm` (`email_confirm`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_user_user: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `pp_user_user` DISABLE KEYS */;
INSERT IGNORE INTO `pp_user_user` (`id`, `creation_date`, `change_date`, `first_name`, `middle_name`, `last_name`, `nick_name`, `email`, `gender`, `birth_date`, `site`, `about`, `location`, `online_status`, `password`, `salt`, `status`, `access_level`, `last_visit`, `registration_date`, `registration_ip`, `activation_ip`, `avatar`, `use_gravatar`, `activate_key`, `email_confirm`) VALUES
	(1, '2014-01-05 00:11:47', '2014-01-05 00:11:47', '', '', '', 'boom', 'ruslanbanah@gmail.com', 0, NULL, '', '', '', '', '3e047ea963b54909f8abb06f67304a4a', '8583bdc15a71ad61a7c41b0be2cf360f', 1, 1, '2014-01-08 15:36:02', '2014-01-05 00:11:47', '127.0.0.1', '127.0.0.1', NULL, 1, '0fcfaf90cdcce724108433f176e57a7c', 1);
/*!40000 ALTER TABLE `pp_user_user` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_wiki_wiki_link
CREATE TABLE IF NOT EXISTS `pp_wiki_wiki_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_from_id` int(11) NOT NULL,
  `page_to_id` int(11) DEFAULT NULL,
  `wiki_uid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_pp_wiki_wiki_link_code_unique` (`page_from_id`),
  KEY `ix_pp_wiki_wiki_link_status` (`page_to_id`),
  KEY `ix_pp_wiki_wiki_link_uid` (`wiki_uid`),
  CONSTRAINT `fk_pp_wiki_wiki_link_page_from_fk` FOREIGN KEY (`page_from_id`) REFERENCES `pp_wiki_wiki_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pp_wiki_wiki_link_page_to_fk` FOREIGN KEY (`page_to_id`) REFERENCES `pp_wiki_wiki_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_wiki_wiki_link: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_wiki_wiki_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_wiki_wiki_link` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_wiki_wiki_page
CREATE TABLE IF NOT EXISTS `pp_wiki_wiki_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_redirect` tinyint(1) DEFAULT '0',
  `page_uid` varchar(250) DEFAULT NULL,
  `namespace` varchar(250) DEFAULT NULL,
  `content` text,
  `revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_pp_wiki_wiki_page_revision_id` (`revision_id`),
  KEY `ix_pp_wiki_wiki_page_user_id` (`user_id`),
  KEY `ix_pp_wiki_wiki_page_namespace` (`namespace`),
  KEY `ix_pp_wiki_wiki_page_created_at` (`created_at`),
  KEY `ix_pp_wiki_wiki_page_updated_at` (`updated_at`),
  CONSTRAINT `fk_pp_wiki_wiki_page_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `pp_wiki_wiki_page_revision` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pp_wiki_wiki_page_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_wiki_wiki_page: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_wiki_wiki_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_wiki_wiki_page` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_wiki_wiki_page_revision
CREATE TABLE IF NOT EXISTS `pp_wiki_wiki_page_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `is_minor` tinyint(1) DEFAULT NULL,
  `content` text,
  `user_id` varchar(250) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_pp_wiki_wiki_page_revision_pageid` (`page_id`),
  CONSTRAINT `fk_pp_wiki_wiki_page_revision_page` FOREIGN KEY (`page_id`) REFERENCES `pp_wiki_wiki_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_wiki_wiki_page_revision: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pp_wiki_wiki_page_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `pp_wiki_wiki_page_revision` ENABLE KEYS */;


-- Дамп структуры для таблица photo.pp_yupe_settings
CREATE TABLE IF NOT EXISTS `pp_yupe_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(100) NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `param_value` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `change_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_pp_yupe_settings_module_id_param_name_user_id` (`module_id`,`param_name`,`user_id`),
  KEY `ix_pp_yupe_settings_module_id` (`module_id`),
  KEY `ix_pp_yupe_settings_param_name` (`param_name`),
  KEY `fk_pp_yupe_settings_user_id` (`user_id`),
  CONSTRAINT `fk_pp_yupe_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `pp_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы photo.pp_yupe_settings: ~15 rows (приблизительно)
/*!40000 ALTER TABLE `pp_yupe_settings` DISABLE KEYS */;
INSERT IGNORE INTO `pp_yupe_settings` (`id`, `module_id`, `param_name`, `param_value`, `creation_date`, `change_date`, `user_id`, `type`) VALUES
	(1, 'yupe', 'siteDescription', 'Фото-Плюс', '2014-01-05 00:12:55', '2014-01-05 00:12:55', 1, 1),
	(2, 'yupe', 'siteName', 'PhotoPlus', '2014-01-05 00:12:55', '2014-01-05 00:12:55', 1, 1),
	(3, 'yupe', 'siteKeyWords', 'фото, друк, якість, фотографія, банах', '2014-01-05 00:12:55', '2014-01-05 00:12:55', 1, 1),
	(4, 'yupe', 'email', 'ruslanbanah@gmail.com', '2014-01-05 00:12:55', '2014-01-05 00:12:55', 1, 1),
	(5, 'yupe', 'theme', 'default', '2014-01-05 00:12:55', '2014-01-05 00:12:55', 1, 1),
	(6, 'yupe', 'backendTheme', '', '2014-01-05 00:12:55', '2014-01-05 00:12:55', 1, 1),
	(7, 'photoplus', 'adminMenuOrder', '0', '2014-01-05 19:19:26', '2014-01-05 19:19:26', 1, 1),
	(8, 'photoplus', 'editor', 'application.modules.yupe.widgets.editors.imperaviRedactor.ImperaviRedactorWidget', '2014-01-05 19:19:26', '2014-01-05 19:19:26', 1, 1),
	(9, 'photoplus', 'uploadPath', 'PhotoPlus', '2014-01-05 19:19:26', '2014-01-05 19:19:26', 1, 1),
	(10, 'photoplus', 'vkontakte_app_id', '4101382', '2014-01-05 19:19:26', '2014-01-05 19:19:26', 1, 1),
	(11, 'photoplus', 'vkontakte_secret', 'EYDr0EO1HmcjKqIXoLfA', '2014-01-05 19:19:26', '2014-01-05 19:19:26', 1, 1),
	(12, 'photoplus', 'facebook_app_id', '', '2014-01-05 19:19:26', '2014-01-05 19:19:26', 1, 1),
	(13, 'photoplus', 'facebook_secret', '', '2014-01-05 19:19:26', '2014-01-05 19:19:26', 1, 1),
	(14, 'photoplus', 'instagram_app_id', '91d121b5a2f5441f9a9a13fa609646db', '2014-01-05 19:19:26', '2014-01-06 01:47:44', 1, 1),
	(15, 'photoplus', 'instagram_secret', '440e7a79bd4140cb8f41f829dcce317b', '2014-01-05 19:19:26', '2014-01-06 01:47:44', 1, 1);
/*!40000 ALTER TABLE `pp_yupe_settings` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
