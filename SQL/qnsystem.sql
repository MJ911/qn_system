/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost:3306
 Source Schema         : qnsystem

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 17/06/2019 14:49:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `answer_id` int(10) NOT NULL AUTO_INCREMENT,
  `question_id` int(10) DEFAULT NULL,
  `user_questionnaire_id` int(10) DEFAULT NULL,
  `answer_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`answer_id`) USING BTREE,
  UNIQUE INDEX `uk_t_2`(`question_id`, `user_questionnaire_id`) USING BTREE,
  INDEX `FK_Reference_15`(`user_questionnaire_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (3, 15, 5, '等于2');
INSERT INTO `answer` VALUES (4, 16, 5, '2');

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `authority_id` int(10) NOT NULL AUTO_INCREMENT,
  `authority_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_menu` tinyint(1) DEFAULT NULL,
  `menu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1, '参与调查', 1, '参与调查');
INSERT INTO `authority` VALUES (2, '参与投票', 1, '参与投票');
INSERT INTO `authority` VALUES (3, '问卷模板', 1, '问卷模板');
INSERT INTO `authority` VALUES (4, '创建调查', 1, '创建调查');
INSERT INTO `authority` VALUES (5, '创建投票', 1, '创建投票');
INSERT INTO `authority` VALUES (6, '后台管理', 1, '后台管理');
INSERT INTO `authority` VALUES (7, '管理问卷', 1, '管理问卷');
INSERT INTO `authority` VALUES (8, '管理权限', 1, '管理权限');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `option_id` int(10) NOT NULL AUTO_INCREMENT,
  `question_id` int(10) DEFAULT NULL,
  `option_number` int(11) DEFAULT NULL,
  `option_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`option_id`) USING BTREE,
  UNIQUE INDEX `uk_t_3`(`question_id`, `option_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (14, 16, 1, '帅');
INSERT INTO `options` VALUES (15, 16, 2, '不帅');
INSERT INTO `options` VALUES (16, 18, 1, '帅');
INSERT INTO `options` VALUES (17, 18, 2, '不帅');
INSERT INTO `options` VALUES (18, 19, 1, '是的');
INSERT INTO `options` VALUES (19, 19, 2, '不是');
INSERT INTO `options` VALUES (20, 20, 1, '香蕉');
INSERT INTO `options` VALUES (21, 20, 2, '橘子');
INSERT INTO `options` VALUES (22, 20, 3, '西瓜');
INSERT INTO `options` VALUES (23, 20, 4, '苹果');
INSERT INTO `options` VALUES (24, 21, 1, '蔡徐坤');
INSERT INTO `options` VALUES (25, 21, 2, '陈坤');
INSERT INTO `options` VALUES (26, 21, 3, '蔡匡坤');
INSERT INTO `options` VALUES (30, 26, 1, '喜欢');
INSERT INTO `options` VALUES (31, 26, 2, '不喜欢');
INSERT INTO `options` VALUES (32, 27, 1, '唱');
INSERT INTO `options` VALUES (33, 27, 2, '跳');
INSERT INTO `options` VALUES (34, 27, 3, 'rap');
INSERT INTO `options` VALUES (35, 27, 4, '篮球');
INSERT INTO `options` VALUES (36, 29, 1, '大学英语四级');
INSERT INTO `options` VALUES (37, 29, 2, '大学英语六级');
INSERT INTO `options` VALUES (38, 29, 3, '雅思');
INSERT INTO `options` VALUES (39, 29, 4, '托福');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` int(10) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(10) NOT NULL,
  `question_type` int(11) DEFAULT NULL,
  `question_number` int(11) NOT NULL,
  `question_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE,
  UNIQUE INDEX `uk_t_1`(`questionnaire_id`, `question_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (15, 17, 3, 1, '1+1=几?');
INSERT INTO `question` VALUES (16, 17, 1, 2, '你帅吗?');
INSERT INTO `question` VALUES (17, 18, 3, 1, '1+1=几?');
INSERT INTO `question` VALUES (18, 18, 1, 2, '你帅吗?');
INSERT INTO `question` VALUES (19, 17, 1, 3, '你是男生吗？');
INSERT INTO `question` VALUES (20, 17, 2, 4, '你喜欢什么水果？');
INSERT INTO `question` VALUES (21, 19, 2, 1, '你最喜欢什么明星？');
INSERT INTO `question` VALUES (26, 28, 2, 1, '你喜欢蔡徐坤吗？');
INSERT INTO `question` VALUES (27, 28, 3, 2, '你认为蔡徐坤具备以下哪些能力？');
INSERT INTO `question` VALUES (28, 28, 3, 3, '请表达你对蔡徐坤成为NBA形象大使的看法');
INSERT INTO `question` VALUES (29, 30, 2, 1, '你参加过以下哪些英语能力考试？');

-- ----------------------------
-- Table structure for questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire`;
CREATE TABLE `questionnaire`  (
  `questionnaire_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `questionnaire_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `questionnaire_cdate` date DEFAULT NULL,
  `questionnaire_fdate` date DEFAULT NULL,
  `questionnaire_state` tinyint(1) DEFAULT NULL,
  `questionnaire_type` int(10) DEFAULT NULL,
  PRIMARY KEY (`questionnaire_id`) USING BTREE,
  INDEX `FK_Reference_11`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of questionnaire
-- ----------------------------
INSERT INTO `questionnaire` VALUES (17, 1, '我的问卷', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (18, 1, '西农问卷调查', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (19, 1, '只有一个填空', '2019-06-05', '2016-07-19', 1, 0);
INSERT INTO `questionnaire` VALUES (28, 1, '有关蔡徐坤的调查', '2019-06-16', '2019-06-19', 1, 0);
INSERT INTO `questionnaire` VALUES (30, 1, '有关英语考试的调查', '2019-06-16', '2019-10-11', 1, 0);
INSERT INTO `questionnaire` VALUES (31, 1, '我的问卷', '2019-06-12', '2019-06-20', 1, 0);
INSERT INTO `questionnaire` VALUES (32, 1, '西农问卷调查', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (33, 1, '只有一个多选', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (34, 1, '问卷编号1', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (35, 1, '问卷编号2', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (36, 1, '问卷编号3', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (37, 1, '问卷编号4', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (38, 1, '问卷编号5', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (39, 1, '问卷编号6', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (40, 1, '问卷编号7', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (41, 1, '问卷编号8', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (42, 1, '问卷编号9', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (43, 1, '问卷编号10', '2019-06-12', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (44, 1, '问卷编号11', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (45, 1, '问卷编号12', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (46, 1, '问卷编号13', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (47, 1, '问卷编号14', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (48, 1, '问卷编号15', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (49, 1, '问卷编号16', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (50, 1, '问卷编号17', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (51, 1, '问卷编号18', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (52, 1, '问卷编号19', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (53, 1, '问卷编号20', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (54, 1, '问卷编号21', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (55, 1, '问卷编号22', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (56, 1, '问卷编号23', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (57, 1, '问卷编号24', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (58, 1, '问卷编号25', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (59, 1, '问卷编号26', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (60, 1, '问卷编号27', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (61, 1, '问卷编号28', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (62, 1, '问卷编号29', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (63, 1, '问卷编号30', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (64, 1, '问卷编号31', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (65, 1, '问卷编号32', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (66, 1, '问卷编号33', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (67, 1, '问卷编号34', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (68, 1, '问卷编号35', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (69, 1, '问卷编号36', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (70, 1, '问卷编号37', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (71, 1, '问卷编号38', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (72, 1, '问卷编号39', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (73, 1, '问卷编号40', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (74, 1, '问卷编号41', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (75, 1, '问卷编号42', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (76, 1, '问卷编号43', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (77, 1, '问卷编号44', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (78, 1, '问卷编号45', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (79, 1, '问卷编号46', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (80, 1, '问卷编号47', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (81, 1, '问卷编号48', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (82, 1, '问卷编号49', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (83, 1, '问卷编号50', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (84, 1, '问卷编号51', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (85, 1, '问卷编号52', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (86, 1, '问卷编号53', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (87, 1, '问卷编号54', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (88, 1, '问卷编号55', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (89, 1, '问卷编号56', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (90, 1, '问卷编号57', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (91, 1, '问卷编号58', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (92, 1, '问卷编号59', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (93, 1, '问卷编号60', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (94, 1, '问卷编号61', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (95, 1, '问卷编号62', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (96, 1, '问卷编号63', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (97, 1, '问卷编号64', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (98, 1, '问卷编号65', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (99, 1, '问卷编号66', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (100, 1, '问卷编号67', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (101, 1, '问卷编号68', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (102, 1, '问卷编号69', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (103, 1, '问卷编号70', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (104, 1, '问卷编号71', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (105, 1, '问卷编号72', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (106, 1, '问卷编号73', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (107, 1, '问卷编号74', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (108, 1, '问卷编号75', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (109, 1, '问卷编号76', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (110, 1, '问卷编号77', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (111, 1, '问卷编号78', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (112, 1, '问卷编号79', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (113, 1, '问卷编号80', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (114, 1, '问卷编号81', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (115, 1, '问卷编号82', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (116, 1, '问卷编号83', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (117, 1, '问卷编号84', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (118, 1, '问卷编号85', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (119, 1, '问卷编号86', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (120, 1, '问卷编号87', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (121, 1, '问卷编号88', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (122, 1, '问卷编号89', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (123, 1, '问卷编号90', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (124, 1, '问卷编号91', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (125, 1, '问卷编号92', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (126, 1, '问卷编号93', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (127, 1, '问卷编号94', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (128, 1, '问卷编号95', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (129, 1, '问卷编号96', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (130, 1, '问卷编号97', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (131, 1, '问卷编号98', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (132, 1, '问卷编号99', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (133, 1, '问卷编号100', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (134, 1, '问卷编号101', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (135, 1, '问卷编号102', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (136, 1, '问卷编号103', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (137, 1, '问卷编号104', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (138, 1, '问卷编号105', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (139, 1, '问卷编号106', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (140, 1, '问卷编号107', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (141, 1, '问卷编号108', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (142, 1, '问卷编号109', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (143, 1, '问卷编号110', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (144, 1, '问卷编号111', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (145, 1, '问卷编号112', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (146, 1, '问卷编号113', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (147, 1, '问卷编号114', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (148, 1, '问卷编号115', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (149, 1, '问卷编号116', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (150, 1, '问卷编号117', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (151, 1, '问卷编号118', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (152, 1, '问卷编号119', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (153, 1, '问卷编号120', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (154, 1, '问卷编号121', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (155, 1, '问卷编号122', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (156, 1, '问卷编号123', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (157, 1, '问卷编号124', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (158, 1, '问卷编号125', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (159, 1, '问卷编号126', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (160, 1, '问卷编号127', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (161, 1, '问卷编号128', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (162, 1, '问卷编号129', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (163, 1, '问卷编号130', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (164, 1, '问卷编号131', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (165, 1, '问卷编号132', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (166, 1, '问卷编号133', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (167, 1, '问卷编号134', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (168, 1, '问卷编号135', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (169, 1, '问卷编号136', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (170, 1, '问卷编号137', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (171, 1, '问卷编号138', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (172, 1, '问卷编号139', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (173, 1, '问卷编号140', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (174, 1, '问卷编号141', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (175, 1, '问卷编号142', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (176, 1, '问卷编号143', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (177, 1, '问卷编号144', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (178, 1, '问卷编号145', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (179, 1, '问卷编号146', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (180, 1, '问卷编号147', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (181, 1, '问卷编号148', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (182, 1, '问卷编号149', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (183, 1, '问卷编号150', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (184, 1, '问卷编号151', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (185, 1, '问卷编号152', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (186, 1, '问卷编号153', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (187, 1, '问卷编号154', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (188, 1, '问卷编号155', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (189, 1, '问卷编号156', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (190, 1, '问卷编号157', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (191, 1, '问卷编号158', '2019-06-05', '2019-06-12', 1, 0);
INSERT INTO `questionnaire` VALUES (192, 1, '问卷编号4', '2019-06-05', '2019-06-12', 1, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '普通会员');
INSERT INTO `role` VALUES (2, '超级会员');

-- ----------------------------
-- Table structure for role_authority
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority`  (
  `role_authority_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `authority_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`role_authority_id`) USING BTREE,
  UNIQUE INDEX `uk_t_4`(`role_id`, `authority_id`) USING BTREE,
  INDEX `FK_Reference_5`(`authority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_mail` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `user_headurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_state` tinyint(1) DEFAULT NULL,
  `user_activecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `uk_t_5`(`user_name`) USING BTREE,
  UNIQUE INDEX `uk_t_8`(`user_mail`) USING BTREE,
  INDEX `FK_Reference_1`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'majiajie', '123456', 'dx.xiang_2018@nwafu.edu.cn', 1, NULL, 1, NULL);
INSERT INTO `user` VALUES (2, 'bzbzbzbz', '123456', '793643236@qq.com', 1, NULL, 1, NULL);
INSERT INTO `user` VALUES (5, 'MJJ888', 'F340AA99F7A2499C2F9337B67F764AD0', '1147809112@qq.com', 1, NULL, 1, '7b69b11811cc4574bdbb90569946c063');
INSERT INTO `user` VALUES (6, 'admin', 'F340AA99F7A2499C2F9337B67F764AD0', 'mjjwork2019@126.com', 1, NULL, 1, '7b69b11811cc4574bdbb90569946c063');

-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority`  (
  `user_authority_id` int(10) NOT NULL AUTO_INCREMENT,
  `authority_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_authority_id`) USING BTREE,
  UNIQUE INDEX `uk_t_7`(`authority_id`, `user_id`) USING BTREE,
  INDEX `FK_Reference_12`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_authority
-- ----------------------------
INSERT INTO `user_authority` VALUES (1, 1, 1);
INSERT INTO `user_authority` VALUES (7, 1, 2);
INSERT INTO `user_authority` VALUES (12, 1, 4);
INSERT INTO `user_authority` VALUES (17, 1, 5);
INSERT INTO `user_authority` VALUES (2, 2, 1);
INSERT INTO `user_authority` VALUES (8, 2, 2);
INSERT INTO `user_authority` VALUES (13, 2, 4);
INSERT INTO `user_authority` VALUES (18, 2, 5);
INSERT INTO `user_authority` VALUES (3, 3, 1);
INSERT INTO `user_authority` VALUES (9, 3, 2);
INSERT INTO `user_authority` VALUES (14, 3, 4);
INSERT INTO `user_authority` VALUES (19, 3, 5);
INSERT INTO `user_authority` VALUES (4, 4, 1);
INSERT INTO `user_authority` VALUES (10, 4, 2);
INSERT INTO `user_authority` VALUES (15, 4, 4);
INSERT INTO `user_authority` VALUES (20, 4, 5);
INSERT INTO `user_authority` VALUES (5, 5, 1);
INSERT INTO `user_authority` VALUES (11, 5, 2);
INSERT INTO `user_authority` VALUES (16, 5, 4);
INSERT INTO `user_authority` VALUES (21, 5, 5);

-- ----------------------------
-- Table structure for user_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `user_questionnaire`;
CREATE TABLE `user_questionnaire`  (
  `user_questionnaire_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `user_questionnaire_adate` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`user_questionnaire_id`) USING BTREE,
  UNIQUE INDEX `uk_t_6`(`user_id`, `questionnaire_id`) USING BTREE,
  INDEX `FK_Reference_14`(`questionnaire_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_questionnaire
-- ----------------------------
INSERT INTO `user_questionnaire` VALUES (5, 2, 17, '2019-06-12 20:10:59');

SET FOREIGN_KEY_CHECKS = 1;
