/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : TianYue

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 13/05/2020 19:08:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
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
INSERT INTO `auth_permission` VALUES (25, 'Can add book info', 7, 'add_bookinfo');
INSERT INTO `auth_permission` VALUES (26, 'Can change book info', 7, 'change_bookinfo');
INSERT INTO `auth_permission` VALUES (27, 'Can delete book info', 7, 'delete_bookinfo');
INSERT INTO `auth_permission` VALUES (28, 'Can view book info', 7, 'view_bookinfo');
INSERT INTO `auth_permission` VALUES (29, 'Can add user info', 8, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (30, 'Can change user info', 8, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (31, 'Can delete user info', 8, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (32, 'Can view user info', 8, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (33, 'Can add comment info', 9, 'add_commentinfo');
INSERT INTO `auth_permission` VALUES (34, 'Can change comment info', 9, 'change_commentinfo');
INSERT INTO `auth_permission` VALUES (35, 'Can delete comment info', 9, 'delete_commentinfo');
INSERT INTO `auth_permission` VALUES (36, 'Can view comment info', 9, 'view_commentinfo');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$180000$N1mlaVZLqel3$rCbrL7ZlScfExU2J66CRRoC/gg/DEbvrY5tcET1/5GU=', '2020-05-12 11:50:34.204923', 1, 'amiwho', '', '', '', 1, 1, '2020-05-12 08:14:54.503641');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bname` varchar(20) NOT NULL,
  `bout` varchar(20) NOT NULL,
  `bauthor` varchar(20) NOT NULL,
  `bdate` date NOT NULL,
  `bpic` varchar(200) NOT NULL,
  `bintro` longtext NOT NULL,
  `bcontent` varchar(20) NOT NULL,
  `bprice` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bname` (`bname`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of book_info
-- ----------------------------
BEGIN;
INSERT INTO `book_info` VALUES (1, '大茂那', '上海人民出版社', '阿兰-傅赫涅', '1994-02-14', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/a8e9b019/group61/M00/63/7E/CmQUOV3qal2EQQJoAAAAAIOkorE365757845.jpg?v=fAAthbqD&t=CmQUOV3qal0.', '大茂那不是小孩，也不是大人，他永远徘徊在童年与成年之间的青春领地中……奥古斯丹·茂那是个特立独行的男孩。他比一般同学来得高大，天生有领袖气质，常有出其不意的想法并热爱冒险。某一天，他驾着马车想到车站接客人，却因迷路而误入一座庄园，受邀参加了一场狂欢婚礼，邂逅他梦寐以求的恋人，两人有了约定。待他回到学校后，却如何也找不到回庄园的路。茂那难以忘怀这趟奇幻之旅，遇到有关失落庄园及恋人的消息绝不放弃，甚至离开学校追踪至巴黎。执着的追逐换来情感和意志的考验，不晓得何时幸福才会到来……', '11.8万字', 199.90);
INSERT INTO `book_info` VALUES (2, '先婚后爱，楚少慢慢来', '', '天青烟雨', '2007-12-14', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/c98c9f4e/group61/M00/60/F9/CmQUOV3p8t6EAa2hAAAAACHwWUU991029340.jpg?v=uXBVqjto&t=CmQUOV6Ixpw.', '为了弥补多年前对妹妹的伤害，她替妹出嫁，嫁给一个又丑又瘫的男人。新婚夜却发现男人英俊潇洒，惊为天人。但同时她也发现了男人有着不可告人的秘密，她自己的悲惨身世也逐渐被揭开。男人答应为她复仇，她则承诺给他一个孩子……', '121.9万字', 0.50);
INSERT INTO `book_info` VALUES (4, '最强魔戒', '', '炙热光辉', '1991-08-23', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/85439e6d/group61/M00/89/63/CmQUOF4B5bmEeI1PAAAAAGMGDbY346689893.jpg?v=NQvJiw6a&t=CmQUOF4B5bk.', '农村小子陈飞无意中获得一枚绝世骨戒，升职加薪走上职场巅峰，美女总裁青睐，和土豪做朋友，一双掌玉眼一系列金手指接踵而至。然而万万没想到骨戒里的美人却蛇蝎心肠，竟然打着夺舍的注意！同一时间，陈飞的生活危机四伏，一双眼睛隐藏在幕后，“我知道，你的身体里住着一个恶魔”。', '399.6万字', 0.50);
INSERT INTO `book_info` VALUES (6, '从召唤恶魔开始无敌', '', '竹鱼', '2015-07-05', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/47b4f0c9/group61/M00/81/B9/CmQUOF33WsOEJc3RAAAAAOeT68k512276962.jpg?v=Ebrl4Lp5&t=CmQUOF33WsM.', '洛凡重生龙系妖兽为尊的世界。召唤火焰领主，恶魔附身，实力超级加倍。召唤死亡女巫，复生亡灵，挥手间千万骷髅大军。召唤亡灵骨龙，不死不灭，一次死一次强！契约龙女和神龙，天地气运加身。每一次召唤，契约。还有意想不到的奖励：炼妖壶，响雷果实，弑龙枪……', '149.3万字', 0.50);
INSERT INTO `book_info` VALUES (7, '从一把剑开始杀戮进化', '', '门前扫雪', '2002-06-28', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/c876a5a1/group61/M00/81/B9/CmQUOF33WsaEWLpjAAAAAJa0WpA715646640.jpg?v=vDmzM5js&t=CmQUOF33WsY.', '穿越成为了一把剑！？杀戮获得进化点，从一把破剑开始，成为一把传说史诗魔剑！', '139.8万字', 0.50);
INSERT INTO `book_info` VALUES (8, '快穿崩坏：男主他又要挂了', '', '泡芙崽', '2005-02-01', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/5d92ad96/group61/M00/81/BA/CmQUOF33WsiENtg-AAAAAD8NsAg660630935.jpg?v=oHvm3htQ&t=CmQUOF33Wsg.', '作为一名专业的位面调整员，时希恪守本分，谨遵“不能对任务目标产生感情”的执法铁律，丝毫不敢越雷池一步，可是不知为何，系统君的画风却在跑偏的道路上越走越远……——看见那个美男了吗？第一个任务，冲上去，强吻他。——对面的小哥哥需要你亲亲抱抱举高高哦！——距离目标还有五百米，宿主，上了他，你就是全位面最靓的仔！她一咬牙一跺脚，为了完成任务升职加薪，拼了！可谁来告诉她，为什么任务目标是个粘人精！“听说你想扑倒我？”男人把时希按在墙上，衬衫的纽扣一一解开，唇角勾勒出危险的弧度，“来吧，我准备好了。”时·慌得一批·希：……别过来！救命啊！', '35.7万字', 0.50);
INSERT INTO `book_info` VALUES (9, '我的女儿是恶魔', '', '疾风前行', '1996-11-03', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/03cdb749/group61/M00/8B/38/CmQUOV4FaxiEG_0tAAAAAKluQD0799102519.jpg?v=b52xzs8F&t=CmQUOV4Faxg.', '从异界反穿越回来，竟然发现自己多了个亲生女儿，而且她居然还是个恶魔？', '36.9万字', 0.50);
INSERT INTO `book_info` VALUES (10, '我能修复万物', '', '天狗', '1992-03-06', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/224f2944/group61/M00/89/17/CmQUOF4BjpWEU9V5AAAAAEh4GYQ825497493.jpg?v=_HNG_OVh&t=CmQUOF4BjpU.', '“叮咚，恭喜宿主，超级无敌修复系统已上线！”“什么……修复？”“叮咚，一大波垃圾正在靠近……”“老子能退货吗？”“叮咚，恭喜宿主，成功修复和冰山女总裁之间的关系，获得修复值1000000000，请问是否兑换华夏币？”“叮咚，恭喜宿主，成功修复月球，获得时空转移属性值100000点，请问是否加满？”……', '50.1万字', 0.50);
INSERT INTO `book_info` VALUES (11, '我有无尽召唤者', '', '三分规律', '2016-10-08', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/b8751c9f/group61/M00/81/BA/CmQUOF33WsyEL6STAAAAALC8e1U785270806.jpg?v=dk-l9ea6&t=CmQUOF33Wsw.', '穿越成为废物王子，不怕，咱有召唤系统！叮！你召唤到了叶凡！叮！你召唤到了石昊！叮！你召唤到了孙悟空！叮！你召唤到了东皇太一！叮！你召唤到了盘古大神！不知不觉发现，你召唤到了无数大佬，成为了最强天帝！', '63.3万字', 0.50);
INSERT INTO `book_info` VALUES (12, '第一婚宠：重生娇妻有点甜', '', '蓝九', '1983-08-08', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/53027a14/group61/M00/AC/C5/CmQUOV6UORmEesfgAAAAAMZRIpo380181526.jpg?v=ZeMO2jII&t=CmQUOV6UORk.', '上辈子错信良人，不仅害死了深爱自己的男人还有未出生的孩子，自己还落得一个惨死下场！这一世，她脚踢渣男，手刃贱女，让那些欠她的人，百倍偿还！至于亏欠的那个男人，她用尽一生来补偿！传言，冷家大少凶神恶煞，是一个半只脚即将踏入棺材的男人，必须要找一个压的住他煞气的女人，方能存活！而原本强烈抵抗不嫁给他的洛家大小姐，突然有一天，开启了护夫模式，容不得别人说她老公一个“不”字！', '76.5万字', 0.50);
INSERT INTO `book_info` VALUES (13, '这个督主，爆宠的！', '', '聚宝盆儿', '1976-12-31', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/17cc52fb/group61/M00/A2/96/CmQUOV4lgk2EOlsVAAAAAMnf8jY559173765.jpg?v=l959vmhP&t=CmQUOV4lgk0.', '权倾朝野的督主大人每天都在真香～众人说：“我们督主狂傲冷血，不近女色！”女主：“那他的手搂在朕腰上这是干什么？”众人又说：“我们督主顶天立地，宁折不弯！”女主：“那在我门口跪搓衣板的人是谁哦？”众人还说：“我们督主神挡杀神，佛挡杀佛！”女主：“那我挡呢？”某督主面如罗刹：“照杀不误！本座怎会为了区区女人停下前进的脚步！”女主托腮，静静地看着他装逼，“哦。”', '126.4万字', 0.50);
INSERT INTO `book_info` VALUES (14, '宠婚百分百，墨总的心尖宝', '', '墨思归', '1989-10-12', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/e106df9e/group61/M00/77/F9/CmQUOV3wwtaETMD1AAAAALMjCD4591629888.jpg?v=xEkdbyYt&t=CmQUOV3wwtY.', '还没来得及把自己怀孕的消息告诉老公婆婆，就在办公室抓到老公出轨好闺蜜。什么凤凰男、渣闺蜜、恶婆婆，她何书洛不干了！摇身一变，她成了艳羡全城的墨太太，宴会上狠狠打了前夫和闺蜜的脸。然而……“你也玩脱轨？看来你的档次也不怎么样，是我何书洛又瞎了眼！”墨总运筹帷幄，面对某个想要吃干抹净就逃跑的女人，他大手一挥将人抓了回来。“惹完我，还想跑？”', '122.8万字', 0.50);
INSERT INTO `book_info` VALUES (15, '报告魔神：太子有喜了', '', '顾无言', '2004-08-27', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/e3732ed8/group61/M00/86/4A/CmQUOF38pTqEMFk8AAAAAMmuSXw046592291.jpg?v=XmoNULQX&t=CmQUOF38pTo.', '宫忍月，嘉和王朝尊贵无双的太子殿下，翻手为云覆手为雨。却被自家无良老爹封印了实力，丢到了鸟不拉屎的地方，还让他铲除魔胎。本想着快点完成任务，可面对某魔胎单纯的双眸时，冷酷无情的太子殿下也下不去手了……从此，调教魔胎成了太子爷的日常生活。看着杀气腾腾的众人，宫忍月:“你们是来杀魔胎的？都当本殿是死人吗？”某魔胎躲在后面，一脸得意！看着站在某个魔胎面前一脸娇羞的众女，宫忍月:“你们看上魔胎了？不好意思，他是本殿的人。”某魔胎躲在后面，一脸幸福！看着一脸娇羞站在自己面前的美男子，这次，某魔胎先不干了:“滚！这是我媳妇儿！”众人哀嚎，完了，他们英明神武的太子殿下弯了！却不知，男装之下，是红颜……（本文1V1甜宠文，女主强势男主养成）', '88.9万字', 0.50);
INSERT INTO `book_info` VALUES (16, '爷，王妃她有乌鸦嘴', '', '墨时瑾', '1996-02-03', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/04ed60ec/group61/M00/86/45/CmQUOF38orSEUszEAAAAANj3mwk387655527.jpg?v=W967q0A1&t=CmQUOF38orQ.', '一朝穿越成了哑巴？夜若羽表示，这个要不得。心机婊必须怼，渣渣必须骂。不过这个发展好像有点不对？说滚就滚，说摔就摔，说跪就跪？！出口成真，花样百出，平白得了个邪气的乌鸦嘴？还有，那个王爷你离我远点，不知道本小姐是有未婚夫的？喂喂喂！你站住！别过来！看着大步走来的男人，夜若羽懵逼了，这个好像对他不管用？！', '56.8万字', 0.50);
INSERT INTO `book_info` VALUES (17, '农门锦绣', '', '短腿蘑菇', '2005-04-03', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/e41784c9/group61/M00/D9/79/CmQUOV6oABWEbme4AAAAACHXgpY003692663.jpg?v=UVOfBs3B&t=CmQUOV6oABU.', '穿越成未婚先孕的农家女，面对柔弱爱哭与泼辣的混合体老娘，夏箐箐很淡定。面对战起逃难，无粮可果腹，亦能从容面对。直到遇见她娘口中的小野狗……孩儿她爹。夏箐箐再也淡定不起来了！傅子蘅（冷眼仇视）：这个对我用强的女登徒，现竟假装不认识我，真是卑鄙无耻！夏箐箐（掩面痛哭）：原来肚子里的孩儿是这么来的啊！嘤嘤嘤……兄台，误会！这真是误会！那真不是我干的啊！傅子蘅（横眉怒目）：你敢说你现在肚子里怀的不是爷的种？夏箐箐（默默流泪）：嘤嘤嘤……这可真是百口莫辩啊！', '124.2万字', 0.50);
INSERT INTO `book_info` VALUES (18, '腹黑竹马套路深', '', '一盏相思茶', '2004-03-27', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/29bc3e03/group61/M00/86/45/CmQUOF38oryEN7neAAAAAOYfCYc342922577.jpg?v=1xM_ZC7H&t=CmQUOF38orw.', '上大学前。他说：“以后在学校别说你认识我。”她求之不得，以为终于可以摆脱他活得潇潇洒洒。但是，夏沐发现有人在掐她的桃花，这可忍不了！“高佳毅！你为什么要偷藏我的信？”夏沐手持一沓未拆封的情书咬牙质问。“没什么，我只是响应教育局号召，打击学生早恋。”“可我已经是大学生了！教育局管不着！”后来夏沐恋爱了。再后来，某一天……“高佳毅！你这是什么意思？”夏沐手持一张漫画一脚踹开了高佳毅的房门。“没什么，就是单纯的宣布你是我的人而已，教育局管不着的事，我来管。”夏沐：“……”说好的互不相识呢？欢喜冤家VS青梅竹马，腹黑男VS倔强女，生活就是一地鸡毛，哦，还有一点甜。', '108.5万字', 0.50);
INSERT INTO `book_info` VALUES (19, '陆少，今天离婚不', '', '吞酒', '1980-04-17', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/7e108f9e/group61/M00/76/50/CmQUOF3vbr-EDMV2AAAAAL45vYw071127265.jpg?v=6lRoCrd_&t=CmQUOF3vbr8.', '被抓来顶包结婚，新婚丈夫从不出现，只用大把的钱砸她？哇！美滋滋的小富婆生活在向她招手！谁知，正当她攒够小金库，准备跑路，饭票老公竟然回来了，说要和她一起传宗接代？！……从此，全城的人都能看到陆家夫人作天作地，日常作离婚。在外面受气了，乐照回家拍桌子：“我要离婚！”陆少：“给你找回场子了，乖。”在外面看中了跑车，卡里钱竟然不够，乐照回家叉腰：“我要离婚！”陆少：“给你买了，乖。”几百次的离婚不成功，乐照无奈了：“陆大少，你怎样才肯把婚离了？”陆少：“我知道你偷藏的儿子，是我的。”“……”她整个人都不好了……', '166万字', 0.50);
INSERT INTO `book_info` VALUES (20, '从血脉开始吞噬', '', '白菜大哥', '1985-09-14', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/78114cb9/group61/M00/81/BA/CmQUOF33WtSEHt7MAAAAAGO84XQ992520721.jpg?v=xbDpdPnM&t=CmQUOF33WtQ.', '荒岛重生，王超获得了吞噬异兽血脉的系统，掠夺千万种异兽的超级异能变得无所不能。王超驯服了神龙、巨蜥、金刚等各种强大的异兽，率领着异兽大军，开始横扫整个世界。', '35.3万字', 0.50);
INSERT INTO `book_info` VALUES (21, '重生成蛇之吞噬进化', '', '水城秀才', '1998-03-30', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/ed3294e4/group61/M00/76/50/CmQUOF3vbsCENqMJAAAAAHvHFIg539697386.jpg?v=RTezXqwt&t=CmQUOF3vbsA.', '赵昊带着吞噬进化系统，重生成为亚马逊丛林中的一条小蛇。只要吞噬猎物，就能获得血脉能量，快速成长为亚马逊丛林中的无冕之王。然而，这只是个开始……', '67.8万字', 0.50);
INSERT INTO `book_info` VALUES (22, '火影：从双神威开始', '', '龙卷', '1993-08-16', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/05944995/group61/M00/81/B1/CmQUOV33WtaEbWlrAAAAAAZl9hc488561698.jpg?v=zg9jIzSN&t=CmQUOV33WtY.', '林羽在家看火影时，意外穿越到宇智波带土身上！第一件事就是回收卡卡西的写轮眼，成就双神威！送走斑，杀黑绝，双神威在手，忍界我进退自如！柱间体，轮回眼，十尾人柱力，誓要挑翻大筒木！', '155.6万字', 0.50);
INSERT INTO `book_info` VALUES (23, '我有一座巨龙城', '', '东边夜雨', '2004-02-06', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/66c6fb79/group61/M00/89/5A/CmQUOV4B5b2EeykgAAAAAFgbkSU728175868.jpg?v=fwiJsWmw&t=CmQUOV4B5b0.', '别人出生在新手村，而我直接继承了一座巨龙城。10级解封山地亚龙。20级解锁毒液魔龙。30级解锁烈焰巨龙。鬼面獠龙，天灾骨龙，黑暗魔龙，……当网游降临现实，陆离脚踩永恒超越之龙，带领亿万龙族大军，粉碎入侵，征战诸天万界。世人对他的称谓众多，“龙语者”、“龙神”、“永恒之主”，尽皆保持敬畏之心。', '104.5万字', 0.50);
INSERT INTO `book_info` VALUES (24, '火影：神级选择', '', '望江闻吼', '1989-04-13', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/7e6d8461/group61/M00/7A/0F/CmQUOV3yH4KEPm1CAAAAAAE0-3E302990091.jpg?v=niw7jYtw&t=CmQUOV3yH4I.', '魂穿异世，伊久羽成为了一个被纲手收养的战争遗孤。可是情况不妙，原身刚刚从火影岩上跳了下来。原因难以启齿……幸好觉醒了神级选择系统，只要完成选择就能变强。1、被纲手拥入怀中，奖励身体伤势全治愈！2、手里剑投中靶心一百次，奖励最强手里剑之术！3、让山中井上五次后悔拒绝过你，每次都将奖励流刃若火的碎片X1，集齐五个碎片将获得火系最强斩魄刀，流刃若火！于是，伊久羽通过不断完成选择来变强。他左手冰轮丸，霜漫天地！右手流刃若火，焚尽苍穹！通灵召唤哥斯拉，大脚一踏，毁灭一座大山！八门遁甲爆发全身潜力，震震果实火力全开，一拳轰出，天崩地裂，瞬秒一大国！', '50.3万字', 0.50);
INSERT INTO `book_info` VALUES (25, '从罗刹街开始称霸镇魂界', '', '寡公', '1996-11-11', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/543edfc8/group61/M00/75/6C/CmQUOV3uKWKEDuoaAAAAAPabXLs123505048.jpg?v=OI2uXXmU&t=CmQUOV3uKWI.', '什么？你是曹家后人？拥有武神躯？能召唤不止一个守护灵？抱歉，我这混沌霸体，不但能召唤诸天神魔和万千妖兽，还能无限进化，就问一句，“你……怕不怕？”', '116.1万字', 0.50);
INSERT INTO `book_info` VALUES (26, '豪婿临门', '', '马筱虎', '2017-05-26', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/880e37b2/group61/M00/75/6A/CmQUOF3uKWOEb5QNAAAAACQ9E14366031818.jpg?v=l3yoMfby&t=CmQUOF3uKWM.', '窝囊？废物？不存在的！虽为上门女婿。但我要美人，也要江山！', '15.7万字', 0.50);
INSERT INTO `book_info` VALUES (27, '逆天废婿', '', '卫知几', '1976-03-03', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/1e4b11da/group61/M00/81/B2/CmQUOV33XDmERs4dAAAAANLRf5c645289991.jpg?v=MUHbrM82&t=CmQUOV33XDk.', '三年前，他是双臂尽废的上门女婿，三年后，身体恢复，强者回归，他是彻彻底底的护妻狂魔……', '83.4万字', 0.50);
INSERT INTO `book_info` VALUES (28, '纨绔医妃：九皇叔，宠我', '', '凤卿', '2012-06-09', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/60a670a1/group61/M00/81/B0/CmQUOV33Wr2EaxI_AAAAAKuvCnM545695379.jpg?v=s97dNCrX&t=CmQUOV33Wr0.', '她是二十二世纪神医特工凤倾凰，活死人，肉白骨，堪称“活阎王”！一朝穿越成了又肥又丑的花痴草包，系统磨刀霍霍，完成不了任务就要狗带，刚来就差点被个绝世美男不可描述，怀有身孕，死亡开局！他是睥睨天下，尊贵霸道的九皇叔，而她是一不小心坠入怀中的心肝宝贝，九皇叔此生的目标——深爱她，宠上天。花式壁咚，宠不停。“九皇叔，求放过！”某女被折腾地欲哭无泪。“乖，先帮本王生一堆小魔王再说……”“父皇！我觉得不行！”“父皇！我也觉得不行！”两个小萌宝突然跳出，扛着自家娘亲就要逃跑，娘亲是他们的，就算是父皇都不能让！从此她带着两个孩子跑，他开始漫漫捉妻路……', '45.2万字', 0.50);
INSERT INTO `book_info` VALUES (29, '从神格开始进化', '', '李别浪', '1979-05-12', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/61eb04f6/group61/M00/81/B9/CmQUOF33Wr-EP60hAAAAAMNrn1A589411497.jpg?v=5DBr_K_A&t=CmQUOF33Wr8.', '季墨穿越而来，变成了一颗神格。信季墨，得永生。不管是刀枪剑戟，坦克飞机，还是斗破的异火秘宝，或者神墓的洪荒大旗，应有尽有，助你无敌。不信者，必遭天谴反噬，重则命不由己，轻则跑肚拉稀。因为我就是天谴，我说了算！', '166.9万字', 0.50);
INSERT INTO `book_info` VALUES (32, '我在万界收破烂', '', '离心伤', '1995-05-19', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/1c8938f0/group61/M00/60/95/CmQUOF3o4yOETYRXAAAAAFBzUbY027309912.jpg?v=o9RiDVs4&t=CmQUOF3o4yM.', '小呀嘛小二郎啊，背着个麻袋捡破烂啊一个啤酒瓶啊，就卖了个五毛钱啊“咦！这里有个小盒子！”“叮！捡到破盒子一枚，回收点＋10000”', '67.8万字', 0.50);
INSERT INTO `book_info` VALUES (33, '三国帝王系统', '', '楼空', '1980-02-10', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/98e138a4/group61/M00/60/95/CmQUOF3o4ySEUOBeAAAAAJmxAUY113310679.jpg?v=a0loL2zh&t=CmQUOF3o4yQ.', '带着强大的系统穿越到三国世界，打造精兵猛将，无敌战神，一统三国世界，尽收天下美女。蔡文姬，二乔，貂蝉，洛神甄宓，孙尚香一个不放过……曹操眼红要来攻我？不怕，我二弟天下无敌！', '30万字', 0.50);
INSERT INTO `book_info` VALUES (34, '最强豪门赘婿', '', '勇士再战天涯', '2009-10-16', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/e2cdd270/group61/M00/60/95/CmQUOF3o4ySEBswKAAAAAHhNB9k872273870.jpg?v=TBPA9BXb&t=CmQUOF3o4yQ.', '苏家大少学成归来，遭遇家族陷害，无奈做了上门女婿，三年赘婿生活，彻底喜欢上了她，直到家族管家的到来，苏明的人生开始崛起，废物赘婿崛起都市，吊打一切不服。', '28.6万字', 0.50);
INSERT INTO `book_info` VALUES (35, '重生之吞天神帝', '', '溜烟', '1991-01-03', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/7e3f82b9/group61/M00/60/91/CmQUOV3o4KaEDB4mAAAAABidwNE619424423.jpg?v=F1anb50s&t=CmQUOV3o4KY.', '说我是废物？那是你不知道我的厉害。诸天众神，在我眼里，也不过是渣渣而已！', '93.3万字', 0.50);
INSERT INTO `book_info` VALUES (36, '独宠', '', '断崖处', '1984-04-09', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/20156425/group61/M00/60/92/CmQUOF3o4NiEbxwUAAAAAK1kqAg037729477.jpg?v=HAIPNO-W&t=CmQUOF3o4Ng.', '喜欢的人，一直未将自己放在心上，是何感觉？', '43.7万字', 0.50);
INSERT INTO `book_info` VALUES (37, '八技人', '', '骑驴看视频', '1990-07-28', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/160a7e97/group61/M00/60/94/CmQUOV3o4yGEWWSUAAAAAO3dFv4587663294.jpg?v=Bshbdbh3&t=CmQUOV3o4yE.', '陈明只是个普通人，却穿越来到一人之下世界。而一切，都源于他晚上上网回宿舍的时候，遇到了一个老头，送给了他一个奇怪的木球……', '42.6万字', 0.50);
INSERT INTO `book_info` VALUES (38, '娱乐，从97年开始', '', '进击的虎王', '1984-03-28', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/76ea88ef/group61/M00/60/95/CmQUOF3o41eELMc4AAAAAEz_VFI612317729.jpg?v=wgtXPHfm&t=CmQUOF3o41c.', '赵龙重生了，带着无数的遗憾，带着未来的记忆。这一世，他要统治整个好莱坞，开创一个属于自己的时代。', '38.9万字', 0.50);
INSERT INTO `book_info` VALUES (39, '西游之超神赘婿', '', '它说', '1984-06-19', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/4cbfff9d/group61/M00/B4/46/CmQUOF5BRkGECGJFAAAAAGECvLE915565016.jpg?v=GYjcHOGA&t=CmQUOF5BRkE.', '穿越到西游，从此天地认我闯。悟空是我小弟，白龙马是我坐骑，看我如何演绎一段神话西游！', '32.8万字', 0.50);
INSERT INTO `book_info` VALUES (40, '荒野迷踪', '', '戏红尘', '2001-07-06', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/3744c1df/group61/M00/60/94/CmQUOV3o4yGEbw-aAAAAAHpq65k715621578.jpg?v=-bA2_qH4&t=CmQUOV3o4yE.', '十多年前，他们的长辈神秘失踪。十多年后，他们同时收到一封记载着尘封记忆的书信，这是陷阱？还是线索？且看古烨他们如何从荒岛，一步步接近这个秘密，并且成为这其中的一员。', '27.1万字', 0.50);
INSERT INTO `book_info` VALUES (41, '美女总裁的超级女婿', '', '飞扬', '2013-05-18', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/a3141b38/group61/M00/60/94/CmQUOV3o4yKEJUCNAAAAADi50i8518787467.jpg?v=6eVkoK99&t=CmQUOV5Mu8E.', '杨家大少爷杨风阴差阳错成为了女总裁的上门女婿，从此遭受了各种冷眼讥讽，活得不如一条狗。三年之后，杨家禁令解除，掌管百亿集团，让那些曾经看不起自己的人，一个个疯狂打脸！', '90万字', 0.50);
INSERT INTO `book_info` VALUES (42, '英雄联盟之远古时期玩家', '', '瘦驴拉硬屎', '1986-09-26', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/0b9e569e/group61/M00/96/3B/CmQUOF4VOf6EKXc4AAAAAIt5lzk559895567.jpg?v=PKRjPO2U&t=CmQUOF4VOf4.', '面对LCK赛区战队恐怖的运营，LPL再次被零比二逼入生死局。\r就在国内所有观众放弃之际，米勒的耳机里传来一条通知……\r米勒：“Cyan战队的教练似乎在热身？”\r娃娃：“不仅仅是教练在热身，好像有一位女玩家也在热身？”\r米勒：“是啊，这是什么情况？”', '26.3万字', 0.50);
INSERT INTO `book_info` VALUES (68, '总裁的捉妖大师', '', '我的天籁之音', '1989-10-13', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/2aaacd1d/group61/M00/81/AF/CmQUOV33WcmEYjIiAAAAAJDeFRQ082792428.jpg?v=B8jnrKSE&t=CmQUOV33Wck.', '因为门派规矩，半吊子的夏小染必须下山捉妖的，但是一番折腾，妖没抓成，反倒给自己抓到了一个总裁老公。看夏小染如何从一个捉妖小白如何在豪门中成为一代捉妖大师……', '164.7万字', 0.50);
INSERT INTO `book_info` VALUES (69, '最强妖孽武神', '', '苏九月', '1998-10-17', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/fc6f5582/group61/M00/75/69/CmQUOV3uJpmEH8rOAAAAAJw9Si0902410875.jpg?v=7PAsbcji&t=CmQUOV3uJpk.', '江晨一觉醒来，发现整个世界都变了！灵气复苏的世界，江晨修魂力，战群魔，单手握神兵，横扫四方！论红颜，血雨腥风，比不过你眉间一笑！说兄弟，狂霸天下，胜不过一句兄弟安好！指剑问群雄，谁敢与我一战？且看这世道谁主沉浮！', '221.3万字', 0.50);
INSERT INTO `book_info` VALUES (70, '我太有福了', '', '洗澡两分钟', '2008-10-10', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/0b5d1611/group61/M00/75/67/CmQUOF3uJpuEMB9lAAAAAFJE3us988217447.jpg?v=CctDJclU&t=CmQUOF3uJps.', '灵气复苏了，人类进化了！实验高中一班吉祥物吉祥也进化了。吉祥如意，鸿运当头，本书讲述了一个由老天养大的小人物成为全人类福神的故事。', '108万字', 0.50);
INSERT INTO `book_info` VALUES (77, '仙王重生在都市', '', '九月', '1986-11-21', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/43a90e5d/group61/M00/60/73/CmQUOV3o3k2EGuuDAAAAAB6O0LQ884136421.jpg?v=B-eKUaeR&t=CmQUOV3o3k0.', '造化仙王杨旭，重生回到都市。前世血债，今生命偿，这一次，他要不留遗憾，弥补所有的错过。三尺青峰所向，诸天神佛退避！', '77.7万字', 0.50);
INSERT INTO `book_info` VALUES (78, '最佳神婿', '', '征战星野', '2014-01-10', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/c652b98e/group61/M00/60/73/CmQUOV3o3k2EXsRNAAAAAERJiMs157812461.jpg?v=oi4NTYlr&t=CmQUOV3o3k0.', '作为吃“闲饭”的，韩信一直在丈母娘和亲戚面前抬不起头；直到老婆为他受难，韩信决定，不再隐忍……', '97万字', 0.50);
INSERT INTO `book_info` VALUES (319, '悲剧的诞生：尼采美学文选', '作家', '尼采', '1990-02-06', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/f7b592a4/group6/M00/17/63/CmQUOVbCw_WENVaYAAAAAEQmOIw927146046.jpg?v=47z_Fy2n', '《悲剧的诞生》出版于尼采二十七岁时，是他的第一本书，也就是这本书让他一鸣惊人。尼采认为古希腊人有两种精神，即日神精神和酒神精神。日神阿波罗是光明之神，在其光辉中，万物显示出美的外观；酒神则象征情欲的放纵，是一种痛苦与狂欢交织着的癫狂状态。在本书中，他凭借他“最内在的经验”理解了“奇异的酒神现象”，并“把酒神精神转变为一种哲学激情”。', '26万字', 60.00);
INSERT INTO `book_info` VALUES (320, '中国历代女性的文学世界', '湖北人民出版社', '王凡', '2012-01-17', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/bfaf52bd/group6/M00/66/F8/CmQUNlaA2aaEZwx1AAAAAPgp99w149334365.jpg?v=83C133M9&t=CmQUNlqCSwA.', '明末清初学者冒辟疆说，一个美女的诞生，要秉合天地万物的灵气，“庶几铸此一人”。清初小说家张潮说，所谓美人者，以花为貌，以鸟为声，以月为神，以柳为态，以玉为骨，以冰雪为肤，以秋水为姿，以诗词为心，以翰墨为香。冒氏、张氏的话使我们想起所谓“五百年必有王者兴”，“江山代有才人出，各领风骚数百年”之类的诗句，美女与王者，竟然都是人类量产的稀缺资源，难怪清代诗人袁枚要发出感叹：天生人最易，生美人最难！', '22.2万字', 60.00);
INSERT INTO `book_info` VALUES (321, '汉武大帝', '长江文艺出版社', '杨焕亭', '2005-04-13', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/5935b5ac/group6/M00/10/32/CmQUOFaA0uSEOmZqAAAAAHDMBCU934009812.jpg?v=p1CCIggF', '本书汉武大帝以刘彻的幼年开篇，通过风险继位，掌握大权；用贤变法，尊王攘夷；大战匈奴，出使西域；巫蛊为乱，罪己示民等重大事件，围绕和与战、治与乱、忠与叛、生与死、得与失、情与恨的矛盾，向读者全景式地展现了汉武帝纵横跌宕的一生和那个风云变幻、英雄辈出的时代。其间宫廷的明争暗斗，大汉帝国征战四方、金戈铁马的壮观气象。“黄沙百战穿金甲，不破楼兰终不还！”抵御外族入侵，气势宏大的战争场面，壮烈激越的将士情怀，雄视天下的盛世风华，都将在这部作品中得到展现。', '91.2万字', 60.00);
INSERT INTO `book_info` VALUES (322, '资治通鉴', '长江文艺出版社', '司马光', '1984-03-06', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/41d4f5c0/group6/M00/66/EF/CmQUN1aAss6EZHLqAAAAAHr0jtk043758290.jpg?v=GCkESMzB', '本辑推出了30个品种，包含经、史、子、集等各个门类，囊括了中国传统文化的精粹。该丛书以尊重原典、呈现原典为准则，对经典作了精辟而又通俗的疏通、注译和评析，为现代读者尤其是青少年阅读国学经典扫除了障碍。所推出的30个品种，均选取了当前国内已经出版过的版本，由袁行霈、唐明邦、赵逵夫、王兆鹏、唐浩明等倾力编注，集经典性与普及性于一体，是了解中华传统文化的一套读本。“资治通鉴”是一部编年体通史，记载了从周朝到五代一千三百多年的历史，主要描述与国家兴亡有关的事迹，使后人“有鉴于往事，以资于治道”。直到今天，这部巨著仍然是现代生活、政治和军事的重要参考。本书所选着眼于重要人物和重大历史事件，生动的故事中处处闪耀着古人的智慧之光。', '19.8万字', 60.00);
INSERT INTO `book_info` VALUES (323, '十字弓·亡者归来', '长江文艺出版社', '恒殊', '1986-09-16', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/6c4a318b/group6/M00/66/EF/CmQUN1aAss2EdG39AAAAAHKM8lc648346352.jpg?v=zVIw-qAD', '1888年，秋，伦敦城被一股有史以来最厚重的浓雾所笼罩。就在这段时期发生了神秘的谋杀事件，接二连三的妓女被杀，并且她们都被凶手残忍地割喉剖腹。恐怖凶案震惊了苏格兰场，也一并引得民心惶惶。有人在雾气中听到了哭声，有人见到了幻影，有人在雾气中不明不白地死了。但没有一个人看到凶手，完全没有任何目击证人。死亡的阴影降临了整个伦敦城。最后，连维多利亚女王都被惊动了。她怒斥苏格兰场的办事不力，并亲自委任了自己的贴身御医高尔爵士参与了尸体解剖与案件调查。同时，熟悉英格兰本地的长老【月】罗莎和梵蒂冈驱魔人朱塞佩神父分别被派往伦敦调查此案，探长无计可施之下想出了举行降灵会的办法，与死者进行沟通。在调查过程中，白玫瑰庄园的少主方廷斯少爷也出现在伦敦城，案件越来越扑朔迷离了……', '11.2万字', 60.00);
INSERT INTO `book_info` VALUES (324, '明天被颠覆的是什么', '北方妇女儿童出版社', '林汶奎', '2010-08-28', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/462939f4/group6/M00/64/BB/CmQUN1ZzhquEGD5_AAAAAHsaBQY802285659.jpg?v=hkskpabE', '国内外的企业家已经有这样的共识：在10年之内，会有50%～60%的中国传统企业迈不过当前这个坎儿，惨遭颠覆。　　《明天被颠覆的是什么》由作者从十年来跟踪的数千个互联网创业实验中，精心挑选而来。71个具代表性的创业实验，每个创业实验都代表了一种即将到来的商业趋势，也基本上覆盖了当下中国创业浪潮中，有可能颠覆现有商业格局的创业实验。　　《明天被颠覆的是什么》会彻底颠覆你对传统商业的看法，挑战你的商业思维极限。书中展示的71项创业实验将互联网与传统商业完美结合，汇集成当今中国绝妙的创业理念，成效惊人!', '16.4万字', 60.00);
INSERT INTO `book_info` VALUES (325, '暗恋古董衣', '百花洲文艺出版社', '山亭夜宴', '1979-09-01', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/bbe073e4/group6/M00/52/B2/CmQUNlY8Qy2EQ57QAAAAAJRZoZo172138176.jpg?v=nJkElOrG', '一件来自上世纪二十年代的小黑裙，让娄依凝走进家族里几代人隐藏在心里的秘密。看似平凡的长辈们，原来都各自背负着惊心动魄的爱情往事。而那些神秘的古董衣，一层一层揭开了上一代的爱恨情仇，也解开了娄依凝心底有关暗恋的故事……本选题为小说单元剧，分为五个单元，每个单元都由一个主线故事（现代女孩探访家族秘密）和一个辅线故事（民国女孩从依赖男人到自强不息的成长之路）组成，独立为一个关于爱情、服饰与时代的故事。每个民国故事里的人物都和辅线女主有交集。女主因为暗恋的人被闺蜜抢走后迷失了方向，意外的礼物让她开始寻找古董衣服背后的故事，其实这是她找回自我的过程……', '16.5万字', 60.00);
INSERT INTO `book_info` VALUES (326, '请把我留在这时光里', '花山文艺出版社', '周洁茹', '1983-01-15', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/e81f064f/group6/M00/53/E7/CmQUN1Y--OyEK6E0AAAAAAzN1-M975023162.jpg?v=ckBhwM0T&t=CmQUN1qCSwg.', '本书为周洁茹过去十五年的作品集，分别写自美国至香港的见闻、生活，和封笔后至再次执笔期间对文学、写作的感悟。作者用她细腻而略带感伤的笔触回忆她可爱而一个个离开的朋友、描刻她焦虑而终归淡然的生活，写她品尝到的爱情和亲情的滋味，写她对写作的重新认识和热爱。在一个一个故事的叙述中，时光如沙漏般缓缓流逝，却又像是旋转木马，一圈一圈，令人浑然不觉，待停下才发觉物换星移。作者华丽转身，平静归来，洗尽铅华，浮沉世事，十五年心路历程娓娓道来，为时光作序。', '10.4万字', 60.00);
INSERT INTO `book_info` VALUES (327, '上班族立体健身处方', '(人民)湖北人民出版社', '王丽君', '2010-09-20', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/80113f79/group6/M00/54/4A/CmQUN1ZAD6eEe8QdAAAAAAG5A8o861412086.jpg?v=5Rh7qcnG&t=CmQUN1qCSwY.', '书稿介绍了不同年龄上班族人群的个性化运动处方与营养处方、不同健身项目与不同季节的个性化运动处方与营养处方；不同特殊环境下的健身运动处方与营养处方；身体消瘦或肥胖者的运动干预处方与膳食调配处方；健美训练人群的运动处方与营养处方；防治健康危机的个性化营养处方及不同职业人群的健康促进营养处方、不同精神状态人群的营养干预处方、不同养身健美目的人群的食物选择处方、不同体质状态人群保健食品的选择处方、不同颜色食物的特殊作用与食物选择处方、女性不同时期的膳食营养处方、预防营养失衡的膳食补充处方；不同健康危机人群的个性化运动处方及增进体质健康、防治精神卫生疾病、调适营养失衡、抵御环境因素疾病、增强免疫力、延缓早衰的健身运动处方。', '15.6万字', 60.00);
INSERT INTO `book_info` VALUES (328, '为什么我们的决定常出错', '(天津人民出版社)', '韦秀英', '1987-08-02', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/7cf0e2dc/group6/M00/52/B4/CmQUNlY8RZ-EXS4EAAAAAOlKOqk784304093.jpg?v=kqIiiS1I', '本书运用通俗易懂的故事和案例，有针对性地讲解了沟通中的实战技巧和方法。阅读本书，可以从日益增长的自信和热忱中，得到生活的力量，增进沟通能力，学会为人处世的技巧。掌握了“做决定”听起来只是一个简单的行为，可是它却像人生的陷阱和诱惑一样，时常让我们犹豫不决，最终做出错误的决定。难道就没有什么方法可以帮我们走出做错决定的困境吗？哈佛教授的8堂行为心理课将给我们最好的答案。在本书中，你能够从行为学和心理学角度去了解人们是如何做错决定的；决定本身是一种怎样的过程；有没有什么方法可以避免做错决定；做决定之后我们又该如何进行修正和弥补……各种你所关心的问题，都能从本书中找到答案。', '11.9万字', 60.00);
INSERT INTO `book_info` VALUES (329, '藏在这世间的美好', '武汉出版社', '鼹鼠的土豆', '1999-07-13', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/27fb3943/group6/M00/64/BA/CmQUNlZzgIeEClUPAAAAAIIDRNs168129372.jpg?v=FgCrvyMQ&t=CmQUNlqCSv4.', '一本让你找到自我，坚定信念的人生成长之书。本书由豆瓣红人、鼹鼠的土豆所著，生活中的美好，总藏在你的身边，只是等待着你发现。本书核心为：不管这个生活如何对待你，让你孤独，无助，让你生活中处处充满不顺，在青春的迷茫与困境中，总有生活的的爱陪伴着你，以便达到人生的美好状态。生活中处处都是美好，只是我们少了发现美好的眼睛，阅读本书吧，你会发现生活中总有美好等待着你。', '10.2万字', 29.90);
INSERT INTO `book_info` VALUES (330, '刺我一个吻', '长江文艺出版社', '黄伟康', '2017-06-30', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/78d93591/group6/M00/52/BE/CmQUNlY8VRaEKLQjAAAAAPsLAnw518267059.jpg?v=H-GGNHwZ', '青春如歌一曲如泣，于彷徨、躁动处闯下大祸——我是少女插科打诨往来职场，只盼坚韧如丝不负男儿——我是白领逆时局忤人言，于催促、辛酸处等待此间少年——我是剩女人生信条是“无法当女神苏菲玛索，那就当一片舒适苏菲”的天真，在一次次相亲中以古怪行径让对方知难而退。她看似粗糙的灵魂里，却藏着一个无比柔软的秘密：找到下一个能接受她所有缺点的人。然而一天，天真在一场特殊的相亲中遇到了棘手对象张家奇，并意外地在现场碰到她失踪多年的男友向东，所有的爱恨情仇一触即发……十年前，北京的一场“非典”疫情迫使天真在逃校浪潮中，跟随青梅竹马的向东私奔南下，却在途中风寒加重，最终被实习护士梁晓初所救。大学期间，一场意外卷入的刑事案件，以及一起梁晓初在寝室服药、试图流产未果的事件震惊校园。从此，成长的轨道被彻底改写。十年后，面临向东的婚讯，成为剩女的天真虚浮在青春的汪洋中央，进退两难。当年那起刑事案件还在以新的方式发酵，站在人生的十字路口，天真究竟该何去何从，最终迈向她的第二人生？', '17.8万字', 60.00);
INSERT INTO `book_info` VALUES (331, '内心的富贵', '(长江本部)长江文艺出版社', '赵伟东', '1987-04-06', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/d2bcb1ea/group6/M00/52/AC/CmQUN1Y8OrCEId72AAAAABatrxI289360026.jpg?v=IEI9YGnK', '内心的富贵是一生的目标。致力于内心的富贵，所有追求才有人性的尊严，无论是平民百姓，还是达官贵人，只要内心富贵，都能焕发出神性的光辉。人是有性灵的生命。活出人的性灵，才能无愧于人。', '17.9万字', 60.00);
INSERT INTO `book_info` VALUES (332, '你看见我男朋友了吗？', '长江文艺出版社', '曹小优', '2004-11-22', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/0ba2093e/group6/M00/52/AF/CmQUNlY8Pc2ETq_AAAAAANA0qxM620370742.jpg?v=0M-9Pji1', '青梅竹马的情侣昼和舜一起度过了平静美好的青春岁月，突然一天，舜失踪了。昼开始出门找他，然而面对茫茫的世界，她空落落地预感到，这一生也许要和寻找舜这件事永远相关了。沿着唯一的线索，昼找到了美丽而沉静的田渚瞳，得知了一段不为人知的恋情。昼惊讶地发现，十二年来，她深爱着舜，却对他一无所知。在这条寻找爱人的路上，一个又一个线索，将昼引向情感秘密的暗流，舜的一切在向她展开，她的内心也在向自己敞开。熟悉的街道，平凡的人们，原来这世上每一天都在进行着透明的战争。舜为何离开，他们的爱情又将何去何从？', '9.6万字', 60.00);
INSERT INTO `book_info` VALUES (333, '相爱不说再见', '(长江本部)长江文艺出版社', '尔容', '2017-06-15', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/c39e7d49/group6/M00/10/69/CmQUOFaCAIaETpwiAAAAAPtnGHE303332675.jpg?v=1F-UjnV1&t=CmQUOFqCSvs.', '暖心纯爱长篇力作。他，执着于理想，在坚守与犹疑中捍卫信念，他忠于爱情，在现实的窄巷中游戏人生，直到邂逅真爱。事业与情感，真爱与背叛，一个男人与几个女性的人性大戏。', '21万字', 60.00);
INSERT INTO `book_info` VALUES (334, '一世安宁', '长江文艺出版社', '张瑞', '1993-04-02', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/36227d83/group6/M00/52/B8/CmQUNlY8Sx-EGnpGAAAAAOkVTf0557129869.jpg?v=YANurtFD', '顺英帝征戎被俘，承康帝继位，太子萧璟年、太子伴读沈宁晖与勇毅侯蒋鹰一同被遣往西山行宫。不久，女扮男装的沈宁晖暴露了身份，并道出缘由。沈宁晖生性活泼直率、体贴温柔，不但没有被萧、蒋二人告发，反而赢得了他们的爱慕。后蒋鹰被召回京，萧、沈留在西山，朝夕相伴、生死与共，情分甚笃、私定终身。蒋鹰虽身在京，却对萧、沈惦念牵挂，对沈宁晖更是暗加保护，且多次亲赴西山关照，沈宁晖却只当他作挚友兄弟，蒋鹰仍一如既往。五年后，英帝复辟，太子回宫，婚期将至，太子妃定下的却是别人，强权难违，萧璟年亦不复当年决绝，无奈妥协，许沈宁晖为侧妃，沈宁晖则不愿委曲求全，伤心至极，念想俱灭，遂回漠北。每当临月伤怀，邻院便有悠扬笛声传来，熟悉的曲调唤起如梦往事。萧璟年的印象已经模糊，但另一男子的形象却鲜明清晰起来，但往日自己眼里只容得下萧璟年一人，其他人自是旁处风景。而今想来，甚是辜负了那人热切的情意。造化弄人，错开一步，便是一生，悔恨与遗憾一齐涌上心头，暗自神伤之际，墙上跃下一人，沈宁晖抬头一看，惊愕不已，夜夜弄笛之人，正是蒋鹰无疑，再相逢，人事皆非，二人又当如何以对......', '24.8万字', 60.00);
INSERT INTO `book_info` VALUES (335, '玻璃笼子', '中信出版社', '尼古拉斯·卡尔', '1979-01-19', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/c53612f9/group6/M00/52/48/CmQUN1Y7LSuEEKdLAAAAAI7TmOo818963891.jpg?v=ysePqkis&t=CmQUN1py5Co.', '尼古拉斯卡尔在《玻璃笼子》中指出，自动化在分担我们工作的同时，也弱化了我们的才能，偷走了我们的生活，限制了我们的视野，它甚至将我们暴露于监控之下，操控我们。当计算机和一切智能设备变成我们生活中的伴侣时，应更加留心它如何改变了我们的行为和身份。卡尔的作品无疑给我们这个时代注入了一剂清醒药。他独特的思考问题角度，犀利甚至略为偏激的观点再加上丰富的最前沿的科技案例会让人读起来畅快淋漓、有醍醐灌顶之感。我们每天都在使用智能设备，经常为一个又一个技术的进步而欢呼，读完本书，我们的看法将被彻底颠覆。', '13.4万字', 294.00);
INSERT INTO `book_info` VALUES (336, '杰出青少年应具备的30条生存本领', '黑龙江科学技术出版社', '问道,王非庶', '1985-05-12', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/2476f5c3/group6/M00/12/B4/CmQUOVaTa_iEcedoAAAAAKB9Qq0917852332.jpg?v=GyuvRIDf', '生存是每个人都要面对的深刻课题,人类的生存不仅指解决温饱问题的自然生存,更重要的是如何在社会的大舞台施展出色的本领,创造杰出、卓越的人生。本书从自我定位、终身学习、选择与放弃、把握机遇、人际关系、团结合作、积极心态、统筹时间、辨识人性、把握情感、安全理财、处理信息、培养口才、塑造形象、控制情绪、平衡生活、自我保护等层面,总结出杰出青少年应具备的30种生存本领,帮助广大成长中的青少年练就出众的本领,为将来适应社会、迎接人生挑战做好充分的准备。', '38万字', 39.90);
INSERT INTO `book_info` VALUES (337, '像铁人一样工作', '石油工业出版社', '张艳红', '1998-03-16', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/882d3eba/group6/M00/69/FA/CmQUNlaWD7CEBdxwAAAAADcc-DI310798057.jpg?v=-RzMzBSh', '铁人追求完美、苛求细节。用最高、最严格的标准来要求自己。他拥有最优秀的品质和素质,他热情、踏实、自律;他精业、乐业、敬业:他忠诚、知恩图报,是当代员工的典范。铁人精神。是大庆精神典型化的体现和人格化的浓缩,是中华民族精神的组成部分。具有不朽的价值和永恒的魅力。铁人精神推动了石油大会战走向胜利。推动了中国石油的发展。同样。伟大的企业必然要有伟大的精神推动。伟大的精神是企业的灵魂。是企业全体人员活力的集中体现,是激发员工奋发向上的强大动力。通过它,在企业内部会形成一种强大的凝聚力。使每个人受到熏陶和感染,从而激发起高昂的士气,提高工作激情。', '12.9万字', 49.90);
INSERT INTO `book_info` VALUES (338, '趣说万事万物的起源', '石油工业出版社', '李琳,问道', '2014-07-31', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/58fc5cb4/group6/M00/69/7C/CmQUN1aTLHyEMouwAAAAAAieI58109784882.jpg?v=DoUA34T4&t=CmQUN1lbawo.', '世界上的万事万物皆有其源头,关于它们的起源和由来,一直以来都是大家十分关注和津津乐道的话题。从本质上讲,每一种事物的起源背后都蕴含着一段历史、一段趣说,它们反映了我们的生活和历史文明的变迁。为了编辑此书,我们参考了大量专业书籍以及通俗读物,精心选辑了数百个事物的由来,这些事物不但与我们的生活息息相关,而且妙趣横生。本书涵盖天文地理、经济贸易、邮政交通、医药卫生、节日民俗、大众饮食、职务称谓、日常生活、艺术人生、体育娱乐等多个领域。为了增强本书的知识性,我们在每一条事物由来的后面还加入了与之相关的知识链接,进一步延展了知识的广度和深度。', '26.6万字', 60.00);
INSERT INTO `book_info` VALUES (339, '长安盗', '江苏文艺出版社', '海岩', '1976-04-12', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/bea6afd0/group61/M00/4E/23/CmQUOF3OeHuERhZcAAAAACx3lmY640923548.jpg?v=O-ecEMP8&t=CmQUOF3OeHs.', '赵红雨在辞掉刑侦工作准备读研的假期里，遇到了改变她一生命运的大事。身为知名电视节目《唐史讲坛》主讲人的生父万正纲上门认亲。不料，一起轰动一时的“贞顺皇后敬陵失窃案”，将逐渐开始接受并适应这份亲情的父女二人拉进了一场名利与财富、道德与法律的争锋交战中。情理与法理、名利与情义、金钱与文化，各种交锋论衡，案件曲折迷离，人性拷问深刻。一段生存在正义与邪恶夹缝中，青梅竹马的生死之恋；？一场惊天动地、令人发指的迷离案件！？到底是什么让人性变得如此丑陋扭曲？？又是什么让美好纯真的爱变得不复存在？？在金钱、利益、诱惑与邪恶面前，人性还在吗？？而爱又能活下来吗？？阔别五年，看海岩归来，为你讲述迷离的案件，替你拷问人性的深刻！', '16.2万字', 199.90);
INSERT INTO `book_info` VALUES (340, '我穷得就剩下钱了', '', '职业神棍', '1980-03-14', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/61bed347/group61/M00/4E/14/CmQUOV3OaPiEVqchAAAAACcENqE767946131.jpg?v=Jud_zydi&t=CmQUOV3OaPg.', '未婚妻每月伸手索要生活费，拿着我的血汗钱钓金龟婿。', '189.1万字', 0.50);
INSERT INTO `book_info` VALUES (426, '三体全集（全3册）', '', '刘慈欣', '2013-11-13', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/bc6ef8d1/group61/M00/9C/7A/CmQUOVycjHiEHEavAAAAAAqB0h8765287492.jpg?v=zzHQJdFa&t=CmQUOV6IxR4.', '本平装书包含《三体1·地球往事》《三体2·黑暗森林》《三体3·死神永生》。', '88.3万字', 0.50);
INSERT INTO `book_info` VALUES (484, '簪中录合集', '', '侧侧轻寒', '2013-01-15', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/787e734b/group61/M00/54/26/CmQUOV3XlxiEZX65AAAAAMf8Ebw891867179.jpg?v=4m_zP0b8&t=CmQUOV6IsaQ.', '由一段女宦官的爱恨情仇，牵引出步步大唐皇家惊心的秘案。唐朝懿宗年间，名闻天下的女探黄梓瑕混迹于皇子之中身背谋害全家罪名的破案，遇到玉树临风却遭受诅咒，怀疑王妃真假的宫廷王爷时；当他送给她的那支断案惯用的精致玉簪，一步步置他安静游动却食人鲜血的小红鱼于死地时；怨憎恨、爱离别、求不得。', '93.9万字', 0.50);
INSERT INTO `book_info` VALUES (485, '一粒红尘', '中国文联出版社', '独木舟', '1977-05-01', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/8a3aa08f/group6/M00/32/02/CmQUN1X2pVmEZkIpAAAAAFb1fbk420436540.jpg?v=GmcCqN-v&t=CmQUN16IsaM.', '有的时候生活能成全一段爱情，有的时候生活能逼疯一段爱情。有的时候青春能成就我们的理想，有的时候青春只是黑暗的坟墓，理想至此剧终。从此人生漫长，得到的尚未得到，失去的就此失去。叶昭觉与简晨烨的感情始自高中，也有过青葱纯白的曾经，只是那些美好一旦遭遇张牙舞爪的生活就变得如此不堪一击。一切的一切都在证明这段爱情无望了，随着闺密邵清羽的情感变故、泼辣女生乔楚的疯狂追逐让她们的青春变成了一个旋涡，吞噬了所有人的悲喜……', '14.8万字', 89.90);
INSERT INTO `book_info` VALUES (486, '机械战警', '', '弗兰克·米勒', '1996-05-28', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/d2a55ad2/group6/M00/32/01/CmQUN1X2pVaEdhvSAAAAAPLAWzg999970096.jpg?v=HLYynjYO', '一名警察在一次执行任务的过程中遭遇不幸，后来经过科学家的改造，成为了一名人与机器结合的警察，由此展开了与罪犯的斗争。2013开始，机械战警开始全新连载电影版衍生漫画。', '179字', 3.90);
INSERT INTO `book_info` VALUES (487, '机甲女神', '', '飞天的肥猪', '1997-10-15', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/d53aafff/group6/M00/32/02/CmQUN1X2pVyEY1JHAAAAAN_4f0A954415176.jpg?v=y00uANdh&t=CmQUN16IsaQ.', '漫画讲述一场毁天灭地的世界大阴谋之下，一群屌丝级的逍遥女汉子们摇身一变机甲女神，以智慧与能力应对一波又一波惨烈攻击，在重重危机中为自己为国人谋得一席生存之地。这部漫画目前授权腾讯动漫网、有妖气连载，成为2014年末原创漫画中的一匹黑马。', '702字', 1.90);
INSERT INTO `book_info` VALUES (488, '精益创业方法论：新创企业的成长模式', '机械工业出版社', '龚焱', '1992-11-02', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/821881d0/group6/M00/32/02/CmQUNlX2pWCEHLOPAAAAALR7L_w872726485.jpg?v=tJStBIl_', '为什么无数新创企业以失败告终？为什么天才点子、完美计划和完美的执行是导致失败的关键？颠覆性、创造性、混乱状况是否可以加以管理？Facebook在6年间以病毒一样惊人的速度传播，微信短短两年获得了6亿用户，这些公司都遵循着一套科学、严密的创业流程和工业方法，这种方法教你认清自以为是的假象，让你在亚马逊丛林的迷雾探险时成功找到水源，一切不是未来时，而是现在时，再砰然心动的点子、在完美的商业计划也经不起与用户的第一次接触，推动创新的永远都是生气的用户。创业者都在不确定性风暴的中心，随机应变是企业最重要的资本，面对瞬息万变的未来，每个人都要成为一名学生，所有的努力，不为求得一个确定性的结果，而是为了获得当下的认知。', '4.1万字', 249.90);
INSERT INTO `book_info` VALUES (489, '产品型社群：互联网思维的本质', '机械工业出版社', '李善友', '1977-08-20', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/49bd2657/group6/M00/32/02/CmQUN1X2pWGEJJYgAAAAAEpT1EI704523003.jpg?v=S3CU4dDp', '传统模式企业正在直面一场空前的“降维战争”，结局惨烈，或生或死。传统模式很难避免悲惨下场，诺基亚等昔日庞然大物轰然倒塌，柯达发明了数码成像技术却依然破产，新商业的兴起到底遵循的是什么模式？微信轻而易举干掉了运营商的短信业务，“好未来”为何让传统教育不明觉厉？花间堂为什么不是酒店，而是入口？将来不会有互联网企业与传统企业之分，只有互联网思维与传统思维的较量。这是一个崭新的时代，产品的生命周期越来越短，一个企业凭一款产品就可以一战成名，一个产品一出生就可以风华正茂，产品对产品的颠覆将成为常态。这是一个降维化生存的时代，方生方死的时代，颠覆式生存的时代，超越时空获取资源的时代，这是一个审美的时代，灵性回归的时代。', '6万字', 199.80);
INSERT INTO `book_info` VALUES (490, '颠覆式创新：移动互联网时代的生存法则', '李善友', '李善友', '1993-05-21', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/5f00f33a/group6/M00/32/02/CmQUN1X2pWKEJ1yFAAAAAJ69urU748754064.jpg?v=oELaW5oF', '为什么把每件事情都做对了，仍有可能错失城池？为什么无人可敌的领先企业，却在一夜之间虎落平阳？短短三年间诺基亚陨落，摩托罗拉区区29亿美元出售给联想，芯片业霸主英特尔在移动芯片领域份额几乎为零，风光无限的巨头转眼成为被颠覆的恐龙，默默无闻的小公司一战成名迅速崛起，令人瞠目结舌的现象几乎都被“颠覆式创新”法则所解释。颠覆式创新教你在新的商业竞争中“换操作系统”而不是“打补丁”，小公司用破坏性思维可以“以小博大”占领新兴市场。大公司进行自我攻击，才是唯一活下去的机会，今天，全人类都面临一个在新“价值网”中生存的大悬难，本书从哲学、物理、思维、管理多个维度，探索已知世界的边界，透过费解的现象，揭示商业社会中令人惊悚的真相。不确定的世界里，探索比结论重要，移动互联网时代，见识比知识更重要。', '6.5万字', 180.00);
INSERT INTO `book_info` VALUES (491, '超体验：BAT格局下的京东崛起', '机械工业出版社', '苏醒,柴文静,黄璠', '1978-09-13', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/a7cffcd5/group6/M00/32/02/CmQUNlX2pWOEVxaFAAAAAMGV4ek769052997.jpg?v=_9fM6bYL', '本书专注于解答这样一个疑问：为什么在这个平台化、生态化的时代，会出现看起来过于专注自营B2C、不够开放、不够平台、不够互联网思维的京东这样的“生物”，并且它能够如此快速、生机勃勃地成长壮大呢？为什么偏偏是京东抓住了随着电子商务产业高速成长而成长的机会？为什么偏偏是京东成为B2C巨头、实现交易额突破千亿？为什么偏偏是京东打破了已经保持多年动态平衡的互联网BAT三足鼎立的格局？', '6.2万字', 180.00);
INSERT INTO `book_info` VALUES (492, '互联网+：从IT到DT', '机械工业出版社', '阿里研究院', '2012-05-01', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/d30097f1/group6/M00/32/03/CmQUN1X2pWqEWKtOAAAAAPk_Shc087571884.jpg?v=duDB38Lr', '2015年，“互联网+”写入李克强总理的政府工作报告，“互联网+”成为国家经济社会发展的重要战略。《互联网+：从IT到DT》深度解析了“互联网+”的内涵及其与云计算、大数据、新分工网络的关系。世界正从IT走向DT（数据技术）。IT以自我控制、自我管理为主，DT以服务大众、激发生产力为主，未来属于DT时代。“互联网+”的过程也是传统产业转型升级的过程，IT企业与传统企业的完美融合，将对人类经济社会产生巨大、深远而广泛的影响。本书分为升维与变革两个部分，详尽地阐述了“互联网+”行动将以夯实新信息基础设施、提升原有工农商业基础设施、创新互联网经济、渗透传统产业为指向，为中国经济实现转型与增长开辟新路。“人类正从IT走向DT，只有让别人成功，你才会成功！”', '19.2万字', 250.00);
INSERT INTO `book_info` VALUES (493, '集体叙事实践：以叙事的方式回应创伤', '机械工业出版社', '登伯勒', '1988-11-05', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/f2db364d/group6/M00/32/03/CmQUNlX2pWaEUgY3AAAAAEI6mMc860933755.jpg?v=HOa-CX_i', '这是本书要回答的三个重要问题。作者借助丰富的叙事实践经历、深入的思考与精巧的编排，为读者呈上一份思想的盛宴，对重大群体灾难中叙事实践的方式、生命之树、生命之队、民俗文化、艺术化生活、超个人心理学等诸多重要的议题做了深入细致的探讨。每一章都是叙事治疗创造性的运用，收集了许多新的叙事实践的元素。书中特意运用了一些容易实践的方法，适用于孩子、年轻人和成年人。', '11.6万字', 180.00);
INSERT INTO `book_info` VALUES (494, '孩子你慢慢来（套装共5册）', '京华出版社', '编委会', '1994-11-07', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/5a00f0fa/group6/M00/7D/B4/CmQUOVjdJK2ELPeMAAAAAMtuQbQ957048288.jpg?v=eHOe_11f', '本书共收录孩子你慢慢、他们这样说、我们怎样做父亲、给孩子美好未来、热情、魅力、责任五本精选图书。孔子曰：以责人之心责己，以恕己之心恕人。当我们在寂寞的人生旅途中走来，我们要珍惜眼前盛开的每一朵花，因为，每一朵都有它盛开的理由。曾经看过这么一句话：宽容是生活的一种香味。多美啊！孩子的任何一个错误，大人们都不可小视。为了不使他们的心离我们越来越远，我们应细心倾听他们的心声，宽容地给他们一个改错的机会，而不是一顿粗暴的打击。', '50.8万字', 50.00);
INSERT INTO `book_info` VALUES (495, '洞见外太空的秘密 科普丛书 共7册', '辽海出版社', '李宏', '1999-09-28', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/aa280425/group6/M00/7D/B3/CmQUOFjdJK-Ed0uvAAAAACWni08357270590.jpg?v=frMZg9vi', '本书包括浩瀚无垠的宇宙、奇妙的日食与月食现象、人类对月球的开发、探索太阳系等全七册图书。本套丛书以宇宙为背景，描绘了奇妙的日食与月食现象，谈到了人类对月球的开发和对太阳系的探索，同时还介绍了神秘的行星和恒星。宇宙空间是浩瀚广阔的，人类研究宇宙和发现宇宙的历史相对来说还是很短暂的，相信随着科技的进步、知识的日臻积累，人类对宇宙的起源还会有更多的发现。', '57万字', 50.00);
INSERT INTO `book_info` VALUES (496, '疯狂外星人', '吉林摄影出版社', '亚当·雷克斯', '1995-10-22', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/800ffd68/group6/M00/32/06/CmQUN1X2pZSETRUcAAAAAO_dJIg717183953.jpg?v=CUKc1vdM', '这是一本引导孩子学习理解与包容的儿童科幻小说，集合了“外星人入侵”“喜剧拍档”以及“公路冒险”等多种元素。故事主线明确，两位来自不同世界的“边缘人”相遇，经历了文化差异造成的各种碰撞和误解，最终一起找寻到了友谊的真谛。故事喜感十足，天马行空，极富想象力。', '15.7万字', 79.90);
INSERT INTO `book_info` VALUES (573, '嫤语书年', '', '海青拿天鹅', '1980-05-24', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/7e1baf95/group6/M00/30/C2/CmQUN1X2dvGEI7aGAAAAALDImm4901428918.jpg?v=SKFDKpSZ&t=CmQUN1wvK54.', '天下大乱，兵临城下。\r阖族被抄灭的高门女子傅嫤，被迫嫁给权势如日中天的枭雄长子魏郯。\r世道颠倒，昔日贵如公主的天之骄女，如今是改嫁的大龄新妇；而名不见经传的小吏之子，却变成了睥睨天下的枭雄夫君。\r乱世求生难，形势比人强。在门阀倾轧、乱世流离之时，她早已看淡宫廷之变，权力之争。\r傅嫤明里千方百计做贤妇，暗里奋进敛钱财，随时伺机离开。她一颗玲珑心，却看不透他长达十年的请君入瓮。\r14岁，魏郯初见傅嫤，故意“高价”买下她的梅瓶，可她却连他的脸都没留意。他在所有她可能经过的地方驻足，这一眼，他望了十年……', '44.6万字', 0.50);
INSERT INTO `book_info` VALUES (574, '重生之擅始善终', '', '淳于流落', '1981-11-18', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/78d9c179/group6/M00/47/56/CmRaIVjdMsqERV3kAAAAANA45NA294772308.jpg?v=vieGXE6d', '每个优秀的男人总会遇到一个或几个张雾善，她家世极佳，容貌中上，见识一般，性格恶劣。最后他总会离开她，因为她的另外一个名字叫做女配角。前世如此，今生亦然。可谁说女配角就不能活得风生水起，闪闪发光？说那么多，其实就是一个爹不亲爷不爱哥不疼的任性千金重生后如何活出自我的故事。', '41.1万字', 0.50);
INSERT INTO `book_info` VALUES (575, '何妨吟啸且徐行', '', '星无言', '2014-10-26', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/44c7a52c/group6/M00/7F/A4/CmQUOVjdMsaESW89AAAAAMl1e7c884560026.jpg?v=khcrbb-v', '苍雾山顶，万里冰雪，终年不化；\r白衣翩然的少年，站在峰顶，等了整整一夜。当黎明的曙光亮起，他垂了眼眸，嘴角有凄怆的弧度。\r等不到他想要的，只能选择他必须承担的，良久，他淡然一笑，绝然转身。\r“莫听穿林打叶声，何妨吟啸且徐行！”\r身为男子，他无疑是成功的，权倾朝野，笑掌天下。\r只是，他终究不是他，层层青衫下，那纤纤素手，谁可紧紧相握，笑看花开花落？', '40.5万字', 0.50);
INSERT INTO `book_info` VALUES (576, '把酒话桑麻', '', '欣欣向荣', '2004-05-12', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/2eaac16b/group6/M00/47/56/CmRaIVjdMsiEQVjDAAAAAMO-wBI756516273.jpg?v=P_sreHSt', '穿越古代，安家种田，平淡中收获幸福。', '37.1万字', 0.50);
INSERT INTO `book_info` VALUES (578, '第一医仙', '', '落日蔷薇', '2003-05-09', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/930603f4/group6/M00/D6/89/CmQUNljdMsaERMyvAAAAAKHn4O0230882172.jpg?v=XSzz0oxg', '轮回转世，我要盛世辉煌，你要避世闲居，我们站在不同的起点，最终殊途同归。从一个什么都不会的废柴千金，到天罗大陆龙塔的最高守护者，她付出的，一点点收回，她失去的，一点点讨回，谁说医生永远只能跟在别人屁股后，给点状态加个血，皮薄肉脆容易死；卖卖小萌装装痴，骗个土豪当金主？她不要变成他人的玩物。华丽转身，从删号那一刻开始。她会是这个世界最强大的——暴！力！医！生！', '47.9万字', 0.50);
INSERT INTO `book_info` VALUES (579, '第四者', '', '吴小雾', '1994-12-01', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/adbda5ff/group6/M00/D6/76/CmQUN1jdMsGEOfN-AAAAAOXk9Hg148620038.jpg?v=bdIe8HUI', '会注意到关允，是一个挺土气的原因：他像易小峥，那个放在我心里不敢提的前男友。并不是初恋，但却是我伤害最深的一个人。伤到没得挽救。所以这场感情之初，我就告诉自己要善待，无论怎样，我都会低姿态迎合。对关允，我始终坚持认为是一种类似于赎罪的感情，我并不想去承认爱，那样自己太悲哀了。', '41.8万字', 0.50);
INSERT INTO `book_info` VALUES (580, '思倾城', '', '颜月溪', '2002-05-25', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/2b3c1d08/group6/M00/47/55/CmRaIVjdMr6EEJiQAAAAAFIzTAQ193784388.jpg?v=LoKT8IsB', '坊间看来，位高权重的齐王府一派父慈子孝、妻妾相安的峥嵘景象嫁进去才知道表面上越是平静的湖水越是暗流汹涌齐王出身异族，足不出户、嗜酒如命，私藏的名剑却是汉高祖的赤霄剑齐王妃公主之尊，刁钻古怪、盛气凌人，最爱鸡蛋里挑骨头，和两位侧妃却是一团和气年轻貌美的姨娘，竟然和丈夫说不清道不明的暧昧，贵为皇后的大姑子，引燃宫廷无数杀戮唯一能说知心话的人，却是玩世不恭的小叔子出身望族的妯娌、身世神秘的宠妾这一个魏晋版高干家庭，谁是省油的灯？看尽了勾心斗角、人心难测，一个个莫名其妙死于非命的人，王妃的光环早已变得黯淡，惟余真情一缕始终萦绕心，怀蓦然回首，江南烟雨洒落，乌衣巷伊人憔悴，灯火阑珊难觅当时，燕肠断处不？绮挥銮愠巧？', '44.9万字', 0.50);
INSERT INTO `book_info` VALUES (581, '琴倾天下(出版稿)', '', '宁芯', '1985-06-15', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/a95409ef/group6/M00/7F/A1/CmQUOFjdMrmEfmOuAAAAAE-lN08260975414.jpg?v=OIuCrIh-', '这是宁芯在2008年写的第一部长篇小说，首发于其他网站，现在签约期满，全文贴稿。此书在2009年“中国网络文学十年盘点大赛”中入围总决赛，由“长篇小说选刊”推荐，东方出版社出版。“琴倾天下”是一部穿越小说，讲述了一个女孩子如何在得到了爱情的同时得到了尊严和自我。女主角何芯成为网络文学尤其是“穿越”小说中少见的真正具有自觉的女性意识的有光彩的人物形象。', '56.4万字', 0.50);
INSERT INTO `book_info` VALUES (582, '饭前一碗汤，胜过良药方', '科技文献出版社', '胡丽娟', '1982-09-22', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/332c1b20/group6/M00/1B/19/CmQUN1X1OPqER8kIAAAAALB4UrQ683220018.jpg?v=4ihW7NFZ', '“汤水就像阳光和雨露，默默滋养着我们，改善着我们的生命和生活的状态。”懂喝汤的医学博士胡丽娟说。她十几年前到广东学医。广东人爱喝汤的风俗深深影响了她，同时也让她惊讶于一碗汤水的神奇功效。作为医学博士的她，吸收了广式煲汤的精华，并结合中医养生保健，形成了她独一无二的私房调养汤。“汤水就是可以天天喝，月月喝，年年喝，活到老，喝到老，越喝越有益，越喝越长寿。”本书从经典滋补、日常调理、上火调理、肠胃调理、女性调养汤品等五大方面，介绍了行之有效的汤水。', '5.1万字', 39.90);
INSERT INTO `book_info` VALUES (583, '你若坚强，岁月无恙', '长江出版集团 湖北教育出版社', 'ss大小姐', '1988-10-18', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/bd93699f/group6/M00/1B/1A/CmQUN1X1OPyEQM8kAAAAAFbntGE742272941.jpg?v=gg0zm_42', '刚毕业的女生杨时敏，毅然选择去厦门这个充满传奇色彩的城市闯荡。\r在那里，有一群相濡以沫的好友--阿平、妮妮、Joe、大头、阿毛……当然，还有那个让她怦然心动的男人大雄，他们共同在厦门创造属于自己的动人故事。\r而当爱情并没有按照自己预期的轨迹前行，眼看着一段美好的感情渐行渐远时，她如何在莫大的伤感中重新站起来？\r面对厦门这个街头巷尾都充斥着自己回忆的城市，她是选择留下还是离开？一个充满治愈色彩的青春故事，在厦门这个舞台上，精彩地演绎着。', '8.3万字', 39.90);
INSERT INTO `book_info` VALUES (584, '痛苦收集者', '九州出版社', '张未', '2013-03-27', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/77f61200/group6/M00/1B/1A/CmQUNlX1OQSECD8sAAAAAHz9Goc242854794.jpg?v=Xi8nFhyQ', '初三女生田田的课桌里，出现了一枚断掉的手掌，原本宁静的早读课乱成一团。可惊悚还在继续，和田田同在校田径队的队友，相继被绑架去参加一个关于“选择”的恐怖游戏。\r失忆少年月川一直在寻找13岁前失落的童年，同是田径队的他，发现每个受害者都有着不可告人的秘密，并且每一次有人失踪，自己的记忆就会隐隐浮现。\r这些记忆竟成了破案的关键。\r是巧合，还是凶手不怀好意的设计？\r身陷泥沼的月川能否找回深埋在潜意识里的过去？', '13.5万字', 39.90);
INSERT INTO `book_info` VALUES (585, '眼眶会红的人，一辈子都不会老', '北京联合出版公司', '夏奈', '1976-04-30', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/142cee6f/group6/M00/37/59/CmQUNlX3o5OEemnIAAAAAPMMypg564260318.jpg?v=H-m0X0UI', '20以上，30未达，其实是个不尴不尬的年纪。从社会传统观念来说，你已经是一个不折不扣的成年人，你会被要求成熟，坚强，甚至圆滑世故，需要有肩膀，有担当；但在你的心底，还有很多东西仍未脱稚气：还有追梦的天真，还有相信的执着，还有对于感情奋不顾身的愚敢。这些柔软，这些敏感，一方面似乎是制约我们成熟理智的软肋，而也正是拥有这些青春期的遗产，才使得我们不会在往来复去的街头，变成面目模糊的“成年人”。不忘初心，方得始终。而眼眶会红的人，一辈子都不会老。', '7.2万字', 39.90);
INSERT INTO `book_info` VALUES (586, '深夜物语', '中国华侨出版社', '轰叔', '1992-05-07', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/8658a991/group6/M00/1B/1A/CmQUN1X1OQWESLKHAAAAALBN-ZM165357884.jpg?v=WhlXfcWc&t=CmQUN1kATYs.', '这是一本写于无数个深夜，也将在未来更多的深夜与你相伴，安心于归宿的书。\r这是一本睡前读物，你可以从任何一页读起，也可以从任何一页结束。\r只有在夜深人静的时候，我们才能回到最初的自己。', '4.3万字', 39.90);
INSERT INTO `book_info` VALUES (587, '城市狩猎', '时代文艺出版社', '闫志洋', '1984-09-28', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/6e8f5edf/group6/M00/1B/1A/CmQUN1X1OQGEIpTTAAAAANGMtsQ228159383.jpg?v=nbYjxKCl', '圣经上说人有七宗罪，骄傲、嫉妒、愤怒、怠慢、贪婪、饕餮、淫欲。当这些罪恶被这座浮躁的城市掩盖之后，人们活在浮躁和罪恶之中。一群生活在城市之中的鲜为人知的罪兽，就像是地狱使者一般出现了。它们再不是神话，再不是鬼魅，而就活生生地生活在我们的身边。荒废的老屋、破旧的楼房、潮湿的下水道、阴暗的地铁隧道，这些都是他们的栖息地。', '15.2万字', 39.90);
INSERT INTO `book_info` VALUES (588, '凶宅笔记', '花城出版社', '贰十三', '1996-05-28', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/cdb0de87/group6/M00/1B/1B/CmQUN1X1OQeEa0EhAAAAAKFGLFw921944084.jpg?v=rZqSZ-J0', '江烁和秦一恒是一对神秘的炒房客，他们低价购买远近闻名的凶宅，经过驱鬼辟邪之后，再转手把房子卖出去，每一次都能大赚一笔，生意出奇地好！不料，这对黄金搭档却被不明来路的人盯上。一场巨大阴谋悄悄在他们身边酝酿，神秘的炒房合作者六指、“不是人”的合作者袁阵纷至沓来，各种凶险无比的凶宅不断出现，他们发现自己已经很难搞定，几次濒临死亡线。此时，他们发现，自己被套进一张杀机四伏的网内！\r这其中，究竟隐藏着什么巨大的阴谋？无法破解的凶宅恶鬼和风水局，到底会不会要了他们的命？谁，才是幕后操控这一切的高人？', '15.8万字', 39.90);
INSERT INTO `book_info` VALUES (589, '慢慢来，让灵魂跟上来', '北京联合出版公司', 'meiya', '1994-07-20', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/d9a2ac4b/group6/M00/1B/1B/CmQUN1X1OQ6EcSm9AAAAABfSakI945724038.jpg?v=ax5Z34DP', '忽然有一天，我们发现自己不知不觉中变成了钢筋水泥的都市里默默奋斗的年轻人，普普通通地在社会中努力挣扎、载浮载沉的平凡人。我们为一些公认的目标：成功，拼命奋斗。开始变得压力很大，内心压抑，有很多精神上的困惑，拼命追赶的困惑，遇到挫折的困惑，自己真正想要的什么的困惑。越来越疲惫，越来越不快乐。社会不仅需要功名利禄，还是需要一些其他的东西的，而我们的舆论、标准却忽视了。越是浮躁的社会，我们越是需要培养一些品质。坚守我们真正想要追求的，找到自己内心的节奏，让心慢下来，在浮躁现实中从容的生活。', '11.5万字', 39.90);
INSERT INTO `book_info` VALUES (590, '自我伤害防治心理学', '电子工业出版社', '林昆辉', '2002-06-19', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/7cc5c05e/group6/M00/6B/A0/CmQUNlal4suEXe7RAAAAABlQTtA176776530.jpg?v=cd0pymhX', '作者林昆辉教授数十年来致力于企业、学校、家庭、社区积极心理教育与自杀防治的推展。2012年在上海开创中国国内第一个“自杀防治24小时生命热线”。本书是林教授将多年在自杀防治过程中的经验总结和汇集。书中详细介绍了自杀防治的理论与技术方法。深刻剖析和分析了自杀行为的引发和自杀者的心理过程，并通过专业且权威的心理学理论基础，并结合多年自杀防治经验，以及自杀行为给社会及环境周围人群带来的心理问题的调适及后续照护，都阐述的非常详细且实际的经验。', '9.2万字', 112.50);
INSERT INTO `book_info` VALUES (591, '执行的逻辑', '电子工业出版社', '孙正元', '2003-09-21', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/3bca7464/group6/M00/6B/8C/CmQUN1al4AaEZW-1AAAAACtSC_4325423494.jpg?v=9baTI-Co', '这是一本关于工作执行的书籍。其主要内容是一套简单易懂却又富有逻辑的工作执行方法。本书共分为七个章节，首先阐述了逻辑思考对工作的重要性，并提出了一套科学的工作方法；然后又在各章节中逐一讲解这套工作方法的几个步骤，即界定问题、从根源上解决问题、寻找有创意的对策、规避风险、执行计划以及经验总结，旨在帮助员工理清解决问题的思路，提升解决问题能力、任务执行能力和竞争力。', '10.7万字', 70.00);
INSERT INTO `book_info` VALUES (592, '越界：互联网+时代必先搞懂的大败局', '电子工业出版社', '张书乐', '1979-12-06', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/e2b742ac/group6/M00/14/B6/CmQUOFal2fyEAdADAAAAAIfafQk960571435.jpg?v=JWOQGDLv', '全书共分5个章节，分别论述了百度、阿里、腾讯、小米和盛大5个互联网知名公司跨越原有领域，进入互联网其他行业及传统产业领域中遭遇过的各种失败。之后逐步对各种流行的互联网思维如流量为王、粉丝经济、互联网金融、极致单品、饥饿营销、产业闭环等的适用范围及思维困局进行分析和解构，试图通过这些越界的失败案例，为国家“互联网+”战略的展开，互联网企业、传统产业和创业者在未来波澜壮阔的跨界层面提供生动、有价值的试错参考。', '11.8万字', 413.00);
INSERT INTO `book_info` VALUES (593, '勇气', '电子工业出版社', '巨雷', '1984-11-19', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/4a6ee3ed/group6/M00/6B/9D/CmQUNlal2POEeLGPAAAAABNEbBY867460924.jpg?v=_Ot74iZM', '在浮躁而贪婪的时代，我们需要真正的勇气。勇气是当今中国社会必不可少的东西。它不只限于直接给人提供前进和成功的动力，更多的是为人提供冷静自省的力量。一个人想要幸福、成功、从容、快乐，就需要勇气，勇气是我们的护身符，是我们手中的最后一张王牌。我们可以出身低微，可以头脑“简单”，可以能力欠缺，甚至可以身体残疾，但我们不能没有勇气，在勇敢实践的过程中，我们的智慧会增长，我们的毅力会增加，我们的才干会得到锻造。这本书共分6章，第一章开宗明义，试图把曾几何时我们已淡忘的勇气拉回到我们身边。第二章承上启下，阐明了勇气的价值与意义，也阐述了几种不同形式的勇气。后面的章节分别从不同角度力图让勇气对您的生活有所帮助，最后希望通过阅读这本书，每个人都能够成为一个勇者！', '11.9万字', 56.00);
INSERT INTO `book_info` VALUES (594, '赢家必读：短线炒股快速入门', '电子工业出版社', '启赋书坊', '1980-03-08', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/f95ee9da/group6/M00/14/B6/CmQUOVal19iERPLBAAAAAMhZdQw732427567.jpg?v=QqbQv4g8', '短线炒股具有明显的优势，操作周期短，见效快，符合绝大多数股民的操作习惯，但短线炒股相比长线投资，对投资者的技术分析能力和操盘能力要求更高，故短线赢利并不是如投资者想象得那么容易。对广大短线股民来讲，如何在股市中赢利，就显得非常困难。本书就是面向短线投资者为其解决短线赢利这一难题的。其实投资者在掌握了短线操作的买卖时机后，短线赢利并不是难事，这需要投资者通过技术分析找出其中蕴涵的短线信号。本书的特点就是在向短线投资者介绍技术理论知识的同时，也指明了理论中的短线买卖信号及时机。本书共有10章，详细介绍了短线选股以及利用分时图、K线与均线、量价关系、技术指标、趋势线炒短线的操作技巧，以及炒短线操作方法，短线追涨、抄底、逃顶、止损、解套的技法。这些丰富的短线操作知识让投资者既掌握了技术理论知识，又捕捉到了短线操作时机。此外本书语言通俗易懂，在理论的基础上还列举了大量的实例进行配套说明，使初入市的短线股民也能看懂看明白，从而提高投资者短线炒股的操盘水平。', '11.5万字', 98.00);
INSERT INTO `book_info` VALUES (595, '引人入胜：专业的商务PPT制作真经', '电子工业出版社', '李彤', '1995-02-05', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/b67c5566/group6/M00/6B/9C/CmQUNlal1sqEeAl7AAAAABnVwU4670965855.jpg?v=1jw0qD0q', '本书以PPT制作的基础知识和基本操作为起点，深入细致地讲解了PowerPoint各组件的使用方法及PPT设计的创新思路等，主要内容包括“PPT预备知识”、“PPT策划与设计原则”、“赏心悦目的PPT模板”、“制作文本型PPT”、“让图片为PPT画龙点睛”、“图表在PPT中的应用”、“动画，让PPT活灵活现”、“多媒体，让PPT更加绘声绘色”、“PPT放映设置与输出”及“精彩演讲，助你成功”。', '5.6万字', 159.20);
INSERT INTO `book_info` VALUES (596, '意志力的修炼', '电子工业出版社', '巨雷', '1996-01-18', 'http://book.img.ireader.com/idc_1/m_1,w_156,h_208,q_100/d6c14a15/group6/M00/6B/9C/CmQUNlal1hGEF2i9AAAAAOHgd1A528965813.jpg?v=Z_65Emza', '意志力是一个人管理自己的情绪、控制自己的欲望、激励自己不断奋进、克服痛苦达到目标的能力。缺少意志力，一个人终生将碌碌无为。意志力是成功的始祖。拥有良好的意志力，就能成为自己命运的主宰者，能够轻松地操控自己的心情，战胜自己的惰性，从容不迫地走向成功。意志力可以提高，正如悟性可以修炼。但意志力提高需要遵循一定的规律。提升自己的意志力，是一种技术，更是一种艺术。本书从“意志力立体观”、“感官训练”、“思维升级”、“情商攻略”、“恶习铲除”、“意志力灭菌”六个方面论述了提升意志力的法则，科学实用，丝丝入扣。', '12万字', 59.60);
COMMIT;

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ccomment` varchar(100) NOT NULL,
  `cstar` int DEFAULT NULL,
  `cbook_id` int NOT NULL,
  `cuser_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_info_cbook_id_22b5b49e_fk_book_info_id` (`cbook_id`),
  KEY `comment_info_cuser_id_e6c5b3f8_fk_user_info_id` (`cuser_id`),
  CONSTRAINT `comment_info_cbook_id_22b5b49e_fk_book_info_id` FOREIGN KEY (`cbook_id`) REFERENCES `book_info` (`id`),
  CONSTRAINT `comment_info_cuser_id_e6c5b3f8_fk_user_info_id` FOREIGN KEY (`cuser_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2020-05-13 09:16:41.757033', '577', '三分春', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2020-05-13 09:16:57.953436', '60', '6618457230', 2, '[]', 8, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'users', 'bookinfo');
INSERT INTO `django_content_type` VALUES (9, 'users', 'commentinfo');
INSERT INTO `django_content_type` VALUES (8, 'users', 'userinfo');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-05-12 08:14:14.571639');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-05-12 08:14:14.631024');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-05-12 08:14:14.745380');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-05-12 08:14:14.781658');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-05-12 08:14:14.788393');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-05-12 08:14:14.829381');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-05-12 08:14:14.849168');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-05-12 08:14:14.864172');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-05-12 08:14:14.870715');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-05-12 08:14:14.890726');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-05-12 08:14:14.892231');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-05-12 08:14:14.898642');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-05-12 08:14:14.923213');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-05-12 08:14:14.946416');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-05-12 08:14:14.958350');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-05-12 08:14:14.966491');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2020-05-12 08:14:14.975076');
INSERT INTO `django_migrations` VALUES (18, 'users', '0001_initial', '2020-05-12 08:14:15.015871');
INSERT INTO `django_migrations` VALUES (19, 'users', '0002_auto_20200513_1114', '2020-05-13 03:14:45.565050');
INSERT INTO `django_migrations` VALUES (20, 'users', '0003_auto_20200513_1116', '2020-05-13 03:16:22.589273');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('9ybr7m30ekjkj22rteuarw6ogwng2cor', 'M2NiMWZmZTRkM2MxNzQ0MGQ4OTNlMGJiYTQ3MDE4NDJjMGVjZmE2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYzdmNjRlODI1NmE5ZTgwYmFiZTk4ZDAyYTI5OGUyNDNmZmI1NjE5IiwidmVyaWZ5Y29kZSI6IkxKSkgifQ==', '2020-05-26 08:21:41.507579');
INSERT INTO `django_session` VALUES ('fpvfltyar127s8qrpxbf85i2q7s0lio1', 'ZGQ3YjU4YjA5NjlkNDIxMjY4ZDZmMjc4ZjUwYjNmZWNjYWU2MGIzNTp7InZlcmlmeWNvZGUiOiJTSEtYIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJjN2Y2NGU4MjU2YTllODBiYWJlOThkMDJhMjk4ZTI0M2ZmYjU2MTkifQ==', '2020-05-27 10:54:17.769057');
COMMIT;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) NOT NULL,
  `upassword` varchar(20) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `ugender` tinyint(1) NOT NULL,
  `udate` date NOT NULL,
  `uemail` varchar(40) NOT NULL,
  `uaddr` varchar(100) NOT NULL,
  `uphone` varchar(20) NOT NULL,
  `ucomment` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES (1, '1377219787', '654321', '蹇棋林', 0, '2000-04-20', 'jql1377219787@gmail.com', '未知', '15310327717', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (2, '1242690871', '123456', '蹇棋林', 0, '2020-05-01', 'jql1242690871@gmail.com', '未知', '15310327717', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (3, '9216136955', '123456', '乐造报', 0, '1984-01-17', '9216136955@qq.com', '未知', '15806665983', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (4, '3467392213', '123456', '元请见', 0, '1979-09-17', '3467392213@qq.com', '未知', '15198931039', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (5, '8671107713', '123456', '祝爸', 0, '1985-08-01', '8671107713@qq.com', '未知', '15457972858', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (6, '7872852039', '123456', '吴法', 0, '1987-12-07', '7872852039@qq.com', '未知', '15911639228', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (7, '5698200309', '123456', '廉常', 0, '1976-05-23', '5698200309@qq.com', '未知', '15456490728', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (8, '9954761334', '123456', '陶更', 0, '1978-06-06', '9954761334@qq.com', '未知', '15433362621', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (9, '3444246686', '123456', '袁归胜', 0, '1986-11-17', '3444246686@qq.com', '未知', '15917251489', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (10, '6206317595', '123456', '罗完年', 0, '1984-02-08', '6206317595@qq.com', '未知', '15252615856', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (11, '2613010235', '123456', '苗时', 0, '1981-07-19', '2613010235@qq.com', '未知', '15560828516', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (12, '2228279106', '123456', '贝中使', 0, '1984-07-16', '2228279106@qq.com', '未知', '15402158319', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (13, '6917773245', '123456', '卫计', 0, '1979-07-25', '6917773245@qq.com', '未知', '15251704808', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (14, '3008316098', '123456', '奚嘴', 0, '1987-04-01', '3008316098@qq.com', '未知', '15582021889', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (15, '2903258189', '123456', '曹鸟男', 0, '1979-11-06', '2903258189@qq.com', '未知', '15208655560', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (16, '0518683213', '123456', '奚食妹', 0, '1985-09-25', '0518683213@qq.com', '未知', '15866235980', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (17, '3783341726', '123456', '平特', 0, '1988-07-23', '3783341726@qq.com', '未知', '15645239665', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (18, '8812359754', '123456', '倪具', 0, '1982-12-29', '8812359754@qq.com', '未知', '15303950482', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (19, '5150888211', '123456', '顾周', 0, '1979-12-05', '5150888211@qq.com', '未知', '15154719835', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (20, '5993274813', '123456', '郎写', 0, '1988-10-17', '5993274813@qq.com', '未知', '15531287156', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (21, '4304275689', '123456', '韦线禁', 0, '1989-10-01', '4304275689@qq.com', '未知', '15259942791', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (22, '2834175452', '123456', '吕应夏', 0, '1985-04-20', '2834175452@qq.com', '未知', '15051578840', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (23, '8517052391', '123456', '汪相', 0, '1986-03-21', '8517052391@qq.com', '未知', '15841685160', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (24, '1431490163', '123456', '韩围居', 0, '1988-09-21', '1431490163@qq.com', '未知', '15714028904', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (25, '2279872172', '123456', '姚一皮', 0, '1976-10-24', '2279872172@qq.com', '未知', '15300164495', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (26, '2510175835', '123456', '孙速', 0, '1982-08-16', '2510175835@qq.com', '未知', '15782650028', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (27, '6793916202', '123456', '韦和待', 0, '1985-12-14', '6793916202@qq.com', '未知', '15655299210', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (28, '6443463249', '123456', '卫得树', 0, '1978-08-03', '6443463249@qq.com', '未知', '15471242589', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (29, '2724514668', '123456', '昌士玩', 0, '1979-11-26', '2724514668@qq.com', '未知', '15549542890', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (30, '2713593093', '123456', '庞向', 0, '1976-07-31', '2713593093@qq.com', '未知', '15587684007', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (31, '6990293403', '123456', '周表故', 0, '1979-01-02', '6990293403@qq.com', '未知', '15817593404', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (32, '9776605710', '123456', '马付举', 0, '1981-05-15', '9776605710@qq.com', '未知', '15447670054', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (33, '2553423193', '123456', '褚祖认', 0, '1981-05-30', '2553423193@qq.com', '未知', '15746916277', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (34, '7297303557', '123456', '水忘', 0, '1990-01-15', '7297303557@qq.com', '未知', '15478724324', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (35, '3278707642', '123456', '韦基常', 0, '1978-02-21', '3278707642@qq.com', '未知', '15477221327', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (36, '9962370900', '123456', '倪素房', 0, '1989-07-03', '9962370900@qq.com', '未知', '15308986439', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (37, '9863650004', '123456', '章忽火', 0, '1979-03-14', '9863650004@qq.com', '未知', '15432067919', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (38, '2903364265', '123456', '沈毛围', 0, '1988-09-08', '2903364265@qq.com', '未知', '15224089416', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (39, '6715040335', '123456', '喻肉肯', 0, '1984-07-11', '6715040335@qq.com', '未知', '15457732613', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (40, '4589836006', '123456', '鲁业', 0, '1980-06-14', '4589836006@qq.com', '未知', '15150733373', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (41, '2523052322', '123456', '余兴仅', 0, '1984-11-01', '2523052322@qq.com', '未知', '15235153792', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (42, '3563902634', '123456', '范原投', 0, '1977-09-22', '3563902634@qq.com', '未知', '15537377856', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (43, '5305267062', '123456', '秦较翻', 0, '1989-07-07', '5305267062@qq.com', '未知', '15825162904', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (44, '3795904121', '123456', '汤个', 0, '1987-09-04', '3795904121@qq.com', '未知', '15107674704', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (45, '8993939796', '123456', '水带', 0, '1978-12-01', '8993939796@qq.com', '未知', '15653589323', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (46, '7577154758', '123456', '汪大', 0, '1987-06-21', '7577154758@qq.com', '未知', '15936213422', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (47, '1288865229', '123456', '俞副', 0, '1986-07-09', '1288865229@qq.com', '未知', '15015130976', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (48, '3181389792', '123456', '于低森', 0, '1986-03-29', '3181389792@qq.com', '未知', '15425533359', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (49, '8437775286', '123456', '穆护', 0, '1987-09-10', '8437775286@qq.com', '未知', '15673714088', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (50, '3018560420', '123456', '常兴统', 0, '1983-04-21', '3018560420@qq.com', '未知', '15830375965', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (51, '8935003167', '123456', '窦重', 0, '1990-10-06', '8935003167@qq.com', '未知', '15485889517', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (52, '5118410681', '123456', '何背法', 0, '1986-02-06', '5118410681@qq.com', '未知', '15549940623', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (53, '5525192680', '123456', '俞拍', 0, '1979-08-05', '5525192680@qq.com', '未知', '15404986660', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (54, '2296019389', '123456', '元时数', 0, '1982-09-13', '2296019389@qq.com', '未知', '15743494896', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (55, '5599662811', '123456', '喻皮', 0, '1981-01-14', '5599662811@qq.com', '未知', '15006668095', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (56, '7616109029', '123456', '卞坏免', 0, '1989-03-03', '7616109029@qq.com', '未知', '15761104346', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (57, '8536840199', '123456', '尤帮凡', 0, '1977-06-06', '8536840199@qq.com', '未知', '15782001448', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (58, '3219444539', '123456', '施姆', 0, '1982-03-29', '3219444539@qq.com', '未知', '15836336393', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (59, '2864077191', '123456', '谈索显', 0, '1982-02-16', '2864077191@qq.com', '未知', '15908182347', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (60, '6618457230', '123456', '元大', 0, '1978-01-09', '6618457230@qq.com', '未知', '15298556459', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (61, '9184251643', '123456', '卜号手', 0, '1984-05-23', '9184251643@qq.com', '未知', '15536855238', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (62, '4765916207', '123456', '狄送', 0, '1979-06-29', '4765916207@qq.com', '未知', '15780535974', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (63, '6498202365', '123456', '董呼争', 0, '1989-07-17', '6498202365@qq.com', '未知', '15496520269', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (64, '5245225380', '123456', '尹所进', 0, '1981-12-17', '5245225380@qq.com', '未知', '15803050191', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (65, '3812428684', '123456', '沈著呢', 0, '1982-06-13', '3812428684@qq.com', '未知', '15539401186', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (66, '5308379441', '123456', '喻试菜', 0, '1983-06-10', '5308379441@qq.com', '未知', '15598959631', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (67, '5205130077', '123456', '余但', 0, '1977-08-02', '5205130077@qq.com', '未知', '15693308037', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (68, '4492469697', '123456', '钱卫', 0, '1976-08-28', '4492469697@qq.com', '未知', '15502601569', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (69, '8949927423', '123456', '朱含以', 0, '1980-04-21', '8949927423@qq.com', '未知', '15842030237', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (70, '8829778737', '123456', '元一联', 0, '1976-04-19', '8829778737@qq.com', '未知', '15391082479', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (71, '3732784996', '123456', '罗常腿', 0, '1980-06-28', '3732784996@qq.com', '未知', '15756701844', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (72, '1091989473', '123456', '滕简', 0, '1978-01-27', '1091989473@qq.com', '未知', '15545364300', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (73, '0171779236', '123456', '毕器', 0, '1977-04-30', '0171779236@qq.com', '未知', '15632207400', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (74, '4184278477', '123456', '韩奥', 0, '1976-04-16', '4184278477@qq.com', '未知', '15458821760', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (75, '0593610510', '123456', '常健', 0, '1977-04-09', '0593610510@qq.com', '未知', '15389868752', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (76, '1119319932', '123456', '安作窗', 0, '1987-02-09', '1119319932@qq.com', '未知', '15711211820', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (77, '7150433411', '123456', '顾幸休', 0, '1983-07-07', '7150433411@qq.com', '未知', '15230606826', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (78, '0507180492', '123456', '窦看', 0, '1977-06-29', '0507180492@qq.com', '未知', '15077428187', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (79, '6588670817', '123456', '安食遍', 0, '1979-06-05', '6588670817@qq.com', '未知', '15519039376', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (80, '0358190014', '123456', '杨运', 0, '1981-01-09', '0358190014@qq.com', '未知', '15831479213', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (81, '6456378498', '123456', '计飞林', 0, '1989-08-07', '6456378498@qq.com', '未知', '15958490610', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (82, '2534345019', '123456', '孙验', 0, '1982-01-28', '2534345019@qq.com', '未知', '15645812005', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (83, '2839094680', '123456', '皮树恐', 0, '1982-08-01', '2839094680@qq.com', '未知', '15330990880', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (84, '6334025976', '123456', '葛球', 0, '1980-07-26', '6334025976@qq.com', '未知', '15090836008', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (85, '6792884924', '123456', '余及', 0, '1988-10-18', '6792884924@qq.com', '未知', '15929413901', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (86, '4824445551', '123456', '成顺', 0, '1980-06-13', '4824445551@qq.com', '未知', '15729906308', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (87, '5590324483', '123456', '吴供告', 0, '1983-05-23', '5590324483@qq.com', '未知', '15875707885', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (88, '4573320323', '123456', '伏司', 0, '1982-08-15', '4573320323@qq.com', '未知', '15889766802', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (89, '0188941010', '123456', '孟缺别', 0, '1989-07-12', '0188941010@qq.com', '未知', '15729616491', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (90, '8534423086', '123456', '臧近', 0, '1979-07-26', '8534423086@qq.com', '未知', '15989256866', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (91, '5832366788', '123456', '卜价', 0, '1977-11-14', '5832366788@qq.com', '未知', '15575977947', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (92, '7825730873', '123456', '岑藸计', 0, '1978-08-09', '7825730873@qq.com', '未知', '15145338768', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (93, '9240772376', '123456', '齐号', 0, '1979-05-14', '9240772376@qq.com', '未知', '15120302679', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (94, '5483749830', '123456', '时牛皮', 0, '1989-04-13', '5483749830@qq.com', '未知', '15663289771', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (95, '9595903000', '123456', '赵色美', 0, '1985-06-10', '9595903000@qq.com', '未知', '15772624212', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (96, '6071368023', '123456', '成黑', 0, '1983-04-21', '6071368023@qq.com', '未知', '15992582255', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (97, '4236269465', '123456', '陈罪易', 0, '1983-05-25', '4236269465@qq.com', '未知', '15074104923', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (98, '4153697531', '123456', '米责呢', 0, '1979-11-02', '4153697531@qq.com', '未知', '15707118289', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (99, '4858986137', '123456', '郎银', 0, '1988-10-15', '4858986137@qq.com', '未知', '15237036952', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (100, '4235438729', '123456', '舒一奇', 0, '1986-08-19', '4235438729@qq.com', '未知', '15212017552', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (101, '1291470510', '123456', '于男森', 0, '1977-07-15', '1291470510@qq.com', '未知', '15967707250', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (102, '1254648112', '123456', '伏睡证', 0, '1982-07-29', '1254648112@qq.com', '未知', '15698706838', '这个人很懒，什么都没有写');
INSERT INTO `user_info` VALUES (103, 'luluanting', '123456', 'amiwho', 0, '2020-05-13', 'jql1377219787@gmail.com', '未知', '15310327717', '这个人很懒，什么都没有写');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
