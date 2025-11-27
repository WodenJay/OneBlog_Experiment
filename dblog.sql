-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: dblog
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `biz_ad`
--

DROP TABLE IF EXISTS `biz_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_ad` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '广告类型',
  `position` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '广告位置',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '广告标题',
  `brief` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '广告简介',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '广告内容',
  `picture` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '广告图片',
  `link` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '广告链接',
  `expiring_date` datetime DEFAULT NULL COMMENT '广告到期日',
  `show_number` int unsigned DEFAULT NULL COMMENT '展示次数',
  `click_number` int unsigned DEFAULT NULL COMMENT '点击次数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='广告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_ad`
--

LOCK TABLES `biz_ad` WRITE;
/*!40000 ALTER TABLE `biz_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_article`
--

DROP TABLE IF EXISTS `biz_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_article` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章标题',
  `user_id` bigint unsigned NOT NULL COMMENT '用户ID',
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章封面图片',
  `editor_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '当前文章适用的编辑器类型',
  `qrcode_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章专属二维码地址',
  `is_markdown` tinyint unsigned DEFAULT '1',
  `top` tinyint(1) DEFAULT '0' COMMENT '是否置顶',
  `type_id` bigint unsigned NOT NULL COMMENT '类型',
  `status` tinyint unsigned DEFAULT NULL COMMENT '状态',
  `recommended` tinyint unsigned DEFAULT '0' COMMENT '是否推荐',
  `original` tinyint unsigned DEFAULT '1' COMMENT '是否原创',
  `description` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章简介，最多200字',
  `keywords` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章关键字，优化搜索',
  `comment` tinyint unsigned DEFAULT '1' COMMENT '是否开启评论',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文章私密访问时的密钥',
  `required_auth` tinyint unsigned DEFAULT NULL COMMENT '该文章是否登录后才可访问',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_article`
--

LOCK TABLES `biz_article` WRITE;
/*!40000 ALTER TABLE `biz_article` DISABLE KEYS */;
INSERT INTO `biz_article` VALUES (1,'欢迎使用OneBlog',1,'','we',NULL,0,1,1,1,1,1,'OneBlog','OneBlog',1,'',0,'2025-11-27 16:35:24','2025-11-27 21:39:19'),(2,'Test tittle',1,'','md',NULL,1,0,3,1,0,1,'test','test',1,'',0,'2025-11-27 22:37:41','2025-11-27 22:37:41');
/*!40000 ALTER TABLE `biz_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_article_content`
--

DROP TABLE IF EXISTS `biz_article_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_article_content` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint NOT NULL COMMENT '管理的文章 ID',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '富文本版的文章内容',
  `content_md` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'markdown 版的文章内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_article_content`
--

LOCK TABLES `biz_article_content` WRITE;
/*!40000 ALTER TABLE `biz_article_content` DISABLE KEYS */;
INSERT INTO `biz_article_content` VALUES (1,1,'<p>欢迎使用 OneBlog，源码访问 <a href=\"https://gitee.com/yadong.zhang/DBlog\" target=\"_blank\">https://gitee.com/yadong.zhang/DBlog</a> ，在线文档 <a href=\"https://docs.zhyd.me\" target=\"_blank\">https://docs.zhyd.me</a> </p>',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,2,'<h1 id=\"this-is-for-test\">this is for test</h1>\n','# this is for test','2025-11-27 22:37:41','2025-11-27 22:37:41');
/*!40000 ALTER TABLE `biz_article_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_article_look_v2`
--

DROP TABLE IF EXISTS `biz_article_look_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_article_look_v2` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint unsigned NOT NULL COMMENT '文章ID',
  `look_count` bigint unsigned DEFAULT NULL COMMENT '次数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_article_look_v2`
--

LOCK TABLES `biz_article_look_v2` WRITE;
/*!40000 ALTER TABLE `biz_article_look_v2` DISABLE KEYS */;
INSERT INTO `biz_article_look_v2` VALUES (1,1,4,'2025-11-27 17:49:21','2025-11-27 17:49:21'),(2,2,1,NULL,NULL);
/*!40000 ALTER TABLE `biz_article_look_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_article_love`
--

DROP TABLE IF EXISTS `biz_article_love`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_article_love` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint unsigned NOT NULL COMMENT '文章ID',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `user_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户IP',
  `love_time` datetime DEFAULT NULL COMMENT '浏览时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_article_love`
--

LOCK TABLES `biz_article_love` WRITE;
/*!40000 ALTER TABLE `biz_article_love` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_article_love` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_article_tags`
--

DROP TABLE IF EXISTS `biz_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_article_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` bigint unsigned NOT NULL COMMENT '标签表主键',
  `article_id` bigint unsigned NOT NULL COMMENT '文章ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_article_tags`
--

LOCK TABLES `biz_article_tags` WRITE;
/*!40000 ALTER TABLE `biz_article_tags` DISABLE KEYS */;
INSERT INTO `biz_article_tags` VALUES (1,5,1,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,5,2,'2025-11-27 22:37:41','2025-11-27 22:37:41');
/*!40000 ALTER TABLE `biz_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_comment`
--

DROP TABLE IF EXISTS `biz_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sid` bigint DEFAULT NULL COMMENT '被评论的文章或者页面的ID',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '评论人的ID',
  `pid` bigint unsigned DEFAULT NULL COMMENT '父级评论的id',
  `qq` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的QQ（未登录用户）',
  `nickname` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的昵称（未登录用户）',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的邮箱地址（未登录用户）',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论人的网站地址（未登录用户）',
  `status` enum('VERIFYING','APPROVED','REJECT','DELETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'VERIFYING' COMMENT '评论的状态',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的ip',
  `lng` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的地址',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的系统类型',
  `os_short_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的系统的简称',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的浏览器类型',
  `browser_short_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时的浏览器的简称',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论的内容',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注（审核不通过时添加）',
  `support` int unsigned DEFAULT '0' COMMENT '支持（赞）',
  `oppose` int unsigned DEFAULT '0' COMMENT '反对（踩）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_comment`
--

LOCK TABLES `biz_comment` WRITE;
/*!40000 ALTER TABLE `biz_comment` DISABLE KEYS */;
INSERT INTO `biz_comment` VALUES (1,1,NULL,0,'843977358','七彩狼','https://q1.qlogo.cn/g?b=qq&nk=843977358&s=40','843977358@qq.com','https://docs.zhyd.me','VERIFYING','0:0:0:0:0:0:0:1',NULL,NULL,'未知','Windows 7',NULL,'Chrome 65.0.3325.146',NULL,'<p>测试评论</p>',NULL,0,0,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,1,1,NULL,'843977358','超级管理员','https://static.zhyd.me/static/img/favicon.ico','843977358@qq.com','','APPROVED','127.0.0.1',NULL,NULL,'未知','Windows 10',NULL,'Chrome 13 131.0.0.0',NULL,'this is a test comment',NULL,0,0,'2025-11-27 20:54:05','2025-11-27 20:54:05');
/*!40000 ALTER TABLE `biz_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_file`
--

DROP TABLE IF EXISTS `biz_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_file` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `storage_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `suffix` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_start_time` datetime DEFAULT NULL,
  `upload_end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_file`
--

LOCK TABLES `biz_file` WRITE;
/*!40000 ALTER TABLE `biz_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_page`
--

DROP TABLE IF EXISTS `biz_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_page` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '自定义页面的url（不包含域名部分）',
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '自定义页面的内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_page`
--

LOCK TABLES `biz_page` WRITE;
/*!40000 ALTER TABLE `biz_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `biz_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_tags`
--

DROP TABLE IF EXISTS `biz_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '书签名',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_tags`
--

LOCK TABLES `biz_tags` WRITE;
/*!40000 ALTER TABLE `biz_tags` DISABLE KEYS */;
INSERT INTO `biz_tags` VALUES (1,'Linux',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,'Java',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,'Spring',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(4,'Spring Boot',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(5,'其他',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `biz_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_type`
--

DROP TABLE IF EXISTS `biz_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biz_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint unsigned DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文章类型名',
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '类型介绍',
  `sort` int DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '图标',
  `position` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '分类在web端显示的位置，可选：nav、scrollmenu',
  `available` tinyint unsigned DEFAULT '1' COMMENT '是否可用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_type`
--

LOCK TABLES `biz_type` WRITE;
/*!40000 ALTER TABLE `biz_type` DISABLE KEYS */;
INSERT INTO `biz_type` VALUES (1,NULL,'前端技术','主要收集、整理的基础前端类文章，包括JS、jQuery和CSS等Web开发所需的基础的文章总结',1,'fa fa-css3','nav',1,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,NULL,'后端技术','网站中记录的后端类文章，包括Java、SSM、MySQL和其他在日常工作学习中所用的后端技术',2,'fa fa-coffee','nav',1,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,NULL,'其他文章','记录网站建设以及日常工作、学习中的闲言碎语和个人笔记等文章',3,'fa fa-folder-open-o','nav',1,'2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `biz_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '配置关键字',
  `config_value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '配置项内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'homeDesc','OneBlog是一款简洁美观、自适应的Java博客系统。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。','2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,'homeKeywords','OneBlog,开源博客','2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,'domain','zhyd.me','2025-11-27 16:35:24','2025-11-27 16:35:24'),(4,'cmsUrl','http://localhost:8085','2025-11-27 16:35:24','2025-11-27 16:35:24'),(5,'siteUrl','http://localhost:8443','2025-11-27 16:35:24','2025-11-27 16:35:24'),(6,'siteName','OneBlog开源博客','2025-11-27 16:35:24','2025-11-27 16:35:24'),(7,'siteDesc','OneBlog是一款简洁美观、自适应的Java博客系统','2025-11-27 16:35:24','2025-11-27 16:35:24'),(8,'siteFavicon','http://localhost:8443/img/favicon.ico','2025-11-27 16:35:24','2025-11-27 16:35:24'),(9,'staticWebSite','http://localhost:8443','2025-11-27 16:35:24','2025-11-27 16:35:24'),(10,'authorName','张亚东','2025-11-27 16:35:24','2025-11-27 16:35:24'),(11,'authorEmail','yadong.zhang0415#gmail.com','2025-11-27 16:35:24','2025-11-27 16:35:24'),(12,'wxCode','https://static.zhyd.me/static/img/wechat_account.jpg','2025-11-27 16:35:24','2025-11-27 16:35:24'),(13,'qq','843977358','2025-11-27 16:35:24','2025-11-27 16:35:24'),(14,'weibo','http://weibo.com/211230415','2025-11-27 16:35:24','2025-11-27 16:35:24'),(15,'github','https://github.com/zhangyd-c','2025-11-27 16:35:24','2025-11-27 16:35:24'),(16,'maintenance','0','2025-11-27 16:35:24','2025-11-27 16:35:24'),(17,'maintenanceDate','2025-11-27 16:35:24','2025-11-27 16:35:24','2025-11-27 16:35:24'),(18,'comment','1','2025-11-27 16:35:24','2025-11-27 20:51:58'),(19,'qiniuBasePath',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(20,'qiniuAccessKey',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(21,'qiniuSecretKey',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(22,'qiniuBucketName',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(23,'baiduPushToken',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(24,'wxPraiseCode',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(25,'zfbPraiseCode',NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(26,'baiduApiAk','NwHaYlGalDEpgxm46xBaC3T9','2025-11-27 16:35:24','2025-11-27 16:35:24'),(27,'spiderConfig','{\r\n            imooc: {\r\n                domain: \"www.imooc.com\",\r\n                titleRegex: \"//span[@class=js-title]/html()\",\r\n                authorRegex: \"//div[@class=name_con]/p[@class=name]/a[@class=nick]/html()\",\r\n                releaseDateRegex: \"//div[@class=\'dc-profile\']/div[@class=\'l\']/span[@class=\'spacer\']/text()\",\r\n                contentRegex: \"//div[@class=detail-content]/html()\",\r\n                targetLinksRegex: \"/article/[0-9]{1,10}\",\r\n                tagRegex: \"//div[@class=cat-box]/div[@class=cat-wrap]/a[@class=cat]/html()\",\r\n                header: [\r\n                    \"Host=www.imooc.com\",\r\n                    \"Referer=https://www.imooc.com\"\r\n                ],\r\n                entryUrls: \'https://www.imooc.com/u/{uid}/articles?page={curPage}\'\r\n            },\r\n            csdn: {\r\n                domain: \"blog.csdn.net\",\r\n                titleRegex: \"//h1[@class=title-article]/html()\",\r\n                authorRegex: \"//a[@class=follow-nickName]/html()\",\r\n                releaseDateRegex: \"//div[@class=\'article-bar-top\']/span[@class=\'time\']/text()\",\r\n                contentRegex: \"//div[@class=article_content]/html()\",\r\n                targetLinksRegex: \".*blog\\\\.csdn\\\\.net/{uid}/article/details/[0-9a-zA-Z]{1,15}\",\r\n                tagRegex: \"//span[@class=artic-tag-box]/a[@class=tag-link]/html()\",\r\n                header: [\r\n                    \"Host=blog.csdn.net\",\r\n                    \"Referer=https://blog.csdn.net/{uid}/article/list/1\"\r\n                ],\r\n                entryUrls: \'https://blog.csdn.net/{uid}/article/list/{curPage}\'\r\n            },\r\n            iteye: {\r\n                domain: \"{uid}.iteye.com\",\r\n                titleRegex: \"//div[@class=blog_title]/h3/a/html()\",\r\n                authorRegex: \"//div[@id=blog_owner_name]/html()\",\r\n                releaseDateRegex: \"//div[@class=blog_bottom]/ul/li/html()\",\r\n                contentRegex: \"//div[@class=blog_content]/html()\",\r\n                targetLinksRegex: \".*{uid}\\\\.iteye\\\\.com/blog/[0-9]+\",\r\n                tagRegex: \"//div[@class=news_tag]/a/html()\",\r\n                header: [\r\n                    \"Host={uid}.iteye.com\",\r\n                    \"Referer=http://{uid}.iteye.com/\"\r\n                ],\r\n                entryUrls: \'http://{uid}.iteye.com/?page={curPage}\'\r\n            },\r\n            csblogs: {\r\n                domain: \"www.cnblogs.com\",\r\n                titleRegex: \"//a[@id=cb_post_title_url]/html()\",\r\n                authorRegex: \"//div[@class=postDesc]/a[1]/html()\",\r\n                releaseDateRegex: \"//span[@id=post-date]/html()\",\r\n                contentRegex: \"//div[@id=cnblogs_post_body]/html()\",\r\n                targetLinksRegex: \".*www\\\\.cnblogs\\\\.com/{uid}/p/[\\\\w\\\\d]+\\\\.html\",\r\n                tagRegex: \"//div[@id=EntryTag]/a/html()\",\r\n                header: [\r\n                    \"Host=www.cnblogs.com\",\r\n                    \"Referer=https://www.cnblogs.com/\"\r\n                ],\r\n                entryUrls: \'https://www.cnblogs.com/{uid}/default.html?page={curPage}\'\r\n            }\r\n        }','2025-11-27 16:35:24','2025-11-27 16:35:24'),(28,'anonymous','1','2025-11-27 16:35:24','2025-11-27 20:51:58'),(29,'editorPlaceholder','说点什么吧','2025-11-27 16:35:24','2025-11-27 20:51:58'),(30,'editorAlert','讲文明、要和谐','2025-11-27 16:35:24','2025-11-27 20:51:58'),(31,'defaultUserAvatar','[\r\n	\"http://localhost:8443/img/random/user/1.jpg\",\r\n	\"http://localhost:8443/img/random/user/2.jpg\",\r\n	\"http://localhost:8443/img/random/user/3.jpg\",\r\n	\"http://localhost:8443/img/random/user/4.jpg\",\r\n	\"http://localhost:8443/img/random/user/5.jpg\",\r\n	\"http://localhost:8443/img/random/user/6.jpg\",\r\n	\"http://localhost:8443/img/random/user/7.jpg\",\r\n	\"http://localhost:8443/img/random/user/8.jpg\",\r\n	\"http://localhost:8443/img/random/user/9.jpg\",\r\n	\"http://localhost:8443/img/random/user/10.jpg\",\r\n	\"http://localhost:8443/img/random/user/11.jpg\",\r\n	\"http://localhost:8443/img/random/user/12.jpg\",\r\n	\"http://localhost:8443/img/random/user/13.jpg\",\r\n	\"http://localhost:8443/img/random/user/14.jpg\",\r\n	\"http://localhost:8443/img/random/user/15.jpg\",\r\n	\"http://localhost:8443/img/random/user/16.jpg\",\r\n	\"http://localhost:8443/img/random/user/17.jpg\",\r\n	\"http://localhost:8443/img/random/user/18.jpg\",\r\n	\"http://localhost:8443/img/random/user/19.jpg\",\r\n	\"http://localhost:8443/img/random/user/20.jpg\"\r\n]','2025-11-27 16:35:24','2025-11-27 16:35:24'),(32,'sessionTimeOut','5','2025-11-27 16:35:24','2025-11-27 16:35:24'),(33,'sessionTimeOutUnit','MINUTES','2025-11-27 16:35:24','2025-11-27 16:35:24'),(34,'loginRetryNum','5','2025-11-27 16:35:24','2025-11-27 16:35:24'),(35,'installdate','2025-11-27 16:35:24','2025-11-27 16:35:24','2025-11-27 16:35:24'),(36,'copyright','Copyright zhyd.me','2025-11-27 16:35:24','2025-11-27 16:35:24'),(37,'dynamicTitle','您有一条新消息','2025-11-27 16:35:24','2025-11-27 16:35:24'),(38,'articleEditor','md','2025-11-27 20:51:58','2025-11-27 20:51:58'),(39,'tinyMCEKey','3n2bjbshxxahbxqstvpi0x4lynjnmekrgezqxcl672vev718','2025-11-27 20:51:58','2025-11-27 20:51:58');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_link`
--

DROP TABLE IF EXISTS `sys_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_link` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '链接地址',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '链接名',
  `description` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '链接介绍',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '友链站长QQ',
  `favicon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态',
  `home_page_display` tinyint unsigned DEFAULT '1' COMMENT '是否首页显示',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `source` enum('ADMIN','AUTOMATIC') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'ADMIN' COMMENT '来源：管理员添加、自动申请',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_link`
--

LOCK TABLES `sys_link` WRITE;
/*!40000 ALTER TABLE `sys_link` DISABLE KEYS */;
INSERT INTO `sys_link` VALUES (1,'https://docs.zhyd.me','张亚东博客','一个程序员的个人博客','yadong.zhang0415@gmail.com',NULL,'https://static.zhyd.me/static/img/favicon.ico',1,1,NULL,'ADMIN','2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `sys_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL COMMENT '已登录用户ID',
  `type` enum('SYSTEM','VISIT','ERROR') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'SYSTEM' COMMENT '日志类型（系统操作日志，用户访问日志，异常记录日志）',
  `log_level` enum('ERROR','WARN','INFO') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'INFO' COMMENT '日志级别',
  `content` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '日志内容（业务操作）',
  `params` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '请求参数（业务操作）',
  `spider_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '爬虫类型（当访问者被鉴定为爬虫时该字段表示爬虫的类型）',
  `ip` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '操作用户的ip',
  `ua` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '操作用户的user_agent',
  `os` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '评论时的系统类型',
  `browser` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '评论时的浏览器类型',
  `request_url` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '请求的路径',
  `referer` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '请求来源地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入首页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/',NULL,'2025-11-27 17:48:17','2025-11-27 17:48:17'),(2,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[1]详情页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/article/1','http://localhost:8443/','2025-11-27 17:49:21','2025-11-27 17:49:21'),(3,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入首页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/','http://localhost:8443/','2025-11-27 17:49:32','2025-11-27 17:49:32'),(4,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章分类[1]列表页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/type/1','http://localhost:8443/','2025-11-27 17:49:33','2025-11-27 17:49:33'),(5,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入首页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/','http://localhost:8443/type/1','2025-11-27 17:49:34','2025-11-27 17:49:34'),(6,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入留言板页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/guestbook','http://localhost:8443/','2025-11-27 17:49:48','2025-11-27 17:49:48'),(7,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入友情链接页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/links','http://localhost:8443/guestbook','2025-11-27 17:49:49','2025-11-27 17:49:49'),(8,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入关于页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/about','http://localhost:8443/links','2025-11-27 17:49:54','2025-11-27 17:49:54'),(9,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入首页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/','http://localhost:8443/about','2025-11-27 17:50:57','2025-11-27 17:50:57'),(10,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入关于页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/about','http://localhost:8443/','2025-11-27 17:51:47','2025-11-27 17:51:47'),(11,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入首页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/','http://localhost:8443/about','2025-11-27 17:51:50','2025-11-27 17:51:50'),(12,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/',NULL,'2025-11-27 20:40:10','2025-11-27 20:40:10'),(13,1,'SYSTEM','INFO','用户: [root] | 操作: [\"root\"]登录系统','{\"username\":[\"root\"],\"password\":[\"123456\"],\"rememberMe\":[\"on\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/signin','http://127.0.0.1:8085/passport/login/','2025-11-27 20:40:48','2025-11-27 20:40:48'),(14,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/passport/login/','2025-11-27 20:40:48','2025-11-27 20:40:48'),(15,NULL,'VISIT','INFO','访客: [127.0.0.1] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8443/',NULL,'2025-11-27 20:41:30','2025-11-27 20:41:30'),(16,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/','2025-11-27 20:41:39','2025-11-27 20:41:39'),(17,1,'SYSTEM','INFO','用户: [root] | 操作: 进入用户列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/users','http://127.0.0.1:8085/articles','2025-11-27 20:41:46','2025-11-27 20:41:46'),(18,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/users','2025-11-27 20:41:52','2025-11-27 20:41:52'),(19,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[1]详情页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/article/1','http://127.0.0.1:8085/','2025-11-27 20:42:02','2025-11-27 20:42:02'),(20,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入首页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/','http://localhost:8443/article/1','2025-11-27 20:42:07','2025-11-27 20:42:07'),(21,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/','2025-11-27 20:42:48','2025-11-27 20:42:48'),(22,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/articles','2025-11-27 20:42:51','2025-11-27 20:42:51'),(23,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/article/types','2025-11-27 20:42:53','2025-11-27 20:42:53'),(24,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/articles','2025-11-27 20:43:03','2025-11-27 20:43:03'),(25,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入首页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/','http://127.0.0.1:8085/','2025-11-27 20:43:57','2025-11-27 20:43:57'),(26,1,'SYSTEM','INFO','用户: [root] | 操作: 进入标签列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/tags','http://127.0.0.1:8085/articles','2025-11-27 20:44:00','2025-11-27 20:44:00'),(27,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/tags','2025-11-27 20:44:03','2025-11-27 20:44:03'),(28,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/article/types','2025-11-27 20:44:10','2025-11-27 20:44:10'),(29,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/articles','2025-11-27 20:45:14','2025-11-27 20:45:14'),(30,1,'SYSTEM','INFO','用户: [root] | 操作: 修改文章[1]的状态[\"comment\"]','{\"id\":[\"1\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/update/comment','http://127.0.0.1:8085/articles','2025-11-27 20:45:17','2025-11-27 20:45:17'),(31,1,'SYSTEM','INFO','用户: [root] | 操作: 修改文章[1]的状态[\"comment\"]','{\"id\":[\"1\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/update/comment','http://127.0.0.1:8085/articles','2025-11-27 20:45:18','2025-11-27 20:45:18'),(32,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[1]详情页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/article/1','http://127.0.0.1:8085/','2025-11-27 20:50:26','2025-11-27 20:50:26'),(33,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/articles','2025-11-27 20:50:37','2025-11-27 20:50:37'),(34,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章分类[3]列表页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/type/3','http://127.0.0.1:8085/','2025-11-27 20:50:38','2025-11-27 20:50:38'),(35,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章分类[2]列表页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/type/2','http://127.0.0.1:8085/','2025-11-27 20:50:42','2025-11-27 20:50:42'),(36,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/article/types','2025-11-27 20:51:36','2025-11-27 20:51:36'),(37,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/articles','2025-11-27 20:51:38','2025-11-27 20:51:38'),(38,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/articles','2025-11-27 20:51:39','2025-11-27 20:51:39'),(39,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/article/types','2025-11-27 20:51:40','2025-11-27 20:51:40'),(40,1,'SYSTEM','INFO','用户: [root] | 操作: 进入系统配置页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/config','http://127.0.0.1:8085/articles','2025-11-27 20:51:47','2025-11-27 20:51:47'),(41,1,'SYSTEM','INFO','用户: [root] | 操作: 修改系统配置','{\"articleEditor\":[\"md\"],\"tinyMCEKey\":[\"\"],\"anonymous\":[\"1\"],\"comment\":[\"1\"],\"editorPlaceholder\":[\"说点什么吧\"],\"editorAlert\":[\"讲文明、要和谐\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/config/save','http://127.0.0.1:8085/config','2025-11-27 20:51:58','2025-11-27 20:51:58'),(42,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/config','2025-11-27 20:52:01','2025-11-27 20:52:01'),(43,1,'SYSTEM','INFO','用户: [root] | 操作: 修改文章[1]的状态[\"comment\"]','{\"id\":[\"1\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/update/comment','http://127.0.0.1:8085/articles','2025-11-27 20:52:08','2025-11-27 20:52:08'),(44,1,'SYSTEM','INFO','用户: [root] | 操作: 修改文章[1]的状态[\"recommend\"]','{\"id\":[\"1\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/update/recommend','http://127.0.0.1:8085/articles','2025-11-27 20:52:09','2025-11-27 20:52:09'),(45,1,'SYSTEM','INFO','用户: [root] | 操作: 修改文章[1]的状态[\"top\"]','{\"id\":[\"1\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/update/top','http://127.0.0.1:8085/articles','2025-11-27 20:52:09','2025-11-27 20:52:09'),(46,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/articles','2025-11-27 20:52:17','2025-11-27 20:52:17'),(47,1,'SYSTEM','INFO','用户: [root] | 操作: 进入标签列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/tags','http://127.0.0.1:8085/article/types','2025-11-27 20:52:18','2025-11-27 20:52:18'),(48,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章标签[1]列表页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/tag/1','http://127.0.0.1:8085/','2025-11-27 20:52:21','2025-11-27 20:52:21'),(49,1,'SYSTEM','INFO','用户: [root] | 操作: 进入系统配置页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/config','http://127.0.0.1:8085/article/tags','2025-11-27 20:52:25','2025-11-27 20:52:25'),(50,1,'SYSTEM','INFO','用户: [root] | 操作: 进入编辑器测试用例页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/editor','http://127.0.0.1:8085/config','2025-11-27 20:52:57','2025-11-27 20:52:57'),(51,1,'SYSTEM','INFO','用户: [root] | 操作: 进入icons页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/icons','http://127.0.0.1:8085/editor','2025-11-27 20:53:00','2025-11-27 20:53:00'),(52,1,'SYSTEM','INFO','用户: [root] | 操作: 进入shiro示例页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/shiro','http://127.0.0.1:8085/icons','2025-11-27 20:53:02','2025-11-27 20:53:02'),(53,1,'SYSTEM','INFO','用户: [root] | 操作: 进入用户列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/users','http://127.0.0.1:8085/shiro','2025-11-27 20:53:05','2025-11-27 20:53:05'),(54,1,'SYSTEM','INFO','用户: [root] | 操作: 进入资源列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/resources','http://127.0.0.1:8085/users','2025-11-27 20:53:14','2025-11-27 20:53:14'),(55,1,'SYSTEM','INFO','用户: [root] | 操作: 进入角色列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/roles','http://127.0.0.1:8085/resources','2025-11-27 20:53:17','2025-11-27 20:53:17'),(56,1,'SYSTEM','INFO','用户: [root] | 操作: 进入评论页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/comments','http://127.0.0.1:8085/roles','2025-11-27 20:53:20','2025-11-27 20:53:20'),(57,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文件管理页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/files','http://127.0.0.1:8085/comments','2025-11-27 20:53:30','2025-11-27 20:53:30'),(58,1,'SYSTEM','INFO','用户: [root] | 操作: 进入更新记录管理页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/updates','http://127.0.0.1:8085/files','2025-11-27 20:53:33','2025-11-27 20:53:33'),(59,1,'SYSTEM','INFO','用户: [root] | 操作: 进入配置自定义页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/page','http://127.0.0.1:8085/updates','2025-11-27 20:53:35','2025-11-27 20:53:35'),(60,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/page','2025-11-27 20:53:37','2025-11-27 20:53:37'),(61,1,'SYSTEM','INFO','用户: [root] | 操作: 进入评论页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/comments','http://127.0.0.1:8085/articles','2025-11-27 20:53:48','2025-11-27 20:53:48'),(62,1,'SYSTEM','INFO','用户: [root] | 操作: 回复评论','{\"sid\":[\"1\"],\"pid\":[\"1\"],\"content\":[\"this is a test comment\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/comment/reply','http://127.0.0.1:8085/comments','2025-11-27 20:54:05','2025-11-27 20:54:05'),(63,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/comments','2025-11-27 20:54:15','2025-11-27 20:54:15'),(64,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/articles','2025-11-27 20:54:16','2025-11-27 20:54:16'),(65,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/','2025-11-27 20:55:03','2025-11-27 20:55:03'),(66,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/',NULL,'2025-11-27 21:16:37','2025-11-27 21:16:37'),(67,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/','2025-11-27 21:16:41','2025-11-27 21:16:41'),(68,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/','2025-11-27 21:38:41','2025-11-27 21:38:41'),(69,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/articles','2025-11-27 21:38:45','2025-11-27 21:38:45'),(70,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/','http://127.0.0.1:8085/articles','2025-11-27 21:39:00','2025-11-27 21:39:00'),(71,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/passport/login/','2025-11-27 21:39:07','2025-11-27 21:39:07'),(72,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/','2025-11-27 21:39:15','2025-11-27 21:39:15'),(73,1,'SYSTEM','INFO','用户: [root] | 操作: 修改文章[1]的状态[\"comment\"]','{\"id\":[\"1\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/update/comment','http://127.0.0.1:8085/articles','2025-11-27 21:39:18','2025-11-27 21:39:18'),(74,1,'SYSTEM','INFO','用户: [root] | 操作: 修改文章[1]的状态[\"comment\"]','{\"id\":[\"1\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/update/comment','http://127.0.0.1:8085/articles','2025-11-27 21:39:19','2025-11-27 21:39:19'),(75,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[1]详情页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/article/1','http://127.0.0.1:8085/','2025-11-27 21:39:20','2025-11-27 21:39:20'),(76,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/',NULL,'2025-11-27 22:04:26','2025-11-27 22:04:26'),(77,1,'SYSTEM','INFO','用户: [root] | 操作: [\"root\"]登录系统','{\"username\":[\"root\"],\"password\":[\"123456\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/signin','http://127.0.0.1:8085/passport/login/','2025-11-27 22:04:38','2025-11-27 22:04:38'),(78,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/passport/login/','2025-11-27 22:04:38','2025-11-27 22:04:38'),(79,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/','2025-11-27 22:04:44','2025-11-27 22:04:44'),(80,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/articles','2025-11-27 22:05:08','2025-11-27 22:05:08'),(81,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/','http://127.0.0.1:8085/article/types','2025-11-27 22:08:40','2025-11-27 22:08:40'),(82,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/',NULL,'2025-11-27 22:09:07','2025-11-27 22:09:07'),(83,1,'SYSTEM','INFO','用户: [root] | 操作: [\"root\"]登录系统','{\"username\":[\"root\"],\"password\":[\"123456\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/signin','http://127.0.0.1:8085/passport/login/','2025-11-27 22:09:13','2025-11-27 22:09:13'),(84,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/passport/login/','2025-11-27 22:09:13','2025-11-27 22:09:13'),(85,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/','2025-11-27 22:09:19','2025-11-27 22:09:19'),(86,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/','2025-11-27 22:09:22','2025-11-27 22:09:22'),(87,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/articles','2025-11-27 22:09:23','2025-11-27 22:09:23'),(88,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/articles','2025-11-27 22:09:26','2025-11-27 22:09:26'),(89,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/articles','2025-11-27 22:09:26','2025-11-27 22:09:26'),(90,1,'SYSTEM','INFO','用户: [root] | 操作: 进入标签列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/tags','http://127.0.0.1:8085/article/types','2025-11-27 22:09:29','2025-11-27 22:09:29'),(91,1,'SYSTEM','INFO','用户: [root] | 操作: 进入标签列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/tags','http://127.0.0.1:8085/article/tags','2025-11-27 22:09:31','2025-11-27 22:09:31'),(92,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/article/tags','2025-11-27 22:09:32','2025-11-27 22:09:32'),(93,1,'SYSTEM','INFO','用户: [root] | 操作: 进入标签列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/tags','http://127.0.0.1:8085/articles','2025-11-27 22:09:33','2025-11-27 22:09:33'),(94,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/tags','2025-11-27 22:09:34','2025-11-27 22:09:34'),(95,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/types','2025-11-27 22:09:35','2025-11-27 22:09:35'),(96,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/types','2025-11-27 22:09:37','2025-11-27 22:09:37'),(97,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/types','2025-11-27 22:09:38','2025-11-27 22:09:38'),(98,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/types','2025-11-27 22:09:38','2025-11-27 22:09:38'),(99,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/types','2025-11-27 22:09:39','2025-11-27 22:09:39'),(100,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/types','2025-11-27 22:09:40','2025-11-27 22:09:40'),(101,1,'SYSTEM','INFO','用户: [root] | 操作: 进入分类列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/types','http://127.0.0.1:8085/article/types','2025-11-27 22:09:40','2025-11-27 22:09:40'),(102,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/','http://127.0.0.1:8085/article/types','2025-11-27 22:12:12','2025-11-27 22:12:12'),(103,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/',NULL,'2025-11-27 22:12:49','2025-11-27 22:12:49'),(104,1,'SYSTEM','INFO','用户: [root] | 操作: [\"root\"]登录系统','{\"username\":[\"root\"],\"password\":[\"123456\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/signin','http://127.0.0.1:8085/passport/login/','2025-11-27 22:12:56','2025-11-27 22:12:56'),(105,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/passport/login/','2025-11-27 22:12:56','2025-11-27 22:12:56'),(106,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/',NULL,'2025-11-27 22:21:02','2025-11-27 22:21:02'),(107,1,'SYSTEM','INFO','用户: [root] | 操作: [\"root\"]登录系统','{\"username\":[\"root\"],\"password\":[\"123456\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/signin','http://127.0.0.1:8085/passport/login/','2025-11-27 22:21:07','2025-11-27 22:21:07'),(108,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/passport/login/','2025-11-27 22:21:07','2025-11-27 22:21:07'),(109,1,'SYSTEM','INFO','用户: [root] | 操作: 进入发表文章页[\"tiny\"]','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/publish-tiny','http://127.0.0.1:8085/','2025-11-27 22:21:08','2025-11-27 22:21:08'),(110,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/article/publish-tiny','2025-11-27 22:21:44','2025-11-27 22:21:44'),(111,1,'SYSTEM','INFO','用户: [root] | 操作: 进入发表文章页[\"tiny\"]','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/publish-tiny','http://127.0.0.1:8085/articles','2025-11-27 22:21:46','2025-11-27 22:21:46'),(112,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/',NULL,'2025-11-27 22:30:19','2025-11-27 22:30:19'),(113,1,'SYSTEM','INFO','用户: [root] | 操作: 进入链接页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/links','http://127.0.0.1:8085/','2025-11-27 22:30:30','2025-11-27 22:30:30'),(114,1,'SYSTEM','INFO','用户: [root] | 操作: 进入评论页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/comments','http://127.0.0.1:8085/links','2025-11-27 22:30:32','2025-11-27 22:30:32'),(115,1,'SYSTEM','INFO','用户: [root] | 操作: 进入模板管理页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/templates','http://127.0.0.1:8085/comments','2025-11-27 22:30:32','2025-11-27 22:30:32'),(116,1,'SYSTEM','INFO','用户: [root] | 操作: 进入系统通知页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/notices','http://127.0.0.1:8085/templates','2025-11-27 22:30:34','2025-11-27 22:30:34'),(117,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文件管理页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/files','http://127.0.0.1:8085/notices','2025-11-27 22:30:35','2025-11-27 22:30:35'),(118,1,'SYSTEM','INFO','用户: [root] | 操作: 进入用户列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/users','http://127.0.0.1:8085/files','2025-11-27 22:30:42','2025-11-27 22:30:42'),(119,1,'SYSTEM','INFO','用户: [root] | 操作: 进入资源列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/resources','http://127.0.0.1:8085/users','2025-11-27 22:30:44','2025-11-27 22:30:44'),(120,1,'SYSTEM','INFO','用户: [root] | 操作: 进入角色列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/roles','http://127.0.0.1:8085/resources','2025-11-27 22:30:45','2025-11-27 22:30:45'),(121,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/','http://127.0.0.1:8085/roles','2025-11-27 22:32:27','2025-11-27 22:32:27'),(122,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/',NULL,'2025-11-27 22:32:51','2025-11-27 22:32:51'),(123,1,'SYSTEM','INFO','用户: [root] | 操作: [\"root\"]登录系统','{\"username\":[\"root\"],\"password\":[\"123456\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/signin','http://127.0.0.1:8085/passport/login/','2025-11-27 22:32:56','2025-11-27 22:32:56'),(124,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/passport/login/','2025-11-27 22:32:56','2025-11-27 22:32:56'),(125,1,'SYSTEM','INFO','用户: [root] | 操作: 进入发表文章页[\"tiny\"]','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/publish-tiny','http://127.0.0.1:8085/','2025-11-27 22:32:58','2025-11-27 22:32:58'),(126,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/',NULL,'2025-11-27 22:33:18','2025-11-27 22:33:18'),(127,1,'SYSTEM','INFO','用户: [root] | 操作: 进入发表文章页[\"tiny\"]','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/publish-tiny','http://127.0.0.1:8085/','2025-11-27 22:33:21','2025-11-27 22:33:21'),(128,NULL,'SYSTEM','INFO','访客: [127.0.0.1] | 操作: 进入登录页面','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/login/',NULL,'2025-11-27 22:36:45','2025-11-27 22:36:45'),(129,1,'SYSTEM','INFO','用户: [root] | 操作: [\"root\"]登录系统','{\"username\":[\"root\"],\"password\":[\"123456\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/passport/signin','http://127.0.0.1:8085/passport/login/','2025-11-27 22:36:50','2025-11-27 22:36:50'),(130,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/','http://127.0.0.1:8085/passport/login/','2025-11-27 22:36:50','2025-11-27 22:36:50'),(131,1,'SYSTEM','INFO','用户: [root] | 操作: 进入发表文章页[\"md\"]','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/publish-md','http://127.0.0.1:8085/','2025-11-27 22:36:51','2025-11-27 22:36:51'),(132,1,'SYSTEM','INFO','用户: [root] | 操作: 发布文章','{\"id\":[\"\"],\"isMarkdown\":[\"1\"],\"editorType\":[\"md\"],\"title\":[\"Test tittle\"],\"original\":[\"on\"],\"content\":[\"<h1 id=\\\"this-is-for-test\\\">this is for test</h1>\\n\"],\"contentMd\":[\"# this is for test\"],\"file\":[\"\"],\"coverImage\":[\"\"],\"typeId\":[\"3\"],\"tags\":[\"5\"],\"status\":[\"1\"],\"comment\":[\"on\"],\"password\":[\"\"],\"requiredAuth\":[\"0\"],\"description\":[\"test\"],\"keywords\":[\"test\"]}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/save','http://127.0.0.1:8085/article/publish-md','2025-11-27 22:37:41','2025-11-27 22:37:41'),(133,1,'SYSTEM','INFO','用户: [root] | 操作: 进入文章列表页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/articles','http://127.0.0.1:8085/article/publish-md','2025-11-27 22:37:43','2025-11-27 22:37:43'),(134,NULL,'VISIT','INFO','访客: [0:0:0:0:0:0:0:1] | 操作: 进入文章[2]详情页','{}',NULL,'0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://localhost:8443/article/2','http://127.0.0.1:8085/','2025-11-27 22:37:47','2025-11-27 22:37:47'),(135,1,'SYSTEM','INFO','用户: [root] | 操作: 进入发表文章页[\"md\"]','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/publish-md','http://127.0.0.1:8085/articles','2025-11-27 22:39:30','2025-11-27 22:39:30'),(136,1,'SYSTEM','INFO','用户: [root] | 操作: 进入首页','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/',NULL,'2025-11-27 22:41:49','2025-11-27 22:41:49'),(137,1,'SYSTEM','INFO','用户: [root] | 操作: 进入发表文章页[\"md\"]','{}',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','Windows 10','Chrome 13','http://127.0.0.1:8085/article/publish-md','http://127.0.0.1:8085/','2025-11-27 22:41:51','2025-11-27 22:41:51');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL COMMENT '被通知的用户ID',
  `status` enum('RELEASE','NOT_RELEASE') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'NOT_RELEASE' COMMENT '通知状态',
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '通知的标题',
  `content` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '通知的内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,1,'RELEASE','OneBlog开源博客','OneBlog开源博客，一款超好用的Java版开源博客','2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,1,'RELEASE','问题反馈','在使用过程中，有问题请先参考相关文档，确实无法解决的，请优先提Issue，感谢各位老铁','2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resources`
--

DROP TABLE IF EXISTS `sys_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_resources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT '0',
  `sort` int unsigned DEFAULT NULL,
  `external` tinyint unsigned DEFAULT NULL COMMENT '是否外部链接',
  `available` tinyint unsigned DEFAULT '0',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '菜单图标',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sys_resource_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resources`
--

LOCK TABLES `sys_resources` WRITE;
/*!40000 ALTER TABLE `sys_resources` DISABLE KEYS */;
INSERT INTO `sys_resources` VALUES (1,'用户管理','menu','','',0,4,0,1,'fa fa-users','2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,'用户列表','menu','/users','users',1,1,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,'新增用户','button',NULL,'user:add',2,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(4,'批量删除用户','button',NULL,'user:batchDelete',2,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(5,'编辑用户','button',NULL,'user:edit,user:get',2,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(6,'删除用户','button',NULL,'user:delete',2,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(7,'分配用户角色','button',NULL,'user:allotRole',2,6,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(8,'权限管理','menu','','',0,3,0,1,'fa fa-cogs','2025-11-27 16:35:24','2025-11-27 16:35:24'),(9,'资源管理','menu','/resources','resources',8,1,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(10,'新增资源','button',NULL,'resource:add',9,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(11,'批量删除资源','button',NULL,'resource:batchDelete',9,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(12,'编辑资源','button',NULL,'resource:edit,resource:get',9,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(13,'删除资源','button',NULL,'resource:delete',9,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(14,'角色管理','menu','/roles','roles',8,2,0,1,'','2025-11-27 16:35:24','2025-11-27 16:35:24'),(15,'新增角色','button',NULL,'role:add',14,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(16,'批量删除角色','button',NULL,'role:batchDelete',14,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(17,'编辑角色','button',NULL,'role:edit,role:get',14,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(18,'删除角色','button',NULL,'role:delete',14,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(19,'分配角色资源','button',NULL,'role:allotResource',14,6,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(20,'文章管理','menu','','',0,1,0,1,'fa fa-list','2025-11-27 16:35:24','2025-11-27 16:35:24'),(21,'文章列表','menu','/articles','articles',20,1,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(22,'发表文章','button',NULL,'article:publish',91,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(23,'批量删除文章','button',NULL,'article:batchDelete',21,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(24,'批量推送文章','button',NULL,'article:batchPush',21,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(25,'推送文章','button',NULL,'article:push',21,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(26,'置顶文章','button',NULL,'article:top',21,6,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(27,'推荐文章','button',NULL,'article:recommend',21,7,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(28,'编辑文章','button',NULL,'article:edit,article:get',21,8,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(29,'删除文章','button',NULL,'article:delete',21,9,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(30,'分类列表','menu','/article/types','types',20,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(31,'添加分类','button',NULL,'type:add',30,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(32,'批量删除分类','button',NULL,'type:batchDelete',30,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(33,'编辑分类','button',NULL,'type:edit,type:get',30,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(34,'删除分类','button',NULL,'type:delete',30,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(35,'标签列表','menu','/article/tags','tags',20,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(36,'添加标签','button',NULL,'tag:add',35,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(37,'批量删除标签','button',NULL,'tag:batchDelete',35,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(38,'编辑标签','button',NULL,'tag:edit,tag:get',35,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(39,'删除标签','button',NULL,'tag:delete',35,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(40,'网站管理','menu','','',0,2,0,1,'fa fa-globe','2025-11-27 16:35:24','2025-11-27 16:35:24'),(41,'友情链接','menu','/links','links',40,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(42,'添加友情链接','button',NULL,'link:add',41,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(43,'批量删除友情链接','button',NULL,'link:batchDelete',41,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(44,'编辑友情链接','button',NULL,'link:edit,link:get',41,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(45,'删除友情链接','button',NULL,'link:delete',41,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(46,'评论管理','menu','/comments','comments',40,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(47,'批量删除评论','button',NULL,'comment:batchDelete',46,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(48,'回复评论','button',NULL,'comment:reply',46,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(49,'审核评论','button',NULL,'comment:audit',46,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(50,'删除评论','button',NULL,'comment:delete',46,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(51,'模板管理','menu','/templates','templates',40,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(52,'添加模板','button',NULL,'template:add',51,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(53,'批量删除模板','button',NULL,'template:batchDelete',51,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(54,'编辑模板','button',NULL,'template:edit,template:get',51,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(55,'删除模板','button',NULL,'template:delete',51,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(56,'更新日志','menu','/updates','updateLogs',40,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(57,'添加更新日志','button',NULL,'updateLog:add',51,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(58,'批量删除更新日志','button',NULL,'updateLog:batchDelete',51,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(59,'编辑更新日志','button',NULL,'updateLog:edit,updateLog:get',51,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(60,'删除更新日志','button',NULL,'updateLog:delete',51,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(61,'公告管理','menu','/notices','notices',40,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(62,'添加公告','button',NULL,'notice:add',61,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(63,'批量删除公告','button',NULL,'notice:batchDelete',61,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(64,'编辑公告','button',NULL,'notice:edit,notice:get',61,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(65,'删除公告','button',NULL,'notice:delete',61,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(66,'发布公告','button',NULL,'notice:release',61,6,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(67,'撤回公告','button',NULL,'notice:withdraw',61,7,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(68,'测试页面','menu','','',0,6,0,1,'fa fa-desktop','2025-11-27 16:35:24','2025-11-27 16:35:24'),(69,'icons图标','menu','/icons','icons',68,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(70,'shiro测试','menu','/shiro','shiro',68,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(71,'推送消息','menu','/notice','notice',72,NULL,0,1,'','2025-11-27 16:35:24','2025-11-27 16:35:24'),(72,'实验室','menu','','',0,5,0,1,'fa fa-flask','2025-11-27 16:35:24','2025-11-27 16:35:24'),(74,'编辑器','menu','/editor','editor',68,NULL,0,1,'','2025-11-27 16:35:24','2025-11-27 16:35:24'),(75,'文件管理','menu','/files','files',40,6,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(76,'社会化登录配置管理','menu','/socials','socials',40,7,0,1,'','2025-11-27 16:35:24','2025-11-27 16:35:24'),(77,'新增社会化登录配置','button',NULL,'social:add',76,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(78,'批量删除社会化登录配置','button',NULL,'social:batchDelete',76,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(79,'编辑社会化登录配置','button',NULL,'social:edit,social:get',76,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(80,'删除社会化登录配置','button',NULL,'social:delete',76,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(81,'自定义页面管理','menu','/page','page',40,7,0,1,'','2025-11-27 16:35:24','2025-11-27 16:35:24'),(82,'新增自定义页面','button',NULL,'page:add',81,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(83,'批量删除自定义页面','button',NULL,'page:batchDelete',81,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(84,'编辑自定义页面','button',NULL,'page:edit,page:get',81,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(85,'删除自定义页面','button',NULL,'page:delete',81,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(86,'广告管理','menu','/bizAd','bizAds',40,7,0,1,'','2025-11-27 16:35:24','2025-11-27 16:35:24'),(87,'新增广告','button',NULL,'bizAd:add',86,2,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(88,'批量删除广告','button',NULL,'bizAd:batchDelete',86,3,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(89,'编辑广告','button',NULL,'bizAd:edit,bizAd:get',86,4,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(90,'删除广告','button',NULL,'bizAd:delete',86,5,0,1,NULL,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(91,'发布文章','menu','/article/publish-md','article:publish',20,NULL,NULL,1,NULL,'2025-11-27 22:06:49','2025-11-27 22:06:49');
/*!40000 ALTER TABLE `sys_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '角色名',
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'role:root','超级管理员',1,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,'role:admin','管理员',1,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,'role:comment','评论审核管理员',1,'2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_resources`
--

DROP TABLE IF EXISTS `sys_role_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_resources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `resources_id` bigint unsigned NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_resources`
--

LOCK TABLES `sys_role_resources` WRITE;
/*!40000 ALTER TABLE `sys_role_resources` DISABLE KEYS */;
INSERT INTO `sys_role_resources` VALUES (1,1,1,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,1,2,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,1,3,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(4,1,4,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(5,1,5,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(6,1,6,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(7,1,7,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(8,1,8,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(9,1,9,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(10,1,10,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(11,1,11,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(12,1,12,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(13,1,13,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(14,1,14,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(15,1,15,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(16,1,16,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(17,1,17,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(18,1,18,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(19,1,19,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(20,1,20,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(21,1,21,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(22,1,22,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(23,1,23,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(24,1,24,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(25,1,25,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(26,1,26,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(27,1,27,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(28,1,28,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(29,1,29,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(30,1,30,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(31,1,31,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(32,1,32,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(33,1,33,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(34,1,34,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(35,1,35,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(36,1,36,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(37,1,37,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(38,1,38,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(39,1,39,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(40,1,40,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(41,1,41,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(42,1,42,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(43,1,43,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(44,1,44,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(45,1,45,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(46,1,46,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(47,1,47,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(48,1,48,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(49,1,49,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(50,1,50,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(51,1,51,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(52,1,52,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(53,1,57,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(54,1,53,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(55,1,58,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(56,1,54,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(57,1,59,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(58,1,55,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(59,1,60,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(60,1,56,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(61,1,61,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(62,1,62,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(63,1,63,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(64,1,64,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(65,1,65,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(66,1,66,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(67,1,67,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(68,1,68,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(84,2,20,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(85,2,21,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(86,2,24,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(87,2,25,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(88,2,26,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(89,2,27,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(93,3,40,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(94,3,46,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(95,3,48,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(96,3,49,'2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `sys_role_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_social_config`
--

DROP TABLE IF EXISTS `sys_social_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_social_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用ID',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用密钥',
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '认证成功后跳转的地址',
  `platform_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用名',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方平台',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '应用 LOGO',
  `alipay_public_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付宝公钥',
  `union_id` bit(1) DEFAULT NULL COMMENT '是否需要申请unionid',
  `stack_overflow_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Stack Overflow Key',
  `agent_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权方的网页应用ID',
  `scope` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权范围',
  `available` bit(1) DEFAULT b'1' COMMENT '当前配置是否可用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='社会化登录应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_social_config`
--

LOCK TABLES `sys_social_config` WRITE;
/*!40000 ALTER TABLE `sys_social_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_social_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_template` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ref_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '键',
  `ref_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '模板内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
INSERT INTO `sys_template` VALUES (1,'TM_SITEMAP_XML','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\r\n	<url>\r\n		<loc>${config.siteUrl}</loc>\r\n		<priority>1.0</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/about</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/links</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/guestbook</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/updateLog</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<url>\r\n		<loc>${config.siteUrl}/recommended</loc>\r\n		<priority>0.6</priority>\r\n		<lastmod>${.now?string(\"yyyy-MM-dd\")}</lastmod>\r\n		<changefreq>daily</changefreq>\r\n	</url>\r\n	<#list articleList as item>\r\n		<url>\r\n			<loc>${config.siteUrl}/article/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	<#list articleTypeList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/type/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n	\r\n	<#list articleTagsList as item>\r\n	   <url>\r\n			<loc>${config.siteUrl}/tag/${item.id}</loc>\r\n			<priority>0.6</priority>\r\n			<lastmod>${item.updateTime?string(\"yyyy-MM-dd\")}</lastmod>\r\n			<changefreq>daily</changefreq>\r\n		</url>\r\n	</#list>\r\n</urlset>','2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,'TM_SITEMAP_TXT','${config.siteUrl}\r\n${config.siteUrl}/about\r\n${config.siteUrl}/links\r\n${config.siteUrl}/guestbook\r\n${config.siteUrl}/updateLog\r\n${config.siteUrl}/recommended\r\n<#list articleList as item>\r\n${config.siteUrl}/article/${item.id}\r\n</#list>\r\n<#list articleTypeList as item>\r\n${config.siteUrl}/type/${item.id}\r\n</#list>\r\n<#list articleTagsList as item>\r\n${config.siteUrl}/tag/${item.id}\r\n</#list>','2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,'TM_SITEMAP_HTML','<!DOCTYPE html>\r\n<html lang=\"zh-CN\">\r\n<head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n    <title>${config.siteName} 网站地图</title>\r\n    <meta name=\"author\" content=\"SiteMapX.com\"/>\r\n    <meta name=\"robots\" content=\"index,follow\"/>\r\n    <style type=\"text/css\">\r\n        body {\r\n            color: #000000;\r\n            background: #ffffff;\r\n            margin: 20px;\r\n            font-family: Verdana, Arial, Helvetica, sans-serif;\r\n            font-size: 12px;\r\n        }\r\n\r\n        #myTable {\r\n            list-style: none;\r\n            margin: 10px 0px 10px 0px;\r\n            padding: 0px;\r\n            width: 100%;\r\n            min-width: 804px;\r\n        }\r\n\r\n        #myTable li {\r\n            list-style-type: none;\r\n            width: 100%;\r\n            min-width: 404px;\r\n            height: 20px;\r\n            line-height: 20px;\r\n        }\r\n\r\n        .pull-left{\r\n            float: left!important;\r\n        }\r\n        .pull-right{\r\n            float: right!important;\r\n        }\r\n\r\n        #myTable li .T1-h {\r\n            font-weight: bold;\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T3-h {\r\n            width: 200px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T4-h {\r\n            width: 100px;\r\n            font-weight: bold;\r\n        }\r\n\r\n        #myTable li .T1 {\r\n            min-width: 300px;\r\n        }\r\n\r\n        #myTable li .T2 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T3 {\r\n            width: 200px;\r\n        }\r\n\r\n        #myTable li .T4 {\r\n            width: 100px;\r\n        }\r\n\r\n        #footer {\r\n            padding: 2px;\r\n            margin: 0px;\r\n            font-size: 8pt;\r\n            color: gray;\r\n            min-width: 900px;\r\n        }\r\n\r\n        #footer a {\r\n            color: gray;\r\n        }\r\n\r\n        .myClear {\r\n            clear: both;\r\n        }\r\n\r\n        #nav, #content, #footer {padding: 8px; border: 1px solid #EEEEEE; clear: both; width: 95%; margin: auto; margin-top: 10px;}\r\n\r\n    </style>\r\n</head>\r\n<body>\r\n<h2 style=\"text-align: center; margin-top: 20px\">${config.siteName?if_exists} 网站地图 </h2>\r\n<div id=\"nav\"><a href=\"${config.siteUrl?if_exists}\"><strong>${config.siteName?if_exists}</strong></a> &raquo; <a href=\"${config.siteUrl?if_exists}/sitemap.html\">站点地图</a></div>\r\n<div id=\"content\">\r\n    <h3>最新文章</h3>\r\n    <ul id=\"myTable\">\r\n        <li>\r\n            <div class=\"T1-h pull-left\">URL</div>\r\n            <div class=\"T2-h pull-right\">Last Change</div>\r\n            <div class=\"T3-h pull-right\">Change Frequency</div>\r\n            <div class=\"T4-h pull-right\">Priority</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName} | 一个程序员的个人博客</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">1</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/about\" title=\"${config.siteName}\">关于 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/links\" title=\"${config.siteName}\">友情链接 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/guestbook\" title=\"${config.siteName}\">留言板 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/updateLog\" title=\"${config.siteName}\">网站更新记录 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n		<div class=\"myClear\"></div>\r\n        <li>\r\n            <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/recommended\" title=\"${config.siteName}\">站长推荐 | ${config.siteName}</a></div>\r\n            <div class=\"T2 pull-right\">${.now?string(\"yyyy-MM-dd\")}</div>\r\n            <div class=\"T3 pull-right\">daily</div>\r\n            <div class=\"T4 pull-right\">0.6</div>\r\n        </li>\r\n        <div class=\"myClear\"></div>\r\n        <#list articleList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/article/${item.id}\" title=\"${item.title}\">${item.title} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>分类目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTypeList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/type/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"content\">\r\n    <h3>标签目录</h3>\r\n    <ul id=\"myTable\">\r\n        <#list articleTagsList as item>\r\n            <li>\r\n                <div class=\"T1 pull-left\"><a href=\"${config.siteUrl}/tag/${item.id}\" title=\"${item.name}\">${item.name} | ${config.siteName}</a></div>\r\n                <div class=\"T2 pull-right\">${item.updateTime?string(\"yyyy-MM-dd\")}</div>\r\n                <div class=\"T3 pull-right\">daily</div>\r\n                <div class=\"T4 pull-right\">0.6</div>\r\n            </li>\r\n            <div class=\"myClear\"></div>\r\n        </#list>\r\n    </ul>\r\n</div>\r\n<div id=\"footer\">\r\n    该文件由<a href=\"${config.siteUrl}\" title=\"${config.siteName}\">${config.siteName}</a>网站自动生成。\r\n</div>\r\n</body>\r\n</html>','2025-11-27 16:35:24','2025-11-27 16:35:24'),(4,'TM_ROBOTS','Crawl-delay: 5\r\nSitemap: ${config.cmsUrl}/sitemap.txt\r\nSitemap: ${config.cmsUrl}/sitemap.xml\r\nSitemap: ${config.cmsUrl}/sitemap.html\r\n','2025-11-27 16:35:24','2025-11-27 16:35:24'),(5,'TM_LINKS','<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>站长<a href=\"${link.url?if_exists}\" target=\"_blank\">${link.name?if_exists}</a>，您好!</p>\r\n        <p>您于 ${link.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 提交的友链申请已通过系统审核。以下为您提交的信息，请确认（如有误，请联系我）！</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <li>${link.email?if_exists}</li>\r\n            <li>${link.qq?if_exists}</li>\r\n            <li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li>\r\n        </ul>\r\n        </p>\r\n        <p>本站会不定期检查连接有效性，如果因为贵站改版、服务到期等原因导致无法正常访问的，我会暂时停掉贵站友链，待贵站可以正常访问后，本站会继续启用贵站友链。</p>\r\n        <p>特别注意：以下情况，本站将在不做任何通知下，<strong>取消友链</strong>！</p>\r\n        <ul>\r\n            <li>私自取消本站友情链接</li>\r\n            <li>更换域名且未通知本站</li>\r\n            <li>网站内容长期不更新</li>\r\n            <li>友链上使用诸如nofollow之类的属性</li>\r\n        </ul>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl?if_exists}\" target=\"_blank\">${config.siteName?if_exists}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>','2025-11-27 16:35:24','2025-11-27 16:35:24'),(6,'TM_COMMENT_AUDIT','<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论审核结果通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论审核结果通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname?if_exists}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl?if_exists}${comment.sourceUrl?if_exists}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <#if comment.status == \'APPROVED\'>\r\n        <p>已通过管理员审核并显示。</p>\r\n        <p>\r\n            您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <#elseif comment.status == \'REJECT\'>\r\n        <p>审核失败！失败原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#elseif comment.status == \'DELETED\'>\r\n        <p>已被管理员删除！删除原因：</p>\r\n        <p style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.remark}</p>\r\n        <#else>\r\n        <p>管理员正在审核中！审核通过后将给您及时发送通知！</p>\r\n        </#if>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>','2025-11-27 16:35:24','2025-11-27 16:35:24'),(7,'TM_COMMENT_REPLY','<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>评论回复通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            评论回复通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>${comment.nickname}，您好!</p>\r\n        <p>\r\n            您于 ${comment.createTime?string(\'yyyy-MM-dd HH:mm:ss\')} 在文章《${config.siteUrl}${comment.sourceUrl}》 上发表的<span class=\"il\">评论</span>：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\">${comment.content}</div>\r\n        <p>\r\n            有了 <strong>新的回复</strong>！您可以点击 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">链接</a>查看回复的完整內容。\r\n        </p>\r\n        <p>感谢您对 <a style=\"text-decoration:none;\" href=\"${config.siteUrl}\" target=\"_blank\">${config.siteName}</a> 的关注，如您有任何疑问，欢迎来我网站<a style=\"text-decoration:none;\" href=\"${config.siteUrl}/guestbook\" target=\"_blank\">留言</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>','2025-11-27 16:35:24','2025-11-27 16:35:24'),(8,'TM_LINKS_TO_ADMIN','<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>友情链接操作通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            友情链接操作通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>有新的友情链接加入，信息如下</p>\r\n        <p>\r\n        <ul>\r\n            <li>${link.name?if_exists}</li>\r\n            <li>${link.url?if_exists}</li>\r\n            <li>${link.description?if_exists}</li>\r\n            <#if link.favicon?exists><li><img src=\"${link.favicon?if_exists}\" width=\"100\" alt=\"LOGO\"></li></#if>\r\n        </ul>\r\n        </p>\r\n        <p><a style=\"text-decoration:none;\" href=\"${config.cmsUrl}\" target=\"_blank\">去后台继续审核</a>。</p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>','2025-11-27 16:35:24','2025-11-27 16:35:24'),(9,'TM_NEW_COMMENT','<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>新评论通知</title>\r\n</head>\r\n<body>\r\n<div style=\"border-radius:5px;font-size:13px;width:680px;font-family:微软雅黑,\'Helvetica Neue\',Arial,sans-serif;margin:10px auto 0px;border:1px solid #eee;max-width:100%\">\r\n    <div style=\"width:100%;background:#2f889a;color:#ffffff;border-radius:5px 5px 0 0\">\r\n        <p style=\"font-size:15px;word-break:break-all;padding:20px 32px;margin:0\">\r\n            新评论通知\r\n        </p>\r\n    </div>\r\n    <div style=\"margin:0px auto;width:90%\">\r\n        <p>\r\n            评论内容：\r\n        </p>\r\n        <div style=\"background:#efefef;margin:15px 0px;padding:1px 15px;border-radius:5px;font-size:14px;color:#333\"><#if comment?exists>${comment.content}<#else>**无评论内容**</#if></div>\r\n        <p>\r\n            <a style=\"text-decoration:none;\" href=\"${config.siteUrl}${comment.sourceUrl}\" target=\"_blank\">查看完整评论</a>\r\n        </p>\r\n        <p>（注：此邮件由系统自动发出，请勿回复。）</p>\r\n    </div>\r\n    <div class=\"adL\">\r\n    </div>\r\n</div>\r\n</body>\r\n</html>','2025-11-27 16:35:24','2025-11-27 16:35:24'),(10,'TM_NGINX_FILE_SERVER','server {\r\n    listen 80;\r\n    server_name serverName;\r\n    root serverPath;\r\n	error_page 403 /error.html;\r\n	location = /error.html {\r\n		return 404;\r\n	}\r\n	autoindex off; \r\n	autoindex_exact_size off; \r\n	autoindex_localtime off; \r\n	\r\n	location ^~ / {\r\n		proxy_set_header Host $host:$server_port;\r\n    }\r\n	\r\n	location ~*\\.(jpg|gif|png|swf|flv|wma|wmv|asf|mp3|mmf|zip|rar|js|css)$ {\r\n		expires 30d;\r\n		valid_referers serverReferers;\r\n		if ($invalid_referer) {\r\n			rewrite ^/ serverLogoPath;\r\n		}\r\n    }\r\n}\r\n','2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_update_recorde`
--

DROP TABLE IF EXISTS `sys_update_recorde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_update_recorde` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新版本',
  `description` varchar(2500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新记录备注',
  `recorde_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '项目更新时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_update_recorde`
--

LOCK TABLES `sys_update_recorde` WRITE;
/*!40000 ALTER TABLE `sys_update_recorde` DISABLE KEYS */;
INSERT INTO `sys_update_recorde` VALUES (1,'1.0.1','第一版','2025-11-27 16:35:24','2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `sys_update_recorde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '登录密码',
  `nickname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '昵称',
  `mobile` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮箱地址',
  `qq` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'QQ',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `gender` smallint DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '头像地址',
  `user_type` enum('ROOT','ADMIN','USER') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'ADMIN' COMMENT '超级管理员、管理员、普通用户',
  `company` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '公司',
  `blog` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '个人博客地址',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '地址',
  `source` enum('GITHUB','GITEE','WEIBO','DINGTALK','BAIDU','CSDN','CODING','OSCHINA','TENCENT_CLOUD','ALIPAY','TAOBAO','QQ','WECHAT','GOOGLE','FACEBOOK') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户来源',
  `uuid` varchar(50) DEFAULT NULL COMMENT '用户唯一表示(第三方网站)',
  `privacy` tinyint DEFAULT NULL COMMENT '隐私（1：公开，0：不公开）',
  `notification` tinyint unsigned DEFAULT NULL COMMENT '通知：(1：通知显示消息详情，2：通知不显示详情)',
  `score` int unsigned DEFAULT '0' COMMENT '金币值',
  `experience` int unsigned DEFAULT '0' COMMENT '经验值',
  `reg_ip` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '注册IP',
  `last_login_ip` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '最近登录IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `login_count` int unsigned DEFAULT '0' COMMENT '登录次数',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户备注',
  `status` int unsigned DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'root','CGUx1FN++xS+4wNDFeN6DA==','超级管理员','15151551516','843977358@qq.com','843977358',NULL,NULL,'https://static.zhyd.me/static/img/favicon.ico','ROOT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,'127.0.0.1','2025-11-27 22:36:50',262,NULL,1,'2025-11-27 16:35:24','2025-11-27 22:36:50'),(2,'admin','gXp2EbyZ+sB/A6QUMhiUJQ==','管理员','15151551516','843977358@qq.com','843977358',NULL,NULL,NULL,'ADMIN',NULL,NULL,NULL,NULL,NULL,1,1,0,0,'0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1','2025-11-27 16:35:24',2,NULL,1,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,'comment-admin','x9qCx3yP05yWfIE5wXbCsg==','评论审核管理员','','','',NULL,NULL,NULL,'ADMIN',NULL,NULL,NULL,NULL,NULL,1,1,0,0,'0:0:0:0:0:0:0:1','0:0:0:0:0:0:0:1','2025-11-27 16:35:24',1,NULL,1,'2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1,1,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(2,2,2,'2025-11-27 16:35:24','2025-11-27 16:35:24'),(3,3,3,'2025-11-27 16:35:24','2025-11-27 16:35:24');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-27 22:58:06
