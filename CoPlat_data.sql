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
INSERT INTO `CoPlat_admin` VALUES ('a11110000',5);
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
  `Score` int(11) DEFAULT NULL,
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
INSERT INTO `CoPlat_assignment` VALUES ('s11110000_1-2016-07-11_200310','s11110000_1-2016-07-11_200310.pdf','ahhhh','Coursework/s11110000_1-2016-07-11_200310.pdf',100,'well done!','1-2016-07-11_200310','s11110000'),('s11110000_1-2016-07-12_030441','s11110000_1-2016-07-12_030441.pdf','kkkkkkkk','Coursework/s11110000_1-2016-07-12_030441.pdf',100,'good','1-2016-07-12_030441','s11110000'),('s11110000_3_s11110000_3-2016-07-11_200907','3_s11110000_3-2016-07-11_200907.pdf','yeah, so we need to spend more time on it.','Coursework/3_s11110000_3-2016-07-11_200907.pdf',100,'very good!~','3-2016-07-11_200907','s11110000'),('s11110001_3_s11110000_3-2016-07-11_200907','3_s11110000_3-2016-07-11_200907.pdf','yeah, so we need to spend more time on it.','Coursework/3_s11110000_3-2016-07-11_200907.pdf',100,'very good!~','3-2016-07-11_200907','s11110001');
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
  `Team_Admittance` tinyint(1) NOT NULL,
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
INSERT INTO `CoPlat_course` VALUES ('1','Linear Algebra',3,'2016-03-01','2016-07-04',18,0,'1'),('2','Theory of Western Countries',2,'2016-03-01','2016-07-04',18,0,'1'),('3','Operating System',3,'2016-03-01','2016-07-04',18,1,'1'),('4','Software Engineering',2,'2016-03-01','2016-07-04',18,1,'1'),('5','System Analysis',2,'2016-03-01','2016-07-04',18,1,'1');
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
  `Title` varchar(200) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `Start_Time` datetime(6) NOT NULL,
  `End_Time` datetime(6) NOT NULL,
  `Is_Teamwork` tinyint(1) NOT NULL,
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
INSERT INTO `CoPlat_coursework` VALUES ('1-2016-07-11_163616','1st Coursework','This is the first coursework for Linear Algebra, including practicing operations on vectors and matrices.','2016-03-07 20:00:00.000000','2016-03-09 20:00:00.000000',0,'1'),('1-2016-07-11_200310','2nd Coursework','this coursework concerns about vector space.','2016-03-11 20:00:00.000000','2016-03-15 20:00:00.000000',0,'1'),('1-2016-07-12_030441','3nd coursework','...','2016-03-10 20:00:00.000000','2016-03-15 20:00:00.000000',0,'1'),('3-2016-07-11_200907','1st coursework for OS','fundamental concepts.','2016-03-20 20:00:00.000000','2016-03-30 20:00:00.000000',1,'3');
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
INSERT INTO `CoPlat_enrollment` VALUES ('s11110000_1','1','s11110000'),('s11110000_2','2','s11110000'),('s11110000_3','3','s11110000'),('s11110000_5','5','s11110000'),('s11110001_1','1','s11110001'),('s11110001_2','2','s11110001'),('s11110001_3','3','s11110001'),('s11110001_5','5','s11110001'),('s11110002_5','5','s11110002');
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
INSERT INTO `CoPlat_instruction` VALUES ('t11110000_1','1','t11110000'),('t11110000_3','3','t11110000'),('t11110000_5','5','t11110000'),('t11110001_2','2','t11110001'),('t11110001_3','3','t11110001'),('t11110001_4','4','t11110001'),('t11110001_5','5','t11110001');
/*!40000 ALTER TABLE `CoPlat_instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_membership`
--

DROP TABLE IF EXISTS `CoPlat_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_membership` (
  `No` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_membership_30a811f6` (`student_id`),
  KEY `CoPlat_membership_f6a7ca40` (`team_id`),
  CONSTRAINT `CoPlat_membership_student_id_a37b1d2a_fk_CoPlat_student_Id` FOREIGN KEY (`student_id`) REFERENCES `CoPlat_student` (`Id`),
  CONSTRAINT `CoPlat_membership_team_id_ffffe8e2_fk_CoPlat_team_id` FOREIGN KEY (`team_id`) REFERENCES `CoPlat_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_membership`
--

LOCK TABLES `CoPlat_membership` WRITE;
/*!40000 ALTER TABLE `CoPlat_membership` DISABLE KEYS */;
INSERT INTO `CoPlat_membership` VALUES ('3_s11110000_s11110000','s11110000',7),('3_s11110000_s11110001','s11110001',7),('3_s11110002_s11110002','s11110002',9),('4_s11110000_s11110000','s11110000',8),('5_s11110001_s11110000','s11110000',10),('5_s11110001_s11110001','s11110001',10),('5_s11110001_s11110002','s11110002',10);
/*!40000 ALTER TABLE `CoPlat_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_message`
--

DROP TABLE IF EXISTS `CoPlat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CoPlat_message_course_id_1ab9be0a_fk_CoPlat_course_No` (`course_id`),
  KEY `CoPlat_message_sender_id_745d942d_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `CoPlat_message_course_id_1ab9be0a_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `CoPlat_course` (`No`),
  CONSTRAINT `CoPlat_message_sender_id_745d942d_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_message`
--

LOCK TABLES `CoPlat_message` WRITE;
/*!40000 ALTER TABLE `CoPlat_message` DISABLE KEYS */;
INSERT INTO `CoPlat_message` VALUES (8,'Dear%20prof,%20I%20wanna%20ask%20about...','2016-07-11 20:13:30.400061','1',1),(9,'OK,%20balabala....','2016-07-11 20:14:04.829523','1',3),(10,'......','2016-07-12 03:15:46.463326','1',3);
/*!40000 ALTER TABLE `CoPlat_message` ENABLE KEYS */;
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
INSERT INTO `CoPlat_resource` VALUES ('10','resource_10_handouts.pdf','This is an intro to operations on vectors','Resource/resource_10_handouts.pdf','handouts','1'),('11','resource_11_vedio.mp4','Copy of online course','Resource/resource_11_vedio.mp4','vedio','1'),('12','resource_12_handouts.pdf','intro','Resource/resource_12_handouts.pdf','handouts','1');
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
INSERT INTO `CoPlat_semester` VALUES ('1','2016-09-01','2017-01-11',19);
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
INSERT INTO `CoPlat_student` VALUES ('s11110000',1),('s11110001',2),('s11110002',6),('s11110003',7);
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
INSERT INTO `CoPlat_teacher` VALUES ('t11110000',3),('t11110001',4);
/*!40000 ALTER TABLE `CoPlat_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_team`
--

DROP TABLE IF EXISTS `CoPlat_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `No` varchar(128) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Limit` int(11) NOT NULL,
  `Readily_Builded` tinyint(1) NOT NULL,
  `Admittance_Status` varchar(20) NOT NULL,
  `Leader_id` varchar(50) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CoPlat_team_4a4756c7` (`Leader_id`),
  KEY `CoPlat_team_ea134da7` (`course_id`),
  CONSTRAINT `CoPlat_team_Leader_id_7f72e559_fk_CoPlat_student_Id` FOREIGN KEY (`Leader_id`) REFERENCES `CoPlat_student` (`Id`),
  CONSTRAINT `CoPlat_team_course_id_462e9dd6_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `CoPlat_course` (`No`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_team`
--

LOCK TABLES `CoPlat_team` WRITE;
/*!40000 ALTER TABLE `CoPlat_team` DISABLE KEYS */;
INSERT INTO `CoPlat_team` VALUES (7,'3_s11110000','BigNews','Let\'s make big news!',2,10,1,'admitted','s11110001','3'),(8,'4_s11110000','不知道叫什么队','不可描述！',1,15,0,'waiting','s11110000','4'),(9,'3_s11110002','取个名字真难','写个描述也很难。',1,5,0,'waiting','s11110002','3'),(10,'5_s11110001','RunFast','Run like a Hong Kong Journalist.',3,10,1,'admitted','s11110001','5');
/*!40000 ALTER TABLE `CoPlat_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_team_application`
--

DROP TABLE IF EXISTS `CoPlat_team_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_team_application` (
  `No` varchar(50) NOT NULL,
  `Request_Info` varchar(2000) NOT NULL,
  `Response_Status` varchar(20) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_team_application_student_id_ef303784_fk_CoPlat_student_Id` (`student_id`),
  KEY `CoPlat_team_application_team_id_fc52a97c_fk_CoPlat_team_id` (`team_id`),
  CONSTRAINT `CoPlat_team_application_student_id_ef303784_fk_CoPlat_student_Id` FOREIGN KEY (`student_id`) REFERENCES `CoPlat_student` (`Id`),
  CONSTRAINT `CoPlat_team_application_team_id_fc52a97c_fk_CoPlat_team_id` FOREIGN KEY (`team_id`) REFERENCES `CoPlat_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_team_application`
--

LOCK TABLES `CoPlat_team_application` WRITE;
/*!40000 ALTER TABLE `CoPlat_team_application` DISABLE KEYS */;
INSERT INTO `CoPlat_team_application` VALUES ('app_3_s11110000_s11110001','','admitted','s11110001',7),('app_3_s11110002_s11110003','','waiting','s11110003',9),('app_4_s11110000_s11110001','','waiting','s11110001',8),('app_4_s11110000_s11110003','','waiting','s11110003',8),('app_5_s11110001_s11110000','','admitted','s11110000',10),('app_5_s11110001_s11110002','','admitted','s11110002',10);
/*!40000 ALTER TABLE `CoPlat_team_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_team_assignment`
--

DROP TABLE IF EXISTS `CoPlat_team_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_team_assignment` (
  `No` varchar(50) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Content` varchar(2000) NOT NULL,
  `Attachment` varchar(100) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `Comment` varchar(2000) NOT NULL,
  `coursework_id` varchar(50) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_team_assig_coursework_id_1de11824_fk_CoPlat_coursework_No` (`coursework_id`),
  KEY `CoPlat_team_assignment_team_id_b99fa627_fk_CoPlat_team_id` (`team_id`),
  CONSTRAINT `CoPlat_team_assig_coursework_id_1de11824_fk_CoPlat_coursework_No` FOREIGN KEY (`coursework_id`) REFERENCES `CoPlat_coursework` (`No`),
  CONSTRAINT `CoPlat_team_assignment_team_id_b99fa627_fk_CoPlat_team_id` FOREIGN KEY (`team_id`) REFERENCES `CoPlat_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_team_assignment`
--

LOCK TABLES `CoPlat_team_assignment` WRITE;
/*!40000 ALTER TABLE `CoPlat_team_assignment` DISABLE KEYS */;
INSERT INTO `CoPlat_team_assignment` VALUES ('3_s11110000_3-2016-07-11_200907','3_s11110000_3-2016-07-11_200907.pdf','yeah, so we need to spend more time on it.','Coursework/3_s11110000_3-2016-07-11_200907.pdf',100,'very good!~','3-2016-07-11_200907',7);
/*!40000 ALTER TABLE `CoPlat_team_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoPlat_team_enrollment`
--

DROP TABLE IF EXISTS `CoPlat_team_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CoPlat_team_enrollment` (
  `No` varchar(50) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_team_enrollment_course_id_647f6ee1_fk_CoPlat_course_No` (`course_id`),
  KEY `CoPlat_team_enrollment_team_id_1bb93359_fk_CoPlat_team_id` (`team_id`),
  CONSTRAINT `CoPlat_team_enrollment_course_id_647f6ee1_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `CoPlat_course` (`No`),
  CONSTRAINT `CoPlat_team_enrollment_team_id_1bb93359_fk_CoPlat_team_id` FOREIGN KEY (`team_id`) REFERENCES `CoPlat_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoPlat_team_enrollment`
--

LOCK TABLES `CoPlat_team_enrollment` WRITE;
/*!40000 ALTER TABLE `CoPlat_team_enrollment` DISABLE KEYS */;
INSERT INTO `CoPlat_team_enrollment` VALUES ('3_3_s11110000','3',7),('5_5_s11110001','5',10);
/*!40000 ALTER TABLE `CoPlat_team_enrollment` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add admin',7,'add_admin'),(20,'Can change admin',7,'change_admin'),(21,'Can delete admin',7,'delete_admin'),(22,'Can add teacher',8,'add_teacher'),(23,'Can change teacher',8,'change_teacher'),(24,'Can delete teacher',8,'delete_teacher'),(25,'Can add student',9,'add_student'),(26,'Can change student',9,'change_student'),(27,'Can delete student',9,'delete_student'),(28,'Can add semester',10,'add_semester'),(29,'Can change semester',10,'change_semester'),(30,'Can delete semester',10,'delete_semester'),(31,'Can add course',11,'add_course'),(32,'Can change course',11,'change_course'),(33,'Can delete course',11,'delete_course'),(34,'Can add team',12,'add_team'),(35,'Can change team',12,'change_team'),(36,'Can delete team',12,'delete_team'),(37,'Can add coursework',13,'add_coursework'),(38,'Can change coursework',13,'change_coursework'),(39,'Can delete coursework',13,'delete_coursework'),(40,'Can add resource',14,'add_resource'),(41,'Can change resource',14,'change_resource'),(42,'Can delete resource',14,'delete_resource'),(43,'Can add enrollment',15,'add_enrollment'),(44,'Can change enrollment',15,'change_enrollment'),(45,'Can delete enrollment',15,'delete_enrollment'),(46,'Can add team_ enrollment',16,'add_team_enrollment'),(47,'Can change team_ enrollment',16,'change_team_enrollment'),(48,'Can delete team_ enrollment',16,'delete_team_enrollment'),(49,'Can add instruction',17,'add_instruction'),(50,'Can change instruction',17,'change_instruction'),(51,'Can delete instruction',17,'delete_instruction'),(52,'Can add membership',18,'add_membership'),(53,'Can change membership',18,'change_membership'),(54,'Can delete membership',18,'delete_membership'),(55,'Can add assignment',19,'add_assignment'),(56,'Can change assignment',19,'change_assignment'),(57,'Can delete assignment',19,'delete_assignment'),(58,'Can add team_ assignment',20,'add_team_assignment'),(59,'Can change team_ assignment',20,'change_team_assignment'),(60,'Can delete team_ assignment',20,'delete_team_assignment'),(61,'Can add team_ application',21,'add_team_application'),(62,'Can change team_ application',21,'change_team_application'),(63,'Can delete team_ application',21,'delete_team_application'),(64,'Can add message',22,'add_message'),(65,'Can change message',22,'change_message'),(66,'Can delete message',22,'delete_message');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$z14p2pL5OYEr$JQ/WVDs40S2/iEfJXfrD0aqyZbKb+gT6wWn2TAT7xAk=',NULL,0,'s11110000','Claude','Chiang','',0,1,'2016-07-11 16:07:28.712768'),(2,'pbkdf2_sha256$24000$2evW7RjegOTB$uwf+Th3P5bIkPAOS7lZDvWbMuWpw8BhdjBrZ4TP/7QE=',NULL,0,'s11110001','Sharon','Chueng','',0,1,'2016-07-11 16:11:28.241739'),(3,'pbkdf2_sha256$24000$eW0WDwmnqoUt$MVja8w2PZ0S0PNtNTvB61zHr95cJch7b/cI0mOLsTdk=',NULL,0,'t11110000','Albert','Einstein','',0,1,'2016-07-11 16:12:56.869500'),(4,'pbkdf2_sha256$24000$8dITIifvyTYO$WWSa/ND2I97ma7q08NlN4TU+5DSubcSK7BG0KTbt5iE=',NULL,0,'t11110001','Mike','Wallace','',0,1,'2016-07-11 16:14:34.345504'),(5,'pbkdf2_sha256$24000$xeU2vBcy3uOD$OGDa8e8gbDUeYzlsqEnwgWvKDVPq8Npx5QFsjP7KSuk=',NULL,0,'a11110000','Big','Brother','',0,1,'2016-07-11 16:16:09.384604'),(6,'pbkdf2_sha256$24000$mcOXct3An4V9$HdhOsTk+Nyvjj18iQX8iVlrT/t3G3+EihyVOi4lRbSw=',NULL,0,'s11110002','Kobe','Bryant','',0,1,'2016-07-12 01:43:48.798061'),(7,'pbkdf2_sha256$24000$Sc6O4ECJgNJo$I1zL+/w4RvDO3KnKYpaE1DAe45foozXEPk7uWdiTNE4=',NULL,0,'s11110003','The','Man','',0,1,'2016-07-12 01:44:45.289618');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'CoPlat','admin'),(19,'CoPlat','assignment'),(11,'CoPlat','course'),(13,'CoPlat','coursework'),(15,'CoPlat','enrollment'),(17,'CoPlat','instruction'),(18,'CoPlat','membership'),(22,'CoPlat','message'),(14,'CoPlat','resource'),(10,'CoPlat','semester'),(9,'CoPlat','student'),(8,'CoPlat','teacher'),(12,'CoPlat','team'),(21,'CoPlat','team_application'),(20,'CoPlat','team_assignment'),(16,'CoPlat','team_enrollment'),(6,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-11 16:05:46.650831'),(2,'auth','0001_initial','2016-07-11 16:05:46.964609'),(3,'CoPlat','0001_initial','2016-07-11 16:05:48.363953'),(4,'admin','0001_initial','2016-07-11 16:05:48.455491'),(5,'admin','0002_logentry_remove_auto_add','2016-07-11 16:05:48.482051'),(6,'contenttypes','0002_remove_content_type_name','2016-07-11 16:05:48.575249'),(7,'auth','0002_alter_permission_name_max_length','2016-07-11 16:05:48.625069'),(8,'auth','0003_alter_user_email_max_length','2016-07-11 16:05:48.671452'),(9,'auth','0004_alter_user_username_opts','2016-07-11 16:05:48.691629'),(10,'auth','0005_alter_user_last_login_null','2016-07-11 16:05:48.730943'),(11,'auth','0006_require_contenttypes_0002','2016-07-11 16:05:48.734327'),(12,'auth','0007_alter_validators_add_error_messages','2016-07-11 16:05:48.755311'),(13,'sessions','0001_initial','2016-07-11 16:05:48.778728');
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

-- Dump completed on 2016-07-12 12:42:16
