-- --------------------------------------------------------
-- Please note:
-- The table prefix (cat_) will be replaced by the
-- installer! Do NOT use this file to create the tables
-- manually! (Or patch it to fit your needs first.)
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


DROP TABLE IF EXISTS `cat_addons`;
DROP TABLE IF EXISTS `cat_groups`;
DROP TABLE IF EXISTS `cat_mod_captcha_control`;
DROP TABLE IF EXISTS `cat_mod_dropleps_permissions`;
DROP TABLE IF EXISTS `cat_mod_dropleps_settings`;
DROP TABLE IF EXISTS `cat_mod_droplets`;
DROP TABLE IF EXISTS `cat_mod_form_fields`;
DROP TABLE IF EXISTS `cat_mod_form_settings`;
DROP TABLE IF EXISTS `cat_mod_form_submissions`;
DROP TABLE IF EXISTS `cat_mod_initial_page`;
DROP TABLE IF EXISTS `cat_mod_menu_link`;
DROP TABLE IF EXISTS `cat_mod_news_comments`;
DROP TABLE IF EXISTS `cat_mod_news_groups`;
DROP TABLE IF EXISTS `cat_mod_news_posts`;
DROP TABLE IF EXISTS `cat_mod_news_settings`;
DROP TABLE IF EXISTS `cat_mod_output_interface`;
DROP TABLE IF EXISTS `cat_mod_wrapper`;
DROP TABLE IF EXISTS `cat_mod_wysiwyg`;
DROP TABLE IF EXISTS `cat_mod_wysiwyg_admin`;
DROP TABLE IF EXISTS `cat_pages`;
DROP TABLE IF EXISTS `cat_pages_load`;
DROP TABLE IF EXISTS `cat_page_langs`;
DROP TABLE IF EXISTS `cat_search`;
DROP TABLE IF EXISTS `cat_sections`;
DROP TABLE IF EXISTS `cat_settings`;
DROP TABLE IF EXISTS `cat_users`;
DROP TABLE IF EXISTS `cat_users_options`;
DROP TABLE IF EXISTS `cat_class_secure`;
DROP TABLE IF EXISTS `cat_mod_wysiwyg_admin_v2`;

CREATE TABLE IF NOT EXISTS `cat_addons` (
  `addon_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL DEFAULT '',
  `directory` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `function` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `guid` varchar(50) NOT NULL,
  `platform` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) NOT NULL DEFAULT '',
  `license` varchar(255) NOT NULL DEFAULT '',
  `installed` VARCHAR(255) NOT NULL DEFAULT '',
  `upgraded` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`addon_id`),
  UNIQUE KEY `type` (`type`,`directory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `system_permissions` text NOT NULL,
  `module_permissions` text NOT NULL,
  `template_permissions` text NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_captcha_control` (
  `enabled_captcha` varchar(1) NOT NULL DEFAULT '1',
  `enabled_asp` varchar(1) NOT NULL DEFAULT '0',
  `captcha_type` varchar(255) NOT NULL DEFAULT 'calc_text',
  `asp_session_min_age` int(11) NOT NULL DEFAULT '20',
  `asp_view_min_age` int(11) NOT NULL DEFAULT '10',
  `asp_input_min_age` int(11) NOT NULL DEFAULT '5',
  `ct_text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_dropleps_permissions` (
  `id` int(10) unsigned NOT NULL,
  `edit_groups` varchar(50) NOT NULL,
  `view_groups` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_dropleps_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute` varchar(50) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_droplets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` longtext NOT NULL,
  `description` text NOT NULL,
  `modified_when` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `admin_edit` int(11) NOT NULL DEFAULT '0',
  `admin_view` int(11) NOT NULL DEFAULT '0',
  `show_wysiwyg` int(11) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_form_fields` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `required` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_form_settings` (
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `header` text NOT NULL,
  `field_loop` text NOT NULL,
  `footer` text NOT NULL,
  `email_to` text NOT NULL,
  `email_from` varchar(255) NOT NULL DEFAULT '',
  `email_fromname` varchar(255) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `success_page` text NOT NULL,
  `success_email_to` text NOT NULL,
  `success_email_from` varchar(255) NOT NULL DEFAULT '',
  `success_email_fromname` varchar(255) NOT NULL DEFAULT '',
  `success_email_text` text NOT NULL,
  `success_email_subject` varchar(255) NOT NULL DEFAULT '',
  `stored_submissions` int(11) NOT NULL DEFAULT '0',
  `max_submissions` int(11) NOT NULL DEFAULT '0',
  `use_captcha` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_form_submissions` (
  `submission_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `submitted_when` int(11) NOT NULL DEFAULT '0',
  `submitted_by` int(11) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  PRIMARY KEY (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_menu_link` (
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `target_page_id` int(11) NOT NULL DEFAULT '0',
  `redirect_type` int(11) NOT NULL DEFAULT '302',
  `anchor` varchar(255) NOT NULL DEFAULT '0',
  `extern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_news_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `commented_when` int(11) NOT NULL DEFAULT '0',
  `commented_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `cat_mod_news_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_news_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `content_short` text NOT NULL,
  `content_long` text NOT NULL,
  `commenting` varchar(7) NOT NULL DEFAULT '',
  `published_when` int(11) NOT NULL DEFAULT '0',
  `published_until` int(11) NOT NULL DEFAULT '0',
  `posted_when` int(11) NOT NULL DEFAULT '0',
  `posted_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_news_settings` (
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `header` text NOT NULL,
  `post_loop` text NOT NULL,
  `footer` text NOT NULL,
  `posts_per_page` int(11) NOT NULL DEFAULT '0',
  `post_header` text NOT NULL,
  `post_footer` text NOT NULL,
  `comments_header` text NOT NULL,
  `comments_loop` text NOT NULL,
  `comments_footer` text NOT NULL,
  `comments_page` text NOT NULL,
  `commenting` varchar(7) NOT NULL DEFAULT '',
  `resize` int(11) NOT NULL DEFAULT '0',
  `use_captcha` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_output_interface` (
  `module_directory` varchar(64) NOT NULL DEFAULT '',
  `module_name` varchar(64) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_directory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_wrapper` (
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `url` text NOT NULL,
  `height` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '0',
  `wtype` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_mod_wysiwyg` (
  `section_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT '0',
  `root_parent` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `link` text NOT NULL,
  `target` varchar(7) NOT NULL DEFAULT '',
  `page_title` varchar(255) NOT NULL DEFAULT '',
  `menu_title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `page_trail` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '',
  `visibility` varchar(255) NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `menu` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) NOT NULL DEFAULT '',
  `searching` int(11) NOT NULL DEFAULT '0',
  `admin_groups` text NOT NULL,
  `admin_users` text NOT NULL,
  `viewing_groups` text NOT NULL,
  `viewing_users` text NOT NULL,
  `modified_when` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `page_groups` tinytext,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_pages_load` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `register_name` varchar(255) NOT NULL DEFAULT '',
  `register_type` varchar(64) NOT NULL DEFAULT 'droplep',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `module_directory` varchar(255) NOT NULL DEFAULT '',
  `file_type` varchar(128) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_path` text NOT NULL,
  `options` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_page_langs` (
  `page_id` int(10) NOT NULL,
  `lang` char(2) NOT NULL,
  `link_page_id` int(10) NOT NULL,
  UNIQUE KEY `page_id_lang_link_page_id` (`page_id`,`lang`,`link_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links pages of different languages together';

CREATE TABLE IF NOT EXISTS `cat_search` (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `block` varchar(255) NOT NULL DEFAULT '',
  `publ_start` varchar(255) NOT NULL DEFAULT '0',
  `publ_end` varchar(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'no name',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` varchar(255) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `statusflags` int(11) NOT NULL DEFAULT '6',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `last_reset` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(255) NOT NULL DEFAULT '',
  `email` text NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'DE',
  `home_folder` text NOT NULL,
  `login_when` int(11) NOT NULL DEFAULT '0',
  `login_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_users_options` (
	`user_id` INT(10) NOT NULL,
	`option_name` VARCHAR(50) NOT NULL,
	`option_value` VARCHAR(255) NOT NULL
)
COMMENT='additional expandable settings for users' ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `cat_mod_initial_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `init_page` text NOT NULL,
  `page_param` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cat_class_secure` (
	`module` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`filepath` VARCHAR(255) NOT NULL DEFAULT '0',
	UNIQUE INDEX `module_filepath` (`module`, `filepath`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `cat_mod_wysiwyg_admin_v2` (
	`editor` VARCHAR(50) NOT NULL,
	`set_name` VARCHAR(50) NOT NULL,
	`set_value` VARCHAR(50) NOT NULL,
	UNIQUE INDEX `editor_set_name` (`editor`, `set_name`)
)
COMMENT='WYSIWYG Admin for Black Cat CMS'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
