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

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_status` int DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKg206pc5701k71nidcuv666edl` (`FK_member_id`),
  CONSTRAINT `FKg206pc5701k71nidcuv666edl` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart` */

/*Table structure for table `cart_item` */

DROP TABLE IF EXISTS `cart_item`;

CREATE TABLE `cart_item` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_item_amount` int DEFAULT NULL,
  `cart_item_memo` varchar(255) DEFAULT NULL,
  `FK_cart_id` int DEFAULT NULL,
  `FK_product_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `FKbcp7ja7odensfmk2fpknmcfx0` (`FK_cart_id`),
  KEY `FKq9hgx0we4tbb0euh7r8cy0v7r` (`FK_product_id`),
  CONSTRAINT `FKbcp7ja7odensfmk2fpknmcfx0` FOREIGN KEY (`FK_cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FKq9hgx0we4tbb0euh7r8cy0v7r` FOREIGN KEY (`FK_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart_item` */

/*Table structure for table `coupon` */

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `coupon_amount` int DEFAULT NULL,
  `coupon_birth` date DEFAULT NULL,
  `coupon_days` int DEFAULT NULL,
  `coupon_info` varchar(255) DEFAULT NULL,
  `coupon_memo` varchar(255) DEFAULT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `coupon_rule` varchar(255) DEFAULT NULL,
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
  CONSTRAINT `FKn2f7i70wcm6sufry5nu9jvcn4` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon_used` */

/*Table structure for table `favorite_couponlist` */

DROP TABLE IF EXISTS `favorite_couponlist`;

CREATE TABLE `favorite_couponlist` (
  `coupon_list_id` int NOT NULL AUTO_INCREMENT,
  `FK_member_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_list_id`),
  KEY `FKnywaf6p8225n8pifylm0jh0xj` (`FK_member_id`),
  CONSTRAINT `FKnywaf6p8225n8pifylm0jh0xj` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`member_id`)
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
  CONSTRAINT `FKq9wvqkf7fv9rjut2n47sohves` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `favorite_shoplist` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` longblob,
  `member_type` varchar(255) DEFAULT NULL,
  `memo` longtext,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `register_time` date DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `FK4mce76fcm5c3dyutgr7vx4y3s` (`FK_shop_id`),
  CONSTRAINT `FK4mce76fcm5c3dyutgr7vx4y3s` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

/*Table structure for table `nightmarket` */

DROP TABLE IF EXISTS `nightmarket`;

CREATE TABLE `nightmarket` (
  `market_id` int NOT NULL AUTO_INCREMENT,
  `market_comment` varchar(255) DEFAULT NULL,
  `market_memo` varchar(255) DEFAULT NULL,
  `market_name` varchar(255) DEFAULT NULL,
  `market_score` double DEFAULT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `nightmarket` */

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

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(255) DEFAULT NULL,
  `company_title` varchar(255) DEFAULT NULL,
  `invoice_num` varchar(255) DEFAULT NULL,
  `order_address` varchar(255) DEFAULT NULL,
  `order_datetime` datetime(6) DEFAULT NULL,
  `order_memo` varchar(255) DEFAULT NULL,
  `order_status_id` int DEFAULT NULL,
  `pay_me` int DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK6r5sbky9djgfljnjyrs37yacl` (`FK_member_id`),
  CONSTRAINT `FK6r5sbky9djgfljnjyrs37yacl` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `product_expire` date DEFAULT NULL,
  `product_info` varchar(255) DEFAULT NULL,
  `product_memo` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_pic` longblob,
  `product_price` double DEFAULT NULL,
  `product_stock` int DEFAULT NULL,
  `FK_product_type_id` int DEFAULT NULL,
  `product_spec` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKc9sqrle3uny7sdork7a91qbph` (`FK_product_type_id`),
  CONSTRAINT `FKc9sqrle3uny7sdork7a91qbph` FOREIGN KEY (`FK_product_type_id`) REFERENCES `product_type` (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`filename`,`product_expire`,`product_info`,`product_memo`,`product_name`,`product_pic`,`product_price`,`product_stock`,`FK_product_type_id`,`product_spec`) values 
(1,'product3-1',NULL,'產品資訊目前沒有資料',NULL,'好好看黑色帆布袋-2',NULL,320,20,1,NULL),
(2,NULL,NULL,'因為不知道要賣什麼所以商品資訊也不知道要填什麼',NULL,'商品名稱不知道要取什麼-1',NULL,161,55,3,'魔鬼的顏色');

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `product_type_id` int NOT NULL AUTO_INCREMENT,
  `product_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product_type` */

insert  into `product_type`(`product_type_id`,`product_type_name`) values 
(1,'超好用'),
(2,'普通好用'),
(3,'超級難用');

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `shop_addr` varchar(255) DEFAULT NULL,
  `shop_hours` varchar(255) DEFAULT NULL,
  `shop_hyperlink` varchar(255) DEFAULT NULL,
  `shop_info` varchar(255) DEFAULT NULL,
  `shop_media` longblob,
  `shop_memo` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_phone` varchar(255) DEFAULT NULL,
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
  CONSTRAINT `FK9iejanwkfi7i9ecyvh55bamih` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`member_id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_type` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
