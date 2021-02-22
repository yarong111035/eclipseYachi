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

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `product_expire` date DEFAULT NULL,
  `product_info` varchar(255) DEFAULT NULL,
  `product_memo` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_no` varchar(255) DEFAULT NULL,
  `product_pic` longblob,
  `product_price` int DEFAULT NULL,
  `product_stock` int DEFAULT NULL,
  `fk_sort_id` int DEFAULT NULL,
  `product_spec` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK9jnt2p81rgvo6w2w1112ct3x4` (`fk_sort_id`),
  CONSTRAINT `FK9jnt2p81rgvo6w2w1112ct3x4` FOREIGN KEY (`fk_sort_id`) REFERENCES `product_sort` (`sortId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`filename`,`product_expire`,`product_info`,`product_memo`,`product_name`,`product_no`,`product_pic`,`product_price`,`product_stock`,`fk_sort_id`,`product_spec`) values 
(1,'src\\main\\webapp\\images_2\\product3.jpg',NULL,'產品資訊目前沒有資料-1',NULL,'超好用收納購物袋','A001',NULL,310,20,1,NULL),
(2,'src\\main\\webapp\\images_2\\product2-2.jpg',NULL,'產品資訊目前沒有資料-2',NULL,'好好看黑色帆布袋-2','A002',NULL,320,10,2,NULL),
(3,'src\\main\\webapp\\images_2\\product4-2.jpg',NULL,'產品資訊目前沒有資料-3',NULL,'實用蠟黃時尚包','A003',NULL,399,70,2,NULL),
(4,'src\\main\\webapp\\images_2\\product5-1.jpg',NULL,'產品資訊目前沒有資料-4',NULL,'實用貴族灰後背包','A004',NULL,303,5,3,NULL),
(5,'src\\main\\webapp\\images_2\\商品照片1.jpg',NULL,'產品資訊目前沒有資料-5',NULL,'測試產品1','A005',NULL,599,30,1,NULL),
(6,'src\\main\\webapp\\images_2\\product2-2.jpg',NULL,NULL,NULL,'測試產品2','A006',NULL,699,34,2,NULL),
(17,NULL,NULL,'因為不知道要賣什麼所以商品資訊也不知道要填什麼',NULL,'商品名稱不知道要取什麼-2',NULL,NULL,1234,22,NULL,'白色'),
(18,NULL,NULL,'因為不知道要賣什麼所以商品資訊也不知道要填什麼',NULL,'今天天氣真不錯-1',NULL,NULL,101,3,3,'白色'),
(19,NULL,NULL,'因為不知道要賣什麼所以商品資訊也不知道要填什麼',NULL,'商品名稱不知道要取什麼-1',NULL,NULL,111,11,2,'白色');

/*Table structure for table `product_sort` */

DROP TABLE IF EXISTS `product_sort`;

CREATE TABLE `product_sort` (
  `sortId` int NOT NULL AUTO_INCREMENT,
  `sortName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sortId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product_sort` */

insert  into `product_sort`(`sortId`,`sortName`) values 
(1,'超好用'),
(2,'普通好用'),
(3,'超難用');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
