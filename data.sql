-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.17 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 coplat 的数据库结构
CREATE DATABASE IF NOT EXISTS `coplat` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `coplat`;


-- 导出  表 coplat.auth_group 结构
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.auth_group 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


-- 导出  表 coplat.django_content_type 结构
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.django_content_type 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'CoPlat', 'admin'),
	(16, 'CoPlat', 'assignment'),
	(11, 'CoPlat', 'course'),
	(12, 'CoPlat', 'coursework'),
	(14, 'CoPlat', 'enrollment'),
	(15, 'CoPlat', 'instruction'),
	(13, 'CoPlat', 'resource'),
	(10, 'CoPlat', 'semester'),
	(9, 'CoPlat', 'student'),
	(8, 'CoPlat', 'teacher'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


-- 导出  表 coplat.auth_permission 结构
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.auth_permission 的数据：~48 rows (大约)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add admin', 7, 'add_admin'),
	(20, 'Can change admin', 7, 'change_admin'),
	(21, 'Can delete admin', 7, 'delete_admin'),
	(22, 'Can add teacher', 8, 'add_teacher'),
	(23, 'Can change teacher', 8, 'change_teacher'),
	(24, 'Can delete teacher', 8, 'delete_teacher'),
	(25, 'Can add student', 9, 'add_student'),
	(26, 'Can change student', 9, 'change_student'),
	(27, 'Can delete student', 9, 'delete_student'),
	(28, 'Can add semester', 10, 'add_semester'),
	(29, 'Can change semester', 10, 'change_semester'),
	(30, 'Can delete semester', 10, 'delete_semester'),
	(31, 'Can add course', 11, 'add_course'),
	(32, 'Can change course', 11, 'change_course'),
	(33, 'Can delete course', 11, 'delete_course'),
	(34, 'Can add coursework', 12, 'add_coursework'),
	(35, 'Can change coursework', 12, 'change_coursework'),
	(36, 'Can delete coursework', 12, 'delete_coursework'),
	(37, 'Can add resource', 13, 'add_resource'),
	(38, 'Can change resource', 13, 'change_resource'),
	(39, 'Can delete resource', 13, 'delete_resource'),
	(40, 'Can add enrollment', 14, 'add_enrollment'),
	(41, 'Can change enrollment', 14, 'change_enrollment'),
	(42, 'Can delete enrollment', 14, 'delete_enrollment'),
	(43, 'Can add instruction', 15, 'add_instruction'),
	(44, 'Can change instruction', 15, 'change_instruction'),
	(45, 'Can delete instruction', 15, 'delete_instruction'),
	(46, 'Can add assignment', 16, 'add_assignment'),
	(47, 'Can change assignment', 16, 'change_assignment'),
	(48, 'Can delete assignment', 16, 'delete_assignment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- 导出  表 coplat.auth_group_permissions 结构
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.auth_group_permissions 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;



-- 导出  表 coplat.auth_user 结构
CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 正在导出表  coplat.auth_user 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$24000$hvjX8R1I2ZZy$WbKewDj6/v4M+CR8LiyMiAfrdHXn17/OhzZAsImVcvQ=', NULL, 0, '13210001', '马', '林', '', 0, 1, '2016-07-05 07:09:14.695260'),
	(2, 'pbkdf2_sha256$24000$k8AKpm2v9xCZ$ekJe2I+fiMH2jbqbKY14P4GBI9rUc9diWkaQygT0XdE=', NULL, 0, '13211045', '刘', '林', '', 0, 1, '2016-07-05 11:11:47.626358'),
	(3, 'pbkdf2_sha256$24000$OwxSNrJj2guC$fJ06l9OduZHhCotO5qvzDcYPwjQrvEk1Twk+Gh3WP8A=', NULL, 0, '11110000', '康', '康', '', 0, 1, '2016-07-08 07:57:25.898198'),
	(4, 'pbkdf2_sha256$24000$zgJDv9yEWdHn$OGONmWQnxytUXBSo1a/jcTkho2hg4M4FaI5G+vQY17w=', NULL, 0, '13210002', '宋', '军', '', 0, 1, '2016-07-08 08:14:58.011226'),
	(5, 'pbkdf2_sha256$24000$rdvHgh1Fp4hx$rNXlR+qqqOtlMnwVOLBRwLfhsO/SiwGgGgIzJiAosog=', NULL, 0, '13210003', '乔', '凤', '', 0, 1, '2016-07-08 08:16:13.398348'),
	(6, 'pbkdf2_sha256$24000$E1z1ZZWkh9hD$JM3Ko6PaBhKreOJfhdGX+WksI5DgxurkuTeD6wxz1ng=', NULL, 0, '13211046', '张', '行', '', 0, 1, '2016-07-08 08:19:03.167400'),
	(7, 'pbkdf2_sha256$24000$bsyfvBMC4Lyq$/y1qqdHo349cEleL/MBZ1Z7uDmt9EXtwqzsoXboSKuc=', NULL, 0, '13211047', '陈', '博', '', 0, 1, '2016-07-08 08:19:58.009892'),
	(8, 'pbkdf2_sha256$24000$0fLjA2PUi22z$2nopjMA1ZWAOdR+poS+3xrrQy88ONsVxlXJaxf/tj8c=', NULL, 0, '13211048', '朱', '晓', '', 0, 1, '2016-07-08 08:20:28.400831'),
	(9, 'pbkdf2_sha256$24000$lKhFsQMRUgvi$GQJq3T5ImdlqeAWMPNtUMp4hZfoaQQkcyFOvw1HtEDw=', NULL, 0, '13211049', '田', '甜', '', 0, 1, '2016-07-08 08:21:00.024480');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


-- 导出  表 coplat.auth_user_groups 结构
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.auth_user_groups 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


-- 导出  表 coplat.auth_user_user_permissions 结构
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.auth_user_user_permissions 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


-- 导出  表 coplat.coplat_admin 结构
CREATE TABLE IF NOT EXISTS `coplat_admin` (
  `Id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `CoPlat_admin_user_id_49b12f7f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.coplat_admin 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `coplat_admin` DISABLE KEYS */;
INSERT INTO `coplat_admin` (`Id`, `user_id`) VALUES
	('11110000', 3);
/*!40000 ALTER TABLE `coplat_admin` ENABLE KEYS */;


-- 导出  表 coplat.coplat_assignment 结构
CREATE TABLE IF NOT EXISTS `coplat_assignment` (
  `id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Content` varchar(2000) NOT NULL,
  `Attachment` varchar(100) CHARACTER SET latin1 NOT NULL,
  `Score` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Comment` varchar(2000) NOT NULL,
  `Coursework_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Student_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CoPlat_assignment_7192b979` (`Coursework_id`),
  KEY `CoPlat_assignment_c507597f` (`Student_id`),
  CONSTRAINT `CoPlat_assignment_Coursework_id_8cc63a6f_fk_CoPlat_coursework_No` FOREIGN KEY (`Coursework_id`) REFERENCES `coplat_coursework` (`No`),
  CONSTRAINT `CoPlat_assignment_Student_id_8470f456_fk_CoPlat_student_Id` FOREIGN KEY (`Student_id`) REFERENCES `coplat_student` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  coplat.coplat_assignment 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `coplat_assignment` DISABLE KEYS */;
INSERT INTO `coplat_assignment` (`id`, `Content`, `Attachment`, `Score`, `Comment`, `Coursework_id`, `Student_id`) VALUES
	('', '', '', '', '', '03', '13211045'),
	('001', '作业内容', '', '90', '写得好', '05', '13211045'),
	('002', '', '', '', '', '07', '13211046'),
	('003', '', '', '', '', '09', '13211047'),
	('004', '作业内容', '', '', '', '07', '13211045'),
	('005', '', '', '', '', '02', '13211045'),
	('006', '', '', '', '', '10', '13211045'),
	('007', '', '', '', '', '09', '13211045'),
	('008', '', '', '', '', '08', '13211045'),
	('009', '', '', '', '', '06', '13211045'),
	('010', '', '', '', '', '01', '13211045'),
	('011', '', '', '', '', '11', '13211045');
/*!40000 ALTER TABLE `coplat_assignment` ENABLE KEYS */;


-- 导出  表 coplat.coplat_course 结构
CREATE TABLE IF NOT EXISTS `coplat_course` (
  `No` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Title` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Credit` char(50) CHARACTER SET latin1 NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Duration` char(50) CHARACTER SET latin1 NOT NULL,
  `semester_id` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  coplat.coplat_course 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `coplat_course` DISABLE KEYS */;
INSERT INTO `coplat_course` (`No`, `Title`, `Credit`, `Start_Date`, `End_Date`, `Duration`, `semester_id`) VALUES
	('0001', 'math', '4', '2016-03-01', '2016-06-28', '17', '1'),
	('0002', 'java', '3', '2016-03-01', '2016-06-21', '16', '1'),
	('0003', 'english', '3', '2016-03-01', '2016-06-23', '17', '1'),
	('0004', 'chinese', '2', '2016-03-01', '2016-06-15', '15', '1'),
	('0005', 'c++', '2', '2016-03-01', '2016-07-01', '18', '1'),
	('0006', 'c#', '2', '2016-03-01', '2016-06-16', '15', '1');
/*!40000 ALTER TABLE `coplat_course` ENABLE KEYS */;


-- 导出  表 coplat.coplat_coursework 结构
CREATE TABLE IF NOT EXISTS `coplat_coursework` (
  `No` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `Start_Time` datetime(6) NOT NULL,
  `End_Time` datetime(6) NOT NULL,
  `course_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_coursework_ea134da7` (`course_id`),
  CONSTRAINT `CoPlat_coursework_course_id_33ab9fa1_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `coplat_course` (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  coplat.coplat_coursework 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `coplat_coursework` DISABLE KEYS */;
INSERT INTO `coplat_coursework` (`No`, `Description`, `Start_Time`, `End_Time`, `course_id`) VALUES
	('01', '第四章微分方程习题', '2016-03-01 16:00:00.000000', '2016-03-02 16:00:00.000000', '0001'),
	('02', '第三章级数习题', '2016-03-02 16:00:00.000000', '2016-03-03 16:00:00.000000', '0001'),
	('03', '第二章java基础语法习题', '2016-03-02 12:00:00.000000', '2016-03-04 12:00:00.000000', '0002'),
	('04', '第三章java面向对象习题', '2016-03-02 14:00:00.000000', '2016-03-05 14:00:00.000000', '0002'),
	('05', '作文1', '2016-03-03 12:00:00.000000', '2016-03-05 12:00:00.000000', '0003'),
	('06', '第五章多重积分', '2016-03-03 00:00:00.000000', '2016-03-05 00:00:00.000000', '0001'),
	('07', '作文2', '2016-03-06 00:00:00.000000', '2016-03-08 00:00:00.000000', '0003'),
	('08', '现代文阅读', '2016-03-03 00:00:00.000000', '2016-03-06 00:00:00.000000', '0004'),
	('09', '文言文阅读', '2016-03-09 00:00:00.000000', '2016-03-11 00:00:00.000000', '0004'),
	('10', '学生类实现', '2016-03-06 00:00:00.000000', '2016-03-08 00:00:00.000000', '0005'),
	('11', '老师类实现', '2016-03-08 10:00:00.000000', '2016-03-11 00:00:00.000000', '0005'),
	('12', '正则表达式', '2016-03-07 00:00:00.000000', '2016-03-08 00:00:00.000000', '0006'),
	('13', '利用VS实现一个简单应用', '2016-03-09 00:00:00.000000', '2016-03-15 00:00:00.000000', '0006');
/*!40000 ALTER TABLE `coplat_coursework` ENABLE KEYS */;


-- 导出  表 coplat.coplat_enrollment 结构
CREATE TABLE IF NOT EXISTS `coplat_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CoPlat_enrollment_course_id_85eecb18_fk_CoPlat_course_No` (`course_id`),
  KEY `CoPlat_enrollment_30a811f6` (`student_id`),
  CONSTRAINT `CoPlat_enrollment_course_id_85eecb18_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `coplat_course` (`No`),
  CONSTRAINT `CoPlat_enrollment_student_id_7573449a_fk_CoPlat_student_Id` FOREIGN KEY (`student_id`) REFERENCES `coplat_student` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.coplat_enrollment 的数据：~25 rows (大约)
/*!40000 ALTER TABLE `coplat_enrollment` DISABLE KEYS */;
INSERT INTO `coplat_enrollment` (`id`, `course_id`, `student_id`) VALUES
	(4, '0004', '13211045'),
	(6, '0003', '13211045'),
	(9, '0001', '13211045'),
	(11, '0005', '13211045'),
	(12, '0004', '13211046'),
	(13, '0003', '13211046'),
	(14, '0001', '13211046'),
	(15, '0006', '13211046'),
	(16, '0004', '13211047'),
	(17, '0003', '13211047'),
	(18, '0001', '13211047'),
	(19, '0002', '13211047'),
	(20, '0004', '13211048'),
	(21, '0003', '13211048'),
	(22, '0001', '13211048'),
	(23, '0006', '13211048'),
	(24, '0005', '13211048'),
	(25, '0004', '13211049'),
	(26, '0003', '13211049'),
	(27, '0001', '13211049'),
	(28, '0005', '13211049'),
	(29, '0001', '13211047'),
	(30, '0006', '13211046'),
	(31, '0002', '13211045'),
	(32, '0005', '13211047');
/*!40000 ALTER TABLE `coplat_enrollment` ENABLE KEYS */;


-- 导出  表 coplat.coplat_instruction 结构
CREATE TABLE IF NOT EXISTS `coplat_instruction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Course_id` varchar(50) NOT NULL,
  `Teacher_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CoPlat_instruction_Course_id_7e8fd81e_fk_CoPlat_course_No` (`Course_id`),
  KEY `CoPlat_instruction_ef6bc121` (`Teacher_id`),
  CONSTRAINT `CoPlat_instruction_Course_id_7e8fd81e_fk_CoPlat_course_No` FOREIGN KEY (`Course_id`) REFERENCES `coplat_course` (`No`),
  CONSTRAINT `CoPlat_instruction_Teacher_id_21d58fe8_fk_CoPlat_teacher_Id` FOREIGN KEY (`Teacher_id`) REFERENCES `coplat_teacher` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.coplat_instruction 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `coplat_instruction` DISABLE KEYS */;
INSERT INTO `coplat_instruction` (`id`, `Course_id`, `Teacher_id`) VALUES
	(7, '0003', '13210002'),
	(9, '0002', '13210001'),
	(10, '0004', '13210002'),
	(15, '0006', '13210001'),
	(17, '0005', '13210001'),
	(19, '0001', '13210002');
/*!40000 ALTER TABLE `coplat_instruction` ENABLE KEYS */;


-- 导出  表 coplat.coplat_resource 结构
CREATE TABLE IF NOT EXISTS `coplat_resource` (
  `No` varchar(50) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  `Attachment` varchar(100) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  PRIMARY KEY (`No`),
  KEY `CoPlat_resource_course_id_415c8b74_fk_CoPlat_course_No` (`course_id`),
  CONSTRAINT `CoPlat_resource_course_id_415c8b74_fk_CoPlat_course_No` FOREIGN KEY (`course_id`) REFERENCES `coplat_course` (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.coplat_resource 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `coplat_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `coplat_resource` ENABLE KEYS */;


-- 导出  表 coplat.coplat_semester 结构
CREATE TABLE IF NOT EXISTS `coplat_semester` (
  `No` varchar(50) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Duration_Weeks` int(11) NOT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.coplat_semester 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `coplat_semester` DISABLE KEYS */;
INSERT INTO `coplat_semester` (`No`, `Start_Date`, `End_Date`, `Duration_Weeks`) VALUES
	('1', '2016-03-01', '2016-07-01', 18);
/*!40000 ALTER TABLE `coplat_semester` ENABLE KEYS */;


-- 导出  表 coplat.coplat_student 结构
CREATE TABLE IF NOT EXISTS `coplat_student` (
  `Id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `CoPlat_student_user_id_eda5c0b1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.coplat_student 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `coplat_student` DISABLE KEYS */;
INSERT INTO `coplat_student` (`Id`, `user_id`) VALUES
	('13211045', 2),
	('13211046', 6),
	('13211047', 7),
	('13211048', 8),
	('13211049', 9);
/*!40000 ALTER TABLE `coplat_student` ENABLE KEYS */;


-- 导出  表 coplat.coplat_teacher 结构
CREATE TABLE IF NOT EXISTS `coplat_teacher` (
  `Id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `CoPlat_teacher_user_id_434db959_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.coplat_teacher 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `coplat_teacher` DISABLE KEYS */;
INSERT INTO `coplat_teacher` (`Id`, `user_id`) VALUES
	('13210001', 1),
	('13210002', 4),
	('13210003', 5);
/*!40000 ALTER TABLE `coplat_teacher` ENABLE KEYS */;


-- 导出  表 coplat.django_admin_log 结构
CREATE TABLE IF NOT EXISTS `django_admin_log` (
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.django_admin_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;




-- 导出  表 coplat.django_migrations 结构
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.django_migrations 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2016-07-05 03:16:14.205590'),
	(2, 'auth', '0001_initial', '2016-07-05 03:16:19.983052'),
	(3, 'CoPlat', '0001_initial', '2016-07-05 03:16:31.286855'),
	(4, 'CoPlat', '0002_auto_20160704_1530', '2016-07-05 03:16:31.344895'),
	(5, 'admin', '0001_initial', '2016-07-05 03:16:32.628663'),
	(6, 'admin', '0002_logentry_remove_auto_add', '2016-07-05 03:16:32.750750'),
	(7, 'contenttypes', '0002_remove_content_type_name', '2016-07-05 03:16:33.688343'),
	(8, 'auth', '0002_alter_permission_name_max_length', '2016-07-05 03:16:34.364851'),
	(9, 'auth', '0003_alter_user_email_max_length', '2016-07-05 03:16:34.932063'),
	(10, 'auth', '0004_alter_user_username_opts', '2016-07-05 03:16:35.007226'),
	(11, 'auth', '0005_alter_user_last_login_null', '2016-07-05 03:16:35.394685'),
	(12, 'auth', '0006_require_contenttypes_0002', '2016-07-05 03:16:35.419704'),
	(13, 'auth', '0007_alter_validators_add_error_messages', '2016-07-05 03:16:35.460735'),
	(14, 'sessions', '0001_initial', '2016-07-05 03:16:35.838349');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;


-- 导出  表 coplat.django_session 结构
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  coplat.django_session 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
