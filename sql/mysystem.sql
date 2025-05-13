/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : mysystem

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 02/04/2025 02:35:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号(唯一)',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ADMIN' COMMENT '身份',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin1', '123456', 'ADMIN', '管理员1', 'http://localhost:9999/files/download/1742634810445_ea6db5914b063f9a02599e693ce03a42.jpg');
INSERT INTO `admin` VALUES (7, 'admin2', '123456', 'ADMIN', '管理员2', 'http://localhost:9999/files/download/1742375044354_a71653afa6162e44fe6417f3df576d97.jpg');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (3, '略', '一起学习！', '2025-04-02 00:12:27');
INSERT INTO `message` VALUES (4, '你好', '好，一起学习', '2025-04-02 00:25:15');
INSERT INTO `message` VALUES (6, '大家好', '哈哈', '2025-04-02 00:28:01');
INSERT INTO `message` VALUES (7, '你好', '大家好', '2025-04-02 00:29:51');
INSERT INTO `message` VALUES (8, 'test', 'xxxx', '2025-04-02 00:34:22');
INSERT INTO `message` VALUES (10, 'test', 'xxxxxx', '2025-04-02 00:36:51');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '问题内容',
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '解答内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, '<p><img src=\"http://localhost:9999/files/download/1742895462958-{0E170C6F-CAFD-41CD-A48B-3A590771A31E}.png\" alt=\"\" data-href=\"\" style=\"width: 50%;\"/></p>', NULL, '2025-03-22 17:21:09', '高数', 2);
INSERT INTO `questions` VALUES (2, '<p>语法</p>', '<p>不会，自己想</p>', '2025-03-25 17:42:51', '英语', 3);
INSERT INTO `questions` VALUES (3, '<p><span style=\"color: rgb(77, 77, 77); background-color: rgb(255, 255, 255); font-size: 16px;\">1.用（ ）表示在单位时间内通过某个网络（或信道、接口）的数据量。<br>A、 速率 &nbsp; &nbsp; &nbsp; &nbsp; B、 带宽 &nbsp; &nbsp; &nbsp; &nbsp; C、</span><a href=\"https://so.csdn.net/so/search?q=%E5%90%9E%E5%90%90%E9%87%8F&amp;spm=1001.2101.3001.7020\" target=\"_blank\" style=\"text-align: start;\">吞吐量</a><span style=\"color: rgb(77, 77, 77); background-color: rgb(255, 255, 255); font-size: 16px;\"> &nbsp; &nbsp; &nbsp; &nbsp;D、 发送速率</span></p>', NULL, '2025-03-25 18:25:06', '计算机网络', 5);
INSERT INTO `questions` VALUES (4, '<p><span style=\"color: rgb(77, 77, 77); background-color: rgb(255, 255, 255); font-size: 16px;\">开放系统互连参考模型（OSI/RM）将网络体系结构化分为（ ）层。<br>A、 七 &nbsp; &nbsp; &nbsp; &nbsp; B、 五 &nbsp; &nbsp; &nbsp; &nbsp;C、 四 &nbsp; &nbsp; &nbsp; &nbsp; D、 三</span></p>', NULL, '2025-03-25 18:25:29', '计算机网络', 6);
INSERT INTO `questions` VALUES (6, '<p>test</p>', NULL, '2025-03-25 18:25:58', 'test', 1);
INSERT INTO `questions` VALUES (7, '<p>xxxxx</p>', NULL, '2025-04-02 01:06:01', 'test', 1);
INSERT INTO `questions` VALUES (8, '<p>x\'x\'x\'xxxx</p>', '<p>xx</p>', '2025-04-02 01:50:30', 'xxxx', 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号(唯一)',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'teacher1', '123456', 'TEACHER', '教师1', 'http://localhost:9999/files/download/1742899004787_微信图片_202503251834051.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id(主键)',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号(唯一)',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'student1', '123456', 'USER', '学生1', 'http://localhost:9999/files/download/1742899037680_微信图片_20250325183405.jpg');
INSERT INTO `user` VALUES (2, 'student2', '123456', 'USER', '学生2', 'http://localhost:9999/files/download/1742899025437_微信图片_202503251834052.jpg');
INSERT INTO `user` VALUES (3, 'student3', '123456', 'USER', '学生3', 'http://localhost:9999/files/download/1742899019835_微信图片_202503251834053.jpg');
INSERT INTO `user` VALUES (5, 'student4', '123456', 'USER', '学生4', 'http://localhost:9999/files/download/1742899014576_微信图片_20250325183349.jpg');
INSERT INTO `user` VALUES (6, 'student5', '123456', 'USER', '学生5', 'http://localhost:9999/files/download/1742375243400_a71653afa6162e44fe6417f3df576d97.jpg');

SET FOREIGN_KEY_CHECKS = 1;
