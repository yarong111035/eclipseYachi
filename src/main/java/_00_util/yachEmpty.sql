/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.21 : Database - yachidb00
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yachidb00` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `yachidb00`;

/*Table structure for table `admin_activity` */

DROP TABLE IF EXISTS `admin_activity`;

CREATE TABLE `admin_activity` (
  `adminactivity_id` int NOT NULL AUTO_INCREMENT,
  `adminactivity_begin` date DEFAULT NULL,
  `adminactivity_content` varchar(255) DEFAULT NULL,
  `adminactivity_end` date DEFAULT NULL,
  `adminactivity_name` varchar(255) DEFAULT NULL,
  `adminactivity_pic` mediumblob,
  `adminfile_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminactivity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin_activity` */

/*Table structure for table `admin_coupon` */

DROP TABLE IF EXISTS `admin_coupon`;

CREATE TABLE `admin_coupon` (
  `admincoupon_id` int NOT NULL AUTO_INCREMENT,
  `admincoupon_amount` int DEFAULT NULL,
  `admincoupon_begin` date DEFAULT NULL,
  `admincoupon_consumption` int DEFAULT NULL,
  `admincoupon_discount` int DEFAULT NULL,
  `admincoupon_end` date DEFAULT NULL,
  `admincoupon_info` varchar(255) DEFAULT NULL,
  `admincoupon_memo` varchar(255) DEFAULT NULL,
  `admincoupon_name` varchar(255) DEFAULT NULL,
  `admincoupon_pic` mediumblob,
  `admincoupon_rule` varchar(255) DEFAULT NULL,
  `adminfile_name` varchar(255) DEFAULT NULL,
  `FK_admincoupon_type_id` int DEFAULT NULL,
  PRIMARY KEY (`admincoupon_id`),
  KEY `FKmw8xqatut9smc9c2dvyp4ukdy` (`FK_admincoupon_type_id`),
  CONSTRAINT `FKmw8xqatut9smc9c2dvyp4ukdy` FOREIGN KEY (`FK_admincoupon_type_id`) REFERENCES `admincoupon_type` (`admincoupon_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin_coupon` */

/*Table structure for table `admincoupon_type` */

DROP TABLE IF EXISTS `admincoupon_type`;

CREATE TABLE `admincoupon_type` (
  `admincoupon_type_id` int NOT NULL AUTO_INCREMENT,
  `admincoupon_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admincoupon_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admincoupon_type` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_amount` int DEFAULT NULL,
  `cart_total` double DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  `FK_product_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKg206pc5701k71nidcuv666edl` (`FK_member_id`),
  KEY `FKh6mgtak4vmy5wrifxph8bb4hh` (`FK_product_id`),
  CONSTRAINT `FKg206pc5701k71nidcuv666edl` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FKh6mgtak4vmy5wrifxph8bb4hh` FOREIGN KEY (`FK_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart` */

/*Table structure for table `coupon` */

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `coupon_amount` int DEFAULT NULL,
  `coupon_begin` date DEFAULT NULL,
  `coupon_end` date DEFAULT NULL,
  `coupon_info` varchar(255) DEFAULT NULL,
  `coupon_memo` varchar(255) DEFAULT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `coupon_pic` mediumblob,
  `coupon_rule` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  `FK_shop_type_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `FK9sw6p875pu0gy1vb3l3aojyc5` (`FK_shop_id`),
  KEY `FKa3qk3ucb5tedg3w6kkovxo0aw` (`FK_shop_type_id`),
  CONSTRAINT `FK9sw6p875pu0gy1vb3l3aojyc5` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`),
  CONSTRAINT `FKa3qk3ucb5tedg3w6kkovxo0aw` FOREIGN KEY (`FK_shop_type_id`) REFERENCES `shop_type` (`shop_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon` */

/*Table structure for table `coupon_couponlist` */

DROP TABLE IF EXISTS `coupon_couponlist`;

CREATE TABLE `coupon_couponlist` (
  `FK_couponlist_id` int NOT NULL,
  `FK_coupon_id` int NOT NULL,
  PRIMARY KEY (`FK_couponlist_id`,`FK_coupon_id`),
  KEY `FKqgvh47unp4a7w0sj8d99gr30t` (`FK_coupon_id`),
  CONSTRAINT `FK6tp37rr7h6hpvycxyv1pi2b05` FOREIGN KEY (`FK_couponlist_id`) REFERENCES `favorite_couponlist` (`coupon_list_id`),
  CONSTRAINT `FKqgvh47unp4a7w0sj8d99gr30t` FOREIGN KEY (`FK_coupon_id`) REFERENCES `coupon` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon_couponlist` */

/*Table structure for table `coupon_list` */

DROP TABLE IF EXISTS `coupon_list`;

CREATE TABLE `coupon_list` (
  `coupon_list_id` int NOT NULL AUTO_INCREMENT,
  `coupon_memo` varchar(255) DEFAULT NULL,
  `FK_coupon_id` int DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_list_id`),
  KEY `FKjxq57sqh0163c8aus7k6sya3e` (`FK_coupon_id`),
  KEY `FKkrjk2fnvsd4aixwob4a1yppv9` (`FK_shop_id`),
  CONSTRAINT `FKjxq57sqh0163c8aus7k6sya3e` FOREIGN KEY (`FK_coupon_id`) REFERENCES `coupon` (`coupon_id`),
  CONSTRAINT `FKkrjk2fnvsd4aixwob4a1yppv9` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon_list` */

/*Table structure for table `coupon_used` */

DROP TABLE IF EXISTS `coupon_used`;

CREATE TABLE `coupon_used` (
  `coupon_used_id` int NOT NULL AUTO_INCREMENT,
  `coupon_used_memo` varchar(255) DEFAULT NULL,
  `coupon_used_or_not` bit(1) DEFAULT NULL,
  `coupon_used_time` datetime(6) DEFAULT NULL,
  `FK_coupon_id` int DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_used_id`),
  KEY `FKmmv648yklf0fa50sfjjvlkskd` (`FK_coupon_id`),
  KEY `FKn2f7i70wcm6sufry5nu9jvcn4` (`FK_member_id`),
  KEY `FKcldks8ol9myx4warn8f5wh1d8` (`FK_shop_id`),
  CONSTRAINT `FKcldks8ol9myx4warn8f5wh1d8` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`),
  CONSTRAINT `FKmmv648yklf0fa50sfjjvlkskd` FOREIGN KEY (`FK_coupon_id`) REFERENCES `coupon` (`coupon_id`),
  CONSTRAINT `FKn2f7i70wcm6sufry5nu9jvcn4` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon_used` */

/*Table structure for table `favorite_couponlist` */

DROP TABLE IF EXISTS `favorite_couponlist`;

CREATE TABLE `favorite_couponlist` (
  `coupon_list_id` int NOT NULL AUTO_INCREMENT,
  `FK_member_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_list_id`),
  KEY `FKnywaf6p8225n8pifylm0jh0xj` (`FK_member_id`),
  CONSTRAINT `FKnywaf6p8225n8pifylm0jh0xj` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `favorite_couponlist` */

/*Table structure for table `favorite_shoplist` */

DROP TABLE IF EXISTS `favorite_shoplist`;

CREATE TABLE `favorite_shoplist` (
  `shop_list_id` int NOT NULL AUTO_INCREMENT,
  `subscribe_time` datetime(6) DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_list_id`),
  KEY `FKq9wvqkf7fv9rjut2n47sohves` (`FK_member_id`),
  CONSTRAINT `FKq9wvqkf7fv9rjut2n47sohves` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `favorite_shoplist` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `memberId` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `image` mediumblob,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `registerTime` datetime(6) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`memberId`),
  KEY `FK4mce76fcm5c3dyutgr7vx4y3s` (`FK_shop_id`),
  CONSTRAINT `FK4mce76fcm5c3dyutgr7vx4y3s` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

insert  into `member`(`memberId`,`address`,`birthday`,`email`,`fileName`,`fullname`,`image`,`password`,`phone`,`registerTime`,`sex`,`username`,`FK_shop_id`) values 
(1,NULL,'1997-03-14','yarong111035@gmail.com',NULL,'陳雅蓉',NULL,'$2a$10$D5.08WUbVdzS2AZjKYOrNuF336r0n5Jnx/tB.MMU9joBgs8Ny1IEC','0977777777','2021-03-21 08:09:36.906000',NULL,'mickey',NULL),
(2,NULL,'2021-03-03','yarong111035@gmail.com',NULL,'測試A',NULL,'$2a$10$RDpGNNTdU90VZa35vi3XZuCUv/q8Eu.9fwcb3j6y3SVuwHxDQSkqy','0977777777','2021-03-22 19:51:05.718000',NULL,'vicky5425',NULL);

/*Table structure for table `member_role` */

DROP TABLE IF EXISTS `member_role`;

CREATE TABLE `member_role` (
  `fk_member_id` int NOT NULL,
  `fk_roles_id` int NOT NULL,
  PRIMARY KEY (`fk_member_id`,`fk_roles_id`),
  KEY `FKlr8cty1xvth5esyylie94eep3` (`fk_roles_id`),
  CONSTRAINT `FK9vud7plly7pxwaox829ap7o6j` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FKlr8cty1xvth5esyylie94eep3` FOREIGN KEY (`fk_roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member_role` */

insert  into `member_role`(`fk_member_id`,`fk_roles_id`) values 
(1,1),
(2,2);

/*Table structure for table `nightmarket` */

DROP TABLE IF EXISTS `nightmarket`;

CREATE TABLE `nightmarket` (
  `market_id` int NOT NULL AUTO_INCREMENT,
  `market_comment` varchar(255) DEFAULT NULL,
  `market_memo` varchar(255) DEFAULT NULL,
  `market_name` varchar(255) DEFAULT NULL,
  `market_score` double DEFAULT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `nightmarket` */

insert  into `nightmarket`(`market_id`,`market_comment`,`market_memo`,`market_name`,`market_score`) values 
(1,NULL,NULL,'饒河夜市',4.2),
(2,NULL,NULL,'華西街觀光夜市',4),
(3,NULL,NULL,'寧夏夜市',3.9),
(4,NULL,NULL,'士林夜市',2.5),
(5,NULL,NULL,'臨江街觀光夜市',4),
(6,NULL,NULL,'延三夜市',4.6),
(7,NULL,NULL,'廣州街夜市',4.3),
(8,NULL,NULL,'南機場夜市',4.1);

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `order_memo` varchar(255) DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `FK_order_id` int DEFAULT NULL,
  `FK_product_id` int DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `FKefmdrrdch72f081b69vrumj7k` (`FK_order_id`),
  KEY `FKdn5wfkvhmvp1rja2x2t3eaym1` (`FK_product_id`),
  CONSTRAINT `FKdn5wfkvhmvp1rja2x2t3eaym1` FOREIGN KEY (`FK_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKefmdrrdch72f081b69vrumj7k` FOREIGN KEY (`FK_order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order_item` */

/*Table structure for table `order_status` */

DROP TABLE IF EXISTS `order_status`;

CREATE TABLE `order_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order_status` */

insert  into `order_status`(`status_id`,`status_name`) values 
(1,'未付款'),
(2,'未出貨'),
(3,'送貨中'),
(4,'已送達'),
(5,'已取消'),
(6,'退貨中');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(255) DEFAULT NULL,
  `company_title` varchar(255) DEFAULT NULL,
  `invoice_num` varchar(255) DEFAULT NULL,
  `orderNumber` varchar(255) DEFAULT NULL,
  `order_address` varchar(255) DEFAULT NULL,
  `order_datetime` datetime(6) DEFAULT NULL,
  `order_memo` varchar(255) DEFAULT NULL,
  `order_total` double DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  `FK_orderstatus_id` int DEFAULT NULL,
  `FK_paytype_id` int DEFAULT NULL,
  `FK_shiptype_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `UK_co70u7tjfb1vnhh2l85yxqdfb` (`orderNumber`),
  KEY `FK6r5sbky9djgfljnjyrs37yacl` (`FK_member_id`),
  KEY `FK4h965kpq3c8mdnhro7mvqvngx` (`FK_orderstatus_id`),
  KEY `FKrhpn85sww7ps7eqtbdc7xura6` (`FK_paytype_id`),
  KEY `FKq36by0qtjyc5vp3vrkxnei17h` (`FK_shiptype_id`),
  CONSTRAINT `FK4h965kpq3c8mdnhro7mvqvngx` FOREIGN KEY (`FK_orderstatus_id`) REFERENCES `order_status` (`status_id`),
  CONSTRAINT `FK6r5sbky9djgfljnjyrs37yacl` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FKq36by0qtjyc5vp3vrkxnei17h` FOREIGN KEY (`FK_shiptype_id`) REFERENCES `ship_type` (`ship_type_id`),
  CONSTRAINT `FKrhpn85sww7ps7eqtbdc7xura6` FOREIGN KEY (`FK_paytype_id`) REFERENCES `pay_type` (`pay_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

/*Table structure for table `pay_type` */

DROP TABLE IF EXISTS `pay_type`;

CREATE TABLE `pay_type` (
  `pay_type_id` int NOT NULL AUTO_INCREMENT,
  `pay_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pay_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pay_type` */

insert  into `pay_type`(`pay_type_id`,`pay_type_name`) values 
(1,'信用卡'),
(2,'銀行匯款'),
(3,'貨到付款');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `filenameA` varchar(255) DEFAULT NULL,
  `product_expire` date DEFAULT NULL,
  `product_info` text,
  `product_memo` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_pic` longblob,
  `product_picA` longblob,
  `product_price` double DEFAULT NULL,
  `product_spec` varchar(255) DEFAULT NULL,
  `product_status` int NOT NULL DEFAULT '0',
  `product_stock` int DEFAULT NULL,
  `FK_product_type_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKc9sqrle3uny7sdork7a91qbph` (`FK_product_type_id`),
  CONSTRAINT `FKc9sqrle3uny7sdork7a91qbph` FOREIGN KEY (`FK_product_type_id`) REFERENCES `product_type` (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`filename`,`filenameA`,`product_expire`,`product_info`,`product_memo`,`product_name`,`product_pic`,`product_picA`,`product_price`,`product_spec`,`product_status`,`product_stock`,`FK_product_type_id`) values 
(1,NULL,NULL,NULL,'產品特點:\r\n1.使用食品級進口400克加厚牛卡紙，安全衛生!!\r\n2.可透視的PET窗口，透明度高，可以更好的展現美食!!\r\n3.三邊卡扣設計，產品打開關閉都方便，密封性能良好!\r\n4.內部防水防油設計，有效防止滲漏!\r\n5.可用於炸薯條、炸雞、水果、沙拉、炒飯、早午餐等等\r\n',NULL,'美式薯條外帶盒',NULL,NULL,300,'50入/組',0,1,6),
(2,NULL,NULL,NULL,'產地：美國',NULL,'美國原裝進口保冷箱',NULL,NULL,2700,'紅色款',0,1,5),
(3,NULL,NULL,NULL,NULL,NULL,'三格裝小麥餐盒',NULL,NULL,79,'粉色',0,5,2),
(4,NULL,NULL,NULL,'外尺寸:21X13X7cm\r\n容量：1000ml。※飯菜分離設計，不僅美觀，更加實用\r\n※內附筷勺餐具，超級貼心\r\n※带提手 。尺寸、容量、重量皆以手工測量，請以實物為準\"',NULL,'秸稈餐盒套組',NULL,NULL,79,'蘋果綠',0,3,2),
(5,NULL,NULL,NULL,'\"尺寸：4.7公分\r\n共8入\r\n材質：ABS樹脂\r\n耐冷.熱：-20～70度\"',NULL,'日本原裝水果叉',NULL,NULL,89,'萬聖款',0,20,2),
(6,NULL,NULL,NULL,'\"產品優勢:\r\n1.?四種尺寸，由大到小，放餐點不互相沾染!\r\n2.?耐高溫，可微波爐加熱，通過美國FDA認證!\r\n3.?安全矽膠，折疊後體積超小，攜帶超方便!\r\n4.?矽膠可塑性高，非如陶瓷或是玻璃，容易撞擊破碎!\"',NULL,'安全矽膠折疊盒',NULL,NULL,199,'湖水綠款',0,3,2),
(7,NULL,NULL,NULL,'\"m\'sa造型 食物叉\r\n能讓食物增添童趣??\r\n產品尺寸:花椰菜-44×13×13mm 鑫鑫腸-44×15×13mm 蛋-44×12×7mm 蝦-45×21×9mm\r\n材質：樹脂\r\n耐熱：70度-20度\"',NULL,'日本原裝便當小物',NULL,NULL,70,'便當款',0,24,2),
(8,NULL,NULL,NULL,'\"【商品規格】\r\n湯匙尺寸：長18.7cm 寬3.8cm 重量33g\r\n筷子尺寸：長18.6cm 重量16g\r\n外盒尺寸：長23cm 寬5.2cm高3.5cm 重量56g\r\n商品顏色：深藍、軍綠、粉橘、酒紅\r\n商品材質：304不鏽鋼、矽膠、ABS\"',NULL,'304超值感餐具組',NULL,NULL,99,'霧色款',0,1,2),
(9,NULL,NULL,NULL,'\"品名：珍珠奶茶帆布包\r\n材質：絲絨布\r\n尺寸：(小)35cm×30cm；(大)40cm×35cm\r\n重量：(小)117g；(大)151g\r\n\r\n特色：\r\n1.暗扣內袋\r\n便於收納，可放私密物品等小物件\r\n\r\n2.加大容量\r\n更多的儲物空間，滿足上課、出行需求\r\n\r\n3.加厚肩帶\r\n柔韌耐用\r\n安心置物不勒肩\r\n\r\n4.雙重車線\r\n精密縫線，耐用耐磨，不易破損\r\n\r\n5.絲絨表層\r\n與眾不同的手感體驗\r\n\"',NULL,'珍珠奶茶帆布袋',NULL,NULL,149,'珍珠奶茶款',0,7,3),
(10,NULL,NULL,NULL,'\"⭐️尺寸: \r\n小盤20cm\r\n大盤27cm\r\n\r\n⭐️使用說明:\r\n?可重複使用\r\n?可放90℃以下熱食\r\n❌不可微波\r\n❌不可放入烤箱\r\n❌不可放入洗碗機\r\n❌不可放入消毒櫃\"',NULL,'高質感免洗盤',NULL,NULL,250,'50入',0,9,6),
(11,NULL,NULL,NULL,'\"。彈性矽膠綁帶，兼容市售 350ml 到 750ml 飲料杯\r\n。吸管環設計，粗/細吸管都可牢牢套住\r\n。簡約輕巧隨身帶，使用好方便\r\n。矽膠材質輕鬆可水洗，髒污不殘留\r\n\r\n\r\n商品規格\r\n基本資訊\r\n本體重量        逗扣角色款：25 g / 簡約黑白款：17 g\r\n本體尺寸        逗扣角色款：W120 x H180 x D15 mm / 簡約黑白款：W120 x H180 x D10 mm\r\n材質        矽膠\r\n包裝內容物        Cup Tie 環保杯綁\r\n。可愛萌角色/個性簡約風，隨心變換風格\r\n\r\n本商品適用杯口直徑 7 - 10cm、寬口杯型&需有杯緣(太細/太窄的杯緣不建議使用，例如COCO)，可兼容市面上 350ml 到 750ml 飲料杯。* 冰霸杯&巧力杯因為沒有杯緣，不建議使用哦 * *若使用我們不建議的杯款，會造成杯子脫落，還請注意*\"',NULL,'造型飲料提環',NULL,NULL,119,'卡通款',0,5,1),
(12,NULL,NULL,NULL,'\"商品皆為手工製作 品質有保障\r\n杯套砸重本 縫製雙層雙面都可使用 提帶長度可掛機車勾勾\r\n一般手搖飲料、咖啡皆可使用\r\n材質：兩面用 厚實可水洗帆布 髒了方便清洗  \r\n外面美到不行 裡面也美到不行\r\n\r\n今年開始買飲料不提供杯袋\r\n人人都應該擁有環保飲料提袋 一起省錢愛地球\r\n\r\n方形提袋款還可以當作手提小包包 放手機鑰匙小物\"',NULL,'大理石環保杯袋',NULL,NULL,49,'大理石款',0,6,1),
(13,NULL,NULL,NULL,'\"二手??極新??日式木作攤車/古早味日式飯糰?餐車/木質早餐攤車\r\n！白鐵訂製款！\r\nNT.38000\r\n\r\n尺寸：\r\n150*85*210公分\"',NULL,'飯糰攤車',NULL,NULL,10000,'飯糰餐車',0,0,8),
(14,NULL,NULL,NULL,'\"五臟俱全可拆質感攤車」\r\n\r\n⭐️攤車表面微防潑水，有髒污也好清潔\r\n⭐️桌面內部有貼心「鐵板」做隔熱，耐高溫耐髒好清理！\r\n⭐️兩長桿可以懸掛帆布Logo,讓攤車更吸睛\r\n⭐️有「抽屜可上鎖」，鈔票找零手機可放抽屜！\r\n⭐️攤車內部有足夠收納空間\r\n⭐️附「長型質感玻璃櫃」可以展示商品\r\n⭐️附上大傘可供遮陽避雨\r\n⭐️輪子皆有安全煞車裝置\r\n⭐️可以再自行貼皮改顏色\r\n\r\n?重點?\r\n可拆成扁平的，一般轎車可載！\r\n一台轎車就可以出去做生意了～\r\n日常也好收納！！\r\n\"',NULL,'雞蛋糕餐車',NULL,NULL,15000,'蛋糕攤車',0,1,8),
(15,NULL,NULL,NULL,NULL,NULL,'植纖外帶餐盒',NULL,NULL,800,'250入/組',0,14,6),
(16,NULL,NULL,NULL,'\"尺寸：長15cm 高27.5cm 寬9cm\r\n\r\n自製款哦，字母用紅色比較簡單顯眼，看起來也獨特\r\n\r\n拍照灰常好看的喔\r\n\r\n可以當做禮品包裝袋，糖果袋 烘焙餅乾袋\"',NULL,'防油笑臉紙袋',NULL,NULL,200,'100入/組',0,33,7),
(17,NULL,NULL,NULL,'\"?尺寸：11*16CM（實際可裝大小)\r\n?材質：紙\r\n?紙質微透，\r\n內層防水防油塗層，可當做餅乾分裝袋！\r\n適合分裝小物送禮自用都ok，\r\n小熊圖案粉嫩可愛，共有四種款式可以挑選～\r\n此款紙袋尺寸偏小，建議小仙女購買前先測量大小唷！\r\n\r\n\"',NULL,'小熊紙袋',NULL,NULL,250,'100入/組',0,29,7),
(18,NULL,NULL,NULL,'\"尺吋：8英吋 20.5公分（帶柄長度）15.5公分（面徑））5.5公分（高度）\r\n           容量500ML\r\n尺寸正負誤差一公分內（因每個使用的尺不同）           \r\n材質：陶瓷 \r\n適用：洗碗機、微波爐、消毒櫃 \r\n風格：歐式純色 \r\n工藝：印彩釉下彩 \r\n產品根據餐具生產標準嚴格把關，釉下彩色印花對身體無任何副作用，請放心使用。\r\n\r\n陶瓷餐盤難免有缺釉、小氣泡、流釉、氣泡孔或黑點、色暈等小瑕，\r\n出貨檢查不影響使用才會寄出。\r\n請能接受再下標，拿貨前都會幫大家檢查，高標買家請繞道去實體店面購買。\r\n陶瓷商品因易碎的特殊性 開箱請錄音保障彼此 不接受回家發現尺寸太小或者太大 商品尺寸均有標識 這些都不予退貨 \r\n感謝您！\"',NULL,'陶瓷握柄鍋碗',NULL,NULL,129,'墨綠款',0,10,4),
(19,NULL,NULL,NULL,'?商品詳情\r\n➢適合直徑 11cm左右的奶茶杯\r\n➢杯套寬 7cm 手繩長約 19cm\r\n➢顏色: 白色一家人杯套,粉色查理杯套\r\n➢材質: 布\r\n➢風格：卡通\r\n\"',NULL,'史奴比環保杯套',NULL,NULL,59,'史奴比款',0,1,1),
(20,NULL,NULL,NULL,'性價比非常高的一款磁性黑板，真正的物美價廉，建議搭配熒光筆一起購買。\r\n\r\n需要貨到付的請聯系客服！\r\n\r\n因大件商品。只能走宅配，運輸途中如有破損，可換可退，水水們放心選購！\r\n\r\n復古做舊立式實木小黑板花架，板面為鉄皮面，適用于粉筆,熒光筆，有磁性，可吸附磁釘，固定海報等！！\r\n材質：天然桐木\r\n邊框有7種顏色：藍色 粉色  棕色 黃色 乳白色  玫紅色\r\n\r\n全尺寸42*42*115CM，書寫區38*58CM，黑板是一款非常適合做店鋪廣告的小黑板\r\n產品測量為手工測量：可能會存在1CM左右的誤差唷\r\n注意 : 本產品雖然會隨貨附贈粉筆，\r\n但是運送途中有可能讓粉筆折斷。\r\n在此特別強調，我們販售的價格就是黑板的價格，\r\n其它附帶的贈品都是額外送的，\r\n無法因贈品有任何狀況要求退換貨！\r\n許多賣家乾脆把贈品全部拿出來丟棄，\r\n以免除不必要的困擾。本店本著服務顧客的心態，\r\n仍將贈品保留送給客人，\r\n但也請各位有所認知，\r\n不得因贈品有任何狀況要求退換貨。\r\nPS.粉筆太容易斷了。',NULL,'磁性立式黑板',NULL,NULL,300,'粉色款',0,2,5),
(21,NULL,NULL,NULL,'9尺戶外休閒遮陽傘2.7米',NULL,'大型擺攤傘',NULL,NULL,2800,'綠款2.7米',0,0,5),
(22,NULL,NULL,NULL,'\"⧗ 尺寸：\r\n   (1) 湯匙：長約23公分、寬約4.1-4.3公分。\r\n   (2) 筷子：長約23.5公分。\r\n⧗ 特色：\r\n1. 採用原木製成的湯匙、筷子，經製切割打磨，無毛刺也不扎手。\r\n2. 外觀設計符合人體工學，握感極佳。\r\n3. 外觀極簡時尚，造型線條優雅，淡淡的就能讓人感到食光的美好。\r\n4. 不管是在自家餐桌上、店面、甜點、早午餐店、餐廳，都是賞心悅目的美好存在。\r\n5. 日韓網紅、擺拍常用的餐具款式，天然優良的品質材料，兼具美觀與實用。\"',NULL,'簡約木質餐具組',NULL,NULL,50,'木紋組',0,30,2),
(23,NULL,NULL,NULL,'小麥秸桿餐具組\r\n內容物：筷子、湯匙、叉子、收納盒\r\n材質：秸桿+PP材質\r\n\r\n便於攜帶的餐具組，\r\n現在環保意識抬頭，\r\n加上衛生習慣，\r\n很多人都開始自帶餐具出門了，\r\n這組算是便宜的入門款，\r\n可以很好的養成習慣，\r\n即使忘了弄丟了也不會太心疼。\"',NULL,'輕巧小麥餐具組',NULL,NULL,39,'粉色款',0,10,2),
(24,NULL,NULL,NULL,'\"手提長:15cm\r\n可裝500cc與700cc的飲料，\r\n側邊有附吸管扣(鬆緊式)，環保又方便！\r\n<手工測量，會有微微誤差，能接受再下單喔>\"',NULL,'玩轉飲料提袋',NULL,NULL,49,'卡通款',0,5,1),
(25,NULL,NULL,NULL,'❣️商品說明\r\n  〔提袋材質〕白織布 無防水\r\n  〔吸管收納〕側邊有吸管收納 \r\n  〔提袋尺寸〕9.5x12cm \r\n  〔手提長〕15cm\r\n  〔適合杯子〕\r\n8.5cm~9.5cm杯圓\r\n500c.c~700c.c\r\n※本商品不適用胖胖杯與冰壩杯\"',NULL,'日韓可愛飲料提袋',NULL,NULL,59,'小熊款',0,10,1),
(26,NULL,NULL,NULL,'\"素素的環保杯綁設計。讓自己感受到地球在呼吸的創意設計\r\n一起愛心做環保，簡約個性單色，\r\n彈性矽膠綁帶，通用性佳?\r\n可以輕鬆水洗，速乾不怕髒?\r\n適用杯口直徑7 - 10cm，\r\n兼容市售350 - 750ml的飲料杯?\r\n冷熱飲都能一手搞定☕\r\n吸管不怕沒地方放，\r\n吸管環設計超方便，粗細吸管都能收?\r\n可收折而且超輕，不用的時候也可以收在隨身包裡~\r\n環保又有型❤使用心情也美好?\r\n\r\n?商品特色\r\n?矽膠材質?好清洗不怕髒，彈性好、更通用\r\n?方便攜帶?可收折，輕鬆收納進包包裡\r\n?吸管環設計?粗細吸管都能放，不怕無處放\r\n?兼容好用?市售350~750ml飲料杯，冷熱飲都能使用\r\n\r\n?商品規格\r\n品牌：Bone\r\n尺寸：約 12 x 18 x 1.5 cm\r\n淨重：約 25 g\r\n材質：矽膠',NULL,'超彈力環保杯套',NULL,NULL,99,'黑色款',0,3,1),
(27,NULL,NULL,NULL,'訂製品(不含燈籠)\r\n尺寸:長157x寬64x高225cm',NULL,'復古木製攤車',NULL,NULL,7500,'杉木款',0,1,8),
(28,NULL,NULL,NULL,'兩用包有手提把手、另有長背帶可肩背、側背?旁邊口袋上有熊熊的刺繡，可愛度滿滿?\r\n\r\n顏色：黑色、米色、棕色\r\n材質：偏厚的帆布，很有質感\r\n尺寸：22x21.5cm',NULL,'韓國兩用帆布袋',NULL,NULL,200,'白色款',0,1,3),
(29,NULL,NULL,NULL,'\"商品特色:\r\n1. 採用牛津布耐磨耐用不易損壞。\r\n2. 超大容量，外出攜帶超便利。\r\n3. 保溫、保冷、保冰都很適合。\r\n4. 有拉鍊，密封效果更好。\r\n5. 有提手，無論當便當袋或購物袋都很適合。\r\n\r\n品名: 北歐風超大防水便當袋\r\n\r\n材質: 牛津布+珍珠棉+PVC\r\n\r\n尺寸: 長款(高度33+手把12*寬度24*側面15CM)\r\n短款(高度22+手把12*寬度24*側面15CM)\"',NULL,'簡約風防水保溫袋',NULL,NULL,199,'黑色款',0,10,3),
(30,NULL,NULL,NULL,'\"牛皮系列各式尺寸紙湯杯/杯蓋\r\n⚠️紙湯杯跟蓋子分開販售\"\",選項中分別有對應的價格喔⚠️\r\n\r\n?此賣場單位為\'箱\'，選項中的價錢為一箱?\r\n整箱分別數量可以參考以下說明\r\n\r\n?750cc 紙湯杯\r\n     口徑：127mm \r\n     高度：76mm\r\n     數量：600入/箱(50個*12條)\r\n\r\n?850cc 紙湯杯\r\n     口徑：142mm \r\n     高度：84mm \r\n     數量：600入/箱(50個*12條)\r\n\r\n?1000cc 紙湯杯\r\n     口徑：142mm \r\n     高度：106mm \r\n     數量：600入/箱(50個*12條)\r\n\r\n?配件-850紙湯杯內襯(通用780/850/1000紙湯碗)\r\n     款式: 整層 / 三格\r\n     口徑:13.7cmx高度約4.5cm\r\n     數量：1200入/箱(50個*24條)\r\n\"',NULL,'牛皮紙湯碗',NULL,NULL,480,'50入/組',0,3,6),
(31,NULL,NULL,NULL,'材質：牛皮紙\r\n形狀：圓形\r\n\r\n',NULL,'牛皮紙杯',NULL,NULL,300,'50入/組',0,3,6),
(32,NULL,NULL,NULL,'?一面具吸油的功能~雙重功用經濟實惠?',NULL,'三角房油紙袋',NULL,NULL,200,'40入/組',0,2,7),
(33,NULL,NULL,NULL,'7吋喇叭碗，湯麵碗\r\n面徑18公分，高8公分\r\n',NULL,'撞色剉冰碗',NULL,NULL,79,'湖水綠款',0,1,4),
(34,NULL,NULL,NULL,'尺寸如圖所示\r\n材質:陶瓷\r\n此商品可用於:烤箱、微波爐、洗碗機、烘碗機',NULL,'日本陶瓷拉麵碗',NULL,NULL,69,'藍色款',0,2,4),
(35,NULL,NULL,NULL,'※ 產品說明\r\n材質：表面不鏽鋼、內部聚氨酯泡沫\r\n顏色：金屬銀色\r\n容量：51L\r\n外徑尺寸：長61cmX寬39cmX高42cm\r\n內徑尺寸：長53cmX寬33cmX高33cm\r\n\r\n※ 產品特色\r\n1.良好隔熱材料，保溫效果極佳，可有效保溫4天。\r\n2.大容量可容納85罐可口可樂鋁罐的空間。\r\n3.金屬質感、盡顯尊貴。\r\n4.超強耐用的不鏽鋼材質，清潔更容易堅固。\r\n5.增強底部空氣流通，進一步提升保溫效果。\r\n6.箱側不鏽鋼條寬大活動把手，抓握處特別增加柔軟材質。\r\n7鎖扣皆爲耐用的不鏽鋼材質。\r\n8.配有排水塞、箱蓋溝槽設計。',NULL,'不鏽鋼保溫箱',NULL,NULL,4999,'經典款',0,1,5);

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `product_type_id` int NOT NULL AUTO_INCREMENT,
  `product_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product_type` */

insert  into `product_type`(`product_type_id`,`product_type_name`) values 
(1,'環保杯套'),
(2,'環保餐具'),
(3,'環保購物袋'),
(4,'陶瓷碗盤'),
(5,'攤販用具'),
(6,'免洗餐具'),
(7,'紙袋'),
(8,'餐車');

/*Table structure for table `random_number` */

DROP TABLE IF EXISTS `random_number`;

CREATE TABLE `random_number` (
  `random_id` int NOT NULL AUTO_INCREMENT,
  `random_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`random_id`),
  UNIQUE KEY `UK_cemqpowwpimd8va0tvwv1qgm6` (`random_code`)
) ENGINE=InnoDB AUTO_INCREMENT=911 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `random_number` */

insert  into `random_number`(`random_id`,`random_code`) values 
(1,'YA00001CHI'),
(2,'YA00012CHI'),
(3,'YA00023CHI'),
(4,'YA00034CHI'),
(5,'YA00045CHI'),
(6,'YA00056CHI'),
(7,'YA00067CHI'),
(8,'YA00078CHI'),
(9,'YA00089CHI'),
(10,'YA00100CHI'),
(11,'YA00111CHI'),
(12,'YA00122CHI'),
(13,'YA00133CHI'),
(14,'YA00144CHI'),
(15,'YA00155CHI'),
(16,'YA00166CHI'),
(17,'YA00177CHI'),
(18,'YA00188CHI'),
(19,'YA00199CHI'),
(20,'YA00210CHI'),
(21,'YA00221CHI'),
(22,'YA00232CHI'),
(23,'YA00243CHI'),
(24,'YA00254CHI'),
(25,'YA00265CHI'),
(26,'YA00276CHI'),
(27,'YA00287CHI'),
(28,'YA00298CHI'),
(29,'YA00309CHI'),
(30,'YA00320CHI'),
(31,'YA00331CHI'),
(32,'YA00342CHI'),
(33,'YA00353CHI'),
(34,'YA00364CHI'),
(35,'YA00375CHI'),
(36,'YA00386CHI'),
(37,'YA00397CHI'),
(38,'YA00408CHI'),
(39,'YA00419CHI'),
(40,'YA00430CHI'),
(41,'YA00441CHI'),
(42,'YA00452CHI'),
(43,'YA00463CHI'),
(44,'YA00474CHI'),
(45,'YA00485CHI'),
(46,'YA00496CHI'),
(47,'YA00507CHI'),
(48,'YA00518CHI'),
(49,'YA00529CHI'),
(50,'YA00540CHI'),
(51,'YA00551CHI'),
(52,'YA00562CHI'),
(53,'YA00573CHI'),
(54,'YA00584CHI'),
(55,'YA00595CHI'),
(56,'YA00606CHI'),
(57,'YA00617CHI'),
(58,'YA00628CHI'),
(59,'YA00639CHI'),
(60,'YA00650CHI'),
(61,'YA00661CHI'),
(62,'YA00672CHI'),
(63,'YA00683CHI'),
(64,'YA00694CHI'),
(65,'YA00705CHI'),
(66,'YA00716CHI'),
(67,'YA00727CHI'),
(68,'YA00738CHI'),
(69,'YA00749CHI'),
(70,'YA00760CHI'),
(71,'YA00771CHI'),
(72,'YA00782CHI'),
(73,'YA00793CHI'),
(74,'YA00804CHI'),
(75,'YA00815CHI'),
(76,'YA00826CHI'),
(77,'YA00837CHI'),
(78,'YA00848CHI'),
(79,'YA00859CHI'),
(80,'YA00870CHI'),
(81,'YA00881CHI'),
(82,'YA00892CHI'),
(83,'YA00903CHI'),
(84,'YA00914CHI'),
(85,'YA00925CHI'),
(86,'YA00936CHI'),
(87,'YA00947CHI'),
(88,'YA00958CHI'),
(89,'YA00969CHI'),
(90,'YA00980CHI'),
(91,'YA00991CHI'),
(92,'YA01002CHI'),
(93,'YA01013CHI'),
(94,'YA01024CHI'),
(95,'YA01035CHI'),
(96,'YA01046CHI'),
(97,'YA01057CHI'),
(98,'YA01068CHI'),
(99,'YA01079CHI'),
(100,'YA01090CHI'),
(101,'YA01101CHI'),
(102,'YA01112CHI'),
(103,'YA01123CHI'),
(104,'YA01134CHI'),
(105,'YA01145CHI'),
(106,'YA01156CHI'),
(107,'YA01167CHI'),
(108,'YA01178CHI'),
(109,'YA01189CHI'),
(110,'YA01200CHI'),
(111,'YA01211CHI'),
(112,'YA01222CHI'),
(113,'YA01233CHI'),
(114,'YA01244CHI'),
(115,'YA01255CHI'),
(116,'YA01266CHI'),
(117,'YA01277CHI'),
(118,'YA01288CHI'),
(119,'YA01299CHI'),
(120,'YA01310CHI'),
(121,'YA01321CHI'),
(122,'YA01332CHI'),
(123,'YA01343CHI'),
(124,'YA01354CHI'),
(125,'YA01365CHI'),
(126,'YA01376CHI'),
(127,'YA01387CHI'),
(128,'YA01398CHI'),
(129,'YA01409CHI'),
(130,'YA01420CHI'),
(131,'YA01431CHI'),
(132,'YA01442CHI'),
(133,'YA01453CHI'),
(134,'YA01464CHI'),
(135,'YA01475CHI'),
(136,'YA01486CHI'),
(137,'YA01497CHI'),
(138,'YA01508CHI'),
(139,'YA01519CHI'),
(140,'YA01530CHI'),
(141,'YA01541CHI'),
(142,'YA01552CHI'),
(143,'YA01563CHI'),
(144,'YA01574CHI'),
(145,'YA01585CHI'),
(146,'YA01596CHI'),
(147,'YA01607CHI'),
(148,'YA01618CHI'),
(149,'YA01629CHI'),
(150,'YA01640CHI'),
(151,'YA01651CHI'),
(152,'YA01662CHI'),
(153,'YA01673CHI'),
(154,'YA01684CHI'),
(155,'YA01695CHI'),
(156,'YA01706CHI'),
(157,'YA01717CHI'),
(158,'YA01728CHI'),
(159,'YA01739CHI'),
(160,'YA01750CHI'),
(161,'YA01761CHI'),
(162,'YA01772CHI'),
(163,'YA01783CHI'),
(164,'YA01794CHI'),
(165,'YA01805CHI'),
(166,'YA01816CHI'),
(167,'YA01827CHI'),
(168,'YA01838CHI'),
(169,'YA01849CHI'),
(170,'YA01860CHI'),
(171,'YA01871CHI'),
(172,'YA01882CHI'),
(173,'YA01893CHI'),
(174,'YA01904CHI'),
(175,'YA01915CHI'),
(176,'YA01926CHI'),
(177,'YA01937CHI'),
(178,'YA01948CHI'),
(179,'YA01959CHI'),
(180,'YA01970CHI'),
(181,'YA01981CHI'),
(182,'YA01992CHI'),
(183,'YA02003CHI'),
(184,'YA02014CHI'),
(185,'YA02025CHI'),
(186,'YA02036CHI'),
(187,'YA02047CHI'),
(188,'YA02058CHI'),
(189,'YA02069CHI'),
(190,'YA02080CHI'),
(191,'YA02091CHI'),
(192,'YA02102CHI'),
(193,'YA02113CHI'),
(194,'YA02124CHI'),
(195,'YA02135CHI'),
(196,'YA02146CHI'),
(197,'YA02157CHI'),
(198,'YA02168CHI'),
(199,'YA02179CHI'),
(200,'YA02190CHI'),
(201,'YA02201CHI'),
(202,'YA02212CHI'),
(203,'YA02223CHI'),
(204,'YA02234CHI'),
(205,'YA02245CHI'),
(206,'YA02256CHI'),
(207,'YA02267CHI'),
(208,'YA02278CHI'),
(209,'YA02289CHI'),
(210,'YA02300CHI'),
(211,'YA02311CHI'),
(212,'YA02322CHI'),
(213,'YA02333CHI'),
(214,'YA02344CHI'),
(215,'YA02355CHI'),
(216,'YA02366CHI'),
(217,'YA02377CHI'),
(218,'YA02388CHI'),
(219,'YA02399CHI'),
(220,'YA02410CHI'),
(221,'YA02421CHI'),
(222,'YA02432CHI'),
(223,'YA02443CHI'),
(224,'YA02454CHI'),
(225,'YA02465CHI'),
(226,'YA02476CHI'),
(227,'YA02487CHI'),
(228,'YA02498CHI'),
(229,'YA02509CHI'),
(230,'YA02520CHI'),
(231,'YA02531CHI'),
(232,'YA02542CHI'),
(233,'YA02553CHI'),
(234,'YA02564CHI'),
(235,'YA02575CHI'),
(236,'YA02586CHI'),
(237,'YA02597CHI'),
(238,'YA02608CHI'),
(239,'YA02619CHI'),
(240,'YA02630CHI'),
(241,'YA02641CHI'),
(242,'YA02652CHI'),
(243,'YA02663CHI'),
(244,'YA02674CHI'),
(245,'YA02685CHI'),
(246,'YA02696CHI'),
(247,'YA02707CHI'),
(248,'YA02718CHI'),
(249,'YA02729CHI'),
(250,'YA02740CHI'),
(251,'YA02751CHI'),
(252,'YA02762CHI'),
(253,'YA02773CHI'),
(254,'YA02784CHI'),
(255,'YA02795CHI'),
(256,'YA02806CHI'),
(257,'YA02817CHI'),
(258,'YA02828CHI'),
(259,'YA02839CHI'),
(260,'YA02850CHI'),
(261,'YA02861CHI'),
(262,'YA02872CHI'),
(263,'YA02883CHI'),
(264,'YA02894CHI'),
(265,'YA02905CHI'),
(266,'YA02916CHI'),
(267,'YA02927CHI'),
(268,'YA02938CHI'),
(269,'YA02949CHI'),
(270,'YA02960CHI'),
(271,'YA02971CHI'),
(272,'YA02982CHI'),
(273,'YA02993CHI'),
(274,'YA03004CHI'),
(275,'YA03015CHI'),
(276,'YA03026CHI'),
(277,'YA03037CHI'),
(278,'YA03048CHI'),
(279,'YA03059CHI'),
(280,'YA03070CHI'),
(281,'YA03081CHI'),
(282,'YA03092CHI'),
(283,'YA03103CHI'),
(284,'YA03114CHI'),
(285,'YA03125CHI'),
(286,'YA03136CHI'),
(287,'YA03147CHI'),
(288,'YA03158CHI'),
(289,'YA03169CHI'),
(290,'YA03180CHI'),
(291,'YA03191CHI'),
(292,'YA03202CHI'),
(293,'YA03213CHI'),
(294,'YA03224CHI'),
(295,'YA03235CHI'),
(296,'YA03246CHI'),
(297,'YA03257CHI'),
(298,'YA03268CHI'),
(299,'YA03279CHI'),
(300,'YA03290CHI'),
(301,'YA03301CHI'),
(302,'YA03312CHI'),
(303,'YA03323CHI'),
(304,'YA03334CHI'),
(305,'YA03345CHI'),
(306,'YA03356CHI'),
(307,'YA03367CHI'),
(308,'YA03378CHI'),
(309,'YA03389CHI'),
(310,'YA03400CHI'),
(311,'YA03411CHI'),
(312,'YA03422CHI'),
(313,'YA03433CHI'),
(314,'YA03444CHI'),
(315,'YA03455CHI'),
(316,'YA03466CHI'),
(317,'YA03477CHI'),
(318,'YA03488CHI'),
(319,'YA03499CHI'),
(320,'YA03510CHI'),
(321,'YA03521CHI'),
(322,'YA03532CHI'),
(323,'YA03543CHI'),
(324,'YA03554CHI'),
(325,'YA03565CHI'),
(326,'YA03576CHI'),
(327,'YA03587CHI'),
(328,'YA03598CHI'),
(329,'YA03609CHI'),
(330,'YA03620CHI'),
(331,'YA03631CHI'),
(332,'YA03642CHI'),
(333,'YA03653CHI'),
(334,'YA03664CHI'),
(335,'YA03675CHI'),
(336,'YA03686CHI'),
(337,'YA03697CHI'),
(338,'YA03708CHI'),
(339,'YA03719CHI'),
(340,'YA03730CHI'),
(341,'YA03741CHI'),
(342,'YA03752CHI'),
(343,'YA03763CHI'),
(344,'YA03774CHI'),
(345,'YA03785CHI'),
(346,'YA03796CHI'),
(347,'YA03807CHI'),
(348,'YA03818CHI'),
(349,'YA03829CHI'),
(350,'YA03840CHI'),
(351,'YA03851CHI'),
(352,'YA03862CHI'),
(353,'YA03873CHI'),
(354,'YA03884CHI'),
(355,'YA03895CHI'),
(356,'YA03906CHI'),
(357,'YA03917CHI'),
(358,'YA03928CHI'),
(359,'YA03939CHI'),
(360,'YA03950CHI'),
(361,'YA03961CHI'),
(362,'YA03972CHI'),
(363,'YA03983CHI'),
(364,'YA03994CHI'),
(365,'YA04005CHI'),
(366,'YA04016CHI'),
(367,'YA04027CHI'),
(368,'YA04038CHI'),
(369,'YA04049CHI'),
(370,'YA04060CHI'),
(371,'YA04071CHI'),
(372,'YA04082CHI'),
(373,'YA04093CHI'),
(374,'YA04104CHI'),
(375,'YA04115CHI'),
(376,'YA04126CHI'),
(377,'YA04137CHI'),
(378,'YA04148CHI'),
(379,'YA04159CHI'),
(380,'YA04170CHI'),
(381,'YA04181CHI'),
(382,'YA04192CHI'),
(383,'YA04203CHI'),
(384,'YA04214CHI'),
(385,'YA04225CHI'),
(386,'YA04236CHI'),
(387,'YA04247CHI'),
(388,'YA04258CHI'),
(389,'YA04269CHI'),
(390,'YA04280CHI'),
(391,'YA04291CHI'),
(392,'YA04302CHI'),
(393,'YA04313CHI'),
(394,'YA04324CHI'),
(395,'YA04335CHI'),
(396,'YA04346CHI'),
(397,'YA04357CHI'),
(398,'YA04368CHI'),
(399,'YA04379CHI'),
(400,'YA04390CHI'),
(401,'YA04401CHI'),
(402,'YA04412CHI'),
(403,'YA04423CHI'),
(404,'YA04434CHI'),
(405,'YA04445CHI'),
(406,'YA04456CHI'),
(407,'YA04467CHI'),
(408,'YA04478CHI'),
(409,'YA04489CHI'),
(410,'YA04500CHI'),
(411,'YA04511CHI'),
(412,'YA04522CHI'),
(413,'YA04533CHI'),
(414,'YA04544CHI'),
(415,'YA04555CHI'),
(416,'YA04566CHI'),
(417,'YA04577CHI'),
(418,'YA04588CHI'),
(419,'YA04599CHI'),
(420,'YA04610CHI'),
(421,'YA04621CHI'),
(422,'YA04632CHI'),
(423,'YA04643CHI'),
(424,'YA04654CHI'),
(425,'YA04665CHI'),
(426,'YA04676CHI'),
(427,'YA04687CHI'),
(428,'YA04698CHI'),
(429,'YA04709CHI'),
(430,'YA04720CHI'),
(431,'YA04731CHI'),
(432,'YA04742CHI'),
(433,'YA04753CHI'),
(434,'YA04764CHI'),
(435,'YA04775CHI'),
(436,'YA04786CHI'),
(437,'YA04797CHI'),
(438,'YA04808CHI'),
(439,'YA04819CHI'),
(440,'YA04830CHI'),
(441,'YA04841CHI'),
(442,'YA04852CHI'),
(443,'YA04863CHI'),
(444,'YA04874CHI'),
(445,'YA04885CHI'),
(446,'YA04896CHI'),
(447,'YA04907CHI'),
(448,'YA04918CHI'),
(449,'YA04929CHI'),
(450,'YA04940CHI'),
(451,'YA04951CHI'),
(452,'YA04962CHI'),
(453,'YA04973CHI'),
(454,'YA04984CHI'),
(455,'YA04995CHI'),
(456,'YA05006CHI'),
(457,'YA05017CHI'),
(458,'YA05028CHI'),
(459,'YA05039CHI'),
(460,'YA05050CHI'),
(461,'YA05061CHI'),
(462,'YA05072CHI'),
(463,'YA05083CHI'),
(464,'YA05094CHI'),
(465,'YA05105CHI'),
(466,'YA05116CHI'),
(467,'YA05127CHI'),
(468,'YA05138CHI'),
(469,'YA05149CHI'),
(470,'YA05160CHI'),
(471,'YA05171CHI'),
(472,'YA05182CHI'),
(473,'YA05193CHI'),
(474,'YA05204CHI'),
(475,'YA05215CHI'),
(476,'YA05226CHI'),
(477,'YA05237CHI'),
(478,'YA05248CHI'),
(479,'YA05259CHI'),
(480,'YA05270CHI'),
(481,'YA05281CHI'),
(482,'YA05292CHI'),
(483,'YA05303CHI'),
(484,'YA05314CHI'),
(485,'YA05325CHI'),
(486,'YA05336CHI'),
(487,'YA05347CHI'),
(488,'YA05358CHI'),
(489,'YA05369CHI'),
(490,'YA05380CHI'),
(491,'YA05391CHI'),
(492,'YA05402CHI'),
(493,'YA05413CHI'),
(494,'YA05424CHI'),
(495,'YA05435CHI'),
(496,'YA05446CHI'),
(497,'YA05457CHI'),
(498,'YA05468CHI'),
(499,'YA05479CHI'),
(500,'YA05490CHI'),
(501,'YA05501CHI'),
(502,'YA05512CHI'),
(503,'YA05523CHI'),
(504,'YA05534CHI'),
(505,'YA05545CHI'),
(506,'YA05556CHI'),
(507,'YA05567CHI'),
(508,'YA05578CHI'),
(509,'YA05589CHI'),
(510,'YA05600CHI'),
(511,'YA05611CHI'),
(512,'YA05622CHI'),
(513,'YA05633CHI'),
(514,'YA05644CHI'),
(515,'YA05655CHI'),
(516,'YA05666CHI'),
(517,'YA05677CHI'),
(518,'YA05688CHI'),
(519,'YA05699CHI'),
(520,'YA05710CHI'),
(521,'YA05721CHI'),
(522,'YA05732CHI'),
(523,'YA05743CHI'),
(524,'YA05754CHI'),
(525,'YA05765CHI'),
(526,'YA05776CHI'),
(527,'YA05787CHI'),
(528,'YA05798CHI'),
(529,'YA05809CHI'),
(530,'YA05820CHI'),
(531,'YA05831CHI'),
(532,'YA05842CHI'),
(533,'YA05853CHI'),
(534,'YA05864CHI'),
(535,'YA05875CHI'),
(536,'YA05886CHI'),
(537,'YA05897CHI'),
(538,'YA05908CHI'),
(539,'YA05919CHI'),
(540,'YA05930CHI'),
(541,'YA05941CHI'),
(542,'YA05952CHI'),
(543,'YA05963CHI'),
(544,'YA05974CHI'),
(545,'YA05985CHI'),
(546,'YA05996CHI'),
(547,'YA06007CHI'),
(548,'YA06018CHI'),
(549,'YA06029CHI'),
(550,'YA06040CHI'),
(551,'YA06051CHI'),
(552,'YA06062CHI'),
(553,'YA06073CHI'),
(554,'YA06084CHI'),
(555,'YA06095CHI'),
(556,'YA06106CHI'),
(557,'YA06117CHI'),
(558,'YA06128CHI'),
(559,'YA06139CHI'),
(560,'YA06150CHI'),
(561,'YA06161CHI'),
(562,'YA06172CHI'),
(563,'YA06183CHI'),
(564,'YA06194CHI'),
(565,'YA06205CHI'),
(566,'YA06216CHI'),
(567,'YA06227CHI'),
(568,'YA06238CHI'),
(569,'YA06249CHI'),
(570,'YA06260CHI'),
(571,'YA06271CHI'),
(572,'YA06282CHI'),
(573,'YA06293CHI'),
(574,'YA06304CHI'),
(575,'YA06315CHI'),
(576,'YA06326CHI'),
(577,'YA06337CHI'),
(578,'YA06348CHI'),
(579,'YA06359CHI'),
(580,'YA06370CHI'),
(581,'YA06381CHI'),
(582,'YA06392CHI'),
(583,'YA06403CHI'),
(584,'YA06414CHI'),
(585,'YA06425CHI'),
(586,'YA06436CHI'),
(587,'YA06447CHI'),
(588,'YA06458CHI'),
(589,'YA06469CHI'),
(590,'YA06480CHI'),
(591,'YA06491CHI'),
(592,'YA06502CHI'),
(593,'YA06513CHI'),
(594,'YA06524CHI'),
(595,'YA06535CHI'),
(596,'YA06546CHI'),
(597,'YA06557CHI'),
(598,'YA06568CHI'),
(599,'YA06579CHI'),
(600,'YA06590CHI'),
(601,'YA06601CHI'),
(602,'YA06612CHI'),
(603,'YA06623CHI'),
(604,'YA06634CHI'),
(605,'YA06645CHI'),
(606,'YA06656CHI'),
(607,'YA06667CHI'),
(608,'YA06678CHI'),
(609,'YA06689CHI'),
(610,'YA06700CHI'),
(611,'YA06711CHI'),
(612,'YA06722CHI'),
(613,'YA06733CHI'),
(614,'YA06744CHI'),
(615,'YA06755CHI'),
(616,'YA06766CHI'),
(617,'YA06777CHI'),
(618,'YA06788CHI'),
(619,'YA06799CHI'),
(620,'YA06810CHI'),
(621,'YA06821CHI'),
(622,'YA06832CHI'),
(623,'YA06843CHI'),
(624,'YA06854CHI'),
(625,'YA06865CHI'),
(626,'YA06876CHI'),
(627,'YA06887CHI'),
(628,'YA06898CHI'),
(629,'YA06909CHI'),
(630,'YA06920CHI'),
(631,'YA06931CHI'),
(632,'YA06942CHI'),
(633,'YA06953CHI'),
(634,'YA06964CHI'),
(635,'YA06975CHI'),
(636,'YA06986CHI'),
(637,'YA06997CHI'),
(638,'YA07008CHI'),
(639,'YA07019CHI'),
(640,'YA07030CHI'),
(641,'YA07041CHI'),
(642,'YA07052CHI'),
(643,'YA07063CHI'),
(644,'YA07074CHI'),
(645,'YA07085CHI'),
(646,'YA07096CHI'),
(647,'YA07107CHI'),
(648,'YA07118CHI'),
(649,'YA07129CHI'),
(650,'YA07140CHI'),
(651,'YA07151CHI'),
(652,'YA07162CHI'),
(653,'YA07173CHI'),
(654,'YA07184CHI'),
(655,'YA07195CHI'),
(656,'YA07206CHI'),
(657,'YA07217CHI'),
(658,'YA07228CHI'),
(659,'YA07239CHI'),
(660,'YA07250CHI'),
(661,'YA07261CHI'),
(662,'YA07272CHI'),
(663,'YA07283CHI'),
(664,'YA07294CHI'),
(665,'YA07305CHI'),
(666,'YA07316CHI'),
(667,'YA07327CHI'),
(668,'YA07338CHI'),
(669,'YA07349CHI'),
(670,'YA07360CHI'),
(671,'YA07371CHI'),
(672,'YA07382CHI'),
(673,'YA07393CHI'),
(674,'YA07404CHI'),
(675,'YA07415CHI'),
(676,'YA07426CHI'),
(677,'YA07437CHI'),
(678,'YA07448CHI'),
(679,'YA07459CHI'),
(680,'YA07470CHI'),
(681,'YA07481CHI'),
(682,'YA07492CHI'),
(683,'YA07503CHI'),
(684,'YA07514CHI'),
(685,'YA07525CHI'),
(686,'YA07536CHI'),
(687,'YA07547CHI'),
(688,'YA07558CHI'),
(689,'YA07569CHI'),
(690,'YA07580CHI'),
(691,'YA07591CHI'),
(692,'YA07602CHI'),
(693,'YA07613CHI'),
(694,'YA07624CHI'),
(695,'YA07635CHI'),
(696,'YA07646CHI'),
(697,'YA07657CHI'),
(698,'YA07668CHI'),
(699,'YA07679CHI'),
(700,'YA07690CHI'),
(701,'YA07701CHI'),
(702,'YA07712CHI'),
(703,'YA07723CHI'),
(704,'YA07734CHI'),
(705,'YA07745CHI'),
(706,'YA07756CHI'),
(707,'YA07767CHI'),
(708,'YA07778CHI'),
(709,'YA07789CHI'),
(710,'YA07800CHI'),
(711,'YA07811CHI'),
(712,'YA07822CHI'),
(713,'YA07833CHI'),
(714,'YA07844CHI'),
(715,'YA07855CHI'),
(716,'YA07866CHI'),
(717,'YA07877CHI'),
(718,'YA07888CHI'),
(719,'YA07899CHI'),
(720,'YA07910CHI'),
(721,'YA07921CHI'),
(722,'YA07932CHI'),
(723,'YA07943CHI'),
(724,'YA07954CHI'),
(725,'YA07965CHI'),
(726,'YA07976CHI'),
(727,'YA07987CHI'),
(728,'YA07998CHI'),
(729,'YA08009CHI'),
(730,'YA08020CHI'),
(731,'YA08031CHI'),
(732,'YA08042CHI'),
(733,'YA08053CHI'),
(734,'YA08064CHI'),
(735,'YA08075CHI'),
(736,'YA08086CHI'),
(737,'YA08097CHI'),
(738,'YA08108CHI'),
(739,'YA08119CHI'),
(740,'YA08130CHI'),
(741,'YA08141CHI'),
(742,'YA08152CHI'),
(743,'YA08163CHI'),
(744,'YA08174CHI'),
(745,'YA08185CHI'),
(746,'YA08196CHI'),
(747,'YA08207CHI'),
(748,'YA08218CHI'),
(749,'YA08229CHI'),
(750,'YA08240CHI'),
(751,'YA08251CHI'),
(752,'YA08262CHI'),
(753,'YA08273CHI'),
(754,'YA08284CHI'),
(755,'YA08295CHI'),
(756,'YA08306CHI'),
(757,'YA08317CHI'),
(758,'YA08328CHI'),
(759,'YA08339CHI'),
(760,'YA08350CHI'),
(761,'YA08361CHI'),
(762,'YA08372CHI'),
(763,'YA08383CHI'),
(764,'YA08394CHI'),
(765,'YA08405CHI'),
(766,'YA08416CHI'),
(767,'YA08427CHI'),
(768,'YA08438CHI'),
(769,'YA08449CHI'),
(770,'YA08460CHI'),
(771,'YA08471CHI'),
(772,'YA08482CHI'),
(773,'YA08493CHI'),
(774,'YA08504CHI'),
(775,'YA08515CHI'),
(776,'YA08526CHI'),
(777,'YA08537CHI'),
(778,'YA08548CHI'),
(779,'YA08559CHI'),
(780,'YA08570CHI'),
(781,'YA08581CHI'),
(782,'YA08592CHI'),
(783,'YA08603CHI'),
(784,'YA08614CHI'),
(785,'YA08625CHI'),
(786,'YA08636CHI'),
(787,'YA08647CHI'),
(788,'YA08658CHI'),
(789,'YA08669CHI'),
(790,'YA08680CHI'),
(791,'YA08691CHI'),
(792,'YA08702CHI'),
(793,'YA08713CHI'),
(794,'YA08724CHI'),
(795,'YA08735CHI'),
(796,'YA08746CHI'),
(797,'YA08757CHI'),
(798,'YA08768CHI'),
(799,'YA08779CHI'),
(800,'YA08790CHI'),
(801,'YA08801CHI'),
(802,'YA08812CHI'),
(803,'YA08823CHI'),
(804,'YA08834CHI'),
(805,'YA08845CHI'),
(806,'YA08856CHI'),
(807,'YA08867CHI'),
(808,'YA08878CHI'),
(809,'YA08889CHI'),
(810,'YA08900CHI'),
(811,'YA08911CHI'),
(812,'YA08922CHI'),
(813,'YA08933CHI'),
(814,'YA08944CHI'),
(815,'YA08955CHI'),
(816,'YA08966CHI'),
(817,'YA08977CHI'),
(818,'YA08988CHI'),
(819,'YA08999CHI'),
(820,'YA09010CHI'),
(821,'YA09021CHI'),
(822,'YA09032CHI'),
(823,'YA09043CHI'),
(824,'YA09054CHI'),
(825,'YA09065CHI'),
(826,'YA09076CHI'),
(827,'YA09087CHI'),
(828,'YA09098CHI'),
(829,'YA09109CHI'),
(830,'YA09120CHI'),
(831,'YA09131CHI'),
(832,'YA09142CHI'),
(833,'YA09153CHI'),
(834,'YA09164CHI'),
(835,'YA09175CHI'),
(836,'YA09186CHI'),
(837,'YA09197CHI'),
(838,'YA09208CHI'),
(839,'YA09219CHI'),
(840,'YA09230CHI'),
(841,'YA09241CHI'),
(842,'YA09252CHI'),
(843,'YA09263CHI'),
(844,'YA09274CHI'),
(845,'YA09285CHI'),
(846,'YA09296CHI'),
(847,'YA09307CHI'),
(848,'YA09318CHI'),
(849,'YA09329CHI'),
(850,'YA09340CHI'),
(851,'YA09351CHI'),
(852,'YA09362CHI'),
(853,'YA09373CHI'),
(854,'YA09384CHI'),
(855,'YA09395CHI'),
(856,'YA09406CHI'),
(857,'YA09417CHI'),
(858,'YA09428CHI'),
(859,'YA09439CHI'),
(860,'YA09450CHI'),
(861,'YA09461CHI'),
(862,'YA09472CHI'),
(863,'YA09483CHI'),
(864,'YA09494CHI'),
(865,'YA09505CHI'),
(866,'YA09516CHI'),
(867,'YA09527CHI'),
(868,'YA09538CHI'),
(869,'YA09549CHI'),
(870,'YA09560CHI'),
(871,'YA09571CHI'),
(872,'YA09582CHI'),
(873,'YA09593CHI'),
(874,'YA09604CHI'),
(875,'YA09615CHI'),
(876,'YA09626CHI'),
(877,'YA09637CHI'),
(878,'YA09648CHI'),
(879,'YA09659CHI'),
(880,'YA09670CHI'),
(881,'YA09681CHI'),
(882,'YA09692CHI'),
(883,'YA09703CHI'),
(884,'YA09714CHI'),
(885,'YA09725CHI'),
(886,'YA09736CHI'),
(887,'YA09747CHI'),
(888,'YA09758CHI'),
(889,'YA09769CHI'),
(890,'YA09780CHI'),
(891,'YA09791CHI'),
(892,'YA09802CHI'),
(893,'YA09813CHI'),
(894,'YA09824CHI'),
(895,'YA09835CHI'),
(896,'YA09846CHI'),
(897,'YA09857CHI'),
(898,'YA09868CHI'),
(899,'YA09879CHI'),
(900,'YA09890CHI'),
(901,'YA09901CHI'),
(902,'YA09912CHI'),
(903,'YA09923CHI'),
(904,'YA09934CHI'),
(905,'YA09945CHI'),
(906,'YA09956CHI'),
(907,'YA09967CHI'),
(908,'YA09978CHI'),
(909,'YA09989CHI'),
(910,'YA10000CHI');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `role` */

insert  into `role`(`id`,`role_code`,`role_name`) values 
(1,'USER','會員'),
(2,'USER','會員');

/*Table structure for table `ship_type` */

DROP TABLE IF EXISTS `ship_type`;

CREATE TABLE `ship_type` (
  `ship_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ship_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ship_type` */

insert  into `ship_type`(`ship_type_id`,`type_name`) values 
(1,'宅配到府'),
(2,'超商取貨'),
(3,'中華郵政');

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `shop_addr` varchar(255) DEFAULT NULL,
  `shop_file_name` varchar(255) DEFAULT NULL,
  `shop_hours` varchar(255) DEFAULT NULL,
  `shop_hyperlink` varchar(255) DEFAULT NULL,
  `shop_info` varchar(255) DEFAULT NULL,
  `shop_media` longblob,
  `shop_memo` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_owner` varchar(255) DEFAULT NULL,
  `shop_phone` varchar(255) DEFAULT NULL,
  `shop_pic` longblob,
  `shop_score` double DEFAULT NULL,
  `FK_nightmarket_id` int DEFAULT NULL,
  `FK_shop_type_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `FKayhr6w5yps12nfh7t4ftywapw` (`FK_nightmarket_id`),
  KEY `FK3ucxfej4ev4agj9b5q2rt4w0m` (`FK_shop_type_id`),
  CONSTRAINT `FK3ucxfej4ev4agj9b5q2rt4w0m` FOREIGN KEY (`FK_shop_type_id`) REFERENCES `shop_type` (`shop_type_id`),
  CONSTRAINT `FKayhr6w5yps12nfh7t4ftywapw` FOREIGN KEY (`FK_nightmarket_id`) REFERENCES `nightmarket` (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop` */

/*Table structure for table `shop_comment` */

DROP TABLE IF EXISTS `shop_comment`;

CREATE TABLE `shop_comment` (
  `shop_comment_id` int NOT NULL AUTO_INCREMENT,
  `shop_cmment_photo` longblob,
  `shop_comment_content` varchar(255) DEFAULT NULL,
  `shop_comment_memo` varchar(255) DEFAULT NULL,
  `shop_comment_time` datetime(6) DEFAULT NULL,
  `shop_response` varchar(255) DEFAULT NULL,
  `shop_score` double DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_comment_id`),
  KEY `FK9iejanwkfi7i9ecyvh55bamih` (`FK_member_id`),
  KEY `FKgx9dxp39pm4uwkl78gwpfkb2b` (`FK_shop_id`),
  CONSTRAINT `FK9iejanwkfi7i9ecyvh55bamih` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FKgx9dxp39pm4uwkl78gwpfkb2b` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_comment` */

/*Table structure for table `shop_menu` */

DROP TABLE IF EXISTS `shop_menu`;

CREATE TABLE `shop_menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_detail` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_photo` longblob,
  `menu_price` double DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `FKtpd68t36nq2xm1dth3k9t8dr9` (`FK_shop_id`),
  CONSTRAINT `FKtpd68t36nq2xm1dth3k9t8dr9` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_menu` */

/*Table structure for table `shop_shoplist` */

DROP TABLE IF EXISTS `shop_shoplist`;

CREATE TABLE `shop_shoplist` (
  `FK_ShopList_id` int NOT NULL,
  `FK_Shop_id` int NOT NULL,
  PRIMARY KEY (`FK_ShopList_id`,`FK_Shop_id`),
  KEY `FKmm2suasksuig3iy7xsok9dhan` (`FK_Shop_id`),
  CONSTRAINT `FKllblb7lymn6lycstw7dp79uur` FOREIGN KEY (`FK_ShopList_id`) REFERENCES `favorite_shoplist` (`shop_list_id`),
  CONSTRAINT `FKmm2suasksuig3iy7xsok9dhan` FOREIGN KEY (`FK_Shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_shoplist` */

/*Table structure for table `shop_type` */

DROP TABLE IF EXISTS `shop_type`;

CREATE TABLE `shop_type` (
  `shop_type_id` int NOT NULL AUTO_INCREMENT,
  `shop_type_memo` varchar(255) DEFAULT NULL,
  `shop_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_type` */

insert  into `shop_type`(`shop_type_id`,`shop_type_memo`,`shop_type_name`) values 
(1,NULL,'中式料理'),
(2,NULL,'西式料理'),
(3,NULL,'日式料理'),
(4,NULL,'飲料'),
(5,NULL,'衣服'),
(6,NULL,'飾品'),
(7,NULL,'手機周邊'),
(8,NULL,'日常生活用品'),
(9,NULL,'遊戲');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
