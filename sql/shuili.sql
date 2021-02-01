/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : sw

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 18/01/2021 09:00:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hy_device
-- ----------------------------
DROP TABLE IF EXISTS `hy_device`;
CREATE TABLE `hy_device`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `custom_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自定义名称',
  `device_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编号',
  `device_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备名称',
  `device_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `install_time` datetime(0) DEFAULT NULL COMMENT '安装时间',
  `energy` int(10) DEFAULT NULL COMMENT '电量值',
  `width` double(10, 0) DEFAULT NULL COMMENT '宽度',
  `height` double(10, 0) DEFAULT NULL COMMENT '高度',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经纬度',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `the_signal_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '信号值',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hy_device
-- ----------------------------
INSERT INTO `hy_device` VALUES ('71b5648b29de2905a7546d416b160889', '河道', 'wl2000057', '河道三号', '正常', '2021-01-12 00:00:00', 90, 6, 6, '111.07861161, 30.87063431', 'admin', '2021-01-13 09:03:18', '2021-01-13 09:07:35', 'admin', '90', NULL);
INSERT INTO `hy_device` VALUES ('c69868df80f58fc634c1e31e4572e41b', '水库', 'wl2000061', '板门溪水库一号', '正常', '2021-01-12 00:00:00', 80, 8, 6, '111.07629418, 30.86829523', 'admin', '2021-01-13 09:02:50', '2021-01-13 09:11:21', 'admin', '60', NULL);
INSERT INTO `hy_device` VALUES ('eb30626aea76a1ba5e0b9715ac9dbae1', '河道', 'wl2000051', '河道一号', '正常', '2021-01-12 00:00:00', 90, 9, 8, '111.07838631, 30.86439971', 'admin', '2021-01-13 09:03:58', '2021-01-13 09:05:49', 'admin', '90', NULL);
INSERT INTO `hy_device` VALUES ('ebd9be1d601173ae66cb4f028481df50', '河道', 'wl2000060', '河道四号', '正常', '2021-01-12 00:00:00', 60, 8, 6, '111.09490871, 30.85911334', 'admin', '2021-01-13 09:03:02', '2021-01-13 09:08:42', 'admin', '80', NULL);

-- ----------------------------
-- Table structure for hy_monitor
-- ----------------------------
DROP TABLE IF EXISTS `hy_monitor`;
CREATE TABLE `hy_monitor`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_name` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备名称',
  `device_alias` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备名称',
  `water_level_height` double(10, 4) DEFAULT NULL COMMENT '水位高度',
  `flow` double(10, 4) DEFAULT NULL COMMENT '流量',
  `flow_time` datetime(0) DEFAULT NULL COMMENT '时间',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新人',
  `update_by` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hy_monitor
-- ----------------------------
INSERT INTO `hy_monitor` VALUES ('1', 'test', '黄粮镇-01', 1.0000, 1.0000, '2021-01-15 00:03:39', '2021-01-15 00:03:39', 'admin', '2021-01-15 00:03:39', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('10', 'test', '黄粮镇-01', 3.0000, 3.0000, '2021-01-15 00:48:48', '2021-01-15 00:48:48', 'admin', '2021-01-15 00:48:48', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('11', 'test', '黄粮镇-01', 2.0000, 2.0000, '2021-01-15 00:54:32', '2021-01-15 00:54:32', 'admin', '2021-01-15 00:54:32', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('12', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 00:59:33', '2021-01-15 00:59:33', 'admin', '2021-01-15 00:59:33', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('13', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 01:04:34', '2021-01-15 01:04:34', 'admin', '2021-01-15 01:04:34', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('14', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 01:09:35', '2021-01-15 01:09:35', 'admin', '2021-01-15 01:09:35', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('15', 'test', '黄粮镇-01', 8.0000, 8.0000, '2021-01-15 01:14:36', '2021-01-15 01:14:36', 'admin', '2021-01-15 01:14:36', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('16', 'test', '黄粮镇-01', 4.0000, 4.0000, '2021-01-15 01:19:37', '2021-01-15 01:19:37', 'admin', '2021-01-15 01:19:37', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('17', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 01:24:38', '2021-01-15 01:24:38', 'admin', '2021-01-15 01:24:38', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('18', 'test', '黄粮镇-01', 0.0000, 0.0000, '2021-01-15 01:29:39', '2021-01-15 01:29:39', 'admin', '2021-01-15 01:29:39', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('19', 'test', '黄粮镇-01', 8.0000, 8.0000, '2021-01-15 01:34:40', '2021-01-15 01:34:40', 'admin', '2021-01-15 01:34:40', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('2', 'test', '黄粮镇-01', 2.0000, 2.0000, '2021-01-15 00:08:40', '2021-01-15 00:08:40', 'admin', '2021-01-15 00:08:40', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('20', 'test', '黄粮镇-01', 0.0000, 0.0000, '2021-01-15 01:39:41', '2021-01-15 01:39:41', 'admin', '2021-01-15 01:39:41', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('21', 'test', '黄粮镇-01', 2.0000, 2.0000, '2021-01-15 01:44:42', '2021-01-15 01:44:42', 'admin', '2021-01-15 01:44:42', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('22', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 01:49:43', '2021-01-15 01:49:43', 'admin', '2021-01-15 01:49:43', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('23', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 01:55:19', '2021-01-15 01:55:19', 'admin', '2021-01-15 01:55:19', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('24', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 02:00:20', '2021-01-15 02:00:20', 'admin', '2021-01-15 02:00:20', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('25', 'test', '黄粮镇-01', 4.0000, 4.0000, '2021-01-15 02:05:21', '2021-01-15 02:05:21', 'admin', '2021-01-15 02:05:21', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('26', 'test', '黄粮镇-01', 1.0000, 1.0000, '2021-01-15 02:10:22', '2021-01-15 02:10:22', 'admin', '2021-01-15 02:10:22', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('27', 'test', '黄粮镇-01', 4.0000, 4.0000, '2021-01-15 02:15:23', '2021-01-15 02:15:23', 'admin', '2021-01-15 02:15:23', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('28', 'test', '黄粮镇-01', 3.0000, 3.0000, '2021-01-15 02:20:24', '2021-01-15 02:20:24', 'admin', '2021-01-15 02:20:24', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('29', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 02:25:25', '2021-01-15 02:25:25', 'admin', '2021-01-15 02:25:25', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('3', 'test', '黄粮镇-01', 4.0000, 4.0000, '2021-01-15 00:13:41', '2021-01-15 00:13:41', 'admin', '2021-01-15 00:13:41', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('30', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 02:30:26', '2021-01-15 02:30:26', 'admin', '2021-01-15 02:30:26', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('31', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 02:35:27', '2021-01-15 02:35:27', 'admin', '2021-01-15 02:35:27', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('32', 'test', '黄粮镇-01', 2.0000, 2.0000, '2021-01-15 02:40:28', '2021-01-15 02:40:28', 'admin', '2021-01-15 02:40:28', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('33', 'test', '黄粮镇-01', 1.0000, 1.0000, '2021-01-15 02:45:29', '2021-01-15 02:45:29', 'admin', '2021-01-15 02:45:29', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('34', 'test', '黄粮镇-01', 0.0000, 0.0000, '2021-01-15 02:50:30', '2021-01-15 02:50:30', 'admin', '2021-01-15 02:50:30', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('35', 'test', '黄粮镇-01', 5.0000, 5.0000, '2021-01-15 02:56:13', '2021-01-15 02:56:13', 'admin', '2021-01-15 02:56:13', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('36', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 03:01:14', '2021-01-15 03:01:14', 'admin', '2021-01-15 03:01:14', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('37', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 03:06:15', '2021-01-15 03:06:15', 'admin', '2021-01-15 03:06:15', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('38', 'test', '黄粮镇-01', 4.0000, 4.0000, '2021-01-15 03:11:16', '2021-01-15 03:11:16', 'admin', '2021-01-15 03:11:16', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('39', 'test', '黄粮镇-01', 2.0000, 2.0000, '2021-01-15 03:16:17', '2021-01-15 03:16:17', 'admin', '2021-01-15 03:16:17', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('4', 'test', '黄粮镇-01', 3.0000, 3.0000, '2021-01-15 00:18:42', '2021-01-15 00:18:42', 'admin', '2021-01-15 00:18:42', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('40', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 03:21:18', '2021-01-15 03:21:18', 'admin', '2021-01-15 03:21:18', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('41', 'test', '黄粮镇-01', 8.0000, 8.0000, '2021-01-15 03:26:19', '2021-01-15 03:26:19', 'admin', '2021-01-15 03:26:19', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('42', 'test', '黄粮镇-01', 8.0000, 8.0000, '2021-01-15 03:31:20', '2021-01-15 03:31:20', 'admin', '2021-01-15 03:31:20', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('43', 'test', '黄粮镇-01', 5.0000, 5.0000, '2021-01-15 03:36:21', '2021-01-15 03:36:21', 'admin', '2021-01-15 03:36:21', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('44', 'test', '黄粮镇-01', 4.0000, 4.0000, '2021-01-15 03:41:22', '2021-01-15 03:41:22', 'admin', '2021-01-15 03:41:22', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('45', 'test', '黄粮镇-01', 0.0000, 0.0000, '2021-01-15 03:46:23', '2021-01-15 03:46:23', 'admin', '2021-01-15 03:46:23', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('46', 'test', '黄粮镇-01', 2.0000, 2.0000, '2021-01-15 03:51:24', '2021-01-15 03:51:24', 'admin', '2021-01-15 03:51:24', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('47', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 03:56:59', '2021-01-15 03:56:59', 'admin', '2021-01-15 03:56:59', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('48', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 04:02:00', '2021-01-15 04:02:00', 'admin', '2021-01-15 04:02:00', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('49', 'test', '黄粮镇-01', 2.0000, 2.0000, '2021-01-15 04:07:01', '2021-01-15 04:07:01', 'admin', '2021-01-15 04:07:01', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('5', 'test', '黄粮镇-01', 5.0000, 5.0000, '2021-01-15 00:23:43', '2021-01-15 00:23:43', 'admin', '2021-01-15 00:23:43', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('50', 'test', '黄粮镇-01', 1.0000, 1.0000, '2021-01-15 04:12:02', '2021-01-15 04:12:02', 'admin', '2021-01-15 04:12:02', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('51', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 04:17:03', '2021-01-15 04:17:03', 'admin', '2021-01-15 04:17:03', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('52', 'test', '黄粮镇-01', 5.0000, 5.0000, '2021-01-15 04:22:04', '2021-01-15 04:22:04', 'admin', '2021-01-15 04:22:04', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('53', 'test', '黄粮镇-01', 4.0000, 4.0000, '2021-01-15 04:27:05', '2021-01-15 04:27:05', 'admin', '2021-01-15 04:27:05', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('54', 'test', '黄粮镇-01', 8.0000, 8.0000, '2021-01-15 04:32:06', '2021-01-15 04:32:06', 'admin', '2021-01-15 04:32:06', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('55', 'test', '黄粮镇-01', 3.0000, 3.0000, '2021-01-15 04:37:07', '2021-01-15 04:37:07', 'admin', '2021-01-15 04:37:07', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('56', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 04:42:08', '2021-01-15 04:42:08', 'admin', '2021-01-15 04:42:08', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('57', 'test', '黄粮镇-01', 1.0000, 1.0000, '2021-01-15 04:47:09', '2021-01-15 04:47:09', 'admin', '2021-01-15 04:47:09', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('58', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 04:52:10', '2021-01-15 04:52:10', 'admin', '2021-01-15 04:52:10', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('59', 'test', '黄粮镇-01', 9.0000, 9.0000, '2021-01-15 04:57:55', '2021-01-15 04:57:55', 'admin', '2021-01-15 04:57:55', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('6', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 00:28:44', '2021-01-15 00:28:44', 'admin', '2021-01-15 00:28:44', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('60', 'test', '黄粮镇-01', 3.0000, 3.0000, '2021-01-15 05:02:56', '2021-01-15 05:02:56', 'admin', '2021-01-15 05:02:56', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('61', 'test', '黄粮镇-01', 1.0000, 1.0000, '2021-01-15 05:07:57', '2021-01-15 05:07:57', 'admin', '2021-01-15 05:07:57', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('62', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 05:12:58', '2021-01-15 05:12:58', 'admin', '2021-01-15 05:12:58', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('63', 'test', '黄粮镇-01', 8.0000, 8.0000, '2021-01-15 05:17:59', '2021-01-15 05:17:59', 'admin', '2021-01-15 05:17:59', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('64', 'test', '黄粮镇-01', 3.0000, 3.0000, '2021-01-15 05:23:00', '2021-01-15 05:23:00', 'admin', '2021-01-15 05:23:00', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('65', 'test', '黄粮镇-01', 2.0000, 2.0000, '2021-01-15 05:28:01', '2021-01-15 05:28:01', 'admin', '2021-01-15 05:28:01', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('66', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 05:33:02', '2021-01-15 05:33:02', 'admin', '2021-01-15 05:33:02', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('67', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 05:38:03', '2021-01-15 05:38:03', 'admin', '2021-01-15 05:38:03', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('68', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 05:43:04', '2021-01-15 05:43:04', 'admin', '2021-01-15 05:43:04', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('69', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 05:48:05', '2021-01-15 05:48:05', 'admin', '2021-01-15 05:48:05', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('7', 'test', '黄粮镇-01', 8.0000, 8.0000, '2021-01-15 00:33:45', '2021-01-15 00:33:45', 'admin', '2021-01-15 00:33:45', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('70', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 05:53:06', '2021-01-15 05:53:06', 'admin', '2021-01-15 05:53:06', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('71', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 05:58:52', '2021-01-15 05:58:52', 'admin', '2021-01-15 05:58:52', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('72', 'test', '黄粮镇-01', 3.0000, 3.0000, '2021-01-15 06:03:53', '2021-01-15 06:03:53', 'admin', '2021-01-15 06:03:53', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('73', 'test', '黄粮镇-01', 0.0000, 0.0000, '2021-01-15 06:08:54', '2021-01-15 06:08:54', 'admin', '2021-01-15 06:08:54', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('74', 'test', '黄粮镇-01', 7.0000, 7.0000, '2021-01-15 06:13:55', '2021-01-15 06:13:55', 'admin', '2021-01-15 06:13:55', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('75', 'test', '黄粮镇-01', 0.0000, 0.0000, '2021-01-15 06:18:56', '2021-01-15 06:18:56', 'admin', '2021-01-15 06:18:56', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('76', 'test', '黄粮镇-01', 8.0000, 8.0000, '2021-01-15 06:23:57', '2021-01-15 06:23:57', 'admin', '2021-01-15 06:23:57', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('77', 'test', '黄粮镇-01', 6.0000, 6.0000, '2021-01-15 06:28:58', '2021-01-15 06:28:58', 'admin', '2021-01-15 06:28:58', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('8', 'test', '黄粮镇-01', 5.0000, 5.0000, '2021-01-15 00:38:46', '2021-01-15 00:38:46', 'admin', '2021-01-15 00:38:46', 'admin', '1');
INSERT INTO `hy_monitor` VALUES ('9', 'test', '黄粮镇-01', 4.0000, 4.0000, '2021-01-15 00:43:47', '2021-01-15 00:43:47', 'admin', '2021-01-15 00:43:47', 'admin', '1');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176F4AA6F387870707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176F4AA6F387870707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000176F4AA6F387870707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'Y7Q3AT5RWD7FU4T1610930888303', 1610931356588, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1610930890000, -1, 5, 'PAUSED', 'CRON', 1610930888000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1610930895000, -1, 5, 'PAUSED', 'CRON', 1610930888000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1610930900000, -1, 5, 'PAUSED', 'CRON', 1610930888000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-01-12 11:36:19', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-01-12 11:36:19', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-01-12 11:36:19', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-01-12 11:36:19', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-01-12 11:36:19', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-01-12 11:36:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2021-01-12 11:40:44');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-12 11:43:39');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 11:50:21');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 11:55:25');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 13:10:30');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 13:45:03');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 13:52:34');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-12 14:14:02');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 14:55:05');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 15:00:29');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 15:02:29');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 15:50:25');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-12 16:58:25');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 16:59:06');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-12 19:44:22');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-12 19:46:06');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-13 08:37:04');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-13 09:58:48');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-13 13:55:46');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-13 14:52:45');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-13 15:53:02');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-14 08:45:57');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-14 09:45:26');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 09:54:40');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 10:12:44');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 10:24:34');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 10:45:09');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 15:02:07');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 17:20:05');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-15 08:51:06');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-15 13:40:29');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-01-18 08:50:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-01-12 11:36:18', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-01-12 11:36:18', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-01-12 11:36:18', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2021-01-12 11:36:18', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-01-12 11:36:18', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-01-12 11:36:18', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-01-12 11:36:18', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-01-12 11:36:18', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-01-12 11:36:18', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-01-12 11:36:18', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-01-12 11:36:18', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-01-12 11:36:18', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-01-12 11:36:18', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-01-12 11:36:18', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-01-12 11:36:18', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-01-12 11:36:18', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-01-12 11:36:18', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-01-12 11:36:18', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-01-12 11:36:18', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-01-12 11:36:18', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-01-12 11:36:18', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-01-12 11:36:18', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-01-12 11:36:18', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '设备管理', 0, 2, 'device', NULL, 1, 0, 'M', '0', '0', NULL, 'clipboard', 'admin', '2021-01-12 11:45:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '设备列表', 2000, 1, 'device', 'hydrology/device/index', 1, 0, 'C', '0', '0', 'hydrology/device/list', 'dashboard', 'admin', '2021-01-12 11:46:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '设备监控', 0, 3, 'monitoring', NULL, 1, 0, 'M', '0', '0', NULL, 'monitor', 'admin', '2021-01-12 15:08:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '设备监控', 2002, 1, 'monitoring', 'hydrology/monitoring/index', 1, 0, 'C', '0', '0', 'hydrology:monitoring:list', 'validCode', 'admin', '2021-01-12 15:09:53', 'admin', '2021-01-13 08:47:34', '');
INSERT INTO `sys_menu` VALUES (2004, '流量监控', 0, 2, 'flowmonitor', 'hydrology/flowmonitor/index', 1, 0, 'C', '0', '0', 'hydrology:flowmonitor:list', 'component', 'admin', '2021-01-14 16:11:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-01-12 11:36:19', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-01-12 11:36:19', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"2\",\"menuName\":\"设备管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"device\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 11:45:17');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"1\",\"menuName\":\"设备列表\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"hydrology/device/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"hydrology/device/list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 11:46:26');
INSERT INTO `sys_oper_log` VALUES (102, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"11\",\"customName\":\"1111\",\"deviceCode\":\"11\",\"installTime\":1609344000000,\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":0,\"createBy\":\"admin\",\"createTime\":1610433660367,\"width\":\"11\",\"id\":\"0f15876325a603e482a2457ceda2201d\",\"energy\":\"111\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'the_signal_value\' in \'field list\'\r\n### The error may exist in com/ruoyi/web/hydrology/mapper/DeviceMapper.java (best guess)\r\n### The error may involve com.ruoyi.web.hydrology.mapper.DeviceMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO hy_device  ( id, custom_name, device_code, device_name, device_status, install_time, the_signal_value, energy, width,   create_by, create_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?,   ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'the_signal_value\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'the_signal_value\' in \'field list\'', '2021-01-12 14:41:01');
INSERT INTO `sys_oper_log` VALUES (103, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"11\",\"customName\":\"1111\",\"deviceCode\":\"11\",\"installTime\":1609344000000,\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":0,\"createBy\":\"admin\",\"createTime\":1610433673033,\"width\":\"11\",\"id\":\"0f15876325a603e482a2457ceda2201d\",\"energy\":\"111\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'the_signal_value\' in \'field list\'\r\n### The error may exist in com/ruoyi/web/hydrology/mapper/DeviceMapper.java (best guess)\r\n### The error may involve com.ruoyi.web.hydrology.mapper.DeviceMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO hy_device  ( id, custom_name, device_code, device_name, device_status, install_time, the_signal_value, energy, width,   create_by, create_time )  VALUES  ( ?, ?, ?, ?, ?, ?, ?, ?, ?,   ?, ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'the_signal_value\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'the_signal_value\' in \'field list\'', '2021-01-12 14:41:13');
INSERT INTO `sys_oper_log` VALUES (104, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"11\",\"customName\":\"11\",\"deviceCode\":\"1111\",\"installTime\":1610467200000,\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":0,\"createBy\":\"admin\",\"createTime\":1610433943834,\"width\":\"111\",\"location\":\"30.732411,111.206789\",\"id\":\"25377a67f88fd67cf893e83ab107f6ec\",\"energy\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 14:45:43');
INSERT INTO `sys_oper_log` VALUES (105, '客户数据', 3, 'com.ruoyi.web.hydrology.controller.DeviceController.remove()', 'DELETE', 1, 'admin', NULL, '/hydrology/device/25377a67f88fd67cf893e83ab107f6ec', '127.0.0.1', '内网IP', '{ids=25377a67f88fd67cf893e83ab107f6ec}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 14:45:50');
INSERT INTO `sys_oper_log` VALUES (106, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"70\",\"customName\":\"山区\",\"deviceCode\":\"wl100001\",\"installTime\":1609776000000,\"params\":{},\"deviceName\":\"70\",\"deviceStatus\":0,\"createBy\":\"admin\",\"createTime\":1610434021694,\"width\":\"5\",\"location\":\"30.732411,111.206789\",\"id\":\"5675a513030c42b83fe4ef22620ae47d\",\"energy\":\"20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 14:47:01');
INSERT INTO `sys_oper_log` VALUES (107, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"customName\":\"11\",\"deviceCode\":\"11\",\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":0,\"createBy\":\"admin\",\"createTime\":1610434235537,\"id\":\"92fea810c8a52d304706c959278e6a46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 14:50:35');
INSERT INTO `sys_oper_log` VALUES (108, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"customName\":\"111\",\"deviceCode\":\"123213\",\"params\":{},\"deviceName\":\"12321\",\"deviceStatus\":0,\"createBy\":\"admin\",\"createTime\":1610434269163,\"id\":\"7b473083d0064151e14626c36df58d0d\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 14:51:09');
INSERT INTO `sys_oper_log` VALUES (109, '客户数据', 3, 'com.ruoyi.web.hydrology.controller.DeviceController.remove()', 'DELETE', 1, 'admin', NULL, '/hydrology/device/92fea810c8a52d304706c959278e6a46', '127.0.0.1', '内网IP', '{ids=92fea810c8a52d304706c959278e6a46}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-01-12 14:54:45');
INSERT INTO `sys_oper_log` VALUES (110, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"customName\":\"21312\",\"deviceCode\":\"12312\",\"params\":{},\"deviceName\":\"123123\",\"deviceStatus\":0,\"createBy\":\"admin\",\"createTime\":1610434485405,\"id\":\"7da60ea4f9924ef9c445cb483e2c5420\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 14:54:45');
INSERT INTO `sys_oper_log` VALUES (111, '客户数据', 3, 'com.ruoyi.web.hydrology.controller.DeviceController.remove()', 'DELETE', 1, 'admin', NULL, '/hydrology/device/7b473083d0064151e14626c36df58d0d', '127.0.0.1', '内网IP', '{ids=7b473083d0064151e14626c36df58d0d}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-01-12 14:54:45');
INSERT INTO `sys_oper_log` VALUES (112, '客户数据', 3, 'com.ruoyi.web.hydrology.controller.DeviceController.remove()', 'DELETE', 1, 'admin', NULL, '/hydrology/device/5675a513030c42b83fe4ef22620ae47d', '127.0.0.1', '内网IP', '{ids=5675a513030c42b83fe4ef22620ae47d}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 14:55:27');
INSERT INTO `sys_oper_log` VALUES (113, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"80\",\"customName\":\"山区\",\"deviceCode\":\"wl2000052\",\"installTime\":1609344000000,\"params\":{},\"deviceName\":\"一号\",\"deviceStatus\":0,\"createBy\":\"admin\",\"createTime\":1610434588502,\"width\":\"5\",\"location\":\"30.728565,111.240134\",\"id\":\"536ef43dd2d14bfe31baf02a3c646c86\",\"energy\":\"80\",\"height\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 14:56:28');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"3\",\"menuName\":\"设备监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitoring\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 15:08:40');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"validCode\",\"orderNum\":\"1\",\"menuName\":\"设备监控\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"monitoring\",\"component\":\"hydrology/monitoring/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"hydrology:monitoring:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 15:09:53');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"validCode\",\"orderNum\":\"1\",\"menuName\":\"设备监控\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"device\",\"component\":\"hydrology/device/index\",\"children\":[],\"createTime\":1610435393000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"hydrology:device:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-12 19:46:55');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"validCode\",\"orderNum\":\"1\",\"menuName\":\"设备监控\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"devices\",\"component\":\"hydrology/devices/index\",\"children\":[],\"createTime\":1610435393000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"hydrology:devices:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 08:47:15');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"validCode\",\"orderNum\":\"1\",\"menuName\":\"设备监控\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"monitoring\",\"component\":\"hydrology/monitoring/index\",\"children\":[],\"createTime\":1610435393000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"hydrology:monitoring:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 08:47:34');
INSERT INTO `sys_oper_log` VALUES (119, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"河边\",\"updateTime\":1610499547327,\"deviceCode\":\"wl2000053\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河渠一号\",\"deviceStatus\":\"正常\",\"updateBy\":\"admin\",\"width\":\"6\",\"location\":\"30.778031,111.261967\",\"id\":\"c389ebd897e87db54c0b9c701ac63b06\",\"energy\":\"80\",\"height\":\"5\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-01-13 08:59:07');
INSERT INTO `sys_oper_log` VALUES (120, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"河边\",\"updateTime\":1610499552035,\"deviceCode\":\"wl2000053\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河渠一号\",\"deviceStatus\":\"正常\",\"updateBy\":\"admin\",\"width\":\"6\",\"location\":\"30.778031,111.261967\",\"id\":\"c389ebd897e87db54c0b9c701ac63b06\",\"energy\":\"80\",\"height\":\"5\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-01-13 08:59:12');
INSERT INTO `sys_oper_log` VALUES (121, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"河边\",\"updateTime\":1610499564522,\"deviceCode\":\"wl2000053\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河渠一号\",\"deviceStatus\":\"正常\",\"updateBy\":\"admin\",\"width\":\"6\",\"location\":\"30.778031,111.261967\",\"id\":\"c389ebd897e87db54c0b9c701ac63b06\",\"energy\":\"80\",\"height\":\"5\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-01-13 08:59:24');
INSERT INTO `sys_oper_log` VALUES (122, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"\",\"customName\":\"河边\",\"updateTime\":1610499580864,\"deviceCode\":\"wl2000053\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河渠一号\",\"deviceStatus\":\"正常\",\"updateBy\":\"admin\",\"width\":\"\",\"location\":\"\",\"id\":\"c389ebd897e87db54c0b9c701ac63b06\",\"energy\":\"\",\"height\":\"\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-01-13 08:59:40');
INSERT INTO `sys_oper_log` VALUES (123, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"11\",\"customName\":\"11\",\"updateTime\":1610499642307,\"deviceCode\":\"11\",\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":\"正常\",\"updateBy\":\"admin\",\"id\":\"19198d4e9b74beb65a7e27d2b484d768\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-01-13 09:00:42');
INSERT INTO `sys_oper_log` VALUES (124, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"customName\":\"11\",\"deviceCode\":\"11\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1610499769663,\"id\":\"c69868df80f58fc634c1e31e4572e41b\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:02:49');
INSERT INTO `sys_oper_log` VALUES (125, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"customName\":\"11\",\"deviceCode\":\"11\",\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":\"离线\",\"createBy\":\"admin\",\"createTime\":1610499782134,\"id\":\"ebd9be1d601173ae66cb4f028481df50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:03:02');
INSERT INTO `sys_oper_log` VALUES (126, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"11\",\"deviceCode\":\"11\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499798252,\"id\":\"71b5648b29de2905a7546d416b160889\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:03:18');
INSERT INTO `sys_oper_log` VALUES (127, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"11\",\"deviceCode\":\"11\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499814928,\"width\":\"6\",\"id\":\"6252e8924c8b7a50c08e1f645a824520\",\"energy\":\"90\",\"height\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:03:34');
INSERT INTO `sys_oper_log` VALUES (128, '设备信息', 1, 'com.ruoyi.web.hydrology.controller.DeviceController.add()', 'POST', 1, 'admin', NULL, '/hydrology/device/add', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"11\",\"deviceCode\":\"11\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"11\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499837913,\"width\":\"9\",\"location\":\"30.778031,111.261967\",\"id\":\"eb30626aea76a1ba5e0b9715ac9dbae1\",\"energy\":\"90\",\"height\":\"8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:03:57');
INSERT INTO `sys_oper_log` VALUES (129, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"河道\",\"updateTime\":1610499867537,\"deviceCode\":\"wl2000051\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河道一号\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499838000,\"updateBy\":\"admin\",\"width\":\"9.0\",\"location\":\"30.778031,111.261967\",\"id\":\"eb30626aea76a1ba5e0b9715ac9dbae1\",\"energy\":\"90\",\"height\":\"8.0\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'update_by\' at row 1\r\n### The error may exist in com/ruoyi/web/hydrology/mapper/DeviceMapper.java (best guess)\r\n### The error may involve com.ruoyi.web.hydrology.mapper.DeviceMapper.updateById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: UPDATE hy_device  SET custom_name=?, device_code=?, device_name=?, device_status=?, install_time=?, the_signal_value=?, energy=?, width=?, height=?, location=?, create_by=?, create_time=?, update_by=?, update_time=?  WHERE id=?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'update_by\' at row 1\n; Data truncation: Data too long for column \'update_by\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'update_by\' at row 1', '2021-01-13 09:04:27');
INSERT INTO `sys_oper_log` VALUES (130, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"河道\",\"updateTime\":1610499949089,\"deviceCode\":\"wl2000051\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河道一号\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499838000,\"updateBy\":\"admin\",\"width\":\"9.0\",\"location\":\"30.778031,111.261967\",\"id\":\"eb30626aea76a1ba5e0b9715ac9dbae1\",\"energy\":\"90\",\"height\":\"8.0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:05:49');
INSERT INTO `sys_oper_log` VALUES (131, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"河道\",\"updateTime\":1610500008992,\"deviceCode\":\"wl2000056\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河道二号\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499815000,\"updateBy\":\"admin\",\"width\":\"6.0\",\"location\":\"30.775059,111.263523\",\"id\":\"6252e8924c8b7a50c08e1f645a824520\",\"energy\":\"90\",\"height\":\"6.0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:06:49');
INSERT INTO `sys_oper_log` VALUES (132, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"90\",\"customName\":\"河道\",\"updateTime\":1610500054968,\"deviceCode\":\"wl2000057\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河道三号\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499798000,\"updateBy\":\"admin\",\"width\":\"6\",\"location\":\"30.778709,111.260063\",\"id\":\"71b5648b29de2905a7546d416b160889\",\"energy\":\"90\",\"height\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:07:34');
INSERT INTO `sys_oper_log` VALUES (133, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"80\",\"customName\":\"河道\",\"updateTime\":1610500100631,\"deviceCode\":\"wl2000060\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河道四号\",\"deviceStatus\":\"离线\",\"createBy\":\"admin\",\"createTime\":1610499782000,\"updateBy\":\"admin\",\"width\":\"8\",\"location\":\"30.779686,111.260186\",\"id\":\"ebd9be1d601173ae66cb4f028481df50\",\"energy\":\"60\",\"height\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:08:20');
INSERT INTO `sys_oper_log` VALUES (134, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"80\",\"customName\":\"河道\",\"updateTime\":1610500121885,\"deviceCode\":\"wl2000060\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"河道四号\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499782000,\"updateBy\":\"admin\",\"width\":\"8.0\",\"location\":\"30.779686,111.260186\",\"id\":\"ebd9be1d601173ae66cb4f028481df50\",\"energy\":\"60\",\"height\":\"6.0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:08:41');
INSERT INTO `sys_oper_log` VALUES (135, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"60\",\"customName\":\"水库\",\"updateTime\":1610500194534,\"deviceCode\":\"wl2000061\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"xx水库一号\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499770000,\"updateBy\":\"admin\",\"width\":\"8\",\"location\":\"30.789322,111.261356\",\"id\":\"c69868df80f58fc634c1e31e4572e41b\",\"energy\":\"80\",\"height\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:09:54');
INSERT INTO `sys_oper_log` VALUES (136, '设备信息', 2, 'com.ruoyi.web.hydrology.controller.DeviceController.edit()', 'PUT', 1, 'admin', NULL, '/hydrology/device/edit', '127.0.0.1', '内网IP', '{\"theSignalValue\":\"60\",\"customName\":\"水库\",\"updateTime\":1610500280934,\"deviceCode\":\"wl2000061\",\"installTime\":1610380800000,\"params\":{},\"deviceName\":\"板门溪水库一号\",\"deviceStatus\":\"正常\",\"createBy\":\"admin\",\"createTime\":1610499770000,\"updateBy\":\"admin\",\"width\":\"8.0\",\"location\":\"30.539939,111.534877\",\"id\":\"c69868df80f58fc634c1e31e4572e41b\",\"energy\":\"80\",\"height\":\"6.0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 09:11:20');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"component\",\"orderNum\":\"2\",\"menuName\":\"流量监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"flowmonitor\",\"component\":\"hydrology/flowmonitor/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"hydrology:flowmonitor:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 16:11:16');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-01-12 11:36:18', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-01-12 11:36:18', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-01-12 11:36:18', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-01-12 11:36:18', 'admin', '2021-01-12 11:36:18', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-01-12 11:36:18', 'admin', '2021-01-12 11:36:18', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
