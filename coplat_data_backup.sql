-- MySQL dump 10.16  Distrib 10.1.14-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: CoPlat
-- ------------------------------------------------------
-- Server version	10.1.14-MariaDB

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
-- Table structure for table `CoPlat_admin`
--

DROP TABLE IF EXISTS `CoPlat_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_admin` (
  `Id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `CoPlat_admin_user_id_49b12f7f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_admin`
--

LOCK TABLES `CoPlat_admin` WRITE;
/*!40000 ALTER TABLE `CoPlat_admin` DISABLE KEYS */;
INSERT INTO `CoPlat_admin` VALUES ('a11111111',3);
/*!40000 ALTER TABLE `CoPlat_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_assignment`
--

DROP TABLE IF EXISTS `CoPlat_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_assignment` (
  `No` varchar(50) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Content` varchar(2000) NOT NULL,
  `Attachment` varchar(100) NOT NULL,
  `Score` int(11) NOT NULL,
  `Comment` varchar(2000) NOT NULL,
  `coursework_id` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_assignment_d2372524` (`coursework_id`),
  KEY `CoPlat_assignment_30a811f6` (`student_id`),
  CONSTRAINT `CoPlat_assignment_coursework_id_ef61580e_fk_CoPlat_coursework_No` FOREIGN KEY (`coursework_id`) REFERENCES `CoPlat_coursework` (`No`),
  CONSTRAINT `CoPlat_assignment_student_id_c5b9e6c6_fk_CoPlat_student_Id` FOREIGN KEY (`student_id`) REFERENCES `CoPlat_student` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_assignment`
--

LOCK TABLES `CoPlat_assignment` WRITE;
/*!40000 ALTER TABLE `CoPlat_assignment` DISABLE KEYS */;
INSERT INTO `CoPlat_assignment` VALUES ('s11110000_101','s11110000_101.pdf','','Coursework/s11110000_101.pdf',0,'','101','s11110000');
/*!40000 ALTER TABLE `CoPlat_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_course`
--

DROP TABLE IF EXISTS `CoPlat_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_course` (
  `No` varchar(50) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Credit` double NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Duration` int(10) unsigned NOT NULL,
  `semester_id` varchar(50) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_course_5d4db337` (`semester_id`),
  CONSTRAINT `CoPlat_course_semester_id_58b3ece1_fk_CoPlat_semester_No` FOREIGN KEY (`semester_id`) REFERENCES `CoPlat_semester` (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_course`
--

LOCK TABLES `CoPlat_course` WRITE;
/*!40000 ALTER TABLE `CoPlat_course` DISABLE KEYS */;
INSERT INTO `CoPlat_course` VALUES ('1','Linear Algebra',3,'2016-07-08','2016-07-14',1,'201601'),('2','Algorithm',2,'2016-07-09','2016-07-22',2,'201601');
/*!40000 ALTER TABLE `CoPlat_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_coursework`
--

DROP TABLE IF EXISTS `CoPlat_coursework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_coursework` (
  `No` varchar(50) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `Start_Time` datetime(6) NOT NULL,
  `End_Time` datetime(6) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_coursework_ea134da7` (`course_id`),
  CONSTRAINT `CoPlat_coursework_course_id_33ab9fa1_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `CoPlat_course` (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_coursework`
--

LOCK TABLES `CoPlat_coursework` WRITE;
/*!40000 ALTER TABLE `CoPlat_coursework` DISABLE KEYS */;
INSERT INTO `CoPlat_coursework` VALUES ('101','This is the first coursework for Linear Algebra','2016-07-09 20:00:00.000000','2016-07-17 07:59:00.000000','1'),('102','This is the second coursework for Linear Algebra.','2016-07-23 20:00:00.000000','2016-07-31 07:59:00.000000','1');
/*!40000 ALTER TABLE `CoPlat_coursework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_enrollment`
--

DROP TABLE IF EXISTS `CoPlat_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_enrollment` (
  `No` varchar(50) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_enrollment_course_id_85eecb18_fk_CoPlat_course_No` (`course_id`),
  KEY `CoPlat_enrollment_30a811f6` (`student_id`),
  CONSTRAINT `CoPlat_enrollment_course_id_85eecb18_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `CoPlat_course` (`No`),
  CONSTRAINT `CoPlat_enrollment_student_id_7573449a_fk_CoPlat_student_Id` FOREIGN KEY (`student_id`) REFERENCES `CoPlat_student` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_enrollment`
--

LOCK TABLES `CoPlat_enrollment` WRITE;
/*!40000 ALTER TABLE `CoPlat_enrollment` DISABLE KEYS */;
INSERT INTO `CoPlat_enrollment` VALUES ('s11110000_1','1','s11110000'),('s11110000_2','2','s11110000');
/*!40000 ALTER TABLE `CoPlat_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_instruction`
--

DROP TABLE IF EXISTS `CoPlat_instruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_instruction` (
  `No` varchar(50) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `teacher_id` varchar(50) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_instruction_course_id_10799095_fk_CoPlat_course_No` (`course_id`),
  KEY `CoPlat_instruction_d9614d40` (`teacher_id`),
  CONSTRAINT `CoPlat_instruction_course_id_10799095_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `CoPlat_course` (`No`),
  CONSTRAINT `CoPlat_instruction_teacher_id_b29d10b6_fk_CoPlat_teacher_Id` FOREIGN KEY (`teacher_id`) REFERENCES `CoPlat_teacher` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_instruction`
--

LOCK TABLES `CoPlat_instruction` WRITE;
/*!40000 ALTER TABLE `CoPlat_instruction` DISABLE KEYS */;
INSERT INTO `CoPlat_instruction` VALUES ('t00001111_1','1','t00001111'),('t00001111_2','2','t00001111');
/*!40000 ALTER TABLE `CoPlat_instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_resource`
--

DROP TABLE IF EXISTS `CoPlat_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_resource` (
  `No` varchar(50) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `Attachment` varchar(100) NOT NULL,
  `Category` varchar(20) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_resource_course_id_415c8b74_fk_CoPlat_course_No` (`course_id`),
  CONSTRAINT `CoPlat_resource_course_id_415c8b74_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `CoPlat_course` (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_resource`
--

LOCK TABLES `CoPlat_resource` WRITE;
/*!40000 ALTER TABLE `CoPlat_resource` DISABLE KEYS */;
INSERT INTO `CoPlat_resource` VALUES ('10','resource_10_handouts.pdf','Linear Algebra is beautiful!','Resource/resource_10_handouts.pdf','handouts','1');
/*!40000 ALTER TABLE `CoPlat_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_semester`
--

DROP TABLE IF EXISTS `CoPlat_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_semester` (
  `No` varchar(50) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Duration_Weeks` int(10) unsigned NOT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_semester`
--

LOCK TABLES `CoPlat_semester` WRITE;
/*!40000 ALTER TABLE `CoPlat_semester` DISABLE KEYS */;
INSERT INTO `CoPlat_semester` VALUES ('201601','2016-07-08','2016-07-14',1);
/*!40000 ALTER TABLE `CoPlat_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_student`
--

DROP TABLE IF EXISTS `CoPlat_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_student` (
  `Id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `CoPlat_student_user_id_eda5c0b1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_student`
--

LOCK TABLES `CoPlat_student` WRITE;
/*!40000 ALTER TABLE `CoPlat_student` DISABLE KEYS */;
INSERT INTO `CoPlat_student` VALUES ('s11110000',1);
/*!40000 ALTER TABLE `CoPlat_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_teacher`
--

DROP TABLE IF EXISTS `CoPlat_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_teacher` (
  `Id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `CoPlat_teacher_user_id_434db959_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_teacher`
--

LOCK TABLES `CoPlat_teacher` WRITE;
/*!40000 ALTER TABLE `CoPlat_teacher` DISABLE KEYS */;
INSERT INTO `CoPlat_teacher` VALUES ('t00001111',2);
/*!40000 ALTER TABLE `CoPlat_teacher` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add admin',7,'add_admin'),(20,'Can change admin',7,'change_admin'),(21,'Can delete admin',7,'delete_admin'),(22,'Can add teacher',8,'add_teacher'),(23,'Can change teacher',8,'change_teacher'),(24,'Can delete teacher',8,'delete_teacher'),(25,'Can add student',9,'add_student'),(26,'Can change student',9,'change_student'),(27,'Can delete student',9,'delete_student'),(28,'Can add semester',10,'add_semester'),(29,'Can change semester',10,'change_semester'),(30,'Can delete semester',10,'delete_semester'),(31,'Can add course',11,'add_course'),(32,'Can change course',11,'change_course'),(33,'Can delete course',11,'delete_course'),(34,'Can add coursework',12,'add_coursework'),(35,'Can change coursework',12,'change_coursework'),(36,'Can delete coursework',12,'delete_coursework'),(37,'Can add resource',13,'add_resource'),(38,'Can change resource',13,'change_resource'),(39,'Can delete resource',13,'delete_resource'),(40,'Can add enrollment',14,'add_enrollment'),(41,'Can change enrollment',14,'change_enrollment'),(42,'Can delete enrollment',14,'delete_enrollment'),(43,'Can add instruction',15,'add_instruction'),(44,'Can change instruction',15,'change_instruction'),(45,'Can delete instruction',15,'delete_instruction'),(46,'Can add assignment',16,'add_assignment'),(47,'Can change assignment',16,'change_assignment'),(48,'Can delete assignment',16,'delete_assignment');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$ZuHZVbeEbojl$RS8nmYwXqwwdwbh3BpQSj5olKG4SAhKQZ0JcwNoFW5I=',NULL,0,'s11110000','Claude','Chiang','',0,1,'2016-07-08 16:02:51.905778'),(2,'pbkdf2_sha256$24000$OqJS2i0eN2br$fm+jdM9FpvewKJaM9T0Ql8qJpv3KkPEF08O3rlrJrWs=',NULL,0,'t00001111','Albert','Einstein','',0,1,'2016-07-08 16:05:30.265869'),(3,'pbkdf2_sha256$24000$QyLIlg8Jksrk$iOQaIOQqrsyHttTLJ7BH5xyEyk8B5Xs8tJtnGfHcxgQ=',NULL,0,'a11111111','','','',0,1,'2016-07-08 16:11:53.996718');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'CoPlat','admin'),(16,'CoPlat','assignment'),(11,'CoPlat','course'),(12,'CoPlat','coursework'),(14,'CoPlat','enrollment'),(15,'CoPlat','instruction'),(13,'CoPlat','resource'),(10,'CoPlat','semester'),(9,'CoPlat','student'),(8,'CoPlat','teacher'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-08 16:00:38.790628'),(2,'auth','0001_initial','2016-07-08 16:00:39.114039'),(3,'CoPlat','0001_initial','2016-07-08 16:00:39.802516'),(4,'admin','0001_initial','2016-07-08 16:00:39.884380'),(5,'admin','0002_logentry_remove_auto_add','2016-07-08 16:00:39.908412'),(6,'contenttypes','0002_remove_content_type_name','2016-07-08 16:00:39.988648'),(7,'auth','0002_alter_permission_name_max_length','2016-07-08 16:00:40.029140'),(8,'auth','0003_alter_user_email_max_length','2016-07-08 16:00:40.068732'),(9,'auth','0004_alter_user_username_opts','2016-07-08 16:00:40.084474'),(10,'auth','0005_alter_user_last_login_null','2016-07-08 16:00:40.118813'),(11,'auth','0006_require_contenttypes_0002','2016-07-08 16:00:40.122251'),(12,'auth','0007_alter_validators_add_error_messages','2016-07-08 16:00:40.140810'),(13,'sessions','0001_initial','2016-07-08 16:00:40.163023');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
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

-- Dump completed on 2016-07-09 10:02:07
