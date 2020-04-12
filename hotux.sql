/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : hotux

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 09/04/2020 22:38:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL,
  `cate_sort` int(11) NOT NULL DEFAULT '1',
  `cate_desc` varchar(100) DEFAULT NULL,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, '单间', 1, '', 0, NULL, '2020-04-05 12:42:23', NULL, '2020-04-06 22:12:56');
INSERT INTO `category` VALUES (2, '大床房', 1, NULL, 0, NULL, '2020-04-05 12:42:39', NULL, '2020-04-05 12:42:39');
INSERT INTO `category` VALUES (3, '双人间', 1, NULL, 0, NULL, '2020-04-05 12:42:55', NULL, '2020-04-05 12:42:55');
INSERT INTO `category` VALUES (4, '三人间', 1, NULL, 0, NULL, '2020-04-05 12:43:01', NULL, '2020-04-05 12:43:01');
INSERT INTO `category` VALUES (5, '套房', 1, NULL, 0, NULL, '2020-04-05 12:43:04', NULL, '2020-04-05 12:43:04');
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) NOT NULL DEFAULT 'admin',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT 'admin',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort` double(11,0) DEFAULT '1',
  `target` varchar(20) DEFAULT '_self',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, '首页', '/admin', 'menu', 0, 'fa fa-dashboard', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-16 12:42:25', 1, '_self');
INSERT INTO `permission` VALUES (6, '获得侧边栏菜单', '/admin/currentMenus', 'button', 1, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:45:28', 6, '_self');
INSERT INTO `permission` VALUES (70, '客户管理', '/admin/user/customer', 'menu', 0, 'fa fa-users', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-04-08 01:14:49', 80, '_self');
INSERT INTO `permission` VALUES (72, '添加用户', '/admin/user/new', 'menu', 70, 'fa fa-circle-o', 1, 'admin', '2019-10-15 20:22:36', 'admin', '2020-04-07 00:09:37', 72, '_self');
INSERT INTO `permission` VALUES (73, '用户保存', '/admin/user/save', 'button', 70, NULL, 0, 'admin', '2019-10-15 20:22:36', 'admin', '2019-10-15 20:30:55', 73, '_self');
INSERT INTO `permission` VALUES (74, '删除用户', '/admin/user/delete', 'button', 70, NULL, 0, 'admin', '2019-10-15 20:22:36', 'admin', '2019-10-15 20:30:55', 74, '_self');
INSERT INTO `permission` VALUES (75, '批量删除用户', '/admin/user/batchDelete', 'button', 70, NULL, 0, 'admin', '2019-10-15 20:22:36', 'admin', '2019-10-15 20:30:55', 75, '_self');
INSERT INTO `permission` VALUES (76, '编辑用户', '/admin/user/edit', 'button', 70, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-16 13:27:24', 76, '_self');
INSERT INTO `permission` VALUES (82, '保存个人信息', '/admin/user/profile/save', 'button', 120, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:43:51', 82, '_self');
INSERT INTO `permission` VALUES (83, '修改密码', '/admin/user/changePass', 'button', 120, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:43:41', 83, '_self');
INSERT INTO `permission` VALUES (91, '角色管理', '/admin/role', 'menu', 0, 'fa fa-snowflake-o', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-16 12:52:05', 91, '_self');
INSERT INTO `permission` VALUES (92, '保存角色', '/admin/role/save', 'button', 91, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:55:53', 92, '_self');
INSERT INTO `permission` VALUES (93, '编辑角色', '/admin/role/edit', 'page', 91, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:58:40', 93, '_self');
INSERT INTO `permission` VALUES (94, '删除角色', '/admin/role/delete', 'button', 91, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:55:47', 94, '_self');
INSERT INTO `permission` VALUES (95, '权限管理', '/admin/permission', 'menu', 0, 'fa fa-podcast', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-03-12 15:08:17', 95, '_self');
INSERT INTO `permission` VALUES (96, '保存权限', '/admin/permission/save', 'button', 95, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:55:45', 96, '_self');
INSERT INTO `permission` VALUES (97, '编辑权限', '/admin/permission/edit', 'page', 95, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:57:13', 97, '_self');
INSERT INTO `permission` VALUES (98, '删除权限', '/admin/permission/delete', 'button', 95, '', 0, 'admin', '2019-10-15 20:22:36', 'admin', '2020-02-07 23:55:43', 98, '_self');
INSERT INTO `permission` VALUES (106, '获得当前登录用户信息接口', '/admin/currentUser', 'button', 1, '', 0, 'admin', '2020-02-04 10:26:13', 'admin', '2020-02-07 23:37:08', 1, '_self');
INSERT INTO `permission` VALUES (110, '添加权限', '/admin/permission/new', 'menu', 95, 'fa fa-circle-o', 0, 'admin', '2020-02-07 23:14:11', 'admin', '2020-02-16 12:55:01', 1, '_self');
INSERT INTO `permission` VALUES (111, '添加角色', '/admin/role/new', 'menu', 91, 'fa fa-circle-o', 0, 'admin', '2020-02-07 23:19:05', 'admin', '2020-02-16 12:54:51', 1, '_self');
INSERT INTO `permission` VALUES (120, '个人信息', '/admin/user/profile', 'page', 0, '', 0, 'admin', '2020-02-07 23:38:51', 'admin', '2020-02-08 00:02:34', 99, '_self');
INSERT INTO `permission` VALUES (126, '客户列表', '/admin/user/customer', 'menu', 70, 'fa fa-circle-o', 1, 'admin', '2020-02-08 19:20:23', 'admin', '2020-04-08 01:20:27', 0, '_self');
INSERT INTO `permission` VALUES (127, '角色列表', '/admin/role', 'menu', 91, 'fa fa-circle-o', 0, 'admin', '2020-02-08 19:20:54', 'admin', '2020-02-16 12:54:47', 0, '_self');
INSERT INTO `permission` VALUES (128, '权限列表', '/admin/permission', 'menu', 95, 'fa fa-circle-o', 0, 'admin', '2020-02-08 19:21:16', 'admin', '2020-02-16 12:54:57', 0, '_self');
INSERT INTO `permission` VALUES (131, '客房管理', '/admin/post', 'menu', 0, 'fa fa-paint-brush', 0, 'admin', '2020-03-07 19:37:26', 'admin', '2020-04-06 16:32:16', 5, '_self');
INSERT INTO `permission` VALUES (132, '新增客房', '/admin/post/new', 'menu', 131, 'fa fa-circle-o', 0, 'admin', '2020-03-07 19:39:34', 'admin', '2020-04-06 16:32:39', 9, '_self');
INSERT INTO `permission` VALUES (133, '客房列表', '/admin/post', 'menu', 131, 'fa fa-circle-o', 0, 'admin', '2020-03-07 19:40:00', 'admin', '2020-04-06 16:32:28', 8, '_self');
INSERT INTO `permission` VALUES (134, '评论管理', '/admin/comment', 'menu', 0, 'fa fa-comment', 1, 'admin', '2020-03-07 19:46:32', 'admin', '2020-04-06 22:17:51', 11, '_self');
INSERT INTO `permission` VALUES (135, '回复我的', '/admin/comment/receive', 'menu', 134, 'fa fa-circle-o', 1, 'admin', '2020-03-07 19:57:53', 'admin', '2020-04-06 22:17:22', 20, '_self');
INSERT INTO `permission` VALUES (136, '我的评论', '/admin/comment/send', 'menu', 134, 'fa fa-circle-o', 1, 'admin', '2020-03-07 19:58:54', 'admin', '2020-04-06 22:17:26', 2, '_self');
INSERT INTO `permission` VALUES (137, '客房类型管理', '/admin/category', 'menu', 0, 'fa fa-book', 0, 'admin', '2020-03-07 20:00:57', 'admin', '2020-04-07 00:19:44', 6, '_self');
INSERT INTO `permission` VALUES (138, '类型列表', '/admin/category', 'menu', 137, 'fa fa-circle-o', 0, 'admin', '2020-03-07 20:01:36', 'admin', '2020-04-06 22:23:23', 1, '_self');
INSERT INTO `permission` VALUES (139, '新建类型', '/admin/category/new', 'menu', 137, 'fa fa-circle-o', 1, 'admin', '2020-03-07 20:02:14', 'admin', '2020-04-08 01:10:59', 1, '_self');
INSERT INTO `permission` VALUES (140, '删除客房', '/admin/post/delete', 'button', 133, '', 0, 'admin', '2020-03-08 15:02:20', 'admin', '2020-04-06 16:32:49', 1, '_self');
INSERT INTO `permission` VALUES (141, '批量删除客房', '/admin/post/batchDelete', 'button', 133, '', 0, 'admin', '2020-03-08 15:03:02', 'admin', '2020-04-06 16:32:58', 1, '_self');
INSERT INTO `permission` VALUES (142, '编辑客房信息', '/admin/post/edit', 'page', 133, '', 0, 'admin', '2020-03-08 15:03:49', 'admin', '2020-04-06 16:33:09', 1, '_self');
INSERT INTO `permission` VALUES (143, '保存客房', '/admin/post/save', 'button', 132, '', 0, 'admin', '2020-03-08 15:04:42', 'admin', '2020-04-07 00:21:39', 1, '_self');
INSERT INTO `permission` VALUES (144, '还原客房', '/admin/post/revert', 'button', 133, '', 0, 'admin', '2020-03-08 15:05:23', 'admin', '2020-04-07 00:21:25', 1, '_self');
INSERT INTO `permission` VALUES (145, '移到回收站', '/admin/post/throw', 'button', 133, '', 0, 'admin', '2020-03-08 15:07:01', 'admin', '2020-03-08 15:07:01', 1, '_self');
INSERT INTO `permission` VALUES (146, '文件上传', '/admin/file/upload', 'button', 132, '', 0, 'admin', '2020-03-08 17:53:01', 'admin', '2020-03-08 17:53:01', 1, '_self');
INSERT INTO `permission` VALUES (147, '保存类型', '/admin/category/save', 'button', 138, '', 0, 'admin', '2020-03-08 18:51:48', 'admin', '2020-04-08 01:10:35', 1, '_self');
INSERT INTO `permission` VALUES (148, '编辑类型', '/admin/category/edit', 'button', 138, '', 0, 'admin', '2020-03-08 18:52:27', 'admin', '2020-04-08 01:11:21', 1, '_self');
INSERT INTO `permission` VALUES (149, '删除类型', '/admin/category/delete', 'button', 138, '', 0, 'admin', '2020-03-08 18:54:13', 'admin', '2020-04-08 01:11:14', 1, '_self');
INSERT INTO `permission` VALUES (150, '订单管理', '/admin/order', 'menu', 0, 'fa fa-tag', 0, 'admin', '2020-03-08 19:19:59', 'admin', '2020-04-06 22:18:14', 8, '_self');
INSERT INTO `permission` VALUES (151, '订单列表', '/admin/order', 'menu', 150, '', 1, 'admin', '2020-03-08 19:30:16', 'admin', '2020-04-08 01:21:56', 1, '_self');
INSERT INTO `permission` VALUES (152, '删除订单', '/admin/order/delete', 'button', 150, '', 0, 'admin', '2020-03-08 19:32:56', 'admin', '2020-04-08 01:21:33', 1, '_self');
INSERT INTO `permission` VALUES (153, '所有评论', '/admin/comment', 'menu', 134, 'fa fa-circle-o', 1, 'admin', '2020-03-08 19:34:13', 'admin', '2020-04-06 22:17:48', 1, '_self');
INSERT INTO `permission` VALUES (154, '添加标签', '/admin/tag/new', 'menu', 150, '', 1, 'admin', '2020-03-08 19:42:31', 'admin', '2020-04-06 22:20:23', 1, '_self');
INSERT INTO `permission` VALUES (155, '完结订单', '/admin/order/finish', 'button', 150, '', 0, 'admin', '2020-03-08 19:43:06', 'admin', '2020-04-08 01:21:42', 1, '_self');
INSERT INTO `permission` VALUES (156, '保存标签', '/admin/tag/save', 'button', 154, '', 1, 'admin', '2020-03-08 19:44:45', 'admin', '2020-04-06 22:20:19', 1, '_self');
INSERT INTO `permission` VALUES (157, '删除评论', '/admin/comment/delete', 'button', 153, '', 1, 'admin', '2020-03-08 22:13:57', 'admin', '2020-04-06 22:17:43', 1, '_self');
INSERT INTO `permission` VALUES (158, '批量删除评论', '/admin/comment/batchDelete', 'button', 153, '', 1, 'admin', '2020-03-08 22:15:57', 'admin', '2020-04-06 22:17:36', 1, '_self');
INSERT INTO `permission` VALUES (159, '后台回复评论', '/admin/comment/reply', 'button', 153, '', 1, 'admin', '2020-03-08 22:27:39', 'admin', '2020-04-06 22:17:31', 1, '_self');
INSERT INTO `permission` VALUES (160, '置顶文章', '/admin/post/stick', 'button', 133, '', 1, 'admin', '2020-04-03 22:54:45', 'admin', '2020-04-07 00:21:45', 1, '_self');
INSERT INTO `permission` VALUES (161, '取消置顶文章', '/admin/post/unStick', 'button', 133, '', 1, 'admin', '2020-04-03 22:55:22', 'admin', '2020-04-07 00:19:59', 1, '_self');
INSERT INTO `permission` VALUES (162, '推荐文章', '/admin/post/recommend', 'button', 133, '', 1, 'admin', '2020-04-03 22:55:49', 'admin', '2020-04-07 00:21:51', 1, '_self');
INSERT INTO `permission` VALUES (163, '取消置顶文章', '/admin/post/unRecommend', 'button', 133, '', 1, 'admin', '2020-04-03 22:56:16', 'admin', '2020-04-07 00:19:54', 1, '_self');
INSERT INTO `permission` VALUES (164, '工作人员管理', '/admin/user/worker', 'menu', 0, 'fa fa-user', 0, 'admin', '2020-04-07 00:01:50', 'admin', '2020-04-08 01:14:21', 85, '_self');
INSERT INTO `permission` VALUES (165, '工作人员列表', '/admin/user/worker', 'menu', 164, 'fa fa-circle-o', 1, 'admin', '2020-04-07 00:09:20', 'admin', '2020-04-08 01:21:06', 1, '_self');
INSERT INTO `permission` VALUES (166, '新增工作人员', '/admin/user/new', 'menu', 164, 'fa fa-circle-o', 1, 'admin', '2020-04-07 00:10:01', 'admin', '2020-04-08 01:20:45', 1, '_self');
INSERT INTO `permission` VALUES (167, '财务管理', '/admin/order/finance', 'menu', 0, 'fa fa-money', 0, 'admin', '2020-04-07 00:12:17', 'admin', '2020-04-08 00:26:36', 88, '_self');
INSERT INTO `permission` VALUES (168, '关闭订单', '/admin/order/close', 'button', 150, '', 0, 'admin', '2020-04-07 23:01:44', 'admin', '2020-04-08 01:21:27', 1, '_self');
INSERT INTO `permission` VALUES (169, '获得当前登录用户角色接口', '/admin/currentRole', 'button', 1, '', 0, 'admin', '2020-04-07 23:02:23', 'admin', '2020-04-07 23:02:23', 1, '_self');
COMMIT;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) NOT NULL,
  `post_content` longtext NOT NULL,
  `post_status` int(11) NOT NULL,
  `post_summary` varchar(2000) NOT NULL,
  `post_thumbnail` varchar(255) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `price` int(10) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT 'admin',
  `update_by` varchar(255) DEFAULT 'admin',
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `number` varchar(100) NOT NULL,
  `img_url` varchar(1000) NOT NULL,
  `post_editor` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of post
-- ----------------------------
BEGIN;
INSERT INTO `post` VALUES (1, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list1.jpg', '美式风格商务间', 400, '2020-03-12 18:10:56', '2020-04-06 23:41:41', 'admin', 'admin', 0, 'N201', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (2, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list2.jpg', '意大利风格标准间', 300, '2020-03-12 18:12:21', '2020-04-06 23:44:00', 'admin', 'admin', 0, 'N202', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (3, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list3.jpg', '总统套房', 900, '2020-03-12 18:13:52', '2020-04-06 23:44:01', 'admin', 'admin', 0, 'N203', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (4, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list4.jpg', '法国风格大床房', 399, '2020-03-12 18:15:41', '2020-04-06 23:44:01', 'admin', 'admin', 0, 'N204', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (5, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list5.jpg', '豪华套房', 700, '2020-03-12 18:17:24', '2020-04-06 23:44:01', 'admin', 'admin', 0, 'N205', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (6, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list6.jpg', '标准三人间', 300, '2020-03-12 18:20:02', '2020-04-06 23:44:07', 'admin', 'admin', 0, 'N206', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (7, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list7.jpg', '商务标准间', 400, '2020-03-12 18:20:51', '2020-04-06 23:45:12', 'admin', 'admin', 0, 'S201', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (8, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list8.jpg', '贵族大床房', 300, '2020-03-12 18:21:57', '2020-04-06 23:44:08', 'admin', 'admin', 0, 'S202', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (9, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list9.jpg', '情侣大床房', 200, '2020-03-12 18:23:16', '2020-04-06 23:44:08', 'admin', 'admin', 0, 'S203', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (10, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list9.jpg', '经济单人间', 120, '2020-03-12 18:24:02', '2020-04-06 23:42:05', 'admin', 'admin', 0, 'S204', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (11, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibus a, interdum eu nibh.', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci nulla, fermentum in faucibu', '/static/front/images/room-list/list2.jpg', '海天大床房', 200, '2020-03-30 18:25:04', '2020-04-06 23:44:09', 'admin', 'admin', 0, 'S205', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (12, 5, '前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒前所未有的舒适，适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适。', 0, '前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有的舒适，前所未有', '/upload/2020/4/news9.jpg', '枫丹白露套房', 788, '2020-04-06 17:44:00', '2020-04-06 23:41:54', 'admin', 'admin', 0, '301', '/static/front/images/detail-slider/slider1.jpg,/static/front/images/detail-slider/slider2.jpg,/static/front/images/detail-slider/slider3.jpg,/static/front/images/detail-slider/slider4.jpg,/static/front/images/detail-slider/slider5.jpg,/static/front/images/detail-slider/slider6.jpg,/static/front/images/detail-slider/slider7.jpg,/static/front/images/detail-slider/slider8.jpg,/static/front/images/detail-slider/slider9.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (13, 1, '贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房', 0, '贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房贵族大床房', '/upload/2020/4/news3.jpg', '贵族大床房', 300, '2020-04-06 21:38:56', '2020-04-06 22:10:32', 'admin', 'admin', 0, 'S209', '/upload/2020/4/room2.jpg,/upload/2020/4/room4.jpg', '<p><img src=\"/static/front/images/detail-slider/slider1.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider2.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider3.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider4.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider5.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider6.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider7.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>\n<p><img src=\"/static/front/images/detail-slider/slider9.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
INSERT INTO `post` VALUES (14, 2, '', 1, '', '/upload/2020/4/news5.jpg', '贵族大床房', 299, '2020-04-06 21:52:00', '2020-04-06 23:25:55', 'admin', 'admin', 0, 'S302', '/upload/2020/4/news10.jpg,/upload/2020/4/news8.jpg', '<p><img src=\"/upload/2020/4/news10.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p><p><img src=\"/upload/2020/4/news8.jpg\" style=\"width: 100px;\" class=\"fr-fic fr-dib\"></p>');
COMMIT;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `record_date` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT 'admin',
  `update_by` varchar(255) DEFAULT 'admin',
  `del_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of record
-- ----------------------------
BEGIN;
INSERT INTO `record` VALUES (1, 18, 11, '2020-04-06', '2020-04-06 15:36:05', '2020-04-06 15:36:05', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (2, 18, 9, '2020-04-06', '2020-04-06 15:38:20', '2020-04-06 15:38:20', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (3, 18, 10, '2020-04-06', '2020-04-06 16:08:38', '2020-04-06 16:08:38', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (4, 18, 8, '2020-04-06', '2020-04-06 16:10:53', '2020-04-06 16:10:53', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (5, 18, 7, '2020-04-06', '2020-04-06 16:11:35', '2020-04-06 16:11:35', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (6, 18, 5, '2020-04-06', '2020-04-06 16:28:31', '2020-04-06 16:28:31', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (7, 19, 13, '2020-04-07', '2020-04-07 22:41:32', '2020-04-07 22:41:32', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (8, 18, 11, '2020-04-07', '2020-04-07 23:24:45', '2020-04-07 23:41:20', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (9, 18, 10, '2020-04-07', '2020-04-07 23:28:39', '2020-04-07 23:41:09', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (10, 18, 12, '2020-04-07', '2020-04-07 23:32:44', '2020-04-07 23:37:13', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (11, 18, 3, '2020-04-07', '2020-04-07 23:33:01', '2020-04-07 23:36:57', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (12, 18, 6, '2020-04-07', '2020-04-07 23:33:18', '2020-04-07 23:36:07', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (13, 18, 8, '2020-04-07', '2020-04-07 23:33:36', '2020-04-07 23:40:37', 'admin', 'admin', 1);
INSERT INTO `record` VALUES (14, 20, 13, '2020-04-09', '2020-04-08 00:45:09', '2020-04-08 00:45:09', 'admin', 'admin', 0);
INSERT INTO `record` VALUES (15, 19, 7, '2020-04-08', '2020-04-08 01:04:01', '2020-04-08 01:04:01', 'admin', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` int(1) NOT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_register_default` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'admin', '管理员', 10, 0, NULL, '2020-02-05 18:54:23', NULL, '2020-03-08 13:31:39', 0);
INSERT INTO `role` VALUES (2, 'customer', '客户', 1, 0, NULL, '2020-02-05 18:54:29', NULL, '2020-04-06 23:54:28', 1);
INSERT INTO `role` VALUES (3, 'worker', '工作人员', 5, 0, NULL, '2020-04-06 23:51:27', NULL, '2020-04-06 23:51:27', 0);
COMMIT;

-- ----------------------------
-- Table structure for role_permission_ref
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_ref`;
CREATE TABLE `role_permission_ref` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2071 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_permission_ref
-- ----------------------------
BEGIN;
INSERT INTO `role_permission_ref` VALUES (4, 1, 0, NULL, '2019-10-15 21:15:32', NULL, '2019-10-15 21:15:32', 421);
INSERT INTO `role_permission_ref` VALUES (4, 6, 0, NULL, '2019-10-15 21:15:32', NULL, '2019-10-15 21:15:32', 422);
INSERT INTO `role_permission_ref` VALUES (4, 70, 0, NULL, '2019-10-15 21:15:32', NULL, '2019-10-15 21:15:32', 429);
INSERT INTO `role_permission_ref` VALUES (4, 82, 0, NULL, '2019-10-15 21:15:32', NULL, '2019-10-15 21:15:32', 432);
INSERT INTO `role_permission_ref` VALUES (4, 83, 0, NULL, '2019-10-15 21:15:32', NULL, '2019-10-15 21:15:32', 433);
INSERT INTO `role_permission_ref` VALUES (5, 1, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 565);
INSERT INTO `role_permission_ref` VALUES (5, 6, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 569);
INSERT INTO `role_permission_ref` VALUES (5, 70, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 618);
INSERT INTO `role_permission_ref` VALUES (5, 76, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 621);
INSERT INTO `role_permission_ref` VALUES (5, 91, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 626);
INSERT INTO `role_permission_ref` VALUES (5, 93, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 627);
INSERT INTO `role_permission_ref` VALUES (5, 95, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 628);
INSERT INTO `role_permission_ref` VALUES (5, 97, 0, NULL, '2019-10-15 22:53:09', NULL, '2019-10-15 22:53:09', 629);
INSERT INTO `role_permission_ref` VALUES (14, 1, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 861);
INSERT INTO `role_permission_ref` VALUES (14, 6, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 865);
INSERT INTO `role_permission_ref` VALUES (14, 106, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 867);
INSERT INTO `role_permission_ref` VALUES (14, 70, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 878);
INSERT INTO `role_permission_ref` VALUES (14, 73, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 881);
INSERT INTO `role_permission_ref` VALUES (14, 74, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 882);
INSERT INTO `role_permission_ref` VALUES (14, 75, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 883);
INSERT INTO `role_permission_ref` VALUES (14, 76, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 884);
INSERT INTO `role_permission_ref` VALUES (14, 82, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 890);
INSERT INTO `role_permission_ref` VALUES (14, 83, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 891);
INSERT INTO `role_permission_ref` VALUES (14, 91, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 895);
INSERT INTO `role_permission_ref` VALUES (14, 92, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 896);
INSERT INTO `role_permission_ref` VALUES (14, 93, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 897);
INSERT INTO `role_permission_ref` VALUES (14, 94, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 898);
INSERT INTO `role_permission_ref` VALUES (14, 95, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 899);
INSERT INTO `role_permission_ref` VALUES (14, 96, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 900);
INSERT INTO `role_permission_ref` VALUES (14, 97, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 901);
INSERT INTO `role_permission_ref` VALUES (14, 98, 0, NULL, '2020-02-06 11:38:27', NULL, '2020-02-06 11:38:27', 902);
INSERT INTO `role_permission_ref` VALUES (15, 1, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 903);
INSERT INTO `role_permission_ref` VALUES (15, 6, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 907);
INSERT INTO `role_permission_ref` VALUES (15, 106, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 909);
INSERT INTO `role_permission_ref` VALUES (15, 70, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 920);
INSERT INTO `role_permission_ref` VALUES (15, 73, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 923);
INSERT INTO `role_permission_ref` VALUES (15, 74, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 924);
INSERT INTO `role_permission_ref` VALUES (15, 75, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 925);
INSERT INTO `role_permission_ref` VALUES (15, 76, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 926);
INSERT INTO `role_permission_ref` VALUES (15, 82, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 932);
INSERT INTO `role_permission_ref` VALUES (15, 83, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 933);
INSERT INTO `role_permission_ref` VALUES (15, 91, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 937);
INSERT INTO `role_permission_ref` VALUES (15, 92, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 938);
INSERT INTO `role_permission_ref` VALUES (15, 93, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 939);
INSERT INTO `role_permission_ref` VALUES (15, 94, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 940);
INSERT INTO `role_permission_ref` VALUES (15, 95, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 941);
INSERT INTO `role_permission_ref` VALUES (15, 96, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 942);
INSERT INTO `role_permission_ref` VALUES (15, 97, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 943);
INSERT INTO `role_permission_ref` VALUES (15, 98, 0, NULL, '2020-02-06 11:40:38', NULL, '2020-02-06 11:40:38', 944);
INSERT INTO `role_permission_ref` VALUES (16, 1, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 945);
INSERT INTO `role_permission_ref` VALUES (16, 6, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 949);
INSERT INTO `role_permission_ref` VALUES (16, 106, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 951);
INSERT INTO `role_permission_ref` VALUES (16, 70, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 962);
INSERT INTO `role_permission_ref` VALUES (16, 73, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 965);
INSERT INTO `role_permission_ref` VALUES (16, 74, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 966);
INSERT INTO `role_permission_ref` VALUES (16, 75, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 967);
INSERT INTO `role_permission_ref` VALUES (16, 76, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 968);
INSERT INTO `role_permission_ref` VALUES (16, 82, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 974);
INSERT INTO `role_permission_ref` VALUES (16, 83, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 975);
INSERT INTO `role_permission_ref` VALUES (16, 91, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 979);
INSERT INTO `role_permission_ref` VALUES (16, 92, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 980);
INSERT INTO `role_permission_ref` VALUES (16, 93, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 981);
INSERT INTO `role_permission_ref` VALUES (16, 94, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 982);
INSERT INTO `role_permission_ref` VALUES (16, 95, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 983);
INSERT INTO `role_permission_ref` VALUES (16, 96, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 984);
INSERT INTO `role_permission_ref` VALUES (16, 97, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 985);
INSERT INTO `role_permission_ref` VALUES (16, 98, 0, NULL, '2020-02-06 11:42:26', NULL, '2020-02-06 11:42:26', 986);
INSERT INTO `role_permission_ref` VALUES (13, 1, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1177);
INSERT INTO `role_permission_ref` VALUES (13, 106, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1178);
INSERT INTO `role_permission_ref` VALUES (13, 6, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1179);
INSERT INTO `role_permission_ref` VALUES (13, 70, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1181);
INSERT INTO `role_permission_ref` VALUES (13, 73, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1183);
INSERT INTO `role_permission_ref` VALUES (13, 74, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1184);
INSERT INTO `role_permission_ref` VALUES (13, 75, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1185);
INSERT INTO `role_permission_ref` VALUES (13, 76, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1186);
INSERT INTO `role_permission_ref` VALUES (13, 120, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1187);
INSERT INTO `role_permission_ref` VALUES (13, 82, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1188);
INSERT INTO `role_permission_ref` VALUES (13, 83, 0, NULL, '2020-02-08 14:21:23', NULL, '2020-02-08 14:21:23', 1189);
INSERT INTO `role_permission_ref` VALUES (17, 1, 0, NULL, '2020-02-08 18:47:20', NULL, '2020-02-08 18:47:20', 1230);
INSERT INTO `role_permission_ref` VALUES (18, 1, 0, NULL, '2020-02-08 18:47:41', NULL, '2020-02-08 18:47:41', 1231);
INSERT INTO `role_permission_ref` VALUES (1, 1, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1958);
INSERT INTO `role_permission_ref` VALUES (1, 106, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1959);
INSERT INTO `role_permission_ref` VALUES (1, 169, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1960);
INSERT INTO `role_permission_ref` VALUES (1, 6, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1961);
INSERT INTO `role_permission_ref` VALUES (1, 131, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1962);
INSERT INTO `role_permission_ref` VALUES (1, 133, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1963);
INSERT INTO `role_permission_ref` VALUES (1, 140, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1964);
INSERT INTO `role_permission_ref` VALUES (1, 141, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1965);
INSERT INTO `role_permission_ref` VALUES (1, 142, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1966);
INSERT INTO `role_permission_ref` VALUES (1, 144, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1967);
INSERT INTO `role_permission_ref` VALUES (1, 145, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1968);
INSERT INTO `role_permission_ref` VALUES (1, 132, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1969);
INSERT INTO `role_permission_ref` VALUES (1, 143, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1970);
INSERT INTO `role_permission_ref` VALUES (1, 146, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1971);
INSERT INTO `role_permission_ref` VALUES (1, 137, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1972);
INSERT INTO `role_permission_ref` VALUES (1, 138, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1973);
INSERT INTO `role_permission_ref` VALUES (1, 148, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1974);
INSERT INTO `role_permission_ref` VALUES (1, 149, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1975);
INSERT INTO `role_permission_ref` VALUES (1, 147, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1977);
INSERT INTO `role_permission_ref` VALUES (1, 150, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1978);
INSERT INTO `role_permission_ref` VALUES (1, 152, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1980);
INSERT INTO `role_permission_ref` VALUES (1, 155, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1981);
INSERT INTO `role_permission_ref` VALUES (1, 168, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1982);
INSERT INTO `role_permission_ref` VALUES (1, 70, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1983);
INSERT INTO `role_permission_ref` VALUES (1, 73, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1985);
INSERT INTO `role_permission_ref` VALUES (1, 74, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1986);
INSERT INTO `role_permission_ref` VALUES (1, 75, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1987);
INSERT INTO `role_permission_ref` VALUES (1, 76, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1988);
INSERT INTO `role_permission_ref` VALUES (1, 164, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1989);
INSERT INTO `role_permission_ref` VALUES (1, 167, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1992);
INSERT INTO `role_permission_ref` VALUES (1, 91, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1993);
INSERT INTO `role_permission_ref` VALUES (1, 127, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1994);
INSERT INTO `role_permission_ref` VALUES (1, 111, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1995);
INSERT INTO `role_permission_ref` VALUES (1, 92, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1996);
INSERT INTO `role_permission_ref` VALUES (1, 93, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1997);
INSERT INTO `role_permission_ref` VALUES (1, 94, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1998);
INSERT INTO `role_permission_ref` VALUES (1, 95, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 1999);
INSERT INTO `role_permission_ref` VALUES (1, 128, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 2000);
INSERT INTO `role_permission_ref` VALUES (1, 110, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 2001);
INSERT INTO `role_permission_ref` VALUES (1, 96, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 2002);
INSERT INTO `role_permission_ref` VALUES (1, 97, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 2003);
INSERT INTO `role_permission_ref` VALUES (1, 98, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 2004);
INSERT INTO `role_permission_ref` VALUES (1, 120, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 2005);
INSERT INTO `role_permission_ref` VALUES (1, 82, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 2006);
INSERT INTO `role_permission_ref` VALUES (1, 83, 0, NULL, '2020-04-07 23:02:36', NULL, '2020-04-07 23:02:36', 2007);
INSERT INTO `role_permission_ref` VALUES (2, 1, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2043);
INSERT INTO `role_permission_ref` VALUES (2, 106, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2044);
INSERT INTO `role_permission_ref` VALUES (2, 169, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2045);
INSERT INTO `role_permission_ref` VALUES (2, 6, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2046);
INSERT INTO `role_permission_ref` VALUES (2, 150, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2047);
INSERT INTO `role_permission_ref` VALUES (2, 120, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2049);
INSERT INTO `role_permission_ref` VALUES (2, 82, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2050);
INSERT INTO `role_permission_ref` VALUES (2, 83, 0, NULL, '2020-04-07 23:03:20', NULL, '2020-04-07 23:03:20', 2051);
INSERT INTO `role_permission_ref` VALUES (3, 1, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2052);
INSERT INTO `role_permission_ref` VALUES (3, 106, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2053);
INSERT INTO `role_permission_ref` VALUES (3, 169, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2054);
INSERT INTO `role_permission_ref` VALUES (3, 6, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2055);
INSERT INTO `role_permission_ref` VALUES (3, 150, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2056);
INSERT INTO `role_permission_ref` VALUES (3, 152, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2058);
INSERT INTO `role_permission_ref` VALUES (3, 155, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2059);
INSERT INTO `role_permission_ref` VALUES (3, 168, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2060);
INSERT INTO `role_permission_ref` VALUES (3, 70, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2061);
INSERT INTO `role_permission_ref` VALUES (3, 73, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2063);
INSERT INTO `role_permission_ref` VALUES (3, 74, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2064);
INSERT INTO `role_permission_ref` VALUES (3, 75, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2065);
INSERT INTO `role_permission_ref` VALUES (3, 76, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2066);
INSERT INTO `role_permission_ref` VALUES (3, 167, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2067);
INSERT INTO `role_permission_ref` VALUES (3, 120, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2068);
INSERT INTO `role_permission_ref` VALUES (3, 82, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2069);
INSERT INTO `role_permission_ref` VALUES (3, 83, 0, NULL, '2020-04-08 01:08:01', NULL, '2020-04-08 01:08:01', 2070);
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `status` int(1) NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT 'admin',
  `update_by` varchar(255) DEFAULT 'admin',
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `post_number` varchar(20) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES (1, 18, 11, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 15:36:05', '2020-04-06 15:36:05', 'admin', 'admin', 0, 300, 300, 'S205', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (2, 18, 9, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 15:38:20', '2020-04-06 15:38:20', 'admin', 'admin', 0, 200, 200, 'S203', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (3, 18, 10, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 16:08:38', '2020-04-06 16:08:38', 'admin', 'admin', 0, 400, 400, 'S204', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (4, 18, 8, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 16:10:53', '2020-04-06 16:10:53', 'admin', 'admin', 0, 500, 500, 'S202', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (5, 18, 7, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 16:11:35', '2020-04-06 16:11:35', 'admin', 'admin', 0, 400, 400, 'S201', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (6, 18, 5, '2020-04-06', 1, '周瑜', 1, '123456789012345671', '12312312312', '2020-04-06 16:28:31', '2020-04-06 16:28:31', 'admin', 'admin', 0, 200, 200, 'N205', 'ROYAL SUITE');
INSERT INTO `t_order` VALUES (7, 19, 13, '2020-04-07', 1, '张三', 1, '123123123123123', '33333333333', '2020-04-07 22:41:33', '2020-04-07 22:41:33', 'admin', 'admin', 0, 300, 300, 'S209', '贵族大床房');
INSERT INTO `t_order` VALUES (8, 18, 11, '2020-04-07', 1, '周瑜', 1, '123456789012345671', '22222222222', '2020-04-07 23:24:46', '2020-04-07 23:41:20', 'admin', 'admin', 1, 200, 200, 'S205', '海天大床房');
INSERT INTO `t_order` VALUES (9, 18, 10, '2020-04-07', 1, '周瑜', 3, '123456789012345671', '22222222222', '2020-04-07 23:28:40', '2020-04-07 23:28:40', 'admin', 'admin', 0, 120, 120, 'S204', '经济单人间');
INSERT INTO `t_order` VALUES (10, 18, 12, '2020-04-07', 1, '周瑜', 2, '123456789012345671', '22222222222', '2020-04-07 23:32:45', '2020-04-07 23:40:47', 'admin', 'admin', 1, 788, 788, '301', '枫丹白露套房');
INSERT INTO `t_order` VALUES (11, 18, 3, '2020-04-07', 1, '周瑜', 2, '123456789012345671', '22222222222', '2020-04-07 23:33:02', '2020-04-07 23:40:54', 'admin', 'admin', 1, 900, 900, 'N203', '总统套房');
INSERT INTO `t_order` VALUES (12, 18, 6, '2020-04-07', 1, '周瑜', 2, '123456789012345671', '22222222222', '2020-04-07 23:33:18', '2020-04-07 23:40:41', 'admin', 'admin', 1, 300, 300, 'N206', '标准三人间');
INSERT INTO `t_order` VALUES (13, 18, 8, '2020-04-07', 1, '周瑜', 2, '123456789012345671', '22222222222', '2020-04-07 23:33:37', '2020-04-07 23:40:37', 'admin', 'admin', 1, 300, 300, 'S202', '贵族大床房');
INSERT INTO `t_order` VALUES (14, 20, 13, '2020-04-09', 1, '马云222', 1, '111111111111111199', '12312311111', '2020-04-08 00:45:10', '2020-04-08 01:05:56', 'admin', 'admin', 0, 300, 300, 'S209', '贵族大床房');
INSERT INTO `t_order` VALUES (15, 19, 7, '2020-04-08', 1, '张三', 2, '123123123123123', '33333333333', '2020-04-08 01:04:02', '2020-04-08 01:04:02', 'admin', 'admin', 0, 400, 400, 'S201', '商务标准间');
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL,
  `del_flag` int(1) NOT NULL DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` VALUES (36, '视频', 0, NULL, '2020-03-11 21:47:11', NULL, '2020-03-11 21:47:11');
INSERT INTO `tag` VALUES (37, 'Java', 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56');
INSERT INTO `tag` VALUES (38, '安卓', 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56');
INSERT INTO `tag` VALUES (39, 'Kotlin', 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56');
INSERT INTO `tag` VALUES (40, '谷歌', 0, NULL, '2020-03-12 18:10:56', NULL, '2020-03-12 18:10:56');
INSERT INTO `tag` VALUES (41, 'AI', 0, NULL, '2020-03-12 18:12:20', NULL, '2020-03-12 18:12:20');
INSERT INTO `tag` VALUES (42, '人脸识别', 0, NULL, '2020-03-12 18:12:20', NULL, '2020-03-12 18:12:20');
INSERT INTO `tag` VALUES (43, '人脸搜索', 0, NULL, '2020-03-12 18:12:21', NULL, '2020-03-12 18:12:21');
INSERT INTO `tag` VALUES (44, 'Oracle', 0, NULL, '2020-03-12 18:13:52', NULL, '2020-03-12 18:13:52');
INSERT INTO `tag` VALUES (45, '金融', 0, NULL, '2020-03-12 18:13:52', NULL, '2020-03-12 18:13:52');
INSERT INTO `tag` VALUES (46, '陆金所', 0, NULL, '2020-03-12 18:13:52', NULL, '2020-03-12 18:13:52');
INSERT INTO `tag` VALUES (47, '算法', 0, NULL, '2020-03-12 18:15:41', NULL, '2020-03-12 18:15:41');
INSERT INTO `tag` VALUES (48, 'Python', 0, NULL, '2020-03-12 18:17:24', NULL, '2020-03-12 18:17:24');
INSERT INTO `tag` VALUES (49, '工具', 0, NULL, '2020-03-12 18:17:24', NULL, '2020-03-12 18:17:24');
INSERT INTO `tag` VALUES (50, '大数据', 0, NULL, '2020-03-12 18:20:02', NULL, '2020-03-12 18:20:02');
INSERT INTO `tag` VALUES (51, '高并发', 0, NULL, '2020-03-12 18:20:02', NULL, '2020-03-12 18:20:02');
INSERT INTO `tag` VALUES (52, '后端开发', 0, NULL, '2020-03-12 18:20:51', NULL, '2020-03-12 18:20:51');
INSERT INTO `tag` VALUES (53, '序列化', 0, NULL, '2020-03-12 18:20:51', NULL, '2020-03-12 18:20:51');
INSERT INTO `tag` VALUES (54, '机器学习', 0, NULL, '2020-03-12 18:21:57', NULL, '2020-03-12 18:21:57');
INSERT INTO `tag` VALUES (55, 'TensorFlow', 0, NULL, '2020-03-12 18:21:57', NULL, '2020-03-12 18:21:57');
INSERT INTO `tag` VALUES (56, '腾讯', 0, NULL, '2020-03-12 18:23:16', NULL, '2020-03-12 18:23:16');
INSERT INTO `tag` VALUES (57, '开源', 0, NULL, '2020-03-12 18:23:16', NULL, '2020-03-12 18:23:16');
INSERT INTO `tag` VALUES (58, 'Druid', 0, NULL, '2020-03-12 18:24:02', NULL, '2020-03-12 18:24:02');
INSERT INTO `tag` VALUES (59, '推特', 0, NULL, '2020-03-12 18:24:02', NULL, '2020-03-12 18:24:02');
INSERT INTO `tag` VALUES (60, 'CPU', 0, NULL, '2020-03-12 18:25:04', NULL, '2020-03-12 18:25:04');
INSERT INTO `tag` VALUES (61, 'GPU', 0, NULL, '2020-03-12 18:25:04', NULL, '2020-03-12 18:25:04');
INSERT INTO `tag` VALUES (62, 'Twitter', 0, NULL, '2020-04-03 23:01:00', NULL, '2020-04-03 23:01:00');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_last` datetime DEFAULT NULL,
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_desc` varchar(255) DEFAULT NULL,
  `user_display_name` varchar(255) DEFAULT NULL,
  `id_card` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT 'admin',
  `update_by` varchar(255) DEFAULT 'admin',
  `del_flag` int(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '2020-04-04 11:13:50', '/static/images/avatar/1.jpeg', '人生得意须尽欢', '管理员', '123456789012345679', '11111111111', 'a021a665f503979c06f50b8de66a4218', 0, '2019-01-24 00:07:33', '2020-03-11 17:44:15', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (2, NULL, '/static/images/avatar/2.jpeg', '11', '马云', '123@qq.com', 'mayun', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-05 17:37:43', '2020-02-08 20:33:24', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (3, '2020-04-03 21:42:44', '/static/images/avatar/3.jpeg', '', '张三', '121113@qq.com', 'zhangsan', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 13:22:22', '2020-02-08 20:33:26', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (4, '2020-02-16 12:57:48', '/static/images/avatar/6.jpeg', '', '李四', 'lisi@qq.com', 'lisi', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 13:57:51', '2020-03-07 18:00:42', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (5, NULL, '/static/images/avatar/4.jpeg', '1111', '11', '12111113@qq.com', '111111', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 18:48:20', '2020-03-07 18:00:44', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (6, '2020-02-08 18:54:29', '/static/images/avatar/5.jpeg', '', '黄忠', '1231111@qq.com', 'huang', 'a021a665f503979c06f50b8de66a4218', 0, '2020-02-08 18:54:21', '2020-02-08 20:33:33', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (7, '2020-03-08 14:21:48', '/static/images/avatar/1.jpeg', '', 'mayun2', '123456@mayun.com', 'mayun2', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-08 14:21:05', '2020-04-07 23:18:46', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (8, '2020-03-09 16:21:31', '/static/images/avatar/35.jpeg', NULL, 'mahuateng', '111@qq.com', 'mahuateng', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-09 13:24:42', '2020-04-07 23:16:21', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (9, '2020-03-14 15:20:43', '/static/images/avatar/17.jpeg', NULL, 'zhaoyun', '847064370@qq.com', 'zhaoyun', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:27:11', '2020-04-07 23:18:46', 'admin', 'admin', 1);
INSERT INTO `user` VALUES (10, '2020-03-11 21:41:01', '/static/images/avatar/28.jpeg', NULL, 'wangwu', 'wangwu@qq.com', 'wangwu', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:38:51', '2020-03-11 21:38:51', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (11, NULL, '/static/images/avatar/25.jpeg', NULL, 'wangwu2', '1234562@mayun.com', 'wangwu2', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:40:54', '2020-03-11 21:40:54', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (12, '2020-03-11 21:42:04', '/static/images/avatar/13.jpeg', NULL, 'zhangfei', '123456@zhang.com', 'zhangfei', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:41:55', '2020-03-11 21:41:55', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (13, '2020-03-11 21:44:48', '/static/images/avatar/9.jpeg', NULL, 'liubei', '123@qqq.com', 'liubei', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:42:51', '2020-03-11 21:42:51', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (14, NULL, '/static/images/avatar/13.jpeg', NULL, 'liubei2', '123456@m22ayun.com', 'liubei2', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-11 21:44:44', '2020-03-11 21:44:44', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (16, '2020-03-12 18:19:01', '/static/images/avatar/34.jpeg', NULL, 'lisi', 'lisi@qq.com', 'lisi', 'a021a665f503979c06f50b8de66a4218', 0, '2020-03-12 18:18:57', '2020-03-12 18:18:57', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (17, NULL, '/static/images/avatar/32.jpeg', NULL, '马云', '123456789012345678', '15779216424', 'a021a665f503979c06f50b8de66a4218', 0, '2020-04-05 23:18:01', '2020-04-05 23:18:01', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (18, NULL, '/static/images/avatar/40.jpeg', '', '周瑜', '123456789012345671', '22222222222', 'a021a665f503979c06f50b8de66a4218', 0, '2020-04-05 23:18:41', '2020-04-07 00:26:59', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (19, NULL, '/static/images/avatar/26.jpeg', NULL, '张三', '123123123123123', '33333333333', 'a021a665f503979c06f50b8de66a4218', 0, '2020-04-07 00:28:15', '2020-04-07 00:28:15', 'admin', 'admin', 0);
INSERT INTO `user` VALUES (20, NULL, '/static/images/avatar/29.jpeg', '', '马云222', '111111111111111199', '12312311111', 'a021a665f503979c06f50b8de66a4218', 0, '2020-04-08 00:44:44', '2020-04-08 00:47:49', 'admin', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for user_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `user_role_ref`;
CREATE TABLE `user_role_ref` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `del_flag` int(1) DEFAULT '0',
  `create_by` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_role_ref
-- ----------------------------
BEGIN;
INSERT INTO `user_role_ref` VALUES (2, 2, 0, NULL, '2020-02-05 17:37:43', NULL, '2020-02-05 17:37:43', 2);
INSERT INTO `user_role_ref` VALUES (1, 1, 0, NULL, '2020-02-08 13:56:55', NULL, '2020-02-08 13:56:55', 4);
INSERT INTO `user_role_ref` VALUES (3, 2, 0, NULL, '2020-02-08 18:53:44', NULL, '2020-02-08 18:53:44', 10);
INSERT INTO `user_role_ref` VALUES (10, 2, 0, NULL, '2020-03-11 21:38:51', NULL, '2020-03-11 21:38:51', 14);
INSERT INTO `user_role_ref` VALUES (11, 2, 0, NULL, '2020-03-11 21:40:54', NULL, '2020-03-11 21:40:54', 15);
INSERT INTO `user_role_ref` VALUES (12, 2, 0, NULL, '2020-03-11 21:41:56', NULL, '2020-03-11 21:41:56', 16);
INSERT INTO `user_role_ref` VALUES (13, 2, 0, NULL, '2020-03-11 21:42:51', NULL, '2020-03-11 21:42:51', 17);
INSERT INTO `user_role_ref` VALUES (14, 2, 0, NULL, '2020-03-11 21:44:44', NULL, '2020-03-11 21:44:44', 18);
INSERT INTO `user_role_ref` VALUES (16, 2, 0, NULL, '2020-03-12 18:18:57', NULL, '2020-03-12 18:18:57', 19);
INSERT INTO `user_role_ref` VALUES (17, 2, 0, NULL, '2020-04-05 23:18:01', NULL, '2020-04-05 23:18:01', 20);
INSERT INTO `user_role_ref` VALUES (18, 3, 0, NULL, '2020-04-07 00:26:59', NULL, '2020-04-07 00:26:59', 23);
INSERT INTO `user_role_ref` VALUES (19, 2, 0, NULL, '2020-04-07 00:28:15', NULL, '2020-04-07 00:28:15', 24);
INSERT INTO `user_role_ref` VALUES (20, 2, 0, NULL, '2020-04-08 00:44:44', NULL, '2020-04-08 00:44:44', 25);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
