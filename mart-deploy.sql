-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: 43.157.204.2    Database: mart_db
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Kategori`
--

DROP TABLE IF EXISTS `Kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ikon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warna` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'primary',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Kategori_nama_key` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kategori`
--

/*!40000 ALTER TABLE `Kategori` DISABLE KEYS */;
INSERT INTO `Kategori` VALUES (1,'Makanan','bx-restaurant','warning','2026-05-26 14:22:35.929','2026-05-26 14:22:35.929'),(2,'Minuman','bx-coffee','info','2026-05-26 14:22:35.939','2026-05-26 14:22:35.939'),(3,'Snack','bx-cookie','danger','2026-05-26 14:22:35.945','2026-05-26 14:22:35.945'),(4,'Sembako','bx-package','primary','2026-05-26 14:22:35.951','2026-05-26 14:22:35.951'),(5,'Personal Care','bx-spa','success','2026-05-26 14:22:35.957','2026-05-26 14:22:35.957'),(6,'Rumah Tangga','bx-home-heart','secondary','2026-05-26 14:22:35.963','2026-05-26 14:22:35.963');
/*!40000 ALTER TABLE `Kategori` ENABLE KEYS */;

--
-- Table structure for table `Opname`
--

DROP TABLE IF EXISTS `Opname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Opname` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('DRAFT','SELESAI') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `petugasId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalItem` int NOT NULL DEFAULT '0',
  `totalDihitung` int NOT NULL DEFAULT '0',
  `totalSelisih` int NOT NULL DEFAULT '0',
  `appliedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Opname_nomor_key` (`nomor`),
  KEY `Opname_status_idx` (`status`),
  KEY `Opname_petugasId_idx` (`petugasId`),
  KEY `Opname_createdAt_idx` (`createdAt`),
  CONSTRAINT `Opname_petugasId_fkey` FOREIGN KEY (`petugasId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Opname`
--

/*!40000 ALTER TABLE `Opname` DISABLE KEYS */;
INSERT INTO `Opname` VALUES ('cmrip1jbz0002edfdzx6qp9je','OPN-20260713-0001','DRAFT',NULL,'cmpmq5lrw00001347ox27yguj',38,0,0,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmt8jjlpz000qbenvvhf88dmp','OPN-20260825-0001','DRAFT',NULL,'cmpmq5lrw00001347ox27yguj',45,0,0,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583');
/*!40000 ALTER TABLE `Opname` ENABLE KEYS */;

--
-- Table structure for table `OpnameItem`
--

DROP TABLE IF EXISTS `OpnameItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OpnameItem` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opnameId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produkId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaProduk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pcs',
  `stokSistem` int NOT NULL,
  `stokFisik` int DEFAULT NULL,
  `selisih` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `OpnameItem_opnameId_produkId_key` (`opnameId`,`produkId`),
  KEY `OpnameItem_opnameId_idx` (`opnameId`),
  KEY `OpnameItem_produkId_idx` (`produkId`),
  CONSTRAINT `OpnameItem_opnameId_fkey` FOREIGN KEY (`opnameId`) REFERENCES `Opname` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OpnameItem_produkId_fkey` FOREIGN KEY (`produkId`) REFERENCES `Produk` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpnameItem`
--

/*!40000 ALTER TABLE `OpnameItem` DISABLE KEYS */;
INSERT INTO `OpnameItem` VALUES ('cmrip1jbz0004edfdwzaepcp2','cmrip1jbz0002edfdzx6qp9je','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml','MNM-001','pcs',3,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0005edfdeecp28fs','cmrip1jbz0002edfdzx6qp9je','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml','RMT-003','pcs',5,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0006edfdw8xfx1cj','cmrip1jbz0002edfdzx6qp9je','cmpmq5lxl001313471nml5g91','Beng Beng Maxx','SNK-005','pcs',88,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0007edfdy7lszfcp','cmrip1jbz0002edfdzx6qp9je','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg','SMB-001','pcs',19,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0008edfdmw6y48hz','cmrip1jbz0002edfdzx6qp9je','cmpmq5lx9000z1347ka70m9vq','Chiki Balls Keju','SNK-003','pcs',58,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0009edfdgzlslf0r','cmrip1jbz0002edfdzx6qp9je','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g','SNK-001','pcs',39,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000aedfd2p7cn7wi','cmrip1jbz0002edfdzx6qp9je','cmpmq5lw2000n1347krikhpxv','Coca Cola 390ml','MNM-005','pcs',48,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000bedfdvureu6d7','cmrip1jbz0002edfdzx6qp9je','cmpmq5lyi001d13472m1im8zr','Garam Refina 250g','SMB-004','pcs',58,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000cedfdasu82re3','cmrip1jbz0002edfdzx6qp9je','cmpmq5lyb001b1347einp5gyi','Gula Pasir Gulaku 1kg','SMB-003','pcs',29,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000dedfda91lic1i','cmrip1jbz0002edfdzx6qp9je','cmpmq5ltw00031347eqae2ccy','Indomie Goreng','MKN-001','pcs',120,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000eedfd0l9097e8','cmrip1jbz0002edfdzx6qp9je','cmpmq5lu400051347eu14cjp2','Indomie Soto','MKN-002','pcs',80,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000fedfd3my4lofm','cmrip1jbz0002edfdzx6qp9je','cmpmq5lwq000t1347a1ft4xxd','Kopi Kapal Api Sachet','MNM-008','pcs',200,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000gedfdnxgsqo6d','cmrip1jbz0002edfdzx6qp9je','cmrg5pt0d0007bmv2rgw0se54','le minerale','111000000','pcs',99,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000hedfdpntakpxt','cmrip1jbz0002edfdzx6qp9je','cmpmq5lvf000h13473lnwp6bz','Le Minerale 600ml','MNM-002','pcs',100,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000iedfdb9y6cr7a','cmrip1jbz0002edfdzx6qp9je','cmpmq5ly6001913472t4dgzv2','Minyak Goreng Bimoli 1L','SMB-002','pcs',40,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000jedfdg0bswfu0','cmrip1jbz0002edfdzx6qp9je','cmqzqxslw0001ln869shil2g6','morris parfume','111','pcs',10,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000kedfdkup3ghv6','cmrip1jbz0002edfdzx6qp9je','cmpmq5lxg001113472vyofdt2','Oreo Original 137g','SNK-004','pcs',35,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000ledfd1seel8pm','cmrip1jbz0002edfdzx6qp9je','cmpmq5lze001n1347fad3bn61','Pantene Anti Dandruff 70ml','PCR-004','pcs',20,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000medfdboo2ez5f','cmrip1jbz0002edfdzx6qp9je','cmpmq5lz1001j1347ldzb51v4','Pepsodent Pencegah Gigi Berlubang 190g','PCR-002','pcs',30,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000nedfdxvglf432','cmrip1jbz0002edfdzx6qp9je','cmpmq5lwg000r1347txquqqd3','Pocari Sweat 350ml','MNM-007','pcs',35,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000oedfd89348qc4','cmrip1jbz0002edfdzx6qp9je','cmpmq5lub000713474ybu4k9x','Pop Mie Ayam Bawang','MKN-003','pcs',45,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000pedfd6g9bfdst','cmrip1jbz0002edfdzx6qp9je','cmq7lvcnk0001tf3r5o6cba35','Produk QA Test','QA-001','pcs',8,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000qedfdgjm7ijo8','cmrip1jbz0002edfdzx6qp9je','cmq9235i90001oqdynid0oww9','QA Test Produk 2026-06-11T05-27-29-110Z','QA-1781155652380','1',0,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000redfddm65dff5','cmrip1jbz0002edfdzx6qp9je','cmqcszxsk0001b5lpendz1qgy','QA Test Produk 2026-06-13T20-24-03-238Z','QA-1781382250309','1',0,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000sedfd0jfb16mi','cmrip1jbz0002edfdzx6qp9je','cmpmq5lzr001r13476letnycr','Rinso Anti Noda 770g','RMT-002','pcs',25,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000tedfdoz6udpr0','cmrip1jbz0002edfdzx6qp9je','cmpmq5lun000b1347e4qys0q5','Roti Sari Roti Coklat','MKN-005','pcs',25,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000uedfd9vv9pgz4','cmrip1jbz0002edfdzx6qp9je','cmpmq5lut000d13473giasz3l','Roti Sari Roti Keju','MKN-006','pcs',20,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000vedfdd4n4vt4s','cmrip1jbz0002edfdzx6qp9je','cmpmq5lyv001h13471xg7c8mq','Sabun Lifebuoy Total 10 85g','PCR-001','pcs',70,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000wedfdd22ebcj4','cmrip1jbz0002edfdzx6qp9je','cmpmq5luh00091347nf3uaj9r','Sarimi Ayam Bawang','MKN-004','pcs',90,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000xedfd8o6eu0it','cmrip1jbz0002edfdzx6qp9je','cmpmq5lz8001l1347ki5dktwh','Shampoo Sunsilk Soft & Smooth 170ml','PCR-003','pcs',25,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000yedfd55m1g5o8','cmrip1jbz0002edfdzx6qp9je','cmpmq5lxu0015134705ntet3d','Silver Queen Cashew 65g','SNK-006','pcs',7,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz000zedfdscuvipm0','cmrip1jbz0002edfdzx6qp9je','cmpmq5lzl001p1347po2uhri4','Sunlight Lemon 800ml','RMT-001','pcs',30,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0010edfdpt8lj5nm','cmrip1jbz0002edfdzx6qp9je','cmpmq5lwa000p13471vejf9ml','Susu Ultra Milk Coklat 250ml','MNM-006','pcs',40,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0011edfd31obn2zb','cmrip1jbz0002edfdzx6qp9je','cmq9g5ugf000114h1ib3efzaq','Tango','Tng','box',10,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0012edfdr7fjnd5k','cmrip1jbz0002edfdzx6qp9je','cmpmq5lx3000x1347lz13sy6g','Taro Net Rumput Laut','SNK-002','pcs',80,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0013edfdv5lbn4od','cmrip1jbz0002edfdzx6qp9je','cmpmq5lvv000l13476wpckp75','Teh Botol Sosro 350ml','MNM-004','pcs',60,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0014edfddle6pvtp','cmrip1jbz0002edfdzx6qp9je','cmpmq5lvn000j1347i9gyd1as','Teh Pucuk Harum 350ml','MNM-003','pcs',75,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmrip1jbz0015edfdw2jweqyg','cmrip1jbz0002edfdzx6qp9je','cmpmq5lyp001f13479vde2f9r','Telur Ayam 1kg','SMB-005','pcs',15,NULL,NULL,'2026-07-13 03:59:46.463','2026-07-13 03:59:46.463'),('cmt8jjlpz000sbenv04b8mzeu','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml','MNM-001','pcs',23,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz000tbenvwm8zjkq0','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml','RMT-003','pcs',5,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz000ubenvwfue85li','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lxl001313471nml5g91','Beng Beng Maxx','SNK-005','pcs',86,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz000vbenvjivgcun3','cmt8jjlpz000qbenvvhf88dmp','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg','SMB-001','pcs',16,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz000wbenvzzzmb6sd','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lx9000z1347ka70m9vq','Chiki Balls Keju','SNK-003','pcs',58,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz000xbenv0xar8e4g','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g','SNK-001','pcs',39,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz000ybenvsvqyzmxk','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lw2000n1347krikhpxv','Coca Cola 390ml','MNM-005','pcs',47,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz000zbenvg9ow4gr9','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lyi001d13472m1im8zr','Garam Refina 250g','SMB-004','pcs',56,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0010benvys9tsgb8','cmt8jjlpz000qbenvvhf88dmp','cmt8hrj6u0006aer8bxuw7pe5','gentle gen','123123123','pcs',95,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0011benv4xakxha6','cmt8jjlpz000qbenvvhf88dmp','cmt8ir58n0001benvdvnflsnv','gula','0001','kg',46,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0012benv1v7n2ows','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lyb001b1347einp5gyi','Gula Pasir Gulaku 1kg','SMB-003','pcs',29,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0013benv885x124p','cmt8jjlpz000qbenvvhf88dmp','cmpmq5ltw00031347eqae2ccy','Indomie Goreng','MKN-001','pcs',120,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0014benvnglrhjc3','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lu400051347eu14cjp2','Indomie Soto','MKN-002','pcs',80,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0015benv5yzfr097','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lwq000t1347a1ft4xxd','Kopi Kapal Api Sachet','MNM-008','pcs',200,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0016benv9p95zmy2','cmt8jjlpz000qbenvvhf88dmp','cmrg5pt0d0007bmv2rgw0se54','le minerale','111000000','pcs',99,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0017benv43w8pcik','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lvf000h13473lnwp6bz','Le Minerale 600ml','MNM-002','pcs',100,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0018benvkepvwbji','cmt8jjlpz000qbenvvhf88dmp','cmpmq5ly6001913472t4dgzv2','Minyak Goreng Bimoli 1L','SMB-002','pcs',40,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz0019benvbio567cr','cmt8jjlpz000qbenvvhf88dmp','cmqzqxslw0001ln869shil2g6','morris parfume','111','pcs',10,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001abenviwq20aam','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lxg001113472vyofdt2','Oreo Original 137g','SNK-004','pcs',35,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001bbenv6ne95ua0','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lze001n1347fad3bn61','Pantene Anti Dandruff 70ml','PCR-004','pcs',20,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001cbenvrazxki8u','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lz1001j1347ldzb51v4','Pepsodent Pencegah Gigi Berlubang 190g','PCR-002','pcs',30,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001dbenv2czfucgu','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lwg000r1347txquqqd3','Pocari Sweat 350ml','MNM-007','pcs',35,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001ebenvrwg39cic','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lub000713474ybu4k9x','Pop Mie Ayam Bawang','MKN-003','pcs',45,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001fbenvxodu68kh','cmt8jjlpz000qbenvvhf88dmp','cmq7lvcnk0001tf3r5o6cba35','Produk QA Test','QA-001','pcs',8,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001gbenv6ucss9ru','cmt8jjlpz000qbenvvhf88dmp','cmq9235i90001oqdynid0oww9','QA Test Produk 2026-06-11T05-27-29-110Z','QA-1781155652380','1',0,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001hbenvig20k0kk','cmt8jjlpz000qbenvvhf88dmp','cmqcszxsk0001b5lpendz1qgy','QA Test Produk 2026-06-13T20-24-03-238Z','QA-1781382250309','1',0,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001ibenv75vqr7kp','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lzr001r13476letnycr','Rinso Anti Noda 770g','RMT-002','pcs',25,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001jbenvtx3lqdta','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lun000b1347e4qys0q5','Roti Sari Roti Coklat','MKN-005','pcs',25,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001kbenvw1p0ke2q','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lut000d13473giasz3l','Roti Sari Roti Keju','MKN-006','pcs',20,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001lbenvoqporiyh','cmt8jjlpz000qbenvvhf88dmp','cmt8jgodq001089oqvteci4lh','round container 200ml','0111','pack',16,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001mbenvyb4ic0hn','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lyv001h13471xg7c8mq','Sabun Lifebuoy Total 10 85g','PCR-001','pcs',70,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001nbenv6m4ux7mf','cmt8jjlpz000qbenvvhf88dmp','cmpmq5luh00091347nf3uaj9r','Sarimi Ayam Bawang','MKN-004','pcs',90,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlpz001obenvxcp5yjrm','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lz8001l1347ki5dktwh','Shampoo Sunsilk Soft & Smooth 170ml','PCR-003','pcs',25,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001pbenvf51pqqhh','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lxu0015134705ntet3d','Silver Queen Cashew 65g','SNK-006','pcs',7,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001qbenvovbk73ez','cmt8jjlpz000qbenvvhf88dmp','cmt8ivmuq0001xse1pnyb3q45','so klin softergen','00002','pcs',11,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001rbenvwdelq4sk','cmt8jjlpz000qbenvvhf88dmp','cmt8j4lzc0003xse13odm8hlm','sunglight biocare nature','0004','pcs',2,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001sbenvpq0806s1','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lzl001p1347po2uhri4','Sunlight Lemon 800ml','RMT-001','pcs',30,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001tbenva7nvhdgj','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lwa000p13471vejf9ml','Susu Ultra Milk Coklat 250ml','MNM-006','pcs',40,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001ubenvtln9b44a','cmt8jjlpz000qbenvvhf88dmp','cmq9g5ugf000114h1ib3efzaq','Tango','Tng','box',10,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001vbenvnpu0t0n3','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lx3000x1347lz13sy6g','Taro Net Rumput Laut','SNK-002','pcs',80,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001wbenv2h9ssdh1','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lvv000l13476wpckp75','Teh Botol Sosro 350ml','MNM-004','pcs',60,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001xbenvsdq4nzjw','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lvn000j1347i9gyd1as','Teh Pucuk Harum 350ml','MNM-003','pcs',75,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001ybenvaivwu5uu','cmt8jjlpz000qbenvvhf88dmp','cmpmq5lyp001f13479vde2f9r','Telur Ayam 1kg','SMB-005','pcs',15,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq0001zbenvd3yy8lq7','cmt8jjlpz000qbenvvhf88dmp','cmt8j2qw2000ebenvwgdkb7pf','tepung seitiga biru','0003','pcs',11,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583'),('cmt8jjlq00020benv37vx70gt','cmt8jjlpz000qbenvvhf88dmp','cmt8j7a3f000ibenvdyidfefa','wipol 190g','0005','pcs',2,NULL,NULL,'2026-08-25 10:47:34.583','2026-08-25 10:47:34.583');
/*!40000 ALTER TABLE `OpnameItem` ENABLE KEYS */;

--
-- Table structure for table `Pengeluaran`
--

DROP TABLE IF EXISTS `Pengeluaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pengeluaran` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('GAJI','SEWA','LISTRIK_AIR','TRANSPORT','PERLENGKAPAN','PEMASARAN','LAINNYA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LAINNYA',
  `nominal` int NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `tanggal` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Pengeluaran_tanggal_idx` (`tanggal`),
  KEY `Pengeluaran_kategori_idx` (`kategori`),
  KEY `Pengeluaran_userId_idx` (`userId`),
  CONSTRAINT `Pengeluaran_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pengeluaran`
--

/*!40000 ALTER TABLE `Pengeluaran` DISABLE KEYS */;
INSERT INTO `Pengeluaran` VALUES ('cmqavg3sa0002s5b1omxo2dt5','GAJI',1000000,'gaji karyawan bulanan','2026-06-12 00:00:00.000','cmpmq5lrw00001347ox27yguj','2026-06-12 11:57:12.090','2026-06-12 11:57:12.090'),('cmrg6ktau0009bmv2tdzagl9v','LISTRIK_AIR',300000,NULL,'2026-07-11 00:00:00.000','cmpmq5lrw00001347ox27yguj','2026-07-11 09:47:20.776','2026-07-11 09:47:20.776');
/*!40000 ALTER TABLE `Pengeluaran` ENABLE KEYS */;

--
-- Table structure for table `Produk`
--

DROP TABLE IF EXISTS `Produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produk` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategoriId` int NOT NULL,
  `hargaBeli` int NOT NULL,
  `hargaJual` int NOT NULL,
  `stok` int NOT NULL DEFAULT '0',
  `satuan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pcs',
  `status` enum('AKTIF','NONAKTIF') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AKTIF',
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `hargaGrosir` int DEFAULT NULL,
  `minQtyGrosir` int DEFAULT '0',
  `stokMinimum` int NOT NULL DEFAULT '5',
  `hargaJualAwal` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Produk_sku_key` (`sku`),
  UNIQUE KEY `Produk_barcode_key` (`barcode`),
  KEY `Produk_kategoriId_idx` (`kategoriId`),
  KEY `Produk_status_idx` (`status`),
  KEY `Produk_nama_idx` (`nama`),
  CONSTRAINT `Produk_kategoriId_fkey` FOREIGN KEY (`kategoriId`) REFERENCES `Kategori` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produk`
--

/*!40000 ALTER TABLE `Produk` DISABLE KEYS */;
INSERT INTO `Produk` VALUES ('cmpmq5ltw00031347eqae2ccy','MKN-001','Indomie Goreng','8992388101015',1,2700,3500,120,'pcs','AKTIF',NULL,'2026-05-26 14:22:35.972','2026-05-26 14:22:35.972',NULL,0,5,NULL),('cmpmq5lu400051347eu14cjp2','MKN-002','Indomie Soto','8992388101022',1,2700,3500,80,'pcs','AKTIF',NULL,'2026-05-26 14:22:35.981','2026-05-26 14:22:35.981',NULL,0,5,NULL),('cmpmq5lub000713474ybu4k9x','MKN-003','Pop Mie Ayam Bawang','8992388123456',1,4800,6500,45,'pcs','AKTIF',NULL,'2026-05-26 14:22:35.987','2026-06-11 12:04:19.330',NULL,0,5,NULL),('cmpmq5luh00091347nf3uaj9r','MKN-004','Sarimi Ayam Bawang','8992388167890',1,2300,3000,90,'pcs','AKTIF',NULL,'2026-05-26 14:22:35.993','2026-05-26 14:22:35.993',NULL,0,5,NULL),('cmpmq5lun000b1347e4qys0q5','MKN-005','Roti Sari Roti Coklat','8993117200012',1,6500,8500,25,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.000','2026-05-26 14:22:36.000',NULL,0,5,NULL),('cmpmq5lut000d13473giasz3l','MKN-006','Roti Sari Roti Keju','8993117200029',1,6500,8500,20,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.006','2026-05-26 14:22:36.006',NULL,0,5,NULL),('cmpmq5lv7000f1347nw1l4iok','MNM-001','Aqua 600ml','8997009010102',2,1200,4092,27,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.019','2026-08-25 10:51:50.330',NULL,0,5,3720),('cmpmq5lvf000h13473lnwp6bz','MNM-002','Le Minerale 600ml','8993175201018',2,2700,3800,100,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.028','2026-05-26 14:22:36.028',NULL,0,5,NULL),('cmpmq5lvn000j1347i9gyd1as','MNM-003','Teh Pucuk Harum 350ml','8997002500115',2,3200,4500,75,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.035','2026-05-26 14:22:36.035',NULL,0,5,NULL),('cmpmq5lvv000l13476wpckp75','MNM-004','Teh Botol Sosro 350ml','8990010001016',2,3500,5000,60,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.043','2026-05-26 14:22:36.043',NULL,0,5,NULL),('cmpmq5lw2000n1347krikhpxv','MNM-005','Coca Cola 390ml','8999999019006',2,4500,6500,47,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.051','2026-08-25 09:53:34.549',NULL,0,5,NULL),('cmpmq5lwa000p13471vejf9ml','MNM-006','Susu Ultra Milk Coklat 250ml','8998009000027',2,5500,7000,40,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.059','2026-05-26 14:22:36.059',NULL,0,5,NULL),('cmpmq5lwg000r1347txquqqd3','MNM-007','Pocari Sweat 350ml','8993058000018',2,5500,7500,35,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.065','2026-05-26 14:22:36.065',NULL,0,5,NULL),('cmpmq5lwq000t1347a1ft4xxd','MNM-008','Kopi Kapal Api Sachet','8993175200004',2,1300,2000,200,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.074','2026-05-26 14:22:36.074',NULL,0,5,NULL),('cmpmq5lwv000v1347hh6z1zi2','SNK-001','Chitato Sapi Panggang 68g','089686061017',3,7500,10000,39,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.079','2026-07-11 09:32:00.518',NULL,0,5,NULL),('cmpmq5lx3000x1347lz13sy6g','SNK-002','Taro Net Rumput Laut','089686010024',3,4000,5500,80,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.087','2026-05-26 14:22:36.087',NULL,0,5,NULL),('cmpmq5lx9000z1347ka70m9vq','SNK-003','Chiki Balls Keju','089686020017',3,5500,7500,58,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.093','2026-07-11 09:32:00.414',NULL,0,5,NULL),('cmpmq5lxg001113472vyofdt2','SNK-004','Oreo Original 137g','089686030010',3,8500,11500,35,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.100','2026-05-26 14:22:36.100',NULL,0,5,NULL),('cmpmq5lxl001313471nml5g91','SNK-005','Beng Beng Maxx','089686040013',3,2200,3000,86,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.105','2026-08-25 10:15:48.644',NULL,0,5,NULL),('cmpmq5lxu0015134705ntet3d','SNK-006','Silver Queen Cashew 65g','089686050016',3,12000,16000,7,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.114','2026-07-03 08:57:38.157',NULL,0,5,NULL),('cmpmq5ly0001713475y44jpui','SMB-001','Beras Setra Ramos 5kg','8997000100015',4,65000,75000,16,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.120','2026-08-25 09:54:13.457',NULL,0,5,NULL),('cmpmq5ly6001913472t4dgzv2','SMB-002','Minyak Goreng Bimoli 1L','8997000200012',4,16500,19500,40,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.126','2026-05-26 14:22:36.126',NULL,0,5,NULL),('cmpmq5lyb001b1347einp5gyi','SMB-003','Gula Pasir Gulaku 1kg','8997000300019',4,14000,17500,29,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.131','2026-05-30 11:22:20.355',NULL,0,5,NULL),('cmpmq5lyi001d13472m1im8zr','SMB-004','Garam Refina 250g','8997000400016',4,2500,3500,56,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.137','2026-08-25 09:52:46.576',NULL,0,5,NULL),('cmpmq5lyp001f13479vde2f9r','SMB-005','Telur Ayam 1kg','8997000500013',4,26000,30000,15,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.145','2026-05-26 14:22:36.145',NULL,0,5,NULL),('cmpmq5lyv001h13471xg7c8mq','PCR-001','Sabun Lifebuoy Total 10 85g','8999999523015',5,3500,5000,70,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.151','2026-05-26 14:22:36.151',NULL,0,5,NULL),('cmpmq5lz1001j1347ldzb51v4','PCR-002','Pepsodent Pencegah Gigi Berlubang 190g','8999999524012',5,12000,16500,30,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.158','2026-05-26 14:22:36.158',NULL,0,5,NULL),('cmpmq5lz8001l1347ki5dktwh','PCR-003','Shampoo Sunsilk Soft & Smooth 170ml','8999999525019',5,18000,23500,25,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.165','2026-05-26 14:22:36.165',NULL,0,5,NULL),('cmpmq5lze001n1347fad3bn61','PCR-004','Pantene Anti Dandruff 70ml','8999999526016',5,8500,12000,20,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.170','2026-05-26 14:22:36.170',NULL,0,5,NULL),('cmpmq5lzl001p1347po2uhri4','RMT-001','Sunlight Lemon 800ml','8999999527013',6,16000,21000,30,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.177','2026-05-26 14:22:36.177',NULL,0,5,NULL),('cmpmq5lzr001r13476letnycr','RMT-002','Rinso Anti Noda 770g','8999999528010',6,19000,24500,25,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.183','2026-05-26 14:22:36.183',NULL,0,5,NULL),('cmpmq5lzx001t1347exhq56vg','RMT-003','Baygon Spray 600ml','8999999529017',6,32000,43450,6,'pcs','AKTIF',NULL,'2026-05-26 14:22:36.190','2026-08-25 10:51:50.436',NULL,0,5,39500),('cmq7lvcnk0001tf3r5o6cba35','QA-001','Produk QA Test',NULL,3,3000,5000,8,'pcs','AKTIF',NULL,'2026-06-10 05:05:48.735','2026-07-03 08:57:38.055',NULL,0,5,NULL),('cmq9235i90001oqdynid0oww9','QA-1781155652380','QA Test Produk 2026-06-11T05-27-29-110Z','QA-1781155652380',1,1000,1500,0,'1','AKTIF','Produk QA otomatis, boleh dihapus.','2026-06-11 05:27:32.768','2026-06-11 05:27:32.768',NULL,0,5,NULL),('cmq9g5ugf000114h1ib3efzaq','Tng','Tango','123',1,15000,25000,10,'box','AKTIF','Waffer','2026-06-11 12:01:33.021','2026-06-11 12:19:10.404',NULL,0,2,NULL),('cmqcszxsk0001b5lpendz1qgy','QA-1781382250309','QA Test Produk 2026-06-13T20-24-03-238Z','QA-1781382250309',1,1000,1500,0,'1','AKTIF','Produk QA otomatis, boleh dihapus.','2026-06-13 20:24:10.964','2026-06-13 20:24:10.964',NULL,0,5,NULL),('cmqzqxslw0001ln869shil2g6','111','morris parfume','8997016223689',5,30000,32000,10,'pcs','AKTIF','parfume','2026-06-29 21:45:13.735','2026-06-29 21:45:13.735',NULL,0,5,NULL),('cmrg5pt0d0007bmv2rgw0se54','111000000','le minerale','8996001600269',2,3000,3500,99,'pcs','AKTIF','-','2026-07-11 09:23:14.078','2026-07-11 09:24:12.401',3300,24,5,NULL),('cmt8hrj6u0006aer8bxuw7pe5','123123123','gentle gen','8996001401194',6,10000,12000,90,'pcs','AKTIF','asdada','2026-08-25 09:57:45.301','2026-08-27 08:49:59.776',NULL,0,5,NULL),('cmt8ir58n0001benvdvnflsnv','0001','gula',NULL,4,15770,17000,46,'kg','AKTIF',NULL,'2026-08-25 10:25:26.855','2026-08-25 10:27:14.913',NULL,0,5,NULL),('cmt8ivmuq0001xse1pnyb3q45','00002','so klin softergen','8998866803694',6,14000,15000,11,'pcs','AKTIF',NULL,'2026-08-25 10:28:56.307','2026-08-25 10:39:23.478',NULL,0,5,NULL),('cmt8j2qw2000ebenvwgdkb7pf','0003','tepung seitiga biru','8993296210005',4,10833,12000,10,'pcs','AKTIF',NULL,'2026-08-25 10:34:28.056','2026-08-27 08:49:59.827',NULL,0,5,NULL),('cmt8j4lzc0003xse13odm8hlm','0004','sunglight biocare nature','8999999614010',6,1500,1998,0,'pcs','AKTIF',NULL,'2026-08-25 10:35:55.080','2026-08-25 10:59:45.747',NULL,0,5,NULL),('cmt8j7a3f000ibenvdyidfefa','0005','wipol 190g','8999999520878',6,4800,5000,0,'pcs','AKTIF',NULL,'2026-08-25 10:37:59.644','2026-08-25 10:59:45.608',NULL,0,5,NULL),('cmt8jgodq001089oqvteci4lh','0111','round container 200ml',NULL,6,13250,15000,16,'pack','AKTIF',NULL,'2026-08-25 10:45:18.047','2026-08-25 10:45:51.987',NULL,0,5,NULL),('cmtba280v000gjzr2235kcuc7','009','harpic 200ml','8993560033040',6,12000,14000,5,'pcs','AKTIF',NULL,'2026-08-27 08:45:25.664','2026-08-27 08:51:24.492',NULL,0,5,NULL);
/*!40000 ALTER TABLE `Produk` ENABLE KEYS */;

--
-- Table structure for table `Setting`
--

DROP TABLE IF EXISTS `Setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Setting` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Setting`
--

/*!40000 ALTER TABLE `Setting` DISABLE KEYS */;
INSERT INTO `Setting` VALUES ('bestseller_days','30','2026-09-01 02:54:05.941'),('bestseller_top','10','2026-09-01 02:54:05.941'),('duitku_api_key','350102b176af123caf367d71fd4d792a','2026-07-05 02:14:33.836'),('duitku_merchant_code','DS32525','2026-07-05 02:14:33.836'),('duitku_qris_code','SP','2026-07-05 02:14:33.836'),('duitku_sandbox','1','2026-07-05 02:14:33.836'),('duitku_transfer_code','BT','2026-07-05 02:14:33.836'),('markup_percentages','[10,15,20,25]','2026-09-01 02:54:05.941'),('nota_footer','Terima kasih atas kunjungan Anda!','2026-09-01 02:54:05.941'),('promo_percentages','[10,15,20,25]','2026-09-01 02:54:05.941'),('toko_alamat','Aplikasi Kasir Minimarket','2026-09-01 02:54:05.941'),('toko_nama','HUSNA POS','2026-09-01 02:54:05.941'),('toko_telp','','2026-09-01 02:54:05.941');
/*!40000 ALTER TABLE `Setting` ENABLE KEYS */;

--
-- Table structure for table `StokMasuk`
--

DROP TABLE IF EXISTS `StokMasuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StokMasuk` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noReferensi` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemasok` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalItem` int NOT NULL DEFAULT '0',
  `userId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `supplierId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alasanTolak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvedAt` datetime(3) DEFAULT NULL,
  `approvedById` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `dibayarAt` datetime(3) DEFAULT NULL,
  `isKonsinyasi` tinyint(1) NOT NULL DEFAULT '0',
  `jatuhTempo` datetime(3) DEFAULT NULL,
  `statusBayar` enum('BELUM','LUNAS') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BELUM',
  PRIMARY KEY (`id`),
  UNIQUE KEY `StokMasuk_noReferensi_key` (`noReferensi`),
  KEY `StokMasuk_userId_idx` (`userId`),
  KEY `StokMasuk_createdAt_idx` (`createdAt`),
  KEY `StokMasuk_supplierId_idx` (`supplierId`),
  KEY `StokMasuk_status_idx` (`status`),
  KEY `StokMasuk_approvedById_fkey` (`approvedById`),
  CONSTRAINT `StokMasuk_approvedById_fkey` FOREIGN KEY (`approvedById`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `StokMasuk_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `Supplier` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `StokMasuk_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StokMasuk`
--

/*!40000 ALTER TABLE `StokMasuk` DISABLE KEYS */;
INSERT INTO `StokMasuk` VALUES ('cmps0afkb0008chhm5b3v0hxt','SM-20260530-0001',NULL,NULL,10,'cmpmq5lsh00011347zq6z96xm','2026-05-30 07:05:08.172',NULL,NULL,'2026-06-05 15:06:25.625',NULL,'APPROVED',NULL,0,NULL,'BELUM'),('cmps0b528000dchhm4yljsvgr','SM-20260530-0002','ABC',NULL,5,'cmpmq5lsh00011347zq6z96xm','2026-05-30 07:05:41.217',NULL,NULL,'2026-06-05 15:06:25.625',NULL,'APPROVED',NULL,0,NULL,'BELUM'),('cmpy1anfm00025w6dkanimv31','SM-20260603-0001',NULL,NULL,7,'cmpmq5lsh00011347zq6z96xm','2026-06-03 12:19:55.042',NULL,NULL,'2026-06-05 15:06:25.625',NULL,'APPROVED',NULL,0,NULL,'BELUM'),('cmpy1o3kk000212wyskz8swvw','SM-20260603-0002','pemasok supeeindo',NULL,1,'cmpmq5lsh00011347zq6z96xm','2026-06-03 12:30:22.485',NULL,NULL,'2026-06-05 15:06:25.625',NULL,'APPROVED',NULL,0,NULL,'BELUM'),('cmq92is8o0002zi7b2reru5z3','SM-20260611-0001','Stok masuk QA otomatis 2026-06-11T05-39-34-699Z',NULL,2,'cmpmq5lrw00001347ox27yguj','2026-06-11 05:39:42.072',NULL,NULL,NULL,NULL,'PENDING',NULL,0,NULL,'BELUM'),('cmq9gm881000414h1ggvrwaft','SM-20260611-0002','aji',NULL,3,'cmpmq5lrw00001347ox27yguj','2026-06-11 12:14:17.377',NULL,NULL,NULL,NULL,'PENDING',NULL,0,NULL,'BELUM'),('cmqctegvg00021451oifpezhx','SM-20260613-0001','Supplier QA Otomatis','Stok masuk QA otomatis 2026-06-13T20-35-20-886Z',2,'cmpmq5lrw00001347ox27yguj','2026-06-13 20:35:28.876',NULL,'masih bnyak','2026-08-25 10:52:18.558','cmpmq5lrw00001347ox27yguj','REJECTED',NULL,0,NULL,'BELUM'),('cmqpfjr5800024guneg33wcmv','SM-20260622-0001','dede bayu aji',NULL,5,'cmpmq5lrw00001347ox27yguj','2026-06-22 16:28:41.133','cmqavdvb20000s5b1rqo9fz9w',NULL,'2026-08-25 10:51:50.488','cmpmq5lrw00001347ox27yguj','APPROVED',NULL,0,NULL,'BELUM'),('cmqpfs0am0002kad2n4z6h2gv','SM-20260622-0002',NULL,NULL,4,'cmpmq5lrw00001347ox27yguj','2026-06-22 16:35:06.238',NULL,NULL,'2026-06-22 23:50:24.327','cmpmq5lrw00001347ox27yguj','APPROVED',NULL,0,NULL,'BELUM'),('cmr4p03kt0002b9t6t074d1up','SM-20260703-0001','dede bayu aji',NULL,20,'cmpmq5lrw00001347ox27yguj','2026-07-03 08:49:52.925','cmqavdvb20000s5b1rqo9fz9w',NULL,'2026-07-16 12:06:57.640','cmpmq5lrw00001347ox27yguj','APPROVED',NULL,0,NULL,'BELUM'),('cmrg63vxz000813h40d0dvtdn','SM-20260711-0001',NULL,NULL,5,'cmpmq5lsh00011347zq6z96xm','2026-07-11 09:34:11.063',NULL,NULL,'2026-07-11 09:35:19.283','cmpmq5lrw00001347ox27yguj','APPROVED',NULL,0,NULL,'BELUM'),('cmt8ju9xl0002cwzz489yivf6','SM-20260825-0001',NULL,NULL,5,'cmpmq5lsh00011347zq6z96xm','2026-08-25 10:55:52.521',NULL,NULL,NULL,NULL,'PENDING',NULL,0,NULL,'BELUM');
/*!40000 ALTER TABLE `StokMasuk` ENABLE KEYS */;

--
-- Table structure for table `StokMasukItem`
--

DROP TABLE IF EXISTS `StokMasukItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StokMasukItem` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stokMasukId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `produkId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `hargaBeli` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `StokMasukItem_stokMasukId_idx` (`stokMasukId`),
  KEY `StokMasukItem_produkId_idx` (`produkId`),
  CONSTRAINT `StokMasukItem_produkId_fkey` FOREIGN KEY (`produkId`) REFERENCES `Produk` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `StokMasukItem_stokMasukId_fkey` FOREIGN KEY (`stokMasukId`) REFERENCES `StokMasuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StokMasukItem`
--

/*!40000 ALTER TABLE `StokMasukItem` DISABLE KEYS */;
INSERT INTO `StokMasukItem` VALUES ('cmps0afkb000achhm4aif9tlc','cmps0afkb0008chhm5b3v0hxt','cmpmq5lv7000f1347nw1l4iok',10,2500),('cmps0b528000fchhmdxtsx39a','cmps0b528000dchhm4yljsvgr','cmpmq5lzx001t1347exhq56vg',5,32000),('cmpy1anfm00045w6dsr11ip6f','cmpy1anfm00025w6dkanimv31','cmpmq5lv7000f1347nw1l4iok',7,2500),('cmpy1o3kk000412wyfln3erca','cmpy1o3kk000212wyskz8swvw','cmpmq5lv7000f1347nw1l4iok',1,2500),('cmq92is8o0004zi7bcv921e95','cmq92is8o0002zi7b2reru5z3','cmpmq5lv7000f1347nw1l4iok',2,1200),('cmq9gm881000614h1p9qwt249','cmq9gm881000414h1ggvrwaft','cmq9g5ugf000114h1ib3efzaq',3,15000),('cmqctegvg0004145135zihun2','cmqctegvg00021451oifpezhx','cmpmq5lv7000f1347nw1l4iok',2,1200),('cmqpfjr5800044gunn4fbb01x','cmqpfjr5800024guneg33wcmv','cmpmq5lv7000f1347nw1l4iok',4,1200),('cmqpfjr5800054gun21hk34kh','cmqpfjr5800024guneg33wcmv','cmpmq5lzx001t1347exhq56vg',1,32000),('cmqpfs0am0004kad2nm88jfaa','cmqpfs0am0002kad2n4z6h2gv','cmpmq5lv7000f1347nw1l4iok',4,1200),('cmr4p03kt0004b9t65gzmqvri','cmr4p03kt0002b9t6t074d1up','cmpmq5lv7000f1347nw1l4iok',20,1200),('cmrg63vxz000a13h4yv9savkh','cmrg63vxz000813h40d0dvtdn','cmpmq5lzx001t1347exhq56vg',5,32000),('cmt8ju9xl0004cwzzwbq3g222','cmt8ju9xl0002cwzz489yivf6','cmt8hrj6u0006aer8bxuw7pe5',5,10000);
/*!40000 ALTER TABLE `StokMasukItem` ENABLE KEYS */;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `kontakPerson` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Supplier_isActive_idx` (`isActive`),
  KEY `Supplier_nama_idx` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES ('cmqavdvb20000s5b1rqo9fz9w','dede bayu aji',NULL,'sragen','081575839776','langganan',1,'2026-06-12 11:55:27.790','2026-06-22 23:53:51.182'),('cmrg6fk7x000b13h47pqduvp1','budfi','00',NULL,'9999',NULL,1,'2026-07-11 09:43:15.742','2026-07-11 09:43:15.742');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;

--
-- Table structure for table `Transaksi`
--

DROP TABLE IF EXISTS `Transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaksi` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTransaksi` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kasirId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int NOT NULL,
  `bayar` int NOT NULL,
  `kembalian` int NOT NULL DEFAULT '0',
  `metodeBayar` enum('TUNAI','QRIS','TRANSFER','KARTU') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TUNAI',
  `status` enum('SUKSES','DIBATALKAN') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SUKSES',
  `catatan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `bruto` int NOT NULL DEFAULT '0',
  `diskonNominal` int NOT NULL DEFAULT '0',
  `diskonPersen` int NOT NULL DEFAULT '0',
  `duitkuMerchantOrderId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duitkuReference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentUrl` text COLLATE utf8mb4_unicode_ci,
  `qrString` text COLLATE utf8mb4_unicode_ci,
  `statusBayar` enum('LUNAS','PENDING','GAGAL','KEDALUWARSA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LUNAS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Transaksi_noTransaksi_key` (`noTransaksi`),
  UNIQUE KEY `Transaksi_duitkuMerchantOrderId_key` (`duitkuMerchantOrderId`),
  KEY `Transaksi_kasirId_idx` (`kasirId`),
  KEY `Transaksi_createdAt_idx` (`createdAt`),
  KEY `Transaksi_status_idx` (`status`),
  CONSTRAINT `Transaksi_kasirId_fkey` FOREIGN KEY (`kasirId`) REFERENCES `User` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaksi`
--

/*!40000 ALTER TABLE `Transaksi` DISABLE KEYS */;
INSERT INTO `Transaksi` VALUES ('cmps0x0cy0002uqrglts4rabq','TRX-20260530-0001','cmpmq5lrw00001347ox27yguj',3500,5000,1500,'TUNAI','SUKSES',NULL,'2026-05-30 07:22:41.554',0,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmps9h0g6000263559veexqax','TRX-20260530-0002','cmpmq5lrw00001347ox27yguj',60500,200000,139500,'TUNAI','SUKSES',NULL,'2026-05-30 11:22:11.719',0,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmpy1fkfp00075w6d4q5jbyfe','TRX-20260603-0001','cmpmq5lsh00011347zq6z96xm',82100,200000,117900,'QRIS','SUKSES',NULL,'2026-06-03 12:23:44.438',0,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmq7lybkt00029d7x75fgdiko','TRX-20260610-0001','cmpmq5lrw00001347ox27yguj',5000,50000,45000,'TUNAI','SUKSES',NULL,'2026-06-10 05:08:07.325',0,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmq92ytlg0002h68mwju060pp','TRX-20260611-0001','cmpmq5lrw00001347ox27yguj',3100,50000,46900,'TUNAI','SUKSES',NULL,'2026-06-11 05:52:10.324',0,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmq9gp9jw000914h16w3563ju','TRX-20260611-0002','cmpmq5lrw00001347ox27yguj',25000,50000,25000,'TUNAI','SUKSES',NULL,'2026-06-11 12:16:39.069',0,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmq9grdwb000e14h1rso01yaw','TRX-20260611-0003','cmpmq5lrw00001347ox27yguj',25000,50000,25000,'TUNAI','SUKSES',NULL,'2026-06-11 12:18:18.012',0,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmq9gsi8y000j14h1p0fv9372','TRX-20260611-0004','cmpmq5lrw00001347ox27yguj',25000,50000,25000,'TUNAI','SUKSES',NULL,'2026-06-11 12:19:10.307',0,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmqctsne700022st2tw3uuy64','TRX-20260613-0001','cmpmq5lrw00001347ox27yguj',3100,50000,46900,'TUNAI','SUKSES',NULL,'2026-06-13 20:46:30.511',3100,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmqzsb3ni0002ubcy5ise3e80','TRX-20260629-0001','cmpmq5lsh00011347zq6z96xm',39500,39500,0,'TUNAI','SUKSES',NULL,'2026-06-29 22:23:34.207',39500,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmqzt75r90002vt7xxrifppv2','TRX-20260629-0002','cmpmq5lsh00011347zq6z96xm',39500,50000,10500,'TUNAI','SUKSES',NULL,'2026-06-29 22:48:29.926',39500,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmqztpc3e0002r1k3ldd98sc8','TRX-20260629-0003','cmpmq5lsh00011347zq6z96xm',39500,50000,10500,'TUNAI','SUKSES',NULL,'2026-06-29 23:02:37.947',39500,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmqzunaf50002698ffviml6vy','TRX-20260629-0004','cmpmq5lsh00011347zq6z96xm',3720,50000,46280,'TUNAI','SUKSES',NULL,'2026-06-29 23:29:02.082',3720,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmqzv96r80002w4ddv2xv5ulh','TRX-20260629-0005','cmpmq5lsh00011347zq6z96xm',10000,50000,40000,'TUNAI','SUKSES',NULL,'2026-06-29 23:46:03.765',10000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr0hph5d0002w4bf6wnltg3a','TRX-20260630-0001','cmpmq5lrw00001347ox27yguj',3720,3720,0,'TUNAI','SUKSES',NULL,'2026-06-30 10:14:35.282',3720,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr0hrzk100027o613d4ccxb2','TRX-20260630-0002','cmpmq5lsh00011347zq6z96xm',3720,3720,0,'TUNAI','SUKSES',NULL,'2026-06-30 10:16:32.449',3720,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr4p2rye0002ivk9qfjsv1xl','TRX-20260703-0001','cmpmq5lrw00001347ox27yguj',6750,10000,3250,'TUNAI','SUKSES',NULL,'2026-07-03 08:51:57.830',7500,750,10,NULL,NULL,NULL,NULL,'LUNAS'),('cmr4p4kyd0007ivk95dac46r8','TRX-20260703-0002','cmpmq5lsh00011347zq6z96xm',9000,9000,0,'TUNAI','SUKSES',NULL,'2026-07-03 08:53:22.069',10000,1000,10,NULL,NULL,NULL,NULL,'LUNAS'),('cmr4pa2cg0007b9t6e41jdka0','TRX-20260703-0003','cmpmq5lrw00001347ox27yguj',21000,50000,29000,'TUNAI','SUKSES',NULL,'2026-07-03 08:57:37.888',21000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr4pd136000db9t6vyori7iu','TRX-20260703-0004','cmpmq5lsh00011347zq6z96xm',117500,200000,82500,'TUNAI','SUKSES',NULL,'2026-07-03 08:59:56.227',117500,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr4pdmtv00021mg77n89w088','TRX-20260703-0005','cmpmq5lsh00011347zq6z96xm',78000,200000,122000,'TUNAI','SUKSES',NULL,'2026-07-03 09:00:24.404',78000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr4pe1ci00081mg7hjbioh6y','TRX-20260703-0006','cmpmq5lsh00011347zq6z96xm',11700,50000,38300,'TUNAI','SUKSES',NULL,'2026-07-03 09:00:43.218',13000,1300,10,NULL,NULL,NULL,NULL,'LUNAS'),('cmr70j92s0002dc5uj5adamfo','TRX-20260704-0001','cmpmq5lsh00011347zq6z96xm',271220,271220,0,'TUNAI','SUKSES',NULL,'2026-07-04 23:48:14.644',271220,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr70jh8g000adc5ua94lcz9z','TRX-20260704-0002','cmpmq5lsh00011347zq6z96xm',71100,71100,0,'TUNAI','SUKSES',NULL,'2026-07-04 23:48:25.216',79000,7900,10,NULL,NULL,NULL,NULL,'LUNAS'),('cmr70ocvd0002gk8aq7mox1ne','TRX-20260704-0003','cmpmq5lsh00011347zq6z96xm',3348,3348,0,'TUNAI','SUKSES',NULL,'2026-07-04 23:52:12.841',3720,372,10,NULL,NULL,NULL,NULL,'LUNAS'),('cmr70qnxp0002iy0bxinssjmd','TRX-20260704-0004','cmpmq5lsh00011347zq6z96xm',35550,35550,0,'TUNAI','SUKSES',NULL,'2026-07-04 23:54:00.494',39500,3950,10,NULL,NULL,NULL,NULL,'LUNAS'),('cmr71bmoh0002czc12svrzz9o','TRX-20260705-0001','cmpmq5lsh00011347zq6z96xm',9000,9000,0,'TUNAI','SUKSES',NULL,'2026-07-05 00:10:18.642',10000,1000,10,NULL,NULL,NULL,NULL,'LUNAS'),('cmr71i2af0007czc1pvbar4g8','TRX-20260705-0002','cmpmq5lsh00011347zq6z96xm',9000,9000,0,'TUNAI','SUKSES',NULL,'2026-07-05 00:15:18.808',10000,1000,10,NULL,NULL,NULL,NULL,'LUNAS'),('cmr71us4x000261htupxm3jps','TRX-20260705-0003','cmpmq5lrw00001347ox27yguj',39500,39500,0,'TUNAI','SUKSES',NULL,'2026-07-05 00:25:12.178',39500,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr72c03m0002106ow556hzj1','TRX-20260705-0004','cmpmq5lrw00001347ox27yguj',3000,3000,0,'TUNAI','SUKSES',NULL,'2026-07-05 00:38:35.651',3000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr743zno0002bkf5w7migbp0','TRX-20260705-0005','cmpmq5lrw00001347ox27yguj',10000,10000,0,'QRIS','SUKSES',NULL,'2026-07-05 01:28:21.061',10000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr759zke000213w1qk1bjrwp','TRX-20260705-0006','cmpmq5lrw00001347ox27yguj',6000,6000,0,'QRIS','SUKSES',NULL,'2026-07-05 02:01:00.495',6000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmr75ob2v0002ousco37lnkrp','TRX-20260705-0007','cmpmq5lrw00001347ox27yguj',20700,20700,0,'QRIS','SUKSES',NULL,'2026-07-05 02:12:08.599',23000,2300,10,NULL,NULL,NULL,NULL,'PENDING'),('cmr75omd10008ouscfe1221sq','TRX-20260705-0008','cmpmq5lrw00001347ox27yguj',39500,39500,0,'QRIS','SUKSES',NULL,'2026-07-05 02:12:23.221',39500,0,0,NULL,NULL,NULL,NULL,'PENDING'),('cmr75s09g0002s6xko27eqnc8','TRX-20260705-0009','cmpmq5lrw00001347ox27yguj',18000,18000,0,'TRANSFER','SUKSES',NULL,'2026-07-05 02:15:01.205',20000,2000,10,'TRX-20260705-0009','DS3252526S6OGQRDOZ5D0841','https://sandbox.duitku.com/topup/topupdirectv2.aspx?ref=BT26OEA1K4V2QFRN120',NULL,'LUNAS'),('cmr75ujq20007s6xkpy8ukmvi','TRX-20260705-0010','cmpmq5lrw00001347ox27yguj',79000,79000,0,'QRIS','SUKSES',NULL,'2026-07-05 02:16:59.739',79000,0,0,'TRX-20260705-0010','DS3252526Z4J31JY83HP2OG1','https://sandbox.duitku.com/topup/topupdirectv2.aspx?ref=SP26W3PZTES2KWFQ7LQ','00020101021226610016ID.CO.SHOPEE.WWW01189360091800202688450208202688450303UKE520479885303360540879000.005802ID5906Duitku6015KAB. BANGKA BAR61053331562220518121915752267433660630477FB','LUNAS'),('cmr762nny0002sqkveax7o9fj','TRX-20260705-0011','cmpmq5lrw00001347ox27yguj',79000,79000,0,'QRIS','SUKSES',NULL,'2026-07-05 02:23:18.095',79000,0,0,'TRX-20260705-0011','DS3252526TMNOR3H7EGKCDRY','https://sandbox.duitku.com/topup/topupdirectv2.aspx?ref=SP267H3OSBA4E35DMC1','00020101021226610016ID.CO.SHOPEE.WWW01189360091800202688450208202688450303UKE520479885303360540879000.005802ID5906Duitku6015KAB. BANGKA BAR6105333156222051815428166078113432763043C39','PENDING'),('cmr76ntiw0002n30bav6tcbwd','TRX-20260705-0012','cmpmq5lrw00001347ox27yguj',10440,10440,0,'TUNAI','SUKSES',NULL,'2026-07-05 02:39:45.464',10440,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmrg5r1w20002aymlkwcnmu50','TRX-20260711-0001','cmpmq5lsh00011347zq6z96xm',18380,50000,31620,'TUNAI','SUKSES',NULL,'2026-07-11 09:24:12.242',18380,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmrg5sxmx0008aymlzscym8pw','TRX-20260711-0002','cmpmq5lsh00011347zq6z96xm',15500,15500,0,'QRIS','SUKSES',NULL,'2026-07-11 09:25:40.042',15500,0,0,'TRX-20260711-0002','DS3252526VU2HY7VQNNLZO68','https://sandbox.duitku.com/topup/topupdirectv2.aspx?ref=SP26GC35M8EQHHBJEBM','00020101021226610016ID.CO.SHOPEE.WWW01189360091800202688450208202688450303UKE520479885303360540815500.005802ID5906Duitku6015KAB. BANGKA BAR610533315622205181026506462556941186304E357','PENDING'),('cmrg5taun000eayml9v2lpjjl','TRX-20260711-0003','cmpmq5lsh00011347zq6z96xm',75000,75000,0,'QRIS','SUKSES',NULL,'2026-07-11 09:25:57.167',75000,0,0,'TRX-20260711-0003','DS3252526FWUDKK8Q2X7MUZ6','https://sandbox.duitku.com/topup/topupdirectv2.aspx?ref=SP26QYZ8YZJMBW6QXXH','00020101021226610016ID.CO.SHOPEE.WWW01189360091800202688450208202688450303UKE520479885303360540875000.005802ID5906Duitku6015KAB. BANGKA BAR6105333156222051816843838244708819363041CDF','LUNAS'),('cmrg613000002l4ft2j4kd5d3','TRX-20260711-0004','cmpmq5lsh00011347zq6z96xm',17500,17500,0,'QRIS','SUKSES',NULL,'2026-07-11 09:32:00.241',17500,0,0,'TRX-20260711-0004','DS3252526OZLCXIWY8LJYVN2','https://sandbox.duitku.com/topup/topupdirectv2.aspx?ref=SP26WREWQTRXDRPCGLD','00020101021226610016ID.CO.SHOPEE.WWW01189360091800202688450208202688450303UKE520479885303360540817500.005802ID5906Duitku6015KAB. BANGKA BAR6105333156222051815109099315385120763042D17','LUNAS'),('cmrg634nm000213h4x1gh7qet','TRX-20260711-0005','cmpmq5lsh00011347zq6z96xm',10000,10000,0,'TUNAI','SUKSES',NULL,'2026-07-11 09:33:35.698',10000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt89ocmo0002xybpdeqk0fg9','TRX-20260825-0001','cmpmq5lrw00001347ox27yguj',78000,78000,0,'TUNAI','SUKSES',NULL,'2026-08-25 06:11:19.921',78000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8gxpcs0002n3nutuir0jzj','TRX-20260825-0002','cmpmq5lrw00001347ox27yguj',75000,75000,0,'TUNAI','SUKSES',NULL,'2026-08-25 09:34:33.628',75000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8h23g90002aer8145jk1lj','TRX-20260825-0003','cmpmq5lrw00001347ox27yguj',3500,3500,0,'TUNAI','SUKSES',NULL,'2026-08-25 09:37:58.522',3500,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8hl4jk000289oq7s97154c','TRX-20260825-0004','cmpmq5lrw00001347ox27yguj',3500,3500,0,'TUNAI','SUKSES',NULL,'2026-08-25 09:52:46.400',3500,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8hm5mk000789oqvycmo6bg','TRX-20260825-0005','cmpmq5lrw00001347ox27yguj',6500,6500,0,'TUNAI','SUKSES',NULL,'2026-08-25 09:53:34.460',6500,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8hmznb000c89oqp7mugccy','TRX-20260825-0006','cmpmq5lrw00001347ox27yguj',75000,100000,25000,'TUNAI','SUKSES',NULL,'2026-08-25 09:54:13.367',75000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8hs0zc0009aer899qlx9yp','TRX-20260825-0007','cmpmq5lrw00001347ox27yguj',12000,12000,0,'TUNAI','SUKSES',NULL,'2026-08-25 09:58:08.376',12000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8ido58000h89oqe08w7ij5','TRX-20260825-0008','cmpmq5lrw00001347ox27yguj',12000,50000,38000,'TUNAI','SUKSES',NULL,'2026-08-25 10:14:58.172',12000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8ier12000m89oqstm7vtuq','TRX-20260825-0009','cmpmq5lrw00001347ox27yguj',3000,3000,0,'TUNAI','SUKSES',NULL,'2026-08-25 10:15:48.567',3000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8ii6h7000r89oq4u8tpuin','TRX-20260825-0010','cmpmq5lrw00001347ox27yguj',12000,50000,38000,'TUNAI','SUKSES',NULL,'2026-08-25 10:18:28.555',12000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8imfhj000w89oq61q01twa','TRX-20260825-0011','cmpmq5lrw00001347ox27yguj',12000,15000,3000,'TUNAI','SUKSES',NULL,'2026-08-25 10:21:46.855',12000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8itgi70004benvcv2vtqqg','TRX-20260825-0012','cmpmq5lrw00001347ox27yguj',68000,70000,2000,'TUNAI','SUKSES',NULL,'2026-08-25 10:27:14.767',68000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8j92he0006xse1j31cwu3s','TRX-20260825-0013','cmpmq5lrw00001347ox27yguj',45998,100000,54002,'TUNAI','SUKSES',NULL,'2026-08-25 10:39:23.090',45998,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8jhefo000lbenvgo4iwsb8','TRX-20260825-0014','cmpmq5lrw00001347ox27yguj',60000,60000,0,'TUNAI','SUKSES',NULL,'2026-08-25 10:45:51.828',60000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmt8jz9o00024benvjy6z7jo2','TRX-20260825-0015','cmpmq5lsh00011347zq6z96xm',25996,27000,1004,'TUNAI','SUKSES',NULL,'2026-08-25 10:59:45.456',25996,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmtb9uqa30002jzr2ddddkxkd','TRX-20260827-0001','cmpmq5lsh00011347zq6z96xm',12000,15000,3000,'TUNAI','SUKSES',NULL,'2026-08-27 08:39:36.075',12000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmtb9wxei0007jzr22mddz29l','TRX-20260827-0002','cmpmq5lsh00011347zq6z96xm',12000,20000,8000,'TUNAI','SUKSES',NULL,'2026-08-27 08:41:18.618',12000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmtb9yo8g000cjzr24212xhrn','TRX-20260827-0003','cmpmq5lsh00011347zq6z96xm',12000,20000,8000,'TUNAI','SUKSES',NULL,'2026-08-27 08:42:40.048',12000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmtba2z77000jjzr23gn5wytq','TRX-20260827-0004','cmpmq5lrw00001347ox27yguj',14000,15000,1000,'TUNAI','SUKSES',NULL,'2026-08-27 08:46:00.884',14000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmtba83bo000ojzr27yo53zja','TRX-20260827-0005','cmpmq5lrw00001347ox27yguj',66000,100000,34000,'TUNAI','SUKSES',NULL,'2026-08-27 08:49:59.508',66000,0,0,NULL,NULL,NULL,NULL,'LUNAS'),('cmtba9wrk000vjzr24pf1n7r9','TRX-20260827-0006','cmpmq5lrw00001347ox27yguj',14000,15000,1000,'TUNAI','SUKSES',NULL,'2026-08-27 08:51:24.320',14000,0,0,NULL,NULL,NULL,NULL,'LUNAS');
/*!40000 ALTER TABLE `Transaksi` ENABLE KEYS */;

--
-- Table structure for table `TransaksiItem`
--

DROP TABLE IF EXISTS `TransaksiItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransaksiItem` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaksiId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `produkId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaProduk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `hargaSatuan` int NOT NULL,
  `subtotal` int NOT NULL,
  `hargaBeliSatuan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TransaksiItem_transaksiId_idx` (`transaksiId`),
  KEY `TransaksiItem_produkId_idx` (`produkId`),
  CONSTRAINT `TransaksiItem_produkId_fkey` FOREIGN KEY (`produkId`) REFERENCES `Produk` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `TransaksiItem_transaksiId_fkey` FOREIGN KEY (`transaksiId`) REFERENCES `Transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransaksiItem`
--

/*!40000 ALTER TABLE `TransaksiItem` DISABLE KEYS */;
INSERT INTO `TransaksiItem` VALUES ('cmps0x0cy0004uqrg05psa98z','cmps0x0cy0002uqrglts4rabq','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3500,3500,NULL),('cmps9h0g600046355wnp9pge9','cmps9h0g6000263559veexqax','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,NULL),('cmps9h0g600056355hr9nn02w','cmps9h0g6000263559veexqax','cmpmq5lyi001d13472m1im8zr','Garam Refina 250g',1,3500,3500,NULL),('cmps9h0g600066355vydd035t','cmps9h0g6000263559veexqax','cmpmq5lyb001b1347einp5gyi','Gula Pasir Gulaku 1kg',1,17500,17500,NULL),('cmpy1fkfp00095w6dc3gbb81c','cmpy1fkfp00075w6d4q5jbyfe','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3100,3100,NULL),('cmpy1fkfp000a5w6d0t59nt8l','cmpy1fkfp00075w6d4q5jbyfe','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',2,39500,79000,NULL),('cmq7lybkt00049d7xmrv22hm1','cmq7lybkt00029d7x75fgdiko','cmq7lvcnk0001tf3r5o6cba35','Produk QA Test',1,5000,5000,NULL),('cmq92ytlg0004h68m1wy48p6j','cmq92ytlg0002h68mwju060pp','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3100,3100,NULL),('cmq9gp9jw000b14h1szn9s3d9','cmq9gp9jw000914h16w3563ju','cmq9g5ugf000114h1ib3efzaq','Tango',1,25000,25000,NULL),('cmq9grdwb000g14h1jrhf6qzn','cmq9grdwb000e14h1rso01yaw','cmq9g5ugf000114h1ib3efzaq','Tango',1,25000,25000,NULL),('cmq9gsi8z000l14h1yit6nnna','cmq9gsi8y000j14h1p0fv9372','cmq9g5ugf000114h1ib3efzaq','Tango',1,25000,25000,NULL),('cmqctsne700042st2y7n3761n','cmqctsne700022st2tw3uuy64','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3100,3100,1200),('cmqzsb3ni0004ubcyd2cot1gn','cmqzsb3ni0002ubcy5ise3e80','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,32000),('cmqzt75r90004vt7xjz969ydm','cmqzt75r90002vt7xxrifppv2','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,32000),('cmqztpc3e0004r1k3w12vr3l2','cmqztpc3e0002r1k3ldd98sc8','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,32000),('cmqzunaf60004698f9qcux9s0','cmqzunaf50002698ffviml6vy','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3720,3720,1200),('cmqzv96r80004w4ddbi22hb93','cmqzv96r80002w4ddv2xv5ulh','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',1,10000,10000,7500),('cmr0hph5d0004w4bfm3gas889','cmr0hph5d0002w4bf6wnltg3a','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3720,3720,1200),('cmr0hrzk100047o61we2zz3mm','cmr0hrzk100027o613d4ccxb2','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3720,3720,1200),('cmr4p2rye0004ivk9pp085hmv','cmr4p2rye0002ivk9qfjsv1xl','cmpmq5lx9000z1347ka70m9vq','Chiki Balls Keju',1,7500,7500,5500),('cmr4p4kyd0009ivk93g8t7y18','cmr4p4kyd0007ivk95dac46r8','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',1,10000,10000,7500),('cmr4pa2cg0009b9t6vc52osdz','cmr4pa2cg0007b9t6e41jdka0','cmq7lvcnk0001tf3r5o6cba35','Produk QA Test',1,5000,5000,3000),('cmr4pa2cg000ab9t63vhtd9nw','cmr4pa2cg0007b9t6e41jdka0','cmpmq5lxu0015134705ntet3d','Silver Queen Cashew 65g',1,16000,16000,12000),('cmr4pd136000fb9t6keoqcjd7','cmr4pd136000db9t6vyori7iu','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,32000),('cmr4pd136000gb9t6ooj58kcy','cmr4pd136000db9t6vyori7iu','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmr4pd136000hb9t6gfovwhy6','cmr4pd136000db9t6vyori7iu','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg',1,75000,75000,65000),('cmr4pdmtv00041mg7czo2urlk','cmr4pdmtv00021mg77n89w088','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmr4pdmtv00051mg791a0ey8n','cmr4pdmtv00021mg77n89w088','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg',1,75000,75000,65000),('cmr4pe1ci000a1mg7nf2enn92','cmr4pe1ci00081mg7hjbioh6y','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmr4pe1ci000b1mg7tkl8tz7r','cmr4pe1ci00081mg7hjbioh6y','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',1,10000,10000,7500),('cmr70j92s0004dc5u1dladr1p','cmr70j92s0002dc5uj5adamfo','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,32000),('cmr70j92s0005dc5u83gwjvsn','cmr70j92s0002dc5uj5adamfo','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3720,3720,1200),('cmr70j92s0006dc5u0cfjd7uo','cmr70j92s0002dc5uj5adamfo','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmr70j92s0007dc5u2yf1eecq','cmr70j92s0002dc5uj5adamfo','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg',3,75000,225000,65000),('cmr70jh8g000cdc5us0n25kng','cmr70jh8g000adc5ua94lcz9z','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',2,39500,79000,32000),('cmr70ocvd0004gk8a2yqfm9v1','cmr70ocvd0002gk8aq7mox1ne','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',1,3720,3720,1200),('cmr70qnxq0004iy0b2qbh14qi','cmr70qnxp0002iy0bxinssjmd','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,32000),('cmr71bmoh0004czc13ux923jm','cmr71bmoh0002czc12svrzz9o','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',1,10000,10000,7500),('cmr71i2af0009czc1j8adii7f','cmr71i2af0007czc1pvbar4g8','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',1,10000,10000,7500),('cmr71us4x000461htlzw5koxh','cmr71us4x000261htupxm3jps','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,32000),('cmr72c03m0004106on6sarckn','cmr72c03m0002106ow556hzj1','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmr743znp0004bkf5o9v0p461','cmr743zno0002bkf5w7migbp0','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',1,10000,10000,7500),('cmr759zke000413w1x6g9mu4s','cmr759zke000213w1qk1bjrwp','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',2,3000,6000,2200),('cmr75ob2v0004ousc81p2odde','cmr75ob2v0002ousco37lnkrp','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmr75ob2v0005ousco9w1pk3i','cmr75ob2v0002ousco37lnkrp','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',2,10000,20000,7500),('cmr75omd1000aousc35siegit','cmr75omd10008ouscfe1221sq','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',1,39500,39500,32000),('cmr75s09g0004s6xktq5vz8o1','cmr75s09g0002s6xko27eqnc8','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',2,10000,20000,7500),('cmr75ujq20009s6xkdx41fp7e','cmr75ujq20007s6xkpy8ukmvi','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',2,39500,79000,32000),('cmr762nny0004sqkvpitohna5','cmr762nny0002sqkveax7o9fj','cmpmq5lzx001t1347exhq56vg','Baygon Spray 600ml',2,39500,79000,32000),('cmr76ntiw0004n30b32b9hf3m','cmr76ntiw0002n30bav6tcbwd','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',2,3720,7440,1200),('cmr76ntiw0005n30bauu7d37h','cmr76ntiw0002n30bav6tcbwd','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmrg5r1w20004aymlpwk2skpj','cmrg5r1w20002aymlkwcnmu50','cmrg5pt0d0007bmv2rgw0se54','le minerale',1,3500,3500,3000),('cmrg5r1w20005ayml4y1ipcoo','cmrg5r1w20002aymlkwcnmu50','cmpmq5lv7000f1347nw1l4iok','Aqua 600ml',4,3720,14880,1200),('cmrg5sxmx000aaymls2mnbaqa','cmrg5sxmx0008aymlzscym8pw','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',3,3000,9000,2200),('cmrg5sxmx000baymlvsv14i6u','cmrg5sxmx0008aymlzscym8pw','cmpmq5lw2000n1347krikhpxv','Coca Cola 390ml',1,6500,6500,4500),('cmrg5taun000gaymlbjt9tj67','cmrg5taun000eayml9v2lpjjl','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg',1,75000,75000,65000),('cmrg613000004l4ft8ket7m80','cmrg613000002l4ft2j4kd5d3','cmpmq5lx9000z1347ka70m9vq','Chiki Balls Keju',1,7500,7500,5500),('cmrg613000005l4fthiyznqtz','cmrg613000002l4ft2j4kd5d3','cmpmq5lwv000v1347hh6z1zi2','Chitato Sapi Panggang 68g',1,10000,10000,7500),('cmrg634nm000413h48shgt8cm','cmrg634nm000213h4x1gh7qet','cmpmq5lw2000n1347krikhpxv','Coca Cola 390ml',1,6500,6500,4500),('cmrg634nm000513h4fxguhl96','cmrg634nm000213h4x1gh7qet','cmpmq5lyi001d13472m1im8zr','Garam Refina 250g',1,3500,3500,2500),('cmt89ocmo0004xybpijko3103','cmt89ocmo0002xybpdeqk0fg9','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmt89ocmp0005xybp1bq5wpm8','cmt89ocmo0002xybpdeqk0fg9','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg',1,75000,75000,65000),('cmt8gxpcs0004n3nu9wnmrjw5','cmt8gxpcs0002n3nutuir0jzj','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg',1,75000,75000,65000),('cmt8h23g90004aer8euhoeyc3','cmt8h23g90002aer8145jk1lj','cmpmq5lyi001d13472m1im8zr','Garam Refina 250g',1,3500,3500,2500),('cmt8hl4jk000489oq8zwpjslk','cmt8hl4jk000289oq7s97154c','cmpmq5lyi001d13472m1im8zr','Garam Refina 250g',1,3500,3500,2500),('cmt8hm5mk000989oq6drqr72n','cmt8hm5mk000789oqvycmo6bg','cmpmq5lw2000n1347krikhpxv','Coca Cola 390ml',1,6500,6500,4500),('cmt8hmznb000e89oqu58nktvx','cmt8hmznb000c89oqp7mugccy','cmpmq5ly0001713475y44jpui','Beras Setra Ramos 5kg',1,75000,75000,65000),('cmt8hs0zc000baer8zu40yetf','cmt8hs0zc0009aer899qlx9yp','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmt8ido58000j89oqnbbabo6t','cmt8ido58000h89oqe08w7ij5','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmt8ier12000o89oq671mvnr7','cmt8ier12000m89oqstm7vtuq','cmpmq5lxl001313471nml5g91','Beng Beng Maxx',1,3000,3000,2200),('cmt8ii6h7000t89oq7gj14wl6','cmt8ii6h7000r89oq4u8tpuin','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmt8imfhj000y89oqpahxok2k','cmt8imfhj000w89oq61q01twa','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmt8itgi70006benvrpfyntva','cmt8itgi70004benvcv2vtqqg','cmt8ir58n0001benvdvnflsnv','gula',4,17000,68000,15770),('cmt8j92he0008xse1oobvoyep','cmt8j92he0006xse1j31cwu3s','cmt8j2qw2000ebenvwgdkb7pf','tepung seitiga biru',1,12000,12000,10833),('cmt8j92he0009xse1zzob3pxo','cmt8j92he0006xse1j31cwu3s','cmt8j4lzc0003xse13odm8hlm','sunglight biocare nature',1,1998,1998,1500),('cmt8j92he000axse19oddi1y2','cmt8j92he0006xse1j31cwu3s','cmt8j7a3f000ibenvdyidfefa','wipol 190g',1,5000,5000,4800),('cmt8j92he000bxse16xqsosk1','cmt8j92he0006xse1j31cwu3s','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmt8j92he000cxse1xls1gcr2','cmt8j92he0006xse1j31cwu3s','cmt8ivmuq0001xse1pnyb3q45','so klin softergen',1,15000,15000,14000),('cmt8jhefo000nbenv80ene29c','cmt8jhefo000lbenvgo4iwsb8','cmt8jgodq001089oqvteci4lh','round container 200ml',4,15000,60000,13250),('cmt8jz9o00026benvak1upzqh','cmt8jz9o00024benvjy6z7jo2','cmt8j7a3f000ibenvdyidfefa','wipol 190g',2,5000,10000,4800),('cmt8jz9o00027benvgnzn2dvg','cmt8jz9o00024benvjy6z7jo2','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmt8jz9o00028benvcwfndno9','cmt8jz9o00024benvjy6z7jo2','cmt8j4lzc0003xse13odm8hlm','sunglight biocare nature',2,1998,3996,1500),('cmtb9uqa30004jzr28k05hiq4','cmtb9uqa30002jzr2ddddkxkd','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmtb9wxei0009jzr2lk0mawme','cmtb9wxei0007jzr22mddz29l','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmtb9yo8g000ejzr25xq7imt7','cmtb9yo8g000cjzr24212xhrn','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmtba2z77000ljzr2sbs8yk6h','cmtba2z77000jjzr23gn5wytq','cmtba280v000gjzr2235kcuc7','harpic 200ml',1,14000,14000,12000),('cmtba83bo000qjzr2lmu6r5yz','cmtba83bo000ojzr27yo53zja','cmtba280v000gjzr2235kcuc7','harpic 200ml',3,14000,42000,12000),('cmtba83bo000rjzr2pwh65tiz','cmtba83bo000ojzr27yo53zja','cmt8hrj6u0006aer8bxuw7pe5','gentle gen',1,12000,12000,10000),('cmtba83bo000sjzr23uljczr5','cmtba83bo000ojzr27yo53zja','cmt8j2qw2000ebenvwgdkb7pf','tepung seitiga biru',1,12000,12000,10833),('cmtba9wrk000xjzr2sx516usd','cmtba9wrk000vjzr24pf1n7r9','cmtba280v000gjzr2235kcuc7','harpic 200ml',1,14000,14000,12000);
/*!40000 ALTER TABLE `TransaksiItem` ENABLE KEYS */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADMIN','KASIR') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'KASIR',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('cmpmq5lrw00001347ox27yguj','admin@mart.id','Admin Toko','$2a$10$UUk9ROpX.f28Vk7yl/5n3u8x7HcanRWy3H2gPAfSx8gt.sOgrxNqe','ADMIN','2026-05-26 14:22:35.901','2026-05-26 14:22:35.901'),('cmpmq5lsh00011347zq6z96xm','kasir@mart.id','Mas Andi','$2a$10$wxGGuMBB0vDpgMRiWB9tsOvXizenNSZ18h5nSB3/fJcZGb809w4Vq','KASIR','2026-05-26 14:22:35.921','2026-05-26 14:22:35.921'),('qahpos1781655505','qa.hermes@avatrin.test','QA Hermes Bot','$2a$10$P3gfxUTnwrFWsSYDUgLPVejYsz9.tNPuDu3w1J1..7Q0VUP3xQPsy','ADMIN','2026-06-17 07:18:25.638','2026-06-17 07:18:25.000');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;

--
-- Dumping events for database 'mart_db'
--

--
-- Dumping routines for database 'mart_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-01 10:36:06
