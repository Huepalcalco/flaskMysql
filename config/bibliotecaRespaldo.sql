-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Biblioteca
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'leche'),(2,'leche2'),(3,'queso'),(5,'fruta'),(6,'frut2a'),(7,'hhhhh'),(8,'ooooo'),(9,'jjjjj'),(10,'uuuujj'),(11,'udddj'),(12,'hola'),(13,'uasdj'),(14,'masa'),(15,'refresco'),(16,'sopa'),(17,'hola3'),(18,'yogurt'),(19,'pasta'),(20,'chocolate'),(21,'chocolate'),(22,'pasta3'),(23,'pollo'),(24,'pasta9'),(25,'pollo7');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `AUTOR_ID` varchar(7) NOT NULL,
  `NOMBRE` varchar(85) DEFAULT NULL,
  `APELLIDO_PAT` varchar(50) DEFAULT NULL,
  `LAST_UPDATE` date DEFAULT NULL,
  `PAIS_ID` smallint DEFAULT NULL,
  PRIMARY KEY (`AUTOR_ID`),
  KEY `PAIS_ID` (`PAIS_ID`),
  CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`PAIS_ID`) REFERENCES `pais` (`PAIS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES ('A800','Franz','Kafka','2024-03-18',8),('A810','JK','Rowling','2024-03-18',83),('A900','Charles','Dickens','2024-03-18',108),('A910','Mark','Twain','2024-03-18',37),('B700','Paulo','Coelho','2024-03-18',16),('B710','Fiodor','Dostoievski','2024-03-18',88),('C600','Gabriel','Garcia','2024-03-18',24),('E900','Miguel','de Cervantes','2024-03-18',36),('E901','Federico','García','2024-03-18',36),('E902','Lope','de Vega','2024-03-18',36),('E910','Leo','Tolstoi','2024-03-18',88),('I000','Dante','Alighieri','2024-03-18',55),('I200','George','Orwell','2024-03-18',48),('I700','Oscar','Wilde','2024-03-18',52),('I701','James','Joyce','2024-03-18',52),('I710','Miguel','de Cervantes','2024-03-18',36),('I711','Toni','Morrison','2024-03-18',37),('I900','John Ronald Reuel','Tolkien','2024-03-18',108),('I901','William','Shakespeare','2024-03-18',108),('I902','Jane','Austen','2024-03-18',108),('I910','Jane','Austen','2024-03-18',83),('J900','Haruki','Murakami','2024-03-18',57),('J901','Matsuo','Basho','2024-03-18',57);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoria`
--

DROP TABLE IF EXISTS `autoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autoria` (
  `AUTOR_ID` varchar(7) NOT NULL,
  `LIBRO_ID` int NOT NULL,
  PRIMARY KEY (`AUTOR_ID`,`LIBRO_ID`),
  KEY `LIBRO_ID` (`LIBRO_ID`),
  CONSTRAINT `autoria_ibfk_1` FOREIGN KEY (`AUTOR_ID`) REFERENCES `autor` (`AUTOR_ID`),
  CONSTRAINT `autoria_ibfk_2` FOREIGN KEY (`LIBRO_ID`) REFERENCES `libro` (`LIBRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoria`
--

LOCK TABLES `autoria` WRITE;
/*!40000 ALTER TABLE `autoria` DISABLE KEYS */;
INSERT INTO `autoria` VALUES ('E900',230006),('I900',230007),('I900',230008),('I900',230009),('I901',230010),('B700',230011),('A800',230012),('I200',230013),('I900',230014),('I000',230015),('I701',230016),('A900',230017),('E901',230018),('E901',230019),('C600',230020),('C600',230021),('E910',230022),('E910',230023),('E910',230024),('I910',230025),('I910',230026),('C600',230027),('C600',230028),('C600',230029),('C600',230030),('C600',230031),('J901',230032),('I901',230033);
/*!40000 ALTER TABLE `autoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CLIENTE_ID` smallint NOT NULL,
  `NOMBRE` varchar(80) DEFAULT NULL,
  `APELLIDO_PAT` varchar(40) DEFAULT NULL,
  `APELLIDO_MAT` varchar(40) DEFAULT NULL,
  `CORREO` varchar(50) DEFAULT NULL,
  `DIRECCION_ID` varchar(10) DEFAULT NULL,
  `ESCOLARIDAD_ID` smallint DEFAULT NULL,
  `CREDENCIAL_ID` smallint DEFAULT NULL,
  PRIMARY KEY (`CLIENTE_ID`),
  KEY `DIRECCION_ID` (`DIRECCION_ID`),
  KEY `ESCOLARIDAD_ID` (`ESCOLARIDAD_ID`),
  KEY `CREDENCIAL_ID` (`CREDENCIAL_ID`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`DIRECCION_ID`) REFERENCES `direccion` (`DIRECCION_ID`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`ESCOLARIDAD_ID`) REFERENCES `escolaridad` (`ESCOLARIDAD_ID`),
  CONSTRAINT `cliente_ibfk_3` FOREIGN KEY (`CREDENCIAL_ID`) REFERENCES `credencial` (`CREDENCIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1008,'pablo','mora','diaz','brunodd@gmail.com','2311003',3,10024),(1009,'antonio','mora','diaz','brunodd@gmail.com','2311003',3,10024),(10001,'Omar','Fernández','Díaz','omaferdiaz1@gmail.com','2322001',4,1001),(10002,'Nancy','Córdova','Velázquez','nancorvela2@gmail.com','2323001',4,1002),(10003,'Rene','Estrada','Flores','reestraflo@gmail.com','2324001',5,1003),(10004,'Francisco','Ríos','Hernández','franrioher24@gmail.com','2325001',4,1004),(10005,'Alejandro','Marcial','Lemus','alemusmarcial@gmail.com','2326001',5,2001),(10006,'Andrea','Zúñiga','Herrera','andyherrerazu@hotmail.com','2327001',2,1006),(10007,'Oralia','Marcial','Romero','romimarcial2@gmail.com','2328001',1,1007),(10008,'Emilio','Huerta','Velázquez','emihu123@gmail.com','2329001',3,1008),(10009,'Graciela','Huerta','Velázquez','gracisexy26@gmail.com','2330001',3,1009),(10010,'Wendy','Alarcón','Rueda','thewendygirl@gmail.com','2312001',3,1010),(10011,'Juan Carlos','González','Toledo','juanqui261@gmail.com','2318001',4,2002),(10012,'Ana Gabriela','Sánchez','Trejo','anisanchez37@gmail.com','2328001',5,2003),(10013,'Guadalupe','Gamboa','Rosas','lupisgamboa234@gmail.com','2304001',5,1013),(10014,'Carolina','González','Rivas','carolinalanina@gmail.com','2306011',5,1014),(10015,'Zayra','Octaviano','Rueda','sayritarueda@gmail.com','2330001',1,1015),(10016,'Gustavo','Buen Rostro','Diaz','gustavoelseñor66@gmail.com','2337001',4,1017),(10017,'Armando','Garcia','Muertorta','armandeitor@outlook.com','2311005',5,2017),(10018,'Cornelio','Verdugo','Calderón','corneliovc@hotmail.com','2311008',4,3001),(10019,'Zacarías','Velázquez','Cazares','zacavelaca@yahoo.com','2311009',2,3002),(10020,'Jaqueline','Prieto','Pascal','jdoblep@gmail.com','2312000',5,3003),(10021,'Oscar','Salinas','Martinez','mart12nas@gmail.com','2318010',3,2001),(10022,'Karla','Suarez','Guerrero','Guerrero33@gmail.com','2318011',5,3001),(10023,'Paola','Juarez','Martinez','Paomart01@gmail.com','2318012',4,4001),(10024,'Ignacio','Andrade','Garcia','ignandrcia@gmail.com','2315000',4,10024),(10025,'Paola','Menta','Moreno','pamamo@gmail.com','2315002',3,10025),(10026,'Bruno','Diaz','Rodriguez','brunodd@gmail.com','2311003',3,10025),(10027,'jesus','mora','diaz','brunodd@gmail.com','2311003',3,10024);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credencial`
--

DROP TABLE IF EXISTS `credencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credencial` (
  `CREDENCIAL_ID` smallint NOT NULL,
  `FECHA_RENOVACION` date DEFAULT NULL,
  PRIMARY KEY (`CREDENCIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credencial`
--

LOCK TABLES `credencial` WRITE;
/*!40000 ALTER TABLE `credencial` DISABLE KEYS */;
INSERT INTO `credencial` VALUES (1001,'2024-10-23'),(1002,'2024-10-23'),(1003,'2024-10-23'),(1004,'2024-10-23'),(1006,'2024-10-25'),(1007,'2024-10-25'),(1008,'2024-10-25'),(1009,'2024-10-25'),(1010,'2024-10-25'),(1013,'2024-10-25'),(1014,'2024-10-25'),(1015,'2024-10-25'),(1017,'2024-10-25'),(2001,'2024-10-23'),(2002,'2024-10-23'),(2003,'2024-10-23'),(2004,'2024-10-23'),(2005,'2024-10-25'),(2006,'2024-10-25'),(2007,'2024-10-25'),(2008,'2024-10-25'),(2009,'2024-10-25'),(2010,'2024-10-25'),(2011,'2024-10-25'),(2012,'2024-10-25'),(2013,'2024-10-25'),(2014,'2024-10-25'),(2015,'2024-10-25'),(2016,'2024-10-25'),(2017,'2024-10-25'),(3001,'2024-10-23'),(3002,'2024-10-23'),(3003,'2024-10-23'),(3004,'2024-10-23'),(3005,'2024-10-25'),(3006,'2024-10-25'),(3007,'2024-10-25'),(3008,'2024-10-25'),(3009,'2024-10-25'),(3010,'2024-10-25'),(3011,'2024-10-25'),(3012,'2024-10-25'),(3013,'2024-10-25'),(3014,'2024-10-25'),(3015,'2024-10-25'),(3016,'2024-10-25'),(3017,'2024-10-25'),(4001,'2024-10-23'),(4002,'2024-10-23'),(4003,'2024-10-23'),(4004,'2024-10-23'),(4005,'2024-10-25'),(4006,'2024-10-25'),(4007,'2024-10-25'),(4008,'2024-10-25'),(4009,'2024-10-25'),(4010,'2024-10-25'),(4011,'2024-10-25'),(4012,'2024-10-25'),(4013,'2024-10-25'),(4014,'2024-10-25'),(4015,'2024-10-25'),(4016,'2024-10-25'),(4017,'2024-10-25'),(5001,'2024-10-23'),(5002,'2024-10-23'),(5003,'2024-10-23'),(5004,'2024-10-23'),(5005,'2024-10-25'),(5006,'2024-10-25'),(5007,'2024-10-25'),(5008,'2024-10-25'),(5009,'2024-10-25'),(5010,'2024-10-25'),(5011,'2024-10-25'),(5012,'2024-10-25'),(5013,'2024-10-25'),(5014,'2024-10-25'),(5015,'2024-10-25'),(5016,'2024-10-25'),(5017,'2024-10-25'),(6001,'2024-10-23'),(6002,'2024-10-23'),(6003,'2024-10-23'),(6004,'2024-10-23'),(6005,'2024-10-25'),(6006,'2024-10-25'),(6007,'2024-10-25'),(6008,'2024-10-25'),(6009,'2024-10-25'),(6010,'2024-10-25'),(6011,'2024-10-25'),(6012,'2024-10-25'),(6013,'2024-10-25'),(6014,'2024-10-25'),(6015,'2024-10-25'),(6016,'2024-10-25'),(6017,'2024-10-25'),(7001,'2024-10-23'),(7002,'2024-10-23'),(7003,'2024-10-23'),(7004,'2024-10-23'),(7005,'2024-10-25'),(7006,'2024-10-25'),(7007,'2024-10-25'),(7008,'2024-10-25'),(7009,'2024-10-25'),(7010,'2024-10-25'),(7011,'2024-10-25'),(7012,'2024-10-25'),(7013,'2024-10-25'),(7014,'2024-10-25'),(7015,'2024-10-25'),(7016,'2024-10-25'),(7017,'2024-10-25'),(8001,'2024-10-23'),(8002,'2024-10-23'),(8003,'2024-10-23'),(8004,'2024-10-23'),(8005,'2024-10-25'),(8006,'2024-10-25'),(8007,'2024-10-25'),(8008,'2024-10-25'),(8009,'2024-10-25'),(8010,'2024-10-25'),(8011,'2024-10-25'),(8012,'2024-10-25'),(8013,'2024-10-25'),(8014,'2024-10-25'),(8015,'2024-10-25'),(8016,'2024-10-25'),(8017,'2024-10-25'),(9001,'2024-10-23'),(9002,'2024-10-23'),(9003,'2024-10-23'),(9004,'2024-10-23'),(9005,'2024-10-25'),(9006,'2024-10-25'),(9007,'2024-10-25'),(9008,'2024-10-25'),(9009,'2024-10-25'),(9010,'2024-10-25'),(9011,'2024-10-25'),(9012,'2024-10-25'),(9013,'2024-10-25'),(9014,'2024-10-25'),(9015,'2024-10-25'),(9016,'2024-10-25'),(9017,'2024-10-25'),(10024,'2018-06-22'),(10025,'2018-06-22');
/*!40000 ALTER TABLE `credencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_prestamo`
--

DROP TABLE IF EXISTS `detalles_prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_prestamo` (
  `LIBRO_ID` int NOT NULL,
  `PRESTAMO_ID` int NOT NULL,
  PRIMARY KEY (`LIBRO_ID`,`PRESTAMO_ID`),
  KEY `PRESTAMO_ID` (`PRESTAMO_ID`),
  CONSTRAINT `detalles_prestamo_ibfk_1` FOREIGN KEY (`LIBRO_ID`) REFERENCES `libro` (`LIBRO_ID`),
  CONSTRAINT `detalles_prestamo_ibfk_2` FOREIGN KEY (`PRESTAMO_ID`) REFERENCES `prestamo` (`PRESTAMO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_prestamo`
--

LOCK TABLES `detalles_prestamo` WRITE;
/*!40000 ALTER TABLE `detalles_prestamo` DISABLE KEYS */;
INSERT INTO `detalles_prestamo` VALUES (230013,171209),(230021,171209),(230031,180722),(230025,190202),(230030,190202),(230102,190202),(230014,210704),(230022,210704),(230024,210704),(230015,211024),(230016,211024),(230017,211024),(230022,211024),(230001,220428),(230014,220428),(230100,220502),(230027,220503),(230012,230101),(230023,230101),(230030,230101),(230032,230101),(230017,230103),(230102,230103),(230002,230202),(230029,230202),(230019,230204),(230030,230222),(230101,230222),(230007,230517),(230022,230517),(230028,230517),(230007,230609),(230008,230609),(230009,230609),(230012,230629),(230017,230629),(230021,230629),(230028,230629),(230033,230629),(230005,230706),(230001,230805),(230006,230805),(230027,230805),(230011,230910),(230020,231008),(230023,231008),(230102,231008),(230005,231023),(230022,231023),(230003,231112),(230100,231112);
/*!40000 ALTER TABLE `detalles_prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `DIRECCION_ID` varchar(10) NOT NULL,
  `ALCALDIA` varchar(50) DEFAULT NULL,
  `CP` varchar(10) DEFAULT NULL,
  `CALLE` varchar(50) DEFAULT NULL,
  `EXTERIOR` varchar(7) DEFAULT NULL,
  `INTERIOR` varchar(7) DEFAULT NULL,
  `ESTADO_ID` smallint DEFAULT NULL,
  PRIMARY KEY (`DIRECCION_ID`),
  KEY `ESTADO_ID` (`ESTADO_ID`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`ESTADO_ID`) REFERENCES `estado` (`ESTADO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES ('2301001','Iztapalapa','09830','Calzada Ermita','1','2',1101),('2302001','Coyoacan','04200','Canal de Miramontes','3','1',1101),('2303001','Gustavo A. Madero','07020','Calzada de Guadalupe','6','4',1101),('2304001','Centro','44100','Avenida Juarez','6','4',1120),('2305001','San Nicolás de los Garza','66490','Adolfo Ruiz Cortinez','2','35',1115),('2306001','Tlanepantla','54150','VILLAHERMOSA','16A','4',1119),('2306010','Puebla de zaragoza','72000','Avenidad reforma','13A','09',1113),('2306011','Tehuacan','72100','Calle 5 de mayo','13','56',1113),('2306012','San Andres cholula','72550','Calle 16 de septiembre','14','314',1113),('2306013','San Pedro Cholula','72230','Calleno 11 Norte','1Z','425B',1113),('2306014','Alixco','72410','Bolevar Atlixco','1G','56',1113),('2306015','Reforma','72510','Calle 16 de septiembre','10G','68',1113),('2307001','Veracruz','91700','GUERRERO','1650','65',1104),('2308001','Cuernavaca','62020','ACTORES','104','B',1117),('2309001','Benito Juárez','03730','CERRADA NATIER','10','90',1101),('2310001','Xalapa','91030','AMERICAS','157','S/N',1104),('2311001','Querétaro','76180','PRL ZARAGOZA','230','456',1120),('2311002','Tepoztlán','62520','Del Niño Artillero','20','321',1117),('2311003','Coatzacoalcos','96518','Bernardo Simonin','1607','098',1104),('2311004','Benito Juárez','03310','Av Universidad','1000','765',1101),('2311005','Veracruz','91750','Miguel Angel de Quevedo','5750','543',1104),('2311006','Monterrey','64820','Av Chapultepec','S/N','45G',1115),('2311008','Tehuacan','75850','Av Jose Garci-crespo','2805','45E',1113),('2311009','Puebla','72400','Privada Topacio','3505','23E',1113),('2312000','Veracruz','93240','Av 20 de Noviembre','700','756',1104),('2312001','Ciudad Juárez','32780','AV LOPEZ MATEOS','1762','S/N',1127),('2313001','Guadalajara','44100','SANTA MONICA','230','100',1120),('2314001','Mazatlán','82110','AV. PLAYA GAVIOTAS','123','501',1109),('2315000','Cuernavaca','62000','Morelos','182','4313',1117),('2315001','VERACRUZ','82110','ALTAMIRANO','456','1241',1104),('2315002','Cuernavaca','62170','San Jernonimo','207','9824',1117),('2316001','Oaxaca','68000','HUMBOLDT','300','789',1114),('2317001','Chihuahua','31160','AGUSTIN MELGAR','2303','102',1127),('2318001','Azcapotzalco','02970','SABINO','538','764',1101),('2318010','Acaponeta','00001','Calle 11','1','56',1116),('2318011','Tuxpan','00002','5','9','34',1116),('2318012','Tepic','00003','13','3','31',1116),('2319001','Caborca','83600','OBREGON','265','908',1108),('2320001','Miguel Hidalgo','11400','MAR BLANCO','89','8',1101),('2321001','Querétaro','11400','ANDADOR 5 DE MAYO','14','35',1120),('2322001','Iztapalapa','09700','Manuel Cañas','45','2',1101),('2323001','Gustavo A. Madero','07300','San Pedro Regional','123','24',1101),('2324001','Coyoacan','10340','Cristobal Colon','18','38',1101),('2325001','Angostura','66699','Zona del muerto','32','120',1109),('2326001','Iztapalapa','08100','Villa de la Barca','56','15',1101),('2327001','Xochimilco','10700','Calle Trajinera','89','22',1101),('2328001','Tlahuac','03700','Av. Tlahuac','4','156',1101),('2329001','Tlalpan','15033','Señor covarubias','67','46',1101),('2330001','Iztapalapa','09300','Ermita','91','13',1101),('2337001','Benito Juárez','06070','Benito Camelon','22','34',1101),('2338001','Centro','87532','Villa Camaron','23','687',1104),('2339001','Iztapalapa','09100','Villa Sin Fuente','2','34Q',1101),('2340001','Iztapalapa','09200','San Letran','6','43',1101),('2341001','Gustavo A. Madero','05621','Villa Canica','S/N','13',1101),('2342001','Iztapalapa','08300','San Juan','22','1344',1101),('2343001','Chalco','30300','San Jose Señor','S/N','6546',1101),('2344001','Centro','13234','San Cristo','34','7524',1127),('2345001','Morelos','32782','San Nicolas','S/N','546',1117),('2346001','Centro','02345','Cd. jardin','S/N','543',1120),('2347001','Toluca de lerdo','23456','Martin de las casas','21','245',1119),('2348001','Iztapalapa','09243','Villa Angelica','12','5242',1101),('2349001','Iztapalapa','09230','Eje 3','57','7524',1101),('2351001','Coyoacan','09200','Villa Condor','S/N','5613',1101);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `EDITORIAL_ID` varchar(4) NOT NULL,
  `EDITORIAL` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`EDITORIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES ('A001','Editorial Porrua'),('B001','Booket'),('B002','Fondo de Cultura Econ�mica'),('C001','COLOFON'),('C003','Grupo Editorial Planeta M�xico'),('C011','Cátedra'),('D001','Debolsillo'),('D004','Ediciones Era'),('E005','Siglo XXI Editores'),('E010','Sudamericana'),('F006','Alfaguara M�xico'),('G007','Grijalbo'),('H008','CONACULTA'),('I000','Independiente'),('I009','Oc�ano'),('J010','Ediciones SM'),('K011','Editorial Trillas'),('L002','Letra Minuscula'),('L012','Editorial Alfonsina'),('M013','Bonilla Artigas Editores'),('N014','Artes de M�xico'),('O015','Nostra Ediciones'),('P001','Planeta'),('P002','Penguin Books'),('P003','Punto de Lectura'),('P010','Penguin Random House'),('P011','Pehuén'),('P016','Tusquets Editores M�xico'),('Q017','Ediciones Castillo'),('R018','Editores Mexicanos Unidos'),('S002','Signet Classic'),('S019','Plaza Jan�s');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `EMPLEADO_ID` varchar(5) NOT NULL,
  `NOMBRE` varchar(90) DEFAULT NULL,
  `APELLIDO_PAT` varchar(40) DEFAULT NULL,
  `APELLIDO_MAT` varchar(40) DEFAULT NULL,
  `HORA_ENTRADA` time DEFAULT NULL,
  `HORA_SALIDA` time DEFAULT NULL,
  `GENERO` varchar(1) DEFAULT NULL,
  `RFC` varchar(15) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `CORREO` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(20) DEFAULT NULL,
  `CONTRASENA` varchar(15) DEFAULT NULL,
  `SUCURSAL_ID` smallint DEFAULT NULL,
  `DIRECCION_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EMPLEADO_ID`),
  KEY `SUCURSAL_ID` (`SUCURSAL_ID`),
  KEY `DIRECCION_ID` (`DIRECCION_ID`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`SUCURSAL_ID`) REFERENCES `sucursal` (`SUCURSAL_ID`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`DIRECCION_ID`) REFERENCES `direccion` (`DIRECCION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('16010','Rodrigo','Cabeza','de Vaca','12:00:00','17:00:00','M','CADR050501ASC','2005-05-01','rcabezd05@biblio.com.mx','rcabezd05','50zebacr',1601,'2311002'),('20010','Jason','Mormoan','Trujillo','09:15:00','15:00:00','M','MOTJ070214FJK','2007-02-14','jmormoant07@biblio.com.mx','jmormoant07','70tnaomromj',2001,'2310001'),('20011','Jazmin','Cuervo','Garcia','09:00:00','15:00:00','F','CUGJ020415TRE','2002-04-15','jcuervog02@biblio.com.mx','jcuervog02','20govreucj',2001,'2311003'),('20012','Daniel','Hernandez','Saldaña','09:15:00','15:00:00','M','HESJ060102MDF','2002-01-06','danisal07@biblio.com.mx','daniel06','Dahersa06',2315,'2306015'),('22010','Jose','Juarez','Jarburg','07:45:00','15:30:00','M','JUJJ600822CAR','1960-08-22','jjuarezj60@biblio.com.mx','jjuarezj60','06jzeraujj',2201,'2311004'),('23010','Juan','Pérez','Martínez','09:30:00','16:30:00','M','PEMJ031001FJK','2003-10-01','jperezm03@biblio.com.mx','jperezm03','30mzerepj',2306,'2318001'),('23014','Arnulfo','García','Hernández','08:30:00','17:00:00','M','AGHJ243113DMS','1999-07-27','hgarcia01@biblio.com.mx','hgarcia2','garci2612',2001,'2338001'),('23015','Raquel','Valdez','Hernández','07:30:00','16:00:00','F','HERV023114NDF','1997-01-02','hvraquel@biblio.com.mx','hraquel','contra01',2301,'2339001'),('23016','Juana','Marques','Perez','07:30:00','16:00:00','F','PMJC136814DFN','2000-12-30','perezjuana22@biblio.com.mx','jperez','chikistrukis',2301,'2339001'),('23017','Jordi','Narvarte','Avila','09:00:00','18:00:00','M','NAJK234814DFQ','2001-04-23','elborrego23@biblio.com.mx','javila','elpatron',2303,'2341001'),('23018','Juan','Terrazas','Mondragon','09:00:00','18:00:00','M','MTJS234514DFW','2000-03-14','juanterra2@biblio.com.mx','mterraza','thepablito',2301,'2342001'),('23019','Pedro','Sergio','Navarrete','07:30:00','16:00:00','M','SPNE345614DFP','1989-12-04','sergienav@biblio.com.mx','snavarrete','sergio123',2311,'2343001'),('23020','Armando','Marques','Toledano','09:30:00','18:00:00','M','TMAQ1328SCHN','2001-06-20','toledanoa2@biblio.com.mx','atoledano','armando123',2312,'2344001'),('23021','Paricia','Monterreal','Perez','07:00:00','16:00:00','F','PMPQ134824MRC','1993-11-30','perezpatri@biblio.com.mx','pperez','patripes',2313,'2345001'),('23022','Leonardo','Trejo','Arellano','09:30:00','18:00:00','M','LTAD136814DFN','2001-10-07','leotrejo@biblio.com.mx','ltrejo','leonidas2',2304,'2346001'),('23023','Kevin','Alejo','Moctezuma','07:30:00','16:00:00','M','MAKW321845DFS','2000-05-03','elkevin024@biblio.com.mx','kmoctezuma','kevin243r',2310,'2347001'),('23024','Jaqueline','Marques','Quintanar','07:00:00','16:00:00','F','JMQP362814DFN','2000-06-26','jackymarques@biblio.com.mx','jquintanar','contra2587',2302,'2348001'),('23025','Maggy','Ocampo','Torres','08:30:00','15:00:00','F','TOMQ792821DFM','1999-05-11','maggyocampo@biblio.com.mx','mocampo','omaggy23',2301,'2349001'),('23026','Martin','Hernandez','Sanchez','07:30:00','16:00:00','M','SHME234894DFN','2001-01-01','martin26xx@biblio.com.mx','mhernandez','martinino',2301,'2351001'),('23050','Milton','Lopez','Rastro','09:30:00','17:15:00','M','LORM010217MAE','2001-02-17','mlopezr01@biblio.com.mx','mlopezr01','10rzepolm',2305,'2311006');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escolaridad`
--

DROP TABLE IF EXISTS `escolaridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escolaridad` (
  `ESCOLARIDAD_ID` smallint NOT NULL,
  `NIVEL` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ESCOLARIDAD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escolaridad`
--

LOCK TABLES `escolaridad` WRITE;
/*!40000 ALTER TABLE `escolaridad` DISABLE KEYS */;
INSERT INTO `escolaridad` VALUES (1,'Preescolar'),(2,'Primaria'),(3,'Secundaria'),(4,'Medio-Superior'),(5,'Superior'),(6,'Maestria'),(7,'doctorado'),(8,'posgrado'),(9,'maternal'),(10,'Pruebas'),(11,'Pruebas2');
/*!40000 ALTER TABLE `escolaridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `ESTADO_ID` smallint NOT NULL,
  `ESTADO` varchar(50) DEFAULT NULL,
  `PAIS_ID` smallint DEFAULT NULL,
  PRIMARY KEY (`ESTADO_ID`),
  KEY `PAIS_ID` (`PAIS_ID`),
  CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`PAIS_ID`) REFERENCES `pais` (`PAIS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1101,'CIUDAD DE MÉXICO',68),(1102,'ZACATECAS',68),(1103,'YUCATÁN',68),(1104,'VERACRUZ',68),(1105,'TLAXCALA',68),(1106,'TAMAULIPAS',68),(1107,'TABASCO',68),(1108,'SONORA',68),(1109,'SINALOA',68),(1110,'SAN LUIS POTOSÍ',68),(1111,'QUINTANA ROO',68),(1112,'QUERÉTARO',68),(1113,'PUEBLA',68),(1114,'OAXACA',68),(1115,'NUEVO LEÓN',68),(1116,'NAYARIT',68),(1117,'MORELOS',68),(1118,'MICHOACÁN',68),(1119,'ESTADO DE MÉXICO',68),(1120,'JALISCO',68),(1121,'HIDALGO',68),(1122,'GUERRERO',68),(1123,'GUANAJUATO',68),(1124,'DURANGO',68),(1125,'COLIMA',68),(1126,'COAHUILA',68),(1127,'CHIHUAHUA',68),(1128,'CHIAPAS',68),(1129,'CAMPECHE',68),(1130,'BAJA CALIFORNIA SUR',68),(1131,'BAJA CALIFORNIA',68),(1132,'AGUASCALIENTES',68);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `GENERO_ID` smallint NOT NULL,
  `GENERO` varchar(25) DEFAULT NULL,
  `LAST_UPDATE` date DEFAULT NULL,
  PRIMARY KEY (`GENERO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Novela','2023-10-21'),(2,'Cuento','2023-10-21'),(3,'Relato corto','2023-10-21'),(4,'Fábula','2023-10-21'),(5,'Leyenda','2023-10-21'),(6,'Ensayo','2023-10-21'),(7,'Biografía','2023-10-21'),(8,'Autobiografía','2023-10-21'),(9,'Memorias','2023-10-21'),(10,'Crónica','2023-10-21'),(11,'Periodismo literario','2023-10-21'),(12,'Poesía lírica','2023-10-21'),(13,'Haiku','2023-10-21'),(14,'Soneto','2023-10-21'),(15,'Égloga','2023-10-21'),(16,'Poesía épica','2023-10-21'),(17,'Oda','2023-10-21'),(18,'Tragedia','2023-10-21'),(19,'Comedia','2023-10-21'),(20,'Drama','2023-10-21'),(21,'Monólogo','2023-10-21'),(22,'Teatro experimental','2023-10-21'),(23,'Novela de misterio','2023-10-21'),(24,'Novela de suspense','2023-10-21'),(25,'Novela de detectives','2023-10-21'),(26,'Thriller psicológico','2023-10-21'),(27,'Ciencia ficción','2023-10-21'),(28,'Fantasía épica','2023-10-21'),(29,'Fantasía urbana','2023-10-21'),(30,'Distopía','2023-10-21'),(31,'Cyberpunk','2023-10-21'),(32,'Romance histórico','2023-10-21'),(33,'Romance contemporáneo','2023-10-21'),(34,'Romance paranormal','2023-10-21'),(35,'Romance erótico','2023-10-21'),(36,'Novela de terror','2023-10-21'),(37,'Gótico','2023-10-21'),(38,'Horror cósmico','2023-10-21'),(39,'Zombis','2023-10-21'),(40,'Novela de aventuras','2023-10-21'),(41,'Aventuras marinas','2023-10-21'),(42,'Aventuras en la selva','2023-10-21'),(43,'Novela histórica','2023-10-21'),(45,'Libros para niños','2023-10-21'),(46,'Literatura juvenil','2023-10-21'),(47,'Cuentos de hadas','2023-10-21'),(48,'Libros de texto','2023-10-21'),(49,'Enciclopedias','2023-10-21'),(50,'Diccionarios','2023-10-21'),(51,'Manuales','2023-10-21'),(52,'Autoayuda','2023-10-21'),(53,'Desarrollo personal','2023-10-21'),(54,'Motivación','2023-10-21'),(55,'Libros de cocina','2023-10-21'),(57,'Libros de recetas','2023-10-21'),(58,'Libros de viajes','2023-10-21'),(59,'Aventuras de viajeros','2023-10-21'),(60,'Divulgacion cient.','2023-10-21'),(62,'Astronomía','2023-10-21'),(63,'Biología','2023-10-21'),(64,'Libros sagrados','2023-10-21'),(65,'Textos religiosos','2023-10-21'),(66,'Espiritualidad','2023-10-21'),(67,'Libros de negocios','2023-10-21'),(68,'Economía','2023-10-21'),(69,'Finanzas personales','2023-10-21'),(70,'Novela existencial','2024-03-18'),(71,'Satira','2024-03-18'),(72,'Epopeya','2024-03-18'),(73,'Teatro','2024-03-18'),(74,'Realismo Mágico','2024-03-18'),(75,'Novela Policial','2024-03-18');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `IDIOMA_ID` smallint NOT NULL,
  `IDIOMA` varchar(50) DEFAULT NULL,
  `LAST_UPDATE` date DEFAULT NULL,
  PRIMARY KEY (`IDIOMA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'ESPAÑOL','2023-10-21'),(2,'INGLES','2023-10-21'),(3,'ALEMAN','2023-10-21'),(4,'CHINO MANDARIN','2023-10-21'),(5,'JAPONES','2023-10-21'),(6,'FRANCES','2023-10-21'),(7,'RUSO','2023-10-21'),(8,'PORTUGUES','2023-10-21'),(9,'ARABE','2023-10-21'),(10,'HINDI','2023-10-21'),(11,'BENGALI','2023-10-21'),(12,'URDU','2023-10-21'),(13,'TURCO','2023-10-21'),(14,'ITALIANO','2023-10-21'),(15,'COREANO','2023-10-21'),(16,'TAMIL','2023-10-21'),(17,'VIETNAMITA','2023-10-21'),(18,'POLACO','2023-10-21'),(19,'PERSA','2023-10-21');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `LIBRO_ID` int NOT NULL,
  `TITULO` varchar(225) DEFAULT NULL,
  `EDICION` int DEFAULT NULL,
  `ANIO` date DEFAULT NULL,
  `NUM_PAGINAS` int DEFAULT NULL,
  `IDIOMA_ID` smallint DEFAULT NULL,
  `GENERO_ID` smallint DEFAULT NULL,
  `PAIS_ID` smallint DEFAULT NULL,
  `EDITORIAL_ID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`LIBRO_ID`),
  KEY `IDIOMA_ID` (`IDIOMA_ID`),
  KEY `GENERO_ID` (`GENERO_ID`),
  KEY `PAIS_ID` (`PAIS_ID`),
  KEY `EDITORIAL_ID` (`EDITORIAL_ID`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`IDIOMA_ID`) REFERENCES `idioma` (`IDIOMA_ID`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`GENERO_ID`) REFERENCES `genero` (`GENERO_ID`),
  CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`PAIS_ID`) REFERENCES `pais` (`PAIS_ID`),
  CONSTRAINT `libro_ibfk_4` FOREIGN KEY (`EDITORIAL_ID`) REFERENCES `editorial` (`EDITORIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (230001,'El Principito',30,'2043-04-06',96,1,45,68,'A001'),(230002,'Five Survive',1,'2022-11-29',416,1,26,68,'A001'),(230003,'Crímenes exquisitos',1,'2022-07-13',848,1,26,68,'A001'),(230005,'Holly',1,'2023-08-05',624,1,23,68,'S019'),(230006,'Don Quijote de la Mancha',1,'2016-01-01',1342,1,1,36,'P003'),(230007,'El Señor de los Anillos: La Comunidad del Anillo',1,'1977-01-01',366,1,28,36,'P001'),(230008,'El Señor de los Anillos: Las Dos Torres',1,'2014-01-01',476,1,28,68,'B001'),(230009,'El Señor de los Anillos: El Retorno del Rey',1,'2022-01-01',608,1,28,68,'B001'),(230010,'Hamlet',4,'2022-01-01',208,1,20,36,'L002'),(230011,'El Alquimista',1,'2014-01-01',192,1,1,36,'P001'),(230012,'La Metamorfosis',3,'2001-01-01',38,1,70,22,'P011'),(230013,'Animal Farn',1,'2008-01-01',112,2,71,108,'P002'),(230014,'1984',1,'1961-01-01',328,2,30,37,'S002'),(230015,'La Divina Comedia',1,'2017-01-01',232,14,72,55,'I000'),(230016,'Ulises',2,'2015-01-01',806,1,1,68,'C001'),(230017,'A Tale of Two Cities',7,'2003-01-01',489,2,43,108,'P002'),(230018,'Bodas de Sangre',18,'2000-01-01',167,1,73,36,'C011'),(230019,'La Casa de Bernarda Alba',8,'2017-01-01',152,1,20,68,'D001'),(230020,'Cien Años de Soledad',9,'2017-01-01',440,1,74,68,'P001'),(230021,'Crónica de una muerte anunciada',5,'2016-01-01',96,1,75,68,'P001'),(230022,'Guerra y paz',2,'1869-01-01',1000,2,43,88,'P010'),(230023,'Ana Karenina',2,'1877-01-01',800,2,43,88,'P010'),(230024,'La Muerte de Ivan Ilich',2,'1886-01-01',100,2,43,88,'P010'),(230025,'Orgullo y Prejuicio',2,'1813-01-01',400,2,33,83,'P010'),(230026,'Sentido y sensibilidad',2,'1869-01-01',1000,2,33,83,'P010'),(230027,'Cien años de soledad',1,'1967-01-01',500,1,1,24,'E010'),(230028,'Cronicas de una muerta anunciada',1,'1981-01-01',150,1,1,24,'E010'),(230029,'El otoño del patriarca',1,'1975-01-01',500,1,1,24,'E010'),(230030,'El amor en los tiempos del colera',1,'1985-01-01',500,1,1,24,'E010'),(230031,'La hojarasca',1,'1955-01-01',500,1,1,24,'E010'),(230032,'The Essential Haiku: Versions of Basho, Buson y Issa',1,'1994-08-01',320,1,45,68,'S002'),(230033,'Romeo y Julieta',19,'2019-01-01',123,1,20,68,'R018'),(230100,'Una vez minutos',1,'2003-06-22',240,8,24,88,'A001'),(230101,'Crimen y Castigo',1,'1866-01-04',500,7,35,16,'A001'),(230102,'Veronica decide morir',1,'1998-11-08',500,8,54,16,'A001');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `PAIS_ID` smallint NOT NULL,
  `PAIS` varchar(50) DEFAULT NULL,
  `LAST_UPDATE` date DEFAULT NULL,
  PRIMARY KEY (`PAIS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Afganistán','2023-10-21'),(2,'Alemania','2023-10-21'),(3,'Angola','2023-10-21'),(4,'Arabia Saudita','2023-10-21'),(5,'Argelia','2023-10-21'),(6,'Argentina','2023-10-21'),(7,'Australia','2023-10-21'),(8,'Austria','2023-10-21'),(9,'Bahamas','2023-10-21'),(10,'Bangladés','2023-10-21'),(11,'Bélgica','2023-10-21'),(12,'Belice','2023-10-21'),(13,'Benín','2023-10-21'),(14,'Bielorrusia','2023-10-21'),(15,'Bolivia','2023-10-21'),(16,'Brasil','2023-10-21'),(17,'Bulgaria','2023-10-21'),(18,'Cabo Verde','2023-10-21'),(19,'Camboya','2023-10-21'),(20,'Canadá','2023-10-21'),(21,'Catar','2023-10-21'),(22,'Chile','2023-10-21'),(23,'China','2023-10-21'),(24,'Colombia','2023-10-21'),(25,'Corea del Norte','2023-10-21'),(26,'Corea del Sur','2023-10-21'),(27,'Costa Rica','2023-10-21'),(28,'Croacia','2023-10-21'),(29,'Cuba','2023-10-21'),(30,'Dinamarca','2023-10-21'),(31,'Ecuador','2023-10-21'),(32,'Egipto','2023-10-21'),(33,'El Salvador','2023-10-21'),(34,'Emiratos Árabes Unidos','2023-10-21'),(35,'Eslovaquia','2023-10-21'),(36,'España','2023-10-21'),(37,'Estados Unidos','2023-10-21'),(38,'Filipinas','2023-10-21'),(39,'Finlandia','2023-10-21'),(40,'Fiyi','2023-10-21'),(41,'Francia','2023-10-21'),(42,'Georgia','2023-10-21'),(43,'Grecia','2023-10-21'),(44,'Guatemala','2023-10-21'),(45,'Guinea','2023-10-21'),(46,'Honduras','2023-10-21'),(47,'Hungría','2023-10-21'),(48,'India','2023-10-21'),(49,'Indonesia','2023-10-21'),(50,'Irak','2023-10-21'),(51,'Irán','2023-10-21'),(52,'Irlanda','2023-10-21'),(53,'Islandia','2023-10-21'),(54,'Israel','2023-10-21'),(55,'Italia','2023-10-21'),(56,'Jamaica','2023-10-21'),(57,'Japón','2023-10-21'),(58,'Jordania','2023-10-21'),(59,'Laos','2023-10-21'),(60,'Líbano','2023-10-21'),(61,'Liberia','2023-10-21'),(62,'Libia','2023-10-21'),(63,'Luxemburgo','2023-10-21'),(64,'Madagascar','2023-10-21'),(65,'Malasia','2023-10-21'),(66,'Maldivas','2023-10-21'),(67,'Marruecos','2023-10-21'),(68,'México','2023-10-21'),(69,'Mónaco','2023-10-21'),(70,'Mongolia','2023-10-21'),(71,'Nepal','2023-10-21'),(72,'Nicaragua','2023-10-21'),(73,'Nigeria','2023-10-21'),(74,'Noruega','2023-10-21'),(75,'Nueva Zelanda','2023-10-21'),(76,'Países Bajos','2023-10-21'),(77,'Pakistán','2023-10-21'),(78,'Panamá','2023-10-21'),(79,'Paraguay','2023-10-21'),(80,'Perú','2023-10-21'),(81,'Polonia','2023-10-21'),(82,'Portugal','2023-10-21'),(83,'Reino Unido','2023-10-21'),(84,'República Checa','2023-10-21'),(85,'República Dominicana','2023-10-21'),(86,'República Sudafricana','2023-10-21'),(87,'Rumanía','2023-10-21'),(88,'Rusia','2023-10-21'),(89,'Santa Lucía','2023-10-21'),(90,'Senegal','2023-10-21'),(91,'Singapur','2023-10-21'),(92,'Siria','2023-10-21'),(93,'Somalia','2023-10-21'),(94,'Suiza','2023-10-21'),(95,'Tailandia','2023-10-21'),(96,'Tanzania','2023-10-21'),(97,'Trinidad y Tobago','2023-10-21'),(98,'Turquía','2023-10-21'),(99,'Ucrania','2023-10-21'),(100,'Uganda','2023-10-21'),(101,'Uruguay','2023-10-21'),(102,'Uzbekistán','2023-10-21'),(103,'Vaticano','2023-10-21'),(104,'Venezuela','2023-10-21'),(105,'Vietnam','2023-10-21'),(106,'Zambia','2023-10-21'),(107,'Zimbabue','2023-10-21'),(108,'Inglaterra','2024-03-18');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `PRESTAMO_ID` int NOT NULL,
  `FECHA_PRESTAMO` date DEFAULT NULL,
  `FECHA_ENTREGA` date DEFAULT NULL,
  `CLIENTE_ID` smallint DEFAULT NULL,
  `EMPLEADO_ID` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`PRESTAMO_ID`),
  KEY `CLIENTE_ID` (`CLIENTE_ID`),
  KEY `EMPLEADO_ID` (`EMPLEADO_ID`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `cliente` (`CLIENTE_ID`),
  CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`EMPLEADO_ID`) REFERENCES `empleado` (`EMPLEADO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (171209,'2017-12-09','2018-01-10',10025,'16010'),(180722,'2018-07-22','2018-08-22',10024,'16010'),(190202,'2019-02-02','2019-02-12',10025,'16010'),(210704,'2021-07-04','2021-07-04',10020,'20011'),(211024,'2021-10-24','2021-11-24',10017,'20010'),(220428,'2022-04-28','2022-05-01',10001,'23010'),(220502,'2023-02-01','2023-03-01',10023,'20012'),(220503,'2023-12-19','2024-12-19',10011,'20012'),(230101,'2023-01-01','2023-05-01',10005,'23010'),(230103,'2023-01-03','2023-02-03',10002,'23023'),(230202,'2023-02-02','2023-12-18',10015,'22010'),(230204,'2023-03-04','2023-03-04',10024,'23023'),(230222,'2022-02-22','2023-03-23',10022,'23022'),(230517,'2023-05-17','2023-07-17',10017,'23050'),(230609,'2023-06-09','2024-06-09',10004,'23050'),(230629,'2023-03-29','2023-11-12',10003,'22010'),(230706,'2023-07-06','2023-08-15',10025,'23021'),(230805,'2023-08-05','2023-11-05',10018,'20012'),(230809,'2023-08-09','2023-08-29',10019,'20012'),(230910,'2023-09-10','2023-09-11',10012,'23010'),(231008,'2022-10-08','2022-12-12',10007,'22010'),(231023,'2023-10-23','2023-11-30',10017,'23014'),(231112,'2023-11-12','2023-11-15',10002,'23019'),(231113,'2024-01-01','2024-02-02',10023,'16010'),(231114,'2024-01-01','2024-02-02',10023,'16010'),(231153,'2024-01-01','2024-02-02',10023,'16010');
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `SUCURSAL_ID` smallint NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `LADA` varchar(4) DEFAULT NULL,
  `TELEFONO` int DEFAULT NULL,
  `EXTENSION` int DEFAULT NULL,
  `PAGINA_WEB` varchar(50) DEFAULT NULL,
  `HORA_APERTURA` time DEFAULT NULL,
  `HORA_CIERRE` time DEFAULT NULL,
  `CORREO` varchar(50) DEFAULT NULL,
  `DIRECCION_ID` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`SUCURSAL_ID`),
  KEY `DIRECCION_ID` (`DIRECCION_ID`),
  CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`DIRECCION_ID`) REFERENCES `direccion` (`DIRECCION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1601,'Cuernavaca','777',3173200,93,'libreriabda.mx','12:15:00','16:30:00','ibreriabdacuerna@gmail.com','2308001'),(2001,'Veracruz','229',2258846,5,'libreriabda.mx','09:30:00','14:45:00','ibreriabdaverag@gmail.com','2307001'),(2201,'Benito Juarez','55',2106061,46,'libreriabda.mx','08:00:00','15:15:00','ibreriabdabj@gmail.com','2309001'),(2301,'Iztapalapa','55',66778899,5299,'libreriabda.mx','10:00:00','18:00:00','libreriabdaizt@gmail.com','2301001'),(2302,'Coyoacan','55',44772299,5453,'libreriabda.mx','10:00:00','18:00:00','libreriabdacoyo@gmail.com','2302001'),(2303,'Gustavo A. Madero','55',22113133,5149,'libreriabda.mx','10:00:00','18:00:00','libreriabdagam@gmail.com','2303001'),(2304,'Guadalajara','33',77443322,5221,'libreriabda.mx','10:00:00','17:00:00','libreriabdaguad@gmail.com','2304001'),(2305,'Monterrey','81',99112233,5345,'libreriabda.mx','10:00:00','17:00:00','libreriabdamont@gmail.com','2305001'),(2306,'Tlanepantla','722',57093743,24,'libreriabda.mx','10:00:00','16:00:00','ibreriabdatlane@gmail.com','2306001'),(2310,'Toluca','55',12345670,5399,'libreriabda.mx','10:00:00','18:00:00','libreriabdatoluca@gmail.com','2306010'),(2311,'Chalco','55',97865430,5553,'libreriabda.mx','10:00:00','18:00:00','libreriabdachalco@gmail.com','2306011'),(2312,'Juarez','55',45678900,5549,'libreriabda.mx','10:00:00','18:00:00','libreriabdajuarez@gmail.com','2306012'),(2313,'Morelos','55',55512340,5521,'libreriabda.mx','10:00:00','17:00:00','libreriabdamorelosd@gmail.com','2306013'),(2314,'Ecatepec','55',22233330,5545,'libreriabda.mx','10:00:00','17:00:00','libreriabdaecatepect@gmail.com','2306014'),(2315,'Naucalpan','55',88877770,5275,'libreriabda.mx','10:00:00','16:00:00','ibreriabdanaucalpan@gmail.com','2306015');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 21:48:56
