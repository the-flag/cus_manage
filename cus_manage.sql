/*
 Navicat Premium Data Transfer

 Source Server         : yunfuwu
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 39.97.183.120:3306
 Source Schema         : cus_manage

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 31/05/2019 10:00:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_record
-- ----------------------------
DROP TABLE IF EXISTS `access_record`;
CREATE TABLE `access_record`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_time` timestamp(0) NULL DEFAULT NULL,
  `record_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `record_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `record_endtime` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `record_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回访情况',
  `record_lasttime` timestamp(0) NULL DEFAULT NULL COMMENT '下次跟踪时间\r\n',
  `record_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回访方式',
  `record_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `access_record_user_id`(`user_id`) USING BTREE,
  INDEX `access_record_customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `access_record_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `access_record_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of access_record
-- ----------------------------
INSERT INTO `access_record` VALUES (4, '2019-05-10 00:00:00', '关于未来套餐了解', '河南', 5, 1, '2019-05-11 00:00:00', '上门', '2019-05-16 00:00:00', '上门', '可以');
INSERT INTO `access_record` VALUES (5, '2019-05-07 00:00:00', 'good', '北京', 5, 18, '2019-05-08 00:00:00', '电话', '2019-05-07 00:00:00', '电话', 'ddf');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_age` int(255) NULL DEFAULT NULL,
  `customer_sex` int(255) NULL DEFAULT NULL COMMENT '性别：1：男，2：女',
  `customer_academic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_level` int(255) NULL DEFAULT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_status` int(255) NULL DEFAULT NULL COMMENT '客户状态：未知，待业，在职，在读',
  `customer_create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `customer_qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_course` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_visit` int(255) NULL DEFAULT NULL COMMENT '是否上门：1，是  2，否',
  `customer_onevisit_time` timestamp(0) NULL DEFAULT NULL,
  `customer_ingate` int(255) NULL DEFAULT NULL,
  `customer_ingate_time` timestamp(0) NULL DEFAULT NULL,
  `userw_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `customer_dmoney` int(255) NULL DEFAULT NULL,
  `customer_dtime` timestamp(0) NULL DEFAULT NULL,
  `customer_jiaofei` int(255) NULL DEFAULT NULL,
  `customer_jiaotime` timestamp(0) NULL DEFAULT NULL,
  `customer_jiaomoney` int(255) NULL DEFAULT NULL,
  `customer_istui` int(255) NULL DEFAULT NULL,
  `customer_tuicause` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_isjinban` int(255) NULL DEFAULT NULL,
  `customer_jinbantime` timestamp(0) NULL DEFAULT NULL,
  `customer_jinbanremark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_zixunremark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  INDEX `customer_user_id`(`user_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '4115031999', '苏德财', 20, 1, '大专', '新乡', 1, '黑龙江省哈尔滨市道里区在啊', '450300', '13987451256', 1, '2019-05-14 17:06:22', '电话访谈', '2014515478', '网络开发', 1, '2019-05-14 00:00:00', 1, '2019-05-14 17:01:54', 3, 5, 1111, '2019-05-22 00:00:00', 10000, '2019-05-22 21:02:26', 22222, 1, '无', 1, '2019-05-22 21:02:43', '还可以', '不错');
INSERT INTO `customer` VALUES (2, '4115031998', '孔恺', 21, 1, '大专', '开封  ', 6, '新乡职业技术学院4507', '450300', '13987451256', 2, '2019-05-14 17:07:36', '网络信息', '10264578', '网络运营维护', 1, '2019-05-14 17:06:38', 2, '2019-05-14 17:06:31', 3, 4, NULL, NULL, NULL, '2019-03-14 10:38:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (3, '41115031997', '来蛋', 19, 2, '本科', '小店', 7, '紫枫花园', '450300', '13978454563', 1, '2019-05-16 08:51:32', '未知', NULL, '未知', 2, '2019-05-01 08:49:58', 1, '2019-05-16 08:51:23', 3, 4, NULL, NULL, NULL, '2019-05-28 10:38:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (16, '411503', '耿想', 19, 1, '高中以下', '未知', 1, '新乡4507', '4115039', '13978451231', 1, '2019-05-30 11:47:58', '网络信息', '563655663', '软件开发', NULL, NULL, NULL, NULL, 3, 4, NULL, NULL, NULL, '2019-04-05 21:58:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (17, '55555555', '测试一', 55, 1, 'd', '未知', 1, '新乡504', '4566655', '13409237330', 1, '2019-05-31 00:45:21', '网络信息', NULL, NULL, NULL, NULL, NULL, NULL, 3, 4, NULL, NULL, NULL, '2019-01-18 00:46:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer` VALUES (18, '4115036969', '子叶', 22, 1, '本科', '郑州', 1, '河北省秦皇岛市昌黎镇', '45310', '15635655466', 1, '2019-05-31 08:15:15', '', '548525555', NULL, 1, '2019-05-22 00:00:00', 1, NULL, 3, 5, 100, '2019-05-23 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en');
INSERT INTO `customer` VALUES (19, '47565558', '晶晶', 22, 2, '本科', '新乡', 1, '河南省新乡市', '47525', '13598796587', 1, '2019-05-31 09:45:42', '电话访谈', '475315475', NULL, NULL, NULL, NULL, NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer_loss
-- ----------------------------
DROP TABLE IF EXISTS `customer_loss`;
CREATE TABLE `customer_loss`  (
  `loss_id` int(11) NOT NULL AUTO_INCREMENT,
  `loss_why` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loss_status` int(255) NULL DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`loss_id`) USING BTREE,
  INDEX `customer_loss_customer_id`(`customer_id`) USING BTREE,
  INDEX `customer_loss_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `customer_loss_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_loss_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_weight` int(11) NULL DEFAULT NULL,
  `module_parent_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (4, '系统管理', '', 4, 0);
INSERT INTO `module` VALUES (5, '权限管理', '', 5, 4);
INSERT INTO `module` VALUES (6, '用户管理', 'getUserPage', 6, 5);
INSERT INTO `module` VALUES (7, '角色管理', 'getRolePage', 7, 5);
INSERT INTO `module` VALUES (8, '模块管理', 'getModulePage', 8, 5);
INSERT INTO `module` VALUES (9, '公司信息管理', 'getCompanyInfo', 9, 0);
INSERT INTO `module` VALUES (10, '员工管理', 'getSigninorback', 10, 9);
INSERT INTO `module` VALUES (11, '客户管理', 'getManager', 11, 9);
INSERT INTO `module` VALUES (12, '公司信息管理2', 'getCompanyInfo2', 12, 0);
INSERT INTO `module` VALUES (13, '网络咨询师', 'getNetWorkTeacher', 13, 12);
INSERT INTO `module` VALUES (14, '咨询师', 'getReferTeacher', 14, 12);
INSERT INTO `module` VALUES (15, '客户跟进', 'getCustomer1', 15, 14);
INSERT INTO `module` VALUES (16, '跟踪信息', 'getCustomer2', 16, 14);
INSERT INTO `module` VALUES (17, '客户跟进', 'getCustomerFollow', 17, 9);
INSERT INTO `module` VALUES (18, '测试2', '', 14, 14);
INSERT INTO `module` VALUES (19, '消息公布栏', 'chat', 18, 42);
INSERT INTO `module` VALUES (39, '统计管理', 'getConsultingManager', NULL, 9);
INSERT INTO `module` VALUES (40, '统计管理', 'getNetworkConsultant', NULL, 12);
INSERT INTO `module` VALUES (41, '统计管理', 'getConsulting', NULL, 14);
INSERT INTO `module` VALUES (42, '通信管理', NULL, NULL, 0);

-- ----------------------------
-- Table structure for offline_message
-- ----------------------------
DROP TABLE IF EXISTS `offline_message`;
CREATE TABLE `offline_message`  (
  `offline_message_id` int(11) NOT NULL COMMENT '主键',
  `message_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `message_send_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `message_receive_time` timestamp(0) NULL DEFAULT NULL COMMENT '接收时间',
  `message_send_user_id` int(11) NULL DEFAULT NULL COMMENT '发送用户id',
  `message_receive_user_id` int(11) NULL DEFAULT NULL COMMENT '接收用户id',
  `message_receive_state` int(255) NULL DEFAULT NULL COMMENT '接收时状态 0 -- 在线 1--离线',
  `message_send_state` int(255) NULL DEFAULT NULL COMMENT '发送时状态 0 -- 在线 1--离线',
  PRIMARY KEY (`offline_message_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_flag` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', '', 1);
INSERT INTO `role` VALUES (2, '咨询经理', '角色描述：', 1);
INSERT INTO `role` VALUES (3, '咨询师', '角色描述：', NULL);
INSERT INTO `role` VALUES (4, '网络咨询师', '角色描述：', NULL);
INSERT INTO `role` VALUES (15, '测试一', '角色描述：', NULL);
INSERT INTO `role` VALUES (16, '监管', '角色描述：', NULL);
INSERT INTO `role` VALUES (17, '监管22', '角色描述：', NULL);
INSERT INTO `role` VALUES (18, '测试1', '角色描述：', NULL);
INSERT INTO `role` VALUES (19, '测试2', '角色描述：', NULL);
INSERT INTO `role` VALUES (20, '测试3', '角色描述：', NULL);
INSERT INTO `role` VALUES (21, '测试4', '角色描述：', NULL);
INSERT INTO `role` VALUES (22, '小日本', '角色描述：', NULL);

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module`  (
  `role_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`role_module_id`) USING BTREE,
  INDEX `role_module_role_id`(`role_id`) USING BTREE,
  INDEX `role_module_module_id`(`module_id`) USING BTREE,
  CONSTRAINT `role_module_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_module_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO `role_module` VALUES (1, 1, 4);
INSERT INTO `role_module` VALUES (2, 1, 6);
INSERT INTO `role_module` VALUES (3, 1, 7);
INSERT INTO `role_module` VALUES (4, 1, 5);
INSERT INTO `role_module` VALUES (5, 1, 8);
INSERT INTO `role_module` VALUES (143, 2, 9);
INSERT INTO `role_module` VALUES (144, 2, 10);
INSERT INTO `role_module` VALUES (145, 2, 11);
INSERT INTO `role_module` VALUES (146, 2, 17);
INSERT INTO `role_module` VALUES (147, 2, 39);
INSERT INTO `role_module` VALUES (148, 2, 42);
INSERT INTO `role_module` VALUES (149, 2, 19);
INSERT INTO `role_module` VALUES (150, 3, 12);
INSERT INTO `role_module` VALUES (151, 3, 14);
INSERT INTO `role_module` VALUES (152, 3, 15);
INSERT INTO `role_module` VALUES (153, 3, 16);
INSERT INTO `role_module` VALUES (154, 3, 41);
INSERT INTO `role_module` VALUES (155, 3, 42);
INSERT INTO `role_module` VALUES (156, 3, 19);
INSERT INTO `role_module` VALUES (157, 4, 12);
INSERT INTO `role_module` VALUES (158, 4, 13);
INSERT INTO `role_module` VALUES (159, 4, 40);
INSERT INTO `role_module` VALUES (160, 4, 42);
INSERT INTO `role_module` VALUES (161, 4, 19);
INSERT INTO `role_module` VALUES (167, 15, 4);
INSERT INTO `role_module` VALUES (168, 15, 5);
INSERT INTO `role_module` VALUES (169, 15, 6);
INSERT INTO `role_module` VALUES (170, 15, 9);
INSERT INTO `role_module` VALUES (171, 15, 10);
INSERT INTO `role_module` VALUES (187, 16, 4);
INSERT INTO `role_module` VALUES (188, 16, 5);
INSERT INTO `role_module` VALUES (189, 16, 6);
INSERT INTO `role_module` VALUES (190, 16, 7);
INSERT INTO `role_module` VALUES (191, 16, 9);
INSERT INTO `role_module` VALUES (192, 16, 11);
INSERT INTO `role_module` VALUES (196, 17, 12);
INSERT INTO `role_module` VALUES (197, 17, 14);
INSERT INTO `role_module` VALUES (198, 17, 15);
INSERT INTO `role_module` VALUES (199, 17, 16);
INSERT INTO `role_module` VALUES (200, 17, 18);
INSERT INTO `role_module` VALUES (201, 17, 41);
INSERT INTO `role_module` VALUES (202, 18, 4);
INSERT INTO `role_module` VALUES (203, 18, 5);
INSERT INTO `role_module` VALUES (204, 19, 4);
INSERT INTO `role_module` VALUES (205, 19, 5);
INSERT INTO `role_module` VALUES (206, 19, 6);
INSERT INTO `role_module` VALUES (207, 19, 7);
INSERT INTO `role_module` VALUES (208, 20, 12);
INSERT INTO `role_module` VALUES (209, 20, 13);
INSERT INTO `role_module` VALUES (210, 20, 14);
INSERT INTO `role_module` VALUES (211, 20, 15);
INSERT INTO `role_module` VALUES (212, 20, 16);
INSERT INTO `role_module` VALUES (213, 20, 18);
INSERT INTO `role_module` VALUES (214, 20, 41);
INSERT INTO `role_module` VALUES (215, 20, 4);
INSERT INTO `role_module` VALUES (224, 21, 4);
INSERT INTO `role_module` VALUES (225, 21, 5);
INSERT INTO `role_module` VALUES (226, 21, 6);
INSERT INTO `role_module` VALUES (227, 21, 7);
INSERT INTO `role_module` VALUES (228, 21, 8);

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign`  (
  `sign_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login_time` timestamp(0) NULL DEFAULT NULL,
  `user_leave_time` timestamp(0) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sign_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES (1, '2019-05-23 08:51:07', '2019-05-23 08:57:32', 3);
INSERT INTO `sign` VALUES (2, '2019-05-23 08:51:40', '2019-05-23 08:57:32', 3);
INSERT INTO `sign` VALUES (3, '2019-05-23 08:53:39', '2019-05-23 08:57:32', 3);
INSERT INTO `sign` VALUES (4, '2019-05-23 09:02:37', '2019-05-23 09:04:02', 3);
INSERT INTO `sign` VALUES (5, '2019-05-23 09:02:46', '2019-05-23 09:04:02', 3);
INSERT INTO `sign` VALUES (6, '2019-05-23 09:04:56', '2019-05-23 09:05:53', 3);
INSERT INTO `sign` VALUES (7, '2019-05-23 09:45:07', '2019-05-23 09:53:14', 3);
INSERT INTO `sign` VALUES (8, '2019-05-23 18:49:41', '2019-05-23 18:49:50', 3);
INSERT INTO `sign` VALUES (9, '2019-05-24 10:46:41', NULL, 2);
INSERT INTO `sign` VALUES (10, '2019-05-24 11:01:20', '2019-05-24 11:01:56', 3);
INSERT INTO `sign` VALUES (11, '2019-05-24 11:04:45', NULL, 3);
INSERT INTO `sign` VALUES (12, '2019-05-24 12:24:28', NULL, 2);
INSERT INTO `sign` VALUES (13, '2019-05-24 12:24:37', NULL, 2);
INSERT INTO `sign` VALUES (14, '2019-05-26 20:08:37', NULL, 2);
INSERT INTO `sign` VALUES (15, '2019-05-26 20:27:32', NULL, 2);
INSERT INTO `sign` VALUES (16, '2019-05-26 20:32:08', NULL, 2);
INSERT INTO `sign` VALUES (17, '2019-05-26 20:33:41', NULL, 2);
INSERT INTO `sign` VALUES (18, '2019-05-26 20:34:37', NULL, 2);
INSERT INTO `sign` VALUES (19, '2019-05-26 20:35:38', NULL, 2);
INSERT INTO `sign` VALUES (20, '2019-05-26 20:43:34', NULL, 2);
INSERT INTO `sign` VALUES (21, '2019-05-26 20:43:42', NULL, 2);
INSERT INTO `sign` VALUES (22, '2019-05-26 20:45:12', NULL, 2);
INSERT INTO `sign` VALUES (23, '2019-05-29 22:48:51', '2019-05-29 22:48:53', 2);
INSERT INTO `sign` VALUES (24, '2019-05-29 22:49:13', NULL, 2);
INSERT INTO `sign` VALUES (25, '2019-05-30 00:22:40', '2019-05-30 09:45:07', 2);
INSERT INTO `sign` VALUES (26, '2019-05-30 09:19:00', NULL, 22);
INSERT INTO `sign` VALUES (27, '2019-05-31 08:35:42', NULL, 3);
INSERT INTO `sign` VALUES (28, '2019-05-31 08:45:24', NULL, 5);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_age` int(255) NULL DEFAULT NULL,
  `user_sex` int(1) NULL DEFAULT NULL,
  `user_creat_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_login_time` timestamp(0) NULL DEFAULT NULL COMMENT '签到时间',
  `user_end_time` timestamp(0) NULL DEFAULT NULL,
  `user_is_lock` int(11) NOT NULL DEFAULT 1,
  `user_wrong_number` int(11) NULL DEFAULT 0,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_status` int(255) NULL DEFAULT NULL,
  `user_weight` int(11) NULL DEFAULT NULL,
  `user_uuid` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `customer_num` int(11) NULL DEFAULT NULL COMMENT '用户数量',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', '24071169e049c0d683c4cb2985af4b29305a03a66291286e', '超级管理员', 27, 2, '2019-05-05 08:28:47', '2019-05-30 21:50:54', '2019-05-14 15:27:31', 1, 0, '11011@163.com', '13409237330', 2, 80, '7c1536c2-1fde-4b6c-919a-e2377511063b', NULL);
INSERT INTO `user` VALUES (2, 'csq', 'e5432080c29b57b24a16658b05613f41d150719a18e4b011', '陈小二', 24, 1, '2019-05-14 16:47:21', '2019-05-31 09:42:09', '2019-05-30 09:45:07', 1, 0, '2042543376@qq.com', '17630920882', 2, 80, '735522cb-412f-4166-9b15-def4105dedbd', NULL);
INSERT INTO `user` VALUES (3, 'sdc', 'e5432080c29b57b24a16658b05613f41d150719a18e4b011', '苏小二', 22, 1, '2019-05-14 17:02:34', '2019-05-31 08:35:42', '2019-05-28 11:35:09', 1, 0, '1046051269@163.com', '13874561452', 1, 80, 'ed9d9f6c-de77-4749-92a7-7698e15b1774', NULL);
INSERT INTO `user` VALUES (4, 'lkg', 'e5432080c29b57b24a16658b05613f41d150719a18e4b011', '李小二', 23, 2, '2019-05-15 20:13:38', '2019-05-29 19:42:38', NULL, 1, 0, '1045@qq.com', '12547894561', 2, 90, 'de92867a-968b-4c57-9ecd-893610144745', NULL);
INSERT INTO `user` VALUES (5, 'kk', 'e5432080c29b57b24a16658b05613f41d150719a18e4b011', 'kong', NULL, NULL, '2019-05-15 19:02:30', '2019-05-31 09:56:13', NULL, 1, 5, NULL, NULL, 1, 80, '7ea476c3-2166-4912-a4ad-320d008018c3', NULL);
INSERT INTO `user` VALUES (6, 'css', 'e5432080c29b57b24a16658b05613f41d150719a18e4b011', NULL, NULL, NULL, '2019-05-23 15:05:19', '2019-05-23 15:14:17', NULL, 1, 0, NULL, NULL, 2, 80, '3c707b91-bee5-4b1b-b9f0-ea5ca2595ffa', NULL);
INSERT INTO `user` VALUES (19, 'ceshi', 'b4e99262ea3e91d76510587bb56f09f96b0b23ee00f3d160', NULL, NULL, NULL, '2019-05-29 23:22:05', '2019-05-29 23:22:51', NULL, 1, 0, '3305210441@qq.com', '1340923733', 2, NULL, 'bc627f7d-2522-43e9-aa3c-8495fcfc2815', NULL);
INSERT INTO `user` VALUES (20, 'ceshi22', '79b90d22b06114e74259ad46933b09f7853900c88457d142', NULL, NULL, NULL, '2019-05-29 23:54:17', '2019-05-30 00:20:48', NULL, 1, 0, '3305210441@qq.com', '1340923734', 2, NULL, 'c137f068-39bb-4851-a44e-00ec8f798071', NULL);
INSERT INTO `user` VALUES (22, 'www', '342b2479b41368aa7306546fc9aa04a2eb3060718ba4f59d', NULL, NULL, NULL, '2019-05-30 09:17:34', '2019-05-30 09:19:00', NULL, 1, 0, 'root@qq.com', '13490237338', 2, NULL, '61dcce22-7cae-44fc-8810-f037f04618a1', NULL);
INSERT INTO `user` VALUES (29, 'lch', '670b48417325b19a4d48b98767a965f4a26ff02d56436b08', NULL, NULL, NULL, '2019-05-30 16:43:36', NULL, NULL, 1, 0, '13409237330@163.com', '13490237330', 2, NULL, NULL, NULL);
INSERT INTO `user` VALUES (30, 'wijoi', '674d3b00ad8666ae4d59050609f932d11f0f20fb7f553c69', 'ww', NULL, NULL, '2019-05-30 16:48:38', NULL, NULL, 1, 0, '13409237430@163.com', '13490237331', 2, NULL, NULL, NULL);
INSERT INTO `user` VALUES (31, 'lchss', '53bf8735472cf9748a029285b5636546a40cd6ad14e0dd03', '测试一', NULL, NULL, '2019-05-30 16:51:10', NULL, NULL, 1, 0, '13409237330@qq.com', '13409237339', 2, NULL, NULL, NULL);
INSERT INTO `user` VALUES (32, 'adminddd', 'b89c7c63da60984c9724a061c4ab01168d8198868ba4100c', 'riws', NULL, NULL, '2019-05-30 16:56:45', NULL, NULL, 1, 0, 'sdjfoi@qq.com', '13987548795', 2, NULL, NULL, NULL);
INSERT INTO `user` VALUES (33, 'ooo', '222a75560e46c9fe3f162b12f44a27447895565079d73555', 'www', NULL, NULL, '2019-05-30 17:01:41', NULL, NULL, 1, 0, 'sdjfossi@qq.com', '13490237328', 2, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_role_id`) USING BTREE,
  INDEX `user_role_user_id`(`user_id`) USING BTREE,
  INDEX `user_role_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 2);
INSERT INTO `user_role` VALUES (3, 3, 4);
INSERT INTO `user_role` VALUES (4, 4, 3);
INSERT INTO `user_role` VALUES (40, 5, 3);
INSERT INTO `user_role` VALUES (42, 19, 15);
INSERT INTO `user_role` VALUES (44, 20, 17);
INSERT INTO `user_role` VALUES (47, 22, 3);
INSERT INTO `user_role` VALUES (48, 31, 2);
INSERT INTO `user_role` VALUES (49, 31, 3);
INSERT INTO `user_role` VALUES (50, 31, 4);
INSERT INTO `user_role` VALUES (51, 33, 1);
INSERT INTO `user_role` VALUES (52, 33, 2);
INSERT INTO `user_role` VALUES (53, 33, 3);
INSERT INTO `user_role` VALUES (54, 33, 4);

-- ----------------------------
-- Table structure for usercust
-- ----------------------------
DROP TABLE IF EXISTS `usercust`;
CREATE TABLE `usercust`  (
  `user_cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_cust_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usercustomer
-- ----------------------------
DROP TABLE IF EXISTS `usercustomer`;
CREATE TABLE `usercustomer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NULL DEFAULT NULL,
  `CusId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for past_12_month_view
-- ----------------------------
DROP VIEW IF EXISTS `past_12_month_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `past_12_month_view` AS select date_format(curdate(),'%y-%m') AS `month` union select date_format((curdate() - interval 1 month),'%y-%m') AS `month` union select date_format((curdate() - interval 2 month),'%y-%m') AS `month` union select date_format((curdate() - interval 3 month),'%y-%m') AS `month` union select date_format((curdate() - interval 4 month),'%y-%m') AS `month` union select date_format((curdate() - interval 5 month),'%y-%m') AS `month`;

-- ----------------------------
-- Procedure structure for last6monthsdate
-- ----------------------------
DROP PROCEDURE IF EXISTS `last6monthsdate`;
delimiter ;;
CREATE PROCEDURE `last6monthsdate`()
BEGIN
		drop view if exists past_12_month_view;
		CREATE 
				ALGORITHM = UNDEFINED 
				DEFINER = `root`@`%` 
				SQL SECURITY DEFINER
		VIEW `past_12_month_view` AS
				SELECT DATE_FORMAT(CURDATE(), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 1 MONTH), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 2 MONTH), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 3 MONTH), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 4 MONTH), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 5 MONTH), '%y-%m') AS `month` ;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_userstatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_userstatus`;
delimiter ;;
CREATE PROCEDURE `update_userstatus`()
update user set user_status=2
;;
delimiter ;

-- ----------------------------
-- Procedure structure for user_wrong_numbers
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_wrong_numbers`;
delimiter ;;
CREATE PROCEDURE `user_wrong_numbers`()
begin
UPDATE `user` SET user_wrong_number=0 WHERE user_wrong_number<5;
end
;;
delimiter ;

-- ----------------------------
-- Event structure for last6monthsdatetimer
-- ----------------------------
DROP EVENT IF EXISTS `last6monthsdatetimer`;
delimiter ;;
CREATE EVENT `last6monthsdatetimer`
ON SCHEDULE
EVERY '1' MONTH STARTS '2019-06-01 01:00:00'
ON COMPLETION PRESERVE
DO BEGIN  
     CALL last6monthsdate();  
 END
;;
delimiter ;

-- ----------------------------
-- Event structure for timing_user_wrong_numbers
-- ----------------------------
DROP EVENT IF EXISTS `timing_user_wrong_numbers`;
delimiter ;;
CREATE EVENT `timing_user_wrong_numbers`
ON SCHEDULE
EVERY '1' DAY STARTS '2019-05-20 00:00:00'
ON COMPLETION PRESERVE
DO call user_wrong_numbers()
;;
delimiter ;

-- ----------------------------
-- Event structure for 定时签退
-- ----------------------------
DROP EVENT IF EXISTS `定时签退`;
delimiter ;;
CREATE EVENT `定时签退`
ON SCHEDULE
EVERY '1' DAY STARTS '2019-05-29 20:40:00'
DO call update_userstatus()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
