/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : db_market

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 09/09/2024 08:11:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '部门名称',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` (`id`, `name`, `info`, `state`) VALUES (8, '销售部', '销售部门', '0');
COMMIT;

-- ----------------------------
-- Table structure for detail_sale_records
-- ----------------------------
DROP TABLE IF EXISTS `detail_sale_records`;
CREATE TABLE `detail_sale_records` (
  `sell_cn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '销售订单号',
  `goods_id` bigint NOT NULL COMMENT '商品编号',
  `goods_num` bigint NOT NULL COMMENT '商品数量',
  `goods_price` double(10,2) NOT NULL COMMENT '销售单价',
  `goods_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '商品名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detail_sale_records
-- ----------------------------
BEGIN;
INSERT INTO `detail_sale_records` (`sell_cn`, `goods_id`, `goods_num`, `goods_price`, `goods_name`) VALUES ('1701213155180429314', 7, 1, 120.00, '运动鞋');
INSERT INTO `detail_sale_records` (`sell_cn`, `goods_id`, `goods_num`, `goods_price`, `goods_name`) VALUES ('1701220094014722049', 9, 1, 350.00, '桌椅套装');
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '住址',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `head_img` longtext CHARACTER SET utf8mb3 COLLATE utf8_bin COMMENT '头像',
  `state` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '状态 0：在职 1：离职',
  `isAdmin` bit(1) DEFAULT NULL COMMENT '是否是超管 1:是 0不是',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `createby` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `age` int DEFAULT NULL COMMENT '年龄',
  `deptId` bigint DEFAULT NULL COMMENT '部门主键',
  `id_card` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `leave_time` datetime DEFAULT NULL COMMENT '离职时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` (`id`, `phone`, `email`, `address`, `sex`, `password`, `nick_name`, `head_img`, `state`, `isAdmin`, `info`, `createby`, `create_time`, `age`, `deptId`, `id_card`, `leave_time`) VALUES (1, '13333333333', '123@qq.com', '杭州市余杭区水果摊', '1', '123456', '杭州水果捞', '/files/1725801956845_1.jpg', '0', b'1', '系统管理员', '张三', '2024-09-08 13:26:31', 29, NULL, '411111199905089999', NULL);
INSERT INTO `employee` (`id`, `phone`, `email`, `address`, `sex`, `password`, `nick_name`, `head_img`, `state`, `isAdmin`, `info`, `createby`, `create_time`, `age`, `deptId`, `id_card`, `leave_time`) VALUES (15, '14788888888', NULL, '北京市海淀区', '1', '123456', '李四', '/files/1694434162457_07.jpg', '0', b'0', '销售人员', '杭州水果捞', '2024-09-09 00:06:51', 18, 8, '411111199501019999', NULL);
INSERT INTO `employee` (`id`, `phone`, `email`, `address`, `sex`, `password`, `nick_name`, `head_img`, `state`, `isAdmin`, `info`, `createby`, `create_time`, `age`, `deptId`, `id_card`, `leave_time`) VALUES (16, '15455555555', NULL, NULL, '1', '123456', '叶子', '/files/1694434162457_07.jpg', '0', b'0', '仓库管理员', '张三', '2023-09-11 13:06:52', 18, 8, '511111199501015555', NULL);
COMMIT;

-- ----------------------------
-- Table structure for exchange_point_products_records
-- ----------------------------
DROP TABLE IF EXISTS `exchange_point_products_records`;
CREATE TABLE `exchange_point_products_records` (
  `cn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `goods_id` bigint DEFAULT NULL COMMENT '商品编号',
  `member_id` bigint DEFAULT NULL COMMENT '会员编号',
  `integral` bigint DEFAULT NULL COMMENT '积分',
  `update_time` datetime DEFAULT NULL COMMENT '最近操作时间',
  `updateby` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '操作者',
  `update_id` bigint DEFAULT NULL COMMENT '操作者编号',
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`cn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of exchange_point_products_records
-- ----------------------------
BEGIN;
INSERT INTO `exchange_point_products_records` (`cn`, `goods_id`, `member_id`, `integral`, `update_time`, `updateby`, `update_id`, `state`) VALUES ('1701220420541288450', 10, 5, 60, '2023-09-11 13:05:30', '张三', 1, '0');
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '商品名',
  `createby` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `category_id` bigint DEFAULT NULL COMMENT '商品分类id',
  `sell_price` double(10,2) DEFAULT NULL COMMENT '销售价格',
  `purchash_price` double(10,2) DEFAULT NULL COMMENT '进货价格',
  `update_time` datetime DEFAULT NULL COMMENT '更改时间',
  `updateby` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '更改者',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL COMMENT '分类名',
  `cover_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '商品封面',
  `state` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '状态',
  `residue_num` bigint DEFAULT NULL COMMENT '剩余数量',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sales_volume` bigint DEFAULT NULL COMMENT '销量',
  `inventory` bigint DEFAULT NULL COMMENT '需库存量',
  `shelves` bigint DEFAULT NULL COMMENT '货架上需摆放的数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` (`id`, `name`, `createby`, `create_time`, `category_id`, `sell_price`, `purchash_price`, `update_time`, `updateby`, `category_name`, `cover_url`, `state`, `residue_num`, `info`, `sales_volume`, `inventory`, `shelves`) VALUES (7, '运动鞋', '张三', '2023-09-11 12:20:02', 9, 150.00, 120.00, '2023-09-11 12:20:02', '张三', '服装', '/files/1694434783850_04.jpg', '0', 19, '适合打球跑步的运动鞋', 1, 100, 10);
INSERT INTO `goods` (`id`, `name`, `createby`, `create_time`, `category_id`, `sell_price`, `purchash_price`, `update_time`, `updateby`, `category_name`, `cover_url`, `state`, `residue_num`, `info`, `sales_volume`, `inventory`, `shelves`) VALUES (8, '《PASLMS》英文版', '张三', '2023-09-11 12:21:11', 11, 55.00, 50.00, '2023-09-11 12:21:11', '张三', '书籍', '/files/1694434840737_05.jpg', '0', 60, '著名书籍《PASLMS》英文版', NULL, 200, 50);
INSERT INTO `goods` (`id`, `name`, `createby`, `create_time`, `category_id`, `sell_price`, `purchash_price`, `update_time`, `updateby`, `category_name`, `cover_url`, `state`, `residue_num`, `info`, `sales_volume`, `inventory`, `shelves`) VALUES (9, '桌椅套装', '张三', '2023-09-11 12:21:43', 13, 400.00, 350.00, '2023-09-11 12:22:00', '张三', '办公用具', '/files/1694434883855_03.jpg', '0', 9, '桌子加椅子', 1, 300, 20);
INSERT INTO `goods` (`id`, `name`, `createby`, `create_time`, `category_id`, `sell_price`, `purchash_price`, `update_time`, `updateby`, `category_name`, `cover_url`, `state`, `residue_num`, `info`, `sales_volume`, `inventory`, `shelves`) VALUES (10, '短袖', '张三', '2023-09-11 12:22:50', 9, 60.00, 40.00, '2023-09-11 12:22:50', '张三', '服装', '/files/1694434945440_02.jpg', '0', 60, '夏季短袖', NULL, NULL, NULL);
INSERT INTO `goods` (`id`, `name`, `createby`, `create_time`, `category_id`, `sell_price`, `purchash_price`, `update_time`, `updateby`, `category_name`, `cover_url`, `state`, `residue_num`, `info`, `sales_volume`, `inventory`, `shelves`) VALUES (11, '变形金刚玩具套装', '张三', '2023-09-11 12:30:45', 13, 165.00, 140.00, '2023-09-11 12:30:45', '张三', '办公用具', '/files/1694435421618_e04f06dc02b84d38bc4d1ba2b39add0d.jpg', '0', 20, '变形金刚玩具套装', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '分类名',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
BEGIN;
INSERT INTO `goods_category` (`id`, `name`, `info`, `state`) VALUES (9, '服装', '衣服鞋袜', '0');
INSERT INTO `goods_category` (`id`, `name`, `info`, `state`) VALUES (10, '零食', '饭后零食', '0');
INSERT INTO `goods_category` (`id`, `name`, `info`, `state`) VALUES (11, '书籍', NULL, '0');
INSERT INTO `goods_category` (`id`, `name`, `info`, `state`) VALUES (12, '饮料酒水', '饮料酒水类别', '0');
INSERT INTO `goods_category` (`id`, `name`, `info`, `state`) VALUES (13, '办公用具', '办公用具', '0');
COMMIT;

-- ----------------------------
-- Table structure for point_products
-- ----------------------------
DROP TABLE IF EXISTS `point_products`;
CREATE TABLE `point_products` (
  `goods_id` bigint DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `integral` bigint DEFAULT NULL,
  `updateby` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_id` bigint DEFAULT NULL,
  `cover_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of point_products
-- ----------------------------
BEGIN;
INSERT INTO `point_products` (`goods_id`, `goods_name`, `integral`, `updateby`, `update_time`, `update_id`, `cover_url`, `state`) VALUES (11, '变形金刚玩具套装', 50, '张三', '2023-09-11 12:59:48', 1, '/files/1694435421618_e04f06dc02b84d38bc4d1ba2b39add0d.jpg', '0');
INSERT INTO `point_products` (`goods_id`, `goods_name`, `integral`, `updateby`, `update_time`, `update_id`, `cover_url`, `state`) VALUES (10, '短袖', 60, '张三', '2023-09-11 12:59:57', 1, '/files/1694434945440_02.jpg', '0');
COMMIT;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '仓库名称',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '仓库地址',
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of store
-- ----------------------------
BEGIN;
INSERT INTO `store` (`id`, `name`, `address`, `state`, `info`) VALUES (5, '一号仓库', '北京市海淀区', '0', '超市一号仓库');
COMMIT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `cn` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `tel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` (`cn`, `name`, `address`, `tel`, `info`, `state`) VALUES (7, '阿里巴巴', '浙江省杭州市', '19955555555', '1688商家供货商', '0');
COMMIT;

-- ----------------------------
-- Table structure for t_detail_store_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_detail_store_goods`;
CREATE TABLE `t_detail_store_goods` (
  `cn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `goods_id` bigint NOT NULL,
  `goods_num` int DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `goods_price` double DEFAULT NULL COMMENT '0：入库 1：出库',
  `type` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `createid` bigint NOT NULL,
  `create_time` datetime NOT NULL,
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '0：正常 1：过期 2：下架',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL COMMENT '过期时间',
  `createby` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `birth_time` datetime DEFAULT NULL COMMENT '生产时间',
  `state1` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '0:正常 1：删除 2：待处理',
  `store_id` bigint DEFAULT NULL,
  `supplier_id` bigint DEFAULT NULL COMMENT '供货商编号',
  `supplier_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '供货商名称',
  `untreated_num` bigint DEFAULT NULL COMMENT '待处理数量',
  PRIMARY KEY (`cn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_detail_store_goods
-- ----------------------------
BEGIN;
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701212006578667522', 7, 200, '运动鞋', 120, '0', 1, '2023-09-11 12:32:04', '0', '运动鞋入库', '2029-06-25 16:00:00', '张三', '2023-09-10 16:00:00', '0', 5, 7, '阿里巴巴', NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701212043736006658', 8, 200, '《PASLMS》英文版', 50, '0', 1, '2023-09-11 12:32:13', '0', '', '2029-06-25 16:00:00', '张三', '2023-09-10 16:00:00', '0', 5, 7, '阿里巴巴', NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701212067161194498', 9, 200, '桌椅套装', 350, '0', 1, '2023-09-11 12:32:18', '0', '', '2029-06-25 16:00:00', '张三', '2023-09-10 16:00:00', '0', 5, 7, '阿里巴巴', NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701212086803120129', 10, 200, '短袖', 40, '0', 1, '2023-09-11 12:32:23', '0', '', '2029-06-25 16:00:00', '张三', '2023-09-10 16:00:00', '0', 5, 7, '阿里巴巴', NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701212102829555713', 11, 200, '变形金刚玩具套装', 140, '0', 1, '2023-09-11 12:32:27', '0', '', '2029-06-25 16:00:00', '张三', '2023-09-10 16:00:00', '0', 5, 7, '阿里巴巴', NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701212176804495361', 7, 20, '运动鞋', NULL, '1', 1, '2023-09-11 12:32:45', '0', '', NULL, '张三', NULL, '0', 5, NULL, NULL, NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701218295690104833', 8, 50, '《PASLMS》英文版', NULL, '1', 1, '2023-09-11 12:57:03', '0', '', NULL, '张三', NULL, '0', 5, NULL, NULL, NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701218352346763266', 9, 10, '桌椅套装', NULL, '1', 1, '2023-09-11 12:57:17', '0', '', NULL, '张三', NULL, '0', 5, NULL, NULL, NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701218386224156674', 10, 60, '短袖', NULL, '1', 1, '2023-09-11 12:57:25', '0', '', NULL, '张三', NULL, '0', 5, NULL, NULL, NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701218444214603778', 11, 20, '变形金刚玩具套装', NULL, '1', 1, '2023-09-11 12:57:39', '0', '', NULL, '张三', NULL, '0', 5, NULL, NULL, NULL);
INSERT INTO `t_detail_store_goods` (`cn`, `goods_id`, `goods_num`, `goods_name`, `goods_price`, `type`, `createid`, `create_time`, `state`, `info`, `expiry_time`, `createby`, `birth_time`, `state1`, `store_id`, `supplier_id`, `supplier_name`, `untreated_num`) VALUES ('1701219991275245570', 8, 10, '《PASLMS》英文版', NULL, '1', 1, '2023-09-11 13:03:48', '0', '', NULL, '张三', NULL, '0', 5, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_emp_role
-- ----------------------------
DROP TABLE IF EXISTS `t_emp_role`;
CREATE TABLE `t_emp_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `eid` bigint NOT NULL COMMENT '用户id',
  `rid` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_emp_role
-- ----------------------------
BEGIN;
INSERT INTO `t_emp_role` (`id`, `eid`, `rid`) VALUES (1, 1, 2);
INSERT INTO `t_emp_role` (`id`, `eid`, `rid`) VALUES (20, 15, 3);
INSERT INTO `t_emp_role` (`id`, `eid`, `rid`) VALUES (21, 16, 4);
INSERT INTO `t_emp_role` (`id`, `eid`, `rid`) VALUES (22, 16, 5);
COMMIT;

-- ----------------------------
-- Table structure for t_goods_store
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_store`;
CREATE TABLE `t_goods_store` (
  `goods_id` bigint NOT NULL COMMENT '商品编号',
  `store_id` bigint NOT NULL COMMENT '仓库编号',
  `in_num` bigint NOT NULL COMMENT '入库数数量',
  `residue_num` bigint NOT NULL COMMENT '剩余数量',
  `store_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '仓库名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_goods_store
-- ----------------------------
BEGIN;
INSERT INTO `t_goods_store` (`goods_id`, `store_id`, `in_num`, `residue_num`, `store_name`) VALUES (7, 5, 200, 180, '一号仓库');
INSERT INTO `t_goods_store` (`goods_id`, `store_id`, `in_num`, `residue_num`, `store_name`) VALUES (8, 5, 200, 140, '一号仓库');
INSERT INTO `t_goods_store` (`goods_id`, `store_id`, `in_num`, `residue_num`, `store_name`) VALUES (9, 5, 200, 190, '一号仓库');
INSERT INTO `t_goods_store` (`goods_id`, `store_id`, `in_num`, `residue_num`, `store_name`) VALUES (10, 5, 200, 140, '一号仓库');
INSERT INTO `t_goods_store` (`goods_id`, `store_id`, `in_num`, `residue_num`, `store_name`) VALUES (11, 5, 200, 180, '一号仓库');
COMMIT;

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `integral` bigint DEFAULT NULL COMMENT '会员积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_member
-- ----------------------------
BEGIN;
INSERT INTO `t_member` (`id`, `name`, `phone`, `password`, `email`, `state`, `info`, `integral`) VALUES (5, '陈小明', '19955555555', '123456', '123@qq.com', '0', '新会员', 2622);
COMMIT;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `purl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '类型 0:目录 1 菜单 2 按钮',
  `parent_id` bigint DEFAULT NULL COMMENT '父id',
  `parent_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '父名称',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `state` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `flag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '权限的唯一标识',
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '组件路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (1, '销售管理', NULL, '0', NULL, NULL, NULL, '0', 'sale_management', 'iconfont icon-r-shield', NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (2, '人事管理', NULL, '0', NULL, NULL, NULL, '0', 'personnel_management', 'iconfont icon-r-team', NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (3, '个人中心', NULL, '0', NULL, NULL, NULL, '0', 'personal', 'iconfont icon-r-user2', NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (4, '库存管理', NULL, '0', NULL, NULL, NULL, '0', 'inventory_management', 'iconfont icon-r-building', NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (5, '会员管理', NULL, '0', NULL, NULL, NULL, '0', 'member_management', 'iconfont icon-r-mark1', NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (6, '系统管理', NULL, '0', NULL, NULL, NULL, '0', 'system', 'iconfont icon-r-setting', NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (7, '密码修改', '/personal/edit_pwd', '1', 3, '个人中心', NULL, '0', 'personal:edit_pwd', 'iconfont icon-r-lock', 'views/personal/Edit_pwd');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (8, '角色管理', '/system/role/list', '1', 6, '系统管理', NULL, '0', 'system:role:list', 'iconfont icon-r-user3', 'views/system/role/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (9, '创建角色', NULL, '2', 8, '角色管理', NULL, '0', 'system:role:save', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (10, '修改角色', NULL, '2', 8, '角色管理', NULL, '0', 'system:role:edit_role', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (11, '停用角色', NULL, '2', 8, '角色管理', NULL, '0', 'system:role:forbiddenRole', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (12, '角色授权', NULL, '2', 8, '角色管理', NULL, '0', 'system:role:saveRolePermissons', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (14, '菜单管理', '/system/menu/list', '1', 6, '系统管理', NULL, '0', 'system:menu:list', 'iconfont icon-r-list', 'views/system/menu/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (15, '仓库管理', '/inventory_management/store/list', '1', 4, '库存管理', NULL, '0', 'inventory_management:store:list', 'iconfont icon-r-building', 'views/inventory_management/store/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (16, '新创仓库', '', '2', 15, '仓库管理', NULL, '0', 'inventory_management:store:save', NULL, '');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (17, '修改仓库', '', '2', 15, '仓库管理', NULL, '0', 'inventory_management:store:update', NULL, '');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (18, '停用仓库', '', '2', 15, '仓库管理', NULL, '0', 'inventory_management:store:deactivate', NULL, '');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (19, '商品管理', NULL, '0', NULL, NULL, NULL, '0', 'goods_management:goods_category', 'iconfont icon-r-mark2', NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (20, '分类管理', '/goods_management/goods_category/list', '1', 19, '商品管理', NULL, '0', 'goods_management:goods_category:list', 'iconfont icon-r-list', 'views/goods_management/goods_category/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (21, '创建商品分类', '', '2', 20, '商品分类管理', NULL, '0', 'goods_management:goods_category:save', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (22, '修改商品分类', '', '2', 20, '商品分类管理', NULL, '0', 'goods_management:goods_category:update', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (23, '停用商品分类', '', '2', 20, '商品分类管理', NULL, '0', 'goods_management:goods_category:deactivate', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (24, '部门管理', '/personnel_management/dept/list', '1', 2, '人事管理', NULL, '0', 'personnel_management:dept:list', 'iconfont icon-r-team', 'views/personnel_management/dept/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (25, '创建部门', NULL, '2', 24, '部门管理', NULL, '0', 'personnel_management:dept:save', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (26, '修改部门', NULL, '2', 24, '部门管理', NULL, '0', 'personnel_management:dept:update', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (27, '停用部门', NULL, '2', 24, '部门管理', NULL, '0', 'personnel_management:dept:deactivate', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (28, '员工管理', '/personnel_management/employee/list', '1', 2, '人事管理', NULL, '0', 'personnel_management:employee:list', 'iconfont icon-r-user2', 'views/personnel_management/employee/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (29, '商品信息', '/goods_management/goods/list', '1', 19, '商品管理', NULL, '0', 'goods_management:goods:list', 'iconfont icon-r-shield', 'views/goods_management/goods/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (31, '会员信息', '/member_management/member/list', '1', 5, '会员管理', NULL, '0', 'member_management:member:list', 'iconfont icon-r-mark1', 'views/member_management/member/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (32, '个人资料', '/personal/information', '1', 3, '个人中心', NULL, '0', 'personnel_management:employee:update', 'iconfont icon-r-paper', 'views/personal/Information');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (33, '出库明细', '/inventory_management/detail_store_goods_out/list', '1', 4, '库存管理', NULL, '0', 'inventory_management:detail_store_goods_out:list', 'iconfont icon-r-left', 'views/inventory_management/detail_store_goods_out/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (34, '入库明细', '/inventory_management/detail_store_goods_in/list', '1', 4, '库存管理', NULL, '0', 'inventory_management:detail_store_goods_in:list', 'iconfont icon-r-right', 'views/inventory_management/detail_store_goods_in/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (35, '销售主页', '/sale_management/sale_cmd/list', '1', 1, '销售管理', NULL, '0', 'sale_management:sale_cmd:list', 'iconfont icon-r-home', 'views/sale_management/sale_cmd/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (36, '销售记录', '/sale_management/sale_records/list', '1', 1, '销售管理', NULL, '0', 'sale_management:sale_records:list', 'iconfont icon-r-paper', 'views/sale_management/sale_records/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (37, '供货商信息', '/inventory_management/supplier/list', '1', 4, '库存管理', NULL, '0', 'inventory_management:supplier:list', 'iconfont icon-r-mark3', 'views/inventory_management/supplier/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (41, '积分商品', '/goods_management/point_products/list', '1', 19, '商品管理', NULL, '0', 'goods_management:point_products:list', 'iconfont icon-r-mark1', 'views/goods_management/point_products/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (42, '销售统计', '/goods_management/statistic_sale/list', '1', 19, '商品管理', NULL, '0', 'goods_management:statistic_sale:list', 'iconfont icon-r-add', 'views/goods_management/statistic_sale/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (43, '库存统计', '/inventory_management/store/storage_situation', '1', 4, '库存管理', NULL, '0', 'inventory_management:store:storage_situation', 'iconfont icon-r-add', 'views/inventory_management/store/StorageSituation');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (44, '积分兑换记录', '/sale_management/exchange_point_products_records/list', '1', 1, '销售管理', NULL, '0', 'sale_management:exchange_point_products_records:list', 'iconfont icon-r-paper', 'views//sale_management/exchange_point_products_records/List');
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (45, '员工创建', NULL, '2', 28, '员工管理', NULL, '0', 'personnel_management:employee:save', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (46, '员工修改', NULL, '2', 28, '员工管理', NULL, '0', 'personnel_management:employee:update', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (47, '员工分配职务', NULL, '2', 28, '员工管理', NULL, '0', 'personnel_management:employee:queryRoleIdsByEid', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (48, '重置员工密码', NULL, '2', 28, '员工管理', NULL, '0', 'personnel_management:employee:resetPwd', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (49, '商品入库', NULL, '2', 34, '入库明细', NULL, '0', 'inventory_management:detail_store_goods_in:save', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (50, '入库记录删除', NULL, '2', 34, '入库明细', NULL, '0', 'inventory_management:detail_store_goods_in:delIn', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (51, '商品出库', NULL, '2', 33, '出库明细', NULL, '0', 'inventory_management:detail_store_goods_out:save', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (52, '出库记录删除', NULL, '2', 33, '出库明细', NULL, '0', 'inventory_management:detail_store_goods_out:delOut', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (53, '创建', NULL, '2', 37, '供货商信息', NULL, '0', 'inventory_management:supplier:save', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (54, '修改', NULL, '2', 37, '供货商信息', NULL, '0', 'inventory_management:supplier:update', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (55, '删除', NULL, '2', 37, '供货商信息', NULL, '0', 'inventory_management:supplier:deactivate', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (56, '商品上架处理', NULL, '2', 40, '出库通知', NULL, '0', 'inventory_management:detail_store_goods_out:notice:saveOut_shelves', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (57, '商品过期/下架处理', NULL, '2', 40, '出库通知', NULL, '0', 'inventory_management:detail_store_goods_out:notice:resolveOutUntreatedForm', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (58, '创建', NULL, '2', 31, '会员信息管理', NULL, '0', 'member_management:member:save', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (59, '兑换商品', NULL, '2', 31, '会员信息管理', NULL, '0', 'sale_management:exchange_point_products_records:saveExchangePointProductRecords', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (60, '修改', NULL, '2', 31, '会员信息管理', NULL, '0', 'member_management:member:update', NULL, NULL);
INSERT INTO `t_menu` (`id`, `label`, `purl`, `type`, `parent_id`, `parent_label`, `info`, `state`, `flag`, `icon`, `component`) VALUES (61, '删除', NULL, '2', 31, '会员信息管理', NULL, '0', 'member_management:member:delMember', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '角色名',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '状态 0： 正常 -1：停用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` (`id`, `name`, `info`, `state`) VALUES (1, '系统管理员', '系统拥有者', '0');
INSERT INTO `t_role` (`id`, `name`, `info`, `state`) VALUES (2, '超级系统拥有者', '超级系统拥有者', '0');
INSERT INTO `t_role` (`id`, `name`, `info`, `state`) VALUES (3, '收银员', '负责销售收钱', '0');
INSERT INTO `t_role` (`id`, `name`, `info`, `state`) VALUES (4, '仓库管理员', '负责管理库存', '0');
INSERT INTO `t_role` (`id`, `name`, `info`, `state`) VALUES (5, '商品管理员', '负责商品货架的商品数量、通知仓库管理员入库和出库', '0');
INSERT INTO `t_role` (`id`, `name`, `info`, `state`) VALUES (6, '人事主管', '负责管理部门信息和员工信息', '0');
INSERT INTO `t_role` (`id`, `name`, `info`, `state`) VALUES (7, '员工', '超市工作人员', '0');
COMMIT;

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rid` bigint NOT NULL COMMENT '角色id',
  `mid` bigint NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (64, 4, 32);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (65, 4, 33);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (66, 4, 34);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (67, 4, 3);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (68, 4, 4);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (69, 4, 37);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (70, 4, 7);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (73, 4, 43);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (74, 4, 15);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (75, 4, 16);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (76, 4, 17);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (77, 4, 49);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (78, 4, 18);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (79, 4, 50);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (80, 4, 51);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (81, 4, 52);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (82, 4, 53);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (83, 4, 54);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (84, 4, 55);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (85, 4, 56);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (86, 4, 57);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (87, 5, 19);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (88, 5, 20);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (89, 5, 21);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (90, 5, 22);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (92, 5, 23);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (93, 5, 41);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (94, 5, 42);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (95, 5, 29);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (96, 6, 48);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (97, 6, 2);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (98, 6, 24);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (99, 6, 25);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (100, 6, 26);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (101, 6, 27);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (102, 6, 28);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (103, 6, 45);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (104, 6, 46);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (105, 6, 47);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (109, 7, 32);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (110, 7, 3);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (111, 7, 7);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (121, 3, 32);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (122, 3, 1);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (123, 3, 3);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (124, 3, 35);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (125, 3, 36);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (126, 3, 5);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (127, 3, 7);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (128, 3, 44);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (129, 3, 58);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (130, 3, 59);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (131, 3, 60);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (132, 3, 61);
INSERT INTO `t_role_menu` (`id`, `rid`, `mid`) VALUES (133, 3, 31);
COMMIT;

-- ----------------------------
-- Table structure for t_sale_records
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_records`;
CREATE TABLE `t_sale_records` (
  `cn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `eid` bigint NOT NULL,
  `sellway` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `sell_time` datetime NOT NULL,
  `state` char(2) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '0:正常 1：删除',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sellby` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `sell_total` bigint NOT NULL COMMENT '销售总数量',
  `sell_totalmoney` double NOT NULL COMMENT '销售总金额',
  `type` char(1) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL COMMENT '0:非会员消费 1：会员消费',
  `member_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL COMMENT '顾客会员号码',
  PRIMARY KEY (`cn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_sale_records
-- ----------------------------
BEGIN;
INSERT INTO `t_sale_records` (`cn`, `eid`, `sellway`, `sell_time`, `state`, `info`, `sellby`, `sell_total`, `sell_totalmoney`, `type`, `member_phone`) VALUES ('1701213155180429314', 15, '0', '2023-09-11 12:37:16', '0', '', '李四', 1, 120, '0', NULL);
INSERT INTO `t_sale_records` (`cn`, `eid`, `sellway`, `sell_time`, `state`, `info`, `sellby`, `sell_total`, `sell_totalmoney`, `type`, `member_phone`) VALUES ('1701220094014722049', 1, '1', '2023-09-11 13:04:45', '0', '', '张三', 1, 315, '1', '19955555555');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
