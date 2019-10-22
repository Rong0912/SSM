/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : mybatis

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 22/10/2019 17:07:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `aId` int(50) NOT NULL AUTO_INCREMENT,
  `aContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aMadeByUserId` int(50) NULL DEFAULT NULL,
  `aMadeDate` datetime(0) NULL DEFAULT NULL,
  `aBelongToQuestionId` int(50) NULL DEFAULT NULL,
  PRIMARY KEY (`aId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1009 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (1002, '<p>华为加油</p>', 1001, '2019-08-21 10:40:56', 1009);
INSERT INTO `answer` VALUES (1003, '<p>大家加油啊</p>', 1006, '2019-08-21 16:04:48', 1011);
INSERT INTO `answer` VALUES (1006, '<p>qqqqq</p>', 1007, '2019-08-27 10:13:08', 1010);
INSERT INTO `answer` VALUES (1007, '<p>dfsfsf</p>', 1001, '2019-08-27 19:04:03', 1011);
INSERT INTO `answer` VALUES (1008, '<p>ewtrtewtwet</p>', 1001, '2019-10-22 15:28:40', 1017);

-- ----------------------------
-- Table structure for essay
-- ----------------------------
DROP TABLE IF EXISTS `essay`;
CREATE TABLE `essay`  (
  `essayId` int(50) NOT NULL AUTO_INCREMENT,
  `essayTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `essayContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `essayMadeByUserId` int(50) NULL DEFAULT NULL,
  `essayMadeDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`essayId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1018 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of essay
-- ----------------------------
INSERT INTO `essay` VALUES (1009, '华为如今日常9116了 为什么大家还是很想去呢？', '<div>由于被某国制裁，听说现在华为基本上各个部门都受到了巨大影响，加班从以往995，月末周六，到目前日常的9116，而且今年华为还缩招了，但是感觉想去华为的人依然那么多，大家可以说说想法吗？是深思熟虑后准备好熬肝了，还是试试水，当个跳板，或者其他想法呢？&nbsp;</div>\n<div></div>\n			', 1002, '2019-08-27 10:24:51');
INSERT INTO `essay` VALUES (1010, '质问字节跳动hr', '不知道今年字节简历都是怎么审核的，同一个岗位，我身边的人得到不一样结果，以后别再总说他们看学校了，我甚至怀疑他们是看心情筛简历。希望贵公司对各位应届生们负责，下面我举例。(产品岗)\r\n\r\n', 1001, '2019-08-27 10:37:18');
INSERT INTO `essay` VALUES (1011, 'Shopee内推', 'Shopee是东南亚与台湾最大电商平台，覆盖印度尼西亚、马来西亚、台湾、越南、泰国、菲律宾和新加坡。', 1003, '2019-08-27 19:34:02');
INSERT INTO `essay` VALUES (1012, '华为如今日常9116了 为什么大家还是很想去呢？', '<div>由于被某国制裁，听说现在华为基本上各个部门都受到了巨大影响，加班从以往995，月末周六，到目前日常的9116，而且今年华为还缩招了，但是感觉想去华为的人依然那么多，大家可以说说想法吗？是深思熟虑后准备好熬肝了，还是试试水，当个跳板，或者其他想法呢？&nbsp;</div>\n<div></div>\n			', 1001, '2019-08-29 15:56:04');
INSERT INTO `essay` VALUES (1014, 'java开发实习生', '1. 985或211大学本科或硕士，计算机相关专业毕业；2.至少熟悉一门后端开发语言，如Java、Ruby、Python、PHP等，有Ruby开发经验优先；3具备快速学习能力和较好的沟通能力；4.有实际开发项目经验、优秀毕业生、有开源项目贡献优先；5.执行力强，积极主动，有良好的抗压能力；6. 能够接受一定程度的出差。', 1004, '2019-09-06 16:43:10');
INSERT INTO `essay` VALUES (1015, 'B站面试通知', '运营，还没收到通知 ，好慌', 1005, '2019-09-09 12:36:50');
INSERT INTO `essay` VALUES (1016, 'ghkgjjkkh', '<u>hk;h<b>ghjkhjkhkkhgkhgkhgk<span style=\"background-color: rgb(255, 156, 0);\">khgjjhkhjkjhkhjk</span></b></u>', 1001, '2019-10-22 15:24:28');
INSERT INTO `essay` VALUES (1017, 'czxVCxzc', '<ol><li><b><u>zxvvz<span style=\"background-color: rgb(214, 239, 214);\">zxvvzvzvzvzvxzzxvzvz<font face=\"Helvetica\">vzxvzv</font><font face=\"Comic Sans MS\">vzxvxczXC</font></span></u></b></li></ol>', 1001, '2019-10-22 15:27:12');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `qId` int(50) NOT NULL AUTO_INCREMENT,
  `qTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qMadeByUserId` int(50) NULL DEFAULT NULL,
  `qMadeDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`qId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1019 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1009, '华为如今日常9116了 为什么大家还是很想去呢？', '<p>\n\n由于被某国制裁，听说现在华为基本上各个部门都受到了巨大影响，加班从以往995，月末周六，到目前日常的9116，而且今年华为还缩招了，但是感觉想去华为的人依然那么多，大家可以说说想法吗？是深思熟虑后准备好熬肝了，还是试试水，当个跳板，或者其他想法呢？</p>', 1001, '2019-08-27 19:53:23');
INSERT INTO `question` VALUES (1010, '空有一场大厂梦啊，梦碎了。。', '<p>至此，大厂已团灭了。。\n滴滴笔试挂，做到一半大疆二面来电话，只能选择面试；\n美团三面挂，仅仅因为不能马上就去实习；\n百度三面挂，百度HR安慰我说能进三面已经足够优秀，但提前批竞争实在激烈，希望我也思考一下为什么会三面挂掉；\n腾讯笔试挂，搞了一个多点才弄明白牛客编译器到底怎么自测，仅AC一道，只能等下次笔试；\n京东笔试挂，\n网易三面挂，只能说自己不够优秀；\n阿里一面挂，我配不上阿里对于人才的定义；\n头条一面挂，在自己准备最差的时候遇上了要求最高的你；\n再见了。</p>', 1003, '2019-08-27 20:03:56');
INSERT INTO `question` VALUES (1011, '质问字节跳动hr', '<p>不知道今年字节简历都是怎么审核的，同一个岗位，我身边的人得到不一样结果，以后别再总说他们看学校了，我甚至怀疑他们是看心情筛简历。希望贵公司对各位应届生们负责，下面我举例。(产品岗)\r\n\r\n</p>', 1005, '2019-08-27 20:08:08');
INSERT INTO `question` VALUES (1015, 'd', 'dd', 1009, '2019-09-05 21:02:49');
INSERT INTO `question` VALUES (1016, 'dssd', '<p>sdds</p>', 1001, '2019-09-11 15:12:31');
INSERT INTO `question` VALUES (1017, '1111', '<p>11111</p>', 1001, '2019-09-11 15:13:45');
INSERT INTO `question` VALUES (1018, 'sadad', '<p>sdadad</p>', 1001, '2019-10-22 15:08:54');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `tId` int(50) NOT NULL AUTO_INCREMENT,
  `tName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tMadeDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`tId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1012 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES (1002, '生活', 'aaa', '2019-08-21 16:13:57');
INSERT INTO `topic` VALUES (1003, '游戏', 'ccc', '2019-08-20 16:14:14');
INSERT INTO `topic` VALUES (1004, '动漫', 'ddd', '2019-08-23 10:41:58');
INSERT INTO `topic` VALUES (1005, '二次元', 'eee', '2019-08-23 10:42:18');
INSERT INTO `topic` VALUES (1006, '编程', 'fff', '2019-08-22 10:42:44');
INSERT INTO `topic` VALUES (1007, '宠物', 'ggg', '2019-08-28 10:43:09');
INSERT INTO `topic` VALUES (1008, '购物', 'hhh', '2019-08-23 10:43:34');
INSERT INTO `topic` VALUES (1009, '综艺', 'jjj', '2019-08-24 10:44:56');
INSERT INTO `topic` VALUES (1010, '吃货', 'kkk', '2019-08-21 10:45:28');
INSERT INTO `topic` VALUES (1011, '学习', 'xxx', '2019-08-22 19:42:55');

-- ----------------------------
-- Table structure for typewithtopic
-- ----------------------------
DROP TABLE IF EXISTS `typewithtopic`;
CREATE TABLE `typewithtopic`  (
  `tId` int(50) NOT NULL,
  `trType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trTypeId` int(50) NOT NULL COMMENT '问题的id',
  `trCreatetime` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of typewithtopic
-- ----------------------------
INSERT INTO `typewithtopic` VALUES (1011, '100', 1009, '2019-08-27 19:53:23');
INSERT INTO `typewithtopic` VALUES (1011, '100', 1010, '2019-08-27 20:03:56');
INSERT INTO `typewithtopic` VALUES (1011, '100', 1011, '2019-08-27 20:08:08');
INSERT INTO `typewithtopic` VALUES (1002, '100', 1016, '2019-09-11 15:12:31');
INSERT INTO `typewithtopic` VALUES (1002, '100', 1017, '2019-09-11 15:13:45');
INSERT INTO `typewithtopic` VALUES (1011, '100', 1018, '2019-10-22 15:08:54');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uId` int(10) NOT NULL AUTO_INCREMENT,
  `uEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uRegistDate` datetime(0) NULL DEFAULT NULL,
  `smPho` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'basic.jpg',
  `uName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uGender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uResidence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uProfession` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isLock` int(10) NULL DEFAULT 1,
  PRIMARY KEY (`uId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1012 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1001, '123456', '13479365765', '2019-08-19 14:54:41', '538efc68-2c22-44a4-8552-4e4faf7ed89d.jpg', '一只小花椒', '男', '272081ff7c8234c6c16f2dab987b0a2bc4d4eb5177fa485a0e5d364c902bead6b417c100ec3598b0', '广东深圳', '软件', 'hello world!', 1);
INSERT INTO `user` VALUES (1002, '111111', '13478540959', '2019-08-22 10:28:44', '8b738d46-582a-4546-87a9-45a75a33b1c3.jpg', 'Master-Pan', '男', '3a2dd080717ad5ccb28c6d8af74f766686e28436ed945a23fc1bbccaeca1567d68a6fe612c94cb89', '江西婺源', '旅游', '好美', 1);
INSERT INTO `user` VALUES (1003, '123123', '13478540959', '2019-08-23 10:31:47', 'u=2415374992,758697288&fm=26&gp=0.jpg', '迪丽热巴', '女', '90420a77979c8d77a2e848dbd2b0dcc394e10f37573a0b104e9a6537f5711ce0d9086f68c6e25439', '上海', '演员', '女神', 0);
INSERT INTO `user` VALUES (1004, '131415926', '12214235436', '2019-08-24 10:33:10', 'u=1250382934,1010270899&fm=26&gp=0.jpg', '小妲己陪你玩', '女', '761aee1b9492193b032145189d6cc66bf402039d5e1af3fa42a88564cd74ed6643b9c66d17d78c23', '北京', '王者荣耀', '上分', 1);
INSERT INTO `user` VALUES (1005, '2019', '18270346865', '2019-08-21 14:51:46', '7e5b9574-5c5a-4ab8-9433-5b9a329fa334.jpg', '小周可', '女', '328db833f018a722fdc0d4b12d045be088fc6e0ab07be01a1bdafd4e928e0be0e7ef6391f2af89ae', '广州', '美容', '敲代码', 1);
INSERT INTO `user` VALUES (1006, '20192019', '13448219049', '2019-08-21 19:11:29', 'basic.jpg', '交大吴彦祖', '男', '45efeb611a817c6e5a7f12d9b9353fc832178111d70df41c8224e53183f67201985633ff49ede52d', '江西南昌', '会计', '超帅的', 1);
INSERT INTO `user` VALUES (1011, 'gfdgdfg', NULL, NULL, 'basic.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for user_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation`  (
  `fromUserId` int(50) NOT NULL,
  `toUserId` int(11) NULL DEFAULT NULL,
  `relationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_relation
-- ----------------------------
INSERT INTO `user_relation` VALUES (1002, 1005, '10');
INSERT INTO `user_relation` VALUES (1001, 1006, '0');
INSERT INTO `user_relation` VALUES (1001, 1002, '10');
INSERT INTO `user_relation` VALUES (1001, 1003, '10');
INSERT INTO `user_relation` VALUES (1001, 1004, '10');
INSERT INTO `user_relation` VALUES (1002, 1001, '10');
INSERT INTO `user_relation` VALUES (1002, 1003, '10');
INSERT INTO `user_relation` VALUES (1001, 1005, '10');
INSERT INTO `user_relation` VALUES (1005, 1003, '10');
INSERT INTO `user_relation` VALUES (1005, 1006, '10');
INSERT INTO `user_relation` VALUES (1004, 1001, '10');
INSERT INTO `user_relation` VALUES (1004, 1003, '10');
INSERT INTO `user_relation` VALUES (1004, 1002, '10');
INSERT INTO `user_relation` VALUES (1003, 1001, '10');
INSERT INTO `user_relation` VALUES (1003, 1002, '10');
INSERT INTO `user_relation` VALUES (1003, 1004, '10');
INSERT INTO `user_relation` VALUES (1003, 1005, '10');
INSERT INTO `user_relation` VALUES (1003, 1006, '10');

-- ----------------------------
-- Table structure for useroperation
-- ----------------------------
DROP TABLE IF EXISTS `useroperation`;
CREATE TABLE `useroperation`  (
  `operationId` int(50) NOT NULL,
  `uId` int(50) NULL DEFAULT NULL,
  `operationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realAction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `optId` int(50) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`optId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1019 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of useroperation
-- ----------------------------
INSERT INTO `useroperation` VALUES (1002, 1001, '101', '回答了问题', '2019-08-21 10:40:56', 1001);
INSERT INTO `useroperation` VALUES (1003, 1006, '101', '回答了问题', '2019-08-21 16:04:48', 1002);
INSERT INTO `useroperation` VALUES (1006, 1007, '101', '回答了问题', '2019-08-27 10:13:08', 1003);
INSERT INTO `useroperation` VALUES (1009, 1002, '102', '发表了随笔', '2019-08-27 10:24:51', 1004);
INSERT INTO `useroperation` VALUES (1010, 1001, '102', '发表了随笔', '2019-08-27 10:37:18', 1005);
INSERT INTO `useroperation` VALUES (1007, 1001, '101', '回答了问题', '2019-08-27 19:04:03', 1006);
INSERT INTO `useroperation` VALUES (1011, 1003, '102', '发表了随笔', '2019-08-27 19:34:02', 1007);
INSERT INTO `useroperation` VALUES (1009, 1001, '100', '关注了问题', '2019-08-27 19:53:23', 1008);
INSERT INTO `useroperation` VALUES (1010, 1003, '100', '关注了问题', '2019-08-27 20:03:56', 1009);
INSERT INTO `useroperation` VALUES (1011, 1005, '100', '关注了问题', '2019-08-27 20:08:08', 1010);
INSERT INTO `useroperation` VALUES (1012, 1001, '102', '发表了随笔', '2019-08-29 15:56:04', 1011);
INSERT INTO `useroperation` VALUES (1015, 1004, '102', '发表了随笔', '2019-09-06 16:43:34', 1012);
INSERT INTO `useroperation` VALUES (1016, 1001, '100', '关注了问题', '2019-09-11 15:12:31', 1013);
INSERT INTO `useroperation` VALUES (1017, 1001, '100', '关注了问题', '2019-09-11 15:13:45', 1014);
INSERT INTO `useroperation` VALUES (1018, 1001, '100', '关注了问题', '2019-10-22 15:08:54', 1015);
INSERT INTO `useroperation` VALUES (1016, 1001, '102', '发表了随笔', '2019-10-22 15:24:28', 1016);
INSERT INTO `useroperation` VALUES (1017, 1001, '102', '发表了随笔', '2019-10-22 15:27:12', 1017);
INSERT INTO `useroperation` VALUES (1008, 1001, '101', '回答了问题', '2019-10-22 15:28:40', 1018);

-- ----------------------------
-- Table structure for usertopic_relation
-- ----------------------------
DROP TABLE IF EXISTS `usertopic_relation`;
CREATE TABLE `usertopic_relation`  (
  `uId` int(50) NOT NULL,
  `tId` int(11) NULL DEFAULT NULL,
  `relationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usertopic_relation
-- ----------------------------
INSERT INTO `usertopic_relation` VALUES (1001, 1002, '10');
INSERT INTO `usertopic_relation` VALUES (1001, 1003, '10');
INSERT INTO `usertopic_relation` VALUES (1001, 1005, '10');
INSERT INTO `usertopic_relation` VALUES (1001, 1006, '10');
INSERT INTO `usertopic_relation` VALUES (1001, 1009, '10');
INSERT INTO `usertopic_relation` VALUES (1001, 1004, '10');
INSERT INTO `usertopic_relation` VALUES (1005, 1006, '10');
INSERT INTO `usertopic_relation` VALUES (1005, 1007, '10');
INSERT INTO `usertopic_relation` VALUES (1001, 1007, '10');

SET FOREIGN_KEY_CHECKS = 1;
