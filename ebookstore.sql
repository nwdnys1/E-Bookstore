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

 Date: 19/04/2024 22:06:10
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
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://img.moegirl.org.cn/common/b/b5/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC1.jpg', '0', 1);
INSERT INTO `books` VALUES (2, 'Clean Code', '罗伯特·C·马丁', '一本关于敏捷软件工艺的手册。本书侧重于编写清晰、可维护和高效的代码。它为开发人员提供了实用的建议和指南，以提高他们的编码技能并产生高质量的软件。', 9.0, 29.99, 'https://img.moegirl.org.cn/common/2/20/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC2.jpg', '1241', 100);
INSERT INTO `books` VALUES (3, '设计模式', '埃里希·伽玛, 理查德·赫尔姆, 拉尔夫·约翰逊, 约翰·弗利西德斯', '可重用的面向对象软件的基本元素。这本经典著作介绍了各种设计模式，帮助开发人员创建灵活、可重用的面向对象软件。它涵盖了单例模式、工厂模式、观察者模式等各种模式。', 8.0, 24.99, 'https://img.moegirl.org.cn/common/2/2b/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC3.jpg', '12414', 3100);
INSERT INTO `books` VALUES (4, '程序员修炼之道', '安德鲁·亨特, 大卫·托马斯', '你的成长之路。这本书通过采用实用的方法和技术，指导你成为更好的程序员。本书提供了有关软件开发实践、团队合作和持续学习的宝贵见解。', 9.0, 34.99, 'https://img.moegirl.org.cn/common/8/80/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC4.jpg', '124', 100);
INSERT INTO `books` VALUES (6, '代码大全', '史蒂夫·麦康奈尔', '软件构建的全面指南。本书涵盖了与软件开发相关的各种主题，包括编码实践、测试、调试和项目管理。它为有抱负和有经验的开发人员提供了全面的资源。', 9.0, 39.99, 'https://img.moegirl.org.cn/common/0/03/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC5.jpg', '13213', 4100);
INSERT INTO `books` VALUES (7, '破解编程面试', '盖尔·拉克曼·麦克道威尔', '150道编程问题和解决方案。这是软件工程师准备技术面试的必备资源。本书包含了一系列编程问题的详细解释和解决策略，以有效应对这些问题。', 8.0, 32.99, 'https://img.moegirl.org.cn/common/5/53/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC6.jpg', '1244', 100);
INSERT INTO `books` VALUES (8, '神话般的人月', '弗雷德里克·P·布鲁克斯', '软件工程的论文集。这本经典著作讨论了软件开发项目的挑战以及管理大规模工程项目的复杂性。作者分享了他在这个领域的经验中获得的宝贵见解和教训。', 9.0, 21.99, 'https://img.moegirl.org.cn/common/e/ee/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC8.jpg', '3123', 100);
INSERT INTO `books` VALUES (19, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://img.moegirl.org.cn/common/0/0e/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC9.jpg', '123', 100);
INSERT INTO `books` VALUES (20, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://img.moegirl.org.cn/common/7/77/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC10.jpg', '0', 100);
INSERT INTO `books` VALUES (21, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://img.moegirl.org.cn/common/5/5c/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC11.jpg', '0', 100);
INSERT INTO `books` VALUES (22, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://img.moegirl.org.cn/common/3/33/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC7.jpg', '0', 100);
INSERT INTO `books` VALUES (23, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://img.moegirl.org.cn/common/d/df/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC12.jpg', '0', 100);
INSERT INTO `books` VALUES (24, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 19.99, 'https://img.moegirl.org.cn/common/d/d8/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC14.jpg', '0', 100);
INSERT INTO `books` VALUES (25, 'Python: Python编程入门', '约翰·古特纳', '一本介绍Python编程入门的书籍，适合初学者阅读。内容涵盖了基本语法、控制流、函数等方面，帮助读者快速掌握Python编程基础。', 9.5, 25.99, 'https://img.moegirl.org.cn/common/3/3e/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC13.jpg', '9781234567890', 50);
INSERT INTO `books` VALUES (26, 'Java: Java核心技术', '凯·霍斯特曼', '这本书是Java编程领域的经典之作，涵盖了Java语言的各个方面，包括面向对象编程、多线程、网络编程等。适合有一定编程经验的读者阅读。', 9.8, 39.99, 'https://img.moegirl.org.cn/common/6/6b/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC22.jpg', '9780987654321', 80);
INSERT INTO `books` VALUES (27, 'C++: C++ Primer', '斯坦利·布利斯特', '这是一本经典的C++入门书籍，覆盖了C++语言的基础知识和高级特性。适合想要深入学习C++编程的读者。', 9.7, 45.50, 'https://img.moegirl.org.cn/common/4/41/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC21.jpg', '9780123456789', 60);
INSERT INTO `books` VALUES (28, 'HTML & CSS: 前端开发入门', '杰瑞米·基思', '这本书介绍了前端开发中HTML和CSS的基础知识，包括网页布局、样式设计等内容。适合初学者或希望了解前端开发的读者。', 9.2, 29.99, 'https://img.moegirl.org.cn/common/0/0d/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC20.jpg', '9789876543210', 70);
INSERT INTO `books` VALUES (29, '机器学习: 从入门到精通', '安德鲁·吴', '这本书介绍了机器学习领域的基本概念和算法，涵盖了监督学习、无监督学习等内容。适合对机器学习感兴趣的读者。', 9.6, 55.00, 'https://img.moegirl.org.cn/common/5/57/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC19.jpg', '9785432109876', 55);
INSERT INTO `books` VALUES (30, '数据结构与算法: 算法导论', '托马斯·赫·科尔曼', '这本书是一部经典的计算机科学教材，介绍了数据结构与算法的基本概念和常用算法。适合计算机专业的学生和从业者阅读。', 9.9, 49.99, 'https://img.moegirl.org.cn/common/d/d3/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC18.jpeg', '9786789012345', 65);
INSERT INTO `books` VALUES (31, '网络安全: 实战指南', '凯西·尼科尔森', '这本书介绍了网络安全领域的各种攻防技术，包括网络漏洞利用、入侵检测等内容。适合网络安全从业者和爱好者阅读。', 9.4, 35.00, 'https://img.moegirl.org.cn/common/5/52/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC17.jpg', '9783456789012', 75);
INSERT INTO `books` VALUES (32, '人工智能: 原理与实践', '斯图尔特·罗素', '这本书介绍了人工智能领域的基本原理和应用实践，包括机器学习、深度学习等内容。适合对人工智能感兴趣的读者。', 9.7, 42.99, 'https://img.moegirl.org.cn/common/7/77/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC10.jpg', '9782345678901', 70);
INSERT INTO `books` VALUES (33, '数据库管理: 实践指南', '迈克尔·斯通布雷克', '这本书介绍了数据库管理的基本概念和实践技巧，包括SQL语言、数据库设计等内容。适合数据库管理员和开发人员阅读。', 9.3, 38.50, 'https://img.moegirl.org.cn/common/d/d2/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC16.jpg', '9784567890123', 65);
INSERT INTO `books` VALUES (34, '移动应用开发: Android实战', '詹姆斯·威尔逊', '这本书介绍了Android移动应用开发的基础知识和实战技巧，包括界面设计、数据存储等内容。适合想要学习Android开发的读者。', 9.5, 34.99, 'https://img.moegirl.org.cn/common/c/c5/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC15%E5%8D%B7.jpg', '9785678901234', 60);
INSERT INTO `books` VALUES (35, '计算机网络: 原理、技术与应用', '谢希仁', '该书是关于计算机网络的经典教材，介绍了计算机网络的基本原理、协议和应用技术，适合计算机网络相关专业的学生和工程师阅读。', 9.6, 55.50, 'https://img.moegirl.org.cn/common/9/93/OMRK7.jpg', '9780123456789', 70);
INSERT INTO `books` VALUES (36, '人机交互: 设计与实践', '本·舒奇', '这本书介绍了人机交互领域的基本概念、原理和设计方法，包括用户界面设计、可用性测试等内容，适合人机交互相关专业的学生和设计师阅读。', 9.4, 48.99, 'https://img.moegirl.org.cn/common/f/f9/OMRK6.jpg', '9781234567890', 65);
INSERT INTO `books` VALUES (37, '计算机图形学: 原理与实践', '彼得·舒尔德', '这本书介绍了计算机图形学的基本原理、算法和应用实践，包括2D、3D图形的生成与处理，适合对计算机图形学感兴趣的读者。', 9.7, 58.00, 'https://img.moegirl.org.cn/common/0/05/OMRK5.jpg', '9782345678901', 60);
INSERT INTO `books` VALUES (38, '物联网: 原理与应用', '卡洛斯·古铁雷斯', '这本书介绍了物联网的基本原理、技术和应用场景，包括传感器网络、物联网安全等方面，适合物联网相关领域的学生和工程师阅读。', 9.5, 42.50, 'https://img.moegirl.org.cn/common/9/91/OMRK4.jpg', '9783456789012', 75);
INSERT INTO `books` VALUES (39, '信息安全: 原理与实践', '迈克尔·古德里奇', '这本书介绍了信息安全的基本原理、攻防技术和应用实践，包括加密算法、安全协议等内容，适合信息安全专业人士阅读。', 9.3, 39.99, 'https://img.moegirl.org.cn/common/f/f8/OMRK3.jpeg', '9784567890123', 80);
INSERT INTO `books` VALUES (40, '云计算: 原理与实践', '托马斯·艾里克', '这本书介绍了云计算的基本概念、架构和应用实践，包括云服务模型、虚拟化技术等内容，适合对云计算感兴趣的读者。', 9.6, 49.50, 'https://img.moegirl.org.cn/common/7/75/OMRK2.jpeg', '9785678901234', 70);
INSERT INTO `books` VALUES (41, '操作系统: 原理与实践', '安德鲁·塔能鲍姆', '这本书介绍了操作系统的基本原理、设计与实现，包括进程管理、内存管理等核心概念，适合计算机科学相关专业的学生和研究者阅读。', 9.7, 44.99, 'https://img.moegirl.org.cn/common/1/18/OMRK1.jpeg', '9786789012345', 65);
INSERT INTO `books` VALUES (42, '编译原理: 原理与实践', '艾伦·阿霍', '这本书介绍了编译原理的基本概念、技术和实现方法，包括词法分析、语法分析等内容，适合编译原理相关专业的学生和研究者阅读。', 9.8, 46.50, 'https://example.com/compilers-book-cover.jpg', '9787890123456', 75);
INSERT INTO `books` VALUES (43, '软件工程: 原理与实践', '伊恩·索默维尔', '这本书介绍了软件工程的基本原理、方法和实践技巧，包括需求分析、软件设计等内容，适合软件工程师和学生阅读。', 9.4, 41.99, 'https://img.moegirl.org.cn/common/5/5c/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC11.jpg', '9788901234567', 70);
INSERT INTO `books` VALUES (44, '分布式系统: 原理与实践', '马丁·克莱泽', '这本书介绍了分布式系统的基本原理、设计和实现方法，包括分布式一致性、容错机制等内容，适合分布式系统相关领域的研究者和工程师阅读。', 9.5, 48.50, 'https://img.moegirl.org.cn/common/d/df/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC12.jpg', '9789012345678', 65);

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
