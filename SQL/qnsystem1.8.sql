/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50146
Source Host           : localhost:3306
Source Database       : qnsystem

Target Server Type    : MYSQL
Target Server Version : 50146
File Encoding         : 65001

Date: 2019-06-13 16:23:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(10) NOT NULL AUTO_INCREMENT,
  `question_id` int(10) DEFAULT NULL,
  `user_questionnaire_id` int(10) DEFAULT NULL,
  `answer_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  UNIQUE KEY `uk_t_2` (`question_id`,`user_questionnaire_id`),
  KEY `FK_Reference_15` (`user_questionnaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('3', '15', '5', '等于2');
INSERT INTO `answer` VALUES ('4', '16', '5', '2');

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `authority_id` int(10) NOT NULL AUTO_INCREMENT,
  `authority_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_menu` tinyint(1) DEFAULT NULL,
  `menu_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', '参与调查', '1', '参与调查');
INSERT INTO `authority` VALUES ('2', '参与投票', '1', '参与投票');
INSERT INTO `authority` VALUES ('3', '问卷模板', '1', '问卷模板');
INSERT INTO `authority` VALUES ('4', '创建调查', '1', '创建调查');
INSERT INTO `authority` VALUES ('5', '创建投票', '1', '创建投票');
INSERT INTO `authority` VALUES ('6', '后台管理', '1', '后台管理');
INSERT INTO `authority` VALUES ('7', '管理问卷', '1', '管理问卷');
INSERT INTO `authority` VALUES ('8', '管理权限', '1', '管理权限');

-- ----------------------------
-- Table structure for `options`
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_id` int(10) NOT NULL AUTO_INCREMENT,
  `question_id` int(10) DEFAULT NULL,
  `option_number` int(11) DEFAULT NULL,
  `option_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `uk_t_3` (`question_id`,`option_number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('14', '16', '1', '0');
INSERT INTO `options` VALUES ('15', '16', '2', '2');
INSERT INTO `options` VALUES ('16', '18', '1', '0');
INSERT INTO `options` VALUES ('17', '18', '2', '2');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(10) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(10) NOT NULL,
  `question_type` int(11) DEFAULT NULL,
  `question_number` int(11) NOT NULL,
  `question_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `uk_t_1` (`questionnaire_id`,`question_number`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('15', '17', '2', '1', '1+1=几?');
INSERT INTO `question` VALUES ('16', '17', '0', '2', '你帅吗?');
INSERT INTO `question` VALUES ('17', '18', '2', '1', '1+1=几?');
INSERT INTO `question` VALUES ('18', '18', '0', '2', '你帅吗?');

-- ----------------------------
-- Table structure for `questionnaire`
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire`;
CREATE TABLE `questionnaire` (
  `questionnaire_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `questionnaire_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `questionnaire_cdate` datetime DEFAULT NULL,
  `questionnaire_fdate` datetime DEFAULT NULL,
  `questionnaire_state` tinyint(1) DEFAULT NULL,
  `questionnaire_type` int(10) DEFAULT NULL,
  PRIMARY KEY (`questionnaire_id`),
  KEY `FK_Reference_11` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of questionnaire
-- ----------------------------
INSERT INTO `questionnaire` VALUES ('17', '1', '我的问卷', '2019-06-12 17:56:06', '2019-06-12 17:56:06', '1', '0');
INSERT INTO `questionnaire` VALUES ('18', '1', '西农问卷调查', '2019-06-12 20:52:18', '2019-06-12 20:52:18', '1', '0');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `role_authority`
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority` (
  `role_authority_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `authority_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`role_authority_id`),
  UNIQUE KEY `uk_t_4` (`role_id`,`authority_id`),
  KEY `FK_Reference_5` (`authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_authority
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_mail` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_t_5` (`user_name`),
  UNIQUE KEY `uk_t_8` (`user_mail`),
  KEY `FK_Reference_1` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'owaliwuligu', '123456789', 'dx.xiang_2018@nwafu.edu.cn', null);
INSERT INTO `user` VALUES ('2', 'bzbzbzbz', '123456', '793643236@qq.com', null);

-- ----------------------------
-- Table structure for `user_authority`
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority` (
  `user_authority_id` int(10) NOT NULL AUTO_INCREMENT,
  `authority_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_authority_id`),
  UNIQUE KEY `uk_t_7` (`authority_id`,`user_id`),
  KEY `FK_Reference_12` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_authority
-- ----------------------------
INSERT INTO `user_authority` VALUES ('1', '1', '1');
INSERT INTO `user_authority` VALUES ('7', '1', '2');
INSERT INTO `user_authority` VALUES ('2', '2', '1');
INSERT INTO `user_authority` VALUES ('8', '2', '2');
INSERT INTO `user_authority` VALUES ('3', '3', '1');
INSERT INTO `user_authority` VALUES ('9', '3', '2');
INSERT INTO `user_authority` VALUES ('4', '4', '1');
INSERT INTO `user_authority` VALUES ('10', '4', '2');
INSERT INTO `user_authority` VALUES ('5', '5', '1');
INSERT INTO `user_authority` VALUES ('11', '5', '2');

-- ----------------------------
-- Table structure for `user_questionnaire`
-- ----------------------------
DROP TABLE IF EXISTS `user_questionnaire`;
CREATE TABLE `user_questionnaire` (
  `user_questionnaire_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `user_questionnaire_adate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_questionnaire_id`),
  UNIQUE KEY `uk_t_6` (`user_id`,`questionnaire_id`),
  KEY `FK_Reference_14` (`questionnaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_questionnaire
-- ----------------------------
INSERT INTO `user_questionnaire` VALUES ('5', '2', '17', '2019-06-12 20:10:59');
