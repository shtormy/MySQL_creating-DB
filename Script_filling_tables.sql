-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_19
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalog_subdivision`
--

DROP TABLE IF EXISTS `catalog_subdivision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_subdivision` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  CONSTRAINT `catalog_subdivision_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Подкаталоги';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_subdivision`
--

LOCK TABLES `catalog_subdivision` WRITE;
/*!40000 ALTER TABLE `catalog_subdivision` DISABLE KEYS */;
INSERT INTO `catalog_subdivision` VALUES (1,1,'doloribus'),(2,2,'voluptas'),(3,3,'non'),(4,4,'commodi'),(5,5,'omnis'),(6,1,'placeat'),(7,2,'ea'),(8,3,'iste'),(9,4,'voluptatibus'),(10,5,'aliquid'),(11,1,'expedita'),(12,2,'velit'),(13,3,'fuga'),(14,4,'in'),(15,5,'est');
/*!40000 ALTER TABLE `catalog_subdivision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы каталога';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'quis'),(2,'voluptatem'),(3,'ipsa'),(4,'aspernatur'),(5,'provident');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_method` enum('Самовывоз','Курьером') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Доставка';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,1,'36','Самовывоз'),(2,2,2,'3.740967','Самовывоз'),(3,3,3,'16.105390273','Курьером'),(4,4,4,'6.61365246','Самовывоз'),(5,5,5,'10012.39','Самовывоз'),(6,6,6,'2.188','Курьером'),(7,7,7,'8514.6678131','Самовывоз'),(8,8,8,'67413687.086821','Самовывоз'),(9,9,9,'2397825','Самовывоз'),(10,10,10,'249007432.73168','Самовывоз');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,1,9759530,'1977-07-11 10:25:04','1993-08-24 14:24:30','1996-02-23 12:49:07','2012-08-15 04:00:08'),(2,2,2,82,'2022-01-22 22:09:56','2022-05-02 12:13:53','1970-02-24 05:38:02','2019-10-01 06:40:38'),(3,3,3,0,'1980-10-08 01:28:23','1997-12-07 09:19:43','1992-11-21 05:51:26','2010-05-02 12:50:08'),(4,4,4,8,'1986-01-10 11:00:14','1998-03-08 08:41:50','2004-10-06 15:25:26','2005-02-19 22:57:13'),(5,5,5,505475,'1996-05-20 10:36:15','2006-09-15 16:10:01','1983-04-20 08:15:52','1976-06-06 10:04:38');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `feedback_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Отзывы покупателей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,'Sapiente rerum ea qui velit dignissimos explicabo eveniet non. Cupiditate saepe repellat nostrum qui debitis temporibus. Voluptates quia vel quos quia nam voluptates consectetur. Harum excepturi dicta cum voluptatem est dolore.',1),(2,2,'Occaecati autem voluptatem corporis cum nihil accusamus maxime est. Nostrum sed quia tempore. Ab inventore nesciunt iste.',2),(3,3,'Numquam ipsum ex eos doloribus dignissimos. Natus iure saepe ut laboriosam dolorum. Debitis quam ullam dolores veritatis debitis exercitationem dolorem optio.',3),(4,4,'Esse libero mollitia tempora est repellat consequuntur qui commodi. Voluptates totam quia delectus laboriosam incidunt quos maiores. Sit pariatur nam quia et quis. Beatae minus quis non.',4),(5,5,'Cumque voluptate consequatur culpa illo quaerat. In quis fugiat sed quia voluptas natus dolores amet. Reprehenderit enim ipsam aliquid laboriosam voluptatem fugit voluptatem. Rem aut odio ut libero culpa. Est voluptas nihil ut quod iste.',5),(6,6,'Itaque dolorem atque qui facere eos itaque. Nostrum deserunt et necessitatibus saepe. Ad nihil architecto atque.',6),(7,7,'Itaque illo facilis qui et. Iste et ut quasi quo. In qui aspernatur aut impedit qui. Numquam quas ratione eum unde voluptatem eos. Temporibus corporis tempora eius a.',7),(8,8,'Consequatur veniam tenetur ut recusandae quidem veniam distinctio aut. Eos aut consequuntur esse culpa ea hic. Repellendus vitae cum et dolor placeat sunt. Blanditiis omnis numquam nihil ipsam aut blanditiis.',8),(9,9,'Quo quae cumque rerum illo placeat ut qui. Maiores perferendis laborum et at aut. Harum qui impedit et perferendis. Rerum eaque ut provident nihil ratione magni eum.',9),(10,10,'Tenetur cum dolor laborum excepturi explicabo ut quia suscipit. Delectus id impedit sed totam. Odio architecto consequatur ducimus omnis et aliquid. Consectetur non repudiandae ab occaecati omnis facere dolores.',10);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `images_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `images_id` (`images_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`images_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Фото товара';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'ut','1988-11-30 23:29:08','1980-02-18 05:42:34'),(2,2,'quos','1997-07-12 11:04:49','2003-08-25 04:01:37'),(3,3,'culpa','2013-09-21 14:39:18','2008-06-18 18:37:17'),(4,4,'quis','1972-09-17 12:20:54','2020-11-07 10:04:20'),(5,5,'quaerat','2009-11-26 15:22:37','1982-12-25 10:09:54'),(6,6,'officiis','2011-08-01 09:50:39','1975-05-29 03:36:39'),(7,7,'aut','1990-08-16 07:21:24','1972-01-22 22:33:40'),(8,8,'illum','1989-02-16 12:06:39','1981-09-24 19:01:46'),(9,9,'soluta','1979-09-05 15:29:52','1977-08-20 11:32:12'),(10,10,'et','1990-12-15 22:09:49','1989-03-09 13:54:01'),(11,11,'minus','2022-03-17 15:14:30','2006-09-02 10:20:55'),(12,12,'aut','2000-05-30 09:12:29','2000-08-01 04:27:03'),(13,13,'doloremque','2018-03-29 16:30:31','1977-02-26 17:53:40'),(14,14,'fugit','2017-11-16 23:04:05','2012-09-07 12:05:57'),(15,15,'facilis','2004-06-21 18:43:47','1976-07-18 04:35:50'),(16,16,'voluptas','2001-07-30 02:26:56','1991-05-31 19:48:34'),(17,17,'accusantium','2004-02-07 02:54:59','1995-01-14 21:14:24'),(18,18,'officiis','1979-01-22 03:47:05','1986-06-19 15:00:03'),(19,19,'est','2004-09-06 00:27:11','1970-12-13 19:44:09'),(20,20,'quia','1997-04-12 03:50:25','1975-12-06 07:23:20');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) DEFAULT 1 COMMENT 'Количество товара',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `orders_quantity_idx` (`quantity`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Kорзина покупателя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,8,'1994-04-25 20:57:20','1977-08-31 03:49:02'),(2,2,2,7,'2004-08-31 05:53:25','2018-09-14 00:23:44'),(3,3,3,6,'2016-11-12 06:39:44','2015-02-15 08:34:09'),(4,4,4,7,'2004-04-03 04:33:28','2013-12-06 15:53:12'),(5,5,5,4,'1996-01-03 23:59:17','1978-06-27 20:36:40'),(6,6,6,1,'2012-02-28 05:39:14','1986-09-01 03:20:30'),(7,7,7,8,'1981-09-23 11:03:21','2004-05-24 23:47:58'),(8,8,8,7,'2015-07-21 09:43:52','1972-04-16 04:58:57'),(9,9,9,2,'2020-10-07 22:54:10','2011-10-19 02:38:29'),(10,10,10,3,'1974-04-05 13:18:39','1980-11-02 20:30:18'),(11,1,11,7,'1976-11-09 21:14:10','2013-09-20 10:27:54'),(12,2,12,0,'1991-11-10 07:08:00','1989-01-15 00:26:48'),(13,3,13,9,'2000-06-05 21:09:48','1983-06-25 16:49:15'),(14,4,14,8,'1975-05-22 08:13:34','2005-10-22 03:36:47'),(15,5,15,1,'2013-06-17 16:59:58','1976-10-05 03:08:16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payer_id` bigint(20) unsigned NOT NULL,
  `pay_order_id` bigint(20) unsigned NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `pay_status` bit(1) DEFAULT b'0',
  `amount_of_payment` decimal(11,2) DEFAULT NULL COMMENT 'Стоимость',
  PRIMARY KEY (`id`),
  KEY `payer_id` (`payer_id`),
  KEY `pay_order_id` (`pay_order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`payer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`pay_order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Оплата заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,'2013-08-01 17:03:29','',3.00),(2,2,2,'1976-04-23 13:00:25','',6.00),(3,3,3,'2002-07-01 11:13:28','',6.00),(4,4,4,'1987-11-04 20:17:33','',6.00),(5,5,5,'1981-08-17 17:08:52','',3.00),(6,6,6,'1989-11-17 11:25:42','',3.00),(7,7,7,'1992-01-16 19:22:49','',7.00),(8,8,8,'1995-12-04 04:47:41','',8.00),(9,9,9,'2010-10-08 03:20:54','',2.00),(10,10,10,'1999-04-04 09:59:21','',2.00);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `desription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_sub_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_sub_id` (`catalog_sub_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catalog_sub_id`) REFERENCES `catalog_subdivision` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товары';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'assumenda','Aut animi iure quis quos consequatur reiciendis quia. Modi aperiam sint quae libero cumque nobis. Ut asperiores expedita distinctio. Provident blanditiis tenetur officiis et tenetur repellendus ut.',1.31,1),(2,'vel','Saepe sunt facere alias inventore sint. Natus dolorum in vel architecto nulla dignissimos architecto cumque.',158159.00,2),(3,'voluptates','Iusto dicta quidem consequuntur labore. Dolorem vel consequuntur et quod qui id eum. Quos et blanditiis modi. Hic alias nostrum expedita sit quam quos.',538948.80,3),(4,'quos','Culpa sunt nesciunt aut voluptatibus explicabo dolorem quas. Quia accusamus quo ut laudantium harum distinctio eum voluptas. Ut provident eos quia asperiores. Eum aliquid ad dolorum libero.',1631.00,4),(5,'qui','Repellendus nihil velit reprehenderit odio et. Sint esse molestiae fugit est ut. Rerum pariatur praesentium asperiores delectus amet.',69.05,5),(6,'iure','Sunt error maiores aperiam. Et odit consequuntur quas ipsa excepturi dolorem inventore. Saepe quo ex ea magni. Optio cumque impedit sed rem.',628.83,6),(7,'consequuntur','Reprehenderit ad quos eum eius. Sequi quae non quia reiciendis quasi laboriosam. Enim asperiores tempora qui perferendis.',110.74,7),(8,'officia','Vitae voluptas itaque architecto quisquam deserunt delectus sunt. Qui molestiae iste consequatur et placeat.',30570.75,8),(9,'quod','Consequatur aut perspiciatis facilis vel harum modi omnis omnis. Facilis voluptas et ad et nobis et ut.',4406930.86,9),(10,'dicta','Occaecati quam necessitatibus quis magnam. Adipisci minima soluta animi eum asperiores. Explicabo ut esse provident minus. Provident corrupti commodi dolorum sed hic reprehenderit consequatur.',16184.90,10),(11,'voluptatem','Vel necessitatibus deleniti itaque consectetur quas aut est blanditiis. Excepturi sed accusamus sit rerum qui. Voluptatem illo exercitationem dolor natus. Ea magni minima aut qui optio ea.',2696.70,11),(12,'harum','Doloribus aliquam consequatur cumque voluptatem minus labore nihil. Atque animi ipsum cumque dolorum optio. Est odit et facere quas ipsa.',83696.36,12),(13,'nobis','Aperiam soluta illum consectetur maxime neque dolorem consectetur. Asperiores est nihil ut ut quidem molestias aut. Eum beatae corrupti ut sint.',17999688.61,13),(14,'sit','Expedita aut aliquid numquam neque dolor. Atque iste blanditiis sapiente dignissimos sed velit et velit. Voluptatem odit numquam et. Id odio eveniet veritatis placeat non ut at.',2263883.92,14),(15,'eos','Ea voluptatibus autem dicta facere. Et sapiente ab maxime in. Cum repellat dicta asperiores et et quidem vel. Temporibus ipsum quo quasi id mollitia.',373.71,15),(16,'dolores','Tenetur sit facere nesciunt sunt quo dolorum ut. Et voluptatem dolorem delectus molestiae iure rem. Reprehenderit neque aspernatur quasi nam. Voluptatem illum non et.',58125.18,1),(17,'earum','Doloribus corrupti labore delectus dignissimos veniam quia amet. Qui nisi tempora natus sit. Temporibus vel delectus et.',2313006.09,2),(18,'esse','Vitae consequatur ipsa aliquam et ad. Non laborum sed nam modi tempore voluptate impedit sapiente. Qui nihil sit consequatur sit accusamus magni sed libero. Ratione nulla vel et fugiat provident.',327758.29,3),(19,'perferendis','Ullam totam aut eos ut eum molestias. Odio asperiores aut nemo excepturi quos expedita. Aperiam id mollitia harum qui et. Corrupti eos corrupti ullam ut totam aut doloribus eum.',2.31,4),(20,'ipsam','Quis quidem sint quae est consequuntur hic et. Sed nesciunt aspernatur sapiente dolorum. Consectetur autem et optio est eveniet sed.',4545.00,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_default` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Профиль покупателя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (11,'f','1973-11-25','2012-12-03 01:10:31','accusamus','illo'),(12,'m','1999-01-22','2019-08-11 11:28:27','amet','assumenda'),(13,'m','2016-11-05','1991-07-16 17:50:31','repellat','dolor'),(15,'m','1985-11-21','2007-07-08 13:32:37','voluptas','quia'),(16,'f','2010-11-07','1971-11-20 02:51:09','nostrum','nulla'),(20,'m','1986-02-03','1971-11-21 13:09:31','repudiandae','eius');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `login` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `login` (`login`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Продавцы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'voluptates',931,NULL,'6bd10e0cc8b1066b8fb15e59399f8b1756175003',1,1,1),(2,'voluptatem',0,NULL,'6195a17a6e656bea78791f070e620591b3d98fb9',2,2,2),(3,'architecto',3037146675,NULL,'ee4ec9b3e53e203ae69e716d759b1f324f8eaca8',3,3,3);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouse`
--

DROP TABLE IF EXISTS `storehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouse` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) DEFAULT 0 COMMENT 'Остаток',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `storehouse_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Остаток товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouse`
--

LOCK TABLES `storehouse` WRITE;
/*!40000 ALTER TABLE `storehouse` DISABLE KEYS */;
INSERT INTO `storehouse` VALUES (1,1,1),(2,2,0);
/*!40000 ALTER TABLE `storehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `login` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Данные покупателя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tressa','Spencer','peter75@example.com',89423298668,'eveniet','5717c02a0544446dd8a284678ab71ad8148f3e06'),(2,'Jeromy','Mante','darlene39@example.com',89896107251,'et','67ca93451603be6fdf4ab8e4775f20cb16b2f80b'),(3,'Bryce','Windler','vnader@example.com',89624581647,'aperiam','b7c345ba38123424e42c394d0b9678a919ebcaae'),(4,'Riley','Bins','howell.abdullah@example.com',89882274759,'architecto','23691b2abade1e07af729b00b29fd91386a88316'),(5,'Garth','Glover','walsh.alessia@example.com',89626582813,'voluptatum','fa08f0f93a3fa2c315585576422a6ceef2539b61'),(6,'Mohammed','Effertz','gibson.dean@example.org',89630749936,'minima','24da2aaa65fafb36b2b37dbe920d4b34410a63fd'),(7,'Kelley','Larson','stoltenberg.tatyana@example.org',89327906391,'officiis','1979e43d21695a9348927f72e908f2dca666d4e8'),(8,'Houston','Armstrong','clotilde03@example.net',89240575939,'omnis','58998f64da03a680827028a35c3d29bf2351428d'),(9,'Brycen','Bosco','zebert@example.com',89583270575,'modi','dbae72a269fd811da8ef693d86ffed7f14102e8b'),(10,'Camille','Kautzer','enid11@example.com',89511305840,'vitae','f8be69f26d97cb50537eb878ae32f44dd0d5f87e');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-07 13:45:10
