/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : fresh

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 04/01/2024 23:47:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addrinfo
-- ----------------------------
DROP TABLE IF EXISTS `addrinfo`;
CREATE TABLE `addrinfo`  (
  `ano` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `mno` int NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tel` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `province` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `area` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `addr` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `flag` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`ano`) USING BTREE,
  INDEX `FK_addrInfo_mno`(`mno` ASC) USING BTREE,
  CONSTRAINT `FK_addrInfo_mno` FOREIGN KEY (`mno`) REFERENCES `memberinfo` (`mno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of addrinfo
-- ----------------------------
INSERT INTO `addrinfo` VALUES ('1', 1, '1', '1', '1', '1', '1', '1', 1, 1);
INSERT INTO `addrinfo` VALUES ('1703938430938', 3, 'duck', '157****2275', '内蒙古自治区', '呼和浩特市', '玉泉区', '阿三大苏打', 1, 1);

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo`  (
  `aid` int NOT NULL AUTO_INCREMENT,
  `aname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `pwd` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tel` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE INDEX `aname`(`aname` ASC) USING BTREE,
  UNIQUE INDEX `tel`(`tel` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES (1, 'navy', 'e10adc3949ba59abbe56e057f20f883e', '15096098010');
INSERT INTO `admininfo` VALUES (2, 'test', 'e10adc3949ba59abbe56e057f20f883e', '15900000000');

-- ----------------------------
-- Table structure for cartinfo
-- ----------------------------
DROP TABLE IF EXISTS `cartinfo`;
CREATE TABLE `cartinfo`  (
  `cno` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `mno` int NULL DEFAULT NULL,
  `gno` int NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  PRIMARY KEY (`cno`) USING BTREE,
  INDEX `FK_cartInfo_mno`(`mno` ASC) USING BTREE,
  INDEX `FK_cartInfo_gno`(`gno` ASC) USING BTREE,
  CONSTRAINT `FK_cartInfo_gno` FOREIGN KEY (`gno`) REFERENCES `goodsinfo` (`gno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_cartInfo_mno` FOREIGN KEY (`mno`) REFERENCES `memberinfo` (`mno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cartinfo
-- ----------------------------
INSERT INTO `cartinfo` VALUES ('11', 1, 2, 6);
INSERT INTO `cartinfo` VALUES ('12', 1, 5, 4);
INSERT INTO `cartinfo` VALUES ('21e1beaa84c04f66a63417a4a20b71a7', 3, 5, 1);
INSERT INTO `cartinfo` VALUES ('366c0b3836dc4774a11228a359ced9de', 1, 1, 4);
INSERT INTO `cartinfo` VALUES ('52427ce1641e499486eb1383d6f24174', 1, 4, 3);
INSERT INTO `cartinfo` VALUES ('79bf846454da44e4bc0cc6d3caaa2ffd', 3, 6, 1);
INSERT INTO `cartinfo` VALUES ('b5e2d3e997e641a8b3e1dd43ae8f53be', 1, 6, 2);
INSERT INTO `cartinfo` VALUES ('f911569b190045a1a22dc0ae26102e6e', 3, 7, 3);

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠卷标题',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠卷的图片信息',
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠卷的金额',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠卷描述',
  `limit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '使用优惠券的最低金额',
  `start` datetime NULL DEFAULT NULL COMMENT '优惠卷开始时间',
  `end` datetime NULL DEFAULT NULL COMMENT '优惠卷到期时间',
  `num` int NULL DEFAULT NULL COMMENT '优惠券数量',
  `total` int NULL DEFAULT NULL COMMENT '优惠券原始数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100006 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES (1, '满38减16', 'images/new.jpg', '16', '满38减16', '38', '2023-12-29 18:06:31', '2024-01-06 14:18:37', 5, 5);
INSERT INTO `coupon` VALUES (2, '满40减16', 'images/new.jpg', '16', 'LAHFvaddcy', '40', '2023-12-29 09:53:44', '2024-01-06 12:45:41', 1000, 1000);
INSERT INTO `coupon` VALUES (3, 'asdhid', 'images/logo.png', '20.0', '天天生鲜双12优惠卷', '38', '2023-12-29 21:01:30', '2023-12-31 20:52:47', 0, 100);
INSERT INTO `coupon` VALUES (4, 'asd', 'asd', '14', '新用户福利卷', '40', '2023-12-30 16:39:23', '2024-01-04 16:39:37', 100, 100);
INSERT INTO `coupon` VALUES (5, '生鲜优惠卷', NULL, '30', '生鲜福利优惠', '300', '2024-01-01 19:59:58', '2024-01-06 20:00:13', 50, 100);
INSERT INTO `coupon` VALUES (6, '生鲜优惠卷', NULL, '30', '生鲜福利优惠', '50', '2024-01-01 19:59:58', '2024-01-06 20:00:13', 90, 100);
INSERT INTO `coupon` VALUES (7, '新人福利', NULL, '10', '新人福利', '10', '2024-01-01 19:59:58', '2024-01-06 20:00:13', 90, 100);
INSERT INTO `coupon` VALUES (100000, '百分百10', 'images/new.jpg', '8', '新用户优惠券', '18', '2024-01-01 00:00:00', '2024-01-02 20:37:47', 10, 100);
INSERT INTO `coupon` VALUES (100001, '百分百20', 'images/new.jpg', '8', '新用户优惠券', '18', '2024-01-02 00:00:00', '2024-01-02 20:37:47', 20, 100);
INSERT INTO `coupon` VALUES (100002, '百分百40', 'images/new.jpg', '8', '新用户优惠券', '18', '2024-01-02 00:00:00', '2024-01-02 20:37:47', 40, 100);
INSERT INTO `coupon` VALUES (100003, '百分百60', 'images/new.jpg', '8', '新用户优惠券', '18', '2024-01-02 00:00:00', '2024-01-02 20:37:47', 60, 100);
INSERT INTO `coupon` VALUES (100004, '百分百80', 'images/new.jpg', '8', '新用户优惠券', '18', '2024-01-02 00:00:00', '2024-01-02 20:37:47', 80, 100);
INSERT INTO `coupon` VALUES (100005, '百分百100', 'images/new.jpg', '8', '新用户优惠券', '18', '2024-01-02 00:00:00', '2024-01-02 20:37:47', 100, 100);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'addrinfo', '地址信息', NULL, NULL, 'Addrinfo', 'crud', 'element-ui', 'com.fresh.system', 'system', 'addrinfo', '地址信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50', NULL);
INSERT INTO `gen_table` VALUES (2, 'admininfo', '管理员信息', NULL, NULL, 'Admininfo', 'crud', 'element-ui', 'com.fresh.system', 'system', 'admininfo', '管理员', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16', NULL);
INSERT INTO `gen_table` VALUES (3, 'cartinfo', '购物车信息', NULL, NULL, 'Cartinfo', 'crud', 'element-ui', 'com.fresh.system', 'system', 'cartinfo', '购物车信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19', NULL);
INSERT INTO `gen_table` VALUES (4, 'goodsinfo', '商品信息', NULL, NULL, 'Goodsinfo', 'crud', 'element-ui', 'com.fresh.system', 'system', 'goodsinfo', '商品信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00', NULL);
INSERT INTO `gen_table` VALUES (5, 'goodstype', '商品类型', NULL, NULL, 'Goodstype', 'crud', 'element-ui', 'com.fresh.system', 'system', 'goodstype', '商品类型', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51', NULL);
INSERT INTO `gen_table` VALUES (6, 'memberinfo', '会员', NULL, NULL, 'Memberinfo', 'crud', 'element-ui', 'com.fresh.system', 'system', 'memberinfo', '会员', 'calyee', '0', '/', '{\"parentMenuId\":\"2003\"}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22', NULL);
INSERT INTO `gen_table` VALUES (7, 'orderinfo', '订单信息', NULL, NULL, 'Orderinfo', 'crud', 'element-ui', 'com.fresh.system', 'system', 'orderinfo', '订单信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57', NULL);
INSERT INTO `gen_table` VALUES (8, 'orderiteminfo', '订单对象信息', NULL, NULL, 'Orderiteminfo', 'crud', 'element-ui', 'com.fresh.system', 'system', 'orderiteminfo', '订单对象信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-27 20:36:35', NULL);
INSERT INTO `gen_table` VALUES (9, 'coupon', '优惠券', NULL, NULL, 'Coupon', 'crud', 'element-ui', 'com.fresh.system', 'system', 'coupon', '优惠券', 'calyee', '0', '/', '{}', 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'ano', '编号', 'varchar(100)', 'String', 'ano', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (2, 1, 'mno', '会员编号', 'int', 'Long', 'mno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (3, 1, 'name', '姓名', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (4, 1, 'tel', '电话号码', 'varchar(15)', 'String', 'tel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (5, 1, 'province', '省', 'varchar(100)', 'String', 'province', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (6, 1, 'city', '城市', 'varchar(100)', 'String', 'city', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (7, 1, 'area', '地区', 'varchar(100)', 'String', 'area', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (8, 1, 'addr', '地址', 'varchar(100)', 'String', 'addr', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (9, 1, 'flag', '标志位', 'int', 'Long', 'flag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (10, 1, 'status', '状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column` VALUES (11, 2, 'aid', '编号', 'int', 'Long', 'aid', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16');
INSERT INTO `gen_table_column` VALUES (12, 2, 'aname', '姓名', 'varchar(100)', 'String', 'aname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16');
INSERT INTO `gen_table_column` VALUES (13, 2, 'pwd', '密码', 'varchar(100)', 'String', 'pwd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16');
INSERT INTO `gen_table_column` VALUES (14, 2, 'tel', '电话号码', 'varchar(15)', 'String', 'tel', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16');
INSERT INTO `gen_table_column` VALUES (15, 3, 'cno', '购物车编号', 'varchar(100)', 'String', 'cno', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19');
INSERT INTO `gen_table_column` VALUES (16, 3, 'mno', '会员编号', 'int', 'Long', 'mno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19');
INSERT INTO `gen_table_column` VALUES (17, 3, 'gno', '商品编号', 'int', 'Long', 'gno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19');
INSERT INTO `gen_table_column` VALUES (18, 3, 'num', '数量', 'int', 'Long', 'num', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19');
INSERT INTO `gen_table_column` VALUES (19, 4, 'gno', '商品编号', 'int', 'Long', 'gno', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (20, 4, 'gname', '商品名', 'varchar(100)', 'String', 'gname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (21, 4, 'tno', '商品类型', 'int', 'Long', 'tno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (22, 4, 'price', '价格', 'decimal(8,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (23, 4, 'intro', '介绍', 'varchar(400)', 'String', 'intro', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (24, 4, 'balance', '数量', 'int', 'Long', 'balance', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (25, 4, 'pics', '照片', 'varchar(1000)', 'String', 'pics', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (26, 4, 'unit', '单位', 'varchar(50)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (27, 4, 'qperied', '保质期', 'varchar(50)', 'String', 'qperied', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (28, 4, 'weight', '重量', 'varchar(50)', 'String', 'weight', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (29, 4, 'descr', '描述', 'text', 'String', 'descr', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column` VALUES (30, 5, 'tno', '类型编号', 'int', 'Long', 'tno', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51');
INSERT INTO `gen_table_column` VALUES (31, 5, 'tname', '类型名', 'varchar(100)', 'String', 'tname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51');
INSERT INTO `gen_table_column` VALUES (32, 5, 'pic', '照片', 'varchar(100)', 'String', 'pic', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51');
INSERT INTO `gen_table_column` VALUES (33, 5, 'status', '状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51');
INSERT INTO `gen_table_column` VALUES (34, 6, 'mno', '会员编号', 'int', 'Long', 'mno', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (35, 6, 'nickName', '昵称', 'varchar(100)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (36, 6, 'realName', '姓名', 'varchar(100)', 'String', 'realName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (37, 6, 'pwd', '密码', 'varchar(100)', 'String', 'pwd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (38, 6, 'tel', '电话', 'varchar(15)', 'String', 'tel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (39, 6, 'email', '邮箱', 'varchar(100)', 'String', 'email', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (40, 6, 'photo', '照片', 'varchar(100)', 'String', 'photo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (41, 6, 'regDate', '注册日期', 'datetime', 'Date', 'regDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (42, 6, 'status', '状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column` VALUES (43, 7, 'ono', '订单编号', 'varchar(100)', 'String', 'ono', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (44, 7, 'odate', '下单时间', 'datetime', 'Date', 'odate', '0', '0', '0', '1', '1', '1', '1', 'GTE', 'datetime', '', 2, 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (45, 7, 'ano', '收货地址编号', 'varchar(100)', 'String', 'ano', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (46, 7, 'sdate', '发货日期', 'datetime', 'Date', 'sdate', '0', '0', '0', '1', '1', '1', '1', 'GTE', 'datetime', '', 4, 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (47, 7, 'rdate', '收货日期', 'datetime', 'Date', 'rdate', '0', '0', '0', '1', '1', '1', '1', 'LTE', 'datetime', '', 5, 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (48, 7, 'status', '订单状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (49, 7, 'price', '订单总额', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (50, 7, 'invoice', '是否已开发票', 'int', 'Integer', 'invoice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2023-12-23 20:11:15', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (51, 8, 'ino', '编号', 'int', 'Long', 'ino', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2023-12-27 20:36:35');
INSERT INTO `gen_table_column` VALUES (52, 8, 'ono', '订单编号', 'varchar(100)', 'String', 'ono', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-27 20:36:35');
INSERT INTO `gen_table_column` VALUES (53, 8, 'gno', '商品编号', 'int', 'Long', 'gno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2023-12-27 20:36:35');
INSERT INTO `gen_table_column` VALUES (54, 8, 'nums', '数量', 'int', 'Long', 'nums', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-27 20:36:35');
INSERT INTO `gen_table_column` VALUES (55, 8, 'price', '价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-12-23 20:11:15', '', '2023-12-27 20:36:35');
INSERT INTO `gen_table_column` VALUES (56, 8, 'status', '状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2023-12-23 20:11:15', '', '2023-12-27 20:36:35');
INSERT INTO `gen_table_column` VALUES (57, 9, 'id', '', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (58, 9, 'title', '优惠卷标题', 'varchar(255)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (59, 9, 'img', '优惠卷图片地址', 'varchar(255)', 'String', 'img', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (60, 9, 'money', '优惠卷金额', 'varchar(255)', 'String', 'money', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (61, 9, 'desc', '优惠卷描述', 'varchar(255)', 'String', 'desc', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (63, 9, 'limit', '使用优惠券最低使用金额', 'varchar(255)', 'String', 'limit', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (64, 9, 'start', '优惠卷开始时间', 'datetime', 'Date', 'start', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (65, 9, 'end', '优惠卷到期时间', 'datetime', 'Date', 'end', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-12-26 17:04:51', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (66, 9, 'num', '数量', 'int', 'Long', 'num', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, '', '2023-12-29 14:29:52', '', '2023-12-29 14:30:58');
INSERT INTO `gen_table_column` VALUES (67, 7, 'iscoupon', '是否使用优惠卷', 'int', 'Integer', 'iscoupon', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 9, '', '2024-01-03 14:17:04', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (68, 7, 'couponprice', '优惠卷价格', 'decimal(10,2)', 'BigDecimal', 'couponprice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2024-01-03 14:17:04', '', '2024-01-03 14:34:57');
INSERT INTO `gen_table_column` VALUES (69, 7, 'realprice', '卷后价格', 'decimal(10,2)', 'BigDecimal', 'realprice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2024-01-03 14:17:04', '', '2024-01-03 14:34:57');

-- ----------------------------
-- Table structure for goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo`  (
  `gno` int NOT NULL AUTO_INCREMENT,
  `gname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tno` int NULL DEFAULT NULL,
  `price` decimal(8, 2) NULL DEFAULT NULL,
  `intro` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `balance` int NULL DEFAULT NULL,
  `pics` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `qperied` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `weight` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `descr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  PRIMARY KEY (`gno`) USING BTREE,
  INDEX `FK_goodsInfo_tno`(`tno` ASC) USING BTREE,
  CONSTRAINT `FK_goodsInfo_tno` FOREIGN KEY (`tno`) REFERENCES `goodstype` (`tno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------
INSERT INTO `goodsinfo` VALUES (1, '红富士', 1, 68.00, '很甜，很好吃', 100, 'images/goods02.jpg', '箱', '1个月', '5KG', NULL);
INSERT INTO `goodsinfo` VALUES (2, '草莓', 1, 98.00, '很甜，很好吃哦', 20, 'images/goods/goods003.jpg;images/goods/goods011.jpg', '件', '5天', '2.5KG', NULL);
INSERT INTO `goodsinfo` VALUES (3, '新疆葡萄', 1, 48.00, '酸酸甜甜就是你啦', 50, 'images/goods/goods002.jpg', '箱', '10天', '5KG', NULL);
INSERT INTO `goodsinfo` VALUES (4, '柠檬', 1, 60.00, '酸酸甜甜就是你啦', 100, 'images/goods/goods001.jpg', '盒', '20天', '10个', NULL);
INSERT INTO `goodsinfo` VALUES (5, '脐橙', 1, 38.00, '酸酸甜甜就是你啦', 100, 'images/goods/goods014.jpg', '箱', '30天', '2.5KG', NULL);
INSERT INTO `goodsinfo` VALUES (6, '猕猴桃', 1, 88.00, '酸酸甜甜就是你啦', 60, 'images/goods/goods012.jpg', '箱', '15天', '2.5KG', NULL);
INSERT INTO `goodsinfo` VALUES (7, '基围虾肉', 2, 92.00, '很鲜嫩，超值', 120, 'images/goods/goods018.jpg', '包', '5天', '2.5KG', NULL);
INSERT INTO `goodsinfo` VALUES (8, '河蚌', 2, 120.00, '很鲜嫩，超实惠', 40, 'images/goods/goods019.jpg', '件', '5天', '2.5KG', NULL);
INSERT INTO `goodsinfo` VALUES (9, '精品牛肉', 3, 38.00, '很鲜嫩，你值得拥有', 200, 'images/goods/goods31.jpg', '斤', '10天', '500G', NULL);
INSERT INTO `goodsinfo` VALUES (10, '精品五花肉', 3, 28.00, '很新鲜，超实惠', 100, 'images/goods/goods32.jpg', '斤', '10天', '500G', NULL);
INSERT INTO `goodsinfo` VALUES (11, '农家土鸡蛋', 4, 66.00, '纯天然，无污染，生态喂养', 100, 'images/goods/goods401.jpg', '盒', '30天', '30个', NULL);
INSERT INTO `goodsinfo` VALUES (12, '天然鹌鹑蛋', 4, 5.00, '生态喂养，天然污染', 100, 'images/goods/goods402.jpg', '斤', '30天', '500G', NULL);
INSERT INTO `goodsinfo` VALUES (13, '有机芹菜', 5, 8.00, '生态种植，天然无污染', 100, 'images/goods/goods501.jpg;images/goods/goods502.jpg', '斤', '10天', '500G', NULL);
INSERT INTO `goodsinfo` VALUES (14, '有机莴笋', 5, 6.00, '纯天然，无污染，生态种植', 100, 'images/goods/goods503.jpg', '斤', '10天', '500G', NULL);
INSERT INTO `goodsinfo` VALUES (15, '水饺', 6, 30.00, '蔬菜水饺，美味健康', 100, 'images/goods/goods601.jpg;images/goods/goods602.jpg', '包', '20天', '2.5KG', NULL);
INSERT INTO `goodsinfo` VALUES (16, '芝麻汤圆', 6, 28.00, '顺滑养颜，健康美味', 100, 'images/goods/goods603.jpg', '包', '10天', '3KG', NULL);

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `tno` int NOT NULL AUTO_INCREMENT,
  `tname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`tno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES (1, '新鲜水果', 'images/banner01.jpg', 1);
INSERT INTO `goodstype` VALUES (2, '海鲜水产', 'images/banner02.jpg', 1);
INSERT INTO `goodstype` VALUES (3, '猪牛羊肉', 'images/banner03.jpg', 1);
INSERT INTO `goodstype` VALUES (4, '禽类蛋品', 'images/banner04.jpg', 1);
INSERT INTO `goodstype` VALUES (5, '新鲜蔬菜', 'images/banner05.jpg', 1);
INSERT INTO `goodstype` VALUES (6, '速冻食品', 'images/banner06.jpg', 1);

-- ----------------------------
-- Table structure for memberinfo
-- ----------------------------
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE `memberinfo`  (
  `mno` int NOT NULL AUTO_INCREMENT,
  `nickName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `realName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tel` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `regDate` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`mno`) USING BTREE,
  UNIQUE INDEX `nickName`(`nickName` ASC) USING BTREE,
  UNIQUE INDEX `tel`(`tel` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of memberinfo
-- ----------------------------
INSERT INTO `memberinfo` VALUES (1, 'navy', 'navy', 'c8837b23ff8aaa8a2dde915473ce0991', '15096098010', '475651857@qq.com', '', '2019-10-03 15:56:13', 1);
INSERT INTO `memberinfo` VALUES (2, 'yc', 'yc', 'c8837b23ff8aaa8a2dde915473ce0991', '15096098012', '1293580602@qq.com', '', '2019-10-03 16:41:50', 1);
INSERT INTO `memberinfo` VALUES (3, 'calyee', '', 'e10adc3949ba59abbe56e057f20f883e', '15900000000', '599882460@qq.com', '', '2023-12-30 14:50:43', 1);
INSERT INTO `memberinfo` VALUES (4, 'duck', '', 'e10adc3949ba59abbe56e057f20f883e', '15713121233', 'y15714812275@163.com', '', '2023-12-30 17:06:03', 1);

-- ----------------------------
-- Table structure for memberqiangcoupon
-- ----------------------------
DROP TABLE IF EXISTS `memberqiangcoupon`;
CREATE TABLE `memberqiangcoupon`  (
  `uid` int NOT NULL COMMENT '用户id',
  `cid` bigint NOT NULL COMMENT '优惠卷id',
  `num` int NULL DEFAULT NULL COMMENT '用户抢到该优惠卷的数量',
  `status` int NULL DEFAULT 0 COMMENT '表示用户是否使用卷  0 未使用 1已使用 2已过期'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of memberqiangcoupon
-- ----------------------------
INSERT INTO `memberqiangcoupon` VALUES (3, 1, 1, 1);
INSERT INTO `memberqiangcoupon` VALUES (3, 2, 1, 1);
INSERT INTO `memberqiangcoupon` VALUES (3, 3, 1, 1);
INSERT INTO `memberqiangcoupon` VALUES (3, 1, 1, 1);
INSERT INTO `memberqiangcoupon` VALUES (3, 1, 1, 1);
INSERT INTO `memberqiangcoupon` VALUES (3, 1, 1, 2);
INSERT INTO `memberqiangcoupon` VALUES (3, 2, 1, 1);
INSERT INTO `memberqiangcoupon` VALUES (3, 3, 1, 1);
INSERT INTO `memberqiangcoupon` VALUES (3, 4, 1, 1);
INSERT INTO `memberqiangcoupon` VALUES (1, 20231228, 1, 0);
INSERT INTO `memberqiangcoupon` VALUES (3, 5, 1, 1);

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo`  (
  `ono` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `odate` datetime NULL DEFAULT NULL,
  `ano` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `sdate` datetime NULL DEFAULT NULL,
  `rdate` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `invoice` int NULL DEFAULT NULL,
  `iscoupon` int NULL DEFAULT NULL COMMENT '是否使用优惠卷',
  `couponprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠卷价格',
  `realprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用优惠卷后的价格',
  PRIMARY KEY (`ono`) USING BTREE,
  INDEX `FK_orderInfo_ano`(`ano` ASC) USING BTREE,
  CONSTRAINT `FK_orderInfo_ano` FOREIGN KEY (`ano`) REFERENCES `addrinfo` (`ano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('17042657057617880', '2024-01-03 15:08:25', '1703938430938', NULL, NULL, 1, 124.00, 0, 4, 30.00, 94.00);
INSERT INTO `orderinfo` VALUES ('17042663679022436', '2024-01-03 15:19:27', '1703938430938', NULL, NULL, 1, 38.00, 0, 2, 14.00, 24.00);
INSERT INTO `orderinfo` VALUES ('17042664942035722', '2024-01-03 15:21:34', '1703938430938', NULL, NULL, 1, 48.00, 0, NULL, NULL, 48.00);
INSERT INTO `orderinfo` VALUES ('17042668516087219', '2024-01-03 15:27:31', '1703938430938', NULL, NULL, 1, 48.00, 0, NULL, NULL, 48.00);
INSERT INTO `orderinfo` VALUES ('17042669789148812', '2024-01-03 15:29:38', '1703938430938', NULL, NULL, 1, 368.00, 0, 3, 30.00, 338.00);
INSERT INTO `orderinfo` VALUES ('17042671992853288', '2024-01-03 15:33:19', '1703938430938', NULL, NULL, 1, 82.00, 0, NULL, NULL, 82.00);
INSERT INTO `orderinfo` VALUES ('17042680392805000', '2024-01-03 15:47:19', '1703938430938', NULL, NULL, 1, 86.00, 0, NULL, NULL, 86.00);
INSERT INTO `orderinfo` VALUES ('17042683209994752', '2024-01-03 15:52:01', '1703938430938', NULL, NULL, 1, 108.00, 0, NULL, NULL, 108.00);
INSERT INTO `orderinfo` VALUES ('17042688271525118', '2024-01-03 16:00:27', '1703938430938', NULL, NULL, 1, 114.00, 0, 4, 30.00, 84.00);
INSERT INTO `orderinfo` VALUES ('17042690375298126', '2024-01-03 16:03:57', '1703938430938', NULL, NULL, 1, 58.00, 0, NULL, NULL, 58.00);
INSERT INTO `orderinfo` VALUES ('17042693227381711', '2024-01-03 16:08:42', '1703938430938', NULL, NULL, 1, 25.00, 0, 5, 10.00, 15.00);
INSERT INTO `orderinfo` VALUES ('17042719006742289', '2024-01-03 16:51:40', '1703938430938', NULL, NULL, 1, 10.00, 0, NULL, NULL, 10.00);
INSERT INTO `orderinfo` VALUES ('17042725852896009', '2024-01-03 17:03:05', '1703938430938', NULL, NULL, 1, 86.00, 0, NULL, NULL, 86.00);
INSERT INTO `orderinfo` VALUES ('17042742096121900', '2024-01-03 17:30:09', '1703938430938', NULL, NULL, 1, 48.00, 0, NULL, NULL, 48.00);
INSERT INTO `orderinfo` VALUES ('17042744061786151', '2024-01-03 17:33:26', '1703938430938', NULL, NULL, 1, 48.00, 0, NULL, NULL, 48.00);
INSERT INTO `orderinfo` VALUES ('17042744178134465', '2024-01-03 17:33:37', '1703938430938', NULL, NULL, 1, 58.00, 0, NULL, NULL, 58.00);
INSERT INTO `orderinfo` VALUES ('17042744317301341', '2024-01-03 17:33:51', '1703938430938', NULL, NULL, 1, 190.00, 0, NULL, NULL, 190.00);
INSERT INTO `orderinfo` VALUES ('17042745404315030', '2024-01-03 17:35:40', '1703938430938', NULL, NULL, 1, 40.00, 0, NULL, NULL, 40.00);
INSERT INTO `orderinfo` VALUES ('17042746231466070', '2024-01-03 17:37:03', '1703938430938', NULL, NULL, 1, 40.00, 0, NULL, NULL, 40.00);
INSERT INTO `orderinfo` VALUES ('17042762030393582', '2024-01-03 18:03:23', '1703938430938', NULL, NULL, 1, 98.00, 0, NULL, NULL, 98.00);
INSERT INTO `orderinfo` VALUES ('17042762280256854', '2024-01-03 18:03:48', '1703938430938', NULL, NULL, 1, 362.00, 0, NULL, NULL, 362.00);
INSERT INTO `orderinfo` VALUES ('17042762688331038', '2024-01-03 18:04:28', '1703938430938', NULL, NULL, 1, 362.00, 0, NULL, NULL, 362.00);
INSERT INTO `orderinfo` VALUES ('17042762984417019', '2024-01-03 18:04:58', '1703938430938', NULL, NULL, 1, 48.00, 0, NULL, NULL, 48.00);
INSERT INTO `orderinfo` VALUES ('17043493557632021', '2024-01-04 14:22:35', '1703938430938', NULL, NULL, 1, 38.00, 0, 5, 10.00, 28.00);
INSERT INTO `orderinfo` VALUES ('17043494035142530', '2024-01-04 14:23:23', '1703938430938', NULL, NULL, 1, 3810.00, 0, NULL, NULL, 3810.00);
INSERT INTO `orderinfo` VALUES ('17043494200351324', '2024-01-04 14:23:40', '1703938430938', NULL, NULL, 1, 125.00, 0, NULL, NULL, 125.00);
INSERT INTO `orderinfo` VALUES ('17043494336947711', '2024-01-04 14:23:53', '1703938430938', NULL, NULL, 1, 2710.00, 0, NULL, NULL, 2710.00);
INSERT INTO `orderinfo` VALUES ('17043495388335555', '2024-01-05 14:25:38', '1703938430938', NULL, NULL, 1, 13115.00, 0, NULL, NULL, 13115.00);
INSERT INTO `orderinfo` VALUES ('17043495690591686', '2024-01-05 14:26:09', '1703938430938', NULL, NULL, 1, 650.00, 0, NULL, NULL, 650.00);
INSERT INTO `orderinfo` VALUES ('17043653794199927', '2024-02-04 18:49:39', '1703938430938', NULL, NULL, 1, 2394.00, 0, NULL, NULL, 2394.00);
INSERT INTO `orderinfo` VALUES ('17043656267552772', '2024-02-10 18:53:46', '1703938430938', NULL, NULL, 1, 850.00, 0, NULL, NULL, 850.00);
INSERT INTO `orderinfo` VALUES ('17043663164295076', '2024-01-06 19:05:16', '1703938430938', NULL, NULL, 1, 98.00, 0, NULL, NULL, 98.00);
INSERT INTO `orderinfo` VALUES ('17043663589446525', '2024-01-07 19:05:58', '1703938430938', NULL, NULL, 1, 450.00, 0, NULL, NULL, 450.00);
INSERT INTO `orderinfo` VALUES ('1704366369793429', '2024-01-08 19:06:09', '1703938430938', NULL, NULL, 1, 1206.00, 0, NULL, NULL, 1206.00);
INSERT INTO `orderinfo` VALUES ('17043663798056263', '2024-01-08 19:06:19', '1703938430938', NULL, NULL, 1, 234.00, 0, NULL, NULL, 234.00);
INSERT INTO `orderinfo` VALUES ('17043663894344667', '2024-01-09 19:06:29', '1703938430938', NULL, NULL, 1, 340.00, 0, NULL, NULL, 340.00);
INSERT INTO `orderinfo` VALUES ('17043664053718996', '2024-01-10 19:06:45', '1703938430938', NULL, NULL, 1, 60.00, 0, NULL, NULL, 60.00);
INSERT INTO `orderinfo` VALUES ('17043664265531770', '2024-01-11 19:07:06', '1703938430938', NULL, NULL, 1, 438.00, 0, NULL, NULL, 438.00);

-- ----------------------------
-- Table structure for orderiteminfo
-- ----------------------------
DROP TABLE IF EXISTS `orderiteminfo`;
CREATE TABLE `orderiteminfo`  (
  `ino` int NOT NULL AUTO_INCREMENT,
  `ono` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `gno` int NULL DEFAULT NULL,
  `nums` int NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`ino`) USING BTREE,
  INDEX `FK_orderItemInfo_gno`(`gno` ASC) USING BTREE,
  INDEX `FK_orderItemInfo_ono`(`ono` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderiteminfo
-- ----------------------------
INSERT INTO `orderiteminfo` VALUES (42, '17042655027575175', 5, 3, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (43, '17042655027575175', 4, 2, 60.00, 1);
INSERT INTO `orderiteminfo` VALUES (44, '17042657057617880', 9, 3, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (45, '17042663679022436', 10, 1, 28.00, 1);
INSERT INTO `orderiteminfo` VALUES (46, '17042664942035722', 5, 1, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (47, '17042668516087219', 9, 1, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (48, '17042669789148812', 16, 1, 28.00, 1);
INSERT INTO `orderiteminfo` VALUES (49, '17042669789148812', 11, 5, 66.00, 1);
INSERT INTO `orderiteminfo` VALUES (50, '17042671992853288', 14, 12, 6.00, 1);
INSERT INTO `orderiteminfo` VALUES (51, '17042680392805000', 5, 2, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (52, '17042683209994752', 4, 1, 60.00, 1);
INSERT INTO `orderiteminfo` VALUES (53, '17042683209994752', 5, 1, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (54, '17042688271525118', 9, 2, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (55, '17042688271525118', 10, 1, 28.00, 1);
INSERT INTO `orderiteminfo` VALUES (56, '17042690375298126', 3, 1, 48.00, 1);
INSERT INTO `orderiteminfo` VALUES (57, '17042693227381711', 12, 3, 5.00, 1);
INSERT INTO `orderiteminfo` VALUES (58, '17042719006742289', 7, 5, 92.00, 1);
INSERT INTO `orderiteminfo` VALUES (59, '17042719006742289', 3, 4, 48.00, 1);
INSERT INTO `orderiteminfo` VALUES (60, '17042725852896009', 5, 2, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (61, '17042742096121900', 5, 1, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (62, '17042744061786151', 5, 1, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (63, '17042744178134465', 3, 1, 48.00, 1);
INSERT INTO `orderiteminfo` VALUES (64, '17042744317301341', 4, 3, 60.00, 1);
INSERT INTO `orderiteminfo` VALUES (65, '17042745404315030', 15, 1, 30.00, 1);
INSERT INTO `orderiteminfo` VALUES (66, '17042746231466070', 15, 1, 30.00, 1);
INSERT INTO `orderiteminfo` VALUES (67, '17042762030393582', 6, 1, 88.00, 1);
INSERT INTO `orderiteminfo` VALUES (68, '17042762280256854', 6, 4, 88.00, 1);
INSERT INTO `orderiteminfo` VALUES (69, '17042762688331038', 6, 4, 88.00, 1);
INSERT INTO `orderiteminfo` VALUES (70, '17042762984417019', 5, 1, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (71, '17043493557632021', 10, 1, 28.00, 1);
INSERT INTO `orderiteminfo` VALUES (72, '17043494035142530', 9, 100, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (73, '17043494200351324', 12, 23, 5.00, 1);
INSERT INTO `orderiteminfo` VALUES (74, '17043494336947711', 15, 90, 30.00, 1);
INSERT INTO `orderiteminfo` VALUES (75, '17043495388335555', 3, 45, 48.00, 1);
INSERT INTO `orderiteminfo` VALUES (76, '17043495388335555', 8, 15, 120.00, 1);
INSERT INTO `orderiteminfo` VALUES (77, '17043495388335555', 5, 40, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (78, '17043495388335555', 6, 40, 88.00, 1);
INSERT INTO `orderiteminfo` VALUES (79, '17043495388335555', 4, 67, 60.00, 1);
INSERT INTO `orderiteminfo` VALUES (80, '17043495388335555', 12, 17, 5.00, 1);
INSERT INTO `orderiteminfo` VALUES (81, '17043495690591686', 13, 80, 8.00, 1);
INSERT INTO `orderiteminfo` VALUES (82, '17043653794199927', 4, 14, 60.00, 1);
INSERT INTO `orderiteminfo` VALUES (83, '17043653794199927', 5, 28, 38.00, 1);
INSERT INTO `orderiteminfo` VALUES (84, '17043653794199927', 14, 80, 6.00, 1);
INSERT INTO `orderiteminfo` VALUES (85, '17043656267552772', 4, 14, 60.00, 1);
INSERT INTO `orderiteminfo` VALUES (86, '17043663164295076', 6, 1, 88.00, 1);
INSERT INTO `orderiteminfo` VALUES (87, '17043663589446525', 6, 5, 88.00, 1);
INSERT INTO `orderiteminfo` VALUES (88, '1704366369793429', 7, 13, 92.00, 1);
INSERT INTO `orderiteminfo` VALUES (89, '17043663798056263', 10, 8, 28.00, 1);
INSERT INTO `orderiteminfo` VALUES (90, '17043663894344667', 11, 5, 66.00, 1);
INSERT INTO `orderiteminfo` VALUES (91, '17043664053718996', 12, 10, 5.00, 1);
INSERT INTO `orderiteminfo` VALUES (92, '17043664265531770', 3, 6, 48.00, 1);
INSERT INTO `orderiteminfo` VALUES (93, '17043664265531770', 16, 5, 28.00, 1);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Singapore');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Singapore');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Singapore');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.fresh.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E66726573682E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E66726573682E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018C968D60E878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.fresh.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E66726573682E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E66726573682E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018C968D60E878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.fresh.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E66726573682E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E66726573682E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018C968D60E878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

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
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'Calyee1703575460391', 1703575853627, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1703575460000, -1, 5, 'PAUSED', 'CRON', 1703575460000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1703575470000, -1, 5, 'PAUSED', 'CRON', 1703575460000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1703575460000, -1, 5, 'PAUSED', 'CRON', 1703575460000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '衡阳分公司', 3, 'calyee', '15900000000', '599882460@qq.com', '0', '0', 'admin', '2023-12-26 16:30:23', 'admin', '2023-12-26 16:30:36');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-12-23 20:01:37', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-12-23 20:01:37', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-12-23 20:01:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 15:32:42');
INSERT INTO `sys_logininfor` VALUES (2, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2023-12-28 15:42:41');
INSERT INTO `sys_logininfor` VALUES (3, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2023-12-28 15:42:44');
INSERT INTO `sys_logininfor` VALUES (4, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 15:42:47');
INSERT INTO `sys_logininfor` VALUES (5, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-28 15:44:26');
INSERT INTO `sys_logininfor` VALUES (6, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 15:44:33');
INSERT INTO `sys_logininfor` VALUES (7, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-28 16:05:03');
INSERT INTO `sys_logininfor` VALUES (8, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:05:14');
INSERT INTO `sys_logininfor` VALUES (9, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-28 16:09:36');
INSERT INTO `sys_logininfor` VALUES (10, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:09:47');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:12:24');
INSERT INTO `sys_logininfor` VALUES (12, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:12:42');
INSERT INTO `sys_logininfor` VALUES (13, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2023-12-28 16:43:52');
INSERT INTO `sys_logininfor` VALUES (14, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:43:58');
INSERT INTO `sys_logininfor` VALUES (15, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:47:23');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2023-12-29 14:29:03');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-29 14:29:07');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-29 15:46:56');
INSERT INTO `sys_logininfor` VALUES (19, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2023-12-29 18:43:42');
INSERT INTO `sys_logininfor` VALUES (20, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-29 18:43:46');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-29 19:30:49');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2023-12-30 15:02:21');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2023-12-30 15:02:24');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-30 15:02:26');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-30 19:02:58');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-01 15:35:55');
INSERT INTO `sys_logininfor` VALUES (27, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-01 16:37:05');
INSERT INTO `sys_logininfor` VALUES (28, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-01 16:46:41');
INSERT INTO `sys_logininfor` VALUES (29, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-01-01 17:05:07');
INSERT INTO `sys_logininfor` VALUES (30, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-01 17:05:19');
INSERT INTO `sys_logininfor` VALUES (31, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-01 17:13:07');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-01 17:13:15');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 14:32:06');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 16:14:51');
INSERT INTO `sys_logininfor` VALUES (35, 'ADMIN', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-02 18:30:16');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 18:30:28');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-02 18:33:05');
INSERT INTO `sys_logininfor` VALUES (38, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 18:33:18');
INSERT INTO `sys_logininfor` VALUES (39, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-02 18:33:28');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 18:33:36');
INSERT INTO `sys_logininfor` VALUES (41, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 18:34:19');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-02 18:34:35');
INSERT INTO `sys_logininfor` VALUES (43, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 18:34:43');
INSERT INTO `sys_logininfor` VALUES (44, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 19:09:56');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 20:11:38');
INSERT INTO `sys_logininfor` VALUES (46, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-02 20:17:28');
INSERT INTO `sys_logininfor` VALUES (47, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 20:17:37');
INSERT INTO `sys_logininfor` VALUES (48, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-02 20:18:08');
INSERT INTO `sys_logininfor` VALUES (49, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 20:18:17');
INSERT INTO `sys_logininfor` VALUES (50, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-02 20:18:42');
INSERT INTO `sys_logininfor` VALUES (51, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 20:18:50');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 14:16:42');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 18:23:57');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-01-03 20:15:23');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 20:15:26');
INSERT INTO `sys_logininfor` VALUES (56, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 18:51:57');
INSERT INTO `sys_logininfor` VALUES (57, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 21:30:57');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 22:01:18');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-01-04 23:17:38');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 23:17:41');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-04 23:36:13');
INSERT INTO `sys_logininfor` VALUES (62, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 23:36:21');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2055 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-23 20:01:36', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-12-23 20:01:36', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-12-23 20:01:36', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-12-23 20:01:36', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-12-23 20:01:36', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-12-23 20:01:36', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-12-23 20:01:36', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-12-23 20:01:36', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-12-23 20:01:36', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-12-23 20:01:36', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-12-23 20:01:36', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-12-23 20:01:36', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-12-23 20:01:36', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-12-23 20:01:36', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-12-23 20:01:36', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-12-23 20:01:36', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-12-23 20:01:36', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-12-23 20:01:36', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-12-23 20:01:36', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-12-23 20:01:36', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-12-23 20:01:36', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-12-23 20:01:36', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-12-23 20:01:36', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '会员相关', 0, 4, 'memberinfo', 'system/memberinfo/index', NULL, 1, 0, 'C', '0', '0', 'system:memberinfo:list', 'peoples', 'admin', '2023-12-23 20:28:26', 'admin', '2023-12-28 16:00:47', '');
INSERT INTO `sys_menu` VALUES (2004, '商品管理', 0, 5, 'goods', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'shopping', 'admin', '2023-12-26 19:51:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '商品详情', 2004, 1, 'goodsinfo', 'system/goodsinfo/index', NULL, 1, 0, 'C', '0', '0', 'system:goodsinfo:list', 'skill', 'admin', '2023-12-26 19:53:12', 'admin', '2023-12-27 20:39:42', '');
INSERT INTO `sys_menu` VALUES (2006, '商品类型', 2004, 2, 'goodstype', 'system/goodstype/index', NULL, 1, 0, 'C', '0', '0', 'system:goodstype:list', 'example', 'admin', '2023-12-26 19:56:04', 'admin', '2023-12-27 20:39:49', '');
INSERT INTO `sys_menu` VALUES (2007, '用户信息管理', 2008, 1, 'admininfo', 'system/admininfo/index', NULL, 1, 1, 'C', '0', '0', 'system:admininfo:list', 'user', 'admin', '2023-12-26 20:02:10', 'admin', '2023-12-27 20:40:03', '');
INSERT INTO `sys_menu` VALUES (2008, '用户管理', 0, 6, 'user', NULL, NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2023-12-26 20:04:02', 'admin', '2023-12-26 20:04:21', '');
INSERT INTO `sys_menu` VALUES (2009, '收货地址管理', 2008, 2, 'addrinfo', 'system/addrinfo/index', NULL, 1, 1, 'C', '0', '0', 'system:addrinfo:list', 'edit', 'admin', '2023-12-26 20:05:19', 'admin', '2023-12-27 20:40:08', '');
INSERT INTO `sys_menu` VALUES (2011, '订单信息管理', 0, 7, 'orderinfo', 'system/orderinfo/index', NULL, 1, 1, 'C', '0', '0', 'system:orderinfo:list', 'documentation', 'admin', '2023-12-26 20:08:47', 'admin', '2023-12-27 20:40:12', '');
INSERT INTO `sys_menu` VALUES (2012, '优惠券', 2054, 6, 'coupon', 'system/coupon/index', NULL, 1, 0, 'C', '0', '0', 'system:coupon:list', 'monitor', 'admin', '2023-12-26 20:14:13', 'admin', '2024-01-02 20:15:06', '');
INSERT INTO `sys_menu` VALUES (2013, '消息列表', 0, 8, 'chat', 'system/chat/index', NULL, 1, 0, 'C', '0', '0', 'system:chat:list', 'wechat', 'admin', '2023-12-27 15:04:56', 'admin', '2023-12-27 20:40:17', '');
INSERT INTO `sys_menu` VALUES (2014, '商品详情添加', 2005, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodsinfo:add', '#', 'admin', '2023-12-27 20:48:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '修改', 2005, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodsinfo:edit', '#', 'admin', '2023-12-27 20:49:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '删除', 2005, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodsinfo:remove', '#', 'admin', '2023-12-28 15:34:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '导出', 2005, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodsinfo:export', '#', 'admin', '2023-12-28 15:34:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '新增', 2006, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodstype:add', '#', 'admin', '2023-12-28 15:35:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '编辑', 2006, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodstype:edit', '#', 'admin', '2023-12-28 15:35:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '删除', 2006, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodstype:remove', '#', 'admin', '2023-12-28 15:36:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '导出', 2006, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodstype:export', '#', 'admin', '2023-12-28 15:36:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '新增', 2007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:addrinfo:add', '#', 'admin', '2023-12-28 15:37:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '修改', 2007, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:addrinfo:edit', '#', 'admin', '2023-12-28 15:37:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '删除', 2007, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:addrinfo:remove', '#', 'admin', '2023-12-28 15:38:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '导出', 2007, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:addrinfo:export', '#', 'admin', '2023-12-28 15:38:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '新增', 2009, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:admininfo:add', '#', 'admin', '2023-12-28 15:38:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '编辑', 2009, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:admininfo:edit', '#', 'admin', '2023-12-28 15:39:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '删除', 2009, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:admininfo:remove', '#', 'admin', '2023-12-28 15:39:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '导出', 2009, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:admininfo:export', '#', 'admin', '2023-12-28 15:39:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '新增', 2012, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:coupon:add', '#', 'admin', '2023-12-28 15:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '修改', 2012, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:coupon:edit', '#', 'admin', '2023-12-28 15:40:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '删除', 2012, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:coupon:remove', '#', 'admin', '2023-12-28 15:40:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '导出', 2012, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:coupon:export', '#', 'admin', '2023-12-28 15:41:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '新增', 2011, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:orderinfo:add', '#', 'admin', '2023-12-28 15:41:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '修改', 2011, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:orderinfo:edit', '#', 'admin', '2023-12-28 15:41:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '删除', 2011, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:orderinfo:remove', '#', 'admin', '2023-12-28 15:41:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '导出', 2011, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:orderinfo:export', '#', 'admin', '2023-12-28 15:42:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '删除', 2003, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:memberinfo:remove', '#', 'admin', '2023-12-28 16:25:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '修改', 2003, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:memberinfo:edit', '#', 'admin', '2023-12-28 16:25:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, 'query', 2003, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:memberinfo:query', '#', 'admin', '2023-12-28 16:25:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '新增', 2003, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:memberinfo:add', '#', 'admin', '2023-12-28 16:26:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '导出', 2003, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:memberinfo:export', '#', 'admin', '2023-12-28 16:26:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, 'query', 2005, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodsinfo:query', '#', 'admin', '2023-12-28 16:26:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, 'query', 2006, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:goodstype:query', '#', 'admin', '2023-12-28 16:27:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, 'query', 2007, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:addrinfo:query', '#', 'admin', '2023-12-28 16:42:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, 'query', 2009, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:admininfo:query', '#', 'admin', '2023-12-28 16:42:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, 'query', 2012, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:coupon:query', '#', 'admin', '2023-12-28 16:42:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, 'query', 2011, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:orderinfo:query', '#', 'admin', '2023-12-28 16:43:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '全局监控', 0, 4, 'mymonitor', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'eye-open', 'admin', '2024-01-02 16:21:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '接口监控', 2050, 1, 'mymonitor', 'mymonitor/index', NULL, 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2024-01-02 16:22:35', 'admin', '2024-01-02 18:32:53', '');
INSERT INTO `sys_menu` VALUES (2052, '硬件监控', 2050, 1, 'server', 'monitor/server/index', NULL, 1, 0, 'C', '0', '0', 'monitor:server:list', 'checkbox', 'admin', '2024-01-02 18:31:40', 'admin', '2024-01-02 18:32:20', '');
INSERT INTO `sys_menu` VALUES (2053, '优惠券情况', 2054, 2, 'couponitem', 'system/coupon/coupon', NULL, 1, 0, 'C', '0', '0', '', 'skill', 'admin', '2024-01-02 20:13:06', 'admin', '2024-01-02 20:15:16', '');
INSERT INTO `sys_menu` VALUES (2054, '优惠券相关', 0, 6, 'maincoupon', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'component', 'admin', '2024-01-02 20:14:56', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-12-23 20:01:37', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-12-23 20:01:37', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.fresh.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-27 20:46:14', 64);
INSERT INTO `sys_oper_log` VALUES (2, '登录日志', 9, 'com.fresh.web.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-27 20:46:21', 55);
INSERT INTO `sys_oper_log` VALUES (3, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品详情添加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"system:goodsinfo:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-27 20:48:40', 8);
INSERT INTO `sys_oper_log` VALUES (4, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2005,\"perms\":\"system:goodsinfo:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-27 20:49:02', 17);
INSERT INTO `sys_oper_log` VALUES (5, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2005,\"perms\":\"system:goodsinfo:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:34:37', 25);
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2005,\"perms\":\"system:goodsinfo:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:34:57', 10);
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"system:goodstype:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:35:29', 9);
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"perms\":\"system:goodstype:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:35:49', 10);
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"perms\":\"system:goodstype:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:36:05', 11);
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2006,\"perms\":\"system:goodstype:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:36:21', 9);
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:addrinfo:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:37:29', 21);
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"perms\":\"system:addrinfo:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:37:52', 22);
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"perms\":\"system:addrinfo:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:38:09', 22);
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2007,\"perms\":\"system:addrinfo:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:38:22', 11);
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"perms\":\"system:admininfo:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:38:51', 11);
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"perms\":\"system:admininfo:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:39:09', 20);
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"perms\":\"system:admininfo:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:39:23', 9);
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2009,\"perms\":\"system:admininfo:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:39:34', 21);
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"perms\":\"system:coupon:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:40:04', 9);
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"perms\":\"system:coupon:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:40:33', 22);
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2012,\"perms\":\"system:coupon:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:40:51', 20);
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2012,\"perms\":\"system:coupon:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:41:07', 21);
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2011,\"perms\":\"system:orderinfo:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:41:26', 21);
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2011,\"perms\":\"system:orderinfo:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:41:37', 20);
INSERT INTO `sys_oper_log` VALUES (25, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2011,\"perms\":\"system:orderinfo:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:41:54', 8);
INSERT INTO `sys_oper_log` VALUES (26, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2011,\"perms\":\"system:orderinfo:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:42:09', 18);
INSERT INTO `sys_oper_log` VALUES (27, '用户管理', 2, 'com.fresh.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:03:08\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"599882460@qq.com\",\"loginDate\":\"2023-12-28 15:42:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"calyee\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[5],\"remark\":\"商品管理\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"calyee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:43:42', 43);
INSERT INTO `sys_oper_log` VALUES (28, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-26 16:28:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2004,2005,2014,2015,2016,2017,2006,2018,2019,2020,2021,2008,2007,2022,2023,2024,2025,2009,2026,2027,2028,2029,2012,2030,2031,2032,2033,2011,2034,2035,2036,2037,2013],\"params\":{},\"remark\":\"商品管理\",\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:44:20', 27);
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/memberinfo/index\",\"createTime\":\"2023-12-23 20:28:26\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"会员相关\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"memberinfo\",\"perms\":\"system:memberinfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:00:47', 25);
INSERT INTO `sys_oper_log` VALUES (30, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-26 16:28:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2004,2005,2014,2015,2016,2017,2006,2018,2019,2020,2021,2008,2007,2022,2023,2024,2025,2009,2026,2027,2028,2029,2012,2030,2031,2032,2033,2011,2034,2035,2036,2037,2013],\"params\":{},\"remark\":\"商品管理\",\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:04:57', 28);
INSERT INTO `sys_oper_log` VALUES (31, '商品信息', 5, 'com.fresh.system.controller.GoodsinfoController.export()', 'POST', 1, 'calyee', '研发部门', '/system/goodsinfo/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-12-28 16:05:30', 559);
INSERT INTO `sys_oper_log` VALUES (32, '商品信息', 5, 'com.fresh.system.controller.GoodsinfoController.export()', 'POST', 1, 'calyee', '研发部门', '/system/goodsinfo/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-12-28 16:05:32', 62);
INSERT INTO `sys_oper_log` VALUES (33, '用户管理', 2, 'com.fresh.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:03:08\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"599882460@qq.com\",\"loginDate\":\"2023-12-28 16:05:15\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"calyee\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[5],\"remark\":\"商品管理\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"calyee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:07:37', 24);
INSERT INTO `sys_oper_log` VALUES (34, '岗位管理', 2, 'com.fresh.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-12-26 16:29:31\",\"flag\":false,\"params\":{},\"postCode\":\"fresh\",\"postId\":5,\"postName\":\"商品管理\",\"postSort\":5,\"remark\":\"商品管理\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:08:05', 23);
INSERT INTO `sys_oper_log` VALUES (35, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-23 20:01:36\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2004,2005,2014,2015,2016,2017,2006,2018,2019,2020,2021,2008,2007,2022,2023,2024,2025,2009,2026,2027,2028,2029,2012,2030,2031,2032,2033,2011,2034,2035,2036,2037,2013],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:09:02', 46);
INSERT INTO `sys_oper_log` VALUES (36, '用户管理', 2, 'com.fresh.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 20:49:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"衡阳分公司\",\"leader\":\"calyee\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":200,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"along\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[5],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"along\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:09:21', 19);
INSERT INTO `sys_oper_log` VALUES (37, '用户管理', 2, 'com.fresh.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:03:08\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"衡阳分公司\",\"leader\":\"calyee\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":200,\"email\":\"599882460@qq.com\",\"loginDate\":\"2023-12-28 16:05:15\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"calyee\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[5],\"remark\":\"商品管理\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"calyee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:09:27', 21);
INSERT INTO `sys_oper_log` VALUES (38, '用户管理', 2, 'com.fresh.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:03:08\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"衡阳分公司\",\"leader\":\"calyee\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":200,\"email\":\"599882460@qq.com\",\"loginDate\":\"2023-12-28 16:05:15\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"calyee\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[5],\"remark\":\"商品管理\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"calyee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:09:32', 24);
INSERT INTO `sys_oper_log` VALUES (39, '商品信息', 1, 'com.fresh.system.controller.GoodsinfoController.add()', 'POST', 1, 'calyee', '衡阳分公司', '/system/goodsinfo', '127.0.0.1', '内网IP', '{\"balance\":1,\"descr\":\"1\",\"gname\":\"1\",\"gno\":17,\"intro\":\"11\",\"params\":{},\"pics\":\"1\",\"price\":1,\"qperied\":\"1\",\"tno\":1,\"unit\":\"1\",\"weight\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:10:25', 22);
INSERT INTO `sys_oper_log` VALUES (40, '商品信息', 3, 'com.fresh.system.controller.GoodsinfoController.remove()', 'DELETE', 1, 'calyee', '衡阳分公司', '/system/goodsinfo/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:10:29', 7);
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2003,\"perms\":\"system:memberinfo:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:25:15', 37);
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:memberinfo:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:25:27', 29);
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"query\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"perms\":\"system:memberinfo:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:25:45', 20);
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"perms\":\"system:memberinfo:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:26:03', 20);
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2003,\"perms\":\"system:memberinfo:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:26:27', 19);
INSERT INTO `sys_oper_log` VALUES (46, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"query\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2005,\"perms\":\"system:goodsinfo:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:26:57', 12);
INSERT INTO `sys_oper_log` VALUES (47, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"query\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2006,\"perms\":\"system:goodstype:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:27:30', 19);
INSERT INTO `sys_oper_log` VALUES (48, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"query\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2007,\"perms\":\"system:addrinfo:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:42:01', 10);
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"query\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2009,\"perms\":\"system:admininfo:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:42:20', 20);
INSERT INTO `sys_oper_log` VALUES (50, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"query\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2012,\"perms\":\"system:coupon:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:42:43', 21);
INSERT INTO `sys_oper_log` VALUES (51, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"query\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2011,\"perms\":\"system:orderinfo:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:43:07', 10);
INSERT INTO `sys_oper_log` VALUES (52, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-26 16:28:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2004,2005,2014,2015,2016,2017,2043,2006,2018,2019,2020,2021,2044,2008,2007,2022,2023,2024,2025,2045,2009,2026,2027,2028,2029,2046,2012,2030,2031,2032,2033,2047,2011,2034,2035,2036,2037,2048,2013],\"params\":{},\"remark\":\"商品管理\",\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:43:30', 40);
INSERT INTO `sys_oper_log` VALUES (53, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-23 20:01:36\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2004,2005,2014,2015,2016,2017,2043,2006,2018,2019,2020,2021,2044,2008,2007,2022,2023,2024,2025,2045,2009,2026,2027,2028,2029,2046,2012,2030,2031,2032,2033,2047,2011,2034,2035,2036,2037,2048,2013],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:43:37', 23);
INSERT INTO `sys_oper_log` VALUES (54, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"list\",\"menuType\":\"F\",\"orderNum\":8,\"params\":{},\"parentId\":2003,\"perms\":\"system:memberinfo:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:46:05', 20);
INSERT INTO `sys_oper_log` VALUES (55, '菜单管理', 3, 'com.fresh.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2049', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 16:46:15', 23);
INSERT INTO `sys_oper_log` VALUES (56, '代码生成', 8, 'com.fresh.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"orderiteminfo\"}', NULL, 0, NULL, '2023-12-28 16:51:40', 279);
INSERT INTO `sys_oper_log` VALUES (57, '代码生成', 8, 'com.fresh.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"addrinfo,admininfo,cartinfo,goodsinfo,goodstype,memberinfo,orderinfo,orderiteminfo\"}', NULL, 0, NULL, '2023-12-28 16:52:29', 221);
INSERT INTO `sys_oper_log` VALUES (58, '代码生成', 8, 'com.fresh.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"addrinfo,admininfo,cartinfo,goodsinfo,goodstype,memberinfo,orderinfo,orderiteminfo\"}', NULL, 0, NULL, '2023-12-28 16:52:45', 200);
INSERT INTO `sys_oper_log` VALUES (59, '代码生成', 2, 'com.fresh.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/coupon', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-29 14:29:52', 94);
INSERT INTO `sys_oper_log` VALUES (60, '代码生成', 2, 'com.fresh.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"Coupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":57,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:04:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-12-29 14:29:52\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"优惠卷标题\",\"columnId\":58,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:04:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-12-29 14:29:52\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"优惠卷图片地址\",\"columnId\":59,\"columnName\":\"img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:04:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-12-29 14:29:52\",\"usableColumn\":false},{\"capJavaField\":\"Money\",\"columnComment\":\"优惠卷金额\",\"columnId\":60,\"columnName\":\"money\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:04:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-29 14:30:58', 51);
INSERT INTO `sys_oper_log` VALUES (61, '代码生成', 8, 'com.fresh.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"coupon\"}', NULL, 0, NULL, '2023-12-29 14:31:02', 257);
INSERT INTO `sys_oper_log` VALUES (62, '优惠券', 2, 'com.fresh.system.controller.CouponController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/coupon', '127.0.0.1', '内网IP', '{\"desc\":\"满38减16\",\"end\":\"2024-01-06\",\"id\":1,\"img\":\"null\",\"limit\":\"38\",\"money\":\"16\",\"params\":{},\"start\":\"2023-12-29\",\"title\":\"满38减16\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'num\' in \'class com.fresh.system.domain.Coupon\'', '2023-12-29 14:45:13', 10);
INSERT INTO `sys_oper_log` VALUES (63, '优惠券', 2, 'com.fresh.system.controller.CouponController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/coupon', '127.0.0.1', '内网IP', '{\"desc\":\"满38减16\",\"end\":\"2024-01-06\",\"id\":1,\"img\":\"null\",\"limit\":\"38\",\"money\":\"16\",\"num\":1000,\"params\":{},\"start\":\"2023-12-29\",\"title\":\"满38减16\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'满38减16\',\n            limit = \'38\',\n            start = \'2023-12-29 0\' at line 5\r\n### The error may exist in file [D:\\JavaDemo\\fresh-cloud\\fresh-cloud\\fresh-cloud-back-management\\fresh-component\\target\\classes\\mapper\\system\\CouponMapper.xml]\r\n### The error may involve com.fresh.system.mapper.CouponMapper.updateCoupon-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update coupon          SET title = ?,             img = ?,             money = ?,             desc = ?,             limit = ?,             start = ?,             end = ?,             num = ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'满38减16\',\n            limit = \'38\',\n            start = \'2023-12-29 0\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'满38减16\',\n            limit = \'38\',\n            start = \'2023-12-29 0\' at line 5', '2023-12-29 15:47:15', 72);
INSERT INTO `sys_oper_log` VALUES (64, '优惠券', 2, 'com.fresh.system.controller.CouponController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/coupon', '127.0.0.1', '内网IP', '{\"desc\":\"满38减16\",\"end\":\"2024-01-06\",\"id\":1,\"img\":\"null\",\"limit\":\"38\",\"money\":\"16\",\"num\":1000,\"params\":{},\"start\":\"2023-12-29\",\"title\":\"满38减16\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'满38减16\',\n            limit = \'38\',\n            start = \'2023-12-29 0\' at line 5\r\n### The error may exist in file [D:\\JavaDemo\\fresh-cloud\\fresh-cloud\\fresh-cloud-back-management\\fresh-component\\target\\classes\\mapper\\system\\CouponMapper.xml]\r\n### The error may involve com.fresh.system.mapper.CouponMapper.updateCoupon-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update coupon          SET title = ?,             img = ?,             money = ?,             desc = ?,             limit = ?,             start = ?,             end = ?,             num = ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'满38减16\',\n            limit = \'38\',\n            start = \'2023-12-29 0\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'满38减16\',\n            limit = \'38\',\n            start = \'2023-12-29 0\' at line 5', '2023-12-29 15:47:22', 4);
INSERT INTO `sys_oper_log` VALUES (65, '管理员', 2, 'com.fresh.system.controller.AdmininfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/admininfo', '127.0.0.1', '内网IP', '{\"aid\":1,\"aname\":\"navy\",\"params\":{},\"pwd\":\"123456\",\"tel\":\"15096098010\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-30 19:30:36', 29);
INSERT INTO `sys_oper_log` VALUES (66, '管理员', 1, 'com.fresh.system.controller.AdmininfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/admininfo', '127.0.0.1', '内网IP', '{\"aid\":2,\"aname\":\"test\",\"params\":{},\"pwd\":\"123456\",\"tel\":\"15900000000\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-01 15:49:06', 15);
INSERT INTO `sys_oper_log` VALUES (67, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"eye-open\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"全局监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"mymonitor\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 16:21:15', 23);
INSERT INTO `sys_oper_log` VALUES (68, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"mymonitor/index\",\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"系统硬件监控\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"path\":\"mymonitor\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 16:22:35', 9);
INSERT INTO `sys_oper_log` VALUES (69, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/server/index\",\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"硬件监控\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"path\":\"mymonitor\",\"perms\":\"monitor:server:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 18:31:40', 12);
INSERT INTO `sys_oper_log` VALUES (70, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/server/index\",\"createTime\":\"2024-01-02 18:31:40\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2052,\"menuName\":\"硬件监控\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"path\":\"server\",\"perms\":\"monitor:server:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 18:32:20', 20);
INSERT INTO `sys_oper_log` VALUES (71, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"mymonitor/index\",\"createTime\":\"2024-01-02 16:22:35\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2051,\"menuName\":\"接口监控\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"path\":\"mymonitor\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 18:32:53', 19);
INSERT INTO `sys_oper_log` VALUES (72, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-26 16:28:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2050,2051,2052,2004,2005,2014,2015,2016,2017,2043,2006,2018,2019,2020,2021,2044,2008,2007,2022,2023,2024,2025,2045,2009,2026,2027,2028,2029,2046,2012,2030,2031,2032,2033,2047,2011,2034,2035,2036,2037,2048,2013],\"params\":{},\"remark\":\"商品管理\",\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 18:33:03', 54);
INSERT INTO `sys_oper_log` VALUES (73, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-23 20:01:36\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2050,2051,2052,2004,2005,2014,2015,2016,2017,2043,2006,2018,2019,2020,2021,2044,2008,2007,2022,2023,2024,2025,2045,2009,2026,2027,2028,2029,2046,2012,2030,2031,2032,2033,2047,2011,2034,2035,2036,2037,2048,2013],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 18:33:48', 29);
INSERT INTO `sys_oper_log` VALUES (74, '优惠券', 3, 'com.fresh.system.controller.CouponController.remove()', 'DELETE', 1, 'calyee', '衡阳分公司', '/system/coupon/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:07:14', 7);
INSERT INTO `sys_oper_log` VALUES (75, '优惠券', 3, 'com.fresh.system.controller.CouponController.remove()', 'DELETE', 1, 'calyee', '衡阳分公司', '/system/coupon/11,9,8,7,6,5,4,3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:07:22', 17);
INSERT INTO `sys_oper_log` VALUES (76, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/coupon/coupon\",\"createBy\":\"admin\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"优惠券情况\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"couponitem\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:13:06', 22);
INSERT INTO `sys_oper_log` VALUES (77, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"优惠券相关\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"maincoupon\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:14:56', 12);
INSERT INTO `sys_oper_log` VALUES (78, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/coupon/index\",\"createTime\":\"2023-12-26 20:14:13\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"优惠券\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2054,\"path\":\"coupon\",\"perms\":\"system:coupon:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:15:06', 8);
INSERT INTO `sys_oper_log` VALUES (79, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/coupon/coupon\",\"createTime\":\"2024-01-02 20:13:06\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2053,\"menuName\":\"优惠券情况\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2054,\"path\":\"couponitem\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:15:16', 16);
INSERT INTO `sys_oper_log` VALUES (80, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-26 16:28:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2050,2051,2052,2004,2005,2014,2015,2016,2017,2043,2006,2018,2019,2020,2021,2044,2008,2007,2022,2023,2024,2025,2045,2009,2026,2027,2028,2029,2046,2054,2053,2012,2030,2031,2032,2033,2047,2011,2034,2035,2036,2037,2048,2013],\"params\":{},\"remark\":\"商品管理\",\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:15:34', 16);
INSERT INTO `sys_oper_log` VALUES (81, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-26 16:28:00\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2050,2051,2052,2004,2005,2014,2015,2016,2017,2043,2006,2018,2019,2020,2021,2044,2008,2007,2022,2023,2024,2025,2045,2009,2026,2027,2028,2029,2046,2054,2053,2012,2030,2031,2032,2033,2047,2011,2034,2035,2036,2037,2048,2013],\"params\":{},\"remark\":\"商品管理\",\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:17:59', 12);
INSERT INTO `sys_oper_log` VALUES (82, '用户管理', 2, 'com.fresh.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:03:08\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"衡阳分公司\",\"leader\":\"calyee\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":200,\"email\":\"599882460@qq.com\",\"loginDate\":\"2024-01-02 20:18:17\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"calyee\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[5],\"remark\":\"商品管理\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"calyee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:18:37', 18);
INSERT INTO `sys_oper_log` VALUES (83, '优惠券', 1, 'com.fresh.system.controller.CouponController.add()', 'POST', 1, 'calyee', '衡阳分公司', '/system/coupon', '127.0.0.1', '内网IP', '{\"desc\":\"新用户优惠券\",\"end\":\"2024-01-02 08:37:47\",\"img\":\"images/new.jpg\",\"limit\":\"18\",\"money\":\"8\",\"num\":100,\"params\":{},\"start\":\"2024-01-02 12:00:00\",\"title\":\"新用户优惠券\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,\n            limit,\n            start,\n            end,\n            num,\n  \' at line 5\r\n### The error may exist in file [D:\\JavaDemo\\fresh-cloud\\fresh-cloud\\fresh-cloud-back-management\\fresh-component\\target\\classes\\mapper\\system\\CouponMapper.xml]\r\n### The error may involve com.fresh.system.mapper.CouponMapper.insertCoupon-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into coupon          ( title,             img,             money,             desc,             limit,             start,             end,             num,                 total )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,\n            limit,\n            start,\n            end,\n            num,\n  \' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,\n            limit,\n            start,\n            end,\n            num,\n  \' at line 5', '2024-01-02 20:37:50', 76);
INSERT INTO `sys_oper_log` VALUES (84, '优惠券', 1, 'com.fresh.system.controller.CouponController.add()', 'POST', 1, 'calyee', '衡阳分公司', '/system/coupon', '127.0.0.1', '内网IP', '{\"desc\":\"新用户优惠券\",\"end\":\"2024-01-02 08:37:47\",\"img\":\"images/new.jpg\",\"limit\":\"18\",\"money\":\"8\",\"num\":100,\"params\":{},\"start\":\"2024-01-02 12:00:00\",\"title\":\"新用户优惠券\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,\n            limit,\n            start,\n            end,\n            num,\n  \' at line 5\r\n### The error may exist in file [D:\\JavaDemo\\fresh-cloud\\fresh-cloud\\fresh-cloud-back-management\\fresh-component\\target\\classes\\mapper\\system\\CouponMapper.xml]\r\n### The error may involve com.fresh.system.mapper.CouponMapper.insertCoupon-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into coupon          ( title,             img,             money,             desc,             limit,             start,             end,             num,                 total )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,\n            limit,\n            start,\n            end,\n            num,\n  \' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc,\n            limit,\n            start,\n            end,\n            num,\n  \' at line 5', '2024-01-02 20:38:25', 5);
INSERT INTO `sys_oper_log` VALUES (85, '优惠券', 1, 'com.fresh.system.controller.CouponController.add()', 'POST', 1, 'calyee', '衡阳分公司', '/system/coupon', '127.0.0.1', '内网IP', '{\"desc\":\"新用户优惠券\",\"end\":\"2024-01-02 08:37:47\",\"img\":\"images/new.jpg\",\"limit\":\"18\",\"money\":\"8\",\"num\":100,\"params\":{},\"start\":\"2024-01-02 12:00:00\",\"title\":\"新用户优惠券\"}', NULL, 1, 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'1=1\'. Cause: org.apache.ibatis.ognl.InappropriateExpressionException: Inappropriate OGNL expression: 1', '2024-01-02 20:40:44', 11);
INSERT INTO `sys_oper_log` VALUES (86, '优惠券', 1, 'com.fresh.system.controller.CouponController.add()', 'POST', 1, 'calyee', '衡阳分公司', '/system/coupon', '127.0.0.1', '内网IP', '{\"desc\":\"新用户优惠券\",\"end\":\"2024-01-02 08:37:47\",\"id\":12,\"img\":\"images/new.jpg\",\"limit\":\"18\",\"money\":\"8\",\"num\":100,\"params\":{},\"start\":\"2024-01-02 12:00:00\",\"title\":\"新用户优惠券\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 20:41:50', 40);
INSERT INTO `sys_oper_log` VALUES (87, '代码生成', 2, 'com.fresh.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/orderinfo', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 14:17:05', 112);
INSERT INTO `sys_oper_log` VALUES (88, '代码生成', 2, 'com.fresh.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orderinfo\",\"className\":\"Orderinfo\",\"columns\":[{\"capJavaField\":\"Ono\",\"columnComment\":\"订单编号\",\"columnId\":43,\"columnName\":\"ono\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ono\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:17:04\",\"usableColumn\":false},{\"capJavaField\":\"Odate\",\"columnComment\":\"下单时间\",\"columnId\":44,\"columnName\":\"odate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"odate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"GTE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:17:04\",\"usableColumn\":false},{\"capJavaField\":\"Ano\",\"columnComment\":\"收货地址编号\",\"columnId\":45,\"columnName\":\"ano\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ano\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:17:04\",\"usableColumn\":false},{\"capJavaField\":\"Sdate\",\"columnComment\":\"发货日期\",\"columnId\":46,\"columnName\":\"sdate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isInc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 14:19:45', 40);
INSERT INTO `sys_oper_log` VALUES (89, '代码生成', 8, 'com.fresh.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"orderinfo\"}', NULL, 0, NULL, '2024-01-03 14:19:50', 239);
INSERT INTO `sys_oper_log` VALUES (90, '代码生成', 2, 'com.fresh.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orderinfo\",\"className\":\"Orderinfo\",\"columns\":[{\"capJavaField\":\"Ono\",\"columnComment\":\"订单编号\",\"columnId\":43,\"columnName\":\"ono\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ono\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:19:45\",\"usableColumn\":false},{\"capJavaField\":\"Odate\",\"columnComment\":\"下单时间\",\"columnId\":44,\"columnName\":\"odate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"odate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"GTE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:19:45\",\"usableColumn\":false},{\"capJavaField\":\"Ano\",\"columnComment\":\"收货地址编号\",\"columnId\":45,\"columnName\":\"ano\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ano\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:19:45\",\"usableColumn\":false},{\"capJavaField\":\"Sdate\",\"columnComment\":\"发货日期\",\"columnId\":46,\"columnName\":\"sdate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isInc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 14:30:25', 77);
INSERT INTO `sys_oper_log` VALUES (91, '代码生成', 8, 'com.fresh.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"orderinfo\"}', NULL, 0, NULL, '2024-01-03 14:30:28', 155);
INSERT INTO `sys_oper_log` VALUES (92, '代码生成', 2, 'com.fresh.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orderinfo\",\"className\":\"Orderinfo\",\"columns\":[{\"capJavaField\":\"Ono\",\"columnComment\":\"订单编号\",\"columnId\":43,\"columnName\":\"ono\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ono\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:30:25\",\"usableColumn\":false},{\"capJavaField\":\"Odate\",\"columnComment\":\"下单时间\",\"columnId\":44,\"columnName\":\"odate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"odate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"GTE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:30:25\",\"usableColumn\":false},{\"capJavaField\":\"Ano\",\"columnComment\":\"收货地址编号\",\"columnId\":45,\"columnName\":\"ano\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ano\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:30:25\",\"usableColumn\":false},{\"capJavaField\":\"Sdate\",\"columnComment\":\"发货日期\",\"columnId\":46,\"columnName\":\"sdate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isInc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 14:34:19', 44);
INSERT INTO `sys_oper_log` VALUES (93, '代码生成', 2, 'com.fresh.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"orderinfo\",\"className\":\"Orderinfo\",\"columns\":[{\"capJavaField\":\"Ono\",\"columnComment\":\"订单编号\",\"columnId\":43,\"columnName\":\"ono\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ono\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:34:19\",\"usableColumn\":false},{\"capJavaField\":\"Odate\",\"columnComment\":\"下单时间\",\"columnId\":44,\"columnName\":\"odate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"odate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"GTE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:34:19\",\"usableColumn\":false},{\"capJavaField\":\"Ano\",\"columnComment\":\"收货地址编号\",\"columnId\":45,\"columnName\":\"ano\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ano\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2024-01-03 14:34:19\",\"usableColumn\":false},{\"capJavaField\":\"Sdate\",\"columnComment\":\"发货日期\",\"columnId\":46,\"columnName\":\"sdate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isInc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 14:34:58', 33);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_post` VALUES (5, 'fresh', '商品管理', 5, '0', 'admin', '2023-12-26 16:29:31', 'admin', '2023-12-28 16:08:05', '商品管理');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-12-23 20:01:36', 'admin', '2024-01-02 18:33:48', '普通角色');
INSERT INTO `sys_role` VALUES (100, '商品后台管理', 'fresh', 3, '2', 1, 1, '0', '0', 'admin', '2023-12-26 16:28:00', 'admin', '2024-01-02 20:17:59', '商品管理');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (100, 100);
INSERT INTO `sys_role_dept` VALUES (100, 200);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2050);
INSERT INTO `sys_role_menu` VALUES (2, 2051);
INSERT INTO `sys_role_menu` VALUES (2, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2046);
INSERT INTO `sys_role_menu` VALUES (100, 2047);
INSERT INTO `sys_role_menu` VALUES (100, 2048);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-01-04 23:17:42', 'admin', '2023-12-23 20:01:36', '', '2024-01-04 23:17:41', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-12-23 20:01:36', 'admin', '2023-12-23 20:01:36', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 200, 'calyee', 'calyee', '00', '599882460@qq.com', '', '0', '', '$2a$10$ejYCszG2a6bZzUpiVpWf4eJUtYdmbD/zvMbxgw8ck6gCmVBi4hIPy', '0', '0', '127.0.0.1', '2024-01-04 23:36:22', 'admin', '2023-12-26 17:03:08', 'admin', '2024-01-04 23:36:21', '商品管理');
INSERT INTO `sys_user` VALUES (101, 200, 'yaya', 'yaya', '00', '', '', '0', '', '$2a$10$dCcq8hZxaq39P/MWXUMiv.TaC0D34.1Sxdo69cQeT38o1Pq7VUWo.', '0', '0', '127.0.0.1', '2023-12-26 20:52:18', 'admin', '2023-12-26 20:49:35', 'admin', '2023-12-27 15:08:04', NULL);
INSERT INTO `sys_user` VALUES (102, 200, 'along', 'along', '00', '', '', '0', '', '$2a$10$BpQ.QOdunlrqAcWHt26MnOWOvx0y41M2J7ikb1R43Z/px6./NjbEW', '0', '0', '', NULL, 'admin', '2023-12-26 20:49:53', 'admin', '2023-12-28 16:09:21', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 5);
INSERT INTO `sys_user_post` VALUES (101, 5);
INSERT INTO `sys_user_post` VALUES (102, 5);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 2);

SET FOREIGN_KEY_CHECKS = 1;
