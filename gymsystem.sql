/*
 Navicat Premium Data Transfer

 Source Server         : offers
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : gymsystem

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 30/08/2021 10:35:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '账户',
  `password` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `gender` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '性别：1：男 0：女',
  `tel` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `head_pic` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `register_time` date NULL DEFAULT NULL COMMENT '注册时间',
  `role` tinyint(0) NULL DEFAULT 1 COMMENT '角色 暂且先定1 为管理员  1:管理员 2:收银员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'pmy', '123', '彭明源', 1, '18173477215', NULL, NULL, 1);
INSERT INTO `admin` VALUES (3, 'pmy1', '123456', '彭明源', 1, '18173477215', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/f159dfd3-1d71-435a-a63b-6a25eb232571.jpg', NULL, 1);
INSERT INTO `admin` VALUES (4, 'pmy656', '123456', NULL, 0, NULL, NULL, '2021-08-15', 1);
INSERT INTO `admin` VALUES (5, 'pmyte', 'asdf', NULL, 0, NULL, NULL, '2021-08-16', 1);
INSERT INTO `admin` VALUES (6, 'pmyasdf', '123456', NULL, 0, NULL, NULL, '2021-08-17', 1);
INSERT INTO `admin` VALUES (7, 'testinter', '123456', NULL, 0, NULL, NULL, '2021-08-23', 1);

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '预定编号',
  `uid` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `user_type` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户类型 0:普通用户  1:会员用户，对应user.vip',
  `place_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '场地编号',
  `charge_way` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '计费方式',
  `count` int(0) NULL DEFAULT NULL COMMENT '预定一个场地多久',
  `deposit` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '押金,预定多久付多少',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '预计结束时间',
  `book_time` datetime(0) NULL DEFAULT NULL COMMENT '预定时间',
  `status` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '预定状态 0:未处理 1:预约通过 2:预约拒绝',
  `note` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES (1, 4, '0', 1, 1, 2, 50, '2021-08-25 15:00:00', '2021-08-25 17:00:00', '2021-08-24 21:04:16', 0, '羽毛球标准场2小时');
INSERT INTO `book_info` VALUES (2, 4, '0', 1, 1, 1, 25, '2021-08-25 17:30:00', '2021-08-25 18:30:00', '2021-08-25 09:08:20', 0, '羽毛球标准场1小时');
INSERT INTO `book_info` VALUES (3, 1, '1', 4, 3, 2, 30, '2021-08-25 08:00:00', NULL, '2021-08-24 08:10:48', 0, '篮球室内场2人');
INSERT INTO `book_info` VALUES (5, 4, NULL, 3, NULL, 1, 10, '2021-08-28 13:03:00', '2021-08-28 22:30:08', '2021-08-28 13:02:08', 1, '');
INSERT INTO `book_info` VALUES (6, 4, NULL, 14, NULL, 1, 25, '2021-08-28 13:37:00', '2021-08-28 22:30:14', '2021-08-28 13:37:14', 2, '阿斯蒂芬');
INSERT INTO `book_info` VALUES (7, 4, NULL, 6, NULL, 3, 75, '2021-08-28 13:40:00', '2021-08-28 22:30:28', '2021-08-28 13:37:28', 0, '阿斯蒂芬撒地方士大夫');
INSERT INTO `book_info` VALUES (8, 4, NULL, 5, NULL, 2, 50, '2021-08-29 11:31:00', '2021-08-29 22:30:35', '2021-08-29 11:29:35', 0, '足球室内场两小时');
INSERT INTO `book_info` VALUES (9, 4, NULL, 13, NULL, 3, 30, '2021-08-29 11:32:00', '2021-08-29 22:30:55', '2021-08-29 11:29:55', 0, '3小时乒乓球');
INSERT INTO `book_info` VALUES (10, 4, NULL, 14, NULL, 5, 125, '2021-08-29 11:32:00', '2021-08-29 22:30:10', '2021-08-29 11:30:10', 0, '5人游泳');
INSERT INTO `book_info` VALUES (11, 1, NULL, 5, NULL, 2, 50, '2021-08-29 18:30:00', '2021-08-29 22:30:03', '2021-08-29 11:31:03', 1, '两人');
INSERT INTO `book_info` VALUES (12, 1, NULL, 14, NULL, 3, 75, '2021-08-29 12:31:00', '2021-08-29 22:30:19', '2021-08-29 11:31:19', 0, '3人');
INSERT INTO `book_info` VALUES (13, 1, NULL, 12, NULL, 3, 75, '2021-08-29 13:32:00', '2021-08-29 16:32:00', '2021-08-29 11:32:09', 0, '');
INSERT INTO `book_info` VALUES (14, 5, NULL, 4, NULL, 4, 60, '2021-08-29 11:36:00', '2021-08-29 22:30:21', '2021-08-29 11:34:21', 0, '一箱水到付');
INSERT INTO `book_info` VALUES (15, 5, NULL, 10, NULL, 1, 25, '2021-08-29 11:36:00', '2021-08-29 12:36:00', '2021-08-29 11:34:33', 1, '');
INSERT INTO `book_info` VALUES (16, 7, NULL, 5, NULL, 20, 500, '2021-08-29 11:35:00', '2021-08-29 22:30:32', '2021-08-29 11:35:32', 0, '包场');
INSERT INTO `book_info` VALUES (17, 7, NULL, 2, NULL, 1, 10, '2021-08-29 11:37:00', '2021-08-29 22:30:40', '2021-08-29 11:35:40', 0, '');
INSERT INTO `book_info` VALUES (18, 7, NULL, 12, NULL, 1, 25, '2021-08-29 11:37:00', '2021-08-29 12:37:00', '2021-08-29 11:35:54', 0, '');
INSERT INTO `book_info` VALUES (19, 40, NULL, 14, NULL, 2, 50, '2021-08-30 10:21:00', '2021-08-30 22:30:38', '2021-08-30 10:16:38', 1, '');

-- ----------------------------
-- Table structure for charge_way
-- ----------------------------
DROP TABLE IF EXISTS `charge_way`;
CREATE TABLE `charge_way`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(0) NULL DEFAULT NULL COMMENT '计费类型，0:计时收费,1:按人收费',
  `standard` int(0) NULL DEFAULT NULL COMMENT '不同类型运动场所的不同计费标准',
  `note` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `deposit` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '押金',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of charge_way
-- ----------------------------
INSERT INTO `charge_way` VALUES (1, 0, 25, '25/h', 10);
INSERT INTO `charge_way` VALUES (2, 1, 10, '10/人', 10);
INSERT INTO `charge_way` VALUES (3, 1, 15, '15/人', 10);
INSERT INTO `charge_way` VALUES (4, 1, 25, '25/人', 10);
INSERT INTO `charge_way` VALUES (5, 0, 20, '20/h', 10);

-- ----------------------------
-- Table structure for place_info
-- ----------------------------
DROP TABLE IF EXISTS `place_info`;
CREATE TABLE `place_info`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '场地编号',
  `type` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '场地类型id',
  `img_src` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图片路径',
  `status` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '可用状态 0:可用 1:正在使用 2:被预约 3:禁用',
  `note` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of place_info
-- ----------------------------
INSERT INTO `place_info` VALUES (1, 1, NULL, 2, '羽毛球标准场');
INSERT INTO `place_info` VALUES (2, 2, NULL, 1, '羽毛球普通场');
INSERT INTO `place_info` VALUES (3, 3, NULL, 0, '乒乓球');
INSERT INTO `place_info` VALUES (4, 4, NULL, 0, '篮球场');
INSERT INTO `place_info` VALUES (5, 5, NULL, 0, '足球场');
INSERT INTO `place_info` VALUES (6, 6, NULL, 0, '游泳成人场');
INSERT INTO `place_info` VALUES (10, 1, NULL, 0, '');
INSERT INTO `place_info` VALUES (11, 1, NULL, 3, '');
INSERT INTO `place_info` VALUES (12, 1, NULL, 2, '');
INSERT INTO `place_info` VALUES (13, 3, NULL, 1, '');
INSERT INTO `place_info` VALUES (14, 6, NULL, 1, '');

-- ----------------------------
-- Table structure for place_type
-- ----------------------------
DROP TABLE IF EXISTS `place_type`;
CREATE TABLE `place_type`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '场地类型名称',
  `sport_type` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '运动类型',
  `charge_way` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '计费方式',
  `note` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of place_type
-- ----------------------------
INSERT INTO `place_type` VALUES (1, '羽毛球标准场', 5, 1, '羽毛球标准场');
INSERT INTO `place_type` VALUES (2, '羽毛球普通场', 5, 2, '羽毛球普通场');
INSERT INTO `place_type` VALUES (3, '乒乓球场', 6, 2, '乒乓球场');
INSERT INTO `place_type` VALUES (4, '篮球室内场', 7, 3, '篮球场');
INSERT INTO `place_type` VALUES (5, '足球室内场', 8, 4, '足球场');
INSERT INTO `place_type` VALUES (6, '游泳馆', 9, 4, '游泳馆');

-- ----------------------------
-- Table structure for sport_type
-- ----------------------------
DROP TABLE IF EXISTS `sport_type`;
CREATE TABLE `sport_type`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(0) NULL DEFAULT NULL COMMENT '父种类',
  `name` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '种类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sport_type
-- ----------------------------
INSERT INTO `sport_type` VALUES (1, NULL, '球类运动');
INSERT INTO `sport_type` VALUES (2, NULL, '场地项目');
INSERT INTO `sport_type` VALUES (3, 1, '有网球类');
INSERT INTO `sport_type` VALUES (4, 1, '无网球类');
INSERT INTO `sport_type` VALUES (5, 3, '羽毛球');
INSERT INTO `sport_type` VALUES (6, 3, '乒乓球');
INSERT INTO `sport_type` VALUES (7, 4, '篮球');
INSERT INTO `sport_type` VALUES (8, 4, '足球');
INSERT INTO `sport_type` VALUES (9, 2, '游泳');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '123456' COMMENT '密码，默认为123456',
  `name` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '性别：1：男 0：女',
  `tel` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `head_pic` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像路径',
  `register_time` date NULL DEFAULT NULL COMMENT '注册时间',
  `vip` tinyint(0) NULL DEFAULT 0 COMMENT '用户权限 ：0：普通用户  1: 会员 ',
  `balance` decimal(10, 2) NOT NULL COMMENT '卡存余额',
  `points` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'pmy', '123456', '彭明源', 1, '18173477215', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/0610107b-3bbe-49be-83ec-91aa367f4ab5.jpg', '2021-08-11', 1, 10.00, 0);
INSERT INTO `user` VALUES (4, 'pmy1', '123456', '彭明源', 1, '18173477215', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/98592547-40a2-4dcd-aa68-2a4a495ec929.gif', '2021-08-12', 0, 0.00, 0);
INSERT INTO `user` VALUES (5, 'dateTest', '123456', 'test', 1, '18173477777', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/7b2b3510-9eab-4a7e-926b-24e809d84301.jpg', '2021-08-15', 0, 0.00, 0);
INSERT INTO `user` VALUES (6, 'pmy16156', '123456', NULL, 1, NULL, NULL, '2021-08-03', 0, 0.00, 0);
INSERT INTO `user` VALUES (7, 'test', 'asdf', '测试', 1, '18173477777', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/9373304d-f0f1-40d9-ac0c-801b73946192.jpg', '2021-08-16', 0, 0.00, 0);
INSERT INTO `user` VALUES (13, 'pmyInsert', 'asdf', 'Pmy', 1, NULL, NULL, '2021-08-23', 1, 0.00, 0);
INSERT INTO `user` VALUES (15, 'etstast', 'adsfsdf', 'asdfsd', 1, NULL, NULL, '2021-08-23', 1, 0.00, 0);
INSERT INTO `user` VALUES (16, 'test1', 'asdf', 'test1', 1, NULL, NULL, '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (20, 'testUser0', 'testUser0', 'testUser0', 0, '1817347200', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (21, 'testUser1', 'testUser1', 'testUser1', 1, '1817347201', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (22, 'testUser2', 'testUser2', 'testUser2', 0, '1817347202', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (23, 'testUser3', 'testUser3', 'testUser3', 1, '1817347203', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (24, 'testUser4', 'testUser4', 'testUser4', 0, '1817347204', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (25, 'testUser5', 'testUser5', 'testUser5', 1, '1817347205', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (26, 'testUser6', 'testUser6', 'testUser6', 0, '1817347206', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (27, 'testUser7', 'testUser7', 'testUser7', 1, '1817347207', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (28, 'testUser8', 'testUser8', 'testUser8', 0, '1817347208', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (29, 'testUser9', 'testUser9', 'testUser9', 1, '1817347209', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (30, 'testUser10', 'testUser10', 'testUser10', 0, '1817347210', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (31, 'testUser11', 'testUser11', 'testUser11', 1, '1817347211', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (32, 'testUser12', 'testUser12', 'testUser12', 0, '1817347212', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (33, 'testUser13', 'testUser13', 'testUser13', 1, '1817347213', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (34, 'testUser14', 'testUser14', 'testUser14', 0, '1817347214', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (35, 'testUser15', 'testUser15', 'testUser15', 1, '1817347215', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (36, 'testUser16', 'testUser16', 'testUser16', 0, '1817347216', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (37, 'testUser17', 'testUser17', 'testUser17', 1, '1817347217', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (38, 'testUser18', 'testUser18', 'testUser18', 0, '1817347218', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (39, 'testUser19', 'testUser19', 'testUser19', 1, '1817347219', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg', '2021-08-29', 0, 0.00, 0);
INSERT INTO `user` VALUES (40, 'pmy0607', 'asdf', '彭明源', 1, '181734772232', 'E:/projectPractice/GymManageSystem/src/main/webapp/img/5f6ce653-ba61-486e-988a-b62bf0dbd8ae.jpg', '2021-08-30', 0, 0.00, 0);

SET FOREIGN_KEY_CHECKS = 1;
