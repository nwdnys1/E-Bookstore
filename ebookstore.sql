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

 Date: 29/06/2024 10:10:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag`  (
  `bid` int NOT NULL,
  `tid` int NOT NULL,
  INDEX `FK3sykbykugkfc40u7l5gxciyhy`(`tid` ASC) USING BTREE,
  INDEX `FKp5o3vsnt6r65enk4mfm0mwfy2`(`bid` ASC) USING BTREE,
  CONSTRAINT `FK3sykbykugkfc40u7l5gxciyhy` FOREIGN KEY (`tid`) REFERENCES `tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKp5o3vsnt6r65enk4mfm0mwfy2` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book_tag
-- ----------------------------
INSERT INTO `book_tag` VALUES (1, 1);
INSERT INTO `book_tag` VALUES (1, 2);
INSERT INTO `book_tag` VALUES (1, 3);
INSERT INTO `book_tag` VALUES (1, 4);

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者',
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介',
  `rating` decimal(3, 1) UNSIGNED NULL DEFAULT NULL COMMENT '评分 格式：0.0-10.0',
  `price` int UNSIGNED NOT NULL COMMENT '价格 ',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面url',
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'isbn编号',
  `stock` int UNSIGNED NOT NULL COMMENT '库存',
  `sales` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 20, 'https://img.moegirl.org.cn/common/b/b5/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC1.jpg', '9788901234567', 995, 5);
INSERT INTO `books` VALUES (2, 'Clean Code', '罗伯特·C·马丁', '一本关于敏捷软件工艺的手册。本书侧重于编写清晰、可维护和高效的代码。它为开发人员提供了实用的建议和指南，以提高他们的编码技能并产生高质量的软件。', 9.0, 30, 'https://img.moegirl.org.cn/common/2/20/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC2.jpg', '9788901234567', 93, 7);
INSERT INTO `books` VALUES (3, '设计模式', '埃里希·伽玛, 理查德·赫尔姆, 拉尔夫·约翰逊, 约翰·弗利西德斯', '可重用的面向对象软件的基本元素。这本经典著作介绍了各种设计模式，帮助开发人员创建灵活、可重用的面向对象软件。它涵盖了单例模式、工厂模式、观察者模式等各种模式。', 8.0, 25, 'https://img.moegirl.org.cn/common/2/2b/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC3.jpg', '9788901234567', 3090, 10);
INSERT INTO `books` VALUES (4, '程序员修炼之道', '安德鲁·亨特, 大卫·托马斯', '你的成长之路。这本书通过采用实用的方法和技术，指导你成为更好的程序员。本书提供了有关软件开发实践、团队合作和持续学习的宝贵见解。', 9.0, 35, 'https://img.moegirl.org.cn/common/8/80/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC4.jpg', '9788901234567', 93, 7);
INSERT INTO `books` VALUES (6, '代码大全', '史蒂夫·麦康奈尔', '软件构建的全面指南。本书涵盖了与软件开发相关的各种主题，包括编码实践、测试、调试和项目管理。它为有抱负和有经验的开发人员提供了全面的资源。', 9.0, 40, 'https://img.moegirl.org.cn/common/0/03/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC5.jpg', '9788901234567', 4055, 45);
INSERT INTO `books` VALUES (7, '破解编程面试', '盖尔·拉克曼·麦克道威尔', '150道编程问题和解决方案。这是软件工程师准备技术面试的必备资源。本书包含了一系列编程问题的详细解释和解决策略，以有效应对这些问题。', 8.0, 33, 'https://img.moegirl.org.cn/common/5/53/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC6.jpg', '9788901234567', 96, 4);
INSERT INTO `books` VALUES (8, '神话般的人月', '弗雷德里克·P·布鲁克斯', '软件工程的论文集。这本经典著作讨论了软件开发项目的挑战以及管理大规模工程项目的复杂性。作者分享了他在这个领域的经验中获得的宝贵见解和教训。', 9.0, 22, 'https://img.moegirl.org.cn/common/e/ee/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC8.jpg', '9788901234567', 89, 11);
INSERT INTO `books` VALUES (19, 'UNIX编程艺术', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 20, 'https://img.moegirl.org.cn/common/0/0e/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC9.jpg', '9788901234567', 87, 13);
INSERT INTO `books` VALUES (20, '程序设计语言：实践之道', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 20, 'https://img.moegirl.org.cn/common/7/77/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC10.jpg', '9788901234567', 90, 10);
INSERT INTO `books` VALUES (21, '大话设计模式', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 20, 'https://img.moegirl.org.cn/common/5/5c/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC11.jpg', '9788901234567', 70, 30);
INSERT INTO `books` VALUES (22, '深入理解计算机系统', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 20, 'https://img.moegirl.org.cn/common/3/33/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC7.jpg', '9788901234567', 99, 1);
INSERT INTO `books` VALUES (23, 'Java编程思想', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 20, 'https://img.moegirl.org.cn/common/d/df/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC12.jpg', '09788901234567', 99, 1);
INSERT INTO `books` VALUES (24, '代码整洁之道：程序员的职业素养', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 10.0, 20, 'https://img.moegirl.org.cn/common/d/d8/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC14.jpg', '9788901234567', 100, 0);
INSERT INTO `books` VALUES (25, 'Python: Python编程入门', '约翰·古特纳', '一本介绍Python编程入门的书籍，适合初学者阅读。内容涵盖了基本语法、控制流、函数等方面，帮助读者快速掌握Python编程基础。', 9.5, 26, 'https://img.moegirl.org.cn/common/3/3e/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC13.jpg', '9781234567890', 46, 4);
INSERT INTO `books` VALUES (26, 'Java: Java核心技术', '凯·霍斯特曼', '这本书是Java编程领域的经典之作，涵盖了Java语言的各个方面，包括面向对象编程、多线程、网络编程等。适合有一定编程经验的读者阅读。', 9.8, 40, 'https://img.moegirl.org.cn/common/6/6b/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC22.jpg', '9780987654321', 78, 2);
INSERT INTO `books` VALUES (27, 'C++: C++ Primer', '斯坦利·布利斯特', '这是一本经典的C++入门书籍，覆盖了C++语言的基础知识和高级特性。适合想要深入学习C++编程的读者。', 9.7, 46, 'https://img.moegirl.org.cn/common/4/41/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC21.jpg', '9780123456789', 597, 3);
INSERT INTO `books` VALUES (28, 'HTML & CSS: 前端开发入门', '杰瑞米·基思', '这本书介绍了前端开发中HTML和CSS的基础知识，包括网页布局、样式设计等内容。适合初学者或希望了解前端开发的读者。', 9.2, 30, 'https://img.moegirl.org.cn/common/0/0d/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC20.jpg', '9789876543210', 65, 5);
INSERT INTO `books` VALUES (29, '机器学习: 从入门到精通', '安德鲁·吴', '这本书介绍了机器学习领域的基本概念和算法，涵盖了监督学习、无监督学习等内容。适合对机器学习感兴趣的读者。', 9.6, 55, 'https://img.moegirl.org.cn/common/5/57/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC19.jpg', '9785432109876', 52, 3);
INSERT INTO `books` VALUES (30, '数据结构与算法: 算法导论', '托马斯·赫·科尔曼', '这本书是一部经典的计算机科学教材，介绍了数据结构与算法的基本概念和常用算法。适合计算机专业的学生和从业者阅读。', 9.9, 50, 'https://img.moegirl.org.cn/common/d/d3/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC18.jpeg', '9786789012345', 60, 5);
INSERT INTO `books` VALUES (31, '网络安全: 实战指南', '凯西·尼科尔森', '这本书介绍了网络安全领域的各种攻防技术，包括网络漏洞利用、入侵检测等内容。适合网络安全从业者和爱好者阅读。', 9.4, 35, 'https://img.moegirl.org.cn/common/5/52/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC17.jpg', '9783456789012', 70, 5);
INSERT INTO `books` VALUES (32, '人工智能: 原理与实践', '斯图尔特·罗素', '这本书介绍了人工智能领域的基本原理和应用实践，包括机器学习、深度学习等内容。适合对人工智能感兴趣的读者。', 9.7, 43, 'https://img.moegirl.org.cn/common/7/77/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC10.jpg', '9782345678901', 67, 3);
INSERT INTO `books` VALUES (33, '数据库管理: 实践指南', '迈克尔·斯通布雷克', '这本书介绍了数据库管理的基本概念和实践技巧，包括SQL语言、数据库设计等内容。适合数据库管理员和开发人员阅读。', 9.3, 39, 'https://img.moegirl.org.cn/common/d/d2/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC16.jpg', '9784567890123', 62, 3);
INSERT INTO `books` VALUES (34, '移动应用开发: Android实战', '詹姆斯·威尔逊', '这本书介绍了Android移动应用开发的基础知识和实战技巧，包括界面设计、数据存储等内容。适合想要学习Android开发的读者。', 9.5, 35, 'https://img.moegirl.org.cn/common/c/c5/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC15%E5%8D%B7.jpg', '9785678901234', 54, 6);
INSERT INTO `books` VALUES (35, '计算机网络: 原理、技术与应用', '谢希仁', '该书是关于计算机网络的经典教材，介绍了计算机网络的基本原理、协议和应用技术，适合计算机网络相关专业的学生和工程师阅读。', 9.6, 56, 'https://img.moegirl.org.cn/common/9/93/OMRK7.jpg', '9780123456789', 60, 10);
INSERT INTO `books` VALUES (36, '人机交互: 设计与实践', '本·舒奇', '这本书介绍了人机交互领域的基本概念、原理和设计方法，包括用户界面设计、可用性测试等内容，适合人机交互相关专业的学生和设计师阅读。', 9.4, 49, 'https://img.moegirl.org.cn/common/f/f9/OMRK6.jpg', '9781234567890', 8, 4);
INSERT INTO `books` VALUES (37, '计算机图形学: 原理与实践', '彼得·舒尔德', '这本书介绍了计算机图形学的基本原理、算法和应用实践，包括2D、3D图形的生成与处理，适合对计算机图形学感兴趣的读者。', 9.7, 58, 'https://img.moegirl.org.cn/common/0/05/OMRK5.jpg', '9782345678901', 57, 3);
INSERT INTO `books` VALUES (38, '物联网: 原理与应用', '卡洛斯·古铁雷斯', '这本书介绍了物联网的基本原理、技术和应用场景，包括传感器网络、物联网安全等方面，适合物联网相关领域的学生和工程师阅读。', 9.5, 43, 'https://img.moegirl.org.cn/common/9/91/OMRK4.jpg', '9783456789012', 74, 1);
INSERT INTO `books` VALUES (39, '信息安全: 原理与实践', '迈克尔·古德里奇', '这本书介绍了信息安全的基本原理、攻防技术和应用实践，包括加密算法、安全协议等内容，适合信息安全专业人士阅读。', 9.3, 40, 'https://img.moegirl.org.cn/common/f/f8/OMRK3.jpeg', '9784567890123', 79, 1);
INSERT INTO `books` VALUES (40, '云计算: 原理与实践', '托马斯·艾里克', '这本书介绍了云计算的基本概念、架构和应用实践，包括云服务模型、虚拟化技术等内容，适合对云计算感兴趣的读者。', 9.6, 50, 'https://img.moegirl.org.cn/common/7/75/OMRK2.jpeg', '9785678901234', 69, 1);
INSERT INTO `books` VALUES (41, '操作系统: 原理与实践', '安德鲁·塔能鲍姆', '这本书介绍了操作系统的基本原理、设计与实现，包括进程管理、内存管理等核心概念，适合计算机科学相关专业的学生和研究者阅读。', 9.7, 45, 'https://img.moegirl.org.cn/common/1/18/OMRK1.jpeg', '9786789012345', 64, 1);
INSERT INTO `books` VALUES (43, '软件工程: 原理与实践', '伊恩·索默维尔', '这本书介绍了软件工程的基本原理、方法和实践技巧，包括需求分析、软件设计等内容，适合软件工程师和学生阅读。', 9.4, 42, 'https://img.moegirl.org.cn/common/5/5c/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC11.jpg', '9788901234567', 68, 2);
INSERT INTO `books` VALUES (44, '分布式系统: 原理与实践', '马丁·克莱泽', '这本书介绍了分布式系统的基本原理、设计和实现方法，包括分布式一致性、容错机制等内容，适合分布式系统相关领域的研究者和工程师阅读。', 9.5, 49, 'https://img.moegirl.org.cn/common/d/df/%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC12.jpg', '9789012345678', 64, 1);
INSERT INTO `books` VALUES (47, 'ゆるゆり！', 'なもり！', '大好き', 9.5, 10, 'http://localhost:8081/image/60059df1-e10a-4d4f-a783-12d580cfe32e_6.png', '9788901234132123', 8964, 1);

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL COMMENT '用户id',
  `bid` int NOT NULL COMMENT '书籍id',
  `quantity` int UNSIGNED NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cidbid`(`uid` ASC, `bid` ASC) USING BTREE,
  INDEX `FKsa9oia6v2qv02lim3gxk2hmdq`(`bid` ASC) USING BTREE,
  CONSTRAINT `FKn86teseb73mlpl86xh5ikp6sw` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsa9oia6v2qv02lim3gxk2hmdq` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (169, 2, 1, 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `bid` int NOT NULL COMMENT '书籍id',
  `uid` int NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKkbth5o6nwvdhphqmkn4n9mww6`(`bid` ASC) USING BTREE,
  INDEX `FKquluhan0rqmtk5x8v3178ypd6`(`uid` ASC) USING BTREE,
  CONSTRAINT `FKkbth5o6nwvdhphqmkn4n9mww6` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKquluhan0rqmtk5x8v3178ypd6` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (8, ' \"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\r\n    \r\n', '2024-04-09 13:31:11.000000', 1, 2);
INSERT INTO `comments` VALUES (9, '11', '2024-04-09 14:32:57.000000', 1, 2);
INSERT INTO `comments` VALUES (10, '11', '2024-04-09 14:33:13.000000', 1, 2);
INSERT INTO `comments` VALUES (11, '1123', '2024-04-09 14:34:21.000000', 1, 2);
INSERT INTO `comments` VALUES (12, '但是分', '2024-04-09 14:35:15.000000', 20, 2);
INSERT INTO `comments` VALUES (13, 'sad', '2024-04-09 14:42:04.000000', 1, 2);
INSERT INTO `comments` VALUES (14, 'sad', '2024-04-09 18:00:28.000000', 1, 2);
INSERT INTO `comments` VALUES (15, '黑夜\n', '2024-04-09 18:05:40.000000', 1, 3);
INSERT INTO `comments` VALUES (16, 'sad', '2024-04-09 18:07:39.000000', 19, 3);
INSERT INTO `comments` VALUES (17, '明日もいたいひうたうよ\n', '2024-04-09 18:32:57.000000', 2, 2);
INSERT INTO `comments` VALUES (18, 'ここにあるよ\n', '2024-04-09 21:07:13.000000', 4, 3);
INSERT INTO `comments` VALUES (19, '２１３２', '2024-04-13 20:00:55.000000', 2, 3);
INSERT INTO `comments` VALUES (20, '１２３', '2024-04-13 20:02:32.000000', 2, 3);
INSERT INTO `comments` VALUES (21, 's', '2024-04-13 20:03:27.000000', 2, 3);
INSERT INTO `comments` VALUES (22, '21313', '2024-04-13 20:07:05.000000', 2, 3);
INSERT INTO `comments` VALUES (23, '12313', '2024-04-13 20:07:22.000000', 8, 3);
INSERT INTO `comments` VALUES (24, '123', '2024-04-13 20:13:04.000000', 20, 3);
INSERT INTO `comments` VALUES (25, '阿萨德', '2024-04-14 01:07:53.000000', 3, 3);
INSERT INTO `comments` VALUES (26, '黑鸭\n', '2024-04-14 15:45:48.000000', 1, 3);
INSERT INTO `comments` VALUES (27, '阿萨德', '2024-04-14 16:34:36.000000', 1, 3);
INSERT INTO `comments` VALUES (28, '阿萨德', '2024-04-14 16:53:13.000000', 20, 3);
INSERT INTO `comments` VALUES (29, '\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数', '2024-05-03 20:48:06.000000', 1, 3);
INSERT INTO `comments` VALUES (30, '\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"\"一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。\"', '2024-05-03 20:48:36.000000', 1, 3);
INSERT INTO `comments` VALUES (31, 'onegai！', '2024-05-03 20:56:02.000000', 1, 3);
INSERT INTO `comments` VALUES (32, 'ikuwayo', '2024-05-03 20:56:11.000000', 1, 3);
INSERT INTO `comments` VALUES (33, '123', '2024-05-03 22:40:21.000000', 20, 2);
INSERT INTO `comments` VALUES (34, '123', '2024-05-03 22:56:27.000000', 21, 2);
INSERT INTO `comments` VALUES (35, '很不错的书 使我', '2024-05-03 23:22:54.000000', 3, 2);
INSERT INTO `comments` VALUES (36, '123', '2024-06-05 16:41:36.791154', 47, 2);
INSERT INTO `comments` VALUES (37, '123', '2024-06-05 16:42:06.742834', 40, 2);
INSERT INTO `comments` VALUES (38, '1232132221', '2024-06-05 16:45:08.450025', 40, 2);
INSERT INTO `comments` VALUES (39, '无敌\n', '2024-06-06 19:15:56.959990', 20, 2);

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NULL DEFAULT NULL,
  `uid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKc1x94h50afam5fwnih7hyjqc2`(`cid` ASC) USING BTREE,
  INDEX `FKpo6kp97hlqs4htl41xo03lpyn`(`uid` ASC) USING BTREE,
  CONSTRAINT `FKc1x94h50afam5fwnih7hyjqc2` FOREIGN KEY (`cid`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpo6kp97hlqs4htl41xo03lpyn` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (71, 9, 2);
INSERT INTO `likes` VALUES (73, 10, 2);
INSERT INTO `likes` VALUES (74, 11, 2);
INSERT INTO `likes` VALUES (75, 13, 2);
INSERT INTO `likes` VALUES (76, 27, 2);
INSERT INTO `likes` VALUES (77, 29, 2);
INSERT INTO `likes` VALUES (78, 15, 2);
INSERT INTO `likes` VALUES (81, 25, 2);
INSERT INTO `likes` VALUES (83, 17, 2);
INSERT INTO `likes` VALUES (84, 38, 2);
INSERT INTO `likes` VALUES (85, 12, 2);
INSERT INTO `likes` VALUES (87, 35, 2);
INSERT INTO `likes` VALUES (88, 36, 2);
INSERT INTO `likes` VALUES (89, 14, 2);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `oid` int NOT NULL COMMENT '订单id',
  `bid` int NOT NULL COMMENT '书籍id',
  `quantity` int UNSIGNED NOT NULL COMMENT '数量',
  PRIMARY KEY (`id` DESC) USING BTREE,
  INDEX `FKin1q0xhd1x9dh98xpdpbw8h5t`(`bid` ASC) USING BTREE,
  INDEX `FKl4ipr6s7s08pcb3klykm8sji4`(`oid` ASC) USING BTREE,
  CONSTRAINT `FKin1q0xhd1x9dh98xpdpbw8h5t` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl4ipr6s7s08pcb3klykm8sji4` FOREIGN KEY (`oid`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (119, 67, 21, 30);
INSERT INTO `order_items` VALUES (118, 66, 20, 2);
INSERT INTO `order_items` VALUES (117, 66, 19, 2);
INSERT INTO `order_items` VALUES (116, 66, 8, 2);
INSERT INTO `order_items` VALUES (115, 66, 6, 40);
INSERT INTO `order_items` VALUES (114, 66, 2, 1);
INSERT INTO `order_items` VALUES (113, 66, 1, 1);
INSERT INTO `order_items` VALUES (112, 65, 43, 1);
INSERT INTO `order_items` VALUES (111, 65, 23, 1);
INSERT INTO `order_items` VALUES (110, 65, 22, 1);
INSERT INTO `order_items` VALUES (109, 65, 2, 1);
INSERT INTO `order_items` VALUES (108, 64, 3, 1);
INSERT INTO `order_items` VALUES (107, 64, 2, 1);
INSERT INTO `order_items` VALUES (106, 64, 1, 1);
INSERT INTO `order_items` VALUES (105, 63, 47, 1);
INSERT INTO `order_items` VALUES (104, 63, 44, 1);
INSERT INTO `order_items` VALUES (103, 63, 43, 1);
INSERT INTO `order_items` VALUES (102, 63, 41, 1);
INSERT INTO `order_items` VALUES (101, 63, 40, 1);
INSERT INTO `order_items` VALUES (100, 63, 39, 1);
INSERT INTO `order_items` VALUES (99, 63, 38, 1);
INSERT INTO `order_items` VALUES (98, 62, 37, 3);
INSERT INTO `order_items` VALUES (97, 62, 36, 4);
INSERT INTO `order_items` VALUES (96, 62, 35, 4);
INSERT INTO `order_items` VALUES (95, 62, 34, 2);
INSERT INTO `order_items` VALUES (94, 62, 33, 3);
INSERT INTO `order_items` VALUES (93, 62, 32, 3);
INSERT INTO `order_items` VALUES (92, 62, 31, 5);
INSERT INTO `order_items` VALUES (91, 62, 30, 5);
INSERT INTO `order_items` VALUES (90, 62, 29, 3);
INSERT INTO `order_items` VALUES (89, 62, 28, 5);
INSERT INTO `order_items` VALUES (88, 61, 27, 3);
INSERT INTO `order_items` VALUES (87, 61, 26, 2);
INSERT INTO `order_items` VALUES (86, 61, 25, 4);
INSERT INTO `order_items` VALUES (85, 61, 8, 3);
INSERT INTO `order_items` VALUES (84, 61, 7, 4);
INSERT INTO `order_items` VALUES (83, 61, 6, 5);
INSERT INTO `order_items` VALUES (82, 61, 4, 3);
INSERT INTO `order_items` VALUES (81, 61, 3, 4);
INSERT INTO `order_items` VALUES (80, 61, 2, 4);
INSERT INTO `order_items` VALUES (79, 61, 1, 2);
INSERT INTO `order_items` VALUES (78, 60, 35, 6);
INSERT INTO `order_items` VALUES (77, 60, 34, 4);
INSERT INTO `order_items` VALUES (76, 60, 20, 8);
INSERT INTO `order_items` VALUES (75, 60, 19, 4);
INSERT INTO `order_items` VALUES (74, 60, 8, 6);
INSERT INTO `order_items` VALUES (73, 60, 4, 4);
INSERT INTO `order_items` VALUES (72, 60, 3, 5);
INSERT INTO `order_items` VALUES (71, 60, 1, 1);
INSERT INTO `order_items` VALUES (70, 59, 19, 7);
INSERT INTO `order_items` VALUES (69, 58, 2, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL COMMENT '用户id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
  `receiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `create_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbdolj6vr67tqh6wgsl44mur9y`(`uid` ASC) USING BTREE,
  CONSTRAINT `FKbdolj6vr67tqh6wgsl44mur9y` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (58, 2, '123', 'あき', 'なつ', '2024-06-23 15:24:14.296394');
INSERT INTO `orders` VALUES (59, 2, '123', 'あき', 'なつ', '2024-06-23 15:53:48.562650');
INSERT INTO `orders` VALUES (60, 13, '213', 'あき', '13588888888', '2024-06-23 20:36:43.882104');
INSERT INTO `orders` VALUES (61, 2, '123', '123', '13588888888', '2024-06-23 21:00:37.142566');
INSERT INTO `orders` VALUES (62, 2, '123', '123', '123', '2024-06-23 21:00:47.274948');
INSERT INTO `orders` VALUES (63, 2, '123', 'あds', 'なつ', '2024-06-23 21:00:56.254257');
INSERT INTO `orders` VALUES (64, 2, '12', 'あき', '123', '2024-06-28 16:01:43.557983');
INSERT INTO `orders` VALUES (65, 2, '132', '123', '123', '2024-06-28 16:02:09.972394');
INSERT INTO `orders` VALUES (66, 3, '有钱', 'ZH', '13588888888', '2024-06-28 16:11:54.546123');
INSERT INTO `orders` VALUES (67, 14, '上海交通大学', '朱涵', '13588888888', '2024-06-28 16:41:36.918883');

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `cid` int NOT NULL COMMENT '评论id',
  `uid` int NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbq9kgpy1ldyjko15n0r7bf157`(`cid` ASC) USING BTREE,
  INDEX `FKt202gd81iqyu8dkc3jteqa2q8`(`uid` ASC) USING BTREE,
  CONSTRAINT `FKbq9kgpy1ldyjko15n0r7bf157` FOREIGN KEY (`cid`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt202gd81iqyu8dkc3jteqa2q8` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of replies
-- ----------------------------
INSERT INTO `replies` VALUES (37, '？\n', '2024-05-10 19:07:24.628836', 25, 2);
INSERT INTO `replies` VALUES (38, '悔しい', '2024-06-05 16:45:49.658356', 38, 2);
INSERT INTO `replies` VALUES (39, 'あ　アイラブユーで言葉じゃない', '2024-06-23 15:26:43.621164', 17, 13);
INSERT INTO `replies` VALUES (40, 'そゆこと', '2024-06-28 16:30:10.326931', 36, 2);
INSERT INTO `replies` VALUES (41, 'sad', '2024-06-28 16:35:38.220992', 14, 2);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (1, '百合');
INSERT INTO `tags` VALUES (2, '轻松');
INSERT INTO `tags` VALUES (3, '日常');
INSERT INTO `tags` VALUES (4, '萌系');

-- ----------------------------
-- Table structure for user_auths
-- ----------------------------
DROP TABLE IF EXISTS `user_auths`;
CREATE TABLE `user_auths`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_auths
-- ----------------------------
INSERT INTO `user_auths` VALUES (1, '$2a$10$aKDtAkdFaonYbGxc4OTZC.GDIdRJBvP39TSDE7O0ByQ3r2CzKtnTe', 'admin');
INSERT INTO `user_auths` VALUES (2, '$2a$10$aKDtAkdFaonYbGxc4OTZC.GDIdRJBvP39TSDE7O0ByQ3r2CzKtnTe', 'user');
INSERT INTO `user_auths` VALUES (3, '$2a$10$aKDtAkdFaonYbGxc4OTZC.GDIdRJBvP39TSDE7O0ByQ3r2CzKtnTe', 'zh');
INSERT INTO `user_auths` VALUES (4, '$2a$10$aKDtAkdFaonYbGxc4OTZC.GDIdRJBvP39TSDE7O0ByQ3r2CzKtnTe', '禁止！');
INSERT INTO `user_auths` VALUES (5, '$2a$10$4F9LN/vRmX2LwfLZg7GVNubDiqhKh8uyoOD49s2ecPbtJtoLB7zGu', 'ReCoda');
INSERT INTO `user_auths` VALUES (6, '$2a$10$GlNoCPVddnu8dWVn6NvL5etKtFyd1oTsKwKfCrCG4tHg78.GjFjy6', 'new');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `enabled` bit(1) NOT NULL COMMENT '是否禁用',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像url',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `level` int UNSIGNED NOT NULL COMMENT '等级',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `about_me` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'admin', b'1', 'admin', 'http://localhost:8081/image/a95019e8-530e-4e2d-98de-acf09714d5c2_6.png', 'zh13588888888@sjtu.edu.cn', 1, '13588888888', 'ReCoda\n');
INSERT INTO `users` VALUES (3, 'user', b'1', 'user', '\\1.jpg', '', 1, '', '');
INSERT INTO `users` VALUES (5, 'zh', b'1', 'user', 'http://localhost:8081/image/3e7f25e2-8a91-41fc-b391-55976ca5fe23_6bdc5bab5344b717ba89e41e783ee983382651856.jpg', '', 123, '', '');
INSERT INTO `users` VALUES (6, '禁止！', b'0', 'user', '123', '123', 13, '13', '意味は分かりませんわ');
INSERT INTO `users` VALUES (13, 'ReCoda', b'1', 'user', 'https://img.moegirl.org.cn/common/b/b7/Transparent_Akkarin.jpg', '123@213', 1, '', '後悔も　喜びも　全部歌になれ\nマリーゴールド');
INSERT INTO `users` VALUES (14, 'new', b'1', 'user', 'https://img.moegirl.org.cn/common/b/b7/Transparent_Akkarin.jpg', 'langchain4test@outlook.com', 1, '', '');

SET FOREIGN_KEY_CHECKS = 1;
