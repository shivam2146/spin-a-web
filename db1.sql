-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB-6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Customer'),(1,'Manager');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add bank',7,'add_bank'),(20,'Can change bank',7,'change_bank'),(21,'Can delete bank',7,'delete_bank'),(22,'Can add bank manager',8,'add_bankmanager'),(23,'Can change bank manager',8,'change_bankmanager'),(24,'Can delete bank manager',8,'delete_bankmanager'),(25,'Can add customer',9,'add_customer'),(26,'Can change customer',9,'change_customer'),(27,'Can delete customer',9,'delete_customer'),(28,'Can add beneficiary',10,'add_beneficiary'),(29,'Can change beneficiary',10,'change_beneficiary'),(30,'Can delete beneficiary',10,'delete_beneficiary');
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
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$2RLxGA6uwvie$6zdw1ojgjgMLaMyaF0HYnQ6+3onJqM5PcyORzRHTKuM=','2018-02-03 00:25:01.230144',1,'root','','','bhoomika.mcs17.du@gmail.com',1,1,'2018-02-02 15:32:41.283814'),(2,'pbkdf2_sha256$100000$047hvqUFd1wM$t3vuqZL91C3NQjl0MumHIFsdLi9tadSo7HE7PcMtkK0=','2018-02-02 21:00:23.363225',0,'shivam','','','',0,1,'2018-02-02 18:44:00.000000'),(3,'pbkdf2_sha256$100000$CQCUKIEqMcjw$8VvhwDMc09xVNxoFoMK44jvwnSNCIDEIiNDggOMo9xs=','2018-02-03 00:28:25.076611',0,'robert','','','',0,1,'2018-02-02 18:45:11.000000'),(4,'pbkdf2_sha256$100000$b1VgZ7xJd4ZI$QxpVNKDNZrx3r87lofjdk8BitldA0L/C9HDbnVkPxeA=',NULL,0,'bhoomika','','','',0,1,'2018-02-02 18:46:35.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,2,2),(1,3,1),(3,4,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_bank`
--

DROP TABLE IF EXISTS `bank_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_bank` (
  `b_code` varchar(50) NOT NULL,
  `b_name` varchar(100) NOT NULL,
  `b_ifsc` varchar(11) NOT NULL,
  `b_address` longtext NOT NULL,
  `b_email` varchar(254) NOT NULL,
  `b_phone` varchar(17) NOT NULL,
  PRIMARY KEY (`b_code`),
  UNIQUE KEY `bank_bank_b_ifsc_080206ac_uniq` (`b_ifsc`),
  UNIQUE KEY `bank_bank_b_name_ae5e7cf4_uniq` (`b_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_bank`
--

LOCK TABLES `bank_bank` WRITE;
/*!40000 ALTER TABLE `bank_bank` DISABLE KEYS */;
INSERT INTO `bank_bank` VALUES ('hdfc101','HDFC Bank','HDFC0004324','PN 24, Sector 20\r\nDwarka\r\nNew Delhi - 110075','hdfc@gmail.com','+911161606161'),('yes101','YESBANK','YESB0000003','Plot No. 11 48, Shopping Centre, , Diplomatic Enclave, Malcha Market, , Chanakyapuri, New Delhi, Delhi-110021','yestouch@yesbank.in','+912261219000');
/*!40000 ALTER TABLE `bank_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_bankmanager`
--

DROP TABLE IF EXISTS `bank_bankmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_bankmanager` (
  `Manager_id` varchar(50) NOT NULL,
  `manager_name` varchar(100) NOT NULL,
  `manager_address` longtext NOT NULL,
  `manager_email` varchar(254) NOT NULL,
  `manager_phone` varchar(17) NOT NULL,
  `manager_bcode_id` varchar(50) NOT NULL,
  `manager_username_id` int(11) NOT NULL,
  PRIMARY KEY (`Manager_id`),
  KEY `bank_bankmanager_manager_bcode_id_441f6326_fk_bank_bank_b_code` (`manager_bcode_id`),
  KEY `bank_bankmanager_manager_username_id_5123e19d_fk_auth_user_id` (`manager_username_id`),
  CONSTRAINT `bank_bankmanager_manager_bcode_id_441f6326_fk_bank_bank_b_code` FOREIGN KEY (`manager_bcode_id`) REFERENCES `bank_bank` (`b_code`),
  CONSTRAINT `bank_bankmanager_manager_username_id_5123e19d_fk_auth_user_id` FOREIGN KEY (`manager_username_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_bankmanager`
--

LOCK TABLES `bank_bankmanager` WRITE;
/*!40000 ALTER TABLE `bank_bankmanager` DISABLE KEYS */;
INSERT INTO `bank_bankmanager` VALUES ('m01','Robert','159,old gupta colony','24.shivamagarwal@gmail.com','+919582844208','hdfc101',3);
/*!40000 ALTER TABLE `bank_bankmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_beneficiary`
--

DROP TABLE IF EXISTS `bank_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_beneficiary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ben_cusacc` varchar(34) NOT NULL,
  `Beneficiary_name` varchar(50) NOT NULL,
  `Beneficiary_transfer_limit` decimal(10,2) NOT NULL,
  `Beneficiary_account_no_id` varchar(34) NOT NULL,
  `Beneficiary_bankname_id` varchar(100) NOT NULL,
  `Beneficiary_ifsc_id` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_beneficiary_ben_cusacc_ben_acc_id_b12ff279_uniq` (`ben_cusacc`,`Beneficiary_account_no_id`),
  KEY `bank_beneficiary_Beneficiary_account__b5247936_fk_bank_cust` (`Beneficiary_account_no_id`),
  KEY `bank_beneficiary_Beneficiary_bankname_a4a8356e_fk_bank_bank` (`Beneficiary_bankname_id`),
  KEY `bank_beneficiary_Beneficiary_ifsc_id_4be0fa60_fk_bank_bank` (`Beneficiary_ifsc_id`),
  CONSTRAINT `bank_beneficiary_Beneficiary_account__b5247936_fk_bank_cust` FOREIGN KEY (`Beneficiary_account_no_id`) REFERENCES `bank_customer` (`cus_accno`),
  CONSTRAINT `bank_beneficiary_Beneficiary_bankname_a4a8356e_fk_bank_bank` FOREIGN KEY (`Beneficiary_bankname_id`) REFERENCES `bank_bank` (`b_name`),
  CONSTRAINT `bank_beneficiary_Beneficiary_ifsc_id_4be0fa60_fk_bank_bank` FOREIGN KEY (`Beneficiary_ifsc_id`) REFERENCES `bank_bank` (`b_ifsc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_beneficiary`
--

LOCK TABLES `bank_beneficiary` WRITE;
/*!40000 ALTER TABLE `bank_beneficiary` DISABLE KEYS */;
INSERT INTO `bank_beneficiary` VALUES (1,'214146541632','Shivam',5000.00,'214146541215','HDFC Bank','HDFC0004324');
/*!40000 ALTER TABLE `bank_beneficiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_customer`
--

DROP TABLE IF EXISTS `bank_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_customer` (
  `cus_accno` varchar(34) NOT NULL,
  `cus_cifno` varchar(11) NOT NULL,
  `cus_accountType` varchar(25) NOT NULL,
  `cus_balance` decimal(10,2) NOT NULL,
  `cus_acc_start_date` date NOT NULL,
  `cus_acc_status` tinyint(1) NOT NULL,
  `cus_bcode_id` varchar(50) NOT NULL,
  `cus_username_id` int(11) NOT NULL,
  PRIMARY KEY (`cus_accno`),
  UNIQUE KEY `bank_customer_cus_accno_b831c219_uniq` (`cus_accno`),
  KEY `bank_customer_cus_bcode_id_567344e0_fk_bank_bank_b_code` (`cus_bcode_id`),
  KEY `bank_customer_cus_username_id_7571009c_fk_auth_user_id` (`cus_username_id`),
  CONSTRAINT `bank_customer_cus_bcode_id_567344e0_fk_bank_bank_b_code` FOREIGN KEY (`cus_bcode_id`) REFERENCES `bank_bank` (`b_code`),
  CONSTRAINT `bank_customer_cus_username_id_7571009c_fk_auth_user_id` FOREIGN KEY (`cus_username_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_customer`
--

LOCK TABLES `bank_customer` WRITE;
/*!40000 ALTER TABLE `bank_customer` DISABLE KEYS */;
INSERT INTO `bank_customer` VALUES ('214146541215','21453256312','saving',1000.00,'2018-02-02',1,'hdfc101',2),('214146541632','12345682131','saving',2000.00,'2018-02-02',1,'hdfc101',4);
/*!40000 ALTER TABLE `bank_customer` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-02-02 17:03:05.262821','hdfc101','Bank object (hdfc101)',1,'[{\"added\": {}}]',7,1),(2,'2018-02-02 17:07:01.663997','yes101','Bank object (yes101)',1,'[{\"added\": {}}]',7,1),(3,'2018-02-02 18:43:11.194629','1','Manager',1,'[{\"added\": {}}]',3,1),(4,'2018-02-02 18:43:23.876827','2','Customer',1,'[{\"added\": {}}]',3,1),(5,'2018-02-02 18:44:00.453457','2','shivam',1,'[{\"added\": {}}]',4,1),(6,'2018-02-02 18:45:11.774908','3','robert',1,'[{\"added\": {}}]',4,1),(7,'2018-02-02 18:45:40.186702','3','robert',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(8,'2018-02-02 18:46:06.602309','2','shivam',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(9,'2018-02-02 18:46:35.617593','4','bhoomika',1,'[{\"added\": {}}]',4,1),(10,'2018-02-02 18:46:47.711431','4','bhoomika',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(11,'2018-02-02 19:02:53.749167','1','Customer object (1)',1,'[{\"added\": {}}]',9,1),(12,'2018-02-02 19:03:32.112161','2','Customer object (2)',1,'[{\"added\": {}}]',9,1),(13,'2018-02-02 23:17:24.335348','m01','BankManager object (m01)',1,'[{\"added\": {}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'bank','bank'),(8,'bank','bankmanager'),(10,'bank','beneficiary'),(9,'bank','customer'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-02 15:28:54.953666'),(2,'auth','0001_initial','2018-02-02 15:29:02.094809'),(3,'admin','0001_initial','2018-02-02 15:29:03.541061'),(4,'admin','0002_logentry_remove_auto_add','2018-02-02 15:29:03.587079'),(5,'contenttypes','0002_remove_content_type_name','2018-02-02 15:29:04.492351'),(6,'auth','0002_alter_permission_name_max_length','2018-02-02 15:29:05.108740'),(7,'auth','0003_alter_user_email_max_length','2018-02-02 15:29:05.747387'),(8,'auth','0004_alter_user_username_opts','2018-02-02 15:29:05.797060'),(9,'auth','0005_alter_user_last_login_null','2018-02-02 15:29:06.217115'),(10,'auth','0006_require_contenttypes_0002','2018-02-02 15:29:06.251599'),(11,'auth','0007_alter_validators_add_error_messages','2018-02-02 15:29:06.295996'),(12,'auth','0008_alter_user_username_max_length','2018-02-02 15:29:07.650366'),(13,'auth','0009_alter_user_last_name_max_length','2018-02-02 15:29:08.266381'),(14,'sessions','0001_initial','2018-02-02 15:29:08.758762'),(15,'bank','0001_initial','2018-02-02 16:58:05.195885'),(16,'bank','0002_bankmanager','2018-02-02 17:49:18.524539'),(17,'bank','0003_customer','2018-02-02 18:17:58.797583'),(18,'bank','0003_auto_20180202_1829','2018-02-02 18:31:09.405396'),(19,'bank','0002_bankmanager_customer','2018-02-02 18:35:23.890068'),(20,'bank','0003_auto_20180202_1853','2018-02-02 18:53:11.522580'),(21,'bank','0004_auto_20180202_1857','2018-02-02 18:58:14.631685'),(22,'bank','0005_auto_20180202_1858','2018-02-02 18:58:14.718962'),(23,'bank','0006_auto_20180202_1901','2018-02-02 19:02:03.021804'),(24,'bank','0007_auto_20180202_2104','2018-02-02 21:04:21.202587'),(25,'bank','0008_auto_20180202_2133','2018-02-02 21:33:41.196200'),(26,'bank','0009_auto_20180202_2206','2018-02-02 22:06:57.188321'),(27,'bank','0010_auto_20180202_2216','2018-02-02 22:16:52.494859');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('yqdkvwbeuaidx255w3uufnxijfdojuij','ZTMyNGNjMmQ1ZDRiZjM4ZjBmZDE4NDQ3NmVhOWJiNjZlNGFhYzNkYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmM2M5OTc4MDY2NTZjMGIwYjM0NjYyNGMxMjQ2ZGFiODkyMWE1OTc5In0=','2018-02-17 00:28:25.144608');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-03  6:06:01
