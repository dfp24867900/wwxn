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
-- 插入客服消息
INSERT bride_service_messeage(content, user_id, is_send, created_at)
VALUES('欢迎来到微微新娘，如果您在使用的过程中有任何的问题或建议，可以在设置里提交意见反馈哦~', 1, 0, 1607763687542);


<<<<<<< HEAD



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
=======
-- 详情婚礼团队
CREATE TABLE bribe_details_weddingTeam(
   did INT PRIMARY KEY COMMENT '主键ID',
   avatar varchar(50) NOT NULL  COMMENT '员工头像',
   wname VARCHAR(16) COMMENT '艺名',
   position VARCHAR(16) COMMENT '职位', 
   price DECIMAL(6,2) COMMENT '价格'
   
); 

INSERT INTO bribe_details_weddingTeam VALUES(2001,'image/avatar/21.png','大钊','策划师',1890);
INSERT INTO bribe_details_weddingTeam VALUES(1021,'image/avatar/01.jpg','Sky','摄影师',1750);
INSERT INTO bribe_details_weddingTeam VALUES(1022,'image/avatar/02.jpg','大师兄','摄影师',2485);
INSERT INTO bribe_details_weddingTeam VALUES(1717,'image/avatar/03.jpg','安琪','化妆师',1170);
INSERT INTO bribe_details_weddingTeam VALUES(1111,'image/avatar/05.jpg','琴子','化妆师',1660);
INSERT INTO bribe_details_weddingTeam VALUES(2213,'image/avatar/06.jpg','阿甘','主持人',2980);
INSERT INTO bribe_details_weddingTeam VALUES(1202,'image/avatar/08.jpg','凯元','主持人',1500);
INSERT INTO bribe_details_weddingTeam VALUES(0109,'image/avatar/12.jpg','娜娜红','策划师',2400);
INSERT INTO bribe_details_weddingTeam VALUES(0200,'image/avatar/17.jpg','千寻','策划师',2500);
INSERT INTO bribe_details_weddingTeam VALUES(5521,'image/avatar/21.jpg','Sky','摄影师',1750);

-- --报价明细表种类
CREATE TABLE bribe_details_classify(
   clid INT UNSIGNED PRIMARY KEY  COMMENT'id',
   cuname VARCHAR(8) COMMENT '分类'
>>>>>>> ca7457b7bb22911d3810c413193d8dcd168a02d4
);

<<<<<<< HEAD
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
=======
-- -- 报价明细表
CREATE TABLE bribe_details_quotations(
   quid INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT'id且主键',
  item VARCHAR(15) COMMENT '项目',
  serContent VARCHAR(30) COMMENT '服务内容',
  servicelevel VARCHAR(30) COMMENT '服务水平',
  univalence DECIMAL(6,2)   COMMENT '单价',
  amount SMALLINT COMMENT '数量',
  unit  VARCHAR(5) COMMENT '单位',
  classify_id INT UNSIGNED NOT NULL COMMENT '外键,参照bribe_details_classify表'
);

INSERT INTO bribe_details_quotations VALUES(NULL,'平面设计师','呈现婚礼的画面样式，设计KT和场景的配合','专业中级',200,1,'人',001);
INSERT INTO bribe_details_quotations VALUES(NULL,'高级花艺师','呈现婚礼各区域场景花艺设计、细节','专业',800,2,'人',001);
INSERT INTO bribe_details_quotations VALUES(NULL,'场布师','呈现婚礼区域场景布置样式，细节','专业',400,5,'人',001);
INSERT INTO bribe_details_quotations VALUES(NULL,'花桌','桌花+桌布+背景花艺','专业',400,5,'个',002);
INSERT INTO bribe_details_quotations VALUES(NULL,'装饰品','桌牌+支架+装饰品','专业',80,5,'个',002);
INSERT INTO bribe_details_quotations VALUES(NULL,'喷绘','户外喷绘','专业',220,1,'个',002);
INSERT INTO bribe_details_quotations VALUES(NULL,'造型','吊顶+花艺+布幔+灯带+烛台','专业',2800,1,'个',003);
INSERT INTO bribe_details_quotations VALUES(NULL,'支架','所有支架','专业',600,5,'个',003);
INSERT INTO bribe_details_quotations VALUES(NULL,'球','波波球+网沙花+金属球+摩天轮','专业',1400,1,'人',003);
INSERT INTO bribe_details_quotations VALUES(NULL,'面光灯','面光灯+光束灯','专业',330,24,'台',004);
INSERT INTO bribe_details_quotations VALUES(NULL,'P3B','呈现婚礼区域场景布置样式，细节','专业',30,15,'台',004);
INSERT INTO bribe_details_quotations VALUES(NULL,'音响','呈现婚礼区域场景布置样式，细节','专业',800,1,'套',004);
INSERT INTO bribe_details_quotations VALUES(NULL,'工作餐','工作人员工作餐','专业',20,8,'份',005);
INSERT INTO bribe_details_quotations VALUES(NULL,'消耗品','花泥+扎带+小胶+大胶','专业',220,1,'套',005);
INSERT INTO bribe_details_quotations VALUES(NULL,'胸花+手捧花','常规','专业',300,1,'套',005);

-- -- 客户评价表
CREATE TABLE bribe_details_evaluate(
   evid INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT'id且主键',
   avatar VARCHAR(128)   COMMENT '用户头像',
   mName VARCHAR(12) COMMENT '新人',
   staff VARCHAR(16) COMMENT "评论的对象",
   content VARCHAR(512) COMMENT "评论的内容",
   score VARCHAR(32) COMMENT "评星"
);
INSERT INTO bribe_details_evaluate VALUES(11,'image/avatar/15.jpg','白小白','大钊','aliao是我朋友给我力荐的策划师，跟他的交流很顺畅。他能知道我们需要什么，作为水瓶座的女生，我有一些天马行空的想法。他耐心倾听我的叙述，从我的描述中提取的关键词很准确。最终效果图一出来，我们的感觉就有了！这是一次就通过的方案，没有任何改动。我觉得实景比图纸还要美。我站在台上感觉已经进入了aliao为我们构建的梦里。我的金色婚纱在这个梦里熠熠生辉，每一个人都赞美我的婚纱绝美。但我知道，它能把它的美散发的淋漓尽致是因为有这个舞台的加持。我相信我的丈夫会一辈子记得那天我站在他身后，他转身回眸的一瞬间，眼睛里都是我第一次身着金纱最美的模样。我也永远不会忘记他那一刻的热泪。谢谢aliao','star5.png');
INSERT INTO bribe_details_evaluate VALUES(12,'image/avatar/16.jpg','Arey','凯元',' 凯哥堪称性价比之王了～声音超好听，是配音级别的，不论是场控还是现场音乐的选择都是一流的，非常好沟通，是一名优秀的主持人^_^','star5.png');
INSERT INTO bribe_details_evaluate VALUES(13,'image/avatar/14.jpg','BoBo','琴子','技术超好的琴子，擅长日系清新的妆容，虽然说的是化妆师，但琴子更是一名优秀的造型师，服化一体，不论是服装还是妆容都给出了非常专业的建议，并且在婚礼当天让我成为了最美的新娘','star5.png');

-- -- 详情表
CREATE TABLE bribe_details(
   deid INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT 'ID且主键',
  list_id INT UNSIGNED NOT NULL COMMENT '外键,参照bride_case_list表',
  carousel VARCHAR(512) NOT NULL COMMENT '轮播图',
  bType VARCHAR(20) COMMENT  '详情风格类型',
  showTime VARCHAR(12)   COMMENT '时间' ,
  effectPic VARCHAR(512) COMMENT '设计效果图',
   pic VARCHAR(25) COMMENT '代表人照片',
  director VARCHAR(16) COMMENT '代表人',
  intro VARCHAR(512) COMMENT '简介',
  mPhoto VARCHAR(512) COMMENT '简介搭配图',
  weTe_id INT UNSIGNED NOT NULL COMMENT '外键,参照bribe_details_ weddingTeam表',
   evaluate_id INT UNSIGNED NOT NULL COMMENT '外键,参照bribe_details_evaluate表',
   classify_id INT UNSIGNED NOT NULL COMMENT '外键,参照bribe_details_classify表'
);
INSERT INTO bribe_details VALUES(null,1,'details/yinyun/31.jpg&details/yinyun/35.jpg&details/yinyun/36.jpg','大气&西式&梦幻&室内',"2020年10月24日",'details/yinyun/s01.jpg&details/yinyun/s02.jpg&details/yinyun/s03.jpg','image/avatar/21.png','大钊','打破香槟系婚礼靠花艺的堆砌，用线条感制造质感，且多用线条花材，使花艺不显油腻，设计平滑的喷绘吊顶，让低层高的厅吊顶也不显压抑，打造出高级简约的质感泰式婚礼','details/yinyun/31.jpg&details/yinyun/35.jpg&details/yinyun/36.jpg&details/yinyun/32.jpg&details/yinyun/37.jpg&details/yinyun/38.jpg&details/yinyun/39.jpg&details/yinyun/40.jpg','','','');
INSERT INTO bribe_details VALUES(null,2,'details/aywq/26.jpg&details/aywq/22.jpg&details/aywq/25.jpg','室内&梦幻&主题','2020年06月07日','details/aywq/s01.jpg&details/aywq/s02.jpg&details/aywq/s03.jpg','image/avatar/08.jpg','魏超','在欢呼声和掌声中，我一步步走向你.要奔跑多少年光景，深渊才能拥抱星星很多时候，爱和勇气不是从你的脑袋里生出，而是从你叫脚底下涌现。','details/aywq/26.jpg&details/aywq/22.jpg&details/aywq/25.jpg&details/aywq/23.jpg&details/aywq/24.jpg&details/aywq/27.jpg&details/aywq/28.jpg&details/aywq/29.jpg&details/aywq/30.jpg','','','');
INSERT INTO bribe_details VALUES(null,3,'details/TheSoul/101.jpg&details/TheSoul/103.jpg&details/TheSoul/107.jpg','唯美&户外&小清新','2020年10月04日','details/TheSoul/s01.jpg&details/TheSoul/s02.jpg&details/TheSoul/s03.jpg','image/avatar/12.jpg','小乔','冬日暖阳，面对面的爱人，怀里的宝宝，身边的家人，一切都恰到好处，幸福有的时候就是这样，简单，温暖。','details/TheSoul/101.jpg&details/TheSoul/102.jpg&details/TheSoul/103.jpg&details/TheSoul/104.jpg&details/TheSoul/105.jpg&details/TheSoul/106.jpg&details/TheSoul/109.jpg&details/TheSoul/111.jpg&details/TheSoul/112.jpg&details/TheSoul/113.jpg','','','');
INSERT INTO bribe_details VALUES(null,4,'details/mhdt/41.jpg&details/mhdt/42.jpg&details/mhdt/43.jpg','新中式&室内','2020年11月19日','details/mhdt/s01.jpg&details/mhdt/s02.jpg','image/avatar/17.jpg','洋洋','凤冠霞帔，许你一世长安','details/mhdt/41.jpg&details/mhdt/42.jpg&details/mhdt/43.jpg&details/mhdt/44.jpg&details/mhdt/45.jpg&details/mhdt/46.jpg&details/mhdt/47.jpg&details/mhdt/48.jpg','','','');
INSERT INTO bribe_details VALUES(null,5,'details/nnwh/58.jpg&details/nnwh/59.jpg&details/nnwh/60.jpg','大气&梦幻&小清新&室内','2020年11月15日','details/nnwh/s01.jpg&details/nnwh/s02.jpg&details/nnwh/s03.jpg','image/avatar/11.jpg','何先生','梦幻的星空，茂盛的花园，一场浪漫的婚礼。','details/nnwh/58.jpg&details/nnwh/59.jpg&details/nnwh/60.jpg&details/nnwh/61.jpg&details/nnwh/62.jpg&details/nnwh/63.jpg&details/nnwh/64.jpg&details/nnwh/65.jpg&details/nnwh/66.jpg&details/nnwh/67.jpg','','','');
INSERT INTO bribe_details VALUES(null,6,'details/ydsy/76.jpg&details/ydsy/78.jpg','唯美&室内&小清新','2020年09月19日','details/ydsy/s01.jpg&details/ydsy/s02.jpg','image/avatar/07.jpg','德阳','今后，爱你所爱，行你所行，余生慢慢，无问西东','details/ydsy/76.jpg&details/ydsy/78.jpg&details/ydsy/77.jpg&details/ydsy/79.jpg&details/ydsy/80.jpg&details/ydsy/81.jpg','','','');
INSERT INTO bribe_details VALUES(null,7,'details/xqx/142.jpg&details/xqx/143.jpg&details/xqx/144.jpg','室内&梦幻&浪漫','2019年09月07日','details/xqx/s01.jpg&details/xqx/s02.jpg&details/xqx/s03.jpg','image/avatar/05.jpg','Linda','雪花轻落,写下一首关于你的小诗。 让语句饱满温柔,将我的心意,悄悄的藏在里面。','details/xqx/142.jpg&details/xqx/143.jpg&details/xqx/144.jpg&details/xqx/145.jpg&details/xqx/146.jpg&details/xqx/147.jpg&details/xqx/148.jpg','','','');
INSERT INTO bribe_details VALUES(null,8,'details/Youth/01.jpg&details/Youth/02.jpg&details/Youth/03.jpg','室内&大气&梦幻&唯美','2019年11月02日','details/Youth/s01.jpg&details/Youth/s02.jpg&details/Youth/s03.jpg','image/avatar/15.jpg','Aliao','所罗门的歌，是歌中的雅歌， 因你的名如同倒出来的香膏， 你的爱情比酒更美， 所以众童都爱你。','details/Youth/01.jpg&details/Youth/02.jpg&details/Youth/03.jpg&details/Youth/06.jpg&details/Youth/07.jpg&details/Youth/08.jpg&details/Youth/09.jpg&details/Youth/10.jpg&details/Youth/11.jpg&details/Youth/12.jpg&details/Youth/13.jpg','','','');



>>>>>>> ca7457b7bb22911d3810c413193d8dcd168a02d4

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