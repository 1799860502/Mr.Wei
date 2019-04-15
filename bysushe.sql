/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.60 : Database - bysushe
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bysushe` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bysushe`;

/*Table structure for table `building` */

DROP TABLE IF EXISTS `building`;

CREATE TABLE `building` (
  `building_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '宿舍楼ID',
  `building_name` varchar(20) NOT NULL COMMENT '宿舍楼号',
  `building_introduction` varchar(200) DEFAULT NULL COMMENT '宿舍楼信息',
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='宿舍楼表';

/*Data for the table `building` */

insert  into `building`(`building_id`,`building_name`,`building_introduction`) values (2,'A2','123123123'),(3,'A3','123123'),(5,'A4','啦啦啦');

/*Table structure for table `dormitory` */

DROP TABLE IF EXISTS `dormitory`;

CREATE TABLE `dormitory` (
  `dormitory_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '宿舍id',
  `dormitory_name` varchar(20) NOT NULL COMMENT ' 宿舍名',
  `dormitory_introduction` varchar(200) NOT NULL COMMENT ' 宿舍信息',
  `dormitory_building_id` int(20) NOT NULL COMMENT ' 宿舍所属宿舍楼id',
  `dormitory_type` varchar(20) NOT NULL COMMENT ' 宿舍类型（1男  2女）',
  PRIMARY KEY (`dormitory_id`),
  KEY `FK_dormitory` (`dormitory_building_id`),
  CONSTRAINT `FK_dormitory` FOREIGN KEY (`dormitory_building_id`) REFERENCES `building` (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='宿舍表';

/*Data for the table `dormitory` */

insert  into `dormitory`(`dormitory_id`,`dormitory_name`,`dormitory_introduction`,`dormitory_building_id`,`dormitory_type`) values (1,'A2-406','太平间1',2,'男宿舍'),(2,'A3-405','懒人支部',3,'女宿舍'),(5,'A4-555','全集',5,'男宿舍');

/*Table structure for table `loginfo` */

DROP TABLE IF EXISTS `loginfo`;

CREATE TABLE `loginfo` (
  `log_id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `log_student_id` int(20) NOT NULL COMMENT '用户id',
  `log_type` varchar(20) NOT NULL COMMENT '类型 入住  未入住  迁出  交钱',
  `log_building_id` int(20) NOT NULL COMMENT '宿舍楼id',
  `log_dormitory` int(20) NOT NULL COMMENT '宿舍id',
  `log_date` datetime DEFAULT NULL COMMENT '日期',
  `log_content` varchar(255) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='信息表';

/*Data for the table `loginfo` */

insert  into `loginfo`(`log_id`,`log_student_id`,`log_type`,`log_building_id`,`log_dormitory`,`log_date`,`log_content`) values (1,1,'入住',1,1,'2017-07-07 00:00:00',NULL);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(20) NOT NULL COMMENT '姓名',
  `role_tel` varchar(20) NOT NULL COMMENT '电话',
  `role_sex` char(20) NOT NULL COMMENT '性别   男  女',
  `role_rank` varchar(20) NOT NULL COMMENT '身份  系统管理员  宿舍管理员  班主任',
  `role_password` varchar(255) NOT NULL COMMENT '密码',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='人员表（不包括学生）';

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`,`role_tel`,`role_sex`,`role_rank`,`role_password`) values (1,'卫文龙','18595800704','男','系统管理员','123456'),(2,'李俊超','13456797815','男','学生','123456'),(3,'毕星海','32131112311','男','宿舍管理员','123456'),(4,'张亚湘','12654496485','男','宿舍长','123456'),(5,'张小雷','13456418815','男','宿舍管理员','123456'),(6,'weqwe','111111','男','楼宇管理员','123456'),(10,'李俊超','111111','男','楼宇管理员','123456'),(11,'卫文龙','111111','男','楼宇管理员','123'),(12,'卫文龙','123','男','楼宇管理员','');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` int(20) NOT NULL AUTO_INCREMENT COMMENT ' 学生id',
  `student_name` varchar(255) NOT NULL COMMENT ' 学生姓名',
  `student_tel` varchar(255) NOT NULL COMMENT ' 学生电话',
  `student_sex` varchar(2) NOT NULL COMMENT ' 学生性别',
  `student_password` varchar(255) NOT NULL COMMENT ' 学生密码',
  `student_state` varchar(255) DEFAULT NULL COMMENT ' 学生状态 入住 未入住  迁出 欠费',
  `student_circs` int(20) DEFAULT NULL COMMENT ' 学生缴费时长 1,2,3个月',
  `student_time` date DEFAULT NULL COMMENT ' 学生缴费时间',
  `student_dormitory_id` int(20) DEFAULT NULL COMMENT ' 学生所在宿舍',
  `student_building_id` int(20) DEFAULT NULL COMMENT '学生所在宿舍楼',
  PRIMARY KEY (`student_id`),
  KEY `FK_student` (`student_dormitory_id`),
  CONSTRAINT `FK_student` FOREIGN KEY (`student_dormitory_id`) REFERENCES `dormitory` (`dormitory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='学生表';

/*Data for the table `student` */

insert  into `student`(`student_id`,`student_name`,`student_tel`,`student_sex`,`student_password`,`student_state`,`student_circs`,`student_time`,`student_dormitory_id`,`student_building_id`) values (1,'卫文龙','18595800705','男','','入住',27,'2019-01-08',1,NULL),(5,'卫文龙11','18595800706','男','','入住',10,'2017-01-01',2,NULL),(13,'网我','1231212332','男','123','迁出',1,'2018-12-28',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
