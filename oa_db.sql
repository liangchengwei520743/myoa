/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.6.21 : Database - activitileavedb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`activitileavedb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `activitileavedb`;

/*Table structure for table `baoxiaobill` */

DROP TABLE IF EXISTS `baoxiaobill`;

CREATE TABLE `baoxiaobill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(8,2) NOT NULL,
  `title` varchar(200) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `creatdate` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `baoxiaobill` */

insert  into `baoxiaobill`(`id`,`money`,`title`,`remark`,`creatdate`,`state`,`user_id`) values (1,'3000.00','test01','出差广州开会','2019-03-11 21:32:46',2,5),(2,'4000.00','test02','出差北京开会','2019-03-11 23:26:10',2,5),(3,'6000.00','test03','送礼上级领导','2019-03-11 23:49:05',2,5),(4,'7000.00','test04','请客户吃饭','2019-03-12 00:26:49',2,5),(5,'6000.00','test05','送礼','2019-03-12 09:21:12',2,5),(6,'7000.00','test06','出差北京','2019-03-12 20:09:00',2,5),(7,'8888.00','test07','去出差广州','2019-03-14 11:08:26',1,5),(8,'3000.00','test07','出差','2019-03-18 13:55:33',2,5),(9,'8000.00','test08','去广州开会','2019-03-18 14:08:36',1,5);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` int(2) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  KEY `FK4722E6AEC8CB2A1E` (`manager_id`),
  CONSTRAINT `FK4722E6AEC8CB2A1E` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`password`,`email`,`role`,`manager_id`,`salt`) values (1,'danny','8914684fb7da95dc7b8f6afa3f88fe67','wangzhongjun@163.com',4,1,'eteokues'),(2,'jack','8914684fb7da95dc7b8f6afa3f88fe67','fengxiaogangManager@163.com',2,1,'eteokues'),(3,'mike','8914684fb7da95dc7b8f6afa3f88fe67','fanbingbingManager@163.com',2,1,'eteokues'),(4,'chen','8914684fb7da95dc7b8f6afa3f88fe67','fengxiaogang@163.com',1,2,'eteokues'),(5,'zhang','8914684fb7da95dc7b8f6afa3f88fe67','fanbingbing@163.com',1,3,'eteokues'),(6,'li','8914684fb7da95dc7b8f6afa3f88fe67','li@qq.com',1,1,'eteokues');

/*Table structure for table `leavebill` */

DROP TABLE IF EXISTS `leavebill`;

CREATE TABLE `leavebill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `days` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK62FCB35E2B4D7140` (`user_id`),
  CONSTRAINT `FK62FCB35E2B4D7140` FOREIGN KEY (`user_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `leavebill` */

insert  into `leavebill`(`id`,`days`,`content`,`remark`,`leaveDate`,`state`,`user_id`) values (10,5,'旅游','休年假','2018-03-21 08:26:55',1,5),(14,7,'病假','调休','2018-05-17 08:46:25',1,5),(15,1,'事假','外出办事','2018-06-27 08:39:58',2,5),(16,15,'旅游','休年假','2018-06-27 09:02:17',1,5),(17,15,'年假','去旅游','2018-11-08 14:30:46',1,5),(18,20,'年假','回家结婚','2018-11-12 14:57:25',2,5),(19,10,'请假测试01','去旅游','2019-03-14 09:51:12',0,5),(20,8,'请假测试02','回家过年','2019-03-14 15:22:45',2,5),(21,8,'请假测试02','回家过年','2019-03-14 15:25:28',0,5);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`name`,`type`,`url`,`percode`,`parentid`,`parentids`,`sortstring`,`available`) values (1,'权限','','',NULL,0,'0/','0','1'),(11,'报销管理','menu','','baoxiao:manager',1,'0/1/','1.','1'),(12,'报销申请','menu|permission','apply_baoxiao.jsp','baoxiao:apply',11,'0/1/11/','','1'),(13,'我的报销单','menu|permission','myBaoxiaoBill','baoxiao:billquery',11,'0/1/11/','','1'),(14,'我的待办事务','menu|permission','myTaskList','baoxiao:tasklist',11,'0/1/11/','','1'),(15,'流程管理','menu','','baoxiao:process',1,'0/1/15/',NULL,'1'),(21,'发布流程','menu|permission','add_process.jsp','baoxiao:publish',15,'0/1/','2.','1'),(22,'查看流程','menu|permission','processDefinitionList','baoxiao:processlist',15,'0/1/21/','','1'),(23,'系统管理','menu','','user:manager',1,'0/1/21/','','1'),(24,'用户管理','menu|permission','findUserList','user:query',23,'0/1/21/','','1'),(25,'角色添加','menu|permission','toAddRole','user:create',23,'0/1/21/','','1'),(26,'删除流程定义','permission','delDeployment','baoxiao:remove',15,NULL,NULL,'1'),(27,'查看流程定义图','permission','viewImage','baoxiao:viewimage',15,NULL,NULL,'1'),(28,'角色列表','menu|permission','findRoles','baoxiao:rolelist',23,NULL,NULL,'1');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`available`) values ('0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','网管','1'),('1','普通用户','1'),('2','部门经理','1'),('3','总经理','1'),('4','财务','1'),('f7a38138-8210-4780-beef-aef49d40ab36','会计部主管','1');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` varchar(36) NOT NULL,
  `sys_role_id` varchar(36) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(36) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`id`,`sys_role_id`,`sys_permission_id`) values ('003f56da-70ea-4c46-8f93-fe7fa01fd474','f7a38138-8210-4780-beef-aef49d40ab36','14'),('02876167-3e21-4fee-af25-acf07659238c','3','14'),('067b999b-b6e6-4926-abd6-7e2fcb3824cd','f7a38138-8210-4780-beef-aef49d40ab36','23'),('07918238-5657-46c2-9ef7-5282d13e4ddf','2','25'),('0e273a64-05df-4071-9eae-f5550563f1cb','3','22'),('147468fd-4017-43cd-8c8b-060b05c7ee69','3','15'),('1cac62ba-f78a-4db3-82cc-5d3b5a6fc8c9','1','13'),('2284e4cf-57c2-4424-b6d9-dc57928563b9','2','22'),('29c732ec-cc17-4889-8b78-bc031cf765a3','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','11'),('2a0e0f4c-56a9-4bbb-8e76-0f7052d3ffbe','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','13'),('2cae86b2-713c-4f10-98a0-f876c4fe28ac','2','21'),('2e9311e5-7fb8-4688-a286-e31fb46736ec','3','25'),('33e21e30-1f6b-44be-af39-19b378355047','f7a38138-8210-4780-beef-aef49d40ab36','11'),('36e047a4-4bcf-45a6-a3bf-4f3c7f60339a','4','11'),('38bc5d80-fce8-457b-9dad-0be567a76e7b','f7a38138-8210-4780-beef-aef49d40ab36','15'),('3f56ebe5-afc3-4613-97bc-0ff2b09f2bd6','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','15'),('3f69be78-eb82-4b43-a5f7-0c0a8cee8fcb','3','24'),('4000c6fb-39d2-4c84-b23a-a379338f70d8','2','15'),('52c0fdef-29b5-4a5e-966d-d1c444d80c31','2','14'),('5902bdb3-1f23-48fa-b2d1-442382463cac','1','12'),('65bab90f-3a4d-4fa1-a19c-76ada545ed78','2','11'),('6890155f-8e0a-410e-bee4-97d8a8f60d25','3','11'),('7cc90728-96ae-4d04-aebe-f3457d809f51','f7a38138-8210-4780-beef-aef49d40ab36','12'),('9e68e3b0-2a7f-4624-ac20-7601a84a074f','2','23'),('a18f18d5-ca43-4021-a3f3-0340c611a5dd','3','28'),('a1f20773-9ac8-4872-85ee-86c5b140d681','4','14'),('a76c5315-7354-434a-9681-2ed182ca1816','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','21'),('ad1ca09a-271e-4a55-be78-1e2a84f04331','2','24'),('b013f33d-7010-4d4b-9811-a61b362df65a','3','21'),('b6c121c1-db94-4af3-b0a1-4e93fbf776b7','f7a38138-8210-4780-beef-aef49d40ab36','13'),('c6fcdfb9-0bfb-40a1-8665-12244101b1ea','1','14'),('cea67be3-3ad8-4813-ab03-683ae63f8b27','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','14'),('d003d11d-ff85-4042-8831-1e22b4febd88','3','23'),('e3f7e8a2-3ee0-4887-8e58-b4add1789eb8','0aeddab9-c1bb-4871-8f1c-68bc5f675fb0','12'),('e7fce79d-8164-4538-9671-2c8bfa777e99','1','11'),('f957edca-0575-4694-ad94-46fc4d76b5c5','f7a38138-8210-4780-beef-aef49d40ab36','24'),('fb599643-f9e1-4769-a5d3-21aed672f605','f7a38138-8210-4780-beef-aef49d40ab36','22');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(36) NOT NULL,
  `sys_role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`sys_user_id`,`sys_role_id`) values ('1','danny','3'),('2','jack','2'),('3','mike','2'),('4','chen','1'),('5','zhang','1'),('6','li','4');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
