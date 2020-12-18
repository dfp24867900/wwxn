SET NAMES UTF8;
DROP DATABASE IF EXISTS bride;
CREATE DATABASE bride CHARSET = UTF8;
USE bride;
-- 创建用户信息表
CREATE table bride_user(
   uid INT PRIMARY KEY AUTO_INCREMENT,
   uname varchar(16),
   upwd varchar(128),
   nickname varchar(30) DEFAULT NULL,
   phone varchar(16),
   email varchar(32),
   data varchar(64),
   address varchar(128),
   avatar   VARCHAR(50) NOT NULL COMMENT '用户头像'
);
INSERT INTO bride_user
VALUES(
      1,
      "goudan",
      "123456",
      "橘子猫",
      "13555555555",
      "goudan@qq.com",
      "布拉市",
      "2521年1月",
      "avatar_1.jpg"
   );
INSERT INTO bride_user
VALUES(
      2,
      "tiedan",
      "123456",
      "柚子呀",
      "13666666666",
      "tiedan@qq.com",
      "布拉市",
      "2521年1月",
      "avatar_4.jpg"
   );
-- 创建案例表
CREATE TABLE bride_case_list(
   cid INT PRIMARY KEY AUTO_INCREMENT COMMENT 'id,主键且自增',
   -- 案例标题
   title VARCHAR(64) UNIQUE NOT NULL COMMENT '案例标题,唯一且不为空',
   -- 价格
   price DECIMAL(8,2) COMMENT '价格',
   -- 首页图片
   pic VARCHAR(128) COMMENT '首页缩略图片',
   -- 详细说明
   descr VARCHAR(128) NOT NULL COMMENT '详细说明,不为空',
   -- 访问量
   visits INT COMMENT '访问量',
   -- 销售数量
   sales INT COMMENT '销售数量',
   -- 风格 复古/梦幻/大气/主题/简洁/新中式/小清新/唯美/韩式/森系/西式/传统中式/简约/其他
   manner VARCHAR(128) NOT NULL COMMENT '风格名,不为空',
   -- 场景 树林/海滩/晚宴/草坪/教堂/室内/户外/其他
   scene VARCHAR(128) NOT NULL COMMENT '场景名,不为空',
   -- 色系/红色/白色/粉色/紫色/绿色/黄色/蓝色/其他
   color VARCHAR(128) NOT NULL COMMENT '色系,不为空',
   -- 上架时间
   grounding VARCHAR(64) NOT NULL COMMENT '上架时间，毫秒',
   -- 场地地址
   case_address VARCHAR(128) NOT NULL COMMENT '场地地址,不为空'
);
-- 插入案例数据
INSERT INTO bride_case_list
VALUES(
      1,
      '氤氲',
      28430,
      "list1.jpg",
      "这场蓝色，是灵性与童话兼具的色彩，给人耳目一新的印象，明度高的浅蓝展现出大海和天空般的舒畅开阔感，它象征清新余宁静，一副静谧，柔和的画面氤氲出幸福感",
      10,
      1,
      "梦幻",
      "室内",
      "白色",
      111111111111,
      "友豪锦江酒店"
   );
INSERT INTO bride_case_list
VALUES(
      NULL,
      '爱与无穷',
      21561,
      "list2.jpg",
      "秀场风婚礼以'∞'符号主题设计的婚礼。",
      25,
      2,
      "主题",
      "室内",
      "粉色",
      111111111111,
      "未来大酒店"
   );
INSERT INTO bride_case_list
VALUES(
      NULL,
      'The Soul',
      15322,
      "list3.jpg",
      "山水一程，风雨一更，三生有幸，共度余生，不偏不倚，刚好是你，往后余生，有你足矣！",
      200,
      3,
      "唯美",
      "户外",
      "绿色",
      111111111111,
      "菁华园"
   );
INSERT INTO bride_case_list
VALUES(
      NULL,
      '梦回唐朝',
      14948,
      "list4.jpg",
      "凤冠霞帔，许你一世长安",
      500,
      5,
      "新中式",
      "室内",
      "红色",
      111111111111,
      "香城竹韵(斑竹园店)"
   );
INSERT INTO bride_case_list
VALUES(
      NULL,
      '暖暖午后',
      16590,
      "list5.jpg",
      "一场暖色小清新户外婚礼，木质搭建为主，配合回暖黄的华裔，自由活泼，温暖惬意",
      320,
      2,
      "森系",
      "室内",
      "复古",
      111111111111,
      "恒苑山庄"
   );
INSERT INTO bride_case_list
VALUES(
   NULL,
   "是约定,是誓言,是一生",
   7623,
   "list9.jpg",
   "裸粉色的小户外,清新雅致",
   "607",
    56,
    "唯美",
    "室内",
    "绿色",
    222222222222,
   "天来酒店"
);
INSERT INTO bride_case_list
VALUES(
   NULL,
   "小确幸",
   6998,
   "list11.jpg",
   "时光匆匆,青春易老",
   "245",
   23,
   "森系",
   "室内",
   "蓝色",
   111111111111,
   "华生园"
);
INSERT INTO bride_case_list
VALUES(
   NULL,
   "Youth",
   5000,
   "list8.jpg",
   "许你一世承诺",
   "25",
   23,
   "小清新",
   "户外",
   "橙色",
   111111111111,
   "家园国际户外"
);


-- 创建搜索历史表
CREATE TABLE bride_search_history(
   mid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '主键ID',
   history_word TEXT NOT NULL COMMENT '搜索历史记录'
);
INSERT INTO bride_search_history VALUE(1,"唯美");
INSERT INTO bride_search_history VALUE(null,"中式");
INSERT INTO bride_search_history VALUE(null,"西式");
INSERT INTO bride_search_history VALUE(null,"草坪");

-- 创建客服消息表
CREATE TABLE bride_service_messeage(
   mid INT UNSIGNED NOT NULL KEY AUTO_INCREMENT COMMENT '主键ID',
   content TEXT NOT NULL COMMENT '消息内容',
   user_id INT UNSIGNED NOT NULL COMMENT '外键,参照bride_user表',
   is_send INT NOT NULL COMMENT "是否自己发送 1：是 0：不是",
   created_at BIGINT UNSIGNED NOT NULL COMMENT '消息发送的时间毫秒值'
);
-- 插入客服消息
INSERT bride_service_messeage(content, user_id, is_send, created_at)
VALUES('欢迎来到微微新娘，如果您在使用的过程中有任何的问题或建议，可以在设置里提交意见反馈哦~', 1, 0, 1607763687542);





-- 创建主页数据表
CREATE TABLE `bride_header` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主内容ID,主键且自增',
    `img` varchar(50) DEFAULT NULL COMMENT '主内容图片',
    `description` varchar(255) NOT NULL COMMENT '简介',
    `author` varchar(50) NOT NULL COMMENT '作者',
    `vip` int(5)  NOT NULL COMMENT 'VIP用户',
    `header_img` varchar(50) NOT NULL COMMENT '作者头像',
    `like_up` int(10) NOT NULL COMMENT '点赞数',
    `category_id` smallint(5) unsigned NOT NULL COMMENT '外键,内容分类ID',
     PRIMARY KEY (`id`)
);

INSERT INTO `bride_header`(`id`,`img`,`description`,`author`,`vip`,`header_img`,`like_up`,`category_id`) VALUES 
(1,'img/det1.jpg','王祖蓝&李亚男|春风化冬雪，暖水煮浓茶','小爱酱',1,'img/det1.jpg',66,0),
(2,'img/det2.jpg','袁弘&张歆艺|坚定从心，率性而爱','小爱酱',1,'img/det2.jpg',450,0),
(3,'img/det3.jpg','范冰冰|柔软的态度对待人生','Alois',1,'img/det2.jpg',46,0),
(4,'img/det4.jpg','和吴克群在一起的20年|为你写一首自在的诗','小爱酱',1,'img/det3.jpg',76,0),
(5,'img/det5.jpg','永远停这一刻。每时每刻都想拥有自己独特','II',1,'img/det3.jpg',56,0),
(6,'img/det6.jpg','在一起嘛！','邱丽已',1,'img/det4.jpg',36,0),
(7,'img/det7.jpg','我想拍一张美丽的婚纱留作纪念','小美美',1,'img/det4.jpg',446,0),
(8,'img/det8.jpg','我是花童！','黄瓜',1,'img/det2.jpg',58,0),
(9,'img/det9.jpg','哎，这么漂亮的蛋糕才能配上我家','CCTV',1,'img/det4.jpg',666,0),
(10,'img/det10.jpg','花海就是梦中的样子','CCTV',1,'img/det2.jpg',76,0),

(11,'img/det2.jpg','袁弘&张歆艺|坚定从心，率性而爱','小爱酱',1,'img/det2.jpg',450,1),
(12,'img/det3.jpg','范冰冰|柔软的态度对待人生','Alois',1,'img/det2.jpg',46,1),
(13,'img/det4.jpg','和吴克群在一起的20年|为你写一首自在的诗','小爱酱',1,'img/det3.jpg',76,1),
(14,'img/det11.jpg','浪姐收官，木兰上映！这波“国潮风”你爱了嘛？','小爱酱',1,'img/det3.jpg',786,1),
(15,'img/det12.jpg','不容错过的精彩瞬间！中国国际时装周。','小爱酱',1,'img/det3.jpg',129,1),
(16,'img/det13.jpg','乾坤沧渊，造梦人间','小爱酱',1,'img/det3.jpg',146,1),
(17,'img/det14.jpg','别等故宫的第二场雪啦！','小爱酱',1,'img/det3.jpg',136,1),
(18,'img/det15.jpg','时尚艺术慈善月，摄影艺术隆重展开','小爱酱',1,'img/det3.jpg',13,1),
(19,'img/det16.jpg','你说往后余生，我道何其幸运','小爱酱',1,'img/det3.jpg',35,1),

(20,'img/det17.jpg','西为中用的珠宝设计等你Pick,一秒散发无尽东方','小爱酱',1,'img/det3.jpg',35,2),
(21,'img/det18.jpg','北京瑰丽酒店臻呈冬日婚礼沙龙','小爱酱',1,'img/det3.jpg',15,2),
(22,'img/det19.png','补办婚礼要做哪几件事？','小爱酱',1,'img/det3.jpg',425,2),
(23,'img/det20.png','卷福来了，维多利亚风格婚礼还远','猫咪呀',0,'img/det3.jpg',625,2),
(24,'img/det21.png','世界奇奇怪怪，婚礼可可爱爱，这些婚礼场地让我','小爱酱',1,'img/det3.jpg',525,2),
(25,'img/det22.png','特殊时期只有四个人参与的婚礼，生活慢下去','小爱酱',1,'img/det3.jpg',525,2),
(26,'img/det23.png','这件用烂的婚礼元素，照样可以时髦出新高度','Alois',1,'img/det3.jpg',525,2),
(27,'img/det24.png','让国家地理摄影师告诉你，三千公里的追爱之旅','小爱酱',1,'img/det3.jpg',525,2),
(28,'img/det25.png','因为是你啊，值得一切都是最好的','小爱酱',1,'img/det3.jpg',525,2),

(29,'img/det9.jpg','哎，这么漂亮的蛋糕才能配上我家','CCTV',1,'img/det4.jpg',666,3),
(30,'img/det10.jpg','花海就是梦中的样子','CCTV',1,'img/det2.jpg',76,3),
(31,'img/det11.jpg','浪姐收官，木兰上映！这波“国潮风”你爱了嘛？','小爱酱',1,'img/det3.jpg',786,3),
(32,'img/det12.jpg','不容错过的精彩瞬间！中国国际时装周。','小爱酱',1,'img/det3.jpg',129,3),
(33,'img/det24.png','让国家地理摄影师告诉你，三千公里的追爱之旅','小爱酱',1,'img/det3.jpg',525,3),
(34,'img/det25.png','因为是你啊，值得一切都是最好的','小爱酱',1,'img/det3.jpg',525,3),
(35,'img/det19.png','补办婚礼要做哪几件事？','小爱酱',1,'img/det3.jpg',425,3),
(36,'img/det20.png','卷福来了，维多利亚风格婚礼还远','猫咪呀',0,'img/det3.jpg',625,3);


/* 创建专辑活动表 */

CREATE TABLE `bride_activity`(
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主内容ID,主键且自增',
    `img` varchar(50) DEFAULT NULL COMMENT '主内容图片',
    `activity_id` smallint(5) unsigned NOT NULL COMMENT '外键,内容分类ID',
     PRIMARY KEY (`id`)
);

INSERT INTO `bride_activity` (`id`,`img`,`activity_id`) VALUES 
(1,'img/HD1.png',1),
(2,'img/HD2.png',1),
(3,'img/HD3.png',1),
(4,'img/HD4.png',1),
(5,'img/HD5.png',1),
(6,'img/HD6.png',1),
(7,'img/HD7.png',1),
(8,'img/HD8.png',1),
(9,'img/HD9.png',1),
(10,'img/HD10.png',1),
(11,'img/HD11.png',1),
(12,'img/HD12.png',1),
(13,'img/HD13.png',1),
(14,'img/HD14.png',1),
(15,'img/HD15.png',1),

(16,'img/ZJ1.png',2),
(17,'img/ZJ2.png',2),
(18,'img/ZJ3.png',2),
(19,'img/ZJ4.png',2),
(20,'img/ZJ5.png',2),
(21,'img/ZJ6.png',2),
(22,'img/ZJ7.png',2),
(23,'img/ZJ8.png',2),
(24,'img/ZJ9.png',2),
(25,'img/ZJ10.png',2),
(26,'img/ZJ11.png',2),
(27,'img/ZJ12.png',2);

/* 创建主页详情页表 */
DROP TABLE IF EXISTS `bride_message`;
CREATE TABLE `bride_message`(
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主内容ID,主键且自增',
    `imgOne` varchar(50) DEFAULT NULL COMMENT '主内容图片',
    `imgTwo` varchar(50) DEFAULT NULL COMMENT '主内容图片',
    `message_id` smallint(5) unsigned NOT NULL COMMENT '外键,内容分类ID',
     PRIMARY KEY (`id`)
);
INSERT INTO `bride_message` (`id`,`imgOne`,`imgTwo`,`message_id`) VALUES 
(1,'img/Mg1-1.png','img/Mg1-2.png',0),
(2,'img/Mg2-1.png','img/Mg2-2.png',0),
(3,'img/Mg3-1.png','img/Mg3-2.png',0),
(4,'img/Mg4-1.png','img/Mg4-2.png',0),
(5,'img/Mg1-1.png',0,0),
(6,'img/Mg1-1.png',0,0),
(7,'img/Mg1-1.png',0,0),
(8,'img/Mg1-1.png',0,0),
(9,'img/Mg1-1.png',0,0),
(10,'img/Mg1-1.png',0,0),
(11,'','',1),
(12,'','',1),
(13,'','',1),
(14,'','',1),
(15,'','',1),
(16,'','',1),
(17,'','',1),
(18,'','',1),
(19,'','',1),

(20,'','',2),
(21,'','',2),
(22,'','',2),
(23,'','',2),
(24,'','',2),
(25,'','',2),
(26,'','',2),
(27,'','',2),
(28,'','',2),

(29,'','',3),
(30,'','',3),
(31,'','',3),
(32,'','',3),
(33,'','',3),
(34,'','',3),
(35,'','',3),
(36,'','',3);

-- 创建收藏信息表   id  图片  标题  价格  特色   浏览数
DROP TABLE IF EXISTS `bride_collect`;
CREATE TABLE `bride_collect`(
   collid INT PRIMARY KEY AUTO_INCREMENT COMMENT 'id',
   colltitle VARCHAR(64) UNIQUE NOT NULL COMMENT '标题',
   collprice DECIMAL(8,2) COMMENT '价格',
   collimg VARCHAR(128) COMMENT '图片',
   collvis INT(12) COMMENT '访问数',
   collfea VARCHAR(128) NOT NULL COMMENT '特色',
   uid int(10) unsigned NOT NULL COMMENT '用户id'
);
INSERT INTO `bride_collect` (`collid`,`collimg`,`colltitle`,`collprice`,`collfea`,`collvis`,`uid`) VALUES 
(1,'collect_sur.jpg','氤氲','28,430.00','#梦幻#大气#唯美#室内',1456,1);

-- 创建订单表  id  图片   标题  描述 价格
DROP TABLE IF EXISTS `bride_shop`;
CREATE TABLE `bride_shop`(
   shopid INT PRIMARY KEY AUTO_INCREMENT COMMENT 'id',
   shoptitle VARCHAR(64) UNIQUE NOT NULL COMMENT '标题',
   shopprice DECIMAL(8,2) COMMENT '价格',
   shopimg VARCHAR(128) COMMENT '图片',
   shopdes VARCHAR(128) NOT NULL COMMENT '详细说明,不为空',
   uid int(10) unsigned NOT NULL COMMENT '用户id'
);
INSERT INTO `bride_shop` (`shopid`,`shopimg`,`shoptitle`,`shopprice`,`shopdes`,`uid`) VALUES 
(1,'collect_sur.jpg','简约+质感泰式','28,430.00','这是一条假的描述语段,仅仅是占着位置而已',1);