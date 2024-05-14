/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018 (8.0.18)
 Source Host           : localhost:3306
 Source Schema         : laohai_admin_api

 Target Server Type    : MySQL
 Target Server Version : 80018 (8.0.18)
 File Encoding         : 65001

 Date: 14/05/2024 18:33:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_captcha_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha_log`;
CREATE TABLE `sys_captcha_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_captcha_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_2c363c25cf99bcaab3a7f389ba`(`key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'sys_user_initPassword', '初始密码', '123456', '创建管理员账号的初始密码', '2024-04-10 00:31:44.154921', '2024-04-10 00:31:44.161263');
INSERT INTO `sys_config` VALUES (2, 'sys_api_token', 'API Token', 'admin', '用于请求 @ApiToken 的控制器', '2024-04-10 00:31:44.154921', '2024-04-10 00:31:44.161263');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderNo` int(11) NULL DEFAULT 0,
  `mpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `parentId` int(11) NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_c75280b01c49779f2323536db67`(`parentId` ASC) USING BTREE,
  CONSTRAINT `FK_c75280b01c49779f2323536db67` FOREIGN KEY (`parentId`) REFERENCES `sys_dept` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '华东分部', 1, '1.', NULL, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (2, '研发部', 1, '1.2.', 1, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (3, '市场部', 2, '1.3.', 1, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (4, '商务部', 3, '1.4.', 1, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (5, '财务部', 4, '1.5.', 1, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (6, '华南分部', 2, '6.', NULL, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (7, '西北分部', 3, '7.', NULL, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (8, '研发部', 1, '6.8.', 6, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');
INSERT INTO `sys_dept` VALUES (9, '市场部', 1, '6.9.', 6, '2024-04-10 00:31:43.996025', '2024-04-10 00:31:44.008709');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ua` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_3029712e0df6a28edaee46fd470`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK_3029712e0df6a28edaee46fd470` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (137, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (138, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (139, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (140, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (141, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.64', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (142, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (143, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (144, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (145, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (146, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (147, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (148, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (149, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (150, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (151, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (152, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (153, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (154, '127.0.0.1', '', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (155, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (156, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (157, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (158, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (159, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (160, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (161, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (162, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (163, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (164, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (165, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (166, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (167, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (168, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (169, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (170, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 Edg/116.0.1938.69', ' 本机地址', NULL, '2024-04-10 00:31:44.178664', '2024-04-10 00:31:44.186284', NULL);
INSERT INTO `sys_login_log` VALUES (171, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', ' 本机地址', NULL, '2024-05-01 20:41:23.895826', '2024-05-01 20:41:23.895826', 1);
INSERT INTO `sys_login_log` VALUES (172, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0', ' 本机地址', NULL, '2024-05-01 20:52:05.831735', '2024-05-01 20:52:05.831735', 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `order_no` int(11) NULL DEFAULT 0,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keepalive` tinyint(4) NOT NULL DEFAULT 1,
  `show` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `external` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, '/system', '系统管理', '', 0, 'ant-design:setting-outlined', 254, 'LAYOUT', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (2, 1, '/system/user', '用户管理', 'system:user:list', 1, '', 0, '/system/user/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (3, 1, '/system/role', '角色管理', 'system:role:list', 1, '', 1, '/system/role/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (4, 1, '/system/menu', '菜单管理', 'system:menu:list', 1, '', 2, '/system/menu/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (5, 1, '/system/monitor', '系统监控', '', 0, '', 5, 'LAYOUT', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (6, 5, '/system/monitor/online', '在线用户', 'system:online:list', 1, '', 0, '/system/monitor/online/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (7, 5, '/sys/monitor/login-log', '登录日志', 'system:log:login:list', 1, '', 0, '/system/monitor/log/login/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (8, 5, '/system/monitor/serve', '服务监控', 'system:serve:stat', 1, '', 4, '/system/monitor/serve/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (9, 1, '/system/schedule', '任务调度', '', 0, '', 6, 'LAYOUT', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (10, 9, '/system/task', '任务管理', '', 1, '', 0, '/system/task/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (11, 9, '/system/task/log', '任务日志', 'system:task:list', 1, '', 0, '/system/task/log/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (12, NULL, '/document', '文档', '', 0, 'ion:tv-outline', 2, 'LAYOUT', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (13, 12, 'https://vvbin.cn/doc-next/', 'Vben项目文档', '', 0, '', 1, NULL, 1, 1, 1, 1, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (14, 12, 'https://typeorm.bootcss.com/', 'Typeorm中文文档', NULL, 1, '', 3, NULL, 1, 1, 1, 1, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (15, 12, 'https://docs.nestjs.cn/', 'Nest.js中文文档', '', 1, '', 4, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (16, NULL, '/dashboard', '仪表盘', NULL, 0, 'ion:grid-outline', 0, 'LAYOUT', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (17, 16, '/dashboard/workbench', '工作台', 'dashboard:workbench', 1, '', 2, '/dashboard/workbench/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (18, 16, '/dashboard/analysis', '分析页', 'dashboard:analysis', 1, '', 1, '/dashboard/analysis/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (19, 1, '/system/user_detail/:id', '用户详情', 'system:user:read', 1, '', 10, '/system/user/UserDetail', 1, 0, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (20, 2, NULL, '新增', 'system:user:create', 2, '', 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (21, 2, '', '删除', 'system:user:delete', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (22, 2, '', '更新', 'system:user:update', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (23, 2, '', '查询', 'system:user:read', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (24, 3, '', '新增', 'system:role:create', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (25, 3, '', '删除', 'system:role:delete', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (26, 3, '', '修改', 'system:role:update', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (27, 3, '', '查询', 'system:role:read', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (28, 4, NULL, '新增', 'system:menu:create', 2, NULL, 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (29, 4, NULL, '删除', 'system:menu:delete', 2, NULL, 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (30, 4, '', '修改', 'system:menu:update', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (31, 4, NULL, '查询', 'system:menu:read', 2, NULL, 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (32, 6, '', '下线', 'system:online:kick', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (34, 10, '', '新增', 'system:task:create', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (35, 10, '', '删除', 'system:task:delete', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (36, 10, '', '执行一次', 'system:task:once', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (37, 10, '', '查询', 'system:task:read', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (38, 10, '', '运行', 'system:task:start', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (39, 10, '', '暂停', 'system:task:stop', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (40, 10, '', '更新', 'system:task:update', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (41, 7, '', '查询登录日志', 'system:log:login:list', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (42, 7, '', '查询任务日志', 'system:log:task:list', 2, '', 0, '', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (43, NULL, '/about', '关于', '', 0, 'simple-icons:about-dot-me', 255, '/sys/about/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (44, NULL, '/level', '多级菜单', NULL, 0, 'ant-design:menu-outlined', 253, 'LAYOUT', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (45, 44, '/level/menu1', 'Menu1', NULL, 0, '', 1, 'LAYOUT', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (46, 45, '/level/menu1/menu1-1', 'Menu-1-1', NULL, 1, '', 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (47, 44, '/level/menu2', 'Menu2', NULL, 1, '', 2, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (48, NULL, '/tools', '系统工具', NULL, 0, 'ant-design:tool-outlined', 254, 'LAYOUT', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (49, 48, '/tools/email', '邮件工具', 'system:tools:email', 1, '', 1, '/tools/email/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (50, 49, NULL, '发送邮件', 'tools:email:send', 2, '', 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (51, 48, '/tools/storage', '存储管理', 'tools:storage:list', 1, '', 2, '/tools/storage/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (52, 51, NULL, '文件上传', 'upload', 2, '', 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (53, 51, NULL, '文件删除', 'tools:storage:delete', 2, '', 2, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (54, 2, NULL, '修改密码', 'system:user:password', 2, '', 5, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (55, NULL, '/profile/setting', '个人设置', '', 1, '', 252, '/profile/index', 1, 0, 1, 0, '2024-04-10 00:31:44.023393', '2024-05-14 11:29:40.000000');
INSERT INTO `sys_menu` VALUES (56, 1, '/system/dict', '字典管理', 'system:dict:list', 1, '', 4, '/system/dict/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (57, 56, NULL, '新增', 'system:dict:create', 2, '', 1, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (58, 56, NULL, '更新', 'system:dict:update', 2, '', 2, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (59, 56, NULL, '删除', 'system:dict:delete', 2, '', 3, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (60, 56, NULL, '查询', 'system:dict:info', 2, '', 4, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (61, 1, '/system/dept', '部门管理', 'system:dept:list', 1, '', 3, '/system/dept/index', 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (62, 61, NULL, '新增', 'system:dept:create', 2, '', 1, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (63, 61, NULL, '更新', 'system:dept:update', 2, '', 2, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (64, 61, NULL, '删除', 'system:dept:delete', 2, '', 3, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (65, 61, NULL, '查询', 'system:dept:read', 2, '', 4, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (68, 5, '/health', '健康检查', '', 1, '', 4, 'LAYOUT', 1, 0, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (69, 68, NULL, '网络', 'app:health:network', 2, '', 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');
INSERT INTO `sys_menu` VALUES (70, 68, NULL, '数据库', 'app:health: database', 2, '', 0, NULL, 1, 1, 1, 0, '2024-04-10 00:31:44.023393', '2024-04-10 00:31:44.034474');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 1,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `default` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_223de54d6badbe43a5490450c3`(`name` ASC) USING BTREE,
  UNIQUE INDEX `IDX_05edc0a51f41bb16b7d8137da9`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '管理员', '超级管理员', 1, '2024-04-10 00:31:44.058463', '2024-04-10 00:31:44.078799', NULL);
INSERT INTO `sys_role` VALUES (2, 'user', '用户', '', 1, '2024-04-10 00:31:44.058463', '2024-05-01 20:55:48.000000', 1);
INSERT INTO `sys_role` VALUES (3, 'test', '测试', '', 1, '2024-04-10 00:31:44.058463', '2024-04-10 00:31:44.078799', NULL);

-- ----------------------------
-- Table structure for sys_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menus`;
CREATE TABLE `sys_role_menus`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `IDX_35ce749b04d57e226d059e0f63`(`role_id` ASC) USING BTREE,
  INDEX `IDX_2b95fdc95b329d66c18f5baed6`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `FK_2b95fdc95b329d66c18f5baed6d` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_35ce749b04d57e226d059e0f633` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menus
-- ----------------------------
INSERT INTO `sys_role_menus` VALUES (2, 12);
INSERT INTO `sys_role_menus` VALUES (2, 13);
INSERT INTO `sys_role_menus` VALUES (2, 14);
INSERT INTO `sys_role_menus` VALUES (2, 15);
INSERT INTO `sys_role_menus` VALUES (2, 43);
INSERT INTO `sys_role_menus` VALUES (2, 44);
INSERT INTO `sys_role_menus` VALUES (2, 45);
INSERT INTO `sys_role_menus` VALUES (2, 46);
INSERT INTO `sys_role_menus` VALUES (2, 47);
INSERT INTO `sys_role_menus` VALUES (2, 55);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `limit` int(11) NULL DEFAULT 0,
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `every` int(11) NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `job_opts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_ef8e5ab5ef2fe0ddb1428439ef`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (2, '定时清空登录日志', 'LogClearJob.clearLoginLog', 0, 0, NULL, NULL, 0, '0 0 3 ? * 1', 0, '', '{\"count\":1,\"key\":\"__default__:2:::0 0 3 ? * 1\",\"cron\":\"0 0 3 ? * 1\",\"jobId\":2}', '定时清空登录日志', '2024-04-10 00:31:44.197779', '2024-04-10 00:31:44.206935');
INSERT INTO `sys_task` VALUES (3, '定时清空任务日志', 'LogClearJob.clearTaskLog', 0, 0, NULL, NULL, 0, '0 0 3 ? * 1', 0, '', '{\"count\":1,\"key\":\"__default__:3:::0 0 3 ? * 1\",\"cron\":\"0 0 3 ? * 1\",\"jobId\":3}', '定时清空任务日志', '2024-04-10 00:31:44.197779', '2024-04-18 01:10:27.000000');
INSERT INTO `sys_task` VALUES (4, '访问百度首页', 'HttpRequestJob.handle', 0, 0, NULL, NULL, 1, '* * * * * ?', NULL, '{\"url\":\"https://www.baidu.com\",\"method\":\"get\"}', NULL, '访问百度首页', '2024-04-10 00:31:44.197779', '2024-04-10 00:31:44.206935');
INSERT INTO `sys_task` VALUES (5, '发送邮箱', 'EmailJob.send', 0, 0, NULL, NULL, -1, '0 0 0 1 * ?', NULL, '{\"subject\":\"这是标题\",\"to\":\"zeyu57@163.com\",\"content\":\"这是正文\"}', NULL, '每月发送邮箱', '2024-04-10 00:31:44.197779', '2024-04-10 00:31:44.206935');

-- ----------------------------
-- Table structure for sys_task_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_log`;
CREATE TABLE `sys_task_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `consume_time` int(11) NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_f4d9c36052fdb188ff5c089454b`(`task_id` ASC) USING BTREE,
  CONSTRAINT `FK_f4d9c36052fdb188ff5c089454b` FOREIGN KEY (`task_id`) REFERENCES `sys_task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task_log
-- ----------------------------
INSERT INTO `sys_task_log` VALUES (21, 3, 0, 'Error: Nest could not find LogClearJob element (this provider does not exist in the current context)', 0, '2024-04-10 00:31:44.217520', '2024-04-10 00:31:44.224078');
INSERT INTO `sys_task_log` VALUES (22, 3, 0, 'Error: Nest could not find LogClearJob element (this provider does not exist in the current context)', 0, '2024-04-10 00:31:44.217520', '2024-04-10 00:31:44.224078');
INSERT INTO `sys_task_log` VALUES (23, 3, 0, 'Error: Nest could not find LogClearJob element (this provider does not exist in the current context)', 0, '2024-04-10 00:31:44.217520', '2024-04-10 00:31:44.224078');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `psalt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(4) NULL DEFAULT 1,
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_9e7164b2f1ea1348bc0eb0a7da`(`username` ASC) USING BTREE,
  INDEX `FK_96bde34263e2ae3b46f011124ac`(`dept_id` ASC) USING BTREE,
  CONSTRAINT `FK_96bde34263e2ae3b46f011124ac` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'a11571e778ee85e82caae2d980952546', '/upload/logo.png', 'hi@laohaicode.com', NULL, '管理员', 'xQYCspvFb8cAW6GG1pOoUGTLqsuUSO3d', 1, '911993023', '2024-04-10 00:31:44.104382', '2024-05-14 17:03:48.000000', 'laohai12', 1);
INSERT INTO `sys_user` VALUES (2, 'user', 'dbd89546dec743f82bb9073d6ac39361', '/upload/icon-128-202405141817735.png', 'laohai12@163.com', NULL, '无', 'qlovDV7pL5dPYPI3QgFFo1HH74nP6sJe', 1, '911993023', '2024-04-10 00:31:44.104382', '2024-05-14 18:17:50.000000', '123', 8);

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_roles`;
CREATE TABLE `sys_user_roles`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `IDX_96311d970191a044ec048011f4`(`user_id` ASC) USING BTREE,
  INDEX `IDX_6d61c5b3f76a3419d93a421669`(`role_id` ASC) USING BTREE,
  CONSTRAINT `FK_6d61c5b3f76a3419d93a4216695` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_96311d970191a044ec048011f44` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
INSERT INTO `sys_user_roles` VALUES (1, 1);
INSERT INTO `sys_user_roles` VALUES (2, 2);

-- ----------------------------
-- Table structure for todo
-- ----------------------------
DROP TABLE IF EXISTS `todo`;
CREATE TABLE `todo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_9cb7989853c4cb7fe427db4b260`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK_9cb7989853c4cb7fe427db4b260` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of todo
-- ----------------------------
INSERT INTO `todo` VALUES (1, 'nest.js', NULL, 0, '2024-04-10 00:31:44.139730', '2024-04-10 00:31:44.147629');

-- ----------------------------
-- Table structure for tool_storage
-- ----------------------------
DROP TABLE IF EXISTS `tool_storage`;
CREATE TABLE `tool_storage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名',
  `fileName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实文件名',
  `ext_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_storage
-- ----------------------------
INSERT INTO `tool_storage` VALUES (1, '2024-05-14 00:24:40.539022', '2024-05-14 00:24:40.539022', 'icon-128-202405140024530.png', 'icon-128.png', 'png', '/upload/icon-128-202405140024530.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (2, '2024-05-14 00:24:53.862136', '2024-05-14 00:24:53.862136', 'test_20240313140725-202405140024856.png', 'test_20240313140725.png', 'png', '/upload/test_20240313140725-202405140024856.png', '图片', '15.85 KB', 1);
INSERT INTO `tool_storage` VALUES (3, '2024-05-14 00:25:04.166487', '2024-05-14 00:25:04.166487', 'icon-128-202405140025163.png', 'icon-128.png', 'png', '/upload/icon-128-202405140025163.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (4, '2024-05-14 00:25:31.514444', '2024-05-14 00:25:31.514444', 'icon-192-202405140025510.png', 'icon-192.png', 'png', '/upload/icon-192-202405140025510.png', '图片', '15.86 KB', 1);
INSERT INTO `tool_storage` VALUES (5, '2024-05-14 00:25:41.956219', '2024-05-14 00:25:41.956219', 'icon-128-202405140025952.png', 'icon-128.png', 'png', '/upload/icon-128-202405140025952.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (6, '2024-05-14 00:26:01.736090', '2024-05-14 00:26:01.736090', 'icon-128-202405140026732.png', 'icon-128.png', 'png', '/upload/icon-128-202405140026732.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (7, '2024-05-14 00:26:06.171991', '2024-05-14 00:26:06.171991', 'icon-128-202405140026167.png', 'icon-128.png', 'png', '/upload/icon-128-202405140026167.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (8, '2024-05-14 00:26:30.571253', '2024-05-14 00:26:30.571253', 'icon-128-202405140026566.png', 'icon-128.png', 'png', '/upload/icon-128-202405140026566.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (9, '2024-05-14 00:26:35.802276', '2024-05-14 00:26:35.802276', 'icon-128-202405140026797.png', 'icon-128.png', 'png', '/upload/icon-128-202405140026797.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (10, '2024-05-14 16:39:43.857919', '2024-05-14 16:39:43.857919', 'icon-128-202405141639804.png', 'icon-128.png', 'png', '/upload/icon-128-202405141639804.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (11, '2024-05-14 16:44:17.624944', '2024-05-14 16:44:17.624944', 'icon-128-202405141644622.png', 'icon-128.png', 'png', '/upload/icon-128-202405141644622.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (12, '2024-05-14 17:02:51.918613', '2024-05-14 17:02:51.918613', 'icon-128-202405141702913.png', 'icon-128.png', 'png', '/upload/icon-128-202405141702913.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (13, '2024-05-14 17:03:09.522032', '2024-05-14 17:03:09.522032', 'icon-128-202405141703518.png', 'icon-128.png', 'png', '/upload/icon-128-202405141703518.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (14, '2024-05-14 17:03:22.897720', '2024-05-14 17:03:22.897720', 'icon-128-202405141703886.png', 'icon-128.png', 'png', '/upload/icon-128-202405141703886.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (15, '2024-05-14 17:03:46.008350', '2024-05-14 17:03:46.008350', 'icon-192-202405141703005.png', 'icon-192.png', 'png', '/upload/icon-192-202405141703005.png', '图片', '31.69 KB', 1);
INSERT INTO `tool_storage` VALUES (16, '2024-05-14 17:48:19.901348', '2024-05-14 17:48:19.901348', 'icon-128-202405141748861.png', 'icon-128.png', 'png', '/upload/icon-128-202405141748861.png', '图片', '15.86 KB', 1);
INSERT INTO `tool_storage` VALUES (17, '2024-05-14 17:59:48.207137', '2024-05-14 17:59:48.207137', 'icon-128-202405141759204.png', 'icon-128.png', 'png', '/upload/icon-128-202405141759204.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (18, '2024-05-14 18:00:10.146619', '2024-05-14 18:00:10.146619', 'icon-128-202405141800142.png', 'icon-128.png', 'png', '/upload/icon-128-202405141800142.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (19, '2024-05-14 18:03:46.756362', '2024-05-14 18:03:46.756362', 'icon-128-202405141803751.png', 'icon-128.png', 'png', '/upload/icon-128-202405141803751.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (20, '2024-05-14 18:06:57.888949', '2024-05-14 18:06:57.888949', 'icon-128-202405141806885.png', 'icon-128.png', 'png', '/upload/icon-128-202405141806885.png', '图片', '18 KB', 1);
INSERT INTO `tool_storage` VALUES (21, '2024-05-14 18:17:48.746501', '2024-05-14 18:17:48.746501', 'icon-128-202405141817735.png', 'icon-128.png', 'png', '/upload/icon-128-202405141817735.png', '图片', '15.86 KB', 1);

-- ----------------------------
-- Table structure for user_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `user_access_tokens`;
CREATE TABLE `user_access_tokens`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL COMMENT '令牌过期时间',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '令牌创建时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_e9d9d0c303432e4e5e48c1c3e90`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK_e9d9d0c303432e4e5e48c1c3e90` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_access_tokens
-- ----------------------------
INSERT INTO `user_access_tokens` VALUES ('0031422d-0e23-4759-9733-7b78a625b221', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU2ODE4NDl9.zj3NK-UZBjZQwy6sUHR7Tqca4UHUfbATVA2NW3gSMxw', '2024-05-15 18:17:29', '2024-05-14 18:17:29.380349', 1);
INSERT INTO `user_access_tokens` VALUES ('0eff4787-e31e-44d3-9094-7917594d8b8b', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU1OTY2NTF9.BTJu5DW_Rmgvq6cvVTWGksqZmzdwgJjg7cKbPm6gOMk', '2024-05-14 18:37:32', '2024-05-13 18:37:31.604517', 1);
INSERT INTO `user_access_tokens` VALUES ('169e3714-b2e0-47e1-9857-85e116cff570', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU2ODI3ODl9.qcnkbHSu1qf0JOKzjonFr8NG6wn34fYmg5D7JZ_nYNw', '2024-05-15 18:33:09', '2024-05-14 18:33:09.379208', 1);
INSERT INTO `user_access_tokens` VALUES ('226fef3e-4e49-4d8f-bb38-6d5aa7123459', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU1OTM5MDd9.8oLK33xrkn6VRRHv1nUmlEhSrLa67lmPmXGypSm3u3A', '2024-05-14 17:51:48', '2024-05-13 17:51:47.724400', 1);
INSERT INTO `user_access_tokens` VALUES ('23cb5735-d41c-4a31-bf78-2bd2b05e8902', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU1OTM5NDN9.iUAKzD0YTL7psVYWmT9aYw5W8SCCj8kaU3rKUpSrqyI', '2024-05-14 17:52:23', '2024-05-13 17:52:23.332362', 1);
INSERT INTO `user_access_tokens` VALUES ('641ed42c-cfd8-46b3-9b0a-d2e2b8bac3c8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU2MTY0MjF9.amfhOsMxPJ_yI3Dj3jhrLsLzeneMWJR7p5ZZxZ4FNdQ', '2024-05-15 00:07:01', '2024-05-14 00:07:01.183172', 1);
INSERT INTO `user_access_tokens` VALUES ('7d84d629-4684-4ef1-b5ce-4d391f4e0bf4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU2MTUwMDB9.tQC4EKj8Us2AfzASz-AMfSyNR4naNFakE6wS2Ye2Kwc', '2024-05-14 23:43:20', '2024-05-13 23:43:20.227568', 1);
INSERT INTO `user_access_tokens` VALUES ('82de1e78-cd1c-44ef-a7f9-50b29252afb4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU1OTU0MTR9.lmbQAMsA8RO7a-P121Q6egkr3xVH3UY0KrpNVdXl1QA', '2024-05-14 18:16:54', '2024-05-13 18:16:54.141772', 1);
INSERT INTO `user_access_tokens` VALUES ('b19bcdaf-5629-4b0a-a4f7-caf32688bc33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU1OTUyNzR9.SnsJFV1mBXkeDyaL4ptmdRScT684u7RcYjHn3U45Z3M', '2024-05-14 18:14:34', '2024-05-13 18:14:34.260369', 1);
INSERT INTO `user_access_tokens` VALUES ('b3a51f03-095b-40f8-8728-c6492a1a8d88', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU2NTc0MjB9.vtVgVA0NRPVD7bNQB6B7IfaVD7zDKKjOEUaCP6oJf_o', '2024-05-15 11:30:20', '2024-05-14 11:30:20.143563', 1);
INSERT INTO `user_access_tokens` VALUES ('b9f22fc4-1cbd-4147-9837-cc0187b9f508', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU1OTQzNDd9.lry_HYVQq_uFQv6obnDS-R-AJCEBGkVkvGoqGPI2csE', '2024-05-14 17:59:08', '2024-05-13 17:59:07.647632', 1);
INSERT INTO `user_access_tokens` VALUES ('dd28e22b-6b6c-4436-98b5-19f70ce198dc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU2ODExOTN9.cqotr2-9opROB0GKB2US7WLQjOtOo0rVadcSSvevUtI', '2024-05-15 18:06:33', '2024-05-14 18:06:33.407547', 1);
INSERT INTO `user_access_tokens` VALUES ('e54feff5-cdeb-4922-b674-a9550b228029', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU2MTczODR9.OehrzOyt0aV2IBx0xVI-E7z3Yem5m021gBMyPH0u4N0', '2024-05-15 00:23:04', '2024-05-14 00:23:04.134506', 1);
INSERT INTO `user_access_tokens` VALUES ('ed83e7bc-77e9-4b23-8deb-d85c5ccf8d7f', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInB2IjoxLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTU2ODIwODB9.w6ZdXjhrPKjfKuYNNGn281kEuRUW7yHmdYOGRt8N5oA', '2024-05-15 18:21:20', '2024-05-14 18:21:20.255950', 1);

-- ----------------------------
-- Table structure for user_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `user_refresh_tokens`;
CREATE TABLE `user_refresh_tokens`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL COMMENT '令牌过期时间',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '令牌创建时间',
  `accessTokenId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `REL_1dfd080c2abf42198691b60ae3`(`accessTokenId` ASC) USING BTREE,
  CONSTRAINT `FK_1dfd080c2abf42198691b60ae39` FOREIGN KEY (`accessTokenId`) REFERENCES `user_access_tokens` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_refresh_tokens
-- ----------------------------
INSERT INTO `user_refresh_tokens` VALUES ('07efcaeb-c3d0-4888-af6d-14fd1de789bf', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoieWFPajFmOTQ2T29BRGdEeUFNQWZtIiwiaWF0IjoxNzE1NjgxMTkzfQ.pWloDJM-Bl2OsgGE4FNRu9bAV6EfVtkkLt4e19CWUBc', '2024-06-13 18:06:33', '2024-05-14 18:06:33.441481', 'dd28e22b-6b6c-4436-98b5-19f70ce198dc');
INSERT INTO `user_refresh_tokens` VALUES ('24e56f42-305c-4b99-ace5-2fe837f0a8bc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiLUphTjcwV1lKT2xzT19WWDZaeU9JIiwiaWF0IjoxNzE1NTk1Mjc0fQ.-fetQmUBRnMzv7iSre8U7wzrosJdW6xY1X0z9aAO8Eg', '2024-06-12 18:14:34', '2024-05-13 18:14:34.299768', 'b19bcdaf-5629-4b0a-a4f7-caf32688bc33');
INSERT INTO `user_refresh_tokens` VALUES ('37459135-10f9-4091-8296-2c487ceebe45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiSzVRZ0FJTm9Pd0FTc2IyRmxGaFA1IiwiaWF0IjoxNzE1NTk0MzQ3fQ.PNrTKxBqyrwW2BJ9Ky2ReCVgIj1oNSc2EuR_M2Z30XI', '2024-06-12 17:59:08', '2024-05-13 17:59:07.661613', 'b9f22fc4-1cbd-4147-9837-cc0187b9f508');
INSERT INTO `user_refresh_tokens` VALUES ('51bdc318-c8bf-49bd-b643-2435c6d76813', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiSVhld2pURGE5dkRWcEpsR0VWWkI1IiwiaWF0IjoxNzE1NjE1MDAwfQ.mb9TFsLprG4RQi6fe2Gt4g3Uf80hl65h-Yjm55iC63Y', '2024-06-12 23:43:20', '2024-05-13 23:43:20.259234', '7d84d629-4684-4ef1-b5ce-4d391f4e0bf4');
INSERT INTO `user_refresh_tokens` VALUES ('7db8da94-0ceb-4168-9ab3-2b0153740501', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiZXpLVWg0ZlE1NDFnbFhBNDNhdnpVIiwiaWF0IjoxNzE1NjE2NDIxfQ.wtIN5Z7AITC95DrqarZHWKCpzVNH1uzn_dKNNiZp3a0', '2024-06-13 00:07:01', '2024-05-14 00:07:01.262036', '641ed42c-cfd8-46b3-9b0a-d2e2b8bac3c8');
INSERT INTO `user_refresh_tokens` VALUES ('80e6b11a-e6af-48e1-a53f-b1aa0c89a9cd', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiSEE1VlU5a0xiNmdoWWo5a1luWVFpIiwiaWF0IjoxNzE1NjgyNzg5fQ.TZEsxcXkZGx9jQSkIeo9KGvM78NCiHQY63wlDQtwnRg', '2024-06-13 18:33:09', '2024-05-14 18:33:09.395530', '169e3714-b2e0-47e1-9857-85e116cff570');
INSERT INTO `user_refresh_tokens` VALUES ('8c184d0e-41c6-424d-9bdc-65b9204f22a2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoibk5tSWVaNHo5VFJHNXZZakVNYXdMIiwiaWF0IjoxNzE1NjE3Mzg0fQ.Y_T7wsBhX-vgWSqLeXeMIrEaAKLqeY4gm4tuwSlKAvw', '2024-06-13 00:23:04', '2024-05-14 00:23:04.162755', 'e54feff5-cdeb-4922-b674-a9550b228029');
INSERT INTO `user_refresh_tokens` VALUES ('93e4f062-a47a-4946-8712-51a8cd3ce719', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiYk1wWWJ4UFBramZIVjBwLXlaMXE2IiwiaWF0IjoxNzE1NjU3NDIwfQ.bBr0ra5Q76tTfsTVCw1EoISQeuYhpbwDkro_vWbrxNs', '2024-06-13 11:30:20', '2024-05-14 11:30:20.182803', 'b3a51f03-095b-40f8-8728-c6492a1a8d88');
INSERT INTO `user_refresh_tokens` VALUES ('bf5507e2-de89-44d4-9f11-f16fa1cba717', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiaDU0aXVIOElaLXpZTDdVclRpWEs4IiwiaWF0IjoxNzE1NTk1NDE0fQ.7irxNUjO7Int_BNOwSkeL8AxLzDzK6sGNkJaWH5j4bA', '2024-06-12 18:16:54', '2024-05-13 18:16:54.199012', '82de1e78-cd1c-44ef-a7f9-50b29252afb4');
INSERT INTO `user_refresh_tokens` VALUES ('c99b1e43-a1e2-4748-a555-c090c6410359', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiQTViQ2xkdjQ2QjMtODZWQTZSYUpmIiwiaWF0IjoxNzE1NTkzOTQzfQ.QzwD67D6FEOO0bnCLkFBHJIjGUFO4aZjumda5XCxrlE', '2024-06-12 17:52:23', '2024-05-13 17:52:23.360644', '23cb5735-d41c-4a31-bf78-2bd2b05e8902');
INSERT INTO `user_refresh_tokens` VALUES ('d88a1508-49d3-44ed-99cc-434ee2aaf8e7', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiWlo0eVBmMmlvSGpzVndXSlU4LUI1IiwiaWF0IjoxNzE1NTk2NjUxfQ.CrAV1ww1ZogVuv62lTP9pcskJB3mhO6810uWtALnHrQ', '2024-06-12 18:37:32', '2024-05-13 18:37:31.653898', '0eff4787-e31e-44d3-9094-7917594d8b8b');
INSERT INTO `user_refresh_tokens` VALUES ('ecc101df-5b39-4ebe-9356-706b78eb0c6f', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoieFVwVmZIMGhBaG9XektJZEZoYXI4IiwiaWF0IjoxNzE1NjgyMDgwfQ.-kFb7pyRruMtHicy-jqmjDBzBMwLkT_NXCxQLzVBUtA', '2024-06-13 18:21:20', '2024-05-14 18:21:20.276752', 'ed83e7bc-77e9-4b23-8deb-d85c5ccf8d7f');
INSERT INTO `user_refresh_tokens` VALUES ('fc8a7ba5-a6ed-4541-b583-f9f73eecaee7', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiVlE0TS1FanFqMERDaDQ1YnZmcDQyIiwiaWF0IjoxNzE1NTkzOTA3fQ.jvieGIQ0iCGltC1EqAc4iQOC_tj3QPTPuWUOIlr7FGk', '2024-06-12 17:51:48', '2024-05-13 17:51:47.753987', '226fef3e-4e49-4d8f-bb38-6d5aa7123459');
INSERT INTO `user_refresh_tokens` VALUES ('fe98143a-50a6-47c5-b6a9-6bb1b4d9bb42', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiUE9ZX25EaEd0Q0xEM1F1ak9ZVGFTIiwiaWF0IjoxNzE1NjgxODQ5fQ.LApYpoxwFtARsIOwyKNjQ7Av92Kg1fUiXUw8VRFS5uc', '2024-06-13 18:17:29', '2024-05-14 18:17:29.401604', '0031422d-0e23-4759-9733-7b78a625b221');

SET FOREIGN_KEY_CHECKS = 1;
