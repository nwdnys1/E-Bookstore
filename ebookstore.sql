/*
 Navicat Premium Data Transfer

 Source Server         : 华为云4G2核
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44-log)
 Source Host           : 1.94.118.113:3306
 Source Schema         : ebookstore

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44-log)
 File Encoding         : 65001

 Date: 08/11/2024 01:37:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_details
-- ----------------------------
DROP TABLE IF EXISTS `book_details`;
CREATE TABLE `book_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NULL DEFAULT NULL,
  `sales` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_details
-- ----------------------------
INSERT INTO `book_details` VALUES (1, 100, 137, 96);
INSERT INTO `book_details` VALUES (2, 90, 14, 86);
INSERT INTO `book_details` VALUES (3, 80, 12, 3088);
INSERT INTO `book_details` VALUES (4, 90, 9, 91);
INSERT INTO `book_details` VALUES (6, 90, 46, 4054);
INSERT INTO `book_details` VALUES (7, 80, 6, 94);
INSERT INTO `book_details` VALUES (8, 90, 12, 88);
INSERT INTO `book_details` VALUES (19, 100, 19, 81);
INSERT INTO `book_details` VALUES (20, 100, 12, 88);
INSERT INTO `book_details` VALUES (21, 100, 34, 66);
INSERT INTO `book_details` VALUES (22, 100, 2, 98);
INSERT INTO `book_details` VALUES (23, 100, 2, 98);
INSERT INTO `book_details` VALUES (24, 100, 0, 100);
INSERT INTO `book_details` VALUES (25, 100, 4, 46);
INSERT INTO `book_details` VALUES (26, 100, 2, 78);
INSERT INTO `book_details` VALUES (27, 100, 3, 597);
INSERT INTO `book_details` VALUES (28, 90, 7, 63);
INSERT INTO `book_details` VALUES (29, 100, 3, 52);
INSERT INTO `book_details` VALUES (30, 100, 5, 60);
INSERT INTO `book_details` VALUES (31, 9, 5, 70);
INSERT INTO `book_details` VALUES (32, 10, 3, 67);
INSERT INTO `book_details` VALUES (33, 9, 3, 62);
INSERT INTO `book_details` VALUES (34, 10, 6, 54);
INSERT INTO `book_details` VALUES (35, 10, 10, 60);
INSERT INTO `book_details` VALUES (36, 9, 4, 8);
INSERT INTO `book_details` VALUES (37, 10, 3, 57);
INSERT INTO `book_details` VALUES (38, 10, 1, 74);
INSERT INTO `book_details` VALUES (39, 9, 1, 79);
INSERT INTO `book_details` VALUES (40, 10, 1, 69);
INSERT INTO `book_details` VALUES (41, 10, 1, 64);
INSERT INTO `book_details` VALUES (43, 9, 2, 68);
INSERT INTO `book_details` VALUES (44, 10, 1, 64);
INSERT INTO `book_details` VALUES (47, 10, 1, 8964);
INSERT INTO `book_details` VALUES (52, 0, 1, 99);
INSERT INTO `book_details` VALUES (53, 0, 2, 100);

-- ----------------------------
-- Table structure for book_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag`  (
  `bid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  INDEX `FK3sykbykugkfc40u7l5gxciyhy`(`tid`) USING BTREE,
  INDEX `FKp5o3vsnt6r65enk4mfm0mwfy2`(`bid`) USING BTREE,
  CONSTRAINT `FK3sykbykugkfc40u7l5gxciyhy` FOREIGN KEY (`tid`) REFERENCES `tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKp5o3vsnt6r65enk4mfm0mwfy2` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者',
  `description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介',
  `price` int(10) UNSIGNED NOT NULL COMMENT '价格 ',
  `cover` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '封面url',
  `isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'isbn编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 20, 'https://pub-584d7c8932764afaabeee4dc52e72f6f.r2.dev/20240914221751-c6202f619a0a0f8c44949d224227b514.png', '2131');
INSERT INTO `books` VALUES (2, 'Clean Code', '罗伯特·C·马丁', '一本关于敏捷软件工艺的手册。本书侧重于编写清晰、可维护和高效的代码。它为开发人员提供了实用的建议和指南，以提高他们的编码技能并产生高质量的软件。', 30, 'https://image.blog.nwdnysl.site/%25E6%2591%2587%25E6%259B%25B3%25E7%2599%25BE%25E5%2590%2588%25E5%258D%2595%25E8%25A1%258C%25E6%259C%25AC5.jpg-8566c0541eb64f6f8f114080b4f5690b.jpeg', '9788901234567');
INSERT INTO `books` VALUES (3, '设计模式', '埃里希·伽玛, 理查德·赫尔姆, 拉尔夫·约翰逊, 约翰·弗利西德斯', '可重用的面向对象软件的基本元素。这本经典著作介绍了各种设计模式，帮助开发人员创建灵活、可重用的面向对象软件。它涵盖了单例模式、工厂模式、观察者模式等各种模式。', 25, 'https://image.blog.nwdnysl.site/%25E6%2591%2587%25E6%259B%25B3%25E7%2599%25BE%25E5%2590%2588%25E5%258D%2595%25E8%25A1%258C%25E6%259C%25AC4.jpg-f8d960c988c69167818ca5d679ca83d1.jpeg', '9788901234567');
INSERT INTO `books` VALUES (4, '程序员修炼之道', '安德鲁·亨特, 大卫·托马斯', '你的成长之路。这本书通过采用实用的方法和技术，指导你成为更好的程序员。本书提供了有关软件开发实践、团队合作和持续学习的宝贵见解。', 35, 'https://image.blog.nwdnysl.site/%25E6%2591%2587%25E6%259B%25B3%25E7%2599%25BE%25E5%2590%2588%25E5%258D%2595%25E8%25A1%258C%25E6%259C%25AC3.jpg-7c136ba8f411c0765c09aebdc3c0b8d8.jpeg', '9788901234567');
INSERT INTO `books` VALUES (6, '代码大全', '史蒂夫·麦康奈尔', '软件构建的全面指南。本书涵盖了与软件开发相关的各种主题，包括编码实践、测试、调试和项目管理。它为有抱负和有经验的开发人员提供了全面的资源。', 40, 'https://image.blog.nwdnysl.site/%25E6%2591%2587%25E6%259B%25B3%25E7%2599%25BE%25E5%2590%2588%25E5%258D%2595%25E8%25A1%258C%25E6%259C%25AC2.jpg-1414892d42164ed16a2bea282a457acd.jpeg', '9788901234567');
INSERT INTO `books` VALUES (7, '破解编程面试', '盖尔·拉克曼·麦克道威尔', '150道编程问题和解决方案。这是软件工程师准备技术面试的必备资源。本书包含了一系列编程问题的详细解释和解决策略，以有效应对这些问题。', 33, 'https://image.ebook.nwdnysl.site/70c71c43-96e3-4737-968d-a883631dfb33_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC7.webp', '9788901234567');
INSERT INTO `books` VALUES (8, '神话般的人月', '弗雷德里克·P·布鲁克斯', '软件工程的论文集。这本经典著作讨论了软件开发项目的挑战以及管理大规模工程项目的复杂性。作者分享了他在这个领域的经验中获得的宝贵见解和教训。', 22, 'https://image.ebook.nwdnysl.site/a09a8b0b-b5ed-48a4-99df-b320d74f21c5_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC9.webp', '9788901234567');
INSERT INTO `books` VALUES (19, 'UNIX编程艺术', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 20, 'https://image.ebook.nwdnysl.site/2930c081-cf6c-4089-907a-0932b01dd085_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC10.webp', '9788901234567');
INSERT INTO `books` VALUES (20, '程序设计语言：实践之道', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 20, 'https://image.ebook.nwdnysl.site/9f7f097d-f1d2-4de9-ad8c-c4b4fbfcebf5_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC11.webp', '9788901234567');
INSERT INTO `books` VALUES (21, '大话设计模式', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 20, 'https://image.ebook.nwdnysl.site/85488eb7-1bcc-45db-ba1c-c78d0fe67e54_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC12.webp', '9788901234567');
INSERT INTO `books` VALUES (22, '深入理解计算机系统', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 20, 'https://image.ebook.nwdnysl.site/36b2290c-5bf0-4de5-8442-fcc40b4b0692_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC13.webp', '9788901234567');
INSERT INTO `books` VALUES (23, 'Java编程思想', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 20, 'https://image.ebook.nwdnysl.site/70258bd6-0339-4338-9d55-3171b8564846_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC14.webp', '09788901234567');
INSERT INTO `books` VALUES (24, '代码整洁之道：程序员的职业素养', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 20, 'https://image.ebook.nwdnysl.site/fbefd0f6-d340-47ee-821c-9f24b5078950_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC15%E5%8D%B7.webp', '9788901234567');
INSERT INTO `books` VALUES (25, 'Python: Python编程入门', '约翰·古特纳', '一本介绍Python编程入门的书籍，适合初学者阅读。内容涵盖了基本语法、控制流、函数等方面，帮助读者快速掌握Python编程基础。', 26, 'https://image.ebook.nwdnysl.site/8645ba36-7977-4273-9534-2f09adb520eb_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC16.webp', '9781234567890');
INSERT INTO `books` VALUES (26, 'Java: Java核心技术', '凯·霍斯特曼', '这本书是Java编程领域的经典之作，涵盖了Java语言的各个方面，包括面向对象编程、多线程、网络编程等。适合有一定编程经验的读者阅读。', 40, 'https://image.ebook.nwdnysl.site/020760a0-6b99-4930-93bb-9fa494470eb5_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC17.webp', '9780987654321');
INSERT INTO `books` VALUES (27, 'C++: C++ Primer', '斯坦利·布利斯特', '这是一本经典的C++入门书籍，覆盖了C++语言的基础知识和高级特性。适合想要深入学习C++编程的读者。', 46, 'https://image.ebook.nwdnysl.site/beddf252-fd66-45ca-b3b1-ee1e6370f2ae_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC18.webp', '9780123456789');
INSERT INTO `books` VALUES (28, 'HTML & CSS: 前端开发入门', '杰瑞米·基思', '这本书介绍了前端开发中HTML和CSS的基础知识，包括网页布局、样式设计等内容。适合初学者或希望了解前端开发的读者。', 30, 'https://image.ebook.nwdnysl.site/efef321d-cac6-4813-b92f-067d7c28a1a2_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC19.webp', '9789876543210');
INSERT INTO `books` VALUES (29, '机器学习: 从入门到精通', '安德鲁·吴', '这本书介绍了机器学习领域的基本概念和算法，涵盖了监督学习、无监督学习等内容。适合对机器学习感兴趣的读者。', 55, 'https://image.ebook.nwdnysl.site/7860783e-6cdb-489e-8008-373aaae89656_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC20.webp', '9785432109876');
INSERT INTO `books` VALUES (30, '数据结构与算法: 算法导论', '托马斯·赫·科尔曼', '这本书是一部经典的计算机科学教材，介绍了数据结构与算法的基本概念和常用算法。适合计算机专业的学生和从业者阅读。', 50, 'https://image.ebook.nwdnysl.site/71f0ff89-0aa0-4523-9094-9d209e241161_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC21.webp', '9786789012345');
INSERT INTO `books` VALUES (31, '网络安全: 实战指南', '凯西·尼科尔森', '这本书介绍了网络安全领域的各种攻防技术，包括网络漏洞利用、入侵检测等内容。适合网络安全从业者和爱好者阅读。', 35, 'https://image.ebook.nwdnysl.site/3295e639-35c1-4a18-917a-e6502aa561d2_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC22.webp', '9783456789012');
INSERT INTO `books` VALUES (32, '人工智能: 原理与实践', '斯图尔特·罗素', '这本书介绍了人工智能领域的基本原理和应用实践，包括机器学习、深度学习等内容。适合对人工智能感兴趣的读者。', 43, 'https://image.ebook.nwdnysl.site/438393ad-7db9-443d-8910-dae4b413651c_OMRK1.webp', '9782345678901');
INSERT INTO `books` VALUES (33, '数据库管理: 实践指南', '迈克尔·斯通布雷克', '这本书介绍了数据库管理的基本概念和实践技巧，包括SQL语言、数据库设计等内容。适合数据库管理员和开发人员阅读。', 39, 'https://image.ebook.nwdnysl.site/a9ef2c20-c651-49fa-92aa-aed8211259e4_OMRK2.jpeg', '9784567890123');
INSERT INTO `books` VALUES (34, '移动应用开发: Android实战', '詹姆斯·威尔逊', '这本书介绍了Android移动应用开发的基础知识和实战技巧，包括界面设计、数据存储等内容。适合想要学习Android开发的读者。', 35, 'https://image.ebook.nwdnysl.site/216e494f-3cc1-4cf4-9cdd-c0fd059b690a_OMRK3.webp', '9785678901234');
INSERT INTO `books` VALUES (35, '计算机网络: 原理、技术与应用', '谢希仁', '该书是关于计算机网络的经典教材，介绍了计算机网络的基本原理、协议和应用技术，适合计算机网络相关专业的学生和工程师阅读。', 56, 'https://image.ebook.nwdnysl.site/74dfa8fe-6ef6-4a92-a30a-66fe0af0719b_OMRK4.webp', '9780123456789');
INSERT INTO `books` VALUES (36, '人机交互: 设计与实践', '本·舒奇', '这本书介绍了人机交互领域的基本概念、原理和设计方法，包括用户界面设计、可用性测试等内容，适合人机交互相关专业的学生和设计师阅读。', 49, 'https://image.ebook.nwdnysl.site/8d79268b-5dbb-435a-b579-0a87e56514e2_OMRK5.webp', '9781234567890');
INSERT INTO `books` VALUES (37, '计算机图形学: 原理与实践', '彼得·舒尔德', '这本书介绍了计算机图形学的基本原理、算法和应用实践，包括2D、3D图形的生成与处理，适合对计算机图形学感兴趣的读者。', 58, 'https://image.ebook.nwdnysl.site/3ac97689-0b34-4561-ad7b-763401900b08_OMRK6.webp', '9782345678901');
INSERT INTO `books` VALUES (38, '物联网: 原理与应用', '卡洛斯·古铁雷斯', '这本书介绍了物联网的基本原理、技术和应用场景，包括传感器网络、物联网安全等方面，适合物联网相关领域的学生和工程师阅读。', 43, 'https://image.ebook.nwdnysl.site/88f7815d-ef57-4fe5-aabb-499165cb05e0_OMRK7.webp', '9783456789012');
INSERT INTO `books` VALUES (39, '信息安全: 原理与实践', '迈克尔·古德里奇', '这本书介绍了信息安全的基本原理、攻防技术和应用实践，包括加密算法、安全协议等内容，适合信息安全专业人士阅读。', 40, 'https://image.ebook.nwdnysl.site/bd2862bf-21a2-468d-88cf-21771dbc039e_%E6%91%87%E6%9B%B3%E7%99%BE%E5%90%88%E5%8D%95%E8%A1%8C%E6%9C%AC6.webp', '9784567890123');
INSERT INTO `books` VALUES (40, '云计算: 原理与实践', '托马斯·艾里克', '这本书介绍了云计算的基本概念、架构和应用实践，包括云服务模型、虚拟化技术等内容，适合对云计算感兴趣的读者。', 50, 'https://image.ebook.nwdnysl.site/dbdc2b36-7af3-4fa3-88d7-7621260523b7_%E5%85%B3%E4%BA%8E%E8%BD%AC%E7%94%9F%E5%90%8E%E5%8F%AA%E6%9C%89%E7%81%AF%E9%87%8C%E5%8F%98%E6%88%90%E5%8F%B2%E8%8E%B1%E5%A7%86%E8%BF%99%E6%A1%A3%E4%BA%8B1.webp', '9785678901234');
INSERT INTO `books` VALUES (41, '操作系统: 原理与实践', '安德鲁·塔能鲍姆', '这本书介绍了操作系统的基本原理、设计与实现，包括进程管理、内存管理等核心概念，适合计算机科学相关专业的学生和研究者阅读。', 45, 'https://image.ebook.nwdnysl.site/ebc65e37-a887-48dc-b12a-908c3f8c0984_%E5%85%B3%E4%BA%8E%E8%BD%AC%E7%94%9F%E5%90%8E%E5%8F%AA%E6%9C%89%E7%81%AF%E9%87%8C%E5%8F%98%E6%88%90%E5%8F%B2%E8%8E%B1%E5%A7%86%E8%BF%99%E6%A1%A3%E4%BA%8B2.webp', '9786789012345');
INSERT INTO `books` VALUES (43, '软件工程: 原理与实践', '伊恩·索默维尔', '这本书介绍了软件工程的基本原理、方法和实践技巧，包括需求分析、软件设计等内容，适合软件工程师和学生阅读。', 42, 'https://image.ebook.nwdnysl.site/373da2ce-2a73-423d-835e-222fa33e9726_Sound_Euphonium.webp', '9788901234567');
INSERT INTO `books` VALUES (44, '分布式系统: 原理与实践', '马丁·克莱泽', '这本书介绍了分布式系统的基本原理、设计和实现方法，包括分布式一致性、容错机制等内容，适合分布式系统相关领域的研究者和工程师阅读。', 49, 'https://image.ebook.nwdnysl.site/59ff6862-452b-4a86-a317-50f4f4d4e59e_Sound_Euphonium_2_KV2.webp', '9789012345678');
INSERT INTO `books` VALUES (47, '響け！ユーフォニアム', '武田绫乃', '大好き', 10, 'https://image.ebook.nwdnysl.site/fdee2e74-c453-4be4-a592-7c847e5371fd_Sound_Euphonium_3_KV2.webp', '9788901234132123');
INSERT INTO `books` VALUES (52, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 19, 'https://p3.itc.cn/q_70/images03/20210817/2b97b31c09df4315a03d94f30e864ecc.jpeg', '2131');
INSERT INTO `books` VALUES (53, 'JavaScript: JavaScript的优点', '道格拉斯·克罗克福德', '一本关于JavaScript优点的书。它涵盖了函数、对象、数组等各个方面。作者深入讲解了JavaScript的核心概念，并强调了编写高效可靠代码的最佳实践。', 19, 'https://p3.itc.cn/q_70/images03/20210817/2b97b31c09df4315a03d94f30e864ecc.jpeg', '2134');

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `bid` int(11) NOT NULL COMMENT '书籍id',
  `quantity` int(10) UNSIGNED NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cidbid`(`uid`, `bid`) USING BTREE,
  INDEX `FKsa9oia6v2qv02lim3gxk2hmdq`(`bid`) USING BTREE,
  CONSTRAINT `FKn86teseb73mlpl86xh5ikp6sw` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsa9oia6v2qv02lim3gxk2hmdq` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (191, 3, 28, 1);
INSERT INTO `cart_items` VALUES (222, 2, 3, 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `bid` int(11) NOT NULL COMMENT '书籍id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKkbth5o6nwvdhphqmkn4n9mww6`(`bid`) USING BTREE,
  INDEX `FKquluhan0rqmtk5x8v3178ypd6`(`uid`) USING BTREE,
  CONSTRAINT `FKi6n2ybqnd5snukrvhmatvlv8l` FOREIGN KEY (`bid`) REFERENCES `book_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkbth5o6nwvdhphqmkn4n9mww6` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKquluhan0rqmtk5x8v3178ypd6` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (41, '123', '2024-10-22 20:57:51.364160', 3, 2);
INSERT INTO `comments` VALUES (42, '1', '2024-10-22 21:25:54.288354', 30, 2);
INSERT INTO `comments` VALUES (43, '123213', '2024-10-22 21:34:59.014094', 2, 2);

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKc1x94h50afam5fwnih7hyjqc2`(`cid`) USING BTREE,
  INDEX `FKpo6kp97hlqs4htl41xo03lpyn`(`uid`) USING BTREE,
  CONSTRAINT `FKc1x94h50afam5fwnih7hyjqc2` FOREIGN KEY (`cid`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpo6kp97hlqs4htl41xo03lpyn` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (93, 42, 2);
INSERT INTO `likes` VALUES (94, 41, 2);
INSERT INTO `likes` VALUES (97, 43, 2);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL COMMENT '订单id',
  `bid` int(11) NOT NULL COMMENT '书籍id',
  `quantity` int(10) UNSIGNED NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKin1q0xhd1x9dh98xpdpbw8h5t`(`bid`) USING BTREE,
  INDEX `FKl4ipr6s7s08pcb3klykm8sji4`(`oid`) USING BTREE,
  CONSTRAINT `FKin1q0xhd1x9dh98xpdpbw8h5t` FOREIGN KEY (`bid`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl4ipr6s7s08pcb3klykm8sji4` FOREIGN KEY (`oid`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (69, 58, 2, 1);
INSERT INTO `order_items` VALUES (70, 59, 19, 7);
INSERT INTO `order_items` VALUES (71, 60, 1, 1);
INSERT INTO `order_items` VALUES (72, 60, 3, 5);
INSERT INTO `order_items` VALUES (73, 60, 4, 4);
INSERT INTO `order_items` VALUES (74, 60, 8, 6);
INSERT INTO `order_items` VALUES (75, 60, 19, 4);
INSERT INTO `order_items` VALUES (76, 60, 20, 8);
INSERT INTO `order_items` VALUES (77, 60, 34, 4);
INSERT INTO `order_items` VALUES (78, 60, 35, 6);
INSERT INTO `order_items` VALUES (79, 61, 1, 2);
INSERT INTO `order_items` VALUES (80, 61, 2, 4);
INSERT INTO `order_items` VALUES (81, 61, 3, 4);
INSERT INTO `order_items` VALUES (82, 61, 4, 3);
INSERT INTO `order_items` VALUES (83, 61, 6, 5);
INSERT INTO `order_items` VALUES (84, 61, 7, 4);
INSERT INTO `order_items` VALUES (85, 61, 8, 3);
INSERT INTO `order_items` VALUES (86, 61, 25, 4);
INSERT INTO `order_items` VALUES (87, 61, 26, 2);
INSERT INTO `order_items` VALUES (88, 61, 27, 3);
INSERT INTO `order_items` VALUES (89, 62, 28, 5);
INSERT INTO `order_items` VALUES (90, 62, 29, 3);
INSERT INTO `order_items` VALUES (91, 62, 30, 5);
INSERT INTO `order_items` VALUES (92, 62, 31, 5);
INSERT INTO `order_items` VALUES (93, 62, 32, 3);
INSERT INTO `order_items` VALUES (94, 62, 33, 3);
INSERT INTO `order_items` VALUES (95, 62, 34, 2);
INSERT INTO `order_items` VALUES (96, 62, 35, 4);
INSERT INTO `order_items` VALUES (97, 62, 36, 4);
INSERT INTO `order_items` VALUES (98, 62, 37, 3);
INSERT INTO `order_items` VALUES (99, 63, 38, 1);
INSERT INTO `order_items` VALUES (100, 63, 39, 1);
INSERT INTO `order_items` VALUES (101, 63, 40, 1);
INSERT INTO `order_items` VALUES (102, 63, 41, 1);
INSERT INTO `order_items` VALUES (103, 63, 43, 1);
INSERT INTO `order_items` VALUES (104, 63, 44, 1);
INSERT INTO `order_items` VALUES (105, 63, 47, 1);
INSERT INTO `order_items` VALUES (106, 64, 1, 1);
INSERT INTO `order_items` VALUES (107, 64, 2, 1);
INSERT INTO `order_items` VALUES (108, 64, 3, 1);
INSERT INTO `order_items` VALUES (109, 65, 2, 1);
INSERT INTO `order_items` VALUES (110, 65, 22, 1);
INSERT INTO `order_items` VALUES (111, 65, 23, 1);
INSERT INTO `order_items` VALUES (112, 65, 43, 1);
INSERT INTO `order_items` VALUES (113, 66, 1, 1);
INSERT INTO `order_items` VALUES (114, 66, 2, 1);
INSERT INTO `order_items` VALUES (115, 66, 6, 40);
INSERT INTO `order_items` VALUES (116, 66, 8, 2);
INSERT INTO `order_items` VALUES (117, 66, 19, 2);
INSERT INTO `order_items` VALUES (118, 66, 20, 2);
INSERT INTO `order_items` VALUES (119, 67, 21, 30);
INSERT INTO `order_items` VALUES (120, 68, 1, 1);
INSERT INTO `order_items` VALUES (121, 69, 4, 1);
INSERT INTO `order_items` VALUES (122, 70, 19, 1);
INSERT INTO `order_items` VALUES (123, 71, 7, 1);
INSERT INTO `order_items` VALUES (124, 72, 21, 1);
INSERT INTO `order_items` VALUES (125, 73, 2, 1);
INSERT INTO `order_items` VALUES (126, 74, 1, 123);
INSERT INTO `order_items` VALUES (127, 75, 3, 1);
INSERT INTO `order_items` VALUES (128, 75, 6, 1);
INSERT INTO `order_items` VALUES (129, 76, 1, 1);
INSERT INTO `order_items` VALUES (131, 77, 1, 1);
INSERT INTO `order_items` VALUES (132, 78, 2, 1);
INSERT INTO `order_items` VALUES (133, 78, 8, 1);
INSERT INTO `order_items` VALUES (134, 79, 7, 1);
INSERT INTO `order_items` VALUES (135, 80, 28, 1);
INSERT INTO `order_items` VALUES (136, 81, 19, 1);
INSERT INTO `order_items` VALUES (137, 82, 20, 1);
INSERT INTO `order_items` VALUES (138, 83, 21, 1);
INSERT INTO `order_items` VALUES (139, 84, 22, 1);
INSERT INTO `order_items` VALUES (140, 85, 23, 1);
INSERT INTO `order_items` VALUES (141, 86, 1, 1);
INSERT INTO `order_items` VALUES (142, 87, 19, 1);
INSERT INTO `order_items` VALUES (143, 88, 20, 1);
INSERT INTO `order_items` VALUES (144, 89, 21, 1);
INSERT INTO `order_items` VALUES (145, 90, 1, 1);
INSERT INTO `order_items` VALUES (146, 91, 19, 1);
INSERT INTO `order_items` VALUES (147, 92, 21, 1);
INSERT INTO `order_items` VALUES (148, 93, 2, 1);
INSERT INTO `order_items` VALUES (149, 94, 19, 1);
INSERT INTO `order_items` VALUES (151, 96, 28, 1);
INSERT INTO `order_items` VALUES (152, 97, 1, 1);
INSERT INTO `order_items` VALUES (153, 98, 19, 1);
INSERT INTO `order_items` VALUES (154, 99, 2, 1);
INSERT INTO `order_items` VALUES (155, 100, 2, 1);
INSERT INTO `order_items` VALUES (156, 101, 2, 1);
INSERT INTO `order_items` VALUES (159, 104, 52, 1);
INSERT INTO `order_items` VALUES (160, 105, 1, 1);
INSERT INTO `order_items` VALUES (161, 106, 1, 1);
INSERT INTO `order_items` VALUES (162, 107, 53, 1);
INSERT INTO `order_items` VALUES (163, 108, 53, 1);
INSERT INTO `order_items` VALUES (164, 109, 1, 1);
INSERT INTO `order_items` VALUES (165, 110, 1, 1);
INSERT INTO `order_items` VALUES (166, 111, 2, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
  `receiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `create_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbdolj6vr67tqh6wgsl44mur9y`(`uid`) USING BTREE,
  CONSTRAINT `FKbdolj6vr67tqh6wgsl44mur9y` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `orders` VALUES (68, 2, '1', '1', '1', '2024-09-23 14:41:38.952575');
INSERT INTO `orders` VALUES (69, 2, '123 Main St', 'zh', '123-456-7890', '2024-09-25 21:40:17.240557');
INSERT INTO `orders` VALUES (70, 2, '123 Main St', 'zh', '123-456-7890', '2024-09-25 21:44:03.225032');
INSERT INTO `orders` VALUES (71, 2, '13', '213', '123', '2024-09-25 22:11:46.430352');
INSERT INTO `orders` VALUES (72, 2, '1', '1', '1', '2024-09-26 09:23:29.595436');
INSERT INTO `orders` VALUES (73, 2, '12', '32', '23', '2024-09-26 09:45:55.315229');
INSERT INTO `orders` VALUES (74, 2, '123', '1', '123', '2024-09-26 09:52:28.939117');
INSERT INTO `orders` VALUES (75, 2, '123', '213', '123', '2024-10-09 12:13:17.131188');
INSERT INTO `orders` VALUES (76, 2, '123 Main St', 'zh', '123-456-7890', '2024-10-09 14:27:06.167740');
INSERT INTO `orders` VALUES (77, 2, '123 Main St', 'zh', '123-456-7890', '2024-10-09 14:29:24.180229');
INSERT INTO `orders` VALUES (78, 2, '654', '213', '123', '2024-10-09 14:40:58.324359');
INSERT INTO `orders` VALUES (79, 2, '123', '123', '123', '2024-10-09 15:25:19.787754');
INSERT INTO `orders` VALUES (80, 2, '123', '123', '123', '2024-10-09 15:26:21.862587');
INSERT INTO `orders` VALUES (81, 2, '123', '213', '123', '2024-10-09 15:39:29.413244');
INSERT INTO `orders` VALUES (82, 2, '123', '123', '123', '2024-10-09 15:41:39.438315');
INSERT INTO `orders` VALUES (83, 2, '132', '123', '123', '2024-10-09 15:43:21.831033');
INSERT INTO `orders` VALUES (84, 2, '123', '123', '千万23', '2024-10-09 15:44:56.393314');
INSERT INTO `orders` VALUES (85, 2, '123123', '123', '123', '2024-10-09 15:48:02.935501');
INSERT INTO `orders` VALUES (86, 2, '123', '123', '123', '2024-10-09 15:51:06.232590');
INSERT INTO `orders` VALUES (87, 2, '123', '123', '123', '2024-10-09 16:00:56.452048');
INSERT INTO `orders` VALUES (88, 2, '123', '123', '123', '2024-10-09 16:06:23.690696');
INSERT INTO `orders` VALUES (89, 2, '1232', '123', '123', '2024-10-09 16:11:46.116819');
INSERT INTO `orders` VALUES (90, 2, '123', '123', '123', '2024-10-09 16:12:55.201005');
INSERT INTO `orders` VALUES (91, 2, '234', '123', '234', '2024-10-09 16:13:53.633568');
INSERT INTO `orders` VALUES (92, 2, '123', '123', '123', '2024-10-09 16:32:45.962143');
INSERT INTO `orders` VALUES (93, 2, '123', '123', '123', '2024-10-09 08:41:53.689337');
INSERT INTO `orders` VALUES (94, 2, '123', '123', '123', '2024-10-09 09:12:55.521268');
INSERT INTO `orders` VALUES (96, 2, '123', '123', '213', '2024-10-15 16:04:47.756200');
INSERT INTO `orders` VALUES (97, 2, '1', '1', '1', '2024-10-16 15:55:50.253333');
INSERT INTO `orders` VALUES (98, 2, '1', '1', '1', '2024-10-16 15:58:05.024099');
INSERT INTO `orders` VALUES (99, 2, '1', '1', '1', '2024-10-16 16:00:49.088538');
INSERT INTO `orders` VALUES (100, 5, '3', '3', '3', '2024-10-16 16:01:21.573803');
INSERT INTO `orders` VALUES (101, 2, '123 Main St', 'zh', '123-456-7890', '2024-10-16 16:39:34.005154');
INSERT INTO `orders` VALUES (104, 2, '123 Main St', 'zh', '123-456-7890', '2024-10-22 20:45:54.296174');
INSERT INTO `orders` VALUES (105, 2, '123', '123', '123', '2024-10-22 21:27:28.455381');
INSERT INTO `orders` VALUES (106, 2, '123', '123', '123', '2024-10-22 21:29:46.982767');
INSERT INTO `orders` VALUES (107, 2, '123 Main St', 'zh', '123-456-7890', '2024-10-22 21:31:43.139379');
INSERT INTO `orders` VALUES (108, 2, '123 Main St', 'zh', '123-456-7890', '2024-10-22 21:32:28.168330');
INSERT INTO `orders` VALUES (109, 2, '123', '123', '123', '2024-10-22 21:33:57.583762');
INSERT INTO `orders` VALUES (110, 2, '1', '11', '1', '2024-10-22 21:34:47.826055');
INSERT INTO `orders` VALUES (111, 2, '1', '1', '1', '2024-10-22 22:27:35.140360');

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `cid` int(11) NOT NULL COMMENT '评论id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbq9kgpy1ldyjko15n0r7bf157`(`cid`) USING BTREE,
  INDEX `FKt202gd81iqyu8dkc3jteqa2q8`(`uid`) USING BTREE,
  CONSTRAINT `FKbq9kgpy1ldyjko15n0r7bf157` FOREIGN KEY (`cid`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt202gd81iqyu8dkc3jteqa2q8` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of replies
-- ----------------------------
INSERT INTO `replies` VALUES (43, '123', '2024-10-22 21:27:11.094708', 41, 2);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `enabled` bit(1) NOT NULL COMMENT '是否禁用',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像url',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `level` int(10) UNSIGNED NOT NULL COMMENT '等级',
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `about_me` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'admin', b'1', 'admin', 'https://image.ebook.nwdnysl.site/8edaabd2-4d43-4429-b656-d71f4a4e3006_avatar.png', 'zh13588888888@sjtu.edu.cn', 1, '13588888888123', '受け継がれてく想い、先を行くひとの願い！\n');
INSERT INTO `users` VALUES (3, 'user', b'1', 'user', '\\1.jpg', '', 1, '', '');
INSERT INTO `users` VALUES (5, 'zh', b'1', 'user', 'https://image.ebook.nwdnysl.site/9f18fc7a-cd4b-4c73-ac22-a603c5eb605d_jbwe03qaod31vzuyhy-1722916537706%E7%99%BB%E5%BD%95.png', '', 123, '', '');
INSERT INTO `users` VALUES (6, '禁止！', b'0', 'user', '123', '123', 13, '13', '意味は分かりませんわ');
INSERT INTO `users` VALUES (13, 'ReCoda', b'1', 'user', 'https://img.moegirl.org.cn/common/b/b7/Transparent_Akkarin.jpg', '123@213', 1, '', '後悔も　喜びも　全部歌になれ\nマリーゴールド');
INSERT INTO `users` VALUES (14, 'new', b'1', 'user', 'https://img.moegirl.org.cn/common/b/b7/Transparent_Akkarin.jpg', 'langchain4test@outlook.com', 1, '', '');

SET FOREIGN_KEY_CHECKS = 1;
