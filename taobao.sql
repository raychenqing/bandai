-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: taobao
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 购物车',7,'add_cartinfo'),(20,'Can change 购物车',7,'change_cartinfo'),(21,'Can delete 购物车',7,'delete_cartinfo'),(22,'Can add 商品类型',8,'add_goodstype'),(23,'Can change 商品类型',8,'change_goodstype'),(24,'Can delete 商品类型',8,'delete_goodstype'),(25,'Can add 商品',9,'add_goods'),(26,'Can change 商品',9,'change_goods'),(27,'Can delete 商品',9,'delete_goods'),(28,'Can add users',10,'add_users'),(29,'Can change users',10,'change_users'),(30,'Can delete users',10,'delete_users'),(31,'Can add 订单',11,'add_orders'),(32,'Can change 订单',11,'change_orders'),(33,'Can delete 订单',11,'delete_orders');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$MIMa7pGj3tQR$TUO1i4ptAyrHQ54L8nVRVNCOkHfNakd7Z+tdGv7SjwA=','2018-08-31 11:43:33.012237',1,'tarena','','','',1,1,'2018-08-14 01:19:53.677067');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-08-14 02:21:12.659921','1','新品上市',1,'[{\"added\": {}}]',8,1),(2,'2018-08-14 02:21:36.539073','2','截单专区',1,'[{\"added\": {}}]',8,1),(3,'2018-08-14 02:21:54.581782','3','本店人气商品',1,'[{\"added\": {}}]',8,1),(4,'2018-08-14 02:57:05.137158','1','万代模型HG 1/144 LEO里奥(宇宙式样)',1,'[{\"added\": {}}]',9,1),(5,'2018-08-14 02:57:47.759957','2','万代模型RE/100 1/100 89式基座承载机',1,'[{\"added\": {}}]',9,1),(6,'2018-08-14 02:58:48.820872','3','现货 ROBOT魂 TITAN REDEEMER救赎者泰坦 Pacific Ri',1,'[{\"added\": {}}]',9,1),(7,'2018-08-14 02:59:37.452781','4','ROBOT魂 GUARDIAN BRAVO英勇保护者 Pacific Rim2',1,'[{\"added\": {}}]',9,1),(8,'2018-08-14 03:00:08.418876','5','现货 ROBOT魂 BRACER PHOENIX凤凰游击士 Pacific Ri',1,'[{\"added\": {}}]',9,1),(9,'2018-08-14 03:00:46.657086','6','万代模型 RG /144 贾比·哈萨德专用机渣古II',1,'[{\"added\": {}}]',9,1),(10,'2018-08-14 03:02:04.708291','7','万代模型 RE 1/100 高达MK-Ⅲ 8号机',1,'[{\"added\": {}}]',9,1),(11,'2018-08-15 03:26:31.096822','8','万代进口模型 1/60 PG 00 强化高达/Gundam/高达 天人 O RA',1,'[{\"added\": {}}]',9,1),(12,'2018-08-15 03:27:21.607183','9','万代/BANDAI模型 PG 突击自由高达/高达 强袭自由 strike',1,'[{\"added\": {}}]',9,1),(13,'2018-08-15 03:27:46.464231','10','万代/BANDAI模型 1/60 PG 红色异端高达/Gundam/高达 日本',1,'[{\"added\": {}}]',9,1),(14,'2018-08-15 03:28:53.244347','11','万代模型 1/60 PG RX-O[N] 独角兽二号机报丧女妖 NORN/Gun',1,'[{\"added\": {}}]',9,1),(15,'2018-08-15 03:29:29.159187','12','万代/BANDAI模型 1/60 PG MS-06S 渣古/扎古Ⅱ 日本原装进口',1,'[{\"added\": {}}]',9,1),(16,'2018-08-15 03:29:53.705365','13','万代模型 1/60 PG 独角兽 RX-0 UNICORN 高达/Gundam',1,'[{\"added\": {}}]',9,1),(17,'2018-08-15 03:30:25.873903','14','万代模型 PG 1/60 能天使高达（带灯版)',1,'[{\"added\": {}}]',9,1),(18,'2018-08-15 03:31:17.387836','15','万代模型 PG 1/60 能天使敢达/高达 GUNDAM EXIA',1,'[{\"added\": {}}]',9,1),(19,'2018-08-15 03:31:49.729884','16','万代模型 PG 1/60 RX-78-2 gundam/敢达/高达 元祖 电镀版',1,'[{\"added\": {}}]',9,1),(20,'2018-08-15 03:32:09.857598','17','万代模型 PG 1/60 RX-78/C.A 卡斯巴尔专用高达 电镀版/夏亚专用',1,'[{\"added\": {}}]',9,1),(21,'2018-08-15 03:32:33.782860','18','万代模型 PG 1/60 RX-78-2高达/敢达 大河原邦男配色',1,'[{\"added\": {}}]',9,1),(22,'2018-08-15 03:33:06.668266','19','万代模型 1/60 PG 零式飞翼高达（SP版）/Gundam/高达 动漫 玩具',1,'[{\"added\": {}}]',9,1),(23,'2018-08-15 03:33:39.388715','20','万代/BANDAI模型 1/60 PG RX-178 高达 MK-Ⅱ A.E.U',1,'[{\"added\": {}}]',9,1),(24,'2018-08-15 03:33:59.961887','21','万代模型 1/60 渣古/扎古/ZAKUⅡ',1,'[{\"added\": {}}]',9,1),(25,'2018-08-15 03:34:22.240799','22','万代/BANDAI模型 1/60 PG RX-178 高达 MK- TITANS',1,'[{\"added\": {}}]',9,1),(26,'2018-08-15 03:40:04.086539','23','万代模型 MG 1/100 AAPE合作款 RX-78-2高达 迷彩限量版',1,'[{\"added\": {}}]',9,1),(27,'2018-08-15 03:40:22.499625','24','万代/BANDAI模型 1/100 MG Zeta 高达 2.0版/Gundam',1,'[{\"added\": {}}]',9,1),(28,'2018-08-15 03:40:43.120846','25','万代模型 HI-RM 1/100 零式飞翼高达EW HI-RESOLUTION',1,'[{\"added\": {}}]',9,1),(29,'2018-08-15 03:41:06.909486','26','万代模型 MG 1/100 独角兽高达2号机 报丧女妖 Ka版 Ver.Ka',1,'[{\"added\": {}}]',9,1),(30,'2018-08-15 03:41:29.621094','27','万代 模型 1/100 MG 独角兽高达二号机 报丧女妖钛合金版',1,'[{\"added\": {}}]',9,1),(31,'2018-08-15 03:41:50.485260','28','万代/BANDAI模型 1/100 MG 重生凤凰飞翼高达 gundam',1,'[{\"added\": {}}]',9,1),(32,'2018-08-15 03:42:22.529629','29','万代模型 MG 1/100 深度强袭 DEEP STRIKER',1,'[{\"added\": {}}]',9,1),(33,'2018-08-15 03:42:35.355839','30','万代/BANDAI模型 1/100 MG新安州（动画配色 OVA版)独角兽/Gu',1,'[{\"added\": {}}]',9,1),(34,'2018-08-15 03:42:53.878444','31','万代模型 1/100 MG 真·武者顽驮无 战国之阵 豪华装备 高达',1,'[{\"added\": {}}]',9,1),(35,'2018-08-15 03:43:14.430062','32','万代BANDAI GBF新品 MG1/100 BUILD GUNDAM 创制高达',1,'[{\"added\": {}}]',9,1),(36,'2018-08-15 03:43:31.292393','33','万代 MG 1/100 GUNDAM EXIA (TRANS-AM MODE)',1,'[{\"added\": {}}]',9,1),(37,'2018-08-15 03:43:53.064802','34','万代模型1/100 FULL MECHANICS巴巴托斯高达 天狼型 BARBA',1,'[{\"added\": {}}]',9,1),(38,'2018-08-15 03:44:13.106727','35','万代模型 MG 1/100 天帝gundam/高达/',1,'[{\"added\": {}}]',9,1),(39,'2018-08-15 03:44:39.018031','36','万代模型 MG 1/100 暗物质能天使 EXIA DARK MATTER高达创',1,'[{\"added\": {}}]',9,1),(40,'2018-08-15 03:45:06.396952','37','万代模型 1/100 MG 独角兽高达2 报丧女妖/Gundam/高达 unic',1,'[{\"added\": {}}]',9,1),(41,'2018-08-16 01:50:28.765706','38','MG 1/100 G-PARTS弗多得HRUDUDU',1,'[{\"added\": {}}]',9,1),(42,'2018-08-16 01:51:02.174426','39','MG 1/100 伊安格雷丁专用渣古加农IAN GRADEN 万代网络限定',1,'[{\"added\": {}}]',9,1),(43,'2018-08-16 01:51:39.174340','40','HG 1/144 里杰尔格 REGELGU 万代网络限定',1,'[{\"added\": {}}]',9,1),(44,'2018-08-16 01:52:08.861540','41','HG 1/144 精灵高达 GUNDAM PIXY 网',1,'[{\"added\": {}}]',9,1),(45,'2018-08-16 01:53:34.877343','42','MG 1/100 高达X3号机 GUNDAM X UNIT3 万代网络限定',1,'[{\"added\": {}}]',9,1),(46,'2018-08-23 08:56:42.505461','2','',3,'',10,1),(47,'2018-08-23 08:57:09.853919','3','12345678910',3,'',10,1),(48,'2018-08-23 08:58:03.111418','4','13789963024',2,'[{\"changed\": {\"fields\": [\"upwd\", \"uemail\", \"uname\", \"address\"]}}]',10,1),(49,'2018-08-27 08:03:47.940201','43','asfasf',1,'[{\"added\": {}}]',9,1),(50,'2018-08-27 08:05:51.689151','43','asfasf',2,'[{\"changed\": {\"fields\": [\"picture\"]}}]',9,1),(51,'2018-08-27 09:23:38.223715','43','asfasf',2,'[{\"changed\": {\"fields\": [\"picture\"]}}]',9,1),(52,'2018-08-28 07:30:19.678957','44','测试１',1,'[{\"added\": {}}]',9,1),(53,'2018-08-28 07:30:35.560778','45','测试２',1,'[{\"added\": {}}]',9,1),(54,'2018-08-28 08:20:24.458479','46','测试3',1,'[{\"added\": {}}]',9,1),(55,'2018-08-28 11:03:17.357039','44','测试１',2,'[{\"changed\": {\"fields\": [\"aoi\"]}}]',9,1),(56,'2018-08-29 07:30:38.605061','45','测试２',2,'[{\"changed\": {\"fields\": [\"isActive\", \"aoi\"]}}]',9,1),(57,'2018-08-31 11:43:45.255712','43','asfasf',2,'[{\"changed\": {\"fields\": [\"aoi\"]}}]',9,1),(58,'2018-08-31 11:44:27.694277','43','asfasf',2,'[{\"changed\": {\"fields\": [\"aoi\"]}}]',9,1),(59,'2018-08-31 11:50:14.752692','43','asfasf',2,'[{\"changed\": {\"fields\": [\"aoi\"]}}]',9,1);
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'index','cartinfo'),(9,'index','goods'),(8,'index','goodstype'),(11,'index','orders'),(10,'index','users'),(6,'sessions','session');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-08-13 01:14:01.626752'),(2,'auth','0001_initial','2018-08-13 01:14:02.247692'),(3,'admin','0001_initial','2018-08-13 01:14:02.345084'),(4,'admin','0002_logentry_remove_auto_add','2018-08-13 01:14:02.363232'),(5,'contenttypes','0002_remove_content_type_name','2018-08-13 01:14:02.425073'),(6,'auth','0002_alter_permission_name_max_length','2018-08-13 01:14:02.449862'),(7,'auth','0003_alter_user_email_max_length','2018-08-13 01:14:02.500971'),(8,'auth','0004_alter_user_username_opts','2018-08-13 01:14:02.511511'),(9,'auth','0005_alter_user_last_login_null','2018-08-13 01:14:02.573734'),(10,'auth','0006_require_contenttypes_0002','2018-08-13 01:14:02.578683'),(11,'auth','0007_alter_validators_add_error_messages','2018-08-13 01:14:02.591686'),(12,'auth','0008_alter_user_username_max_length','2018-08-13 01:14:02.668790'),(13,'index','0001_initial','2018-08-13 01:14:02.892764'),(14,'sessions','0001_initial','2018-08-13 01:14:02.921035'),(15,'index','0002_auto_20180814_1055','2018-08-14 02:56:10.109132'),(16,'index','0003_orders','2018-08-22 08:43:32.305708'),(17,'index','0004_auto_20180829_1527','2018-08-29 07:28:00.611640'),(18,'index','0005_goods_version','2018-08-29 08:39:40.357785'),(19,'index','0010_orders','2018-08-31 03:13:09.934383'),(20,'index','0011_orders_confirm_reciept','2018-08-31 07:46:00.761184');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0q5swe0t4liq9ca7vc6nfg2vj94slzor','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-22 12:59:37.070904'),('0yn8cuh7r24hlasa5ol92g6u8qqpaf7f','YWI2ZDRmNGQzNWEwZTdmM2MzMTRlOWU5ZWMyNDNjNzZiODU3ZjkyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjNmMDFhZWQzZGViOThmNDA4ODIzNDc4OWMwYTYyN2Y0NTE1YTIzMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-08-15 07:03:21.593424'),('16es2wkjg398ajkt5rzzw9jk2hrr8oxq','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-31 08:25:43.255512'),('188koc95mwi9j7ze805kwpoholslgbr7','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-29 02:19:35.527348'),('27xtm4nal3bkqe2eg81c7jwoehpvckxq','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 03:32:36.618777'),('2j8hkq4lkjfjlgav5w8o7vsu14sqpe03','MTgyZGI1MzU2NDViZGMwYjMxYmI5MGJhYjViZDU5YzY2MDM5Mjg3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjIzZjAxYWVkM2RlYjk4ZjQwODgyMzQ3ODljMGE2MjdmNDUxNWEyMzIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-08-14 03:26:18.872338'),('2p41n3u18jwxrjd4mc1cip7gvp75j4t6','OTg5NmMzODI2ZWVlOTI3NTc3NDNkM2Y5NzIzZjQxYTI2ZjhkZGM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyM2YwMWFlZDNkZWI5OGY0MDg4MjM0Nzg5YzBhNjI3ZjQ1MTVhMjMyIn0=','2018-08-14 02:50:38.613194'),('2q2wbu0sd2qt94ysu6tvp2obzrq8ljm9','NGQ2ZmJmOGIzNjVlODdiNWEyOTY5NzgyYWE4NzE3ZTg5ZWU4ZjYyODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJpZCI6MSwidXBob25lIjoiMTM3ODk5NDM2NTAiLCJfYXV0aF91c2VyX2hhc2giOiIyM2YwMWFlZDNkZWI5OGY0MDg4MjM0Nzg5YzBhNjI3ZjQ1MTVhMjMyIn0=','2018-08-16 02:47:06.236712'),('3uceqrxf4ohwoztp0l6qyh0pen64oecd','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 12:45:27.914168'),('4ck5xpj7j3lho7iqqy70rfzy427hmqmj','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 08:16:44.407314'),('4q77fzc4bgvylmsxt1x5ugeoni55ifb1','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 12:06:37.098185'),('4rshhr79kk20chnx97e25xk0jbp34dsg','YWI2ZDRmNGQzNWEwZTdmM2MzMTRlOWU5ZWMyNDNjNzZiODU3ZjkyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjNmMDFhZWQzZGViOThmNDA4ODIzNDc4OWMwYTYyN2Y0NTE1YTIzMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-08-28 07:59:13.507198'),('4xwlyfz046tn1lqv45c04kyn6e22vvyv','MGE1NzhlMWE0NDBiZGEwNDQ0ZjNiYmViNzQ3NGIxMzU5NWZkMWRkNTp7ImlkIjo2LCJ1cGhvbmUiOiIxMzc4OTk0MzY1MSJ9','2018-08-31 11:34:38.778242'),('5f5h2ofzl89uxtjh71yyj7w40ep76yt8','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 07:42:07.580793'),('5rj7wo1jnr219w28b1p6wq722qtjlpzo','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-29 09:10:42.067324'),('63wo03plmyyfhq03jo0wtumyy03b3t8o','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-21 09:46:40.255506'),('6xl7zoemmxswfjtfs826zjktj659kdvu','YWI2ZDRmNGQzNWEwZTdmM2MzMTRlOWU5ZWMyNDNjNzZiODU3ZjkyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjNmMDFhZWQzZGViOThmNDA4ODIzNDc4OWMwYTYyN2Y0NTE1YTIzMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-08-15 03:48:17.246026'),('74q6o63obtv1lev4ywfsrl6zr87u6an1','YWI2ZDRmNGQzNWEwZTdmM2MzMTRlOWU5ZWMyNDNjNzZiODU3ZjkyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjNmMDFhZWQzZGViOThmNDA4ODIzNDc4OWMwYTYyN2Y0NTE1YTIzMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-08-23 09:12:16.586873'),('75d2oxfc0t335vlbvlqzy6s8zdxggvha','Zjg0ZjY0OTViNDdiZmUwYmIwNTc1ODU4MjZmYjQ0YWQyNGI0MTk4NDp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyM2YwMWFlZDNkZWI5OGY0MDg4MjM0Nzg5YzBhNjI3ZjQ1MTVhMjMyIn0=','2018-08-31 12:13:33.029146'),('7lekdpgqfnvc787z3jclqnc2dj3b5oyk','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-28 12:05:22.660415'),('7pihchkj9g6fe0eckvtqudr1tbhay110','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-15 08:54:21.592897'),('7sly58ywcz7up90mskae64uclq62b7wa','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-20 06:06:10.086936'),('7wwdijlv1vw2q2jbwynas0ox0voqhnvd','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-31 02:32:15.780144'),('86lmfettb7vtrjo04qczt4qgko6e7shg','MzBmODZjYzY3MjQ0ZDQ3MDUwN2MyM2FlYjcxYWJkYThkNDA1MzVlMDp7ImlkIjo5LCJ1cGhvbmUiOiIxMzc4OTk0MzY1OSJ9','2018-08-27 08:24:19.358228'),('a11y1plrqxbep9m074exjqj9fi3mtdwu','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 10:26:02.890718'),('a3lzfdx6r262v92wkj8v32zfd02dhzsu','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-28 10:02:33.682487'),('a61mn12ihi1elaugw2uyk60svnmvj772','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 06:40:18.614246'),('b5e2ssxs6cefiya61wv86sp3r1ylbiqf','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-21 08:37:44.142747'),('c8ekksu5sys13phgbamu17xwxwkw2fkb','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 11:29:58.164121'),('cdckhm17vfmih1hvy1xu1urgrmy7m94w','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-31 10:11:06.003074'),('cp6zwu1v3uhkai6c4tvt9jycpkp03on2','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-31 03:02:40.211902'),('dp1o4az0owus9xccnli7q3afufoisjjn','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-29 11:17:16.537685'),('elwvcrlwa9r48gqywdyk8fbvcfwegcoh','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-31 09:07:53.159736'),('epvzxqgtr1yryr7fooi4h116qplszciv','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-31 10:54:19.200362'),('fv924xpziej3c0i82iaeq6e5pyh96d80','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-27 01:38:23.638507'),('ge9av6kx5h98sinvfl3k9r6o47ucoen6','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-29 12:20:30.760388'),('gxfthxtzqzdr5fa6b4fi7aforqvggjr1','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-22 12:23:46.237157'),('h379hq5rdhz6hy2r5z38j99ivnuvro8t','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-23 01:20:38.920945'),('jnnszco38v0pdque0d4jzb05itpiweef','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-15 12:44:38.394813'),('kt6p1e22xo8qc7s50bkfwoofibri7eym','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-22 01:24:47.519716'),('kvn29tcuzaf51bkl85cm77okksdku3o5','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 08:48:05.426353'),('kvnxe68zpu23j5drga33vfvf6789bsmi','OTg5NmMzODI2ZWVlOTI3NTc3NDNkM2Y5NzIzZjQxYTI2ZjhkZGM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyM2YwMWFlZDNkZWI5OGY0MDg4MjM0Nzg5YzBhNjI3ZjQ1MTVhMjMyIn0=','2018-08-20 06:02:02.881348'),('kyljmgynamscwmf380efou4y19d4estd','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-20 01:18:33.586320'),('liv9pmamq8dut73yv0872k9eub07kbkv','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-22 01:55:43.433439'),('mkyhuy78bwb6nzy3ni1g7jnla1nxoq88','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-28 10:58:30.907384'),('n120y1ro5c9dh58531rdprm8johu4sr8','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 09:22:39.834931'),('neawvzoz7cah5p27fwtkfm68kaw93px5','YTg1YzQ2YmFlMGY4OTI4ZTExNjRhZmZiMDBhNmQ1OTRkNGM1YzM4ODp7InVwaG9uZSI6IjEzNzg5OTQzNjUxIiwiaWQiOjZ9','2018-08-29 01:43:31.531470'),('nl7tzuhl2wfaufqoxcbtq9waxfc4yodz','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-22 03:07:13.850101'),('oi17t5helez4oe1kl8cwcwgs69430e56','MDczYjc2NjJlNDkyMjI4NTM4ZjU2NDc5YjgwM2UyOTQ4OGM1Y2U1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjIzZjAxYWVkM2RlYjk4ZjQwODgyMzQ3ODljMGE2MjdmNDUxNWEyMzIiLCJpZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsInVwaG9uZSI6IjEzNzg5OTQzNjUwIn0=','2018-08-28 11:32:50.404190'),('ojtgbxij46qejxoih7tgyxg3r4h5zfrv','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-31 03:44:33.323590'),('owb99n5r2q8ny0h7zphrnvjd828lll44','ZWRmMjM4NDJkZjY0ZTUwYWNlNzJmYTE1N2QzYjg4YTMzMTUyNTVhNjp7fQ==','2018-08-22 06:54:21.529832'),('pjczcwqieplqp2rpxxti1i5r757z4ado','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-28 12:38:23.994772'),('pzrldhycxjmoib7rty93hkq3x594bfev','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-29 06:41:40.827674'),('qx27ng1kh29sqbdgft17m7f0jp4llc9u','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-21 09:16:27.105300'),('qziq6ohbmbfcgp4y3awirmghex6ddm3u','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 01:23:57.870666'),('rm95wb5sj0rgxz0q37mhrd6e0d8d11cy','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-22 02:29:56.664459'),('rzdjck4ey05mmgy7ggg3yvftdw9mva4k','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-21 10:51:14.078614'),('s5yxovqbxlh12j223y30z3jodfshb8a5','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-15 10:32:57.160364'),('sba3xw2r8f9xhl1wuqgycw9j3dgb88ls','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-22 08:52:04.341149'),('sdmra35zs2y9wlt3d6n0x09sa1zeyr6a','OTg5NmMzODI2ZWVlOTI3NTc3NDNkM2Y5NzIzZjQxYTI2ZjhkZGM5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyM2YwMWFlZDNkZWI5OGY0MDg4MjM0Nzg5YzBhNjI3ZjQ1MTVhMjMyIn0=','2018-08-14 01:50:39.874928'),('su0c6jzt020k5jdfun3hg60xe9kounxy','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-15 12:10:44.012220'),('svxsuk5mt76y23zjdm4vtvpbo4c2ac0x','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-15 11:39:27.470418'),('tbq551xw7y5sdmn699lwqk1s1bxuqg6s','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-31 07:43:06.736304'),('u5nn7d7oy6ahjie2vz54ayrejp9iqc71','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 04:09:57.669015'),('uy58riydrms7i15qvuzcuwnl0c5my2rw','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-22 04:27:08.859580'),('uzlaoli8tmefinkm38mxvaksvoxtmh1l','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-22 03:55:51.744314'),('v7rpi80lbup6emfg23puuj2lnj0fjexk','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-22 05:59:13.623872'),('vqivqby0dudvcnkbn95dc3bh8sxpircs','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-16 07:11:38.711230'),('vyqnpyomwjr25k89wyls47o956xtj29i','OTM3YmRiNWI1YTVhNDJhYTc0N2I5ZjMwZDQ2NjExMWU2YTBiYjFkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjNmMDFhZWQzZGViOThmNDA4ODIzNDc4OWMwYTYyN2Y0NTE1YTIzMiIsInVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJpZCI6MX0=','2018-08-28 08:49:39.453046'),('w2c2ozl53mmnhd8a7224uyknzoupcfxs','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-29 09:56:57.943639'),('w2jr8zvkmwhw17mud8ow0lfk7gp7c9ut','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-15 10:01:32.674902'),('w57h9wvhx9mvfjsjqth5yurtfy9sqkts','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-28 03:21:21.644490'),('wg9mw54j439xllu92m6tshewp6j95n60','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-31 11:33:17.489353'),('wkv2ca0bztltwn109mlxowfccjleodn7','MTgyZGI1MzU2NDViZGMwYjMxYmI5MGJhYjViZDU5YzY2MDM5Mjg3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjIzZjAxYWVkM2RlYjk4ZjQwODgyMzQ3ODljMGE2MjdmNDUxNWEyMzIiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-08-29 07:59:40.747555'),('wsf5umymctnvs6e1i2e8tjw8c78mcxdi','ZTcyZTc0YTAwODM4MzdkYWY0MTE4YzY0OTI5Mjk5Njk5OGQzNWJhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjNmMDFhZWQzZGViOThmNDA4ODIzNDc4OWMwYTYyN2Y0NTE1YTIzMiIsImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-08-27 09:57:43.155103'),('xu19tuvj45w0oeohxs4axolii88qy3ea','N2YzYTgwMzQwZDE1N2MyMzQyMjRlZjBjMGFiMzJhYmViZjNjMTUxZjp7InVwaG9uZSI6IjEzNzg5OTQzNjUwIiwiaWQiOjF9','2018-08-31 09:20:48.606360'),('yyrlevb3dd6hnzbkm9yooq1srtavh8dp','MGE1NzhlMWE0NDBiZGEwNDQ0ZjNiYmViNzQ3NGIxMzU5NWZkMWRkNTp7ImlkIjo2LCJ1cGhvbmUiOiIxMzc4OTk0MzY1MSJ9','2018-08-22 10:06:50.763374'),('z94dwtil6f1d0e69z4npcjcqlonpz60x','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-31 12:46:52.789406'),('zapl7ub158xx8amuwiptythbfazizqsq','NTdiODFkM2U4ZDI2Mzk2NGRkZmIwOGM3NTE4NzhlMzA4ZjFiNmViNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidXBob25lIjoiMTM3ODk5NDM2NTAiLCJfYXV0aF91c2VyX2hhc2giOiIyM2YwMWFlZDNkZWI5OGY0MDg4MjM0Nzg5YzBhNjI3ZjQ1MTVhMjMyIn0=','2018-08-27 08:29:39.409898'),('zv8d44l97fdgem432jlvur8ig1cgkg4o','YThmMGJmYTJjNTI0OWUxZDI5MTg2OWZkYjI4NWRiMDdmMjA2ZWZiODp7ImlkIjoxLCJ1cGhvbmUiOiIxMzc4OTk0MzY1MCJ9','2018-08-29 06:45:52.639214');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_cartinfo`
--

DROP TABLE IF EXISTS `index_cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccount` int(10) unsigned NOT NULL,
  `good_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cartinfo_good_id_e1acfc0d_fk_index_goods_id` (`good_id`),
  KEY `index_cartinfo_user_id_de9b1e45_fk_index_users_id` (`user_id`),
  CONSTRAINT `index_cartinfo_good_id_e1acfc0d_fk_index_goods_id` FOREIGN KEY (`good_id`) REFERENCES `index_goods` (`id`),
  CONSTRAINT `index_cartinfo_user_id_de9b1e45_fk_index_users_id` FOREIGN KEY (`user_id`) REFERENCES `index_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_cartinfo`
--

LOCK TABLES `index_cartinfo` WRITE;
/*!40000 ALTER TABLE `index_cartinfo` DISABLE KEYS */;
INSERT INTO `index_cartinfo` VALUES (9,1,42,9),(18,0,45,1);
/*!40000 ALTER TABLE `index_cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_goods`
--

DROP TABLE IF EXISTS `index_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `goodsType_id` int(11) DEFAULT NULL,
  `aoi` int(10) unsigned NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goods_goodsType_id_51797e1d_fk_index_goodstype_id` (`goodsType_id`),
  CONSTRAINT `index_goods_goodsType_id_51797e1d_fk_index_goodstype_id` FOREIGN KEY (`goodsType_id`) REFERENCES `index_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_goods`
--

LOCK TABLES `index_goods` WRITE;
/*!40000 ALTER TABLE `index_goods` DISABLE KEYS */;
INSERT INTO `index_goods` VALUES (1,'万代模型HG 1/144 LEO里奥(宇宙式样)',95.00,'static/upload/goods/new1.jpg',1,1,10,1),(2,'万代模型RE/100 1/100 89式基座承载机',195.00,'static/upload/goods/new2.jpg',1,1,5,1),(3,'现货 ROBOT魂 TITAN REDEEMER救赎者泰坦 Pacific Ri',390.00,'static/upload/goods/new3.jpg',1,1,4,1),(4,'ROBOT魂 GUARDIAN BRAVO英勇保护者 Pacific Rim2',390.00,'static/upload/goods/new4.jpg',1,1,1,3),(5,'现货 ROBOT魂 BRACER PHOENIX凤凰游击士 Pacific Ri',390.00,'static/upload/goods/new5.jpg',1,1,0,3),(6,'万代模型 RG /144 贾比·哈萨德专用机渣古II',195.00,'static/upload/goods/new6.jpg',1,1,9,2),(7,'万代模型 RE 1/100 高达MK-Ⅲ 8号机',239.00,'static/upload/goods/new7.jpg',1,1,9,2),(8,'万代进口模型 1/60 PG 00 强化高达/Gundam/高达 天人 O RA',2500.00,'static/upload/goods/renqi1.jpg',1,3,10,1),(9,'万代/BANDAI模型 PG 突击自由高达/高达 强袭自由 strike',2500.00,'static/upload/goods/renqi2.jpg',1,3,10,1),(10,'万代/BANDAI模型 1/60 PG 红色异端高达/Gundam/高达 日本',1800.00,'static/upload/goods/renqi3.jpg',1,3,10,1),(11,'万代模型 1/60 PG RX-O[N] 独角兽二号机报丧女妖 NORN/Gun',2200.00,'static/upload/goods/renqi4.jpg',1,3,10,1),(12,'万代/BANDAI模型 1/60 PG MS-06S 渣古/扎古Ⅱ 日本原装进口',1200.00,'static/upload/goods/renqi5.jpg',1,3,10,1),(13,'万代模型 1/60 PG 独角兽 RX-0 UNICORN 高达/Gundam',2000.00,'static/upload/goods/renqi6.jpg',1,3,10,1),(14,'万代模型 PG 1/60 能天使高达（带灯版)',3200.00,'static/upload/goods/renqi7.jpg',1,3,10,1),(15,'万代模型 PG 1/60 能天使敢达/高达 GUNDAM EXIA',1800.00,'static/upload/goods/renqi8.jpg',1,3,10,1),(16,'万代模型 PG 1/60 RX-78-2 gundam/敢达/高达 元祖 电镀版',2000.00,'static/upload/goods/renqi9.jpg',1,3,10,1),(17,'万代模型 PG 1/60 RX-78/C.A 卡斯巴尔专用高达 电镀版/夏亚专用',2000.00,'static/upload/goods/renqi10.jpg',1,3,10,1),(18,'万代模型 PG 1/60 RX-78-2高达/敢达 大河原邦男配色',1429.00,'static/upload/goods/renqi11.jpg',1,3,10,1),(19,'万代模型 1/60 PG 零式飞翼高达（SP版）/Gundam/高达 动漫 玩具',3000.00,'static/upload/goods/renqi12.jpg',1,3,10,1),(20,'万代/BANDAI模型 1/60 PG RX-178 高达 MK-Ⅱ A.E.U',1500.00,'static/upload/goods/renqi13.jpg',1,3,10,1),(21,'万代模型 1/60 渣古/扎古/ZAKUⅡ',250.00,'static/upload/goods/renqi14.jpg',1,3,10,1),(22,'万代/BANDAI模型 1/60 PG RX-178 高达 MK- TITANS',1500.00,'static/upload/goods/renqi15.jpg',1,3,10,1),(23,'万代模型 MG 1/100 AAPE合作款 RX-78-2高达 迷彩限量版',450.00,'static/upload/goods/renqi16.jpg',1,3,10,1),(24,'万代/BANDAI模型 1/100 MG Zeta 高达 2.0版/Gundam',500.00,'static/upload/goods/renqi17.jpg',1,3,10,1),(25,'万代模型 HI-RM 1/100 零式飞翼高达EW HI-RESOLUTION',1200.00,'static/upload/goods/renqi18.jpg',1,3,10,1),(26,'万代模型 MG 1/100 独角兽高达2号机 报丧女妖 Ka版 Ver.Ka',500.00,'static/upload/goods/renqi19.jpg',1,3,10,1),(27,'万代 模型 1/100 MG 独角兽高达二号机 报丧女妖钛合金版',1200.00,'static/upload/goods/renqi20.jpg',1,3,10,1),(28,'万代/BANDAI模型 1/100 MG 重生凤凰飞翼高达 gundam',480.00,'static/upload/goods/renqi21.jpg',1,3,10,1),(29,'万代模型 MG 1/100 深度强袭 DEEP STRIKER',2000.00,'static/upload/goods/renqi22.jpg',1,3,10,1),(30,'万代/BANDAI模型 1/100 MG新安州（动画配色 OVA版)独角兽/Gu',750.00,'static/upload/goods/renqi23.jpg',1,3,10,1),(31,'万代模型 1/100 MG 真·武者顽驮无 战国之阵 豪华装备 高达',800.00,'static/upload/goods/renqi24.jpg',1,3,10,1),(32,'万代BANDAI GBF新品 MG1/100 BUILD GUNDAM 创制高达',500.00,'static/upload/goods/renqi25.jpg',1,3,9,2),(33,'万代 MG 1/100 GUNDAM EXIA (TRANS-AM MODE)',580.00,'static/upload/goods/renqi26.jpg',1,3,9,2),(34,'万代模型1/100 FULL MECHANICS巴巴托斯高达 天狼型 BARBA',300.00,'static/upload/goods/renqi27.jpg',1,3,10,1),(35,'万代模型 MG 1/100 天帝gundam/高达/',500.00,'static/upload/goods/renqi28.jpg',1,3,10,1),(36,'万代模型 MG 1/100 暗物质能天使 EXIA DARK MATTER高达创',500.00,'static/upload/goods/renqi29.jpg',1,3,10,1),(37,'万代模型 1/100 MG 独角兽高达2 报丧女妖/Gundam/高达 unic',550.00,'static/upload/goods/renqi30.jpg',1,3,10,1),(38,'MG 1/100 G-PARTS弗多得HRUDUDU',350.00,'static/upload/goods/jiedan1.jpg',1,2,3,2),(39,'MG 1/100 伊安格雷丁专用渣古加农IAN GRADEN 万代网络限定',450.00,'static/upload/goods/jiedan2.jpg',1,2,3,2),(40,'HG 1/144 里杰尔格 REGELGU 万代网络限定',260.00,'static/upload/goods/jiedan3.jpg',1,2,0,6),(41,'HG 1/144 精灵高达 GUNDAM PIXY 网',490.00,'static/upload/goods/jiedan4.jpg',1,2,10,1),(42,'MG 1/100 高达X3号机 GUNDAM X UNIT3 万代网络限定',719.00,'static/upload/goods/jiedan5.jpg',1,2,1,1),(43,'asfasf',12345.00,'static/upload/goods/huiyuanzhuce.jpg',1,1,0,2),(44,'测试１',100.00,'static/upload/goods/huiyuanzhuce_lAukajs.jpg',0,3,0,1),(45,'测试２',100.00,'static/upload/goods/huiyuanzhuce_G3ADZOG.jpg',1,3,0,2),(46,'测试3',100.00,'static/upload/goods/huiyuanzhuce_a85Vv3m.jpg',1,3,0,1);
/*!40000 ALTER TABLE `index_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_goodstype`
--

DROP TABLE IF EXISTS `index_goodstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_goodstype`
--

LOCK TABLES `index_goodstype` WRITE;
/*!40000 ALTER TABLE `index_goodstype` DISABLE KEYS */;
INSERT INTO `index_goodstype` VALUES (1,'新品上市','static/upload/goodstype/goodstype_1.jpg','新品上市'),(2,'截单专区','static/upload/goodstype/goodstype_2.jpg','截单专区'),(3,'本店人气商品','static/upload/goodstype/goodstype_3.jpg','本店人气商品');
/*!40000 ALTER TABLE `index_goodstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_orders`
--

DROP TABLE IF EXISTS `index_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccount` int(10) unsigned NOT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `done_date` datetime(6) DEFAULT NULL,
  `comment` varchar(200) NOT NULL,
  `isDone` tinyint(1) NOT NULL,
  `good_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `confirm_reciept` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_good_id_b817773b_fk_index_goods_id` (`good_id`),
  KEY `index_orders_user_id_1818a73b_fk_index_users_id` (`user_id`),
  CONSTRAINT `index_orders_good_id_b817773b_fk_index_goods_id` FOREIGN KEY (`good_id`) REFERENCES `index_goods` (`id`),
  CONSTRAINT `index_orders_user_id_1818a73b_fk_index_users_id` FOREIGN KEY (`user_id`) REFERENCES `index_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_orders`
--

LOCK TABLES `index_orders` WRITE;
/*!40000 ALTER TABLE `index_orders` DISABLE KEYS */;
INSERT INTO `index_orders` VALUES (1,1,'2018-08-31 03:14:52.514256','2018-08-31 08:38:34.046774','好评',1,40,1,1),(2,1,'2018-08-31 03:28:28.639293','2018-08-31 03:35:26.040186','',1,33,1,0),(3,1,'2018-08-31 03:28:28.687738','2018-08-31 03:35:26.074233','',1,32,1,0),(4,1,'2018-08-31 11:05:10.535958','2018-08-31 11:05:28.220395','',1,45,6,0);
/*!40000 ALTER TABLE `index_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_users`
--

DROP TABLE IF EXISTS `index_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uphone` varchar(11) NOT NULL,
  `upwd` varchar(30) NOT NULL,
  `uemail` varchar(254) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_users`
--

LOCK TABLES `index_users` WRITE;
/*!40000 ALTER TABLE `index_users` DISABLE KEYS */;
INSERT INTO `index_users` VALUES (1,'13789943650','123456','raychenqing@qq.com','陈庆','长椿街12号',1),(4,'13789963024','123456','xiaoli@qq.com','小李','上街村号',1),(5,'13912345678',' 123456','afsaffsa@qq.com','asfasf','safasfasf',1),(6,'13789943651','123456','asfas@qq.com','sfrsafsa','asfasfasf',1),(7,'13789943652','123456','asfasfsaf@qq.com','asfasfa','asfasfasf',1),(8,'13789943653','123456','qwrqwrq@qq.com','wqrwqr','qwrqwr',1),(9,'13789943659','123456','fgssdgfdfg@163.com','sfsfd','asfagsg',1);
/*!40000 ALTER TABLE `index_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-03 11:20:44
