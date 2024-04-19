/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : ebookstore

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 19/04/2024 20:56:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `rating` decimal(3, 1) NULL DEFAULT NULL,
  `price` decimal(5, 2) NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isbn` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://p3.itc.cn/q_70/images03/20210817/2b97b31c09df4315a03d94f30e864ecc.jpeg', 0, 1);
INSERT INTO `books` VALUES (2, 'Clean Code', '罗伯特·C·马丁', '一本关于敏捷软件工艺的手册。本书侧重于编写清晰、可维护和高效的代码。它为开发人员提供了实用的建议和指南，以提高他们的编码技能并产生高质量的软件。', 9.0, 29.99, 'https://p1.itc.cn/q_70/images03/20220524/2d4e39e06a344ea0a0a0e3b635cb9851.jpeg', 1241, 100);
INSERT INTO `books` VALUES (3, '设计模式', '埃里希·伽玛, 理查德·赫尔姆, 拉尔夫·约翰逊, 约翰·弗利西德斯', '可重用的面向对象软件的基本元素。这本经典著作介绍了各种设计模式，帮助开发人员创建灵活、可重用的面向对象软件。它涵盖了单例模式、工厂模式、观察者模式等各种模式。', 8.0, 24.99, 'https://wx2.sinaimg.cn/mw690/6f250299gy1g6gq7wrs3gj209s0dwdhi.jpg', 12414, 3100);
INSERT INTO `books` VALUES (4, '程序员修炼之道', '安德鲁·亨特, 大卫·托马斯', '你的成长之路。这本书通过采用实用的方法和技术，指导你成为更好的程序员。本书提供了有关软件开发实践、团队合作和持续学习的宝贵见解。', 9.0, 34.99, 'https://lain.bgm.tv/pic/cover/l/c1/21/110069_XXf2n.jpg', 124, 100);
INSERT INTO `books` VALUES (6, '代码大全', '史蒂夫·麦康奈尔', '软件构建的全面指南。本书涵盖了与软件开发相关的各种主题，包括编码实践、测试、调试和项目管理。它为有抱负和有经验的开发人员提供了全面的资源。', 9.0, 39.99, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg1.doubanio.com%2Fview%2Fsubject%2Fs%2Fpublic%2Fs33497618.jpg&refer=http%3A%2F%2Fimg1.doubanio.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1714483953&t=f30eb8eadf9d9d1bd67f8dd8fe7fbf9e', 13213, 4100);
INSERT INTO `books` VALUES (7, '破解编程面试', '盖尔·拉克曼·麦克道威尔', '150道编程问题和解决方案。这是软件工程师准备技术面试的必备资源。本书包含了一系列编程问题的详细解释和解决策略，以有效应对这些问题。', 8.0, 32.99, 'http://t14.baidu.com/it/u=104271103,1672634756&fm=224&app=112&f=JPEG?w=352&h=500', 1244, 100);
INSERT INTO `books` VALUES (8, '神话般的人月', '弗雷德里克·P·布鲁克斯', '软件工程的论文集。这本经典著作讨论了软件开发项目的挑战以及管理大规模工程项目的复杂性。作者分享了他在这个领域的经验中获得的宝贵见解和教训。', 9.0, 21.99, 'https://p3.itc.cn/q_70/images03/20210817/2b97b31c09df4315a03d94f30e864ecc.jpeg', 3123, 100);
INSERT INTO `books` VALUES (19, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg1.doubanio.com%2Fview%2Fsubject%2Fs%2Fpublic%2Fs33497618.jpg&refer=http%3A%2F%2Fimg1.doubanio.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1714483953&t=f30eb8eadf9d9d1bd67f8dd8fe7fbf9e', 123, 100);
INSERT INTO `books` VALUES (20, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg1.doubanio.com%2Fview%2Fsubject%2Fs%2Fpublic%2Fs33497618.jpg&refer=http%3A%2F%2Fimg1.doubanio.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1714483953&t=f30eb8eadf9d9d1bd67f8dd8fe7fbf9e', 0, 100);

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `bid` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cidbid`(`uid` ASC, `bid` ASC) USING BTREE,
  INDEX `FKsa9oia6v2qv02lim3gxk2hmdq`(`bid` ASC) USING BTREE,
  CONSTRAINT `FKn86teseb73mlpl86xh5ikp6sw` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsa9oia6v2qv02lim3gxk2hmdq` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (79, 2, 8, 1);
INSERT INTO `cart_items` VALUES (89, 2, 3, 1);
INSERT INTO `cart_items` VALUES (90, 2, 2, 1);
INSERT INTO `cart_items` VALUES (101, 3, 8, 2);
INSERT INTO `cart_items` VALUES (102, 3, 19, 2);
INSERT INTO `cart_items` VALUES (104, 3, 6, 4100);
INSERT INTO `cart_items` VALUES (105, 3, 20, 2);
INSERT INTO `cart_items` VALUES (106, 3, 1, 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `bid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKkbth5o6nwvdhphqmkn4n9mww6`(`bid` ASC) USING BTREE,
  INDEX `FKquluhan0rqmtk5x8v3178ypd6`(`uid` ASC) USING BTREE,
  CONSTRAINT `FKkbth5o6nwvdhphqmkn4n9mww6` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKquluhan0rqmtk5x8v3178ypd6` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (8, ' \"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\r\n    \r\n', '2024-04-09 13:31:10.772016', 1, 2);
INSERT INTO `comments` VALUES (9, '11', '2024-04-09 14:32:57.356081', 1, 2);
INSERT INTO `comments` VALUES (10, '11', '2024-04-09 14:33:12.750939', 1, 2);
INSERT INTO `comments` VALUES (11, '1123', '2024-04-09 14:34:21.393963', 1, 2);
INSERT INTO `comments` VALUES (12, '但是分', '2024-04-09 14:35:14.849385', 20, 2);
INSERT INTO `comments` VALUES (13, 'sad', '2024-04-09 14:42:04.030561', 1, 2);
INSERT INTO `comments` VALUES (14, 'sad', '2024-04-09 18:00:28.209437', 1, 2);
INSERT INTO `comments` VALUES (15, '黑夜\n', '2024-04-09 18:05:39.900751', 1, 3);
INSERT INTO `comments` VALUES (16, 'sad', '2024-04-09 18:07:39.328412', 19, 3);
INSERT INTO `comments` VALUES (17, '明日もいたいひうたうよ\n', '2024-04-09 18:32:56.791313', 2, 2);
INSERT INTO `comments` VALUES (18, 'ここにあるよ\n', '2024-04-09 21:07:12.941977', 4, 3);
INSERT INTO `comments` VALUES (19, '２１３２', '2024-04-13 20:00:54.747746', 2, 3);
INSERT INTO `comments` VALUES (20, '１２３', '2024-04-13 20:02:32.375332', 2, 3);
INSERT INTO `comments` VALUES (21, 's', '2024-04-13 20:03:27.411127', 2, 3);
INSERT INTO `comments` VALUES (22, '21313', '2024-04-13 20:07:05.254775', 2, 3);
INSERT INTO `comments` VALUES (23, '12313', '2024-04-13 20:07:21.647745', 8, 3);
INSERT INTO `comments` VALUES (24, '123', '2024-04-13 20:13:03.658818', 20, 3);
INSERT INTO `comments` VALUES (25, '阿萨德', '2024-04-14 01:07:52.911849', 3, 3);
INSERT INTO `comments` VALUES (26, '黑鸭\n', '2024-04-14 15:45:47.812105', 1, 3);
INSERT INTO `comments` VALUES (27, '阿萨德', '2024-04-14 16:34:36.489448', 1, 3);
INSERT INTO `comments` VALUES (28, '阿萨德', '2024-04-14 16:53:13.458691', 20, 3);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `oid` int NOT NULL,
  `bid` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id` DESC) USING BTREE,
  INDEX `FKin1q0xhd1x9dh98xpdpbw8h5t`(`bid` ASC) USING BTREE,
  INDEX `FKl4ipr6s7s08pcb3klykm8sji4`(`oid` ASC) USING BTREE,
  CONSTRAINT `FKin1q0xhd1x9dh98xpdpbw8h5t` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl4ipr6s7s08pcb3klykm8sji4` FOREIGN KEY (`oid`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (56, 50, 4, 1);
INSERT INTO `order_items` VALUES (55, 50, 2, 4);
INSERT INTO `order_items` VALUES (54, 50, 1, 14);
INSERT INTO `order_items` VALUES (53, 49, 20, 1);
INSERT INTO `order_items` VALUES (52, 49, 19, 1);
INSERT INTO `order_items` VALUES (51, 49, 4, 1);
INSERT INTO `order_items` VALUES (50, 49, 3, 1);
INSERT INTO `order_items` VALUES (49, 49, 1, 1);
INSERT INTO `order_items` VALUES (48, 48, 20, 1);
INSERT INTO `order_items` VALUES (47, 48, 2, 1);
INSERT INTO `order_items` VALUES (46, 47, 1, 8);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbdolj6vr67tqh6wgsl44mur9y`(`uid` ASC) USING BTREE,
  CONSTRAINT `FKbdolj6vr67tqh6wgsl44mur9y` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (47, 2, '21 ', 'あき', 'なつ', '2024-04-09 19:09:59.637908');
INSERT INTO `orders` VALUES (48, 3, 'あああ～', 'あds', 'ああ', '2024-04-09 21:07:28.112128');
INSERT INTO `orders` VALUES (49, 3, '123', '123', '213', '2024-04-13 20:15:51.227501');
INSERT INTO `orders` VALUES (50, 3, '东川路800号', 'ZH', '12345', '2024-04-14 14:43:34.464803');

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `cid` int NULL DEFAULT NULL,
  `uid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbq9kgpy1ldyjko15n0r7bf157`(`cid` ASC) USING BTREE,
  INDEX `FKt202gd81iqyu8dkc3jteqa2q8`(`uid` ASC) USING BTREE,
  CONSTRAINT `FKbq9kgpy1ldyjko15n0r7bf157` FOREIGN KEY (`cid`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt202gd81iqyu8dkc3jteqa2q8` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of replies
-- ----------------------------
INSERT INTO `replies` VALUES (1, 'asdasd', '2024-04-09 14:50:38.000000', 8, 2);
INSERT INTO `replies` VALUES (2, '说得很好', '2024-04-09 17:56:05.764817', 8, 2);
INSERT INTO `replies` VALUES (3, '说得很好', '2024-04-09 17:56:34.171793', 9, 2);
INSERT INTO `replies` VALUES (4, 'sad', '2024-04-09 18:04:34.440975', 8, 2);
INSERT INTO `replies` VALUES (5, '213', '2024-04-09 18:05:02.687211', 9, 2);
INSERT INTO `replies` VALUES (6, '456', '2024-04-09 18:05:22.551812', 9, 3);
INSERT INTO `replies` VALUES (7, '1111', '2024-04-09 18:08:23.558237', 10, 3);
INSERT INTO `replies` VALUES (8, '阿萨德', '2024-04-09 18:12:23.637143', 8, 3);
INSERT INTO `replies` VALUES (9, 'sad', '2024-04-09 18:17:05.154034', 8, 3);
INSERT INTO `replies` VALUES (10, '阿萨德', '2024-04-09 18:18:03.460280', 9, 3);
INSERT INTO `replies` VALUES (11, '阿萨德', '2024-04-09 18:19:28.760087', 8, 3);
INSERT INTO `replies` VALUES (12, 'だいじけん\n', '2024-04-09 18:33:09.971359', 17, 2);
INSERT INTO `replies` VALUES (13, '阿萨德', '2024-04-13 19:12:54.626779', 12, 3);
INSERT INTO `replies` VALUES (14, '阿萨德', '2024-04-13 19:14:18.953713', 12, 3);
INSERT INTO `replies` VALUES (15, '阿萨德', '2024-04-13 19:23:33.953314', 12, 3);
INSERT INTO `replies` VALUES (16, '12', '2024-04-13 19:23:51.932108', 12, 3);
INSERT INTO `replies` VALUES (17, '暗示的', '2024-04-13 19:24:20.687678', 12, 3);
INSERT INTO `replies` VALUES (18, '阿萨德', '2024-04-13 19:25:39.379038', 12, 3);
INSERT INTO `replies` VALUES (19, '12', '2024-04-13 19:26:22.327585', 12, 3);
INSERT INTO `replies` VALUES (20, '123', '2024-04-13 19:26:26.676770', 12, 3);
INSERT INTO `replies` VALUES (21, '123', '2024-04-13 19:26:37.660390', 12, 3);
INSERT INTO `replies` VALUES (22, '213 ', '2024-04-13 19:26:48.663714', 12, 3);
INSERT INTO `replies` VALUES (23, '1232313', '2024-04-13 19:31:48.258840', 12, 3);
INSERT INTO `replies` VALUES (24, '124414', '2024-04-13 19:32:51.694417', 12, 3);
INSERT INTO `replies` VALUES (25, '2141414', '2024-04-13 19:33:02.019190', 12, 3);
INSERT INTO `replies` VALUES (26, '123', '2024-04-13 19:33:56.747284', 16, 3);
INSERT INTO `replies` VALUES (27, '123', '2024-04-13 19:34:08.111102', 16, 3);
INSERT INTO `replies` VALUES (28, '123', '2024-04-13 19:34:52.853798', 16, 3);
INSERT INTO `replies` VALUES (29, '123', '2024-04-13 19:35:28.079209', 17, 3);
INSERT INTO `replies` VALUES (30, '12313', '2024-04-13 19:39:10.494710', 17, 3);
INSERT INTO `replies` VALUES (31, '123213', '2024-04-13 19:41:50.106855', 17, 3);
INSERT INTO `replies` VALUES (32, '12321313', '2024-04-13 19:44:58.371889', 17, 3);
INSERT INTO `replies` VALUES (33, '213', '2024-04-13 19:57:21.270461', 17, 3);
INSERT INTO `replies` VALUES (34, '１２３２１３', '2024-04-13 20:00:39.821594', 17, 3);
INSERT INTO `replies` VALUES (35, 'sだ', '2024-04-13 20:01:26.155230', 17, 3);
INSERT INTO `replies` VALUES (36, '12313', '2024-04-13 20:07:25.034670', 23, 3);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `about_me` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'admin', '$2a$10$aKDtAkdFaonYbGxc4OTZC.GDIdRJBvP39TSDE7O0ByQ3r2CzKtnTe', b'1', 'admin', '\\logo.jpg', '2670617505@qq.com', 1, '12345', 'asd');
INSERT INTO `users` VALUES (3, 'zh', '$2a$10$aKDtAkdFaonYbGxc4OTZC.GDIdRJBvP39TSDE7O0ByQ3r2CzKtnTe', b'1', 'user', '\\1.jpg', 'zh13588888888@sjtu.edu.cn', 1, '13588888888', 'sadconst [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);const [form] = Form.useForm();\n  form.setFieldsValue(user);');
INSERT INTO `users` VALUES (5, 'zh1', '$2a$10$aKDtAkdFaonYbGxc4OTZC.GDIdRJBvP39TSDE7O0ByQ3r2CzKtnTe', b'1', 'user', '213', '123', 123, '123', '123');
INSERT INTO `users` VALUES (6, 'おぱい禁止！', '$2a$10$aKDtAkdFaonYbGxc4OTZC.GDIdRJBvP39TSDE7O0ByQ3r2CzKtnTe', b'0', '123', '123', '123', 13, '13', '意味は分かりませんわ');

SET FOREIGN_KEY_CHECKS = 1;
