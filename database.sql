CREATE DATABASE  IF NOT EXISTS `pttkhttt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pttkhttt`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: pttkhttt
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `tblchisocongto`
--

DROP TABLE IF EXISTS `tblchisocongto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblchisocongto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chiSo` int NOT NULL,
  `ngay` date NOT NULL,
  `tblCongToid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchisocongto`
--

LOCK TABLES `tblchisocongto` WRITE;
/*!40000 ALTER TABLE `tblchisocongto` DISABLE KEYS */;
INSERT INTO `tblchisocongto` VALUES (1,2300,'2023-09-24',1),(2,1990,'2023-09-24',2),(3,2410,'2023-10-24',1),(4,2002,'2023-10-24',2);
/*!40000 ALTER TABLE `tblchisocongto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblchisotieuthu`
--

DROP TABLE IF EXISTS `tblchisotieuthu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblchisotieuthu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tblTieuThuid` int NOT NULL,
  `tblChiSoCongToid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchisotieuthu`
--

LOCK TABLES `tblchisotieuthu` WRITE;
/*!40000 ALTER TABLE `tblchisotieuthu` DISABLE KEYS */;
INSERT INTO `tblchisotieuthu` VALUES (1,1,1),(2,1,3),(3,2,2),(4,2,4);
/*!40000 ALTER TABLE `tblchisotieuthu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcongto`
--

DROP TABLE IF EXISTS `tblcongto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcongto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `loai` varchar(255) NOT NULL,
  `tblPhongid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcongto`
--

LOCK TABLES `tblcongto` WRITE;
/*!40000 ALTER TABLE `tblcongto` DISABLE KEYS */;
INSERT INTO `tblcongto` VALUES (1,'1','dien',1),(2,'1','nuoc',1);
/*!40000 ALTER TABLE `tblcongto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldichvu`
--

DROP TABLE IF EXISTS `tbldichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldichvu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `moTa` varchar(255) DEFAULT NULL,
  `gia` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldichvu`
--

LOCK TABLES `tbldichvu` WRITE;
/*!40000 ALTER TABLE `tbldichvu` DISABLE KEYS */;
INSERT INTO `tbldichvu` VALUES (1,'Wifi','Dich vu wifi hang thang',100000),(2,'Thang may','Dich vu thang may hang thang',50000),(3,'Ve sinh','Dich vu don ve sinh',50000);
/*!40000 ALTER TABLE `tbldichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldichvuhoadon`
--

DROP TABLE IF EXISTS `tbldichvuhoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldichvuhoadon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soLuong` int NOT NULL,
  `gia` int NOT NULL,
  `tblDichVuid` int NOT NULL,
  `tblHoaDonid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldichvuhoadon`
--

LOCK TABLES `tbldichvuhoadon` WRITE;
/*!40000 ALTER TABLE `tbldichvuhoadon` DISABLE KEYS */;
INSERT INTO `tbldichvuhoadon` VALUES (1,1,100000,1,1),(2,1,50000,2,1);
/*!40000 ALTER TABLE `tbldichvuhoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgialuytien`
--

DROP TABLE IF EXISTS `tblgialuytien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblgialuytien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loai` varchar(255) NOT NULL,
  `mucDuoi` int NOT NULL,
  `mucTren` int DEFAULT NULL,
  `gia` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgialuytien`
--

LOCK TABLES `tblgialuytien` WRITE;
/*!40000 ALTER TABLE `tblgialuytien` DISABLE KEYS */;
INSERT INTO `tblgialuytien` VALUES (1,'dien',1,50,1806),(2,'dien',51,100,1866),(3,'dien',101,200,2167),(4,'dien',201,300,2729),(5,'dien',301,400,3050),(6,'dien',401,NULL,3151),(7,'nuoc',1,10,8500),(8,'nuoc',11,20,9900),(9,'nuoc',21,30,16000),(10,'nuoc',31,NULL,27000);
/*!40000 ALTER TABLE `tblgialuytien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhoadon`
--

DROP TABLE IF EXISTS `tblhoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhoadon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay` date NOT NULL,
  `tienPhong` int NOT NULL,
  `tienDuNo` int NOT NULL,
  `ghiChu` varchar(255) DEFAULT NULL,
  `tblPhongid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoadon`
--

LOCK TABLES `tblhoadon` WRITE;
/*!40000 ALTER TABLE `tblhoadon` DISABLE KEYS */;
INSERT INTO `tblhoadon` VALUES (1,'2023-10-24',3000000,0,'Hoa don dau tien',1);
/*!40000 ALTER TABLE `tblhoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblluytienchitiet`
--

DROP TABLE IF EXISTS `tblluytienchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblluytienchitiet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gia` int NOT NULL,
  `tblTieuThuid` int NOT NULL,
  `tblGiaLuyTienid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblluytienchitiet`
--

LOCK TABLES `tblluytienchitiet` WRITE;
/*!40000 ALTER TABLE `tblluytienchitiet` DISABLE KEYS */;
INSERT INTO `tblluytienchitiet` VALUES (1,1806,1,1),(2,1866,1,2),(3,2167,1,3),(4,8500,2,7),(5,9900,2,8);
/*!40000 ALTER TABLE `tblluytienchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblphong`
--

DROP TABLE IF EXISTS `tblphong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblphong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soPhong` int NOT NULL,
  `dienTich` float NOT NULL,
  `giaPhong` int NOT NULL,
  `trangThai` int NOT NULL,
  `moTa` varchar(255) DEFAULT NULL,
  `tienCoc` int NOT NULL,
  `duNo` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `soPhong_UNIQUE` (`soPhong`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblphong`
--

LOCK TABLES `tblphong` WRITE;
/*!40000 ALTER TABLE `tblphong` DISABLE KEYS */;
INSERT INTO `tblphong` VALUES (1,101,20,3000000,1,'Co gac xep',3000000,0),(2,102,25,3500000,1,'Co ban cong',3500000,0),(3,201,20,3200000,0,NULL,0,0);
/*!40000 ALTER TABLE `tblphong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblthanhvien`
--

DROP TABLE IF EXISTS `tblthanhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblthanhvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taiKhoan` varchar(255) NOT NULL,
  `matKhau` varchar(255) NOT NULL,
  `hoTen` varchar(255) NOT NULL,
  `ngaySinh` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `vaiTro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taiKhoan_UNIQUE` (`taiKhoan`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblthanhvien`
--

LOCK TABLES `tblthanhvien` WRITE;
/*!40000 ALTER TABLE `tblthanhvien` DISABLE KEYS */;
INSERT INTO `tblthanhvien` VALUES (1,'QuanLy','2410','Pham Trong Bien','2002-10-24','ptbien264@gmail.com','0387948017','quan ly'),(2,'bien','2410','Pham Trong Bien','2002-10-24','ptbien264@gmail.com','0387948017',NULL);
/*!40000 ALTER TABLE `tblthanhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltieuthu`
--

DROP TABLE IF EXISTS `tbltieuthu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbltieuthu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tblHoaDonid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltieuthu`
--

LOCK TABLES `tbltieuthu` WRITE;
/*!40000 ALTER TABLE `tbltieuthu` DISABLE KEYS */;
INSERT INTO `tbltieuthu` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `tbltieuthu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-18 23:37:00
