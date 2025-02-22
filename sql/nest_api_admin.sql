/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : localhost:3306
 Source Schema         : nest_api_admin

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 01/12/2023 20:59:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_captcha_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha_log`;
CREATE TABLE `sys_captcha_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_captcha_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_2c363c25cf99bcaab3a7f389ba` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `key`, `name`, `value`, `remark`, `created_at`, `updated_at`) VALUES (1, 'sys_user_initPassword', '初始密码', '123456', '创建管理员账号的初始密码', '2024-4-10 00:31:44.154921', '2024-4-10 00:31:44.161263');
INSERT INTO `sys_config` (`id`, `key`, `name`, `value`, `remark`, `created_at`, `updated_at`) VALUES (2, 'sys_api_token', 'API Token', 'admin', '用于请求 @ApiToken 的控制器', '2024-4-10 00:31:44.154921', '2024-4-10 00:31:44.161263');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `orderNo` int DEFAULT '0',
  `mpath` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `parentId` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_c75280b01c49779f2323536db67` (`parentId`) USING BTREE,
  CONSTRAINT `FK_c75280b01c49779f2323536db67` FOREIGN KEY (`parentId`) REFERENCES `sys_dept` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (1, '华东分部', 1, '1.', NULL, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (2, '研发部', 1, '1.2.', 1, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (3, '市场部', 2, '1.3.', 1, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (4, '商务部', 3, '1.4.', 1, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (5, '财务部', 4, '1.5.', 1, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (6, '华南分部', 2, '6.', NULL, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (7, '西北分部', 3, '7.', NULL, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (8, '研发部', 1, '6.8.', 6, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
INSERT INTO `sys_dept` (`id`, `name`, `orderNo`, `mpath`, `parentId`, `created_at`, `updated_at`) VALUES (9, '市场部', 1, '6.9.', 6, '2024-4-10 00:31:43.996025', '2024-4-10 00:31:44.008709');
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ua` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_3029712e0df6a28edaee46fd470` (`user_id`),
  CONSTRAINT `FK_3029712e0df6a28edaee46fd470` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (137, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (138, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (139, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (140, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (141, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (142, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (143, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (144, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (145, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (146, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (147, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (148, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (149, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (150, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (151, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (152, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (153, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (154, '127.0.0.1', '', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (155, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (156, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (157, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (158, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (159, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (160, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (161, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (162, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (163, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (164, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (165, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (166, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (167, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (168, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (169, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (170, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-4-10 00:31:44.178664', '2024-4-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (171, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', ' 本机地址', NULL, '2024-5-01 20:41:23.895826', '2024-5-01 20:41:23.895826', 1);
INSERT INTO `sys_login_log` (`id`, `ip`, `ua`, `address`, `provider`, `created_at`, `updated_at`, `user_id`) VALUES (172, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', ' 本机地址', NULL, '2024-5-01 20:52:05.831735', '2024-5-01 20:52:05.831735', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent` int DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `order_no` int DEFAULT '0',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keepalive` tinyint NOT NULL DEFAULT '1',
  `show` tinyint NOT NULL DEFAULT '1',
  `status` tinyint NOT NULL DEFAULT '1',
  `external` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (1, NULL, '/system', '系统管理', '', 0, 'ant-design:setting-outlined', 254, 'LAYOUT', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (2, 1, '/system/user', '用户管理', 'system:user:list', 1, '', 0, '/system/user/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (3, 1, '/system/role', '角色管理', 'system:role:list', 1, '', 1, '/system/role/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (4, 1, '/system/menu', '菜单管理', 'system:menu:list', 1, '', 2, '/system/menu/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (5, 1, '/system/monitor', '系统监控', '', 0, '', 5, 'LAYOUT', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (6, 5, '/system/monitor/online', '在线用户', 'system:online:list', 1, '', 0, '/system/monitor/online/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (7, 5, '/sys/monitor/login-log', '登录日志', 'system:log:login:list', 1, '', 0, '/system/monitor/log/login/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (8, 5, '/system/monitor/serve', '服务监控', 'system:serve:stat', 1, '', 4, '/system/monitor/serve/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (9, 1, '/system/schedule', '任务调度', '', 0, '', 6, 'LAYOUT', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (10, 9, '/system/task', '任务管理', '', 1, '', 0, '/system/task/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (11, 9, '/system/task/log', '任务日志', 'system:task:list', 1, '', 0, '/system/task/log/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (12, NULL, '/document', '文档', '', 0, 'ion:tv-outline', 2, 'LAYOUT', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (13, 12, 'https://vvbin.cn/doc-next/', 'Vben项目文档', '', 0, '', 1, NULL, 1, 1, 1, 1, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (14, 12, 'https://typeorm.bootcss.com/', 'Typeorm中文文档', NULL, 1, '', 3, NULL, 1, 1, 1, 1, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (15, 12, 'https://docs.nestjs.cn/', 'Nest.js中文文档', '', 1, '', 4, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (16, NULL, '/dashboard', '仪表盘', NULL, 0, 'ion:grid-outline', 0, 'LAYOUT', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (17, 16, '/dashboard/workbench', '工作台', 'dashboard:workbench', 1, '', 2, '/dashboard/workbench/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (18, 16, '/dashboard/analysis', '分析页', 'dashboard:analysis', 1, '', 1, '/dashboard/analysis/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (19, 1, '/system/user_detail/:id', '用户详情', 'system:user:read', 1, '', 10, '/system/user/UserDetail', 1, 0, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (20, 2, NULL, '新增', 'system:user:create', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (21, 2, '', '删除', 'system:user:delete', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (22, 2, '', '更新', 'system:user:update', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (23, 2, '', '查询', 'system:user:read', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (24, 3, '', '新增', 'system:role:create', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (25, 3, '', '删除', 'system:role:delete', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (26, 3, '', '修改', 'system:role:update', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (27, 3, '', '查询', 'system:role:read', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (28, 4, NULL, '新增', 'system:menu:create', 2, NULL, 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (29, 4, NULL, '删除', 'system:menu:delete', 2, NULL, 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (30, 4, '', '修改', 'system:menu:update', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (31, 4, NULL, '查询', 'system:menu:read', 2, NULL, 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (32, 6, '', '下线', 'system:online:kick', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (34, 10, '', '新增', 'system:task:create', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (35, 10, '', '删除', 'system:task:delete', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (36, 10, '', '执行一次', 'system:task:once', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (37, 10, '', '查询', 'system:task:read', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (38, 10, '', '运行', 'system:task:start', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (39, 10, '', '暂停', 'system:task:stop', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (40, 10, '', '更新', 'system:task:update', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (41, 7, '', '查询登录日志', 'system:log:login:list', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (42, 7, '', '查询任务日志', 'system:log:task:list', 2, '', 0, '', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (43, NULL, '/about', '关于', '', 0, 'simple-icons:about-dot-me', 255, '/sys/about/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (44, NULL, '/level', '多级菜单', NULL, 0, 'ant-design:menu-outlined', 253, 'LAYOUT', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (45, 44, '/level/menu1', 'Menu1', NULL, 0, '', 1, 'LAYOUT', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (46, 45, '/level/menu1/menu1-1', 'Menu-1-1', NULL, 1, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (47, 44, '/level/menu2', 'Menu2', NULL, 1, '', 2, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (48, NULL, '/tools', '系统工具', NULL, 0, 'ant-design:tool-outlined', 254, 'LAYOUT', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (49, 48, '/tools/email', '邮件工具', 'system:tools:email', 1, '', 1, '/tools/email/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (50, 49, NULL, '发送邮件', 'tools:email:send', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (51, 48, '/tools/storage', '存储管理', 'tools:storage:list', 1, '', 2, '/tools/storage/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (52, 51, NULL, '文件上传', 'upload', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (53, 51, NULL, '文件删除', 'tools:storage:delete', 2, '', 2, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (54, 2, NULL, '修改密码', 'system:user:password', 2, '', 5, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (55, NULL, '/profile/setting', '个人设置', '', 1, '', 252, '/system/profile/index', 1, 0, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (56, 1, '/system/dict', '字典管理', 'system:dict:list', 1, '', 4, '/system/dict/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (57, 56, NULL, '新增', 'system:dict:create', 2, '', 1, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (58, 56, NULL, '更新', 'system:dict:update', 2, '', 2, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (59, 56, NULL, '删除', 'system:dict:delete', 2, '', 3, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (60, 56, NULL, '查询', 'system:dict:info', 2, '', 4, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (61, 1, '/system/dept', '部门管理', 'system:dept:list', 1, '', 3, '/system/dept/index', 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (62, 61, NULL, '新增', 'system:dept:create', 2, '', 1, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (63, 61, NULL, '更新', 'system:dept:update', 2, '', 2, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (64, 61, NULL, '删除', 'system:dept:delete', 2, '', 3, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (65, 61, NULL, '查询', 'system:dept:read', 2, '', 4, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (68, 5, '/health', '健康检查', '', 1, '', 4, 'LAYOUT', 1, 0, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (69, 68, NULL, '网络', 'app:health:network', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (70, 68, NULL, '数据库', 'app:health: database', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (71, NULL, '/demo', 'Demo', NULL, 1, '', 1000, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (72, 71, NULL, '新增', 'todo:create', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (73, 71, NULL, '更新', 'todo:update', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (74, 71, NULL, '删除', 'todo:delete', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (75, 71, NULL, '查询', 'todo:read', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
INSERT INTO `sys_menu` (`id`, `parent`, `path`, `name`, `permission`, `type`, `icon`, `order_no`, `component`, `keepalive`, `show`, `status`, `external`, `created_at`, `updated_at`) VALUES (76, 71, NULL, '列表', 'todo:list', 2, '', 0, NULL, 1, 1, 1, 0, '2024-4-10 00:31:44.023393', '2024-4-10 00:31:44.034474');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `default` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_223de54d6badbe43a5490450c3` (`name`) USING BTREE,
  UNIQUE KEY `IDX_05edc0a51f41bb16b7d8137da9` (`value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `value`, `name`, `remark`, `status`, `created_at`, `updated_at`, `default`) VALUES (1, 'admin', '管理员', '超级管理员', 1, '2024-4-10 00:31:44.058463', '2024-4-10 00:31:44.078799', NULL);
INSERT INTO `sys_role` (`id`, `value`, `name`, `remark`, `status`, `created_at`, `updated_at`, `default`) VALUES (2, 'user', '用户', '', 1, '2024-4-10 00:31:44.058463', '2024-5-01 20:55:48.000000', 1);
INSERT INTO `sys_role` (`id`, `value`, `name`, `remark`, `status`, `created_at`, `updated_at`, `default`) VALUES (3, 'test', '测试', '', 1, '2024-4-10 00:31:44.058463', '2024-4-10 00:31:44.078799', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menus`;
CREATE TABLE `sys_role_menus` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `IDX_35ce749b04d57e226d059e0f63` (`role_id`),
  KEY `IDX_2b95fdc95b329d66c18f5baed6` (`menu_id`),
  CONSTRAINT `FK_2b95fdc95b329d66c18f5baed6d` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`),
  CONSTRAINT `FK_35ce749b04d57e226d059e0f633` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sys_role_menus
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 12);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 13);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 14);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 15);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 43);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 44);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 45);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 46);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 47);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 55);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 71);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 72);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 73);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 74);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 75);
INSERT INTO `sys_role_menus` (`role_id`, `menu_id`) VALUES (2, 76);
COMMIT;

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `limit` int DEFAULT '0',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `every` int DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `job_opts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_ef8e5ab5ef2fe0ddb1428439ef` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
BEGIN;
INSERT INTO `sys_task` (`id`, `name`, `service`, `type`, `status`, `start_time`, `end_time`, `limit`, `cron`, `every`, `data`, `job_opts`, `remark`, `created_at`, `updated_at`) VALUES (2, '定时清空登录日志', 'LogClearJob.clearLoginLog', 0, 0, NULL, NULL, 0, '0 0 3 ? * 1', 0, '', '{\"count\":1,\"key\":\"__default__:2:::0 0 3 ? * 1\",\"cron\":\"0 0 3 ? * 1\",\"jobId\":2}', '定时清空登录日志', '2024-4-10 00:31:44.197779', '2024-4-10 00:31:44.206935');
INSERT INTO `sys_task` (`id`, `name`, `service`, `type`, `status`, `start_time`, `end_time`, `limit`, `cron`, `every`, `data`, `job_opts`, `remark`, `created_at`, `updated_at`) VALUES (3, '定时清空任务日志', 'LogClearJob.clearTaskLog', 0, 0, NULL, NULL, 0, '0 0 3 ? * 1', 0, '', '{\"count\":1,\"key\":\"__default__:3:::0 0 3 ? * 1\",\"cron\":\"0 0 3 ? * 1\",\"jobId\":3}', '定时清空任务日志', '2024-4-10 00:31:44.197779', '2024-4-18 01:10:27.000000');
INSERT INTO `sys_task` (`id`, `name`, `service`, `type`, `status`, `start_time`, `end_time`, `limit`, `cron`, `every`, `data`, `job_opts`, `remark`, `created_at`, `updated_at`) VALUES (4, '访问百度首页', 'HttpRequestJob.handle', 0, 0, NULL, NULL, 1, '* * * * * ?', NULL, '{\"url\":\"https://www.baidu.com\",\"method\":\"get\"}', NULL, '访问百度首页', '2024-4-10 00:31:44.197779', '2024-4-10 00:31:44.206935');
INSERT INTO `sys_task` (`id`, `name`, `service`, `type`, `status`, `start_time`, `end_time`, `limit`, `cron`, `every`, `data`, `job_opts`, `remark`, `created_at`, `updated_at`) VALUES (5, '发送邮箱', 'EmailJob.send', 0, 0, NULL, NULL, -1, '0 0 0 1 * ?', NULL, '{\"subject\":\"这是标题\",\"to\":\"zeyu57@163.com\",\"content\":\"这是正文\"}', NULL, '每月发送邮箱', '2024-4-10 00:31:44.197779', '2024-4-10 00:31:44.206935');
COMMIT;

-- ----------------------------
-- Table structure for sys_task_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_log`;
CREATE TABLE `sys_task_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `consume_time` int DEFAULT '0',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_f4d9c36052fdb188ff5c089454b` (`task_id`),
  CONSTRAINT `FK_f4d9c36052fdb188ff5c089454b` FOREIGN KEY (`task_id`) REFERENCES `sys_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_task_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_task_log` (`id`, `task_id`, `status`, `detail`, `consume_time`, `created_at`, `updated_at`) VALUES (21, 3, 0, 'Error: Nest could not find LogClearJob element (this provider does not exist in the current context)', 0, '2024-4-10 00:31:44.217520', '2024-4-10 00:31:44.224078');
INSERT INTO `sys_task_log` (`id`, `task_id`, `status`, `detail`, `consume_time`, `created_at`, `updated_at`) VALUES (22, 3, 0, 'Error: Nest could not find LogClearJob element (this provider does not exist in the current context)', 0, '2024-4-10 00:31:44.217520', '2024-4-10 00:31:44.224078');
INSERT INTO `sys_task_log` (`id`, `task_id`, `status`, `detail`, `consume_time`, `created_at`, `updated_at`) VALUES (23, 3, 0, 'Error: Nest could not find LogClearJob element (this provider does not exist in the current context)', 0, '2024-4-10 00:31:44.217520', '2024-4-10 00:31:44.224078');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `psalt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint DEFAULT '1',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `nickname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_9e7164b2f1ea1348bc0eb0a7da` (`username`) USING BTREE,
  KEY `FK_96bde34263e2ae3b46f011124ac` (`dept_id`),
  CONSTRAINT `FK_96bde34263e2ae3b46f011124ac` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `avatar`, `email`, `phone`, `remark`, `psalt`, `status`, `qq`, `created_at`, `updated_at`, `nickname`, `dept_id`) VALUES (1, 'admin', 'a11571e778ee85e82caae2d980952546', '/upload/logo.png', 'hi@laohaicode.com', NULL, '管理员', 'xQYCspvFb8cAW6GG1pOoUGTLqsuUSO3d', 1, '911993023', '2024-4-10 00:31:44.104382', '2024-5-01 20:54:44.000000', 'laohai', 1);
INSERT INTO `sys_user` (`id`, `username`, `password`, `avatar`, `email`, `phone`, `remark`, `psalt`, `status`, `qq`, `created_at`, `updated_at`, `nickname`, `dept_id`) VALUES (2, 'user', 'dbd89546dec743f82bb9073d6ac39361', '', 'laohai12@163.com', NULL, '无', 'qlovDV7pL5dPYPI3QgFFo1HH74nP6sJe', 1, '911993023', '2024-4-10 00:31:44.104382', '2024-5-01 20:54:51.000000', 'laohai', 8);
INSERT INTO `sys_user` (`id`, `username`, `password`, `avatar`, `email`, `phone`, `remark`, `psalt`, `status`, `qq`, `created_at`, `updated_at`, `nickname`, `dept_id`) VALUES (8, 'laohai', 'f03fa2a99595127b9a39587421d471f6', '', '123@qq.com', NULL, NULL, 'NbGM1z9Vhgo7f4dd2I7JGaGP12RidZdE', 1, '911993023', '2024-4-10 00:31:44.104382', '2024-5-01 20:55:01.000000', 'laohai', 7);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_96311d970191a044ec048011f4` (`user_id`),
  KEY `IDX_6d61c5b3f76a3419d93a421669` (`role_id`),
  CONSTRAINT `FK_6d61c5b3f76a3419d93a4216695` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_96311d970191a044ec048011f44` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_roles` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_roles` (`user_id`, `role_id`) VALUES (2, 2);
INSERT INTO `sys_user_roles` (`user_id`, `role_id`) VALUES (8, 3);
COMMIT;

-- ----------------------------
-- Table structure for todo
-- ----------------------------
DROP TABLE IF EXISTS `todo`;
CREATE TABLE `todo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_9cb7989853c4cb7fe427db4b260` (`user_id`),
  CONSTRAINT `FK_9cb7989853c4cb7fe427db4b260` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of todo
-- ----------------------------
BEGIN;
INSERT INTO `todo` (`id`, `value`, `user_id`, `status`, `created_at`, `updated_at`) VALUES (1, 'nest.js', NULL, 0, '2024-4-10 00:31:44.139730', '2024-4-10 00:31:44.147629');
COMMIT;

-- ----------------------------
-- Table structure for tool_storage
-- ----------------------------
DROP TABLE IF EXISTS `tool_storage`;
CREATE TABLE `tool_storage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名',
  `fileName` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实文件名',
  `ext_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tool_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `user_access_tokens`;
CREATE TABLE `user_access_tokens` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL COMMENT '令牌过期时间',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '令牌创建时间',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e9d9d0c303432e4e5e48c1c3e90` (`user_id`),
  CONSTRAINT `FK_e9d9d0c303432e4e5e48c1c3e90` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `user_access_tokens` (`id`, `value`, `expired_at`, `created_at`, `user_id`) VALUES ('b25e1534-1661-4644-8b39-2753f0dd5d16', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MDE0MzUxMjV9.DiiFxz43IeJbbP1TaMBFptGMEtNqFNjc_ZPrasPoNaI', '2024-5-02 20:52:06', '2024-5-01 20:52:05.700268', 1);
INSERT INTO `user_access_tokens` (`id`, `value`, `expired_at`, `created_at`, `user_id`) VALUES ('e8136064-6afa-46d6-89eb-e520e9c52e5d', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6W10sImlhdCI6MTcwMTQzNDQ4M30.EwCjQ1gLHz30L3qHnTAG4VCVekIsH3yZN3ZyZYfLcwY', '2024-5-02 20:41:24', '2024-5-01 20:41:23.749637', 1);
COMMIT;

-- ----------------------------
-- Table structure for user_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `user_refresh_tokens`;
CREATE TABLE `user_refresh_tokens` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL COMMENT '令牌过期时间',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '令牌创建时间',
  `accessTokenId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_1dfd080c2abf42198691b60ae3` (`accessTokenId`),
  CONSTRAINT `FK_1dfd080c2abf42198691b60ae39` FOREIGN KEY (`accessTokenId`) REFERENCES `user_access_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_refresh_tokens
-- ----------------------------
BEGIN;
INSERT INTO `user_refresh_tokens` (`id`, `value`, `expired_at`, `created_at`, `accessTokenId`) VALUES ('abbe1dc5-c51e-47c3-b046-cc49c0dba3a4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiWEQ4azFhNkZpbmt4blhNNnlDOHM0IiwiaWF0IjoxNzAxNDM0NDgzfQ.kahzbiANpNMRG_ujt6XJ5Z3nd_5NAKTBSzUwU7q4Wlc', '2024-5-31 20:41:24', '2024-5-01 20:41:23.770646', 'e8136064-6afa-46d6-89eb-e520e9c52e5d');
INSERT INTO `user_refresh_tokens` (`id`, `value`, `expired_at`, `created_at`, `accessTokenId`) VALUES ('d39704c6-36aa-4389-8692-f1c963a53770', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiTjlBSm55SXZsU0pjb1dZckxiSWlQIiwiaWF0IjoxNzAxNDM1MTI1fQ.5R5REUDSIjrNlfp2uuk3zIZQB3rd0QysUMH4m63fhns', '2024-5-31 20:52:06', '2024-5-01 20:52:05.710195', 'b25e1534-1661-4644-8b39-2753f0dd5d16');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
