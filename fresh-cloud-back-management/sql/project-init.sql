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

 Date: 26/12/2023 20:53:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addrinfo
-- ----------------------------
DROP TABLE IF EXISTS `addrinfo`;
CREATE TABLE `addrinfo`
(
    `ano`      varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `mno`      int                                                    NULL DEFAULT NULL,
    `name`     varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `tel`      varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NOT NULL,
    `province` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `city`     varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `area`     varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `addr`     varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `flag`     int                                                    NULL DEFAULT NULL,
    `status`   int                                                    NULL DEFAULT NULL,
    PRIMARY KEY (`ano`) USING BTREE,
    INDEX `FK_addrInfo_mno` (`mno` ASC) USING BTREE,
    CONSTRAINT `FK_addrInfo_mno` FOREIGN KEY (`mno`) REFERENCES `memberinfo` (`mno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of addrinfo
-- ----------------------------

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo`
(
    `aid`   int                                                    NOT NULL AUTO_INCREMENT,
    `aname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `pwd`   varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `tel`   varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL DEFAULT NULL,
    PRIMARY KEY (`aid`) USING BTREE,
    UNIQUE INDEX `aname` (`aname` ASC) USING BTREE,
    UNIQUE INDEX `tel` (`tel` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo`
VALUES (1, 'navy', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257', '15096098010');

-- ----------------------------
-- Table structure for cartinfo
-- ----------------------------
DROP TABLE IF EXISTS `cartinfo`;
CREATE TABLE `cartinfo`
(
    `cno` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `mno` int                                                    NULL DEFAULT NULL,
    `gno` int                                                    NULL DEFAULT NULL,
    `num` int                                                    NULL DEFAULT NULL,
    PRIMARY KEY (`cno`) USING BTREE,
    INDEX `FK_cartInfo_mno` (`mno` ASC) USING BTREE,
    INDEX `FK_cartInfo_gno` (`gno` ASC) USING BTREE,
    CONSTRAINT `FK_cartInfo_gno` FOREIGN KEY (`gno`) REFERENCES `goodsinfo` (`gno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `FK_cartInfo_mno` FOREIGN KEY (`mno`) REFERENCES `memberinfo` (`mno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cartinfo
-- ----------------------------
INSERT INTO `cartinfo`
VALUES ('11', 1, 2, 6);
INSERT INTO `cartinfo`
VALUES ('12', 1, 5, 4);
INSERT INTO `cartinfo`
VALUES ('366c0b3836dc4774a11228a359ced9de', 1, 1, 4);
INSERT INTO `cartinfo`
VALUES ('52427ce1641e499486eb1383d6f24174', 1, 4, 3);
INSERT INTO `cartinfo`
VALUES ('b5e2d3e997e641a8b3e1dd43ae8f53be', 1, 6, 2);

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon`
(
    `id`       bigint                                                        NOT NULL AUTO_INCREMENT,
    `title`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠卷标题',
    `img`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠卷的图片信息',
    `money`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠卷的金额',
    `desc`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优惠卷描述',
    `limitnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户能抢到的最大数量',
    `limit`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '使用优惠券的最低金额',
    `start`    datetime                                                      NULL DEFAULT NULL COMMENT '优惠卷开始时间',
    `end`      datetime                                                      NULL DEFAULT NULL COMMENT '优惠卷到期时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `table_id`          bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `tpl_web_type`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
    `package_name`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci       NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '创建者',
    `create_time`       datetime                                                       NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '更新者',
    `update_time`       datetime                                                       NULL DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table`
VALUES (1, 'addrinfo', '地址信息', NULL, NULL, 'Addrinfo', 'crud', 'element-ui', 'com.fresh.system', 'system',
        'addrinfo', '地址信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50',
        NULL);
INSERT INTO `gen_table`
VALUES (2, 'admininfo', '管理员信息', NULL, NULL, 'Admininfo', 'crud', 'element-ui', 'com.fresh.system', 'system',
        'admininfo', '管理员', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16',
        NULL);
INSERT INTO `gen_table`
VALUES (3, 'cartinfo', '购物车信息', NULL, NULL, 'Cartinfo', 'crud', 'element-ui', 'com.fresh.system', 'system',
        'cartinfo', '购物车信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19',
        NULL);
INSERT INTO `gen_table`
VALUES (4, 'goodsinfo', '商品信息', NULL, NULL, 'Goodsinfo', 'crud', 'element-ui', 'com.fresh.system', 'system',
        'goodsinfo', '商品信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00',
        NULL);
INSERT INTO `gen_table`
VALUES (5, 'goodstype', '商品类型', NULL, NULL, 'Goodstype', 'crud', 'element-ui', 'com.fresh.system', 'system',
        'goodstype', '商品类型', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51',
        NULL);
INSERT INTO `gen_table`
VALUES (6, 'memberinfo', '会员', NULL, NULL, 'Memberinfo', 'crud', 'element-ui', 'com.fresh.system', 'system',
        'memberinfo', '会员', 'calyee', '0', '/', '{\"parentMenuId\":\"2003\"}', 'admin', '2023-12-23 20:11:15', '',
        '2023-12-25 19:08:22', NULL);
INSERT INTO `gen_table`
VALUES (7, 'orderinfo', '订单信息', NULL, NULL, 'Orderinfo', 'crud', 'element-ui', 'com.fresh.system', 'system',
        'orderinfo', '订单信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23',
        NULL);
INSERT INTO `gen_table`
VALUES (8, 'orderiteminfo', '订单对象信息', NULL, NULL, 'Orderiteminfo', 'crud', 'element-ui', 'com.fresh.system',
        'system', 'orderiteminfo', '订单对象信息', 'calyee', '0', '/', '{}', 'admin', '2023-12-23 20:11:15', '',
        '2023-12-25 19:17:52', NULL);
INSERT INTO `gen_table`
VALUES (9, 'coupon', '优惠券', NULL, NULL, 'Coupon', 'crud', 'element-ui', 'com.fresh.system', 'system', 'coupon',
        '优惠券', 'ruoyi', '0', '/', '{}', 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       bigint                                                        NULL DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
    `sort`           int                                                           NULL DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 66
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column`
VALUES (1, 1, 'ano', '编号', 'varchar(100)', 'String', 'ano', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (2, 1, 'mno', '会员编号', 'int', 'Long', 'mno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin',
        '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (3, 1, 'name', '姓名', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '',
        3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (4, 1, 'tel', '电话号码', 'varchar(15)', 'String', 'tel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '',
        4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (5, 1, 'province', '省', 'varchar(100)', 'String', 'province', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input',
        '', 5, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (6, 1, 'city', '城市', 'varchar(100)', 'String', 'city', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (7, 1, 'area', '地区', 'varchar(100)', 'String', 'area', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (8, 1, 'addr', '地址', 'varchar(100)', 'String', 'addr', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (9, 1, 'flag', '标志位', 'int', 'Long', 'flag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin',
        '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (10, 1, 'status', '状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 10,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:07:50');
INSERT INTO `gen_table_column`
VALUES (11, 2, 'aid', '编号', 'int', 'Long', 'aid', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2023-12-23 20:11:15', '', '2023-12-25 19:09:16');
INSERT INTO `gen_table_column`
VALUES (12, 2, 'aname', '姓名', 'varchar(100)', 'String', 'aname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input',
        '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16');
INSERT INTO `gen_table_column`
VALUES (13, 2, 'pwd', '密码', 'varchar(100)', 'String', 'pwd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16');
INSERT INTO `gen_table_column`
VALUES (14, 2, 'tel', '电话号码', 'varchar(15)', 'String', 'tel', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '',
        4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:09:16');
INSERT INTO `gen_table_column`
VALUES (15, 3, 'cno', '购物车编号', 'varchar(100)', 'String', 'cno', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'input', '', 1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19');
INSERT INTO `gen_table_column`
VALUES (16, 3, 'mno', '会员编号', 'int', 'Long', 'mno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19');
INSERT INTO `gen_table_column`
VALUES (17, 3, 'gno', '商品编号', 'int', 'Long', 'gno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:10:19');
INSERT INTO `gen_table_column`
VALUES (18, 3, 'num', '数量', 'int', 'Long', 'num', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin',
        '2023-12-23 20:11:15', '', '2023-12-25 19:10:19');
INSERT INTO `gen_table_column`
VALUES (19, 4, 'gno', '商品编号', 'int', 'Long', 'gno', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (20, 4, 'gname', '商品名', 'varchar(100)', 'String', 'gname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input',
        '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (21, 4, 'tno', '商品类型', 'int', 'Long', 'tno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (22, 4, 'price', '价格', 'decimal(8,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input',
        '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (23, 4, 'intro', '介绍', 'varchar(400)', 'String', 'intro', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '',
        5, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (24, 4, 'balance', '数量', 'int', 'Long', 'balance', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (25, 4, 'pics', '照片', 'varchar(1000)', 'String', 'pics', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea',
        '', 7, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (26, 4, 'unit', '单位', 'varchar(50)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (27, 4, 'qperied', '保质期', 'varchar(50)', 'String', 'qperied', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 9, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (28, 4, 'weight', '重量', 'varchar(50)', 'String', 'weight', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input',
        '', 10, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (29, 4, 'descr', '描述', 'text', 'String', 'descr', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 11,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:00');
INSERT INTO `gen_table_column`
VALUES (30, 5, 'tno', '类型编号', 'int', 'Long', 'tno', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51');
INSERT INTO `gen_table_column`
VALUES (31, 5, 'tname', '类型名', 'varchar(100)', 'String', 'tname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input',
        '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51');
INSERT INTO `gen_table_column`
VALUES (32, 5, 'pic', '照片', 'varchar(100)', 'String', 'pic', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51');
INSERT INTO `gen_table_column`
VALUES (33, 5, 'status', '状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:13:51');
INSERT INTO `gen_table_column`
VALUES (34, 6, 'mno', '会员编号', 'int', 'Long', 'mno', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (35, 6, 'nickName', '昵称', 'varchar(100)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE',
        'input', '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (36, 6, 'realName', '姓名', 'varchar(100)', 'String', 'realName', '0', '0', '0', '1', '1', '1', '1', 'LIKE',
        'input', '', 3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (37, 6, 'pwd', '密码', 'varchar(100)', 'String', 'pwd', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (38, 6, 'tel', '电话', 'varchar(15)', 'String', 'tel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (39, 6, 'email', '邮箱', 'varchar(100)', 'String', 'email', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '',
        6, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (40, 6, 'photo', '照片', 'varchar(100)', 'String', 'photo', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'imageUpload', '', 7, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (41, 6, 'regDate', '注册日期', 'datetime', 'Date', 'regDate', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'datetime', '', 8, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (42, 6, 'status', '状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:08:22');
INSERT INTO `gen_table_column`
VALUES (43, 7, 'ono', '编号', 'varchar(100)', 'String', 'ono', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '',
        1, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23');
INSERT INTO `gen_table_column`
VALUES (44, 7, 'odate', '下单时间', 'datetime', 'Date', 'odate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime',
        '', 2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23');
INSERT INTO `gen_table_column`
VALUES (45, 7, 'ano', '地址编号', 'varchar(100)', 'String', 'ano', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '',
        3, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23');
INSERT INTO `gen_table_column`
VALUES (46, 7, 'sdate', '下单日期?', 'datetime', 'Date', 'sdate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime',
        '', 4, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23');
INSERT INTO `gen_table_column`
VALUES (47, 7, 'rdate', '预计送达时间?', 'datetime', 'Date', 'rdate', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'datetime', '', 5, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23');
INSERT INTO `gen_table_column`
VALUES (48, 7, 'status', '订单状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23');
INSERT INTO `gen_table_column`
VALUES (49, 7, 'price', '总价', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 7, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23');
INSERT INTO `gen_table_column`
VALUES (50, 7, 'invoice', '发票', 'int', 'Long', 'invoice', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:16:23');
INSERT INTO `gen_table_column`
VALUES (51, 8, 'ino', '编号', 'int', 'Long', 'ino', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2023-12-23 20:11:15', '', '2023-12-25 19:17:52');
INSERT INTO `gen_table_column`
VALUES (52, 8, 'ono', '订单编号', 'varchar(100)', 'String', 'ono', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '',
        2, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:17:52');
INSERT INTO `gen_table_column`
VALUES (53, 8, 'gno', '商品编号', 'int', 'Long', 'gno', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:17:52');
INSERT INTO `gen_table_column`
VALUES (54, 8, 'nums', '数量', 'int', 'Long', 'nums', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin',
        '2023-12-23 20:11:15', '', '2023-12-25 19:17:52');
INSERT INTO `gen_table_column`
VALUES (55, 8, 'price', '价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 5, 'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:17:52');
INSERT INTO `gen_table_column`
VALUES (56, 8, 'status', '状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6,
        'admin', '2023-12-23 20:11:15', '', '2023-12-25 19:17:52');
INSERT INTO `gen_table_column`
VALUES (57, 9, 'id', '优惠券编号', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1,
        'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');
INSERT INTO `gen_table_column`
VALUES (58, 9, 'title', '优惠卷标题', 'varchar(255)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 2, 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');
INSERT INTO `gen_table_column`
VALUES (59, 9, 'img', '优惠卷的图片信息', 'varchar(255)', 'String', 'img', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');
INSERT INTO `gen_table_column`
VALUES (60, 9, 'money', '优惠卷的金额', 'varchar(255)', 'String', 'money', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 4, 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');
INSERT INTO `gen_table_column`
VALUES (61, 9, 'desc', '优惠卷描述', 'varchar(255)', 'String', 'desc', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input',
        '', 5, 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');
INSERT INTO `gen_table_column`
VALUES (62, 9, 'limitnum', '用户能抢到的最大数量', 'varchar(255)', 'String', 'limitnum', '0', '0', '0', '1', '1', '1',
        '1', 'EQ', 'input', '', 6, 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');
INSERT INTO `gen_table_column`
VALUES (63, 9, 'limit', '使用优惠券的最低金额', 'varchar(255)', 'String', 'limit', '0', '0', '0', '1', '1', '1', '1',
        'EQ', 'input', '', 7, 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');
INSERT INTO `gen_table_column`
VALUES (64, 9, 'start', '优惠卷开始时间', 'datetime', 'Date', 'start', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'datetime', '', 8, 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');
INSERT INTO `gen_table_column`
VALUES (65, 9, 'end', '优惠卷到期时间', 'datetime', 'Date', 'end', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime',
        '', 9, 'admin', '2023-12-26 17:04:51', '', '2023-12-26 17:05:50');

-- ----------------------------
-- Table structure for goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo`
(
    `gno`     int                                                     NOT NULL AUTO_INCREMENT,
    `gname`   varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NOT NULL,
    `tno`     int                                                     NULL DEFAULT NULL,
    `price`   decimal(8, 2)                                           NULL DEFAULT NULL,
    `intro`   varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NULL DEFAULT NULL,
    `balance` int                                                     NULL DEFAULT NULL,
    `pics`    varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
    `unit`    varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin   NULL DEFAULT NULL,
    `qperied` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin   NULL DEFAULT NULL,
    `weight`  varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin   NULL DEFAULT NULL,
    `descr`   text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin          NULL,
    PRIMARY KEY (`gno`) USING BTREE,
    INDEX `FK_goodsInfo_tno` (`tno` ASC) USING BTREE,
    CONSTRAINT `FK_goodsInfo_tno` FOREIGN KEY (`tno`) REFERENCES `goodstype` (`tno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------
INSERT INTO `goodsinfo`
VALUES (1, '红富士', 1, 68.00, '很甜，很好吃', 100, 'images/goods02.jpg', '箱', '1个月', '5KG', NULL);
INSERT INTO `goodsinfo`
VALUES (2, '草莓', 1, 98.00, '很甜，很好吃哦', 20, 'images/goods/goods003.jpg;images/goods/goods011.jpg', '件', '5天',
        '2.5KG', NULL);
INSERT INTO `goodsinfo`
VALUES (3, '新疆葡萄', 1, 48.00, '酸酸甜甜就是你啦', 50, 'images/goods/goods002.jpg', '箱', '10天', '5KG', NULL);
INSERT INTO `goodsinfo`
VALUES (4, '柠檬', 1, 60.00, '酸酸甜甜就是你啦', 100, 'images/goods/goods001.jpg', '盒', '20天', '10个', NULL);
INSERT INTO `goodsinfo`
VALUES (5, '脐橙', 1, 38.00, '酸酸甜甜就是你啦', 100, 'images/goods/goods014.jpg', '箱', '30天', '2.5KG', NULL);
INSERT INTO `goodsinfo`
VALUES (6, '猕猴桃', 1, 88.00, '酸酸甜甜就是你啦', 60, 'images/goods/goods012.jpg', '箱', '15天', '2.5KG', NULL);
INSERT INTO `goodsinfo`
VALUES (7, '基围虾肉', 2, 92.00, '很鲜嫩，超值', 120, 'images/goods/goods018.jpg', '包', '5天', '2.5KG', NULL);
INSERT INTO `goodsinfo`
VALUES (8, '河蚌', 2, 120.00, '很鲜嫩，超实惠', 40, 'images/goods/goods019.jpg', '件', '5天', '2.5KG', NULL);
INSERT INTO `goodsinfo`
VALUES (9, '精品牛肉', 3, 38.00, '很鲜嫩，你值得拥有', 200, 'images/goods/goods31.jpg', '斤', '10天', '500G', NULL);
INSERT INTO `goodsinfo`
VALUES (10, '精品五花肉', 3, 28.00, '很新鲜，超实惠', 100, 'images/goods/goods32.jpg', '斤', '10天', '500G', NULL);
INSERT INTO `goodsinfo`
VALUES (11, '农家土鸡蛋', 4, 66.00, '纯天然，无污染，生态喂养', 100, 'images/goods/goods401.jpg', '盒', '30天', '30个',
        NULL);
INSERT INTO `goodsinfo`
VALUES (12, '天然鹌鹑蛋', 4, 5.00, '生态喂养，天然污染', 100, 'images/goods/goods402.jpg', '斤', '30天', '500G', NULL);
INSERT INTO `goodsinfo`
VALUES (13, '有机芹菜', 5, 8.00, '生态种植，天然无污染', 100, 'images/goods/goods501.jpg;images/goods/goods502.jpg',
        '斤', '10天', '500G', NULL);
INSERT INTO `goodsinfo`
VALUES (14, '有机莴笋', 5, 6.00, '纯天然，无污染，生态种植', 100, 'images/goods/goods503.jpg', '斤', '10天', '500G',
        NULL);
INSERT INTO `goodsinfo`
VALUES (15, '水饺', 6, 30.00, '蔬菜水饺，美味健康', 100, 'images/goods/goods601.jpg;images/goods/goods602.jpg', '包',
        '20天', '2.5KG', NULL);
INSERT INTO `goodsinfo`
VALUES (16, '芝麻汤圆', 6, 28.00, '顺滑养颜，健康美味', 100, 'images/goods/goods603.jpg', '包', '10天', '3KG', NULL);

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`
(
    `tno`    int                                                    NOT NULL AUTO_INCREMENT,
    `tname`  varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `pic`    varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
    `status` int                                                    NULL DEFAULT NULL,
    PRIMARY KEY (`tno`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype`
VALUES (1, '新鲜水果', 'images/banner01.jpg', 1);
INSERT INTO `goodstype`
VALUES (2, '海鲜水产', 'images/banner02.jpg', 1);
INSERT INTO `goodstype`
VALUES (3, '猪牛羊肉', 'images/banner03.jpg', 1);
INSERT INTO `goodstype`
VALUES (4, '禽类蛋品', 'images/banner04.jpg', 1);
INSERT INTO `goodstype`
VALUES (5, '新鲜蔬菜', 'images/banner05.jpg', 1);
INSERT INTO `goodstype`
VALUES (6, '速冻食品', 'images/banner06.jpg', 1);

-- ----------------------------
-- Table structure for memberinfo
-- ----------------------------
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE `memberinfo`
(
    `mno`      int                                                    NOT NULL AUTO_INCREMENT,
    `nickName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `realName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
    `pwd`      varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `tel`      varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin  NOT NULL,
    `email`    varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `photo`    varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
    `regDate`  datetime                                               NULL DEFAULT NULL,
    `status`   int                                                    NULL DEFAULT NULL,
    PRIMARY KEY (`mno`) USING BTREE,
    UNIQUE INDEX `nickName` (`nickName` ASC) USING BTREE,
    UNIQUE INDEX `tel` (`tel` ASC) USING BTREE,
    UNIQUE INDEX `email` (`email` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of memberinfo
-- ----------------------------
INSERT INTO `memberinfo`
VALUES (1, 'navy', 'navy', 'c8837b23ff8aaa8a2dde915473ce0991', '15096098010', '475651857@qq.com', '',
        '2019-10-03 15:56:13', 1);
INSERT INTO `memberinfo`
VALUES (2, 'yc', 'yc', 'c8837b23ff8aaa8a2dde915473ce0991', '15096098012', '1293580602@qq.com', '',
        '2019-10-03 16:41:50', 1);

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo`
(
    `ono`     varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
    `odate`   datetime                                               NULL DEFAULT NULL,
    `ano`     varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
    `sdate`   datetime                                               NULL DEFAULT NULL,
    `rdate`   datetime                                               NULL DEFAULT NULL,
    `status`  int                                                    NULL DEFAULT NULL,
    `price`   decimal(10, 2)                                         NULL DEFAULT NULL,
    `invoice` int                                                    NULL DEFAULT NULL,
    PRIMARY KEY (`ono`) USING BTREE,
    INDEX `FK_orderInfo_ano` (`ano` ASC) USING BTREE,
    CONSTRAINT `FK_orderInfo_ano` FOREIGN KEY (`ano`) REFERENCES `addrinfo` (`ano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for orderiteminfo
-- ----------------------------
DROP TABLE IF EXISTS `orderiteminfo`;
CREATE TABLE `orderiteminfo`
(
    `ino`    int                                                    NOT NULL AUTO_INCREMENT,
    `ono`    varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
    `gno`    int                                                    NULL DEFAULT NULL,
    `nums`   int                                                    NULL DEFAULT NULL,
    `price`  decimal(10, 2)                                         NULL DEFAULT NULL,
    `status` int                                                    NULL DEFAULT NULL,
    PRIMARY KEY (`ino`) USING BTREE,
    INDEX `FK_orderItemInfo_gno` (`gno` ASC) USING BTREE,
    INDEX `FK_orderItemInfo_ono` (`ono` ASC) USING BTREE,
    CONSTRAINT `FK_orderItemInfo_gno` FOREIGN KEY (`gno`) REFERENCES `goodsinfo` (`gno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `FK_orderItemInfo_ono` FOREIGN KEY (`ono`) REFERENCES `orderinfo` (`ono`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_bin
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderiteminfo
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `blob_data`     blob                                                          NULL COMMENT '存放持久化Trigger对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
    `calendar`      blob                                                          NOT NULL COMMENT '存放持久化calendar对象',
    PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`
(
    `sched_name`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
    `time_zone_id`    varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '时区',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Singapore');
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Singapore');
INSERT INTO `qrtz_cron_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Singapore');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `entry_id`          varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '调度器实例id',
    `trigger_name`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `instance_name`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
    `fired_time`        bigint                                                        NOT NULL COMMENT '触发的时间',
    `sched_time`        bigint                                                        NOT NULL COMMENT '定时器制定的时间',
    `priority`          int                                                           NOT NULL COMMENT '优先级',
    `state`             varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '状态',
    `job_name`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
    `job_group`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '是否并发',
    `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '是否接受恢复执行',
    PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `job_name`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
    `job_group`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
    `description`       varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
    `job_class_name`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
    `is_durable`        varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '是否持久化',
    `is_nonconcurrent`  varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '是否并发',
    `is_update_data`    varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '是否更新数据',
    `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '是否接受恢复执行',
    `job_data`          blob                                                          NULL COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL,
        'com.fresh.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E66726573682E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E66726573682E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018C968D60E878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL,
        'com.fresh.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E66726573682E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E66726573682E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018C968D60E878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL,
        'com.fresh.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0',
        0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E66726573682E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E66726573682E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018C968D60E878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`
(
    `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `lock_name`  varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '悲观锁名称',
    PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks`
VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks`
VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`
(
    `sched_name`        varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `instance_name`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
    `last_checkin_time` bigint                                                        NOT NULL COMMENT '上次检查时间',
    `checkin_interval`  bigint                                                        NOT NULL COMMENT '检查间隔时间',
    PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state`
VALUES ('RuoyiScheduler', 'Calyee1703575460391', 1703575853627, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`
(
    `sched_name`      varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `repeat_count`    bigint                                                        NOT NULL COMMENT '重复的次数统计',
    `repeat_interval` bigint                                                        NOT NULL COMMENT '重复的间隔时间',
    `times_triggered` bigint                                                        NOT NULL COMMENT '已经触发的次数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`
(
    `sched_name`    varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `str_prop_1`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
    `str_prop_2`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
    `str_prop_3`    varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
    `int_prop_1`    int                                                           NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
    `int_prop_2`    int                                                           NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
    `long_prop_1`   bigint                                                        NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
    `long_prop_2`   bigint                                                        NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
    `dec_prop_1`    decimal(13, 4)                                                NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
    `dec_prop_2`    decimal(13, 4)                                                NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
    `bool_prop_1`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
    `bool_prop_2`   varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`
(
    `sched_name`     varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
    `trigger_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
    `trigger_group`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
    `job_name`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
    `job_group`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
    `description`    varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
    `next_fire_time` bigint                                                        NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
    `prev_fire_time` bigint                                                        NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
    `priority`       int                                                           NULL DEFAULT NULL COMMENT '优先级',
    `trigger_state`  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '触发器状态',
    `trigger_type`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '触发器的类型',
    `start_time`     bigint                                                        NOT NULL COMMENT '开始时间',
    `end_time`       bigint                                                        NULL DEFAULT NULL COMMENT '结束时间',
    `calendar_name`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
    `misfire_instr`  smallint                                                      NULL DEFAULT NULL COMMENT '补偿执行的策略',
    `job_data`       blob                                                          NULL COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
    INDEX `sched_name` (`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1703575460000, -1, 5,
        'PAUSED', 'CRON', 1703575460000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1703575470000, -1, 5,
        'PAUSED', 'CRON', 1703575460000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers`
VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1703575460000, -1, 5,
        'PAUSED', 'CRON', 1703575460000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int                                                           NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`  datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`  datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-12-23 20:01:36', '',
        NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config`
VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL,
        '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL,
        '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config`
VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL,
        '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-12-23 20:01:36',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-12-23 20:01:36', '', NULL,
        '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint                                                       NULL DEFAULT 0 COMMENT '父部门id',
    `ancestors`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
    `order_num`   int                                                          NULL DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                     NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                     NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 201
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-12-23 20:01:36', '',
        NULL);
INSERT INTO `sys_dept`
VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-12-23 20:01:36', '', NULL);
INSERT INTO `sys_dept`
VALUES (200, 100, '0,100', '衡阳分公司', 3, 'calyee', '15900000000', '599882460@qq.com', '0', '0', 'admin',
        '2023-12-26 16:30:23', 'admin', '2023-12-26 16:30:36');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int                                                           NULL DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '默认分组');
INSERT INTO `sys_dict_data`
VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '系统分组');
INSERT INTO `sys_dict_data`
VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '通知');
INSERT INTO `sys_dict_data`
VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '公告');
INSERT INTO `sys_dict_data`
VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '关闭状态');
INSERT INTO `sys_dict_data`
VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '其他操作');
INSERT INTO `sys_dict_data`
VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '新增操作');
INSERT INTO `sys_dict_data`
VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '修改操作');
INSERT INTO `sys_dict_data`
VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '删除操作');
INSERT INTO `sys_dict_data`
VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '授权操作');
INSERT INTO `sys_dict_data`
VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '导出操作');
INSERT INTO `sys_dict_data`
VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '导入操作');
INSERT INTO `sys_dict_data`
VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '强退操作');
INSERT INTO `sys_dict_data`
VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '生成操作');
INSERT INTO `sys_dict_data`
VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '清空操作');
INSERT INTO `sys_dict_data`
VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-12-23 20:01:36', '', NULL,
        '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE INDEX `dict_type` (`dict_type` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type`
VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type`
VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type`
VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type`
VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type`
VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`
(
    `job_id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    `concurrent`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL     DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
    `status`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL     DEFAULT '0' COMMENT '状态（0正常 1暂停）',
    `create_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '创建者',
    `create_time`     datetime                                                      NULL     DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '更新者',
    `update_time`     datetime                                                      NULL     DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT '' COMMENT '备注信息',
    PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job`
VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin',
        '2023-12-23 20:01:37', '', NULL, '');
INSERT INTO `sys_job`
VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin',
        '2023-12-23 20:01:37', '', NULL, '');
INSERT INTO `sys_job`
VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?',
        '3', '1', '1', 'admin', '2023-12-23 20:01:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`
(
    `job_log_id`     bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '日志信息',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci       NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
    `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
    `create_time`    datetime                                                       NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '用户账号',
    `ipaddr`         varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
    `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
    `browser`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '浏览器类型',
    `os`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '操作系统',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
    `login_time`     datetime                                                      NULL DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE,
    INDEX `idx_sys_logininfor_s` (`status` ASC) USING BTREE,
    INDEX `idx_sys_logininfor_lt` (`login_time` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 119
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor`
VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-23 20:05:16');
INSERT INTO `sys_logininfor`
VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-25 18:57:35');
INSERT INTO `sys_logininfor`
VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-25 20:26:42');
INSERT INTO `sys_logininfor`
VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-25 20:47:59');
INSERT INTO `sys_logininfor`
VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 15:38:12');
INSERT INTO `sys_logininfor`
VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 16:06:05');
INSERT INTO `sys_logininfor`
VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 16:08:45');
INSERT INTO `sys_logininfor`
VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 16:57:05');
INSERT INTO `sys_logininfor`
VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2023-12-26 17:02:10');
INSERT INTO `sys_logininfor`
VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 17:02:15');
INSERT INTO `sys_logininfor`
VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 17:03:14');
INSERT INTO `sys_logininfor`
VALUES (111, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 17:03:29');
INSERT INTO `sys_logininfor`
VALUES (112, 'calyee', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 17:03:41');
INSERT INTO `sys_logininfor`
VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 17:03:45');
INSERT INTO `sys_logininfor`
VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2023-12-26 17:36:45');
INSERT INTO `sys_logininfor`
VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 17:36:48');
INSERT INTO `sys_logininfor`
VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 19:15:10');
INSERT INTO `sys_logininfor`
VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 19:57:00');
INSERT INTO `sys_logininfor`
VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 19:57:03');
INSERT INTO `sys_logininfor`
VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 20:52:08');
INSERT INTO `sys_logininfor`
VALUES (120, 'yaya', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 20:52:17');
INSERT INTO `sys_logininfor`
VALUES (121, 'yaya', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 20:52:44');
INSERT INTO `sys_logininfor`
VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 20:52:54');
INSERT INTO `sys_logininfor`
VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 20:52:59');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint                                                        NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int                                                           NULL DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
    `is_frame`    int                                                           NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
    `is_cache`    int                                                           NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2013
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-23 20:01:36', '',
        NULL, '系统管理目录');
INSERT INTO `sys_menu`
VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-12-23 20:01:36',
        '', NULL, '系统监控目录');
INSERT INTO `sys_menu`
VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-12-23 20:01:36', '',
        NULL, '系统工具目录');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2023-12-23 20:01:36', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2023-12-23 20:01:36', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table',
        'admin', '2023-12-23 20:01:36', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu`
VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree',
        'admin', '2023-12-23 20:01:36', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu`
VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post',
        'admin', '2023-12-23 20:01:36', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu`
VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2023-12-23 20:01:36', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu`
VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit',
        'admin', '2023-12-23 20:01:36', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu`
VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list',
        'message', 'admin', '2023-12-23 20:01:36', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu`
VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-12-23 20:01:36', '', NULL,
        '日志管理菜单');
INSERT INTO `sys_menu`
VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list',
        'online', 'admin', '2023-12-23 20:01:36', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu`
VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin',
        '2023-12-23 20:01:36', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu`
VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid',
        'admin', '2023-12-23 20:01:36', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu`
VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list',
        'server', 'admin', '2023-12-23 20:01:36', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu`
VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis',
        'admin', '2023-12-23 20:01:36', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu`
VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list',
        'redis-list', 'admin', '2023-12-23 20:01:36', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu`
VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build',
        'admin', '2023-12-23 20:01:36', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu`
VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2023-12-23 20:01:36', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu`
VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger',
        'admin', '2023-12-23 20:01:36', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu`
VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list',
        'form', 'admin', '2023-12-23 20:01:36', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu`
VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0',
        'monitor:logininfor:list', 'logininfor', 'admin', '2023-12-23 20:01:36', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu`
VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin',
        '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2003, '会员管理', 0, 4, 'memberinfo', 'system/memberinfo/index', NULL, 1, 0, 'C', '0', '0',
        'system:memberinfo:list', 'peoples', 'admin', '2023-12-23 20:28:26', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2004, '商品管理', 0, 5, 'goods', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'shopping', 'admin',
        '2023-12-26 19:51:46', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2005, '商品详情', 2004, 1, 'goodsinfo', 'system/goodsinfo/index', NULL, 1, 0, 'C', '0', '0',
        'system:goodsinfo:list', 'skill', 'admin', '2023-12-26 19:53:12', 'admin', '2023-12-26 19:59:51', '');
INSERT INTO `sys_menu`
VALUES (2006, '商品类型', 2004, 2, 'goodstype', 'system/goodstype/index', NULL, 1, 0, 'C', '0', '0',
        'system:goodstype:list', 'example', 'admin', '2023-12-26 19:56:04', 'admin', '2023-12-26 19:59:57', '');
INSERT INTO `sys_menu`
VALUES (2007, '用户信息管理', 2008, 1, 'admininfo', 'system/admininfo/index', NULL, 1, 1, 'C', '0', '0',
        'system:admininfo:list', 'user', 'admin', '2023-12-26 20:02:10', 'admin', '2023-12-26 20:04:31', '');
INSERT INTO `sys_menu`
VALUES (2008, '用户管理', 0, 6, 'user', NULL, NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2023-12-26 20:04:02',
        'admin', '2023-12-26 20:04:21', '');
INSERT INTO `sys_menu`
VALUES (2009, '收货地址管理', 2008, 2, 'addrinfo', 'system/addrinfo/index', NULL, 1, 1, 'C', '0', '0',
        'system:addrinfo:list', 'edit', 'admin', '2023-12-26 20:05:19', 'admin', '2023-12-26 20:05:26', '');
INSERT INTO `sys_menu`
VALUES (2011, '订单信息管理', 0, 7, 'orderinfo', 'system/orderinfo/index', NULL, 1, 1, 'C', '0', '0',
        'system:orderinfo:list', 'documentation', 'admin', '2023-12-26 20:08:47', 'admin', '2023-12-26 20:10:54', '');
INSERT INTO `sys_menu`
VALUES (2012, '优惠券', 0, 6, 'coupon', 'system/coupon/index', NULL, 1, 0, 'C', '0', '0', 'system:coupon:list',
        'monitor', 'admin', '2023-12-26 20:14:13', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `notice_id`      int                                                           NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob                                                      NULL COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice`
VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin',
        '2023-12-23 20:01:37', '', NULL, '管理员');
INSERT INTO `sys_notice`
VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-12-23 20:01:37',
        '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '模块标题',
    `business_type`  int                                                            NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '请求方式',
    `operator_type`  int                                                            NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
    `status`         int                                                            NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime                                                       NULL DEFAULT NULL COMMENT '操作时间',
    `cost_time`      bigint                                                         NULL DEFAULT 0 COMMENT '消耗时间',
    PRIMARY KEY (`oper_id`) USING BTREE,
    INDEX `idx_sys_oper_log_bt` (`business_type` ASC) USING BTREE,
    INDEX `idx_sys_oper_log_s` (`status` ASC) USING BTREE,
    INDEX `idx_sys_oper_log_ot` (`oper_time` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 163
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log`
VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会员管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"member\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:08:51', 21);
INSERT INTO `sys_oper_log`
VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP',
        '{\"tables\":\"memberinfo,admininfo,cartinfo,goodsinfo,goodstype,orderinfo,addrinfo,orderiteminfo\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:11:15', 193);
INSERT INTO `sys_oper_log`
VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"memberinfo\"}', NULL, 0, NULL,
        '2023-12-23 20:11:21', 243);
INSERT INTO `sys_oper_log`
VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"addrinfo\"}', NULL, 0, NULL,
        '2023-12-23 20:11:26', 38);
INSERT INTO `sys_oper_log`
VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"admininfo\"}', NULL, 0, NULL,
        '2023-12-23 20:11:27', 28);
INSERT INTO `sys_oper_log`
VALUES (105, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"cartinfo\"}', NULL, 0, NULL,
        '2023-12-23 20:11:28', 22);
INSERT INTO `sys_oper_log`
VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"goodsinfo\"}', NULL, 0, NULL,
        '2023-12-23 20:11:29', 35);
INSERT INTO `sys_oper_log`
VALUES (107, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"goodstype\"}', NULL, 0, NULL,
        '2023-12-23 20:11:33', 21);
INSERT INTO `sys_oper_log`
VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"orderinfo\"}', NULL, 0, NULL,
        '2023-12-23 20:11:34', 38);
INSERT INTO `sys_oper_log`
VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"orderiteminfo\"}', NULL, 0, NULL,
        '2023-12-23 20:11:35', 32);
INSERT INTO `sys_oper_log`
VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/member/index\",\"createBy\":\"admin\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会员相关\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"member\",\"perms\":\"system:member:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:16:14', 116);
INSERT INTO `sys_oper_log`
VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/memberinfo/index\",\"createTime\":\"2023-12-23 20:16:14\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"会员相关\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"member\",\"perms\":\"system:memberinfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:17:29', 10);
INSERT INTO `sys_oper_log`
VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/memberinfo/index\",\"createTime\":\"2023-12-23 20:16:14\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"会员相关\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"memberinfo\",\"perms\":\"system:memberinfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:18:41', 9);
INSERT INTO `sys_oper_log`
VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2023-12-23 20:08:51\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"会员管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"memberinfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:18:46', 9);
INSERT INTO `sys_oper_log`
VALUES (114, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '{}',
        '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-12-23 20:20:02', 4);
INSERT INTO `sys_oper_log`
VALUES (115, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2023-12-23 20:20:06', 23);
INSERT INTO `sys_oper_log`
VALUES (116, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2023-12-23 20:20:08', 11);
INSERT INTO `sys_oper_log`
VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"/system/memberinfo/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会员管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"memberinfo\",\"perms\":\"system:memberinfo:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:21:11', 19);
INSERT INTO `sys_oper_log`
VALUES (118, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2023-12-23 20:24:24', 12);
INSERT INTO `sys_oper_log`
VALUES (119, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"memberinfo\"}', NULL, 0, NULL,
        '2023-12-23 20:27:01', 147);
INSERT INTO `sys_oper_log`
VALUES (120, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/memberinfo/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会员管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"memberinfo\",\"perms\":\"system:memberinfo:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:28:26', 9);
INSERT INTO `sys_oper_log`
VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"memberinfo\",\"className\":\"Memberinfo\",\"columns\":[{\"capJavaField\":\"Mno\",\"columnComment\":\"会员编号\",\"columnId\":34,\"columnName\":\"mno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mno\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"昵称\",\"columnId\":35,\"columnName\":\"nickName\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RealName\",\"columnComment\":\"姓名\",\"columnId\":36,\"columnName\":\"realName\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"realName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pwd\",\"columnComment\":\"密码\",\"columnId\":37,\"columnName\":\"pwd\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pw',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-23 20:35:03', 68);
INSERT INTO `sys_oper_log`
VALUES (122, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"memberinfo\"}', NULL, 0, NULL,
        '2023-12-23 20:35:09', 161);
INSERT INTO `sys_oper_log`
VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"memberinfo\",\"className\":\"Memberinfo\",\"columns\":[{\"capJavaField\":\"Mno\",\"columnComment\":\"会员编号\",\"columnId\":34,\"columnName\":\"mno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mno\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-12-23 20:35:03\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"昵称\",\"columnId\":35,\"columnName\":\"nickName\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-12-23 20:35:03\",\"usableColumn\":false},{\"capJavaField\":\"RealName\",\"columnComment\":\"姓名\",\"columnId\":36,\"columnName\":\"realName\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"realName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-12-23 20:35:03\",\"usableColumn\":false},{\"capJavaField\":\"Pwd\",\"columnComment\":\"密码\",\"columnId\":37,\"columnName\":\"pwd\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:03:01', 54);
INSERT INTO `sys_oper_log`
VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"addrinfo\",\"className\":\"Addrinfo\",\"columns\":[{\"capJavaField\":\"Ano\",\"columnComment\":\"编号\",\"columnId\":1,\"columnName\":\"ano\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ano\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Mno\",\"columnComment\":\"会员编号\",\"columnId\":2,\"columnName\":\"mno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mno\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":3,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Tel\",\"columnComment\":\"电话号码\",\"columnId\":4,\"columnName\":\"tel\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"tel\",\"javaType\":\"String\",\"list\":true,',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:07:50', 43);
INSERT INTO `sys_oper_log`
VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"memberinfo\",\"className\":\"Memberinfo\",\"columns\":[{\"capJavaField\":\"Mno\",\"columnComment\":\"会员编号\",\"columnId\":34,\"columnName\":\"mno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mno\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-12-25 19:03:01\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"昵称\",\"columnId\":35,\"columnName\":\"nickName\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-12-25 19:03:01\",\"usableColumn\":false},{\"capJavaField\":\"RealName\",\"columnComment\":\"姓名\",\"columnId\":36,\"columnName\":\"realName\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"realName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-12-25 19:03:01\",\"usableColumn\":false},{\"capJavaField\":\"Pwd\",\"columnComment\":\"密码\",\"columnId\":37,\"columnName\":\"pwd\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:08:22', 32);
INSERT INTO `sys_oper_log`
VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"admininfo\",\"className\":\"Admininfo\",\"columns\":[{\"capJavaField\":\"Aid\",\"columnComment\":\"编号\",\"columnId\":11,\"columnName\":\"aid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"aid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Aname\",\"columnComment\":\"姓名\",\"columnId\":12,\"columnName\":\"aname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"aname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pwd\",\"columnComment\":\"密码\",\"columnId\":13,\"columnName\":\"pwd\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pwd\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Tel\",\"columnComment\":\"电话号码\",\"columnId\":14,\"columnName\":\"tel\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"tel\",\"javaType\":\"String\",\"list\":',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:09:16', 16);
INSERT INTO `sys_oper_log`
VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"cartinfo\",\"className\":\"Cartinfo\",\"columns\":[{\"capJavaField\":\"Cno\",\"columnComment\":\"购物车编号\",\"columnId\":15,\"columnName\":\"cno\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"cno\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Mno\",\"columnComment\":\"会员编号\",\"columnId\":16,\"columnName\":\"mno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mno\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gno\",\"columnComment\":\"商品编号\",\"columnId\":17,\"columnName\":\"gno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gno\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Num\",\"columnComment\":\"数量\",\"columnId\":18,\"columnName\":\"num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"num\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":f',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:10:19', 20);
INSERT INTO `sys_oper_log`
VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"goodsinfo\",\"className\":\"Goodsinfo\",\"columns\":[{\"capJavaField\":\"Gno\",\"columnComment\":\"商品编号\",\"columnId\":19,\"columnName\":\"gno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gno\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gname\",\"columnComment\":\"商品名\",\"columnId\":20,\"columnName\":\"gname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Tno\",\"columnComment\":\"商品类型\",\"columnId\":21,\"columnName\":\"tno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"tno\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Price\",\"columnComment\":\"价格\",\"columnId\":22,\"columnName\":\"price\",\"columnType\":\"decimal(8,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"price\",\"javaType\":\"BigDecimal\",\"li',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:13:00', 37);
INSERT INTO `sys_oper_log`
VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"goodstype\",\"className\":\"Goodstype\",\"columns\":[{\"capJavaField\":\"Tno\",\"columnComment\":\"类型编号\",\"columnId\":30,\"columnName\":\"tno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"tno\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Tname\",\"columnComment\":\"类型名\",\"columnId\":31,\"columnName\":\"tname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"tname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pic\",\"columnComment\":\"照片\",\"columnId\":32,\"columnName\":\"pic\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"pic\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态\",\"columnId\":33,\"columnName\":\"status\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"Long\",\"list\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:13:51', 20);
INSERT INTO `sys_oper_log`
VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"orderinfo\",\"className\":\"Orderinfo\",\"columns\":[{\"capJavaField\":\"Ono\",\"columnComment\":\"编号\",\"columnId\":43,\"columnName\":\"ono\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ono\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Odate\",\"columnComment\":\"下单时间\",\"columnId\":44,\"columnName\":\"odate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"odate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Ano\",\"columnComment\":\"地址编号\",\"columnId\":45,\"columnName\":\"ano\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ano\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sdate\",\"columnComment\":\"下单日期?\",\"columnId\":46,\"columnName\":\"sdate\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"sdate\",\"javaTy',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:16:23', 18);
INSERT INTO `sys_oper_log`
VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"orderiteminfo\",\"className\":\"Orderiteminfo\",\"columns\":[{\"capJavaField\":\"Ino\",\"columnComment\":\"编号\",\"columnId\":51,\"columnName\":\"ino\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ino\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Ono\",\"columnComment\":\"订单编号\",\"columnId\":52,\"columnName\":\"ono\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"ono\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gno\",\"columnComment\":\"商品编号\",\"columnId\":53,\"columnName\":\"gno\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"gno\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Nums\",\"columnComment\":\"数量\",\"columnId\":54,\"columnName\":\"nums\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-12-23 20:11:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"nums\",\"javaType\":\"Long\",\"list\":true,\"params\":',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-25 19:17:52', 21);
INSERT INTO `sys_oper_log`
VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP',
        '{\"tables\":\"addrinfo,admininfo,cartinfo,goodsinfo,goodstype,memberinfo,orderinfo,orderiteminfo\"}', NULL, 0,
        NULL, '2023-12-25 19:19:49', 478);
INSERT INTO `sys_oper_log`
VALUES (133, '角色管理', 1, 'com.fresh.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003],\"params\":{},\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品管理\",\"roleSort\":3,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 16:28:00', 79);
INSERT INTO `sys_oper_log`
VALUES (134, '岗位管理', 1, 'com.fresh.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/post', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"fresh\",\"postId\":5,\"postName\":\"商品管理员\",\"postSort\":5,\"remark\":\"商品管理\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 16:29:31', 18);
INSERT INTO `sys_oper_log`
VALUES (135, '部门管理', 1, 'com.fresh.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"衡阳分公司\",\"email\":\"599882460@qq.com\",\"leader\":\"calyee\",\"orderNum\":100,\"params\":{},\"parentId\":100,\"phone\":\"15900000000\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 16:30:24', 27);
INSERT INTO `sys_oper_log`
VALUES (136, '部门管理', 2, 'com.fresh.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"衡阳分公司\",\"email\":\"599882460@qq.com\",\"leader\":\"calyee\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"parentName\":\"若依科技\",\"phone\":\"15900000000\",\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 16:30:36', 24);
INSERT INTO `sys_oper_log`
VALUES (137, '用户管理', 1, 'com.fresh.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"email\":\"599882460@qq.com\",\"nickName\":\"calyee\",\"params\":{},\"postIds\":[5],\"remark\":\"商品管理\",\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"calyee\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 17:03:08', 121);
INSERT INTO `sys_oper_log`
VALUES (138, '代码生成', 6, 'com.fresh.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"coupon\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 17:04:51', 61);
INSERT INTO `sys_oper_log`
VALUES (139, '代码生成', 2, 'com.fresh.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"coupon\",\"className\":\"Coupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"优惠券编号\",\"columnId\":57,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:04:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"优惠卷标题\",\"columnId\":58,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:04:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Img\",\"columnComment\":\"优惠卷的图片信息\",\"columnId\":59,\"columnName\":\"img\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:04:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"img\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Money\",\"columnComment\":\"优惠卷的金额\",\"columnId\":60,\"columnName\":\"money\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-12-26 17:04:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"money\",\"javaType\":\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 17:05:50', 37);
INSERT INTO `sys_oper_log`
VALUES (140, '代码生成', 8, 'com.fresh.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP',
        '{\"tables\":\"addrinfo,admininfo,cartinfo,goodsinfo,goodstype,memberinfo,orderinfo,orderiteminfo,coupon\"}',
        NULL, 0, NULL, '2023-12-26 17:05:58', 481);
INSERT INTO `sys_oper_log`
VALUES (141, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"goods\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 19:51:46', 53);
INSERT INTO `sys_oper_log`
VALUES (142, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/goods/goodsinfo\",\"createBy\":\"admin\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品详情\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"goods\",\"perms\":\"system:goodsinfo:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 19:53:12', 11);
INSERT INTO `sys_oper_log`
VALUES (143, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/goodsinfo/index\",\"createTime\":\"2023-12-26 19:53:12\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"商品详情\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"goods\",\"perms\":\"system:goodsinfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 19:54:03', 14);
INSERT INTO `sys_oper_log`
VALUES (144, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/goodstype/index\",\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品类型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2005,\"path\":\"goods\",\"perms\":\"system:goodstype:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 19:56:04', 14);
INSERT INTO `sys_oper_log`
VALUES (145, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/goodstype/index\",\"createTime\":\"2023-12-26 19:56:04\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"商品类型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"goods\",\"perms\":\"system:goodstype:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 19:56:16', 20);
INSERT INTO `sys_oper_log`
VALUES (146, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/goodsinfo/index\",\"createTime\":\"2023-12-26 19:53:12\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"商品详情\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2004,\"path\":\"goodsinfo\",\"perms\":\"system:goodsinfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 19:59:51', 20);
INSERT INTO `sys_oper_log`
VALUES (147, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/goodstype/index\",\"createTime\":\"2023-12-26 19:56:04\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"商品类型\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2004,\"path\":\"goodstype\",\"perms\":\"system:goodstype:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 19:59:57', 22);
INSERT INTO `sys_oper_log`
VALUES (148, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/admininfo/index\",\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"admininfo\",\"perms\":\"system:admininfo:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:02:10', 10);
INSERT INTO `sys_oper_log`
VALUES (149, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/admininfo/index\",\"createTime\":\"2023-12-26 20:02:10\",\"icon\":\"user\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"admininfo\",\"perms\":\"system:admininfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:03:38', 11);
INSERT INTO `sys_oper_log`
VALUES (150, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"新增菜单\'用户管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2023-12-26 20:03:59', 4);
INSERT INTO `sys_oper_log`
VALUES (151, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户管理1\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:04:02', 9);
INSERT INTO `sys_oper_log`
VALUES (152, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/admininfo/index\",\"createTime\":\"2023-12-26 20:02:10\",\"icon\":\"user\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"用户信息管理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2008,\"path\":\"admininfo\",\"perms\":\"system:admininfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:04:17', 9);
INSERT INTO `sys_oper_log`
VALUES (153, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2023-12-26 20:04:02\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"用户管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:04:21', 11);
INSERT INTO `sys_oper_log`
VALUES (154, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/admininfo/index\",\"createTime\":\"2023-12-26 20:02:10\",\"icon\":\"user\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"用户信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"admininfo\",\"perms\":\"system:admininfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:04:31', 10);
INSERT INTO `sys_oper_log`
VALUES (155, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/addrinfo/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"收货地址管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"addrinfo\",\"perms\":\"system:addrinfo:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:05:19', 9);
INSERT INTO `sys_oper_log`
VALUES (156, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/addrinfo/index\",\"createTime\":\"2023-12-26 20:05:19\",\"icon\":\"edit\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"收货地址管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"addrinfo\",\"perms\":\"system:addrinfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:05:26', 21);
INSERT INTO `sys_oper_log`
VALUES (157, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"order\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:07:43', 9);
INSERT INTO `sys_oper_log`
VALUES (158, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/orderinfo/index\",\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"订单信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"path\":\"orderinfo\",\"perms\":\"system:orderinfo:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:08:47', 21);
INSERT INTO `sys_oper_log`
VALUES (159, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/orderinfo/index\",\"createTime\":\"2023-12-26 20:08:47\",\"icon\":\"money\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"订单信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"orderinfo\",\"perms\":\"system:orderinfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:10:34', 9);
INSERT INTO `sys_oper_log`
VALUES (160, '菜单管理', 3, 'com.fresh.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2010', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2023-12-26 20:10:41', 24);
INSERT INTO `sys_oper_log`
VALUES (161, '菜单管理', 2, 'com.fresh.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/orderinfo/index\",\"createTime\":\"2023-12-26 20:08:47\",\"icon\":\"documentation\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"订单信息管理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"orderinfo\",\"perms\":\"system:orderinfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:10:54', 9);
INSERT INTO `sys_oper_log`
VALUES (162, '菜单管理', 1, 'com.fresh.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/coupon/index\",\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"优惠券\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"coupon\",\"perms\":\"system:coupon:list\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:14:13', 12);
INSERT INTO `sys_oper_log`
VALUES (163, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createTime\":\"2023-12-26 16:28:00\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2004,2005,2006,2012,2008,2007,2009,2011],\"params\":{},\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:48:50', 57);
INSERT INTO `sys_oper_log`
VALUES (164, '角色管理', 2, 'com.fresh.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createTime\":\"2023-12-26 16:28:00\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2003,2004,2005,2006,2012,2008,2007,2009,2011],\"params\":{},\"roleId\":100,\"roleKey\":\"fresh\",\"roleName\":\"商品后台管理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:48:59', 32);
INSERT INTO `sys_oper_log`
VALUES (165, '用户管理', 1, 'com.fresh.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"nickName\":\"yaya\",\"params\":{},\"postIds\":[5],\"roleIds\":[100],\"status\":\"0\",\"userId\":101,\"userName\":\"yaya\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:49:36', 102);
INSERT INTO `sys_oper_log`
VALUES (166, '用户管理', 1, 'com.fresh.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"nickName\":\"along\",\"params\":{},\"postIds\":[5],\"roleIds\":[100],\"status\":\"0\",\"userId\":102,\"userName\":\"along\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-26 20:49:53', 84);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`
(
    `post_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    `post_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '岗位名称',
    `post_sort`   int                                                           NOT NULL COMMENT '显示顺序',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post`
VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_post`
VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_post`
VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_post`
VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-12-23 20:01:36', '', NULL, '');
INSERT INTO `sys_post`
VALUES (5, 'fresh', '商品管理员', 5, '0', 'admin', '2023-12-26 16:29:31', '', NULL, '商品管理');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int                                                           NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1)                                                    NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)                                                    NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
    `status`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`         datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`         datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 101
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '超级管理员');
INSERT INTO `sys_role`
VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-12-23 20:01:36', '', NULL, '普通角色');
INSERT INTO `sys_role`
VALUES (100, '商品后台管理', 'fresh', 3, '1', 1, 1, '0', '0', 'admin', '2023-12-26 16:28:00', 'admin',
        '2023-12-26 20:48:59', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `dept_id` bigint NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept`
VALUES (2, 100);
INSERT INTO `sys_role_dept`
VALUES (2, 101);
INSERT INTO `sys_role_dept`
VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `menu_id` bigint NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (2, 1);
INSERT INTO `sys_role_menu`
VALUES (2, 2);
INSERT INTO `sys_role_menu`
VALUES (2, 3);
INSERT INTO `sys_role_menu`
VALUES (2, 4);
INSERT INTO `sys_role_menu`
VALUES (2, 100);
INSERT INTO `sys_role_menu`
VALUES (2, 101);
INSERT INTO `sys_role_menu`
VALUES (2, 102);
INSERT INTO `sys_role_menu`
VALUES (2, 103);
INSERT INTO `sys_role_menu`
VALUES (2, 104);
INSERT INTO `sys_role_menu`
VALUES (2, 105);
INSERT INTO `sys_role_menu`
VALUES (2, 106);
INSERT INTO `sys_role_menu`
VALUES (2, 107);
INSERT INTO `sys_role_menu`
VALUES (2, 108);
INSERT INTO `sys_role_menu`
VALUES (2, 109);
INSERT INTO `sys_role_menu`
VALUES (2, 110);
INSERT INTO `sys_role_menu`
VALUES (2, 111);
INSERT INTO `sys_role_menu`
VALUES (2, 112);
INSERT INTO `sys_role_menu`
VALUES (2, 113);
INSERT INTO `sys_role_menu`
VALUES (2, 114);
INSERT INTO `sys_role_menu`
VALUES (2, 115);
INSERT INTO `sys_role_menu`
VALUES (2, 116);
INSERT INTO `sys_role_menu`
VALUES (2, 117);
INSERT INTO `sys_role_menu`
VALUES (2, 500);
INSERT INTO `sys_role_menu`
VALUES (2, 501);
INSERT INTO `sys_role_menu`
VALUES (2, 1000);
INSERT INTO `sys_role_menu`
VALUES (2, 1001);
INSERT INTO `sys_role_menu`
VALUES (2, 1002);
INSERT INTO `sys_role_menu`
VALUES (2, 1003);
INSERT INTO `sys_role_menu`
VALUES (2, 1004);
INSERT INTO `sys_role_menu`
VALUES (2, 1005);
INSERT INTO `sys_role_menu`
VALUES (2, 1006);
INSERT INTO `sys_role_menu`
VALUES (2, 1007);
INSERT INTO `sys_role_menu`
VALUES (2, 1008);
INSERT INTO `sys_role_menu`
VALUES (2, 1009);
INSERT INTO `sys_role_menu`
VALUES (2, 1010);
INSERT INTO `sys_role_menu`
VALUES (2, 1011);
INSERT INTO `sys_role_menu`
VALUES (2, 1012);
INSERT INTO `sys_role_menu`
VALUES (2, 1013);
INSERT INTO `sys_role_menu`
VALUES (2, 1014);
INSERT INTO `sys_role_menu`
VALUES (2, 1015);
INSERT INTO `sys_role_menu`
VALUES (2, 1016);
INSERT INTO `sys_role_menu`
VALUES (2, 1017);
INSERT INTO `sys_role_menu`
VALUES (2, 1018);
INSERT INTO `sys_role_menu`
VALUES (2, 1019);
INSERT INTO `sys_role_menu`
VALUES (2, 1020);
INSERT INTO `sys_role_menu`
VALUES (2, 1021);
INSERT INTO `sys_role_menu`
VALUES (2, 1022);
INSERT INTO `sys_role_menu`
VALUES (2, 1023);
INSERT INTO `sys_role_menu`
VALUES (2, 1024);
INSERT INTO `sys_role_menu`
VALUES (2, 1025);
INSERT INTO `sys_role_menu`
VALUES (2, 1026);
INSERT INTO `sys_role_menu`
VALUES (2, 1027);
INSERT INTO `sys_role_menu`
VALUES (2, 1028);
INSERT INTO `sys_role_menu`
VALUES (2, 1029);
INSERT INTO `sys_role_menu`
VALUES (2, 1030);
INSERT INTO `sys_role_menu`
VALUES (2, 1031);
INSERT INTO `sys_role_menu`
VALUES (2, 1032);
INSERT INTO `sys_role_menu`
VALUES (2, 1033);
INSERT INTO `sys_role_menu`
VALUES (2, 1034);
INSERT INTO `sys_role_menu`
VALUES (2, 1035);
INSERT INTO `sys_role_menu`
VALUES (2, 1036);
INSERT INTO `sys_role_menu`
VALUES (2, 1037);
INSERT INTO `sys_role_menu`
VALUES (2, 1038);
INSERT INTO `sys_role_menu`
VALUES (2, 1039);
INSERT INTO `sys_role_menu`
VALUES (2, 1040);
INSERT INTO `sys_role_menu`
VALUES (2, 1041);
INSERT INTO `sys_role_menu`
VALUES (2, 1042);
INSERT INTO `sys_role_menu`
VALUES (2, 1043);
INSERT INTO `sys_role_menu`
VALUES (2, 1044);
INSERT INTO `sys_role_menu`
VALUES (2, 1045);
INSERT INTO `sys_role_menu`
VALUES (2, 1046);
INSERT INTO `sys_role_menu`
VALUES (2, 1047);
INSERT INTO `sys_role_menu`
VALUES (2, 1048);
INSERT INTO `sys_role_menu`
VALUES (2, 1049);
INSERT INTO `sys_role_menu`
VALUES (2, 1050);
INSERT INTO `sys_role_menu`
VALUES (2, 1051);
INSERT INTO `sys_role_menu`
VALUES (2, 1052);
INSERT INTO `sys_role_menu`
VALUES (2, 1053);
INSERT INTO `sys_role_menu`
VALUES (2, 1054);
INSERT INTO `sys_role_menu`
VALUES (2, 1055);
INSERT INTO `sys_role_menu`
VALUES (2, 1056);
INSERT INTO `sys_role_menu`
VALUES (2, 1057);
INSERT INTO `sys_role_menu`
VALUES (2, 1058);
INSERT INTO `sys_role_menu`
VALUES (2, 1059);
INSERT INTO `sys_role_menu`
VALUES (2, 1060);
INSERT INTO `sys_role_menu`
VALUES (100, 2003);
INSERT INTO `sys_role_menu`
VALUES (100, 2004);
INSERT INTO `sys_role_menu`
VALUES (100, 2005);
INSERT INTO `sys_role_menu`
VALUES (100, 2006);
INSERT INTO `sys_role_menu`
VALUES (100, 2007);
INSERT INTO `sys_role_menu`
VALUES (100, 2008);
INSERT INTO `sys_role_menu`
VALUES (100, 2009);
INSERT INTO `sys_role_menu`
VALUES (100, 2011);
INSERT INTO `sys_role_menu`
VALUES (100, 2012);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`     bigint                                                        NULL DEFAULT NULL COMMENT '部门ID',
    `user_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户账号',
    `nick_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户昵称',
    `user_type`   varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '用户邮箱',
    `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '手机号码',
    `sex`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
    `password`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `login_ip`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime                                                      NULL DEFAULT NULL COMMENT '最后登录时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 101
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-12-26 20:52:55',
        'admin', '2023-12-23 20:01:36', '', '2023-12-26 20:52:54', '管理员');
INSERT INTO `sys_user`
VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-12-23 20:01:36',
        'admin', '2023-12-23 20:01:36', '', NULL, '测试员');
INSERT INTO `sys_user`
VALUES (100, 200, 'calyee', 'calyee', '00', '599882460@qq.com', '', '0', '',
        '$2a$10$ejYCszG2a6bZzUpiVpWf4eJUtYdmbD/zvMbxgw8ck6gCmVBi4hIPy', '0', '0', '127.0.0.1', '2023-12-26 17:03:29',
        'admin', '2023-12-26 17:03:08', '', '2023-12-26 17:03:29', '商品管理');
INSERT INTO `sys_user`
VALUES (101, 200, 'yaya', 'yaya', '00', '', '', '0', '', '$2a$10$dCcq8hZxaq39P/MWXUMiv.TaC0D34.1Sxdo69cQeT38o1Pq7VUWo.',
        '0', '0', '127.0.0.1', '2023-12-26 20:52:18', 'admin', '2023-12-26 20:49:35', '', '2023-12-26 20:52:17', NULL);
INSERT INTO `sys_user`
VALUES (102, 200, 'along', 'along', '00', '', '', '0', '',
        '$2a$10$BpQ.QOdunlrqAcWHt26MnOWOvx0y41M2J7ikb1R43Z/px6./NjbEW', '0', '0', '', NULL, 'admin',
        '2023-12-26 20:49:53', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `post_id` bigint NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post`
VALUES (1, 1);
INSERT INTO `sys_user_post`
VALUES (2, 2);
INSERT INTO `sys_user_post`
VALUES (100, 5);
INSERT INTO `sys_user_post`
VALUES (101, 5);
INSERT INTO `sys_user_post`
VALUES (102, 5);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `role_id` bigint NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1);
INSERT INTO `sys_user_role`
VALUES (2, 2);
INSERT INTO `sys_user_role`
VALUES (100, 100);
INSERT INTO `sys_user_role`
VALUES (101, 100);
INSERT INTO `sys_user_role`
VALUES (102, 100);

SET FOREIGN_KEY_CHECKS = 1;
