/*
 Navicat MySQL Data Transfer

 Source Server         : source
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : source

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 13/08/2020 23:13:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administer
-- ----------------------------
DROP TABLE IF EXISTS `administer`;
CREATE TABLE `administer`  (
  `aid` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administer
-- ----------------------------
INSERT INTO `administer` VALUES (1, 'root123', 'admin');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add auth group', 7, 'add_authgroup');
INSERT INTO `auth_permission` VALUES (26, 'Can change auth group', 7, 'change_authgroup');
INSERT INTO `auth_permission` VALUES (27, 'Can delete auth group', 7, 'delete_authgroup');
INSERT INTO `auth_permission` VALUES (28, 'Can view auth group', 7, 'view_authgroup');
INSERT INTO `auth_permission` VALUES (29, 'Can add auth group permissions', 8, 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (30, 'Can change auth group permissions', 8, 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (31, 'Can delete auth group permissions', 8, 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (32, 'Can view auth group permissions', 8, 'view_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (33, 'Can add auth permission', 9, 'add_authpermission');
INSERT INTO `auth_permission` VALUES (34, 'Can change auth permission', 9, 'change_authpermission');
INSERT INTO `auth_permission` VALUES (35, 'Can delete auth permission', 9, 'delete_authpermission');
INSERT INTO `auth_permission` VALUES (36, 'Can view auth permission', 9, 'view_authpermission');
INSERT INTO `auth_permission` VALUES (37, 'Can add auth user', 10, 'add_authuser');
INSERT INTO `auth_permission` VALUES (38, 'Can change auth user', 10, 'change_authuser');
INSERT INTO `auth_permission` VALUES (39, 'Can delete auth user', 10, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (40, 'Can view auth user', 10, 'view_authuser');
INSERT INTO `auth_permission` VALUES (41, 'Can add auth user groups', 11, 'add_authusergroups');
INSERT INTO `auth_permission` VALUES (42, 'Can change auth user groups', 11, 'change_authusergroups');
INSERT INTO `auth_permission` VALUES (43, 'Can delete auth user groups', 11, 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES (44, 'Can view auth user groups', 11, 'view_authusergroups');
INSERT INTO `auth_permission` VALUES (45, 'Can add auth user user permissions', 12, 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (46, 'Can change auth user user permissions', 12, 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (47, 'Can delete auth user user permissions', 12, 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (48, 'Can view auth user user permissions', 12, 'view_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (49, 'Can add django admin log', 13, 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES (50, 'Can change django admin log', 13, 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES (51, 'Can delete django admin log', 13, 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES (52, 'Can view django admin log', 13, 'view_djangoadminlog');
INSERT INTO `auth_permission` VALUES (53, 'Can add django content type', 14, 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES (54, 'Can change django content type', 14, 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES (55, 'Can delete django content type', 14, 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES (56, 'Can view django content type', 14, 'view_djangocontenttype');
INSERT INTO `auth_permission` VALUES (57, 'Can add django migrations', 15, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (58, 'Can change django migrations', 15, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (59, 'Can delete django migrations', 15, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (60, 'Can view django migrations', 15, 'view_djangomigrations');
INSERT INTO `auth_permission` VALUES (61, 'Can add django session', 16, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (62, 'Can change django session', 16, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (63, 'Can delete django session', 16, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (64, 'Can view django session', 16, 'view_djangosession');
INSERT INTO `auth_permission` VALUES (65, 'Can add users', 17, 'add_users');
INSERT INTO `auth_permission` VALUES (66, 'Can change users', 17, 'change_users');
INSERT INTO `auth_permission` VALUES (67, 'Can delete users', 17, 'delete_users');
INSERT INTO `auth_permission` VALUES (68, 'Can view users', 17, 'view_users');
INSERT INTO `auth_permission` VALUES (69, 'Can add administer', 18, 'add_administer');
INSERT INTO `auth_permission` VALUES (70, 'Can change administer', 18, 'change_administer');
INSERT INTO `auth_permission` VALUES (71, 'Can delete administer', 18, 'delete_administer');
INSERT INTO `auth_permission` VALUES (72, 'Can view administer', 18, 'view_administer');
INSERT INTO `auth_permission` VALUES (73, 'Can add predict result', 19, 'add_predictresult');
INSERT INTO `auth_permission` VALUES (74, 'Can change predict result', 19, 'change_predictresult');
INSERT INTO `auth_permission` VALUES (75, 'Can delete predict result', 19, 'delete_predictresult');
INSERT INTO `auth_permission` VALUES (76, 'Can view predict result', 19, 'view_predictresult');
INSERT INTO `auth_permission` VALUES (77, 'Can add trace result', 20, 'add_traceresult');
INSERT INTO `auth_permission` VALUES (78, 'Can change trace result', 20, 'change_traceresult');
INSERT INTO `auth_permission` VALUES (79, 'Can delete trace result', 20, 'delete_traceresult');
INSERT INTO `auth_permission` VALUES (80, 'Can view trace result', 20, 'view_traceresult');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$120000$ShvRoLriKCYF$7dipjR8KVry177u0EuUw/TBGtDDjVcssw20TBV93JU4=', '2020-07-28 09:48:34.650523', 1, 'admin', '', '', '1259905312@qq.com', 1, 1, '2020-07-28 09:48:24.365832');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'user', 'authgroup');
INSERT INTO `django_content_type` VALUES (8, 'user', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES (9, 'user', 'authpermission');
INSERT INTO `django_content_type` VALUES (10, 'user', 'authuser');
INSERT INTO `django_content_type` VALUES (11, 'user', 'authusergroups');
INSERT INTO `django_content_type` VALUES (12, 'user', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES (13, 'user', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES (14, 'user', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES (15, 'user', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (16, 'user', 'djangosession');
INSERT INTO `django_content_type` VALUES (17, 'user', 'users');
INSERT INTO `django_content_type` VALUES (18, 'user', 'administer');
INSERT INTO `django_content_type` VALUES (19, 'user', 'predictresult');
INSERT INTO `django_content_type` VALUES (20, 'user', 'traceresult');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-07-27 01:48:04.708056');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-07-27 01:48:04.969582');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-07-27 01:48:05.031382');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-07-27 01:48:05.040401');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-07-27 01:48:05.048377');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-07-27 01:48:05.088271');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-07-27 01:48:05.104222');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-07-27 01:48:05.122185');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-07-27 01:48:05.134108');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-07-27 01:48:05.154053');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-07-27 01:48:05.156060');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-07-27 01:48:05.165024');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-07-27 01:48:05.185968');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-07-27 01:48:05.204917');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2020-07-27 01:48:05.228853');
INSERT INTO `django_migrations` VALUES (16, 'user', '0001_initial', '2020-07-27 01:59:14.724243');
INSERT INTO `django_migrations` VALUES (17, 'user', '0002_administer', '2020-07-27 02:46:14.791221');
INSERT INTO `django_migrations` VALUES (18, 'user', '0003_predictresult_traceresult', '2020-08-11 05:53:13.089343');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('va43ivygg16x8bufq6vvilll60cun68v', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 03:06:36.104408');
INSERT INTO `django_session` VALUES ('ojejko5soa3wmmwgewyy9fdmjm1ms3qm', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 03:17:59.361086');
INSERT INTO `django_session` VALUES ('8wdoy2wtrirqymfe5v153q4lfnhtvoaj', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 03:29:02.760776');
INSERT INTO `django_session` VALUES ('nr3ejwnw56rlyfnycz2xmmcumcwleqcl', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 03:58:36.661073');
INSERT INTO `django_session` VALUES ('2oqr6iwqh0ljd2e29kqld02hpmk5t95s', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 04:19:34.381081');
INSERT INTO `django_session` VALUES ('4by4lv2tkpn1eg3awwzukvo62yuo5ado', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 09:41:39.214688');
INSERT INTO `django_session` VALUES ('3yyucevz20xzfgkke3rwix0d5ravikuy', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 09:53:21.924923');
INSERT INTO `django_session` VALUES ('eenb7h8t6q492hz5czaveyfqnzaj3uxe', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 10:08:48.721873');
INSERT INTO `django_session` VALUES ('tsgovdebq9u9cskzyc6ix3xdz6amvn0m', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 10:22:41.491657');
INSERT INTO `django_session` VALUES ('st9q4kszi7immj4bhbp8t97jkgpvjfkp', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 11:10:38.044022');
INSERT INTO `django_session` VALUES ('iwft7p9sf6hdgg2d3ueo6oluma37vwei', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 11:20:51.558241');
INSERT INTO `django_session` VALUES ('vxe3urh5pkhbjn2hfqaaq1sb0bpp5oxi', 'MjUyOGRjMTk4YmQ0YTdmYjE1ZTgzNGZiNzA2ZGUzNzYzMWFlZmVlZDp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImxpaHVpMSIsInBhc3N3b3JkIjoiMTIzcXdlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-27 12:05:10.238700');
INSERT INTO `django_session` VALUES ('v29ws2esxgzqby1z5o63wgnt7i6alnl0', 'ZDc3OWE1MDk1ODMzMTRkZTVlOGJmZjg5ZTU5MmNkNDllZGRjZTA5Nzp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTAzMTQ1LjUzNzkyMDUuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-28 04:37:19.936699');
INSERT INTO `django_session` VALUES ('u61je9j4lxlftulzz48x1vgb0zikiiq9', 'NDBmYTc3ODdjYTZhNzE0ZDJlY2VjOWNmODhmMzMxYmViOGYzYTczOTp7InVzZXJfaWQiOjMsInVzZXJfbmFtZSI6ImxpaHVpMTExIiwicGFzc3dvcmQiOiIxMjNxd2UiLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvbGlodWkxMTEtMTU5NTkwMzE0NS41Mzc5MjA1LmpwZyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==', '2020-07-28 03:27:41.106287');
INSERT INTO `django_session` VALUES ('jqq20waxpbdg6gief8nxlrsdlhk9kjlb', 'ZDc3OWE1MDk1ODMzMTRkZTVlOGJmZjg5ZTU5MmNkNDllZGRjZTA5Nzp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTAzMTQ1LjUzNzkyMDUuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-28 04:25:19.648289');
INSERT INTO `django_session` VALUES ('n0sd4m9j6xri5yj882sgeihvudqeadei', 'ZDc3OWE1MDk1ODMzMTRkZTVlOGJmZjg5ZTU5MmNkNDllZGRjZTA5Nzp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTAzMTQ1LjUzNzkyMDUuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-28 04:54:38.136979');
INSERT INTO `django_session` VALUES ('qae5xtxlby4i0wgsje2x8tjvh0p310y6', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-28 09:44:08.777667');
INSERT INTO `django_session` VALUES ('7x41zi9mksnvwkr764bm7wd2j9ini8it', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-28 05:38:53.336487');
INSERT INTO `django_session` VALUES ('opa7p6h2ruyyejao8v3i6t04ciinc59l', 'NGU5ZWQxMjY1OGYzYTllMDlmMTlmMDJmNjc1ODdmMjhlNTg4M2YwODp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QxMjMiLCJwYXNzd29yZCI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-28 10:39:21.832551');
INSERT INTO `django_session` VALUES ('ekfrjmuid20w08nhg1thuaumegkg6gk8', 'NGU5ZWQxMjY1OGYzYTllMDlmMTlmMDJmNjc1ODdmMjhlNTg4M2YwODp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QxMjMiLCJwYXNzd29yZCI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 01:37:28.780879');
INSERT INTO `django_session` VALUES ('r2i95n4e0aydb196etqi2cqizgqeqe72', 'NGU5ZWQxMjY1OGYzYTllMDlmMTlmMDJmNjc1ODdmMjhlNTg4M2YwODp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QxMjMiLCJwYXNzd29yZCI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 02:20:04.290689');
INSERT INTO `django_session` VALUES ('2ii6qxns3f3xxp7rmtngcm5zs1r2n9f0', 'NGU5ZWQxMjY1OGYzYTllMDlmMTlmMDJmNjc1ODdmMjhlNTg4M2YwODp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QxMjMiLCJwYXNzd29yZCI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 02:36:57.716181');
INSERT INTO `django_session` VALUES ('sgrxw5jvwyzx2jacr2q631fn6t7j1f51', 'NGU5ZWQxMjY1OGYzYTllMDlmMTlmMDJmNjc1ODdmMjhlNTg4M2YwODp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QxMjMiLCJwYXNzd29yZCI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 02:51:05.503772');
INSERT INTO `django_session` VALUES ('hkxn499o14r7t5wq28v5ejlapuqbem5b', 'M2E0NGQ4MDJkMTczMGNmNDJiMjFmMzViM2VhNWM0ZmNhZjI4NmJkNzp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6ImxpaHVpMTExIiwicGFzc3dvcmQiOiIxMjNxd2UiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwidWlkIjozLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvbGlodWkxMTEtMTU5NTkxNDEzMy4zMjI1MjUzLmpwZyJ9', '2020-07-29 03:13:32.691892');
INSERT INTO `django_session` VALUES ('rajtbfrtc2lz7d6u2cry5i94ko7pg8f2', 'MDMwNmUzZDRhMzI0MjA5N2JiNjViYjFkNWY2ZGU2YmMyN2U1NmMzYTp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QxMjMiLCJwYXNzd29yZCI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVpZCI6MywidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGcifQ==', '2020-07-29 03:51:56.925472');
INSERT INTO `django_session` VALUES ('905uyip3dmx455u8e4puhwl54rnry5gc', 'NGU5ZWQxMjY1OGYzYTllMDlmMTlmMDJmNjc1ODdmMjhlNTg4M2YwODp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QxMjMiLCJwYXNzd29yZCI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 04:32:02.674387');
INSERT INTO `django_session` VALUES ('w9ukrjafgm82ia6yumk9zj8lhzsqvhtw', 'NGU5ZWQxMjY1OGYzYTllMDlmMTlmMDJmNjc1ODdmMjhlNTg4M2YwODp7ImFkbWluaXN0ZXJfaWQiOjEsInVzZXJfbmFtZSI6InJvb3QxMjMiLCJwYXNzd29yZCI6ImFkbWluIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 04:48:55.326649');
INSERT INTO `django_session` VALUES ('gfwsbnsg613kuvqjqfpqow4boerot9ex', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 05:57:49.592914');
INSERT INTO `django_session` VALUES ('9ljmq8f1iv2ln5cx7skio1vbzrx1ufyq', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 06:29:34.199449');
INSERT INTO `django_session` VALUES ('cjt3ftkb8gclykbgwc5hy26ugjvp5so5', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 11:56:56.561631');
INSERT INTO `django_session` VALUES ('vmqi8mpuqkdocgbvvh1qjrnxv2mdt07y', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-07-29 12:27:31.808290');
INSERT INTO `django_session` VALUES ('s9t8odzii1a1cfhstxfnsgabkr6nyh3t', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-07 13:26:31.140713');
INSERT INTO `django_session` VALUES ('dcfdp2kl0zdpqfjvd3ijivx55pknw4rm', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-07 13:59:09.132666');
INSERT INTO `django_session` VALUES ('4zq5i7xmbt749be8rksp9pyhberhdnlw', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-08 04:13:31.716160');
INSERT INTO `django_session` VALUES ('wo6jkauhqs7b7ijpl37mzkk18k4ewhzj', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-08 04:57:54.125488');
INSERT INTO `django_session` VALUES ('gczktjvt66nobgbhph0gu5rlqwkjziqo', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-08 05:14:49.133156');
INSERT INTO `django_session` VALUES ('ykozionsoz39pxx3tgys0sgcpa6db3o2', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-10 05:24:05.517118');
INSERT INTO `django_session` VALUES ('v7cwucs19zffxa8cq9rotswvs4csr88k', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 04:01:54.039285');
INSERT INTO `django_session` VALUES ('v38lwnxmvl0pxuivbz41pls4929rdk9h', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 06:10:02.281719');
INSERT INTO `django_session` VALUES ('l9gsblqzolwjos2a54hzvvhgegcwzu7y', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 06:35:00.312505');
INSERT INTO `django_session` VALUES ('pvz11vj5tp6m33ztkxoiozk319vqdrml', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 06:49:00.995843');
INSERT INTO `django_session` VALUES ('qmip97aqn5qq2bbz46epype5feu1u0te', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 07:08:48.533482');
INSERT INTO `django_session` VALUES ('zltevqjs6ob0pv3kpw85ocljoqkkfnq3', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 07:39:19.882131');
INSERT INTO `django_session` VALUES ('imlewq5klremn1027ct7r0tdwn0tvqnp', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 08:36:47.249087');
INSERT INTO `django_session` VALUES ('73dxwt6zuohc7ld1egsdt6akh0twcqis', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 08:54:52.016853');
INSERT INTO `django_session` VALUES ('7nrql6k5m85bi13yb1nxw8abdhovjbk2', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 09:31:54.214727');
INSERT INTO `django_session` VALUES ('fft94e07eh36k81y5zgj9lnjqparx6mb', 'ZGFjZTM4MGExYmMxZDcxMWUxZjU0NTNiODRmZGVjODFkNzNhYWM3Yzp7InVpZCI6MywidXNlcl9uYW1lIjoicm9vdDEyMyIsInBhc3N3b3JkIjoiYWRtaW4iLCJ1c2VyX2hlYWRfaW1nIjoic3RhdGljL2ltYWdlcy91c2VyX2hlYWQvbGlodWkxMTEtMTU5NTkxNDEzMy4zMjI1MjUzLmpwZyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJhZG1pbmlzdGVyX2lkIjoxfQ==', '2020-08-11 09:59:14.125266');
INSERT INTO `django_session` VALUES ('3zysn08gceyid26gvcehzwybllic3et6', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 10:09:33.368800');
INSERT INTO `django_session` VALUES ('gsemgpopwsjhsmgk2usth0pcue0mlu6l', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 10:21:15.923962');
INSERT INTO `django_session` VALUES ('vbkdhkr6ctzp41bjh5sbcz1x31ppt7ic', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 10:34:51.049065');
INSERT INTO `django_session` VALUES ('cvu5f3aufn9dhtbu77t6nfsyj9ith8y2', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 10:44:59.597410');
INSERT INTO `django_session` VALUES ('4s41wmxu6hgtm47qa7hhpdi7fmv9g2mk', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 10:55:37.910906');
INSERT INTO `django_session` VALUES ('74r52uktatn4gezpkekosrfd4t9yn8o4', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 11:06:48.415870');
INSERT INTO `django_session` VALUES ('rq7qvm7qouykuapznfi5b8v7yrqvbevw', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 11:17:10.100891');
INSERT INTO `django_session` VALUES ('emcj5znizh64fuz3tggrh68wodygdajt', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 11:29:12.205126');
INSERT INTO `django_session` VALUES ('cxm4uv1gagxcg16d3xsnhc9ib130y4z2', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 11:40:26.375033');
INSERT INTO `django_session` VALUES ('k7hkkizfwazcbadpoodny1k3hqvk4qoe', 'NzRiMmE4MTk4YWUzMmZjYWY5NTAwOTRlNjNjZGIyMGY1ZGIyYzY0OTp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6IjEyM3F3ZSIsInVzZXJfaGVhZF9pbWciOiJzdGF0aWMvaW1hZ2VzL3VzZXJfaGVhZC9saWh1aTExMS0xNTk1OTE0MTMzLjMyMjUyNTMuanBnIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9', '2020-08-11 13:39:16.044397');
INSERT INTO `django_session` VALUES ('br4ab4sof16315l8m10iw96o9ooi0ny1', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 01:55:53.992821');
INSERT INTO `django_session` VALUES ('pfcxf85tdb5la17o7ct94yh89vqycvef', 'NGUxZjc5MDdlZjA1YmE0MGQ4Y2M5Y2E0NjM0YmQ1Mzg0NDJlNmRkNjp7InVpZCI6OSwidXNlcl9uYW1lIjoibGlodWkiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpLTE1OTcxOTYwMzMuMjA3NTI3NC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 01:45:41.889324');
INSERT INTO `django_session` VALUES ('awn3cwoj8kslp0bowrzo9kde5gcpkhwa', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 02:08:55.580136');
INSERT INTO `django_session` VALUES ('s6y6w0ytgjotsd5jb14xf4v14yqjcw9a', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 02:26:17.277160');
INSERT INTO `django_session` VALUES ('g5u6muqp6rxqll5w8qqt36zwunj8wzq7', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 03:38:27.288757');
INSERT INTO `django_session` VALUES ('h1468d65jhdl9nyyfv85lu9fgmo0pgj4', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 04:19:47.910384');
INSERT INTO `django_session` VALUES ('j2i6kcjkevpv46mus3p159n2u2vsf0d4', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 12:40:19.383019');
INSERT INTO `django_session` VALUES ('1jvr9xzrcyn3w02gfxx0os4sdvynmye3', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 13:00:44.016934');
INSERT INTO `django_session` VALUES ('g79zfp8agfgn4furrmqhpokdp4q6a9ig', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 13:11:28.834451');
INSERT INTO `django_session` VALUES ('e3e7p096vtnqx0cub6fglgr6fnifixzz', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-12 13:28:56.076260');
INSERT INTO `django_session` VALUES ('dmmfdtl0in3uo2b3xt1txd9hcoaass5m', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 03:39:11.958858');
INSERT INTO `django_session` VALUES ('uljqqarn796lfaiudz1nju0yxznmyd62', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 06:33:41.861769');
INSERT INTO `django_session` VALUES ('t76nard9luhnpd2lt5dawrcfr2ngq798', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 06:45:59.865700');
INSERT INTO `django_session` VALUES ('ud6jtelpie6g3sxiw8z6okwepkam7eaq', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 06:57:17.661578');
INSERT INTO `django_session` VALUES ('9vrch2fi012yfrkemxdckpsz9v12cxml', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 07:41:54.944527');
INSERT INTO `django_session` VALUES ('tmevjy2rxgc7e3c120fhqi3gob51k7l4', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 07:27:36.918941');
INSERT INTO `django_session` VALUES ('fb0f6d4t62m0xahpwdz07nwwmenv3t94', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 08:05:16.964816');
INSERT INTO `django_session` VALUES ('mechkq7g49y40qqm8znukfpd650ok8yq', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 08:15:21.266610');
INSERT INTO `django_session` VALUES ('ytat7c2va9o1t1e3p2qnjxo1jm76b2xv', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 14:24:06.798727');
INSERT INTO `django_session` VALUES ('thfk5h49gu8z0rudasjsixtiuv38d5ob', 'MTU5YzA5MThjMmYwMGU5OGE0YTUyYzNiNWVjYzk3OTJiODQ4YmMzMDp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTU5MTQxMzMuMzIyNTI1My5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 14:40:18.519636');
INSERT INTO `django_session` VALUES ('xhfrux96anyk7td8wvjy4hde4ywcdwog', 'NjdlYjJjMjk2OTk0NmZiMzkxODcxZWFkMDkyNjdhMTE4YzAxMDYxYjp7InVpZCI6MywidXNlcl9uYW1lIjoibGlodWkxMTEiLCJwYXNzd29yZCI6ImxpaHVpMTExIiwidXNlcl9oZWFkX2ltZyI6InN0YXRpYy9pbWFnZXMvdXNlcl9oZWFkL2xpaHVpMTExLTE1OTczMzA3MTQuOTEyMjA3OC5qcGciLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2020-08-13 15:11:47.008398');

-- ----------------------------
-- Table structure for predict_result
-- ----------------------------
DROP TABLE IF EXISTS `predict_result`;
CREATE TABLE `predict_result`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `uid` int(255) NOT NULL,
  `duration` int(255) NOT NULL,
  `protocol_type` int(255) NOT NULL,
  `flag` int(255) NOT NULL,
  `wrong_fragment` int(255) NOT NULL,
  `urgent` int(255) NOT NULL,
  `hot` int(255) NOT NULL,
  `num_failed_logins` int(255) NOT NULL,
  `logged_in` int(255) NOT NULL,
  `num_root` int(255) NOT NULL,
  `root_shell` int(255) NOT NULL,
  `is_guest_login` int(255) NOT NULL,
  `count` int(255) NOT NULL,
  `srv_count` int(255) NOT NULL,
  `diff_srv_rate` float(255, 0) NOT NULL,
  `srv_diff_host_rate` float(255, 0) NOT NULL,
  `dst_host_count` int(255) NOT NULL,
  `dst_host_srv_count` int(255) NOT NULL,
  `dst_host_same_srv_rate` float(255, 0) NOT NULL,
  `dst_host_diff_srv_rate` float(255, 0) NOT NULL,
  `date_time` datetime(0) NOT NULL,
  `result` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of predict_result
-- ----------------------------
INSERT INTO `predict_result` VALUES (9, 3, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, '2020-08-11 10:32:00', 1);
INSERT INTO `predict_result` VALUES (11, 3, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, '2020-08-11 11:00:29', 1);
INSERT INTO `predict_result` VALUES (12, 3, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, '2020-08-12 12:50:20', 1);
INSERT INTO `predict_result` VALUES (13, 3, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, '2020-08-12 12:50:36', 1);
INSERT INTO `predict_result` VALUES (14, 3, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, '2020-08-12 13:20:54', 1);
INSERT INTO `predict_result` VALUES (15, 3, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, '2020-08-13 14:58:13', 1);

-- ----------------------------
-- Table structure for trace_result
-- ----------------------------
DROP TABLE IF EXISTS `trace_result`;
CREATE TABLE `trace_result`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `uid` int(255) NOT NULL,
  `duration` int(255) NOT NULL,
  `flag` int(255) NOT NULL,
  `wrong_fragment` int(255) NOT NULL,
  `urgent` int(255) NOT NULL,
  `hot` int(255) NOT NULL,
  `num_failed_logins` int(255) NULL DEFAULT NULL,
  `num_root` int(255) NOT NULL,
  `is_guest_login` int(255) NOT NULL,
  `count` int(255) NOT NULL,
  `srv_count` int(255) NOT NULL,
  `diff_srv_rate` float(255, 0) NOT NULL,
  `srv_diff_host_rate` float(255, 0) NOT NULL,
  `dst_host_count` int(255) NOT NULL,
  `dst_host_srv_count` int(255) NOT NULL,
  `dst_host_same_srv_rate` float(255, 0) NOT NULL,
  `dst_host_diff_srv_rate` float(255, 0) NOT NULL,
  `date_time` datetime(0) NOT NULL,
  `protocol_type_result` int(255) NOT NULL,
  `logged_in_result` int(255) NOT NULL,
  `root_shell_result` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trace_result
-- ----------------------------
INSERT INTO `trace_result` VALUES (2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, '2020-08-12 13:26:11', 0, 2, 0);
INSERT INTO `trace_result` VALUES (5, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, '2020-08-13 14:57:37', 0, 2, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` int(255) NOT NULL,
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (4, 'aaa111', '123qwe', '12@qqq.com', 1598261, 'static/images/user_head/aaa111-1595993356.2444787.jpg', '2020-07-29 03:29:16');
INSERT INTO `users` VALUES (2, 'lihui1', '123qwe', '1@qq.com', 0, '', NULL);
INSERT INTO `users` VALUES (3, 'lihui111', 'lihui111', 'lh15982611468@163.com', 1, 'static/images/user_head/lihui111-1597330714.9122078.jpg', '2020-07-28 02:25:45');
INSERT INTO `users` VALUES (5, 'bbb111', '123qwe', '1@qq.com', 34455, 'static/images/user_head/bbb111-1595993376.3555853.jpg', '2020-07-29 03:29:36');
INSERT INTO `users` VALUES (6, 'cccc111', '123qwe', '1@qq.ocm', 1234, 'static/images/user_head/cccc111-1595993405.0989385.jpg', '2020-07-29 03:30:05');
INSERT INTO `users` VALUES (7, 'gggg111', '123qwe', '1@qq.com', 124, 'static/images/user_head/gggg111-1595993432.9310653.jpg', '2020-07-29 03:30:32');
INSERT INTO `users` VALUES (8, 'wsh123', 'wsh123', '1437815722@qq.com', 11, 'static/images/user_head/wsh123-1597159083.2916377.jpg', '2020-08-11 15:18:03');
INSERT INTO `users` VALUES (9, 'lihui', 'lihui111', '1259905312@qq.com', 11, 'static/images/user_head/lihui-1597196033.2075274.jpg', '2020-08-12 01:33:53');

SET FOREIGN_KEY_CHECKS = 1;
