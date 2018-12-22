/*
 Navicat Premium Data Transfer

 Source Server         : ZYSY
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : zysy

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 22/12/2018 23:06:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auditing
-- ----------------------------
DROP TABLE IF EXISTS `auditing`;
CREATE TABLE `auditing`  (
  `auditingId` int(11) NOT NULL AUTO_INCREMENT,
  `videoId` int(11) NULL DEFAULT NULL,
  `photoId` int(11) NULL DEFAULT NULL,
  `columnId` int(11) NULL DEFAULT NULL,
  `startime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isAuditing` tinyint(1) NOT NULL,
  PRIMARY KEY (`auditingId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for columncategory
-- ----------------------------
DROP TABLE IF EXISTS `columncategory`;
CREATE TABLE `columncategory`  (
  `columnCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `columnsId` int(11) NOT NULL,
  `columnsName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`columnCategoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for columns
-- ----------------------------
DROP TABLE IF EXISTS `columns`;
CREATE TABLE `columns`  (
  `columnsId` int(11) NOT NULL AUTO_INCREMENT,
  `columnsName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `columninfo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `upTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `columnstype` int(11) NOT NULL,
  `playSum` int(11) NOT NULL,
  `commentSum` int(11) NOT NULL,
  `collectSum` int(11) NOT NULL,
  `supportSum` int(11) NOT NULL,
  `opposeSum` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`columnsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `commentinfo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `videoId` int(11) NULL DEFAULT NULL,
  `photoId` int(11) NULL DEFAULT NULL,
  `columnsId` int(11) NULL DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `reciveId` int(11) NOT NULL,
  `noticeId` int(11) NULL DEFAULT NULL,
  `commenttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `commenttype` int(11) NOT NULL,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `infoId` int(11) NOT NULL AUTO_INCREMENT,
  `infoname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`infoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `memberId` int(11) NOT NULL AUTO_INCREMENT,
  `isMember` tinyint(1) NOT NULL,
  `membernumber` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `rechargeTime` timestamp NULL DEFAULT NULL,
  `expireTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`memberId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 1, '6241523632638968523', 7, 1, NULL, NULL, NULL);
INSERT INTO `member` VALUES (2, 1, '123', 8, 7, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `reciveId` int(11) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `systemMessage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sendTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`messageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `commentId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`noticeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permissionId` int(11) NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`permissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '*', 1);

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`  (
  `photoId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `photoName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `photoinfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `upTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `playSum` int(11) NOT NULL,
  `commentSum` int(11) NOT NULL,
  `collectSum` int(11) NOT NULL,
  `supportSum` int(11) NOT NULL,
  `opposeSum` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`photoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for present
-- ----------------------------
DROP TABLE IF EXISTS `present`;
CREATE TABLE `present`  (
  `presentId` int(11) NOT NULL AUTO_INCREMENT,
  `presentName` int(11) NOT NULL,
  `prcture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`presentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `recordId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `videoId` int(11) NULL DEFAULT NULL,
  `photoId` int(11) NULL DEFAULT NULL,
  `columnId` int(11) NULL DEFAULT NULL,
  `operation` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recordId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward`  (
  `rewardId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `rewardTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `presentId` int(11) NOT NULL,
  `videoId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rewardId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(11) NOT NULL,
  `rolename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `mark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', 1, NULL);
INSERT INTO `role` VALUES (2, '管理员2', NULL, NULL);

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `rolePermissionId` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NULL DEFAULT NULL,
  `permissionId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rolePermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_roleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`user_roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 7, 2);
INSERT INTO `user_role` VALUES (3, 7, 1);

-- ----------------------------
-- Table structure for userchecks
-- ----------------------------
DROP TABLE IF EXISTS `userchecks`;
CREATE TABLE `userchecks`  (
  `checId` int(11) NOT NULL AUTO_INCREMENT COMMENT '签到Id',
  `userId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `checkInTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签到时间',
  `checkState` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到状态(已签到/未签到)',
  PRIMARY KEY (`checId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userchecks
-- ----------------------------
INSERT INTO `userchecks` VALUES (17, '2', 'zjw', '2018-12-17 12:02:02', '已签到');
INSERT INTO `userchecks` VALUES (18, '12', '杨二', '2018-12-17 12:02:40', '已签到');

-- ----------------------------
-- Table structure for usercolumn
-- ----------------------------
DROP TABLE IF EXISTS `usercolumn`;
CREATE TABLE `usercolumn`  (
  `userColumnId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `columnsId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userColumnId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for userphoto
-- ----------------------------
DROP TABLE IF EXISTS `userphoto`;
CREATE TABLE `userphoto`  (
  `userPhotoId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `photoId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userPhotoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `memberId` int(11) NULL DEFAULT NULL COMMENT '会员ID',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登录名',
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `headportrait` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userPassWord` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `userIsLockout` tinyint(1) NULL DEFAULT 0 COMMENT '用户是否锁定:默认不锁定',
  `userUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户信息最后一次被修改时间:数据库自己维护记录的修改时间',
  `userCreateTime` datetime NULL DEFAULT NULL COMMENT '用户账号创建时间',
  `userLastLoginTime` datetime NOT NULL COMMENT '用户上一次登录时间',
  `userLastLoginIp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户上一次登录实际IP地址',
  `userPassWrongCout` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户输入密码错误次数',
  `userLockoutTime` datetime NULL DEFAULT NULL COMMENT '用户输入密码错误次数达到上限锁定时间',
  `userEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密保邮箱',
  `userTelephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密保电话',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `marry` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户婚姻状态',
  `gold` int(11) NULL DEFAULT NULL COMMENT '硬币',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 0, '额威威', NULL, '1', '0002-11-30', '0', '123456', 0, '2018-12-08 15:45:26', NULL, '2018-12-07 17:02:40', NULL, 0, NULL, NULL, '', '', '0', 10);
INSERT INTO `users` VALUES (2, 0, 'zjw', NULL, '0', NULL, '0', 'e11cbf947798674ec3d4562c0147b755', 0, '2018-12-17 12:02:02', NULL, '2018-12-07 17:06:09', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 0, '孙博鑫', NULL, '0', NULL, '0', 'bd81d6a2408c031458d849b2e1fa72e9', 0, '2018-12-14 17:26:52', NULL, '2018-12-07 17:06:38', NULL, 0, NULL, '123456@qq.com', NULL, NULL, NULL, 6);
INSERT INTO `users` VALUES (4, 0, 'yyy', NULL, '0', NULL, '0', '5019a118b9d2dac51585e4b5322ed3e1', 0, '2018-12-16 17:48:53', NULL, '2018-12-07 17:59:28', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (5, 0, '杨明月', NULL, '0', NULL, '0', 'cf82618ce72b0449d4aab576daf17a07', 0, '2018-12-08 14:01:24', NULL, '2018-12-08 14:01:24', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (6, 0, 'ppp', NULL, '0', NULL, '0', '7879f17f69dd40599be74455a4b6bd7a', 0, '2018-12-08 15:11:33', NULL, '2018-12-08 15:11:33', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (7, 0, '李一', NULL, '2', '2002-11-18', '0', 'c8b8a6de6e890dea8001712c9e149496', 0, '2018-12-12 15:49:08', NULL, '2018-12-08 15:19:49', NULL, 0, NULL, NULL, '12563125245', '江西', '1', NULL);
INSERT INTO `users` VALUES (8, 0, 'aaa', NULL, '0', NULL, '0', 'c8b8a6de6e890dea8001712c9e149496', 0, '2018-12-17 14:46:03', NULL, '2018-12-15 11:05:15', NULL, 0, NULL, NULL, NULL, NULL, NULL, 32);
INSERT INTO `users` VALUES (9, 0, 'yt', NULL, '0', NULL, '0', '30cd2f99101cdd52cc5fda1e996ee137', 0, '2018-12-16 17:51:40', NULL, '2018-12-16 17:51:13', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (10, 0, 'zhu', NULL, '0', NULL, '0', '30cd2f99101cdd52cc5fda1e996ee137', 0, '2018-12-16 18:01:10', NULL, '2018-12-16 18:00:48', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (11, 0, 'rr', NULL, '0', NULL, '0', '7d4d05cef101a37b5f4722c43a984864', 0, '2018-12-16 18:13:00', NULL, '2018-12-16 18:13:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (12, 0, '杨二', NULL, '0', NULL, '0', '8f852790b844151d3f7cc95cb8692bc2', 0, '2018-12-17 11:49:18', NULL, '2018-12-17 11:49:18', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (13, 0, 'sb', NULL, '0', NULL, '0', '45088d3e875c515e43cb13f62495f29f', 0, '2018-12-17 15:01:07', NULL, '2018-12-17 15:01:07', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for uservideo
-- ----------------------------
DROP TABLE IF EXISTS `uservideo`;
CREATE TABLE `uservideo`  (
  `userVideoId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `videoId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userVideoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uservideo
-- ----------------------------
INSERT INTO `uservideo` VALUES (1, NULL, NULL);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `videoId` int(11) NOT NULL AUTO_INCREMENT,
  `videoName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `videoinfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `videouptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vedioCategoryId` int(11) NOT NULL,
  `playsum` int(11) NOT NULL DEFAULT 1,
  `commentsum` int(11) NOT NULL DEFAULT 0,
  `collectsum` int(11) NOT NULL DEFAULT 0,
  `supportsum` int(11) NOT NULL DEFAULT 0,
  `opposesum` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `weight` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `videoPicture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `videoUrl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`videoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:14:35', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (2, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (3, '啦啦啦', 'nice', 3, '2018-12-22 22:14:35', 6, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018-12-14\\1544766794358.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (4, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (5, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (6, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (7, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (8, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (9, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (10, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (11, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (12, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (13, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (14, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (15, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (16, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (17, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (18, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (19, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (20, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (21, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (22, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (23, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (24, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (25, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (26, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (27, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (28, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (29, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (30, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (31, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (32, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (33, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (34, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (35, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (36, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (37, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (38, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (39, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (40, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (41, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (42, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (43, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (44, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (45, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (46, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (47, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (48, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (49, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (50, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (51, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (52, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (53, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (54, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (55, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (56, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:10:24', 3, 1, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--29-13\\1544711340618.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (57, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (58, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (59, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (60, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (61, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (62, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (63, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (64, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (65, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (66, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (67, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (68, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (69, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (70, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (71, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (72, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (73, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (74, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (75, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (76, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (77, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (78, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (79, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (80, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (81, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (82, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (83, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (84, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (85, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (86, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (87, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (88, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (89, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (90, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (91, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (92, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (93, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (94, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (95, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (96, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (97, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (98, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (99, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (100, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (101, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (102, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (103, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (104, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (105, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (106, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (107, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (108, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (109, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (110, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (111, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (112, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (113, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (114, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (115, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (116, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (117, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (118, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (119, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (120, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (121, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (122, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (123, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (124, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (125, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (126, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (127, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (128, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (129, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (130, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (131, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (132, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (133, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (134, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (135, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (136, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (137, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (138, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (139, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (140, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (141, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');
INSERT INTO `video` VALUES (142, 'Football Manager 2017 ', '玩转五大联赛,成就主帅梦想', 2, '2018-12-22 22:20:43', 5, 10, 0, 0, 0, 0, 0, 0, 0, 'https://netschool.oss-cn-beijing.aliyuncs.com/2018--25-13\\1544711138821.mp4', 'http://netschool.oss-cn-beijing.aliyuncs.com/2018-12-17/p2538593487.jpg');

-- ----------------------------
-- Table structure for videocategory
-- ----------------------------
DROP TABLE IF EXISTS `videocategory`;
CREATE TABLE `videocategory`  (
  `videoCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `videoCategoryname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `videoCategoryParentId` int(11) NOT NULL,
  `videoCategoryParentName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`videoCategoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of videocategory
-- ----------------------------
INSERT INTO `videocategory` VALUES (1, '热血', 5, '0');
INSERT INTO `videocategory` VALUES (2, '后宫', 5, '0');
INSERT INTO `videocategory` VALUES (3, '音乐', 0, '0');
INSERT INTO `videocategory` VALUES (4, '鬼畜', 0, '0');
INSERT INTO `videocategory` VALUES (5, '动漫', 0, '0');
INSERT INTO `videocategory` VALUES (6, '影视', 0, '0');

SET FOREIGN_KEY_CHECKS = 1;
