/*
 Navicat Premium Data Transfer

 Source Server         : 2333
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : localhost:3306
 Source Schema         : db_oa

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 22/12/2022 14:50:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_contact
-- ----------------------------
DROP TABLE IF EXISTS `tb_contact`;
CREATE TABLE `tb_contact`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '联系人主键',
  `user_id` int NULL DEFAULT NULL COMMENT '所属用户主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信号',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所在公司名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通信地址',
  `post_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `contact_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `contact_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_contact
-- ----------------------------
INSERT INTO `tb_contact` VALUES (1, 1, '张三', '男', '13588888888', '1@qq.com', '11111111', 'wxxxx', 'cccc', '66666', '105650');
INSERT INTO `tb_contact` VALUES (2, 1, '11', '男', '11111111111', '2@qq.com', '22222222', 'xxxxxx', 'cccc', '22222222', '11111');
INSERT INTO `tb_contact` VALUES (4, 1, '111', '男', '11111111111', NULL, NULL, '1', '1', '1', '11111');
INSERT INTO `tb_contact` VALUES (6, 5, '朱宇宁', '男', '12916528608', 'yuning7@outlook.com', '588381744', 'bg3nlOUb9Y', '晓明有限责任公司', '574 环区南街二巷', '94438');
INSERT INTO `tb_contact` VALUES (7, 11, '潘杰宏', '男', '11970513174', 'jip@outlook.com', '3795456789', 'qTZMNwItE4', '姜記有限责任公司', '75 天河区大信商圈大信南路', '86530');
INSERT INTO `tb_contact` VALUES (8, 14, '武晓明', '男', '14354499608', 'wx6@outlook.com', '991393710', 'T1KWofRcMa', '宇宁有限责任公司', '230 锦江区人民南路四段', '82397');
INSERT INTO `tb_contact` VALUES (9, 13, '袁睿', '男', '12750579513', 'ruiyua@mail.com', '814850526', '1tjeZMi9sE', '谢記工业有限责任公司', '851 锦江区红星路三段', '02902');
INSERT INTO `tb_contact` VALUES (10, 7, '莫安琪', '女', '12994544549', 'moanqi411@gmail.com', '9644354570', 'bDCGuVJ9lG', '岚电脑有限责任公司', '371 越秀区中山二路', '50962');
INSERT INTO `tb_contact` VALUES (12, 8, '朱岚', '女', '12820615352', 'zhulan@icloud.com', '8387026528', 'axeDmRqRXp', '璐有限责任公司', '635 朝阳区三里屯路', '04547');
INSERT INTO `tb_contact` VALUES (14, 6, '孔岚', '女', '11023969443', 'konglan5@icloud.com', '6072264491', 'UKUdU1lBvH', '苏記工程有限责任公司', '150 房山区岳琉路', '51222');
INSERT INTO `tb_contact` VALUES (15, 10, '阎致远', '男', '17581100835', 'yanz@icloud.com', '855108161', 'EPcsnXO16f', '子异有限责任公司', '225 徐汇区虹桥路', '97943');
INSERT INTO `tb_contact` VALUES (16, 11, '袁震南', '男', '19048000693', 'zhennanyuan@yahoo.com', '9713224551', '0qULwAAm2Q', '苏記顾问有限责任公司', '526 越秀区中山二路', '62962');
INSERT INTO `tb_contact` VALUES (18, 6, '韩子韬', '男', '13873652232', 'hanz10@icloud.com', '9207893307', 'jAGaHGESAc', '高記有限责任公司', '450 东城区东单王府井东街', '92069');
INSERT INTO `tb_contact` VALUES (19, 6, '陶璐', '女', '16161063674', 'luta6@icloud.com', '656443051', 'NYgzsVhJ0f', '子异有限责任公司', '581 房山区岳琉路', '44723');
INSERT INTO `tb_contact` VALUES (20, 14, '萧嘉伦', '男', '17036415425', 'xiaojialu@gmail.com', '841078772', 'cz3yFOf7Jo', '魏电讯有限责任公司', '547 白云区机场路棠苑街五巷', '65178');
INSERT INTO `tb_contact` VALUES (21, 7, '汤岚', '女', '14967304523', 'lanta@gmail.com', '559679402', 'UjDZ0dkSrP', '严有限责任公司', '712 朝阳区三里屯路', '86178');
INSERT INTO `tb_contact` VALUES (22, 13, '朱子韬', '男', '16178325163', 'zhu2@outlook.com', '9273856625', 'pVy5cDbuxV', '子异有限责任公司', '26 罗湖区蔡屋围深南东路', '46466');
INSERT INTO `tb_contact` VALUES (23, 12, '宋致远', '男', '13743133548', 'zhiyuan8@yahoo.com', '864013728', 'yoMssLEiVC', '震南工程有限责任公司', '664 越秀区中山二路', '41251');
INSERT INTO `tb_contact` VALUES (26, 10, '陶睿', '男', '15999882371', 'ruit@icloud.com', '1824224883', '2xnMnxFUjw', '致远系统有限责任公司', '286 罗湖区清水河一路', '94688');
INSERT INTO `tb_contact` VALUES (27, 12, '向晓明', '男', '10430733118', 'xiaxiaoming@gmail.com', '3537053022', '2CK62cgmU3', '任有限责任公司', '657 东泰五街', '77068');
INSERT INTO `tb_contact` VALUES (29, 1, '杨詩涵', '女', '18636834014', 'yang7@gmail.com', '5910200554', 'CrbGHiEVzU', '杰宏有限责任公司', '686 锦江区人民南路四段', '28334');
INSERT INTO `tb_contact` VALUES (30, 12, '蒋杰宏', '男', '19445130204', 'jiang1956@gmail.com', '6595125076', '493l0n6eNt', '嘉伦有限责任公司', '748 海珠区江南西路', '32285');
INSERT INTO `tb_contact` VALUES (32, 9, '江云熙', '男', '17698884272', 'yunxij@gmail.com', '223200107', 'jXb7E4Lqbq', '金发展贸易有限责任公司', '409 坑美十五巷', '98195');
INSERT INTO `tb_contact` VALUES (33, 14, '龚岚', '女', '13458055098', 'gonglan1212@icloud.com', '618975635', 'TxLE1s4yDo', '袁有限责任公司', '664 珊瑚路', '22712');
INSERT INTO `tb_contact` VALUES (34, 9, '汤嘉伦', '男', '12184400806', 'jialut@outlook.com', '174743237', 'jtM8MCxhEY', '尹有限责任公司', '978 成华区玉双路6号', '10142');
INSERT INTO `tb_contact` VALUES (35, 5, '严睿', '男', '19845298613', 'yan1@icloud.com', '5778558547', 'vu12yMhTEP', '子韬有限责任公司', '666 延庆区028县道', '72725');
INSERT INTO `tb_contact` VALUES (36, 10, '朱致远', '男', '18826385909', 'zhzhu331@hotmail.com', '485341832', 'G6gDW8s13x', '高記有限责任公司', '268 福田区深南大道', '04207');
INSERT INTO `tb_contact` VALUES (37, 3, '袁秀英', '女', '19137016905', 'yuanxiuying20@gmail.com', '516159934', 'vw1T85pBHM', '叶記有限责任公司', '84 罗湖区田贝一路', '56951');
INSERT INTO `tb_contact` VALUES (38, 7, '钱嘉伦', '男', '19290724470', 'jialun8@mail.com', '1150121570', 'Ug5NSOz9wE', '程发展贸易有限责任公司', '468 京华商圈华夏街', '19690');
INSERT INTO `tb_contact` VALUES (40, 3, '谢睿', '男', '10814112561', 'rui1202@hotmail.com', '381692174', 'Qah6ALb7hF', '韩記电子有限责任公司', '448 龙岗区学园一巷', '31747');
INSERT INTO `tb_contact` VALUES (41, 9, '袁睿', '男', '11350133702', 'rui1@mail.com', '4863904919', '4gt5mSofyU', '嘉伦通讯有限责任公司', '915 天河区大信商圈大信南路', '04564');
INSERT INTO `tb_contact` VALUES (43, 12, '石致远', '男', '19351402968', 'shiz@mail.com', '2421512991', 'hEa5GEnIWr', '蒋記有限责任公司', '598 福田区深南大道', '16861');
INSERT INTO `tb_contact` VALUES (44, 11, '吕晓明', '男', '16952954307', 'luxia@yahoo.com', '8749835091', 'xHYjaUMPOB', '邓玩具有限责任公司', '822 龙岗区布吉镇西环路', '27757');
INSERT INTO `tb_contact` VALUES (45, 12, '梁云熙', '男', '11673290388', 'liayunxi@icloud.com', '884128107', 'SJVZVXFcCB', '子韬玩具有限责任公司', '912 乐丰六路', '27758');
INSERT INTO `tb_contact` VALUES (47, 10, '何云熙', '男', '17925814932', 'hyun1117@outlook.com', '900062328', 'xLAoIEp7So', '贺記技术有限责任公司', '610 白云区机场路棠苑街五巷', '40818');
INSERT INTO `tb_contact` VALUES (48, 9, '陆宇宁', '男', '13927079166', 'luyuning46@icloud.com', '757248998', 'ofeMRd2t5x', '睿工程有限责任公司', '105 紫马岭商圈中山五路', '64985');
INSERT INTO `tb_contact` VALUES (50, 6, '邹云熙', '男', '17608346805', 'zou11@gmail.com', '4433632250', 'YgF4p1r3wh', '嘉伦物业代理有限责任公司', '390 东城区东单王府井东街', '61410');
INSERT INTO `tb_contact` VALUES (52, 5, '赵詩涵', '女', '10862250742', 'shihan41@icloud.com', '2164167814', 'ZZYJVi7PB5', '云熙食品有限责任公司', '708 海淀区清河中街68号', '89752');
INSERT INTO `tb_contact` VALUES (53, 3, '朱震南', '男', '17902121571', 'zz1113@icloud.com', '2736260698', 'caee9yDCBV', '璐有限责任公司', '714 环区南街二巷', '70211');
INSERT INTO `tb_contact` VALUES (54, 6, '蔡子异', '男', '18618032822', 'caz1963@icloud.com', '4418171934', 'LpX9TC6wJc', '周記顾问有限责任公司', '253 延庆区028县道', '72892');
INSERT INTO `tb_contact` VALUES (55, 9, '侯杰宏', '男', '10064069373', 'houjieho10@icloud.com', '629478926', 'fAZ004jwYz', '云熙制药有限责任公司', '723 海淀区清河中街68号', '22460');
INSERT INTO `tb_contact` VALUES (56, 5, '彭安琪', '女', '19178255218', 'penga5@yahoo.com', '4071414434', 'i8Abrqg0dp', '薛系统有限责任公司', '浦东新区橄榄路396号', '67499');
INSERT INTO `tb_contact` VALUES (57, 6, '熊杰宏', '男', '14226066059', 'jiexiong@outlook.com', '1905725049', 'M9hqdBNOVI', '刘記有限责任公司', '875 徐汇区虹桥路', '97447');
INSERT INTO `tb_contact` VALUES (58, 1, '姚杰宏', '男', '16653844856', 'yajie5@outlook.com', '5763221923', 'JLaolXweMh', '石工业有限责任公司', '723 锦江区人民南路四段', '43975');
INSERT INTO `tb_contact` VALUES (59, 1, '石璐', '女', '17378921301', 'lus113@gmail.com', '688884094', 'Rc4Vqfd7TZ', '刘有限责任公司', '40 白云区机场路棠苑街五巷', '53654');
INSERT INTO `tb_contact` VALUES (60, 1, '尹致远', '男', '15575113487', 'zhiyuan4@outlook.com', '9103078080', 'q63jd79P4L', '赵制药有限责任公司', '416 罗湖区田贝一路', '45560');
INSERT INTO `tb_contact` VALUES (62, 13, '叶安琪', '女', '13414410026', 'anqi1201@hotmail.com', '882852651', 'YuIpVnJxdF', '熊发展贸易有限责任公司', '859 福田区景田东一街', '08598');
INSERT INTO `tb_contact` VALUES (63, 5, '邹安琪', '女', '19185904730', 'zoanqi1989@outlook.com', '2407060386', '5DIUayrlXR', '子韬工程有限责任公司', '23 黄浦区淮海中路', '15494');
INSERT INTO `tb_contact` VALUES (64, 11, '崔震南', '男', '10092140701', 'zcu8@icloud.com', '801690554', 'Weq5PN9fmA', '宇宁有限责任公司', '912 乐丰六路', '09621');
INSERT INTO `tb_contact` VALUES (65, 12, '任嘉伦', '男', '11599106834', 'jialunren9@icloud.com', '7355481539', 'OVWSrSohZA', '姚記通讯有限责任公司', '353 罗湖区清水河一路', '92204');
INSERT INTO `tb_contact` VALUES (66, 6, '贺岚', '女', '10695743451', 'lhe@mail.com', '966107613', 'AoohD8iQu4', '晓明工业有限责任公司', '25 越秀区中山二路', '86674');
INSERT INTO `tb_contact` VALUES (67, 12, '尹璐', '女', '10201079154', 'lu2010@icloud.com', '133617131', 'JoY4Rh1bWQ', '云熙玩具有限责任公司', '995 白云区小坪东路', '90760');
INSERT INTO `tb_contact` VALUES (68, 6, '常晓明', '男', '14790978622', 'changxiaoming@icloud.com', '360349164', 'wA4KZUOWhi', '岚有限责任公司', '浦东新区健祥路673号', '52826');
INSERT INTO `tb_contact` VALUES (70, 8, '姚云熙', '男', '13121758616', 'yaoyunxi903@gmail.com', '943350419', '0SlzMt7abH', '致远有限责任公司', '837 東城区東直門內大街', '54074');
INSERT INTO `tb_contact` VALUES (71, 7, '郑晓明', '男', '16364248287', 'xiaoming502@gmail.com', '2937615949', 'PwL3zC2Xge', '宇宁通讯有限责任公司', '成华区双庆路590号', '15798');
INSERT INTO `tb_contact` VALUES (72, 12, '向睿', '男', '11354247490', 'xiangrui5@yahoo.com', '5115881391', 'q3va904aDu', '尹記电讯有限责任公司', '814 越秀区中山二路', '57165');
INSERT INTO `tb_contact` VALUES (73, 5, '向晓明', '男', '13291840467', 'xiangxia@outlook.com', '8399042510', 'pQuG3ZEWOE', '晓明系统有限责任公司', '898 东泰五街', '95321');
INSERT INTO `tb_contact` VALUES (74, 1, '丁子异', '男', '17940891729', 'ziyiding@yahoo.com', '8016908683', 'qglbhAfaUs', '岚有限责任公司', '85 京华商圈华夏街', '97259');
INSERT INTO `tb_contact` VALUES (76, 7, '贺嘉伦', '男', '19067252978', 'heji@mail.com', '319210505', 'c9M0Vpb3zB', '胡記食品有限责任公司', '105 福田区深南大道', '41566');
INSERT INTO `tb_contact` VALUES (78, 8, '常秀英', '女', '13585626657', 'xiuyingch@yahoo.com', '2871544886', 'jyuYHsudmW', '杰宏有限责任公司', '114 西城区复兴门内大街', '01023');
INSERT INTO `tb_contact` VALUES (79, 12, '梁詩涵', '女', '10925534454', 'liangs1@icloud.com', '6258331252', 'ibQ4EMrZBe', '安琪电子有限责任公司', '343 锦江区人民南路四段', '28189');
INSERT INTO `tb_contact` VALUES (80, 3, '谢子异', '男', '11293497104', 'zx8@icloud.com', '352249502', 'QndtDSzP3l', '邹記有限责任公司', '916 朝阳区三里屯路', '55624');
INSERT INTO `tb_contact` VALUES (81, 14, '谢震南', '男', '15379620071', 'zhennanxi@mail.com', '3057329096', 'PtEWXsTcPR', '晓明电脑有限责任公司', '7 罗湖区田贝一路', '27120');
INSERT INTO `tb_contact` VALUES (82, 9, '冯震南', '男', '19774247944', 'zhenfeng@hotmail.com', '9232309057', 'xIxQEABOei', '杰宏工业有限责任公司', '成华区二仙桥东三路137号', '18794');
INSERT INTO `tb_contact` VALUES (83, 12, '黄震南', '男', '18033276358', 'huzhen1123@hotmail.com', '839103981', 'bR9Y5FIT6p', '尹系统有限责任公司', '904 成华区玉双路6号', '28109');
INSERT INTO `tb_contact` VALUES (84, 7, '莫宇宁', '男', '10792186048', 'yuningmo@hotmail.com', '9087253873', 'OVbjenkoQ2', '吕制药有限责任公司', '402 天河区大信商圈大信南路', '46153');
INSERT INTO `tb_contact` VALUES (86, 14, '梁岚', '女', '15234512318', 'lianglan1231@hotmail.com', '8935153180', 'xQW8mJePx7', '岚制药有限责任公司', '589 朝阳区三里屯路', '94133');
INSERT INTO `tb_contact` VALUES (88, 10, '江岚', '女', '13197278815', 'jiala@outlook.com', '1325646070', 'UO7cVJIEVE', '袁記贸易有限责任公司', '651 朝阳区三里屯路', '27191');
INSERT INTO `tb_contact` VALUES (89, 14, '朱子韬', '男', '12334077872', 'zhuz1127@yahoo.com', '3380730810', 'JhgtY7hlA0', '吴有限责任公司', '297 徐汇区虹桥路', '16017');
INSERT INTO `tb_contact` VALUES (90, 12, '胡安琪', '女', '11354776764', 'anqihu3@icloud.com', '487785568', 'lIhTtFMjMB', '钟記通讯有限责任公司', '275 延庆区028县道', '90577');
INSERT INTO `tb_contact` VALUES (91, 14, '沈致远', '男', '14587222278', 'zhiyuanshe9@icloud.com', '418173233', 'AOwWnl8Ium', '孙記有限责任公司', '658 成华区玉双路6号', '28764');
INSERT INTO `tb_contact` VALUES (93, 9, '郝秀英', '女', '17866935542', 'xiuyinghao@icloud.com', '8919764207', 'hit9KuV73V', '震南工程有限责任公司', '321 龙岗区布吉镇西环路', '98132');
INSERT INTO `tb_contact` VALUES (94, 5, '冯詩涵', '女', '12057552482', 'fengs@mail.com', '933496467', 'Hugx8bUUNP', '彭电子有限责任公司', '762 环区南街二巷', '52962');
INSERT INTO `tb_contact` VALUES (95, 14, '孙岚', '女', '14994882435', 'slan@icloud.com', '2817065356', 'jHsflifOXd', '震南有限责任公司', '855 海淀区清河中街68号', '79227');
INSERT INTO `tb_contact` VALUES (96, 5, '董睿', '男', '10167880660', 'ruidong@outlook.com', '772322230', 'QZMLxOTy5t', '沈有限责任公司', '成华区双庆路835号', '54560');
INSERT INTO `tb_contact` VALUES (97, 14, '史震南', '男', '15944771326', 'zhenshi417@gmail.com', '5255978333', 'VQ9GWkXPO7', '叶有限责任公司', '197 紫马岭商圈中山五路', '92900');
INSERT INTO `tb_contact` VALUES (98, 6, '黎云熙', '男', '13901082451', 'liy72@mail.com', '182347097', 'wJjw4zmI6e', '侯玩具有限责任公司', '157 福田区景田东一街', '93141');
INSERT INTO `tb_contact` VALUES (100, 7, '郭震南', '男', '14858036323', 'guo74@gmail.com', '1472029866', '0nKF9cKV5y', '秀英工业有限责任公司', '407 锦江区人民南路四段', '74990');
INSERT INTO `tb_contact` VALUES (101, 5, '郭嘉伦', '男', '12712388230', 'jialuguo7@gmail.com', '688610043', 'RJXPaQBAcS', '高記有限责任公司', '626 龙岗区学园一巷', '07489');
INSERT INTO `tb_contact` VALUES (102, 1, '江子异', '男', '19274349010', 'jiziyi112@gmail.com', '3200127152', 'RHJbAzK2xu', '梁記技术有限责任公司', '549 乐丰六路', '01430');
INSERT INTO `tb_contact` VALUES (103, 14, '谢詩涵', '女', '18283795312', 'xie94@gmail.com', '884179744', '77PJoZpsmt', '任发展贸易有限责任公司', '150 天河区天河路', '36145');
INSERT INTO `tb_contact` VALUES (104, 1, '林震南', '男', '11203781005', 'zhennanl3@gmail.com', '7154993662', 'esPQwsqLaG', '安琪物业代理有限责任公司', '33 环区南街二巷', '17580');
INSERT INTO `tb_contact` VALUES (105, 12, '蒋安琪', '女', '15653402495', 'anqi8@outlook.com', '529985552', 'AqFjY9tMUk', '子韬贸易有限责任公司', '585 房山区岳琉路', '54110');
INSERT INTO `tb_contact` VALUES (106, 9, '吕子异', '男', '13310655713', 'ziyilu@icloud.com', '791810927', 'USoj3iTu8G', '谢記玩具有限责任公司', '269 京华商圈华夏街', '66149');
INSERT INTO `tb_contact` VALUES (107, 13, '马安琪', '女', '15881424333', 'anqima7@yahoo.com', '131584874', 'FeM5mqMrPl', '罗記有限责任公司', '945 罗湖区蔡屋围深南东路', '77984');
INSERT INTO `tb_contact` VALUES (108, 8, '苏子韬', '男', '15947675378', 'suzitao@outlook.com', '767527359', 'Ze5HIRUMXn', '震南发展贸易有限责任公司', '成华区二仙桥东三路334号', '97980');
INSERT INTO `tb_contact` VALUES (110, 9, '范詩涵', '女', '14141461068', 'shihanfan@hotmail.com', '6916408213', 'AgqrKOMfOH', '杰宏工程有限责任公司', '835 海珠区江南西路', '82278');
INSERT INTO `tb_contact` VALUES (111, 5, '程嘉伦', '男', '12708693235', 'cheng621@gmail.com', '2603767690', 'P7B1Yjp9NF', '龙記有限责任公司', '729 西城区西長安街', '40761');
INSERT INTO `tb_contact` VALUES (112, 1, '何秀英', '女', '19101654740', 'he1017@yahoo.com', '890965633', 'h1ypf7wLDn', '震南有限责任公司', '640 海珠区江南西路', '82708');
INSERT INTO `tb_contact` VALUES (113, 11, '何安琪', '女', '11306922560', 'anqihe6@gmail.com', '7887020718', 'WpH1NUjWm7', '子韬电子有限责任公司', '993 朝阳区三里屯路', '02914');
INSERT INTO `tb_contact` VALUES (114, 13, '郭岚', '女', '16929781202', 'languo@icloud.com', '8859248908', 'PVB3klHXNZ', '孟記制药有限责任公司', '308 锦江区人民南路四段', '70267');
INSERT INTO `tb_contact` VALUES (116, 7, '高睿', '男', '16001867255', 'gaorui@icloud.com', '1951776401', 'ycsaoypDth', '廖記有限责任公司', '815 罗湖区清水河一路', '32752');
INSERT INTO `tb_contact` VALUES (117, 3, '崔致远', '男', '13914209322', 'zhiyucui@yahoo.com', '6288110576', 'TkvQHgXKhz', '杰宏玩具有限责任公司', '780 罗湖区田贝一路', '40086');
INSERT INTO `tb_contact` VALUES (118, 11, '萧云熙', '男', '17382033421', 'yunxi6@icloud.com', '3387738581', 'FoxjanB2gJ', '叶記发展贸易有限责任公司', '391 乐丰六路', '97688');
INSERT INTO `tb_contact` VALUES (119, 3, '韦晓明', '男', '16243973808', 'xwei@yahoo.com', '859528635', 'koP5rTW5p6', '周記有限责任公司', '933 珊瑚路', '78390');
INSERT INTO `tb_contact` VALUES (120, 9, '吴嘉伦', '男', '18239586013', 'jialun1207@hotmail.com', '752282616', 'NlwA4xXQqV', '顾記电讯有限责任公司', '212 乐丰六路', '28296');
INSERT INTO `tb_contact` VALUES (121, 6, '徐晓明', '男', '15190359012', 'xixu@yahoo.com', '288043219', 'GmKhR9zEE1', '嘉伦发展贸易有限责任公司', '233 西城区复兴门内大街', '60595');
INSERT INTO `tb_contact` VALUES (122, 12, '徐嘉伦', '男', '19901363515', 'jialunxu@gmail.com', '8700642875', 'McldV56k9T', '子韬有限责任公司', '368 成华区玉双路6号', '70300');
INSERT INTO `tb_contact` VALUES (123, 10, '陆睿', '男', '13647172370', 'ruilu@hotmail.com', '8466365597', 'bohtXiQoO5', '云熙工程有限责任公司', '400 京华商圈华夏街', '59183');
INSERT INTO `tb_contact` VALUES (124, 11, '莫秀英', '女', '15346673220', 'mo1@icloud.com', '918158862', 'Nn3L4NbLTt', '彭記有限责任公司', '766 白云区小坪东路', '99811');
INSERT INTO `tb_contact` VALUES (125, 11, '沈岚', '女', '10148272711', 'lanshe@outlook.com', '1410901230', '6C4YbCiYu8', '黎有限责任公司', '335 京华商圈华夏街', '36548');
INSERT INTO `tb_contact` VALUES (126, 8, '曹詩涵', '女', '13834745387', 'shihacao67@hotmail.com', '2328163421', 'amTkFIyV6w', '邹記电子有限责任公司', '成华区双庆路484号', '72502');
INSERT INTO `tb_contact` VALUES (127, 3, '彭致远', '男', '14675446230', 'penzh@mail.com', '589118870', 'uHIUKRV9cI', '田有限责任公司', '347 东城区东单王府井东街', '90179');
INSERT INTO `tb_contact` VALUES (128, 11, '龙岚', '女', '18682862686', 'lol@gmail.com', '4159199560', 'qXnndCOOf1', '杰宏有限责任公司', '699 黄浦区淮海中路', '24711');
INSERT INTO `tb_contact` VALUES (129, 6, '谢安琪', '女', '13548347360', 'anqx@outlook.com', '868659938', 'lu1FRj9Mu2', '杜記制药有限责任公司', '浦东新区橄榄路504号', '77629');
INSERT INTO `tb_contact` VALUES (130, 7, '汪子异', '男', '11086678442', 'ziyi9@yahoo.com', '6526190022', 'yudwqwGZv7', '莫有限责任公司', '758 罗湖区田贝一路', '57187');
INSERT INTO `tb_contact` VALUES (131, 1, '赵璐', '女', '11440034446', 'luzhao7@gmail.com', '8640106172', 'vfZhuOQmDA', '安琪贸易有限责任公司', '117 福田区景田东一街', '84897');
INSERT INTO `tb_contact` VALUES (132, 11, '石致远', '男', '13139379553', 'shizhi@outlook.com', '5006025215', 'l2UzDKNSBD', '常有限责任公司', '46 天河区大信商圈大信南路', '96773');
INSERT INTO `tb_contact` VALUES (133, 3, '戴杰宏', '男', '19452845877', 'jiehong506@hotmail.com', '1839245879', 'bAk59GgUif', '子韬有限责任公司', '902 白云区小坪东路', '61481');
INSERT INTO `tb_contact` VALUES (135, 6, '潘晓明', '男', '11353022010', 'xpan6@mail.com', '975787707', 'WsqOhCB6ij', '郭有限责任公司', '浦东新区健祥路444号', '92658');
INSERT INTO `tb_contact` VALUES (136, 11, '朱震南', '男', '16375846478', 'zhz@icloud.com', '471224082', 'WPqBW2IHPX', '震南有限责任公司', '475 紫马岭商圈中山五路', '40262');
INSERT INTO `tb_contact` VALUES (138, 7, '冯睿', '男', '18451102353', 'ruf@gmail.com', '1396602673', 'HcnNvevKZb', '睿有限责任公司', '895 白云区机场路棠苑街五巷', '97388');
INSERT INTO `tb_contact` VALUES (139, 5, '钟晓明', '男', '14395405734', 'xiaomingz@yahoo.com', '1900795719', 'vhRvNRVRIs', '秦記有限责任公司', '144 天河区天河路', '51262');
INSERT INTO `tb_contact` VALUES (140, 14, '陆嘉伦', '男', '14563796186', 'lujialun1002@mail.com', '3854046919', 'rnGDvdLoYh', '曹系统有限责任公司', '308 房山区岳琉路', '13338');
INSERT INTO `tb_contact` VALUES (142, 12, '侯震南', '男', '14856130145', 'hozhennan@gmail.com', '9616166201', 'HdKa7gy3LJ', '子韬技术有限责任公司', '519 西城区西長安街', '70730');
INSERT INTO `tb_contact` VALUES (143, 8, '任詩涵', '女', '10634775689', 'shihr@outlook.com', '6958418563', 'Wt8E94e2ar', '韩有限责任公司', '461 天河区天河路', '51217');
INSERT INTO `tb_contact` VALUES (145, 12, '于宇宁', '男', '19049648970', 'yuninyu115@gmail.com', '1357977652', 'YIfW0knfyQ', '邓有限责任公司', '930 环区南街二巷', '61330');
INSERT INTO `tb_contact` VALUES (146, 8, '莫子韬', '男', '13697471386', 'mz46@gmail.com', '390017170', 'S2riPOUjrD', '詩涵有限责任公司', '399 東城区東直門內大街', '70885');
INSERT INTO `tb_contact` VALUES (147, 3, '赵子韬', '男', '17741510818', 'zhaoz41@hotmail.com', '4443643654', 'xldYJGSOEl', '杰宏有限责任公司', '427 天河区天河路', '93875');
INSERT INTO `tb_contact` VALUES (148, 1, '金杰宏', '男', '10914531706', 'jiehongjin@gmail.com', '529471451', 'yKXiyDwgd3', '秀英制药有限责任公司', '959 越秀区中山二路', '55546');
INSERT INTO `tb_contact` VALUES (149, 3, '潘岚', '女', '17579851614', 'panlan@icloud.com', '122088045', 'MefheCYi3y', '龚贸易有限责任公司', '183 房山区岳琉路', '24674');
INSERT INTO `tb_contact` VALUES (151, 14, '史云熙', '男', '19987832096', 'yunxishi@yahoo.com', '862635906', 'NuwU7Mutr4', '宇宁玩具有限责任公司', '浦东新区健祥路936号', '95988');
INSERT INTO `tb_contact` VALUES (152, 11, '董岚', '女', '18516096574', 'dolan@hotmail.com', '3771693077', 'O7KBUPp83U', '韩記电讯有限责任公司', '362 京华商圈华夏街', '25465');
INSERT INTO `tb_contact` VALUES (153, 7, '张杰宏', '男', '10324447211', 'zhangjieho10@mail.com', '7523135266', '4iTj8DfqAT', '龚記有限责任公司', '227 罗湖区蔡屋围深南东路', '97280');
INSERT INTO `tb_contact` VALUES (155, 14, '吴致远', '男', '18740775671', 'zhiwu6@yahoo.com', '994114240', 'ylJzkVJrpl', '丁記发展贸易有限责任公司', '539 朝阳区三里屯路', '10843');
INSERT INTO `tb_contact` VALUES (157, 3, '苏子韬', '男', '19920107618', 'suzitao@outlook.com', '110256802', '80TIhrDHj5', '彭記有限责任公司', '闵行区宾川路50号', '45151');
INSERT INTO `tb_contact` VALUES (158, 12, '刘子韬', '男', '19446062460', 'zitao11@gmail.com', '784807961', 'q6Kk1EC4Jf', '罗記玩具有限责任公司', '230 延庆区028县道', '23664');
INSERT INTO `tb_contact` VALUES (160, 1, '石睿', '男', '18139026779', 'sru@mail.com', '331125043', 'KbwJrDMcZx', '秀英有限责任公司', '405 紫马岭商圈中山五路', '09057');
INSERT INTO `tb_contact` VALUES (162, 3, '夏嘉伦', '男', '16477253084', 'xijialu104@mail.com', '1884314877', 'iSNAxxNfrb', '睿有限责任公司', '553 东城区东单王府井东街', '14657');
INSERT INTO `tb_contact` VALUES (165, 11, '侯嘉伦', '男', '18563780344', 'jialunhou@outlook.com', '586540225', 'Je64SAVBD7', '余有限责任公司', '495 徐汇区虹桥路', '10047');
INSERT INTO `tb_contact` VALUES (166, 6, '宋嘉伦', '男', '12210294717', 'jsong@outlook.com', '679158045', 'x3eIpZ9D5Y', '邱記发展贸易有限责任公司', '704 福田区深南大道', '82894');
INSERT INTO `tb_contact` VALUES (167, 8, '唐致远', '男', '19890733686', 'tazh@gmail.com', '2196074456', 'nwvFm8qHtz', '沈記有限责任公司', '231 东城区东单王府井东街', '58226');
INSERT INTO `tb_contact` VALUES (168, 6, '贺璐', '女', '14409244941', 'luhe@gmail.com', '1581162972', 'VOUMUhHDvv', '震南系统有限责任公司', '141 海淀区清河中街68号', '76106');
INSERT INTO `tb_contact` VALUES (169, 10, '许詩涵', '女', '15745176220', 'shihanxu@yahoo.com', '117098662', 'jD056lY2aH', '云熙有限责任公司', '968 珊瑚路', '74316');
INSERT INTO `tb_contact` VALUES (170, 7, '傅宇宁', '男', '12993632808', 'yuning123@mail.com', '8427645320', 'jJfUTIXn3C', '云熙有限责任公司', '536 龙岗区学园一巷', '59529');
INSERT INTO `tb_contact` VALUES (171, 8, '向子异', '男', '13349398170', 'xiangz407@gmail.com', '491612582', 'xQyXNpBBV4', '龙記系统有限责任公司', '闵行区宾川路584号', '00560');
INSERT INTO `tb_contact` VALUES (172, 12, '高璐', '女', '13052127665', 'gaolu@mail.com', '903397302', 'CEPY8tycN5', '詩涵通讯有限责任公司', '768 福田区景田东一街', '97005');
INSERT INTO `tb_contact` VALUES (173, 3, '叶睿', '男', '11849005659', 'yerui72@icloud.com', '681507472', 'e8INh9r9bx', '岚食品有限责任公司', '859 西城区西長安街', '88768');
INSERT INTO `tb_contact` VALUES (176, 7, '胡震南', '男', '11136275907', 'huzhennan5@yahoo.com', '7306600898', '89omrrTmHA', '薛記有限责任公司', '117 白云区机场路棠苑街五巷', '54818');
INSERT INTO `tb_contact` VALUES (177, 11, '郑詩涵', '女', '17425481420', 'zheng512@outlook.com', '738625015', 'Pv1kJ5c2UB', '周記物业代理有限责任公司', '成华区双庆路963号', '95828');
INSERT INTO `tb_contact` VALUES (178, 6, '谢詩涵', '女', '12833934975', 'xies4@icloud.com', '168592062', 'CQNESwROAq', '秀英有限责任公司', '745 海淀区清河中街68号', '14256');
INSERT INTO `tb_contact` VALUES (182, 7, '尹致远', '男', '15450287370', 'yizhiyuan@mail.com', '308988552', 'R1zVzzsI42', '邱有限责任公司', '864 白云区小坪东路', '14997');
INSERT INTO `tb_contact` VALUES (183, 14, '胡子韬', '男', '18449922473', 'zitaoh4@gmail.com', '6895320518', 'ESrNE4PVUe', '梁玩具有限责任公司', '465 东泰五街', '25380');
INSERT INTO `tb_contact` VALUES (184, 9, '沈秀英', '女', '12214778263', 'shenxiuyi@hotmail.com', '4079690344', 'TbQTaz72am', '罗系统有限责任公司', '669 海珠区江南西路', '22091');
INSERT INTO `tb_contact` VALUES (185, 10, '吴岚', '女', '17158956057', 'lanw4@outlook.com', '4858031460', 'j8WVtcOkJi', '钟电讯有限责任公司', '535 罗湖区清水河一路', '82901');
INSERT INTO `tb_contact` VALUES (186, 12, '崔震南', '男', '12548049133', 'zhennan4@yahoo.com', '4382979948', 'DGJj2vADRC', '刘記有限责任公司', '206 白云区机场路棠苑街五巷', '57227');
INSERT INTO `tb_contact` VALUES (187, 13, '韦嘉伦', '男', '19782909221', 'wei801@icloud.com', '478782467', 'YFVx4gU7ua', '安琪有限责任公司', '成华区二仙桥东三路167号', '53877');
INSERT INTO `tb_contact` VALUES (188, 9, '雷宇宁', '男', '12309105117', 'lei97@gmail.com', '618542136', 'p6nxOeOFEv', '贾記有限责任公司', '749 坑美十五巷', '90888');
INSERT INTO `tb_contact` VALUES (190, 5, '徐晓明', '男', '11504561358', 'xiaomingx609@icloud.com', '1191843865', 'pUSXC0fpw9', '杰宏有限责任公司', '成华区二仙桥东三路555号', '36016');
INSERT INTO `tb_contact` VALUES (191, 5, '段子异', '男', '19602303881', 'duan9@gmail.com', '948476218', 'GxiBcCw19e', '程記有限责任公司', '589 延庆区028县道', '63942');
INSERT INTO `tb_contact` VALUES (192, 11, '田嘉伦', '男', '15056290793', 'jialunti@gmail.com', '7837224533', '93jNlvpMvW', '蔡有限责任公司', '292 乐丰六路', '97602');
INSERT INTO `tb_contact` VALUES (193, 8, '廖震南', '男', '11712964902', 'zhl@hotmail.com', '3276910234', 'sEs7NFHOn1', '郑有限责任公司', '290 西城区西長安街', '55660');
INSERT INTO `tb_contact` VALUES (194, 12, '毛安琪', '女', '19303380567', 'maoanqi1944@icloud.com', '865064699', 'eB8Qw03qLJ', '高記玩具有限责任公司', '闵行区宾川路603号', '05422');
INSERT INTO `tb_contact` VALUES (195, 12, '雷睿', '男', '18480391448', 'rui61@hotmail.com', '8823721739', 'QvjUaCWu9i', '董有限责任公司', '173 白云区机场路棠苑街五巷', '65782');
INSERT INTO `tb_contact` VALUES (196, 9, '杨晓明', '男', '11688655852', 'xiaomingyang@yahoo.com', '8056698719', 'zXIsAByWB2', '詩涵电脑有限责任公司', '932 锦江区人民南路四段', '30594');
INSERT INTO `tb_contact` VALUES (197, 9, '贺致远', '男', '11138608993', 'zhihe@hotmail.com', '8397411705', 'S3CMPeet3F', '卢技术有限责任公司', '556 锦江区红星路三段', '40428');
INSERT INTO `tb_contact` VALUES (199, 11, '孔晓明', '男', '15209595627', 'kongxiaoming512@yahoo.com', '1105049359', 'lv7oIm28j8', '安琪系统有限责任公司', '322 徐汇区虹桥路', '26749');
INSERT INTO `tb_contact` VALUES (201, 11, '毛致远', '男', '15247879100', 'zhmao@gmail.com', '5523421359', 'wAaJNoC5QK', '晓明工程有限责任公司', '134 东泰五街', '92942');
INSERT INTO `tb_contact` VALUES (202, 3, '宋子异', '男', '16718887046', 'song5@outlook.com', '688565829', 'hMyfnQPOTo', '致远物业代理有限责任公司', '369 锦江区红星路三段', '83077');
INSERT INTO `tb_contact` VALUES (203, 12, '汤璐', '女', '16009060525', 'tang430@outlook.com', '748013554', 'zid5TPGj27', '郝記电子有限责任公司', '129 环区南街二巷', '60412');
INSERT INTO `tb_contact` VALUES (204, 1, '韦杰宏', '男', '13112201335', 'weji@yahoo.com', '6100325905', '2pa7Yq8Y8z', '谭記发展贸易有限责任公司', '762 朝阳区三里屯路', '99044');
INSERT INTO `tb_contact` VALUES (205, 9, '宋晓明', '男', '19548121600', 'songxiaoming@mail.com', '951049648', 'igRztwDAtf', '安琪有限责任公司', '318 龙岗区学园一巷', '48682');
INSERT INTO `tb_contact` VALUES (206, 13, '常璐', '女', '13267513788', 'changlu@yahoo.com', '506330474', 'FE7stj83bR', '詩涵有限责任公司', '115 罗湖区清水河一路', '10864');
INSERT INTO `tb_contact` VALUES (210, 5, '谭子异', '男', '16929372938', 'tanziy@gmail.com', '9322397542', 'X4ifgrZJX1', '秀英电讯有限责任公司', '380 白云区小坪东路', '09523');
INSERT INTO `tb_contact` VALUES (212, 5, '刘睿', '男', '14086773277', 'ruiliu926@icloud.com', '596251157', 'xCSqMiAoQR', '子韬有限责任公司', '闵行区宾川路627号', '84581');
INSERT INTO `tb_contact` VALUES (213, 12, '阎宇宁', '男', '15626399000', 'yyan5@hotmail.com', '1752477057', 'sTD8SwDjlO', '向发展贸易有限责任公司', '452 福田区深南大道', '86657');
INSERT INTO `tb_contact` VALUES (214, 8, '尹璐', '女', '11314030817', 'yin415@gmail.com', '3128595599', '6BC2RVdC44', '岚有限责任公司', '980 龙岗区布吉镇西环路', '39739');
INSERT INTO `tb_contact` VALUES (215, 9, '袁秀英', '女', '16754264386', 'yuanx@outlook.com', '8668841791', 'xdjB7Z4ZZe', '宇宁有限责任公司', '757 越秀区中山二路', '80178');
INSERT INTO `tb_contact` VALUES (216, 5, '徐秀英', '女', '15126811759', 'xiuyingxu@gmail.com', '7878298537', 'FEraMeVzL0', '致远贸易有限责任公司', '836 珊瑚路', '82242');
INSERT INTO `tb_contact` VALUES (218, 11, '郑睿', '男', '12233381200', 'zhengrui@mail.com', '4370946077', 'ybAmmSMlbQ', '晓明电脑有限责任公司', '885 福田区景田东一街', '62457');
INSERT INTO `tb_contact` VALUES (219, 7, '吴云熙', '男', '10829766480', 'yunxiwu@outlook.com', '358751416', 'kT2bS74m4h', '吴記电讯有限责任公司', '浦东新区健祥路900号', '13083');
INSERT INTO `tb_contact` VALUES (220, 11, '汤子韬', '男', '18003535430', 'ztang@gmail.com', '696763349', 'nztSR8Omko', '方記贸易有限责任公司', '476 龙岗区学园一巷', '91073');
INSERT INTO `tb_contact` VALUES (221, 5, '杜秀英', '女', '18471710239', 'xdu@gmail.com', '7771782808', 'k8WBkdcBjE', '孔有限责任公司', '472 白云区小坪东路', '04439');
INSERT INTO `tb_contact` VALUES (222, 12, '朱璐', '女', '11147347085', 'zhulu1968@mail.com', '5330756399', 'a9Qk7tmmhv', '岚工业有限责任公司', '279 海珠区江南西路', '27223');
INSERT INTO `tb_contact` VALUES (223, 11, '向晓明', '男', '11305566211', 'xixiang@gmail.com', '7402509804', 'M2I2flntwT', '向記食品有限责任公司', '181 越秀区中山二路', '11446');
INSERT INTO `tb_contact` VALUES (224, 6, '陈安琪', '女', '14983112202', 'chena@yahoo.com', '206484980', 'ZTRfShJLUF', '宋記技术有限责任公司', '119 東城区東直門內大街', '01306');
INSERT INTO `tb_contact` VALUES (226, 6, '尹晓明', '男', '11008536338', 'xiyi522@outlook.com', '9487131116', 'Tv8eEJ5SPG', '贾記工业有限责任公司', '384 朝阳区三里屯路', '50202');
INSERT INTO `tb_contact` VALUES (228, 9, '叶睿', '男', '13688157031', 'rui1978@icloud.com', '520142570', 'b3DkZGuejK', '武記电脑有限责任公司', '522 白云区小坪东路', '35199');
INSERT INTO `tb_contact` VALUES (229, 9, '许子异', '男', '10544805219', 'zx1101@outlook.com', '553067676', 'yDicja53lU', '何有限责任公司', '174 東城区東直門內大街', '05339');
INSERT INTO `tb_contact` VALUES (230, 5, '汪璐', '女', '11097331326', 'wanglu309@gmail.com', '555538269', 'XDdVIfvMUu', '睿电讯有限责任公司', '浦东新区橄榄路203号', '57756');
INSERT INTO `tb_contact` VALUES (231, 7, '姜璐', '女', '17168693246', 'lujiang@mail.com', '949205740', 'Eaprl60zn1', '吕記系统有限责任公司', '519 东泰五街', '23167');
INSERT INTO `tb_contact` VALUES (233, 14, '谭子韬', '男', '15201469021', 'tazitao51@icloud.com', '3360250569', 'GmaQwQvjgK', '璐有限责任公司', '247 东泰五街', '94037');
INSERT INTO `tb_contact` VALUES (234, 12, '郑睿', '男', '15613834931', 'zheru508@icloud.com', '451264270', 'kv5rSpJswF', '晓明有限责任公司', '75 徐汇区虹桥路', '81100');
INSERT INTO `tb_contact` VALUES (235, 7, '胡秀英', '女', '17464701292', 'xhu@icloud.com', '4604595593', 'wxDe8cSOxW', '云熙有限责任公司', '824 成华区玉双路6号', '45369');
INSERT INTO `tb_contact` VALUES (237, 14, '杨杰宏', '男', '19271150486', 'jiehongyang9@icloud.com', '1879697417', 'mRnRFeMsW8', '秀英电子有限责任公司', '825 西城区西長安街', '92328');
INSERT INTO `tb_contact` VALUES (238, 12, '唐睿', '男', '17565577960', 'tangrui@hotmail.com', '9562786228', 'QezgNOpJtu', '谭有限责任公司', '848 東城区東直門內大街', '28927');
INSERT INTO `tb_contact` VALUES (239, 6, '戴杰宏', '男', '15406416622', 'daij@outlook.com', '925030440', 'WT8emmoBbh', '谢記电脑有限责任公司', '651 环区南街二巷', '26555');
INSERT INTO `tb_contact` VALUES (240, 12, '尹杰宏', '男', '11623374916', 'jy1957@gmail.com', '2744732698', 'YyVtG6HIpt', '薛有限责任公司', '957 朝阳区三里屯路', '28739');
INSERT INTO `tb_contact` VALUES (241, 9, '于宇宁', '男', '17511000660', 'yuning110@outlook.com', '936950448', 'Czmw1gOPwQ', '震南有限责任公司', '815 東城区東直門內大街', '29248');
INSERT INTO `tb_contact` VALUES (1003, 3, '董云熙', '男', '16385959310', 'dongyunxi@gmail.com', '433587356', '7XrF5stavj', '詩涵电讯有限责任公司', '509 朝阳区三里屯路', '49613');
INSERT INTO `tb_contact` VALUES (1004, 12, '薛睿', '男', '17165860999', 'xuer6@gmail.com', '810226995', 'OegbmCI99V', '尹記系统有限责任公司', '154 白云区小坪东路', '25850');

-- ----------------------------
-- Table structure for tb_job_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_job_log`;
CREATE TABLE `tb_job_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '工作日志编号',
  `user_id` int NULL DEFAULT NULL COMMENT '所属用户ID',
  `log_time` datetime NULL DEFAULT NULL COMMENT '记录时间',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_log_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `job_log_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_job_log
-- ----------------------------
INSERT INTO `tb_job_log` VALUES (1, 1, '2022-12-18 21:48:33', '233', '11111');
INSERT INTO `tb_job_log` VALUES (2, 1, '2022-12-13 21:48:53', '666', '2222');
INSERT INTO `tb_job_log` VALUES (3, 1, '2020-01-01 10:10:29', '11111222', '22222');
INSERT INTO `tb_job_log` VALUES (4, 10, '2022-01-23 02:28:25', '日志标题1', '日志内容8');
INSERT INTO `tb_job_log` VALUES (5, 1, '2022-08-14 00:32:24', '日志标题4', '日志内容5');
INSERT INTO `tb_job_log` VALUES (6, 11, '2022-02-04 20:56:18', '日志标题9', '日志内容4');
INSERT INTO `tb_job_log` VALUES (7, 14, '2022-08-25 19:38:21', '日志标题3', '日志内容8');
INSERT INTO `tb_job_log` VALUES (8, 8, '2022-04-18 15:28:48', '日志标题4', '日志内容8');
INSERT INTO `tb_job_log` VALUES (9, 13, '2022-01-30 00:13:28', '日志标题1', '日志内容0');
INSERT INTO `tb_job_log` VALUES (10, 7, '2022-12-16 06:55:45', '日志标题7', '日志内容9');
INSERT INTO `tb_job_log` VALUES (11, 1, '2022-01-31 16:05:16', '日志标题0', '日志内容9');
INSERT INTO `tb_job_log` VALUES (12, 3, '2022-10-24 00:07:56', '日志标题0', '日志内容0');
INSERT INTO `tb_job_log` VALUES (13, 5, '2022-12-04 06:50:42', '日志标题3', '日志内容1');
INSERT INTO `tb_job_log` VALUES (14, 8, '2022-02-24 12:50:20', '日志标题3', '日志内容0');
INSERT INTO `tb_job_log` VALUES (15, 12, '2022-11-10 18:11:17', '日志标题5', '日志内容3');
INSERT INTO `tb_job_log` VALUES (16, 7, '2022-01-24 04:04:20', '日志标题4', '日志内容5');
INSERT INTO `tb_job_log` VALUES (17, 1, '2022-12-17 19:05:23', '日志标题7', '日志内容4');
INSERT INTO `tb_job_log` VALUES (18, 8, '2022-04-01 05:13:20', '日志标题5', '日志内容1');
INSERT INTO `tb_job_log` VALUES (19, 1, '2022-09-04 06:27:40', '日志标题8', '日志内容5');
INSERT INTO `tb_job_log` VALUES (20, 13, '2022-08-20 00:46:09', '日志标题6', '日志内容1');
INSERT INTO `tb_job_log` VALUES (21, 13, '2022-02-05 00:06:40', '日志标题2', '日志内容3');
INSERT INTO `tb_job_log` VALUES (22, 1, '2022-06-15 16:13:16', '日志标题0', '日志内容4');
INSERT INTO `tb_job_log` VALUES (23, 14, '2022-09-20 05:18:13', '日志标题7', '日志内容9');
INSERT INTO `tb_job_log` VALUES (24, 12, '2022-08-02 09:45:03', '日志标题4', '日志内容6');
INSERT INTO `tb_job_log` VALUES (26, 7, '2022-12-20 16:29:53', '日志标题7', '日志内容4');
INSERT INTO `tb_job_log` VALUES (27, 11, '2022-12-22 11:53:51', '日志标题6', '日志内容9');
INSERT INTO `tb_job_log` VALUES (28, 3, '2022-08-04 22:38:34', '日志标题5', '日志内容4');
INSERT INTO `tb_job_log` VALUES (29, 3, '2022-04-12 21:51:30', '日志标题4', '日志内容2');
INSERT INTO `tb_job_log` VALUES (30, 1, '2022-08-08 06:34:32', '日志标题3', '日志内容5');
INSERT INTO `tb_job_log` VALUES (31, 14, '2022-03-20 17:49:05', '日志标题3', '日志内容6');
INSERT INTO `tb_job_log` VALUES (32, 13, '2022-04-10 02:04:36', '日志标题8', '日志内容0');
INSERT INTO `tb_job_log` VALUES (33, 3, '2022-05-12 05:42:48', '日志标题5', '日志内容5');
INSERT INTO `tb_job_log` VALUES (34, 14, '2022-07-16 01:36:40', '日志标题5', '日志内容6');
INSERT INTO `tb_job_log` VALUES (35, 9, '2022-05-06 14:44:34', '日志标题3', '日志内容0');
INSERT INTO `tb_job_log` VALUES (37, 8, '2022-12-05 21:47:20', '日志标题3', '日志内容5');
INSERT INTO `tb_job_log` VALUES (38, 5, '2022-12-04 05:15:21', '日志标题6', '日志内容1');
INSERT INTO `tb_job_log` VALUES (39, 1, '2022-10-10 21:11:14', '日志标题5', '日志内容5');
INSERT INTO `tb_job_log` VALUES (40, 6, '2022-07-28 23:34:10', '日志标题2', '日志内容6');
INSERT INTO `tb_job_log` VALUES (41, 6, '2022-01-05 12:45:25', '日志标题5', '日志内容7');
INSERT INTO `tb_job_log` VALUES (42, 9, '2022-02-25 02:32:07', '日志标题7', '日志内容1');
INSERT INTO `tb_job_log` VALUES (43, 10, '2022-05-17 10:01:44', '日志标题7', '日志内容1');
INSERT INTO `tb_job_log` VALUES (44, 12, '2022-10-30 00:51:25', '日志标题8', '日志内容9');
INSERT INTO `tb_job_log` VALUES (45, 11, '2022-09-28 21:29:21', '日志标题0', '日志内容2');
INSERT INTO `tb_job_log` VALUES (46, 13, '2022-12-09 05:10:58', '日志标题6', '日志内容0');
INSERT INTO `tb_job_log` VALUES (47, 12, '2022-04-13 20:16:14', '日志标题9', '日志内容3');
INSERT INTO `tb_job_log` VALUES (48, 6, '2022-07-26 03:05:34', '日志标题1', '日志内容8');
INSERT INTO `tb_job_log` VALUES (49, 12, '2022-01-22 11:48:15', '日志标题3', '日志内容6');
INSERT INTO `tb_job_log` VALUES (50, 10, '2022-07-04 16:40:30', '日志标题5', '日志内容7');
INSERT INTO `tb_job_log` VALUES (51, 6, '2022-03-05 13:19:32', '日志标题0', '日志内容2');
INSERT INTO `tb_job_log` VALUES (52, 3, '2022-10-28 00:19:38', '日志标题2', '日志内容9');
INSERT INTO `tb_job_log` VALUES (53, 13, '2022-07-02 06:22:21', '日志标题1', '日志内容9');
INSERT INTO `tb_job_log` VALUES (54, 10, '2022-02-01 04:51:16', '日志标题0', '日志内容7');
INSERT INTO `tb_job_log` VALUES (55, 1, '2022-10-29 17:56:58', '日志标题1', '日志内容8');
INSERT INTO `tb_job_log` VALUES (56, 14, '2022-12-12 12:13:22', '日志标题0', '日志内容8');
INSERT INTO `tb_job_log` VALUES (58, 5, '2022-10-06 10:22:54', '日志标题8', '日志内容3');
INSERT INTO `tb_job_log` VALUES (59, 5, '2022-04-18 16:53:44', '日志标题3', '日志内容2');
INSERT INTO `tb_job_log` VALUES (60, 13, '2022-05-10 13:55:14', '日志标题1', '日志内容0');
INSERT INTO `tb_job_log` VALUES (61, 12, '2022-12-21 23:10:02', '日志标题1', '日志内容5');
INSERT INTO `tb_job_log` VALUES (62, 6, '2022-05-01 00:22:12', '日志标题6', '日志内容0');
INSERT INTO `tb_job_log` VALUES (63, 3, '2022-02-10 09:22:03', '日志标题4', '日志内容2');
INSERT INTO `tb_job_log` VALUES (64, 14, '2022-11-26 18:48:52', '日志标题3', '日志内容6');
INSERT INTO `tb_job_log` VALUES (65, 7, '2022-07-27 02:25:33', '日志标题4', '日志内容1');
INSERT INTO `tb_job_log` VALUES (66, 11, '2022-05-31 03:31:30', '日志标题4', '日志内容9');
INSERT INTO `tb_job_log` VALUES (67, 5, '2022-12-20 01:51:07', '日志标题2', '日志内容4');
INSERT INTO `tb_job_log` VALUES (68, 14, '2022-03-16 02:22:24', '日志标题7', '日志内容2');
INSERT INTO `tb_job_log` VALUES (69, 7, '2022-03-18 01:56:21', '日志标题8', '日志内容1');
INSERT INTO `tb_job_log` VALUES (70, 12, '2022-07-05 11:12:39', '日志标题7', '日志内容0');
INSERT INTO `tb_job_log` VALUES (71, 5, '2022-01-31 17:53:28', '日志标题5', '日志内容4');
INSERT INTO `tb_job_log` VALUES (72, 7, '2022-01-15 06:12:00', '日志标题5', '日志内容3');
INSERT INTO `tb_job_log` VALUES (73, 9, '2022-10-07 23:45:39', '日志标题5', '日志内容2');
INSERT INTO `tb_job_log` VALUES (76, 5, '2022-05-01 00:40:44', '日志标题5', '日志内容4');
INSERT INTO `tb_job_log` VALUES (77, 1, '2022-10-23 10:11:37', '日志标题3', '日志内容2');
INSERT INTO `tb_job_log` VALUES (78, 10, '2022-01-28 08:54:35', '日志标题7', '日志内容9');
INSERT INTO `tb_job_log` VALUES (79, 6, '2022-08-25 23:46:22', '日志标题1', '日志内容9');
INSERT INTO `tb_job_log` VALUES (80, 10, '2022-07-20 01:28:49', '日志标题2', '日志内容8');
INSERT INTO `tb_job_log` VALUES (82, 5, '2022-10-20 10:55:55', '日志标题4', '日志内容6');
INSERT INTO `tb_job_log` VALUES (83, 14, '2022-11-25 19:44:47', '日志标题9', '日志内容3');
INSERT INTO `tb_job_log` VALUES (84, 1, '2022-03-10 18:20:07', '日志标题3', '日志内容3');
INSERT INTO `tb_job_log` VALUES (85, 5, '2022-01-24 01:59:39', '日志标题5', '日志内容7');
INSERT INTO `tb_job_log` VALUES (86, 14, '2022-12-14 05:07:14', '日志标题8', '日志内容5');
INSERT INTO `tb_job_log` VALUES (87, 12, '2022-08-21 08:04:03', '日志标题5', '日志内容2');
INSERT INTO `tb_job_log` VALUES (88, 3, '2022-05-19 10:17:25', '日志标题7', '日志内容8');
INSERT INTO `tb_job_log` VALUES (89, 6, '2022-10-05 21:33:26', '日志标题4', '日志内容9');
INSERT INTO `tb_job_log` VALUES (90, 12, '2022-10-02 01:30:56', '日志标题3', '日志内容9');
INSERT INTO `tb_job_log` VALUES (91, 10, '2022-10-19 05:25:14', '日志标题9', '日志内容3');
INSERT INTO `tb_job_log` VALUES (92, 13, '2022-01-22 03:23:09', '日志标题2', '日志内容2');
INSERT INTO `tb_job_log` VALUES (93, 3, '2022-12-12 15:28:30', '日志标题3', '日志内容9');
INSERT INTO `tb_job_log` VALUES (94, 14, '2022-02-07 21:23:47', '日志标题6', '日志内容0');
INSERT INTO `tb_job_log` VALUES (95, 14, '2022-02-28 17:04:07', '日志标题9', '日志内容7');
INSERT INTO `tb_job_log` VALUES (96, 11, '2022-10-19 23:03:58', '日志标题5', '日志内容8');
INSERT INTO `tb_job_log` VALUES (97, 13, '2022-02-11 15:55:03', '日志标题5', '日志内容5');
INSERT INTO `tb_job_log` VALUES (98, 7, '2022-01-18 23:54:57', '日志标题3', '日志内容9');
INSERT INTO `tb_job_log` VALUES (99, 8, '2022-07-01 10:26:07', '日志标题0', '日志内容8');
INSERT INTO `tb_job_log` VALUES (100, 13, '2022-11-01 20:35:31', '日志标题2', '日志内容5');
INSERT INTO `tb_job_log` VALUES (101, 8, '2022-05-02 23:53:42', '日志标题9', '日志内容3');
INSERT INTO `tb_job_log` VALUES (102, 5, '2022-02-07 19:49:13', '日志标题8', '日志内容4');
INSERT INTO `tb_job_log` VALUES (103, 14, '2022-01-31 01:01:41', '日志标题8', '日志内容2');
INSERT INTO `tb_job_log` VALUES (104, 12, '2022-06-22 00:00:42', '日志标题1', '日志内容4');
INSERT INTO `tb_job_log` VALUES (105, 13, '2022-07-23 08:33:30', '日志标题1', '日志内容8');
INSERT INTO `tb_job_log` VALUES (106, 8, '2022-10-16 04:51:29', '日志标题4', '日志内容2');
INSERT INTO `tb_job_log` VALUES (107, 11, '2022-12-06 04:47:33', '日志标题6', '日志内容0');
INSERT INTO `tb_job_log` VALUES (108, 6, '2022-03-03 14:17:23', '日志标题5', '日志内容1');
INSERT INTO `tb_job_log` VALUES (109, 14, '2022-01-27 15:03:19', '日志标题6', '日志内容9');
INSERT INTO `tb_job_log` VALUES (111, 13, '2022-12-19 23:38:45', '日志标题3', '日志内容2');
INSERT INTO `tb_job_log` VALUES (112, 10, '2022-11-09 01:55:40', '日志标题1', '日志内容8');
INSERT INTO `tb_job_log` VALUES (113, 10, '2022-12-06 11:15:37', '日志标题8', '日志内容6');
INSERT INTO `tb_job_log` VALUES (114, 6, '2022-10-25 16:33:21', '日志标题8', '日志内容4');
INSERT INTO `tb_job_log` VALUES (115, 6, '2022-02-15 05:00:29', '日志标题1', '日志内容2');
INSERT INTO `tb_job_log` VALUES (116, 7, '2022-02-03 08:22:07', '日志标题6', '日志内容9');
INSERT INTO `tb_job_log` VALUES (117, 13, '2022-04-27 07:51:07', '日志标题0', '日志内容3');
INSERT INTO `tb_job_log` VALUES (118, 3, '2022-02-06 06:16:48', '日志标题2', '日志内容5');
INSERT INTO `tb_job_log` VALUES (119, 9, '2022-04-30 03:38:53', '日志标题1', '日志内容2');
INSERT INTO `tb_job_log` VALUES (120, 13, '2022-05-29 13:17:32', '日志标题5', '日志内容1');
INSERT INTO `tb_job_log` VALUES (121, 5, '2022-02-15 02:08:29', '日志标题1', '日志内容4');
INSERT INTO `tb_job_log` VALUES (122, 12, '2022-05-21 06:24:52', '日志标题1', '日志内容8');
INSERT INTO `tb_job_log` VALUES (123, 10, '2022-10-13 10:32:13', '日志标题8', '日志内容2');
INSERT INTO `tb_job_log` VALUES (124, 1, '2022-05-03 14:03:09', '日志标题8', '日志内容5');
INSERT INTO `tb_job_log` VALUES (125, 3, '2022-09-26 18:00:32', '日志标题7', '日志内容3');
INSERT INTO `tb_job_log` VALUES (126, 5, '2022-08-07 00:50:26', '日志标题6', '日志内容4');
INSERT INTO `tb_job_log` VALUES (127, 10, '2022-11-04 14:51:55', '日志标题3', '日志内容7');
INSERT INTO `tb_job_log` VALUES (128, 6, '2022-10-06 13:47:07', '日志标题8', '日志内容8');
INSERT INTO `tb_job_log` VALUES (129, 8, '2022-10-11 04:31:47', '日志标题4', '日志内容3');
INSERT INTO `tb_job_log` VALUES (130, 10, '2022-09-08 08:55:50', '日志标题3', '日志内容7');
INSERT INTO `tb_job_log` VALUES (131, 5, '2022-04-02 15:52:34', '日志标题4', '日志内容4');
INSERT INTO `tb_job_log` VALUES (132, 10, '2022-07-16 13:46:50', '日志标题0', '日志内容1');
INSERT INTO `tb_job_log` VALUES (133, 11, '2022-07-07 10:57:19', '日志标题3', '日志内容7');
INSERT INTO `tb_job_log` VALUES (135, 12, '2022-07-16 00:36:04', '日志标题4', '日志内容7');
INSERT INTO `tb_job_log` VALUES (136, 8, '2022-01-20 00:49:47', '日志标题0', '日志内容8');
INSERT INTO `tb_job_log` VALUES (137, 3, '2022-08-22 08:45:55', '日志标题3', '日志内容6');
INSERT INTO `tb_job_log` VALUES (138, 14, '2022-06-06 10:33:09', '日志标题8', '日志内容6');
INSERT INTO `tb_job_log` VALUES (139, 14, '2022-12-22 00:38:03', '日志标题5', '日志内容0');
INSERT INTO `tb_job_log` VALUES (140, 6, '2022-07-05 17:18:41', '日志标题3', '日志内容7');
INSERT INTO `tb_job_log` VALUES (141, 9, '2022-08-03 09:46:42', '日志标题2', '日志内容8');
INSERT INTO `tb_job_log` VALUES (142, 7, '2022-06-05 16:58:25', '日志标题4', '日志内容1');
INSERT INTO `tb_job_log` VALUES (143, 13, '2022-11-16 02:59:11', '日志标题6', '日志内容4');
INSERT INTO `tb_job_log` VALUES (144, 6, '2022-05-09 00:17:00', '日志标题7', '日志内容0');
INSERT INTO `tb_job_log` VALUES (145, 7, '2022-06-23 08:41:51', '日志标题1', '日志内容9');
INSERT INTO `tb_job_log` VALUES (146, 9, '2022-05-31 09:45:34', '日志标题2', '日志内容0');
INSERT INTO `tb_job_log` VALUES (147, 8, '2022-12-08 11:42:32', '日志标题8', '日志内容0');
INSERT INTO `tb_job_log` VALUES (148, 8, '2022-09-03 22:33:28', '日志标题8', '日志内容6');
INSERT INTO `tb_job_log` VALUES (149, 9, '2022-10-24 21:50:01', '日志标题3', '日志内容9');
INSERT INTO `tb_job_log` VALUES (150, 14, '2022-07-11 13:33:22', '日志标题4', '日志内容1');
INSERT INTO `tb_job_log` VALUES (151, 3, '2022-08-13 22:56:48', '日志标题2', '日志内容5');
INSERT INTO `tb_job_log` VALUES (152, 3, '2022-10-16 07:00:00', '日志标题6', '日志内容5');
INSERT INTO `tb_job_log` VALUES (153, 7, '2022-03-08 10:43:23', '日志标题7', '日志内容9');
INSERT INTO `tb_job_log` VALUES (154, 3, '2022-02-19 17:07:26', '日志标题3', '日志内容6');
INSERT INTO `tb_job_log` VALUES (155, 5, '2022-01-22 21:57:33', '日志标题9', '日志内容1');
INSERT INTO `tb_job_log` VALUES (156, 3, '2022-02-02 19:39:21', '日志标题9', '日志内容4');
INSERT INTO `tb_job_log` VALUES (157, 12, '2022-04-23 05:10:12', '日志标题6', '日志内容8');
INSERT INTO `tb_job_log` VALUES (158, 10, '2022-09-04 04:32:17', '日志标题1', '日志内容1');
INSERT INTO `tb_job_log` VALUES (159, 7, '2022-11-25 02:40:17', '日志标题7', '日志内容9');
INSERT INTO `tb_job_log` VALUES (160, 13, '2022-06-12 05:05:43', '日志标题2', '日志内容1');
INSERT INTO `tb_job_log` VALUES (161, 8, '2022-08-13 14:50:43', '日志标题0', '日志内容1');
INSERT INTO `tb_job_log` VALUES (162, 6, '2022-10-28 10:36:42', '日志标题1', '日志内容9');
INSERT INTO `tb_job_log` VALUES (163, 1, '2022-06-21 02:16:55', '日志标题1', '日志内容4');
INSERT INTO `tb_job_log` VALUES (164, 6, '2022-08-15 01:12:21', '日志标题8', '日志内容5');
INSERT INTO `tb_job_log` VALUES (165, 12, '2022-09-13 23:19:17', '日志标题8', '日志内容1');
INSERT INTO `tb_job_log` VALUES (166, 10, '2022-12-09 01:29:55', '日志标题0', '日志内容2');
INSERT INTO `tb_job_log` VALUES (167, 7, '2022-10-02 23:09:07', '日志标题4', '日志内容2');
INSERT INTO `tb_job_log` VALUES (168, 10, '2022-05-04 06:08:31', '日志标题1', '日志内容5');
INSERT INTO `tb_job_log` VALUES (170, 13, '2022-05-16 13:26:38', '日志标题6', '日志内容5');
INSERT INTO `tb_job_log` VALUES (171, 3, '2022-05-15 22:30:50', '日志标题6', '日志内容6');
INSERT INTO `tb_job_log` VALUES (173, 9, '2022-09-08 05:49:23', '日志标题1', '日志内容1');
INSERT INTO `tb_job_log` VALUES (174, 5, '2022-12-05 00:36:59', '日志标题7', '日志内容2');
INSERT INTO `tb_job_log` VALUES (175, 13, '2022-08-08 07:31:16', '日志标题5', '日志内容4');
INSERT INTO `tb_job_log` VALUES (176, 9, '2022-04-10 08:30:29', '日志标题7', '日志内容7');
INSERT INTO `tb_job_log` VALUES (177, 14, '2022-11-12 08:04:18', '日志标题9', '日志内容5');
INSERT INTO `tb_job_log` VALUES (178, 1, '2022-01-20 18:39:34', '日志标题7', '日志内容0');
INSERT INTO `tb_job_log` VALUES (179, 6, '2022-10-26 13:18:02', '日志标题4', '日志内容2');
INSERT INTO `tb_job_log` VALUES (180, 10, '2022-04-10 23:43:18', '日志标题0', '日志内容1');
INSERT INTO `tb_job_log` VALUES (181, 8, '2022-09-17 09:34:27', '日志标题7', '日志内容4');
INSERT INTO `tb_job_log` VALUES (182, 3, '2022-05-01 13:10:29', '日志标题4', '日志内容2');
INSERT INTO `tb_job_log` VALUES (183, 14, '2022-06-03 01:04:27', '日志标题3', '日志内容6');
INSERT INTO `tb_job_log` VALUES (184, 13, '2022-04-18 17:09:34', '日志标题6', '日志内容3');
INSERT INTO `tb_job_log` VALUES (185, 14, '2022-05-05 11:04:17', '日志标题2', '日志内容9');
INSERT INTO `tb_job_log` VALUES (186, 11, '2022-05-24 16:27:06', '日志标题4', '日志内容2');
INSERT INTO `tb_job_log` VALUES (187, 6, '2022-05-08 16:58:19', '日志标题4', '日志内容4');
INSERT INTO `tb_job_log` VALUES (188, 5, '2022-12-01 06:07:59', '日志标题8', '日志内容9');
INSERT INTO `tb_job_log` VALUES (189, 12, '2022-07-14 11:52:26', '日志标题1', '日志内容0');
INSERT INTO `tb_job_log` VALUES (190, 12, '2022-11-29 22:20:32', '日志标题7', '日志内容4');
INSERT INTO `tb_job_log` VALUES (191, 7, '2022-01-08 01:17:25', '日志标题0', '日志内容6');
INSERT INTO `tb_job_log` VALUES (192, 9, '2022-02-28 09:22:12', '日志标题5', '日志内容7');
INSERT INTO `tb_job_log` VALUES (193, 8, '2022-07-26 03:30:48', '日志标题0', '日志内容9');
INSERT INTO `tb_job_log` VALUES (194, 11, '2022-11-01 18:25:06', '日志标题7', '日志内容0');
INSERT INTO `tb_job_log` VALUES (195, 14, '2022-10-28 20:05:16', '日志标题4', '日志内容3');
INSERT INTO `tb_job_log` VALUES (196, 1, '2022-06-02 22:30:43', '日志标题4', '日志内容2');
INSERT INTO `tb_job_log` VALUES (197, 13, '2022-11-29 00:02:16', '日志标题1', '日志内容8');
INSERT INTO `tb_job_log` VALUES (198, 5, '2022-09-22 21:35:07', '日志标题0', '日志内容5');
INSERT INTO `tb_job_log` VALUES (199, 13, '2022-05-13 08:44:06', '日志标题2', '日志内容7');
INSERT INTO `tb_job_log` VALUES (200, 7, '2022-04-22 20:56:44', '日志标题1', '日志内容4');
INSERT INTO `tb_job_log` VALUES (201, 9, '2022-05-02 07:52:39', '日志标题8', '日志内容4');
INSERT INTO `tb_job_log` VALUES (202, 9, '2022-02-22 21:41:21', '日志标题233', '日志内容333');

-- ----------------------------
-- Table structure for tb_meeting
-- ----------------------------
DROP TABLE IF EXISTS `tb_meeting`;
CREATE TABLE `tb_meeting`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会议主题',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会议备注',
  `begin_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `launch_time` datetime NULL DEFAULT NULL COMMENT '会议发起时间',
  `launch_user_id` int NULL DEFAULT NULL COMMENT '会议发起者用户ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态：未开始、已开始、已结束、已撤消',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_meeting
-- ----------------------------

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '消息主键',
  `receiver_id` int NULL DEFAULT NULL COMMENT '接收者ID',
  `sender_id` int NULL DEFAULT NULL COMMENT '发送者ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息内容',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公告主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `admin_id` int NULL DEFAULT NULL COMMENT '管理员id',
  `release_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------

-- ----------------------------
-- Table structure for tb_schedule
-- ----------------------------
DROP TABLE IF EXISTS `tb_schedule`;
CREATE TABLE `tb_schedule`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '日程信息编号',
  `user_id` int NULL DEFAULT NULL COMMENT '所属用户ID',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程内容',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '优先级别（普通、重要）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `remind_datetime` datetime NULL DEFAULT NULL COMMENT '提醒时间',
  `remind_number` int NULL DEFAULT NULL COMMENT '提醒次数',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态：未开始、进行中、已结束',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `schedule_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `schedule_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录密码',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '普通用户' COMMENT '用户类型（普通用户、管理员）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 'admin', '$2a$10$QeaHC/DzXT.ycDk.VSR0z.lesc3MXhDdmst5VV.jVXZu7Df0gUGqa', '管理员');
INSERT INTO `tb_user` VALUES (3, '阎安琪', '1111', '$2a$10$2hz9Jsrle7fcdmegGOukj.dcKS3zz4RHhoUYqfgAZcdFmPFuFpJte', '管理员');
INSERT INTO `tb_user` VALUES (5, '蔡嘉伦', 'Troy Turner', '$2a$10$qpjocsOIMcX02KvmkUXyfui0i1DvmYXStzZeSPEl.I.FMuRmT1DeC', '普通用户');
INSERT INTO `tb_user` VALUES (6, '姜岚', 'Francisco Ortiz', '$2a$10$5vOtFkMomfFxqUCq98JRyedXPHgYsoK3HzmDm9lBKPVeCLCeD7tCK', '普通用户');
INSERT INTO `tb_user` VALUES (7, '郑云熙', 'Wanda Peterson', 'gQCNUziPWr', '普通用户');
INSERT INTO `tb_user` VALUES (8, '陆子韬', 'Evelyn Aguilar', 'tGMXbXOjhZ', '普通用户');
INSERT INTO `tb_user` VALUES (9, '武睿', 'Matthew Jimenez', 'FAwYY9oaAI', '普通用户');
INSERT INTO `tb_user` VALUES (10, '董嘉伦', 'Tina Alexander', 'Z2xIQZTAUq', '普通用户');
INSERT INTO `tb_user` VALUES (11, '钱岚', 'David Simmons', '0kbgIyaJjd', '普通用户');
INSERT INTO `tb_user` VALUES (12, '田宇宁', 'Valerie Scott', '6YjT4V7i0b', '普通用户');
INSERT INTO `tb_user` VALUES (13, '韦秀英', 'Sheila Burns', 'dWeRT7JxhU', '普通用户');
INSERT INTO `tb_user` VALUES (14, '高子异', 'Clara Collins', 'lENp0GIjop', '普通用户');
INSERT INTO `tb_user` VALUES (55, '111111', '111', '$2a$10$CLFUFiv2u/smj5IyPhfxIuz4q1PlqdvVgdvFa.rWPMipNE1kldgVC', '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
