ALTER TABLE `prefix_page` CHANGE `page_id` `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ;
ALTER TABLE `prefix_page` CHANGE `page_pid` `pid` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_url` `url` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_url_full` `url_full` VARCHAR( 254 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_title` `title` VARCHAR( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_text` `text` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_date_add` `date_add` DATETIME NOT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_date_edit` `date_edit` DATETIME NULL DEFAULT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_seo_keywords` `seo_keywords` VARCHAR( 250 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_seo_description` `seo_description` VARCHAR( 250 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_active` `active` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT '1';
ALTER TABLE `prefix_page` CHANGE `page_main` `main` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `prefix_page` CHANGE `page_sort` `sort` INT( 11 ) NOT NULL ;
ALTER TABLE `prefix_page` CHANGE `page_auto_br` `auto_br` TINYINT( 1 ) NOT NULL DEFAULT '1';
ALTER TABLE `prefix_page` ADD `text_source` TEXT NULL DEFAULT NULL AFTER `text`;
UPDATE `prefix_page` SET text_source = text;