/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.13-log : Database - shopping
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shopping` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shopping`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `gid` int(11) NOT NULL,
  `kinds` varchar(50) DEFAULT NULL,
  `gname` varchar(100) DEFAULT NULL,
  `gphoto` varchar(100) DEFAULT NULL,
  `types` varchar(100) DEFAULT NULL,
  `producer` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `carriage` float DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `paddress` varchar(100) DEFAULT NULL,
  `described` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`gid`,`kinds`,`gname`,`gphoto`,`types`,`producer`,`price`,`carriage`,`pdate`,`paddress`,`described`) values (1,'品牌手机','nokia','Noji.jpg','诺基亚230','诺基亚',450,10,'2009-07-16 16:28:15','China','金刚'),(2,'品牌手机','iphone','iphone.jpg','iphone7','苹果',7000,50,'2016-07-15 17:02:41','America','高档'),(3,'数码相机','fujinon','fushi.jpg','富士X-T10','富士',3999,20,'2016-02-06 17:06:30','Jpan','微单'),(4,'数码相机','nikon','nikang.jpg','尼康D7000','尼康',8369,30,'2016-01-06 17:08:48','Ger','单反'),(5,'笔记本电脑','lenovo','lianxiang.jpg','联想Z410','联想',5500,20,'2015-01-06 17:11:38','America','白色轻便'),(6,'笔记本电脑','dell','dell.jpg','dell灵越15','dell',5499,20,'2016-12-22 21:26:49','Jpan','黑色高贵'),(7,'笔记本电脑','acer','acer.jpg','Acer_swift7','宏基',9999,50,'2016-12-02 21:29:17','gREN','超薄设计'),(8,'笔记本电脑','benq','mingji.jpg','明基S46-XC11','明基',4199,20,'2015-06-11 21:32:16','Ben','停产');

/*Table structure for table `shoppingcart` */

DROP TABLE IF EXISTS `shoppingcart`;

CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `gid` (`gid`),
  CONSTRAINT `gid` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='0:未支付商品\r\n1:已支付商品';

/*Data for the table `shoppingcart` */

insert  into `shoppingcart`(`id`,`uid`,`gid`,`status`,`number`) values (1,1,1,1,3),(2,1,4,1,1),(3,1,2,1,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `uid` int(30) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `passwd` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`uid`,`uname`,`passwd`,`email`,`lastlogin`) values (1,'sen','123','747895843@qq.com','2016-11-24 15:50:35');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
