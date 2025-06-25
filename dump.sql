-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema_booking
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `booking_date` datetime(6) NOT NULL,
                            `status` varchar(255) DEFAULT 'PENDING',
                            `total_price` double NOT NULL,
                            `payment_info` varchar(255) DEFAULT NULL,
                            `user_id` bigint DEFAULT NULL,
                            `room_id` bigint DEFAULT NULL,
                            `time_slot_id` bigint DEFAULT NULL,
                            `decoration_style_id` bigint DEFAULT NULL,
                            `booking_date_scheduled` date NOT NULL,
                            PRIMARY KEY (`id`),
                            KEY `FK4eqsebpimnjen0q46ja6fl2hl` (`user_id`),
                            KEY `FK2vg7b2xayoq4ogt2kbsot4juq` (`room_id`),
                            KEY `FK6sb18ndb6dc6jh49u7dlp5yp3` (`time_slot_id`),
                            KEY `FKm96d7e2d7xpb7wt42eis7vgnq` (`decoration_style_id`),
                            CONSTRAINT `FK2vg7b2xayoq4ogt2kbsot4juq` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
                            CONSTRAINT `FK4eqsebpimnjen0q46ja6fl2hl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                            CONSTRAINT `FK6sb18ndb6dc6jh49u7dlp5yp3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`),
                            CONSTRAINT `FKm96d7e2d7xpb7wt42eis7vgnq` FOREIGN KEY (`decoration_style_id`) REFERENCES `decoration_styles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (42,'2025-06-25 18:54:57.688000','CONFIRMED',1220000,NULL,4,1,2,1,'2025-07-25'),(43,'2025-06-25 18:56:01.745000','PENDING',1530000,NULL,4,4,3,3,'2025-06-25'),(44,'2025-06-25 18:58:21.910000','CANCELLED_BY_USER',1250000,NULL,4,1,6,2,'2025-08-25'),(45,'2025-06-25 19:01:07.798000','CANCELLED_BY_ADMIN',1220000,NULL,5,1,6,1,'2025-06-25'),(48,'2025-06-25 19:02:08.136000','CONFIRMED',1220000,NULL,4,1,6,1,'2025-06-26'),(53,'2025-06-25 20:43:20.298000','CANCELLED_BY_USER',1200000,NULL,9,1,2,2,'9999-11-11'),(54,'2025-06-25 21:06:54.482000','CANCELLED_BY_ADMIN',1520000,NULL,9,4,1,1,'2222-11-11'),(61,'2025-06-25 21:55:11.616000','CANCELLED_BY_USER',1530000,NULL,9,4,1,3,'2222-11-11'),(62,'2025-06-25 21:57:19.384000','CANCELLED_BY_USER',1520000,NULL,9,4,1,1,'2222-11-22'),(63,'2025-06-25 21:57:53.717000','CONFIRMED',1530000,'Chuyển khoản ngân hàng',9,4,1,3,'2222-11-22'),(64,'2025-06-25 22:04:35.477000','CONFIRMED',1530000,'Chuyển khoản ngân hàng',9,4,1,3,'2222-11-11'),(65,'2025-06-25 22:33:12.801000','PENDING',1220000,'Chuyển khoản ngân hàng',9,1,1,1,'2222-11-11'),(66,'2025-06-25 22:35:41.775000','PENDING',1550000,'Quét mã QR',9,4,1,2,'3333-11-11');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoration_styles`
--

DROP TABLE IF EXISTS `decoration_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoration_styles` (
                                     `id` bigint NOT NULL AUTO_INCREMENT,
                                     `name` varchar(255) NOT NULL,
                                     `description` varchar(255) DEFAULT NULL,
                                     `price` double NOT NULL,
                                     `image_url` varchar(255) DEFAULT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoration_styles`
--

LOCK TABLES `decoration_styles` WRITE;
/*!40000 ALTER TABLE `decoration_styles` DISABLE KEYS */;
INSERT INTO `decoration_styles` VALUES (1,'Lãng mạn','Trang trí phòng với hoa hồng, nến và không gian lãng mạn',20000,'/resources/images/romantic.jpg'),(2,'Sinh nhật','Trang trí phòng với bóng bay, banner chúc mừng sinh nhật',50000,'/resources/images/birthday.jpg'),(3,'Gia đình','Trang trí phòng thoải mái cho gia đình với bắp rang và đồ uống',30000,'/resources/images/family.jpg');
/*!40000 ALTER TABLE `decoration_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_time_slots`
--

DROP TABLE IF EXISTS `room_time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_time_slots` (
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   `room_id` bigint NOT NULL,
                                   `time_slot_id` bigint NOT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `FKcvgs6o18870aaxd4bte5peh2c` (`room_id`),
                                   KEY `FKi8j2bvv4e7wekpvxxs7fd4kgj` (`time_slot_id`),
                                   CONSTRAINT `FKcvgs6o18870aaxd4bte5peh2c` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
                                   CONSTRAINT `FKi8j2bvv4e7wekpvxxs7fd4kgj` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_time_slots`
--

LOCK TABLES `room_time_slots` WRITE;
/*!40000 ALTER TABLE `room_time_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `room_name` varchar(255) NOT NULL,
                         `description` varchar(255) DEFAULT NULL,
                         `capacity` int NOT NULL,
                         `image_url` varchar(255) DEFAULT NULL,
                         `price` double NOT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Phòng VIP 1','Phòng chiếu hiện đại với màn hình lớn và hệ thống âm thanh Dolby',4,NULL,1200000),(4,'Phòng VIP 2','Phòng chiếu hiện đại với màn hình lớn và hệ thống âm thanh vòm sống động, mang lại trải nghiệm xem phim chân thực và ấn tượng.',7,'/uploads/rooms/727e63a2-9974-464b-a0bf-1b1b2da4a231.jpg',1500000);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slots` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `start_time` varchar(255) NOT NULL,
                              `end_time` varchar(255) NOT NULL,
                              `description` varchar(255) DEFAULT NULL,
                              `is_active` bit(1) NOT NULL DEFAULT b'1',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` VALUES (1,'07:00','10:00','Buổi sáng',_binary ''),(2,'13:00','15:00','Buổi trưa',_binary ''),(3,'19:00','21:00','Buổi tối',_binary ''),(5,'21:18','23:37',NULL,_binary ''),(6,'23:38','23:49',NULL,_binary '');
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `fullName` varchar(255) NOT NULL,
                         `numberPhone` varchar(255) NOT NULL,
                         `password` varchar(255) NOT NULL,
                         `role` varchar(255) NOT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `UK_to7dbigycjgyt9ktt05rsdgem` (`numberPhone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','0981793201','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','ADMIN'),(4,'User','0000000000','5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9','USER'),(5,'1','0764870875','f7176e6aca3177024524ba49a8e129b3919da0577504707549c6096ddbfb3dbd','USER'),(6,'Huỳnh Lê Công Lập','0764806087','ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb','ADMIN'),(9,'Lap','admin','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','USER');
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

-- Dump completed on 2025-06-25 22:36:30
