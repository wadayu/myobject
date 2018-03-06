-- MySQL dump 10.13  Distrib 5.5.53, for Linux (x86_64)
--
-- Host: localhost    Database: myobject
-- ------------------------------------------------------
-- Server version	5.5.53-log

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
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'TestGroup');
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,2,37),(3,2,38),(4,2,39),(1,2,69);
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 用户信息',7,'add_userprofile'),(20,'Can change 用户信息',7,'change_userprofile'),(21,'Can delete 用户信息',7,'delete_userprofile'),(22,'Can add 邮箱验证码',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证码',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证码',8,'delete_emailverifyrecord'),(25,'Can add 轮播图',9,'add_banner'),(26,'Can change 轮播图',9,'change_banner'),(27,'Can delete 轮播图',9,'delete_banner'),(28,'Can add 课程',10,'add_course'),(29,'Can change 课程',10,'change_course'),(30,'Can delete 课程',10,'delete_course'),(31,'Can add 章节',11,'add_lesson'),(32,'Can change 章节',11,'change_lesson'),(33,'Can delete 章节',11,'delete_lesson'),(34,'Can add 视频',12,'add_video'),(35,'Can change 视频',12,'change_video'),(36,'Can delete 视频',12,'delete_video'),(37,'Can add 课程资源',13,'add_courseresource'),(38,'Can change 课程资源',13,'change_courseresource'),(39,'Can delete 课程资源',13,'delete_courseresource'),(40,'Can add 城市',14,'add_citydict'),(41,'Can change 城市',14,'change_citydict'),(42,'Can delete 城市',14,'delete_citydict'),(43,'Can add 机构',15,'add_courseorg'),(44,'Can change 机构',15,'change_courseorg'),(45,'Can delete 机构',15,'delete_courseorg'),(46,'Can add 教师',16,'add_teacher'),(47,'Can change 教师',16,'change_teacher'),(48,'Can delete 教师',16,'delete_teacher'),(49,'Can add 用户咨询',17,'add_userask'),(50,'Can change 用户咨询',17,'change_userask'),(51,'Can delete 用户咨询',17,'delete_userask'),(52,'Can add 课程评论',18,'add_cousrecomments'),(53,'Can change 课程评论',18,'change_cousrecomments'),(54,'Can delete 课程评论',18,'delete_cousrecomments'),(55,'Can add 用户收藏',19,'add_userfavorite'),(56,'Can change 用户收藏',19,'change_userfavorite'),(57,'Can delete 用户收藏',19,'delete_userfavorite'),(58,'Can add 用户消息',20,'add_usermessage'),(59,'Can change 用户消息',20,'change_usermessage'),(60,'Can delete 用户消息',20,'delete_usermessage'),(61,'Can add 用户课程',21,'add_usercourse'),(62,'Can change 用户课程',21,'change_usercourse'),(63,'Can delete 用户课程',21,'delete_usercourse'),(64,'Can view log entry',1,'view_logentry'),(65,'Can view group',3,'view_group'),(66,'Can view permission',2,'view_permission'),(67,'Can view content type',5,'view_contenttype'),(68,'Can view 课程',10,'view_course'),(69,'Can view 课程资源',13,'view_courseresource'),(70,'Can view 章节',11,'view_lesson'),(71,'Can view 视频',12,'view_video'),(72,'Can view 课程评论',18,'view_cousrecomments'),(73,'Can view 用户咨询',17,'view_userask'),(74,'Can view 用户课程',21,'view_usercourse'),(75,'Can view 用户收藏',19,'view_userfavorite'),(76,'Can view 用户消息',20,'view_usermessage'),(77,'Can view 城市',14,'view_citydict'),(78,'Can view 机构',15,'view_courseorg'),(79,'Can view 教师',16,'view_teacher'),(80,'Can view session',6,'view_session'),(81,'Can view 轮播图',9,'view_banner'),(82,'Can view 邮箱验证码',8,'view_emailverifyrecord'),(83,'Can view 用户信息',7,'view_userprofile'),(84,'Can add Bookmark',22,'add_bookmark'),(85,'Can change Bookmark',22,'change_bookmark'),(86,'Can delete Bookmark',22,'delete_bookmark'),(87,'Can add User Setting',23,'add_usersettings'),(88,'Can change User Setting',23,'change_usersettings'),(89,'Can delete User Setting',23,'delete_usersettings'),(90,'Can add User Widget',24,'add_userwidget'),(91,'Can change User Widget',24,'change_userwidget'),(92,'Can delete User Widget',24,'delete_userwidget'),(93,'Can add log entry',25,'add_log'),(94,'Can change log entry',25,'change_log'),(95,'Can delete log entry',25,'delete_log'),(96,'Can view Bookmark',22,'view_bookmark'),(97,'Can view log entry',25,'view_log'),(98,'Can view User Setting',23,'view_usersettings'),(99,'Can view User Widget',24,'view_userwidget'),(100,'Can add captcha store',26,'add_captchastore'),(101,'Can change captcha store',26,'change_captchastore'),(102,'Can delete captcha store',26,'delete_captchastore'),(103,'Can view captcha store',26,'view_captchastore');
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
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(5) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `course_type` varchar(50) NOT NULL,
  `tag` varchar(20) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_d9614d40` (`teacher_id`) USING BTREE,
  KEY `courses_course_11456c5a` (`course_org_id`) USING BTREE,
  CONSTRAINT `courses_course_ibfk_1` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'django入门','django入门','django入门','zj',0,1,1,'courses/2018/01/105.jpg',33,'2018-01-25 11:01:00',2,1,'后端开发','',0),(2,'python 基础知识','python 基础知识','python 基础知识','zj',0,0,0,'courses/2018/01/0034034499213463_b.jpg',10,'2018-01-31 11:18:00',1,1,'后端开发','',0),(3,'python 正则表达式','python 正则表达式','python 正则表达式','gj',0,0,0,'courses/2018/01/34fae6cd7b899e51fab3e9c048a7d933c8950d21.jpg',15,'2018-01-31 11:19:00',2,1,'后端开发','',0),(4,'Python 高级爬虫','Python 高级爬虫','Python 高级爬虫','gj',0,0,0,'courses/2018/01/timg.jpg',7,'2018-01-31 13:46:00',1,1,'后端开发','',0),(5,'Python 面向对象','Python 面向对象','Python 面向对象','cj',0,3,2,'courses/2018/01/timg_1.jpg',56,'2018-01-31 13:47:00',1,1,'后端开发','python',0),(6,'Python flask入门','Python flask入门','<p><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/>&nbsp; &nbsp; Python flask入门<img src=\"http://img.baidu.com/hi/jx2/j_0004.gif\"/> <img src=\"/media/course/editor/QQ截图20170922093014_20180211164833_254.png\" title=\"\" alt=\"QQ截图20170922093014.png\"/> </p>','cj',0,35,3,'courses/2018/01/timg_2.jpg',314,'2018-01-31 13:50:00',2,1,'后端开发','python',0),(7,'Python 协程知识','Python 协程知识','Python 协程知识','cj',0,2,2,'courses/2018/01/timg_3.jpg',30,'2018-01-31 13:50:00',1,1,'后端开发','',1),(9,'drf基础入门','drf基础入门','<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0004.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p>','cj',32,0,0,'courses/2018/02/timg_5_xqiz9TH.jpg',4,'2018-02-09 16:10:53',1,1,'Python','python',0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresource_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'Django-1.11.2.tar.gz','course/resource/2018/02/Django-1.11.2.tar.gz','2018-02-02 14:50:00',6),(2,'mysqlclient-1.3.10-cp35-cp35m-win_amd64.whl','course/resource/2018/02/mysqlclient-1.3.10-cp35-cp35m-win_amd64.whl','2018-02-02 14:51:00',6),(4,'apache-tomcat-8.5.9.tar.gz','course/resource/2018/02/apache-tomcat-8.5.9.tar_kpHY2m6.gz','2018-02-09 16:09:00',9);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一节 基础入门','2018-02-02 11:52:00',6),(2,'第二节 MVC模式详解','2018-02-02 11:52:00',6),(4,'第一节 基础入门讲解','2018-02-09 16:09:00',9),(5,'第三节 MVC实列演示','2018-02-09 16:40:00',6);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`) USING BTREE,
  CONSTRAINT `courses_video_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1、基本语法','http://v3.mukewang.com/shizhan/585b47cbe420e542708b457d/H.mp4',29,'2018-02-02 11:54:00',1),(2,'2、特殊语法','http://v3.mukewang.com/shizhan/585b47cbe420e542708b457d/H.mp4',11,'2018-02-02 11:58:00',1),(3,'1、模式介绍','http://v3.mukewang.com/shizhan/585b47cbe420e542708b457d/H.mp4',11,'2018-02-02 13:10:00',2),(4,'2、mvc用途','http://v3.mukewang.com/shizhan/585b47cbe420e542708b457d/H.mp4',5,'2018-02-02 13:10:00',2);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(26,'captcha','captchastore'),(5,'contenttypes','contenttype'),(10,'courses','course'),(13,'courses','courseresource'),(11,'courses','lesson'),(12,'courses','video'),(18,'operation','cousrecomments'),(17,'operation','userask'),(21,'operation','usercourse'),(19,'operation','userfavorite'),(20,'operation','usermessage'),(14,'organization','citydict'),(15,'organization','courseorg'),(16,'organization','teacher'),(6,'sessions','session'),(9,'users','banner'),(8,'users','emailverifyrecord'),(7,'users','userprofile'),(22,'xadmin','bookmark'),(25,'xadmin','log'),(23,'xadmin','usersettings'),(24,'xadmin','userwidget');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-01-24 02:23:06'),(2,'auth','0001_initial','2018-01-24 02:23:07'),(3,'admin','0001_initial','2018-01-24 02:23:07'),(4,'admin','0002_logentry_remove_auto_add','2018-01-24 02:23:07'),(5,'contenttypes','0002_remove_content_type_name','2018-01-24 02:23:07'),(6,'auth','0002_alter_permission_name_max_length','2018-01-24 02:23:07'),(7,'auth','0003_alter_user_email_max_length','2018-01-24 02:23:07'),(8,'auth','0004_alter_user_username_opts','2018-01-24 02:23:07'),(9,'auth','0005_alter_user_last_login_null','2018-01-24 02:23:07'),(10,'auth','0006_require_contenttypes_0002','2018-01-24 02:23:07'),(11,'auth','0007_alter_validators_add_error_messages','2018-01-24 02:23:07'),(12,'sessions','0001_initial','2018-01-24 02:23:07'),(13,'users','0001_initial','2018-01-24 02:56:34'),(14,'users','0002_banner_emailverifyrecord','2018-01-24 03:42:46'),(15,'courses','0001_initial','2018-01-24 05:57:07'),(16,'organization','0001_initial','2018-01-24 06:29:53'),(17,'operation','0001_initial','2018-01-24 07:15:17'),(18,'xadmin','0001_initial','2018-01-24 17:05:56'),(19,'xadmin','0002_log','2018-01-24 17:05:56'),(20,'xadmin','0003_auto_20160715_0100','2018-01-24 17:05:56'),(21,'captcha','0001_initial','2018-01-26 10:54:00'),(22,'organization','0002_auto_20180129_1639','2018-01-29 16:39:13'),(23,'organization','0003_courseorg_course_nums','2018-01-30 15:09:13'),(24,'courses','0002_course_course_org','2018-01-31 10:30:23'),(25,'courses','0003_course_teacher','2018-01-31 15:30:39'),(26,'courses','0004_remove_course_course_org','2018-01-31 16:18:03'),(27,'courses','0005_course_course_org','2018-01-31 16:20:47'),(28,'courses','0006_course_course_type','2018-02-01 16:30:35'),(29,'courses','0007_course_tag','2018-02-02 10:41:14'),(30,'users','0003_auto_20180207_1353','2018-02-07 13:53:09'),(31,'users','0004_auto_20180207_1357','2018-02-07 13:57:11'),(32,'courses','0008_course_is_banner','2018-02-08 14:35:50'),(33,'courses','0009_auto_20180211_1642','2018-02-11 16:43:00'),(34,'operation','0002_auto_20180211_1701','2018-02-11 17:01:51');
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
  KEY `django_session_de54fa62` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('62f0qek0ws60hcurerzv5biey8ot9z2d','YzdhNmJjYmM2NzZkNTRjN2QyMGZmMmI3NmZlN2M3MDRkNmM2ZDdhYzp7IkxJU1RfUVVFUlkiOltbImNvdXJzZXMiLCJjb3Vyc2VyZXNvdXJjZSJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmU1ZjY2Y2Q2YmQ1ZWNiNmFiYjg3ODY2NGFiMDc3N2Y1MTVlZDQ5YSJ9','2018-02-23 16:08:22'),('9sgy3yp7tp4l8hx8188ulc2u0quzefnw','ZGM4OTEzOTEwYmU0YTRjYjkwNGJlMGY4MzZmNjI5Yzg1ZWVhZTA2Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sib3BlcmF0aW9uIiwidXNlcm1lc3NhZ2UiXSwiIl0sIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZTVmNjZjZDZiZDVlY2I2YWJiODc4NjY0YWIwNzc3ZjUxNWVkNDlhIn0=','2018-02-25 17:12:25'),('dzi17q1j6pcfef29u8g3nxcluoawl98e','MTcyY2RjODQxY2U5ZDIzYmE3ZjJlNjg5NmJkYjU4ZjMyNzEzNTZkOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZTVmNjZjZDZiZDVlY2I2YWJiODc4NjY0YWIwNzc3ZjUxNWVkNDlhIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-01-23 09:11:11'),('x869h3v22avbh13ilpdjoy5u63osts7r','MTcyY2RjODQxY2U5ZDIzYmE3ZjJlNjg5NmJkYjU4ZjMyNzEzNTZkOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZTVmNjZjZDZiZDVlY2I2YWJiODc4NjY0YWIwNzc3ZjUxNWVkNDlhIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2018-01-10 09:24:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_cousrecomments`
--

DROP TABLE IF EXISTS `operation_cousrecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_cousrecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` longtext NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_cousrecomments_course_id_a8b1ff7a_fk_courses_course_id` (`course_id`) USING BTREE,
  KEY `operation_cousrecomment_user_id_f8d89e94_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `operation_cousrecomments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_cousrecomments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_cousrecomments`
--

LOCK TABLES `operation_cousrecomments` WRITE;
/*!40000 ALTER TABLE `operation_cousrecomments` DISABLE KEYS */;
INSERT INTO `operation_cousrecomments` VALUES (1,'讲的不好啊，钱白费了','2018-02-02 16:01:10',6,1),(2,'老师今天喝多了吗，讲的一点听不明白啊','2018-02-02 16:08:30',6,1),(3,'这老师真是不懂啊','2018-02-02 16:09:17',6,1),(4,'毛也没有','2018-02-02 16:10:07',7,1),(5,'<p><img src=\"http://img.baidu.com/hi/jx2/j_0029.gif\"/></p>','2018-02-02 16:12:00',6,1);
/*!40000 ALTER TABLE `operation_cousrecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'testwang','1232342','jlasdfadfad','2018-01-30 17:13:03'),(2,'wang','13235','jalkjsfewrew','2018-01-30 17:14:31'),(3,'John','13829902341','django','2018-01-30 17:16:57');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`) USING BTREE,
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `operation_usercourse_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2018-02-01 16:41:00',5,25),(2,'2018-02-05 11:39:46',6,1),(3,'2018-02-05 11:40:35',7,1),(4,'2018-02-05 11:42:17',2,1),(5,'2018-02-05 11:42:29',4,1),(6,'2018-02-05 11:43:56',5,1),(7,'2018-02-05 11:44:08',1,1),(8,'2018-02-05 11:44:42',6,25),(9,'2018-02-05 11:46:30',7,25),(10,'2018-02-08 11:26:06',3,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `operation_userfavorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (18,6,1,'2018-02-05 11:40:30',1),(19,7,1,'2018-02-05 11:46:39',25),(20,1,2,'2018-02-05 11:49:12',25),(21,6,1,'2018-02-05 11:50:38',25),(22,1,1,'2018-02-05 11:52:27',25),(23,7,1,'2018-02-05 11:54:23',1),(48,1,2,'2018-02-07 16:53:05',1),(49,5,1,'2018-02-07 16:53:14',1),(50,1,3,'2018-02-07 16:53:19',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,1,'你好！admin',1,'2018-02-08 11:12:15'),(2,1,'欢迎注册',1,'2018-02-08 11:15:30'),(4,30,'1059653878@qq.com，欢迎你的注册',0,'2018-02-08 13:19:03');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','北京市','2018-01-29 15:43:00'),(2,'上海市','上海市','2018-01-29 15:43:00'),(3,'天津市','天津市','2018-01-29 15:43:00'),(4,'广州市','广州市','2018-01-29 15:44:00'),(5,'深圳市','深圳市','2018-01-29 15:44:00');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `category` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `students` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `city_id` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`) USING BTREE,
  CONSTRAINT `organization_courseorg_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'慕课网1','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。','pxjg',16,3,'org/2018/01/2518-11091022102134.jpg','北京市东直门1002号',0,'2018-01-29 15:44:00',1,8),(2,'慕课网2','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。','gr',1,0,'org/2018/01/267867-121210221S468.jpg','上海市1002弄',0,'2018-01-29 15:46:00',2,0),(3,'慕课网3','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。','gx',0,0,'org/2018/01/305280_111358597000_2.jpg','天津市河西区1002号',0,'2018-01-29 15:47:00',3,0),(4,'慕课网4','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。','pxjg',0,0,'org/2018/01/3822951_100424174000_2.jpg','广州市嘉庆区1002号',0,'2018-01-29 15:55:00',4,0),(5,'慕课网5','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。','gr',0,0,'org/2018/01/7810872_105633525000_2.jpg','深圳市福田区1002号',0,'2018-01-29 15:56:00',5,0),(6,'慕课网6','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。','gx',1,0,'org/2018/01/11635625338987.jpg','北京市崇文门100号',0,'2018-01-29 15:57:00',1,0),(7,'慕课网7','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。','gx',0,0,'org/2018/01/0014027220585030_b.jpg','天津市河北区100号',0,'2018-01-29 15:58:00',3,0),(8,'慕课网8','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。','gr',1,0,'org/2018/01/0038038040966546_b.jpg','广州市白云区广厦路110号',0,'2018-01-29 15:58:00',4,0);
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `add_time` datetime NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`) USING BTREE,
  CONSTRAINT `organization_teacher_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'刘翠花',21,3,'北京京东科技公司','Python开发','幽默，大方',6,2,'teacher/2018/01/240454-14021113543021.jpg','2018-01-31 11:20:00',1),(2,'范小贱',28,6,'北京百度科技有限公司','Python高级开发','经验丰富，严谨',0,0,'teacher/2018/01/QQ图片20180131154942.png','2018-01-31 11:25:00',1);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (2,'第一张','banner/2018/02/57a801860001c34b12000460.jpg','http://www.baidu.com',1,'2018-02-08 14:50:00'),(3,'第二张','banner/2018/02/21009700_980x1200_0.jpg','http://www.sina.com',2,'2018-02-08 14:51:00'),(4,'第三张','banner/2018/02/21009704_980x1200_0.jpg','http://www.163.com',3,'2018-02-08 14:51:00'),(5,'第四张','banner/2018/02/21009719_980x1200_0.jpg','http://www.taobao.com',4,'2018-02-08 14:52:00'),(6,'第五张','banner/2018/02/21009721_980x1200_0.jpg','http://www.jd.com',5,'2018-02-08 14:52:00');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `send_type` varchar(15) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (3,'mhgj','wadayu@163.com','register','2018-01-25 09:12:00'),(4,'foer','admin@163.com','register','2018-01-25 09:14:00'),(5,'mbjr','john@163.com','forget','2018-01-25 09:14:00'),(6,'pYh0zzqdBTTG3hu9iz','wadayu@163.com','register','2018-01-26 15:02:28'),(7,'zLAjdufmiP2Bl9YFpc','wadayu@163.com','register','2018-01-26 15:26:06'),(8,'KnCg3ZthneG0UWjrJz','wadayu@163.com','register','2018-01-26 15:27:31'),(9,'OwV59rs9R2fBOYvPkg','wadayu@163.com','register','2018-01-26 15:32:20'),(10,'zLTfpIUS1qXGLoTu2W','wadayu@163.com','register','2018-01-26 15:33:11'),(11,'ZdXjcnHEox4Fvoorv2','wadayu@163.com','register','2018-01-26 15:34:13'),(12,'r4NBdsT4vQep4ilgfV','597353673@qq.com','register','2018-01-26 15:35:38'),(13,'aHUQVAYMQ4nvleZTg4','wadayu@163.com','register','2018-01-26 15:49:53'),(14,'RpOZ87vSwoorcyTT68','wadayu@163.com','register','2018-01-26 15:50:24'),(19,'6746WCxu3WgW3aVW7S','wadayu@163.com','register','2018-01-26 16:36:22'),(20,'IwrvDKBEjfjhINti7T','wadayu@163.com','register','2018-01-26 16:37:56'),(24,'HlDedyoQ3VgcOLamUE','wadayu@163.com','forget','2018-01-29 11:20:54'),(25,'XqurBEO2jsuSjHipmz','wadayu@163.com','forget','2018-01-29 11:22:11'),(26,'KbRnS8ZpID68vsYomd','wadayu@163.com','forget','2018-01-29 11:22:47'),(27,'YSjuHNXr4BT0tf5Byd','wadayu@163.com','forget','2018-01-29 11:24:28'),(28,'EHrcDeA5pbEpf9c6HZ','wadayu@163.com','forget','2018-01-29 11:25:15'),(29,'FI2AlE1cvySR36YAXW','wadayu@163.com','forget','2018-01-29 11:26:30'),(32,'i3iuFsx4W7GW2oAcO6','wadayu@163.com','forget','2018-01-29 13:30:10'),(33,'6DE5zBBrsLrqumZzay','wadayu@163.com','forget','2018-01-29 13:56:21'),(34,'8fuCEQcIH7dNco3HVH','wadayu@163.com','forget','2018-01-29 13:57:14'),(35,'4HuD6w193783ll7hFL','wadayu@163.com','forget','2018-01-29 13:58:39'),(36,'kAq1fYOgYNaRA3om88','wadayu@163.com','forget','2018-01-29 14:00:47'),(37,'RD83ZwzmWlcNZzljLa','wadayu@163.com','forget','2018-01-29 14:07:32'),(40,'gBw3x4ShKbwp50IqYs','1059653878@qq.com','register','2018-02-08 13:14:33');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
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
  `nick_name` varchar(20) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$24000$MRbkoGXpU0lr$bFPI5cXXOmgQTXc+nfCbgpb0kgD7d4iFWhOOJD/74Nk=','2018-02-09 14:03:00',1,'admin','','','admin@163.com',1,1,'2018-01-24 17:04:00','admin','2018-02-06','remale','北京市','13121502280','image/2018/02/default_middile_8_0USNMi1.png'),(2,'pbkdf2_sha256$24000$D0yVlZ6R9PDk$BlbsQqu+yq6H8+pGR8EhtfMt6SN9BV+ixZip1g4eS5E=','2018-01-26 09:23:09',0,'wangdaoyun','','','',0,0,'2018-01-25 09:18:00','wangdaoyun',NULL,'male','北京市','','image/default.png'),(3,'pbkdf2_sha256$24000$cSGs2DzJLkqU$ZL/C6oOZ9bYqpeBgx1h2O/EHoBTdNo8dQeZwOhY9PCU=',NULL,0,'testuser','','','',0,1,'2018-01-25 09:18:00','testuser',NULL,'male','北京市','','image/default.png'),(4,'pbkdf2_sha256$24000$EwAaZZhsiHWm$FVSqlakdbX0R4VSLkzCNyRxSml7UGw0YJFjHDCfoxWw=','2018-01-25 17:28:23',1,'王道云','','','',1,1,'2018-01-25 17:19:00','道哥',NULL,'male','北京市','','image/2018/01/搜狗截图20170523132802.png'),(14,'pbkdf2_sha256$24000$A5aeAxjONKVM$bGIHxujZlwo5cFoGi2Ofu/FQG0L0IF6g8glZmR/6XjA=',NULL,0,'597353673@qq.com','','','597353673@qq.com',0,0,'2018-01-26 15:35:38','',NULL,'male','',NULL,'image/default.png'),(25,'pbkdf2_sha256$24000$4TQoxv5MK3ef$Tx+ay1mxIHicwNNx59ZdCbZtp12Ezm3t8o+5bgTypUQ=','2018-02-09 14:02:08',0,'wadayu@163.com','','','wadayu@163.com',1,1,'2018-01-26 16:42:00','admin',NULL,'male','北京市','','image/2018/02/default_big_14.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`) USING BTREE,
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_groups_ibfk_1` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
INSERT INTO `users_userprofile_groups` VALUES (2,25,2);
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`) USING BTREE,
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_user_permissions_ibfk_1` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
INSERT INTO `users_userprofile_user_permissions` VALUES (67,25,70),(74,25,77),(76,25,79),(79,25,82);
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-01-25 09:09:00','127.0.0.1','1','EmailVerifyRecord object','create','已添加',8,1),(2,'2018-01-25 09:09:24','127.0.0.1','2','EmailVerifyRecord object','create','已添加',8,1),(3,'2018-01-25 09:09:57','127.0.0.1','2','EmailVerifyRecord object','change','已修改 send_type 。',8,1),(4,'2018-01-25 09:12:09','127.0.0.1',NULL,'','delete','批量删除 1 个 邮箱验证码',NULL,1),(5,'2018-01-25 09:12:25','127.0.0.1','3','mhgj','create','已添加',8,1),(6,'2018-01-25 09:14:14','127.0.0.1',NULL,'','delete','批量删除 1 个 邮箱验证码',NULL,1),(7,'2018-01-25 09:14:26','127.0.0.1','4','foer(admin@163.com)','create','已添加',8,1),(8,'2018-01-25 09:14:50','127.0.0.1','5','mbjr(john@163.com)','create','已添加',8,1),(9,'2018-01-25 09:18:00','127.0.0.1','2','wangdaoyun','create','已添加',7,1),(10,'2018-01-25 09:18:43','127.0.0.1','3','testuser','create','已添加',7,1),(11,'2018-01-25 09:19:47','127.0.0.1','2','wangdaoyun','change','已修改 is_superuser，is_staff，nick_name 和 address 。',7,1),(12,'2018-01-25 09:21:06','127.0.0.1','3','testuser','change','已修改 nick_name 和 address 。',7,1),(13,'2018-01-25 09:48:51','127.0.0.1','1','标题','create','已添加',9,1),(14,'2018-01-25 11:01:45','127.0.0.1','1','django入门','create','已添加',10,1),(15,'2018-01-25 11:16:35','127.0.0.1','1','admin chart widget','delete','',24,1),(16,'2018-01-25 17:19:34','127.0.0.1','4','王道yun','create','已添加',7,1),(17,'2018-01-25 17:20:09','127.0.0.1','4','王道云','change','已修改 username，nick_name，address 和 image 。',7,1),(18,'2018-01-25 17:20:17','127.0.0.1','4','王道云','change','已修改 is_superuser 和 is_staff 。',7,1),(19,'2018-01-26 09:20:20','127.0.0.1','2','wangdaoyun','change','已修改 last_login，is_superuser 和 is_staff 。',7,1),(20,'2018-01-29 15:43:41','127.0.0.1','1','北京市','create','已添加',14,1),(21,'2018-01-29 15:43:51','127.0.0.1','2','上海市','create','已添加',14,1),(22,'2018-01-29 15:43:59','127.0.0.1','3','天津市','create','已添加',14,1),(23,'2018-01-29 15:44:08','127.0.0.1','4','广州市','create','已添加',14,1),(24,'2018-01-29 15:44:16','127.0.0.1','5','深圳市','create','已添加',14,1),(25,'2018-01-29 15:46:13','127.0.0.1','1','慕课网1','create','已添加',15,1),(26,'2018-01-29 15:47:32','127.0.0.1','2','慕课网2','create','已添加',15,1),(27,'2018-01-29 15:48:08','127.0.0.1','3','慕课网3','create','已添加',15,1),(28,'2018-01-29 15:56:21','127.0.0.1','4','慕课网4','create','已添加',15,1),(29,'2018-01-29 15:57:00','127.0.0.1','5','慕课网5','create','已添加',15,1),(30,'2018-01-29 15:57:47','127.0.0.1','6','慕课网6','create','已添加',15,1),(31,'2018-01-29 15:58:35','127.0.0.1','7','慕课网7','create','已添加',15,1),(32,'2018-01-29 15:59:32','127.0.0.1','8','慕课网8','create','已添加',15,1),(33,'2018-01-31 10:31:41','127.0.0.1','1','django入门','change','已修改 course_org 。',10,1),(34,'2018-01-31 11:18:36','127.0.0.1','1','django入门','change','已修改 image 。',10,1),(35,'2018-01-31 11:18:41','127.0.0.1','1','django入门','change','没有字段被修改。',10,1),(36,'2018-01-31 11:19:33','127.0.0.1','2','python 基础知识','create','已添加',10,1),(37,'2018-01-31 11:20:29','127.0.0.1','3','python 正则表达式','create','已添加',10,1),(38,'2018-01-31 11:25:43','127.0.0.1','1','刘翠花','create','已添加',16,1),(39,'2018-01-31 11:26:51','127.0.0.1','2','范小贱','create','已添加',16,1),(40,'2018-01-31 13:47:32','127.0.0.1','4','Python 高级爬虫','create','已添加',10,1),(41,'2018-01-31 13:48:19','127.0.0.1','5','Python 面向对象','create','已添加',10,1),(42,'2018-01-31 13:50:35','127.0.0.1','6','Python flask入门','create','已添加',10,1),(43,'2018-01-31 13:51:23','127.0.0.1','7','Python 协程知识','create','已添加',10,1),(44,'2018-01-31 15:32:02','127.0.0.1','2','范小贱','change','已修改 org 。',16,1),(45,'2018-01-31 15:32:38','127.0.0.1','2','范小贱','change','已修改 org 。',16,1),(46,'2018-01-31 15:32:52','127.0.0.1','7','Python 协程知识','change','已修改 teacher 。',10,1),(47,'2018-01-31 15:32:59','127.0.0.1','6','Python flask入门','change','已修改 teacher 。',10,1),(48,'2018-01-31 15:33:15','127.0.0.1','5','Python 面向对象','change','已修改 teacher 。',10,1),(49,'2018-01-31 15:33:20','127.0.0.1','3','python 正则表达式','change','已修改 teacher 。',10,1),(50,'2018-01-31 15:33:26','127.0.0.1','3','python 正则表达式','change','没有字段被修改。',10,1),(51,'2018-01-31 15:33:31','127.0.0.1','5','Python 面向对象','change','没有字段被修改。',10,1),(52,'2018-01-31 15:33:36','127.0.0.1','2','python 基础知识','change','已修改 teacher 。',10,1),(53,'2018-01-31 15:33:42','127.0.0.1','1','django入门','change','已修改 teacher 。',10,1),(54,'2018-01-31 15:50:15','127.0.0.1','2','范小贱','change','已修改 image 。',16,1),(55,'2018-01-31 16:21:01','127.0.0.1','7','Python 协程知识','change','已修改 course_org 。',10,1),(56,'2018-02-01 16:31:23','127.0.0.1','7','Python 协程知识','change','已修改 course_type 。',10,1),(57,'2018-02-01 16:40:09','127.0.0.1','25','wadayu@163.com','change','已修改 last_login，nick_name，address 和 image 。',7,1),(58,'2018-02-01 16:41:14','127.0.0.1','1','wadayu@163.com','create','已添加',21,1),(59,'2018-02-02 10:51:01','127.0.0.1','6','Python flask入门','change','已修改 tag 。',10,1),(60,'2018-02-02 10:51:15','127.0.0.1','5','Python 面向对象','change','已修改 tag 。',10,1),(61,'2018-02-02 10:52:27','127.0.0.1','6','Python flask入门','change','已修改 click_nums 。',10,1),(62,'2018-02-02 11:52:23','127.0.0.1','1','第一节 基础入门','create','已添加',11,1),(63,'2018-02-02 11:53:59','127.0.0.1','2','第二节 MVC模式详解','create','已添加',11,1),(64,'2018-02-02 11:56:37','127.0.0.1','1','1、基本语法','create','已添加',12,1),(65,'2018-02-02 11:58:12','127.0.0.1','2','特殊语法','create','已添加',12,1),(66,'2018-02-02 13:09:21','127.0.0.1','2','2、特殊语法','change','已修改 name 。',12,1),(67,'2018-02-02 13:10:46','127.0.0.1','3','1、模式介绍','create','已添加',12,1),(68,'2018-02-02 13:11:54','127.0.0.1','4','2、mvc用途','create','已添加',12,1),(69,'2018-02-02 14:51:17','127.0.0.1','1','Django-1.11.2.tar.gz','create','已添加',13,1),(70,'2018-02-02 14:52:43','127.0.0.1','2','mysqlclient-1.3.10-cp35-cp35m-win_amd64.whl','create','已添加',13,1),(71,'2018-02-02 16:03:14','127.0.0.1','1','admin','change','已修改 last_login，nick_name 和 address 。',7,1),(72,'2018-02-02 16:07:39','127.0.0.1','1','admin','change','已修改 image 。',7,1),(73,'2018-02-08 14:50:35','127.0.0.1','1','标题','delete','',9,1),(74,'2018-02-08 14:51:07','127.0.0.1','2','第一张','create','已添加',9,1),(75,'2018-02-08 14:51:39','127.0.0.1','3','第二张','create','已添加',9,1),(76,'2018-02-08 14:52:01','127.0.0.1','4','第三张','create','已添加',9,1),(77,'2018-02-08 14:52:27','127.0.0.1','5','第四张','create','已添加',9,1),(78,'2018-02-08 14:52:46','127.0.0.1','6','第五张','create','已添加',9,1),(79,'2018-02-08 15:09:12','127.0.0.1','2','第一张','change','已修改 image 。',9,1),(80,'2018-02-09 11:53:20','127.0.0.1','1','TestGroup','create','已添加',3,1),(81,'2018-02-09 11:53:45','127.0.0.1','30','1059653878@qq.com','delete','',7,1),(82,'2018-02-09 11:54:51','127.0.0.1','25','wadayu@163.com','change','已修改 last_login 和 is_superuser 。',7,1),(83,'2018-02-09 11:55:59','127.0.0.1','25','wadayu@163.com','change','已修改 is_staff 。',7,1),(84,'2018-02-09 11:56:19','127.0.0.1','25','wadayu@163.com','change','已修改 last_login 和 is_superuser 。',7,25),(85,'2018-02-09 11:57:24','127.0.0.1','25','wadayu@163.com','change','已修改 last_login 和 is_staff 。',7,1),(86,'2018-02-09 12:00:12','127.0.0.1','25','wadayu@163.com','change','已修改 is_staff 。',7,1),(87,'2018-02-09 13:41:06','127.0.0.1','25','wadayu@163.com','change','已修改 user_permissions 。',7,1),(88,'2018-02-09 13:42:23','127.0.0.1','25','wadayu@163.com','change','已修改 last_login 和 is_superuser 。',7,25),(89,'2018-02-09 13:43:43','127.0.0.1','25','wadayu@163.com','change','已修改 is_superuser 。',7,25),(90,'2018-02-09 13:44:26','127.0.0.1','25','wadayu@163.com','change','已修改 user_permissions 。',7,25),(91,'2018-02-09 13:51:37','127.0.0.1',NULL,'','delete','批量删除 1 个 组',NULL,1),(92,'2018-02-09 13:57:19','127.0.0.1','2','TestGroup','create','已添加',3,1),(93,'2018-02-09 13:57:33','127.0.0.1','25','wadayu@163.com','change','已修改 groups 。',7,1),(94,'2018-02-09 13:57:41','127.0.0.1','25','wadayu@163.com','change','已修改 groups 。',7,1),(95,'2018-02-09 14:01:39','127.0.0.1','25','wadayu@163.com','change','已修改 last_login 和 groups 。',7,1),(96,'2018-02-09 14:01:48','127.0.0.1','25','wadayu@163.com','change','没有字段被修改。',7,1),(97,'2018-02-09 14:01:56','127.0.0.1','25','wadayu@163.com','change','没有字段被修改。',7,1),(98,'2018-02-09 14:02:02','127.0.0.1','25','wadayu@163.com','change','没有字段被修改。',7,1),(99,'2018-02-09 15:43:54','127.0.0.1','8','drf入门与基础','create','已添加',10,1),(100,'2018-02-09 15:44:52','127.0.0.1','8','drf入门与基础','change','没有字段被修改。',10,1),(101,'2018-02-09 16:09:32','127.0.0.1',NULL,'','delete','批量删除 1 个 课程',NULL,1),(102,'2018-02-09 16:10:53','127.0.0.1','9','drf基础入门','create','已添加',10,1),(103,'2018-02-09 16:18:02','127.0.0.1','9','drf基础入门','change','没有字段被修改。',10,1),(104,'2018-02-09 16:40:53','127.0.0.1','6','Python flask入门','change','没有字段被修改。',10,1),(105,'2018-02-11 17:05:53','127.0.0.1','5','admin(<p><img src=\"http://img.baidu.com/hi/jx2/j_0029.gif\"/></p>)','change','已修改 comments 。',18,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'dashboard:home:pos','',2),(3,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(4,'dashboard:home:pos','',25);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-13 10:34:52
