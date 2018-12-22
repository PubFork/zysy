/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.19 : Database - zysy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zysy` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zysy`;

/*Table structure for table `auditing` */

DROP TABLE IF EXISTS `auditing`;

CREATE TABLE `auditing` (
  `auditingId` int(11) NOT NULL AUTO_INCREMENT,
  `videoId` int(11) DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  `columnId` int(11) DEFAULT NULL,
  `startime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isAuditing` tinyint(1) NOT NULL,
  PRIMARY KEY (`auditingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auditing` */

/*Table structure for table `columncategory` */

DROP TABLE IF EXISTS `columncategory`;

CREATE TABLE `columncategory` (
  `columnCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `columnsId` int(11) NOT NULL,
  `columnsName` varchar(50) NOT NULL,
  PRIMARY KEY (`columnCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `columncategory` */

/*Table structure for table `columns` */

DROP TABLE IF EXISTS `columns`;

CREATE TABLE `columns` (
  `columnsId` int(11) NOT NULL AUTO_INCREMENT,
  `columnsName` varchar(50) NOT NULL,
  `columninfo` varchar(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `upTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `columnstype` int(11) NOT NULL,
  `playSum` int(11) NOT NULL,
  `commentSum` int(11) NOT NULL,
  `collectSum` int(11) NOT NULL,
  `supportSum` int(11) NOT NULL,
  `opposeSum` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`columnsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `columns` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `commentinfo` varchar(500) NOT NULL,
  `videoId` int(11) DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  `columnsId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `reciveId` int(11) NOT NULL,
  `noticeId` int(11) DEFAULT NULL,
  `commenttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `commenttype` int(11) NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `info` */

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `infoId` int(11) NOT NULL AUTO_INCREMENT,
  `infoname` varchar(100) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`infoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `info` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `memberId` int(11) NOT NULL AUTO_INCREMENT,
  `isMember` tinyint(1) NOT NULL,
  `membernumber` varchar(32) NOT NULL,
  `userId` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `rechargeTime` timestamp NULL DEFAULT NULL,
  `expireTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`memberId`,`isMember`,`membernumber`,`userId`,`level`,`type`,`rechargeTime`,`expireTime`) values (1,1,'6241523632638968523',7,1,NULL,NULL,NULL),(2,1,'123',8,7,NULL,NULL,NULL);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `reciveId` int(11) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `systemMessage` varchar(100) NOT NULL,
  `sendTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `commentId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `permissionId` int(11) NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(50) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`permissionId`,`permissionname`,`roleId`) values (1,'*',1);

/*Table structure for table `photo` */

DROP TABLE IF EXISTS `photo`;

CREATE TABLE `photo` (
  `photoId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `photoName` varchar(50) NOT NULL,
  `photoinfo` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `upTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `playSum` int(11) NOT NULL,
  `commentSum` int(11) NOT NULL,
  `collectSum` int(11) NOT NULL,
  `supportSum` int(11) NOT NULL,
  `opposeSum` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`photoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photo` */

/*Table structure for table `present` */

DROP TABLE IF EXISTS `present`;

CREATE TABLE `present` (
  `presentId` int(11) NOT NULL AUTO_INCREMENT,
  `presentName` int(11) NOT NULL,
  `prcture` varchar(100) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`presentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `present` */

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `recordId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `videoId` int(11) DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  `columnId` int(11) DEFAULT NULL,
  `operation` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record` */

/*Table structure for table `reward` */

DROP TABLE IF EXISTS `reward`;

CREATE TABLE `reward` (
  `rewardId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `rewardTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `presentId` int(11) NOT NULL,
  `videoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reward` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL,
  `rolename` varchar(50) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`rolename`,`userId`,`mark`) values (1,'管理员',1,NULL),(2,'管理员2',NULL,NULL);

/*Table structure for table `rolepermission` */

DROP TABLE IF EXISTS `rolepermission`;

CREATE TABLE `rolepermission` (
  `rolePermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `permissionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rolePermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `rolepermission` */

insert  into `rolepermission`(`rolePermissionId`,`roleId`,`permissionId`) values (1,1,1);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_roleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`user_roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`user_roleId`,`userId`,`roleId`) values (1,1,1),(2,7,2),(3,7,1);

/*Table structure for table `userchecks` */

DROP TABLE IF EXISTS `userchecks`;

CREATE TABLE `userchecks` (
  `checId` int(11) NOT NULL AUTO_INCREMENT COMMENT '签到Id',
  `userId` varchar(100) DEFAULT NULL COMMENT '用户Id',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `checkInTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签到时间',
  `checkState` varchar(50) DEFAULT NULL COMMENT '签到状态(已签到/未签到)',
  PRIMARY KEY (`checId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `userchecks` */

insert  into `userchecks`(`checId`,`userId`,`userName`,`checkInTime`,`checkState`) values (17,'2','zjw','2018-12-17 12:02:02','已签到'),(18,'12','杨二','2018-12-17 12:02:40','已签到');

/*Table structure for table `usercolumn` */

DROP TABLE IF EXISTS `usercolumn`;

CREATE TABLE `usercolumn` (
  `userColumnId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `columnsId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userColumnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usercolumn` */

/*Table structure for table `userphoto` */

DROP TABLE IF EXISTS `userphoto`;

CREATE TABLE `userphoto` (
  `userPhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userPhotoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userphoto` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `memberId` int(11) DEFAULT NULL COMMENT '会员ID',
  `userName` varchar(20) NOT NULL COMMENT '用户登录名',
  `nickName` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `birthday` varchar(20) DEFAULT NULL COMMENT '生日',
  `headportrait` varchar(50) DEFAULT NULL COMMENT '用户头像',
  `userPassWord` varchar(100) NOT NULL COMMENT '用户密码',
  `userIsLockout` tinyint(1) DEFAULT '0' COMMENT '用户是否锁定:默认不锁定',
  `userUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户信息最后一次被修改时间:数据库自己维护记录的修改时间',
  `userCreateTime` datetime DEFAULT NULL COMMENT '用户账号创建时间',
  `userLastLoginTime` datetime NOT NULL COMMENT '用户上一次登录时间',
  `userLastLoginIp` varchar(50) DEFAULT NULL COMMENT '用户上一次登录实际IP地址',
  `userPassWrongCout` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户输入密码错误次数',
  `userLockoutTime` datetime DEFAULT NULL COMMENT '用户输入密码错误次数达到上限锁定时间',
  `userEmail` varchar(50) DEFAULT NULL COMMENT '用户密保邮箱',
  `userTelephone` varchar(20) DEFAULT NULL COMMENT '用户密保电话',
  `address` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `marry` varchar(20) DEFAULT NULL COMMENT '用户婚姻状态',
  `gold` int(11) DEFAULT NULL COMMENT '硬币',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`userId`,`memberId`,`userName`,`nickName`,`sex`,`birthday`,`headportrait`,`userPassWord`,`userIsLockout`,`userUpdateTime`,`userCreateTime`,`userLastLoginTime`,`userLastLoginIp`,`userPassWrongCout`,`userLockoutTime`,`userEmail`,`userTelephone`,`address`,`marry`,`gold`) values (1,0,'额威威',NULL,'1','0002-11-30','0','123456',0,'2018-12-08 15:45:26',NULL,'2018-12-07 17:02:40',NULL,0,NULL,NULL,'','','0',10),(2,0,'zjw',NULL,'0',NULL,'0','e11cbf947798674ec3d4562c0147b755',0,'2018-12-17 12:02:02',NULL,'2018-12-07 17:06:09',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(3,0,'孙博鑫',NULL,'0',NULL,'0','bd81d6a2408c031458d849b2e1fa72e9',0,'2018-12-14 17:26:52',NULL,'2018-12-07 17:06:38',NULL,0,NULL,'123456@qq.com',NULL,NULL,NULL,6),(4,0,'yyy',NULL,'0',NULL,'0','5019a118b9d2dac51585e4b5322ed3e1',0,'2018-12-16 17:48:53',NULL,'2018-12-07 17:59:28',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(5,0,'杨明月',NULL,'0',NULL,'0','cf82618ce72b0449d4aab576daf17a07',0,'2018-12-08 14:01:24',NULL,'2018-12-08 14:01:24',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(6,0,'ppp',NULL,'0',NULL,'0','7879f17f69dd40599be74455a4b6bd7a',0,'2018-12-08 15:11:33',NULL,'2018-12-08 15:11:33',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(7,0,'李一',NULL,'2','2002-11-18','0','c8b8a6de6e890dea8001712c9e149496',0,'2018-12-12 15:49:08',NULL,'2018-12-08 15:19:49',NULL,0,NULL,NULL,'12563125245','江西','1',NULL),(8,0,'aaa',NULL,'0',NULL,'0','c8b8a6de6e890dea8001712c9e149496',0,'2018-12-17 14:46:03',NULL,'2018-12-15 11:05:15',NULL,0,NULL,NULL,NULL,NULL,NULL,32),(9,0,'yt',NULL,'0',NULL,'0','30cd2f99101cdd52cc5fda1e996ee137',0,'2018-12-16 17:51:40',NULL,'2018-12-16 17:51:13',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(10,0,'zhu',NULL,'0',NULL,'0','30cd2f99101cdd52cc5fda1e996ee137',0,'2018-12-16 18:01:10',NULL,'2018-12-16 18:00:48',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(11,0,'rr',NULL,'0',NULL,'0','7d4d05cef101a37b5f4722c43a984864',0,'2018-12-16 18:13:00',NULL,'2018-12-16 18:13:00',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(12,0,'杨二',NULL,'0',NULL,'0','8f852790b844151d3f7cc95cb8692bc2',0,'2018-12-17 11:49:18',NULL,'2018-12-17 11:49:18',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(13,0,'sb',NULL,'0',NULL,'0','45088d3e875c515e43cb13f62495f29f',0,'2018-12-17 15:01:07',NULL,'2018-12-17 15:01:07',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `uservideo` */

DROP TABLE IF EXISTS `uservideo`;

CREATE TABLE `uservideo` (
  `userVideoId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `videoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userVideoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `uservideo` */

insert  into `uservideo`(`userVideoId`,`userId`,`videoId`) values (1,NULL,NULL);

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `videoId` int(11) NOT NULL AUTO_INCREMENT,
  `videoName` varchar(50) NOT NULL,
  `videoinfo` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `videouptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vedioCategoryId` int(11) NOT NULL,
  `playsum` int(11) NOT NULL DEFAULT '1',
  `commentsum` int(11) NOT NULL DEFAULT '0',
  `collectsum` int(11) NOT NULL DEFAULT '0',
  `supportsum` int(11) NOT NULL DEFAULT '0',
  `opposesum` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `videoPicture` varchar(100) NOT NULL,
  PRIMARY KEY (`videoId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `video` */

insert  into `video`(`videoId`,`videoName`,`videoinfo`,`userId`,`videouptime`,`vedioCategoryId`,`playsum`,`commentsum`,`collectsum`,`supportsum`,`opposesum`,`state`,`weight`,`price`,`videoPicture`) values (1,'Football Manager 2017 ','玩转五大联赛,成就主帅梦想',2,'2018-12-19 17:18:18',5,10,0,0,0,0,0,0,0,'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4'),(2,'Football Manager 2017 ','玩转五大联赛,成就主帅梦想',2,'2018-12-13 22:29:13',3,1,0,0,0,0,0,0,0,'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4'),(3,'啦啦啦','nice',3,'2018-12-14 13:53:15',6,1,0,0,0,0,0,0,0,'https://netschool.oss-cn-beijing.aliyuncs.com/2018-12-14\\1544766794358.mp4');

/*Table structure for table `videocategory` */

DROP TABLE IF EXISTS `videocategory`;

CREATE TABLE `videocategory` (
  `videoCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `videoCategoryname` varchar(50) NOT NULL,
  `videoCategoryParentId` int(11) NOT NULL,
  `videoCategoryParentName` varchar(50) NOT NULL,
  PRIMARY KEY (`videoCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `videocategory` */

insert  into `videocategory`(`videoCategoryId`,`videoCategoryname`,`videoCategoryParentId`,`videoCategoryParentName`) values (1,'热血',5,'0'),(2,'后宫',5,'0'),(3,'音乐',0,'0'),(4,'鬼畜',0,'0'),(5,'动漫',0,'0'),(6,'影视',0,'0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
