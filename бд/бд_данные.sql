-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `единицы_измерения`
--

DROP TABLE IF EXISTS `единицы_измерения`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `единицы_измерения` (
  `id_ед_изм` int NOT NULL AUTO_INCREMENT,
  `название` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ед_изм`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `единицы_измерения`
--

LOCK TABLES `единицы_измерения` WRITE;
/*!40000 ALTER TABLE `единицы_измерения` DISABLE KEYS */;
INSERT INTO `единицы_измерения` VALUES (6,'лист'),(2,'метр'),(1,'моток'),(4,'набор'),(7,'тюбик'),(3,'упак.'),(5,'шт.');
/*!40000 ALTER TABLE `единицы_измерения` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заказ_статусы`
--

DROP TABLE IF EXISTS `заказ_статусы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказ_статусы` (
  `id_статус` int NOT NULL AUTO_INCREMENT,
  `название` varchar(20) NOT NULL,
  PRIMARY KEY (`id_статус`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказ_статусы`
--

LOCK TABLES `заказ_статусы` WRITE;
/*!40000 ALTER TABLE `заказ_статусы` DISABLE KEYS */;
INSERT INTO `заказ_статусы` VALUES (2,'В пути'),(1,'Выдан'),(4,'Новый'),(5,'Отменен'),(3,'Сборка');
/*!40000 ALTER TABLE `заказ_статусы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заказ_элементы`
--

DROP TABLE IF EXISTS `заказ_элементы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказ_элементы` (
  `номер_заказа` int NOT NULL,
  `артикул` varchar(15) NOT NULL,
  `количество` int NOT NULL,
  PRIMARY KEY (`номер_заказа`,`артикул`),
  KEY `fk_Заказ_элементы_Товары1_idx` (`артикул`),
  CONSTRAINT `fk_Заказ_элементы_Заказы1` FOREIGN KEY (`номер_заказа`) REFERENCES `заказы` (`номер_заказа`),
  CONSTRAINT `fk_Заказ_элементы_Товары1` FOREIGN KEY (`артикул`) REFERENCES `товары` (`артикул`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказ_элементы`
--

LOCK TABLES `заказ_элементы` WRITE;
/*!40000 ALTER TABLE `заказ_элементы` DISABLE KEYS */;
INSERT INTO `заказ_элементы` VALUES (101,'FAB-105',5),(101,'YRN-001',3),(102,'BEAD-22',10),(102,'TOOL-05',1),(103,'GLUE-01',2),(103,'YRN-003',5),(104,'FAB-105',2),(104,'YRN-001',2),(105,'KNIT-09',1),(105,'SCIS-02',1),(106,'FAB-105',5),(106,'YRN-001',3),(107,'BEAD-22',1),(107,'TOOL-05',1),(108,'GLUE-01',2),(108,'YRN-003',5),(109,'FAB-105',2),(109,'YRN-001',2),(110,'KNIT-09',1),(110,'SCIS-02',1),(111,'NEEDLE-11',10),(111,'YRN-005',4),(112,'BRUSH-08',5),(112,'PAINT-04',2),(113,'TOOL-05',2),(113,'YRN-001',1),(114,'FAB-110',3),(114,'YRN-003',3),(115,'BEAD-22',5),(115,'GLUE-01',1),(116,'NEEDLE-11',10),(116,'YRN-005',4),(117,'BRUSH-08',5),(117,'PAINT-04',2),(118,'TOOL-05',2),(118,'YRN-001',1),(119,'FAB-110',3),(119,'YRN-003',3),(120,'BEAD-22',5),(120,'GLUE-01',1),(121,'FAB-105',10),(121,'YRN-001',5),(122,'SCIS-02',2),(122,'TOOL-05',3),(123,'KNIT-09',2),(123,'YRN-005',4),(124,'CANVAS-01',1),(124,'PAINT-04',1),(125,'NEEDLE-11',20),(125,'YRN-003',6);
/*!40000 ALTER TABLE `заказ_элементы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заказы`
--

DROP TABLE IF EXISTS `заказы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказы` (
  `номер_заказа` int NOT NULL,
  `дата_заказа` date NOT NULL,
  `дата_доставки` date DEFAULT NULL,
  `код_получения` int NOT NULL,
  `id_пункт` int NOT NULL,
  `id_пользователь` int NOT NULL,
  `id_статус` int NOT NULL,
  PRIMARY KEY (`номер_заказа`),
  KEY `fk_Заказы_Заказ_статусы_idx` (`id_статус`),
  KEY `fk_Заказы_Пункты_выдачи1_idx` (`id_пункт`),
  KEY `fk_Заказы_Пользователи1_idx` (`id_пользователь`),
  CONSTRAINT `fk_Заказы_Заказ_статусы` FOREIGN KEY (`id_статус`) REFERENCES `заказ_статусы` (`id_статус`),
  CONSTRAINT `fk_Заказы_Пользователи1` FOREIGN KEY (`id_пользователь`) REFERENCES `пользователи` (`id_пользователь`),
  CONSTRAINT `fk_Заказы_Пункты_выдачи1` FOREIGN KEY (`id_пункт`) REFERENCES `пункты_выдачи` (`id_пункт`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказы`
--

LOCK TABLES `заказы` WRITE;
/*!40000 ALTER TABLE `заказы` DISABLE KEYS */;
INSERT INTO `заказы` VALUES (101,'2025-01-10','2025-01-15',1001,1,1,1),(102,'2025-01-11','2025-01-16',1002,5,2,1),(103,'2025-01-12','2025-01-17',1003,3,3,1),(104,'2025-01-13','2025-01-18',1004,8,4,1),(105,'2025-01-14','2025-01-19',1005,2,5,1),(106,'2025-01-15','2025-01-20',1006,1,1,2),(107,'2025-01-16','2025-01-21',1007,12,2,2),(108,'2025-01-17','2025-01-22',1008,4,3,2),(109,'2025-01-18','2025-01-23',1009,9,4,3),(110,'2025-01-19','2025-01-24',1010,15,5,3),(111,'2025-01-20','2025-01-25',1011,6,6,4),(112,'2025-01-21','2025-01-26',1012,10,7,4),(113,'2025-01-22','2025-01-27',1013,7,8,4),(114,'2025-01-23','2025-01-28',1014,14,9,4),(115,'2025-01-24','2025-01-29',1015,11,10,4),(116,'2025-01-25','2025-01-30',1016,6,6,5),(117,'2025-01-26','2025-01-31',1017,10,7,5),(118,'2025-01-27','2025-02-01',1018,7,8,1),(119,'2025-01-28','2025-02-02',1019,14,9,1),(120,'2025-01-29','2025-02-03',1020,11,10,1),(121,'2025-01-30','2025-02-04',1021,1,1,2),(122,'2025-01-31','2025-02-05',1022,18,2,2),(123,'2025-02-01','2025-02-06',1023,20,3,3),(124,'2025-02-02','2025-02-07',1024,25,4,3),(125,'2025-02-03','2025-02-08',1025,30,5,4);
/*!40000 ALTER TABLE `заказы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `категории`
--

DROP TABLE IF EXISTS `категории`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `категории` (
  `id_категория` int NOT NULL AUTO_INCREMENT,
  `название` varchar(20) NOT NULL,
  PRIMARY KEY (`id_категория`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `категории`
--

LOCK TABLES `категории` WRITE;
/*!40000 ALTER TABLE `категории` DISABLE KEYS */;
INSERT INTO `категории` VALUES (1,'Вязание'),(2,'Шитье'),(3,'Бисер'),(4,'Инструменты'),(5,'Клей'),(6,'Наборы'),(7,'Живопись'),(8,'Лепка'),(9,'Бумага'),(10,'Декор');
/*!40000 ALTER TABLE `категории` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `материалы`
--

DROP TABLE IF EXISTS `материалы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `материалы` (
  `id_материал` int NOT NULL AUTO_INCREMENT,
  `название` varchar(20) NOT NULL,
  PRIMARY KEY (`id_материал`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `материалы`
--

LOCK TABLES `материалы` WRITE;
/*!40000 ALTER TABLE `материалы` DISABLE KEYS */;
INSERT INTO `материалы` VALUES (1,'Шерсть'),(2,'Хлопок'),(3,'Акрил'),(4,'Лен'),(5,'Полиамид'),(6,'Вискоза'),(7,'Шелк'),(8,'Полиэстер'),(9,'ПВХ'),(10,'Целлюлоза'),(11,'Клей'),(12,'Стекло'),(13,'Пластик'),(14,'Бамбук'),(15,'Сталь'),(16,'Синтетика');
/*!40000 ALTER TABLE `материалы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `пользователи`
--

DROP TABLE IF EXISTS `пользователи`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `пользователи` (
  `id_пользователь` int NOT NULL AUTO_INCREMENT,
  `id_роль` int NOT NULL,
  `Фамилия` varchar(50) NOT NULL,
  `Имя` varchar(50) NOT NULL,
  `Отчество` varchar(50) DEFAULT NULL,
  `Логин` varchar(255) NOT NULL,
  `Пароль` varchar(255) NOT NULL,
  PRIMARY KEY (`id_пользователь`),
  UNIQUE KEY `Логин_UNIQUE` (`Логин`),
  UNIQUE KEY `Пароль_UNIQUE` (`Пароль`),
  KEY `fk_Пользователи_Роли1_idx` (`id_роль`),
  CONSTRAINT `fk_Пользователи_Роли1` FOREIGN KEY (`id_роль`) REFERENCES `роли` (`id_роль`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `пользователи`
--

LOCK TABLES `пользователи` WRITE;
/*!40000 ALTER TABLE `пользователи` DISABLE KEYS */;
INSERT INTO `пользователи` VALUES (1,1,'Кузнецов','Иван','Петрович','admin.kuznetsov@mail.ru','Pass123!'),(2,1,'Смирнова','Анна','Сергеевна','admin.smirnova@mail.ru','Pass456!'),(3,1,'Попов','Дмитрий','Игоревич','admin.popov@mail.ru','Pass789!'),(4,2,'Васильева','Елена','Владимировна','man.vasilieva@mail.ru','Man123!'),(5,2,'Соколов','Максим','Андреевич','man.sokolov@mail.ru','Man456!'),(6,2,'Михайлов','Олег','Константинович','man.mikhailov@mail.ru','Man789!'),(7,2,'Новикова','Ирина','Львовна','man.novikova@mail.ru','Man012!'),(8,2,'Федоров','Александр','Николаевич','man.fedorov@mail.ru','Man345!'),(9,2,'Морозова','Татьяна','Ивановна','man.morozova@mail.ru','Man678!'),(10,2,'Волков','Сергей','Петрович','man.volkov@mail.ru','Man901!');
/*!40000 ALTER TABLE `пользователи` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `поставщики`
--

DROP TABLE IF EXISTS `поставщики`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `поставщики` (
  `id_поставщик` int NOT NULL AUTO_INCREMENT,
  `название` varchar(100) NOT NULL,
  `адрес` text NOT NULL,
  PRIMARY KEY (`id_поставщик`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `поставщики`
--

LOCK TABLES `поставщики` WRITE;
/*!40000 ALTER TABLE `поставщики` DISABLE KEYS */;
INSERT INTO `поставщики` VALUES (1,'Арт-Мастер','Москва'),(2,'Текстиль-Опт','СПб'),(3,'Эко-Ткань','Екатеринбург'),(4,'Люкс-Ткань','Москва'),(5,'Бисер-Мир','Казань'),(6,'Инструмент-Про','Новосибирск'),(7,'Хим-Продукт','Москва'),(8,'Арт-Канцель','Москва'),(9,'Лепка-Мастер','Минск'),(10,'Бум-Крафт','Москва');
/*!40000 ALTER TABLE `поставщики` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `пункты_выдачи`
--

DROP TABLE IF EXISTS `пункты_выдачи`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `пункты_выдачи` (
  `id_пункт` int NOT NULL AUTO_INCREMENT,
  `индекс` int NOT NULL,
  `адрес` text NOT NULL,
  PRIMARY KEY (`id_пункт`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `пункты_выдачи`
--

LOCK TABLES `пункты_выдачи` WRITE;
/*!40000 ALTER TABLE `пункты_выдачи` DISABLE KEYS */;
INSERT INTO `пункты_выдачи` VALUES (1,101000,'г. Москва, ул. Тверская, 1'),(2,191000,'г. Санкт-Петербург, Невский пр., 10'),(3,620000,'г. Екатеринбург, ул. Ленина, 5'),(4,420000,'г. Казань, ул. Баумана, 15'),(5,540000,'г. Новосибирск, Красный пр., 20'),(6,101001,'г. Москва, ул. Арбат, 5'),(7,191001,'г. Санкт-Петербург, ул. Садовая, 12'),(8,620001,'г. Екатеринбург, пр. Мира, 8'),(9,420001,'г. Казань, пр. Победы, 30'),(10,540001,'г. Новосибирск, ул. Ленина, 1'),(11,101002,'г. Москва, Кутузовский пр., 10'),(12,191002,'г. Санкт-Петербург, Лиговский пр., 50'),(13,620002,'г. Екатеринбург, ул. Малышева, 15'),(14,420002,'г. Казань, ул. Декабристов, 1'),(15,540002,'г. Новосибирск, ул. Ленина, 10'),(16,101003,'г. Москва, ул. Пятницкая, 20'),(17,191003,'г. Санкт-Петербург, ул. Рубинштейна, 5'),(18,620003,'г. Екатеринбург, ул. 8 Марта, 50'),(19,420003,'г. Казань, ул. Чистопольская, 10'),(20,540003,'г. Новосибирск, ул. Гоголя, 15'),(21,101004,'г. Москва, ул. Гиляровского, 10'),(22,191004,'г. Санкт-Петербург, ул. 8-я Советская, 10'),(23,620004,'г. Екатеринбург, ул. Вайнера, 10'),(24,420004,'г. Казань, ул. Пушкина, 10'),(25,540004,'г. Новосибирск, ул. Ленина, 20'),(26,101005,'г. Москва, ул. Сретенка, 1'),(27,191005,'г. Санкт-Петербург, ул. Маяковского, 10'),(28,620005,'г. Екатеринбург, ул. Розы Люксембург, 10'),(29,420005,'г. Казань, ул. Островского, 10'),(30,540005,'г. Новосибирск, ул. Ленина, 30');
/*!40000 ALTER TABLE `пункты_выдачи` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `роли`
--

DROP TABLE IF EXISTS `роли`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `роли` (
  `id_роль` int NOT NULL AUTO_INCREMENT,
  `название` varchar(20) NOT NULL,
  PRIMARY KEY (`id_роль`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `роли`
--

LOCK TABLES `роли` WRITE;
/*!40000 ALTER TABLE `роли` DISABLE KEYS */;
INSERT INTO `роли` VALUES (1,'Администратор'),(2,'Менеджер');
/*!40000 ALTER TABLE `роли` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `склад_остатки`
--

DROP TABLE IF EXISTS `склад_остатки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `склад_остатки` (
  `артикул` varchar(15) NOT NULL,
  `id_склад` int NOT NULL,
  `количество` int NOT NULL,
  PRIMARY KEY (`артикул`,`id_склад`),
  KEY `fk_Склад_остатки_Склады1_idx` (`id_склад`),
  CONSTRAINT `fk_Склад_остатки_Склады1` FOREIGN KEY (`id_склад`) REFERENCES `склады` (`id_склад`),
  CONSTRAINT `fk_Склад_остатки_Товары1` FOREIGN KEY (`артикул`) REFERENCES `товары` (`артикул`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `склад_остатки`
--

LOCK TABLES `склад_остатки` WRITE;
/*!40000 ALTER TABLE `склад_остатки` DISABLE KEYS */;
INSERT INTO `склад_остатки` VALUES ('BEAD-22',1,300),('BEAD-22',2,200),('BRUSH-08',1,150),('CANVAS-01',3,30),('FAB-105',1,200),('FAB-105',2,150),('FAB-110',3,100),('GLUE-01',1,100),('GLUE-01',2,80),('KNIT-09',1,10),('KNIT-09',2,5),('NEEDLE-11',1,500),('NEEDLE-11',3,400),('PAINT-04',1,150),('PAINT-04',2,200),('SCIS-02',1,40),('SCIS-02',3,50),('TOOL-05',1,20),('TOOL-05',3,15),('YRN-001',1,50),('YRN-001',2,30),('YRN-003',1,60),('YRN-003',3,40),('YRN-005',1,120),('YRN-005',2,100);
/*!40000 ALTER TABLE `склад_остатки` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `склады`
--

DROP TABLE IF EXISTS `склады`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `склады` (
  `id_склад` int NOT NULL AUTO_INCREMENT,
  `название` varchar(100) NOT NULL,
  `адрес` text NOT NULL,
  PRIMARY KEY (`id_склад`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `склады`
--

LOCK TABLES `склады` WRITE;
/*!40000 ALTER TABLE `склады` DISABLE KEYS */;
INSERT INTO `склады` VALUES (1,'Центральный','г. Москва, ул. Складская, 1'),(2,'Северный','г. СПб, пр. Индустриальный, 5'),(3,'Южный','г. Екатеринбург, ул. Монтажников, 10');
/*!40000 ALTER TABLE `склады` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `товары`
--

DROP TABLE IF EXISTS `товары`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `товары` (
  `артикул` varchar(15) NOT NULL,
  `наименование` varchar(100) NOT NULL,
  `цена` decimal(10,2) NOT NULL,
  `скидка_проценты` int DEFAULT NULL,
  `описание` text,
  `id_ед_изм` int NOT NULL,
  `id_категория` int NOT NULL,
  `id_поставщик` int NOT NULL,
  PRIMARY KEY (`артикул`),
  UNIQUE KEY `наименование_UNIQUE` (`наименование`),
  KEY `fk_Товары_Единицы_измерения1_idx` (`id_ед_изм`),
  KEY `fk_Товары_Категории1_idx` (`id_категория`),
  KEY `fk_Товары_Поставщики1_idx` (`id_поставщик`),
  CONSTRAINT `fk_Товары_Единицы_измерения1` FOREIGN KEY (`id_ед_изм`) REFERENCES `единицы_измерения` (`id_ед_изм`),
  CONSTRAINT `fk_Товары_Категории1` FOREIGN KEY (`id_категория`) REFERENCES `категории` (`id_категория`),
  CONSTRAINT `fk_Товары_Поставщики1` FOREIGN KEY (`id_поставщик`) REFERENCES `поставщики` (`id_поставщик`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товары`
--

LOCK TABLES `товары` WRITE;
/*!40000 ALTER TABLE `товары` DISABLE KEYS */;
INSERT INTO `товары` VALUES ('BEAD-22','Бисер №10',150.00,5,'Чешский бисер',3,3,5),('BEAD-24','Бисер №8',160.00,5,'Крупный бисер',3,3,5),('BEAD-26','Пайетки',120.00,10,'Разноцветные',3,3,5),('BEAD-28','Стразы',200.00,0,'Клеевые стразы',3,3,5),('BRUSH-08','Кисти синтетика',200.00,5,'5 шт',4,7,8),('BRUSH-10','Кисти натуральные',450.00,0,'Белка',4,7,8),('CANVAS-01','Холст на подрамнике',500.00,0,'30х40 см',5,7,8),('CANVAS-03','Холст рулонный',350.00,5,'Ширина 1м',2,7,8),('CLAY-01','Глина полимерная',180.00,0,'Запекаемая',3,8,9),('CLAY-03','Глина самозатверд.',220.00,5,'Белая',3,8,9),('CLAY-05','Стеки набор',150.00,10,'Инструменты',4,8,9),('FAB-105','Ткань \"Хлопок\"',320.00,2,'Бязь набивная',2,2,2),('FAB-110','Ткань \"Лен\"',550.00,2,'Плательный лен',2,2,3),('FAB-115','Ткань \"Шелк\"',1200.00,0,'Натуральный шелк',2,2,4),('FAB-120','Ткань \"Бархат\"',890.00,5,'Декоративный бархат',2,2,4),('FAB-125','Ткань \"Флис\"',450.00,10,'Для игрушек',2,2,1),('GLUE-01','Клей текстильный',120.00,10,'Для ткани',5,5,7),('GLUE-03','Клей универсальный',90.00,15,'Момент-Кристалл',5,5,7),('GLUE-05','Клей ПВА',60.00,20,'Для бумаги',5,5,7),('KNIT-09','Набор \"Шарф\"',1200.00,5,'Пряжа + схема',4,6,1),('KNIT-11','Набор \"Игрушка\"',1500.00,5,'Для вязания',4,6,1),('KNIT-13','Набор \"Салфетка\"',900.00,0,'Кружево',4,6,2),('NEEDLE-11','Иглы швейные',50.00,10,'Набор 30 шт',3,4,6),('NEEDLE-13','Иглы вышивальные',70.00,10,'Тупое острие',3,4,6),('PAINT-04','Краска акрил',150.00,5,'6 цветов',7,7,8),('PAINT-06','Краска масло',250.00,0,'Профессиональная',7,7,8),('PAINT-08','Краска гуашь',300.00,10,'12 цветов',4,7,8),('PAPER-01','Бумага для скрапбукинга',50.00,15,'30х30 см',6,9,10),('PAPER-03','Картон дизайнерский',80.00,10,'Плотный',6,9,10),('RIBBON-01','Лента атласная',30.00,20,'Ширина 2см',2,10,2),('RIBBON-03','Лента кружевная',50.00,10,'Ширина 3см',2,10,2),('SCIS-02','Ножницы',650.00,0,'Портновские',5,4,6),('SCIS-04','Ножницы зигзаг',800.00,5,'Для ткани',5,4,6),('TOOL-05','Спицы бамбук',890.00,0,'5 шт в наборе',4,4,1),('TOOL-07','Крючки сталь',750.00,0,'10 размеров',4,4,1),('YRN-001','Пряжа \"Шерстяная\"',450.00,3,'100% шерсть, 100м',1,1,1),('YRN-003','Пряжа \"Хлопок\"',380.00,3,'Мерсеризованный хлопок',1,1,2),('YRN-005','Пряжа \"Акрил\"',290.00,3,'Гипоаллергенная',1,1,1),('YRN-007','Пряжа \"Лен\"',550.00,5,'Натуральный лен',1,1,3),('YRN-009','Пряжа \"Мохер\"',600.00,2,'Пушистая пряжа',1,1,2);
/*!40000 ALTER TABLE `товары` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `товары_состав`
--

DROP TABLE IF EXISTS `товары_состав`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `товары_состав` (
  `артикул` varchar(15) NOT NULL,
  `id_материал` int NOT NULL,
  `процент_содержания` int NOT NULL,
  PRIMARY KEY (`артикул`,`id_материал`),
  KEY `fk_Товары_состав_Материалы1_idx` (`id_материал`),
  CONSTRAINT `fk_Товары_состав_Материалы1` FOREIGN KEY (`id_материал`) REFERENCES `материалы` (`id_материал`),
  CONSTRAINT `fk_Товары_состав_Товары1` FOREIGN KEY (`артикул`) REFERENCES `товары` (`артикул`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товары_состав`
--

LOCK TABLES `товары_состав` WRITE;
/*!40000 ALTER TABLE `товары_состав` DISABLE KEYS */;
INSERT INTO `товары_состав` VALUES ('BEAD-22',12,100),('BEAD-24',12,100),('BEAD-26',13,100),('BRUSH-08',16,100),('CLAY-01',9,100),('CLAY-03',10,60),('CLAY-03',11,40),('FAB-105',2,100),('FAB-110',4,80),('FAB-110',6,20),('FAB-115',7,100),('FAB-120',2,85),('FAB-120',8,15),('FAB-125',8,100),('KNIT-09',1,50),('KNIT-09',3,50),('KNIT-11',2,100),('RIBBON-01',8,100),('RIBBON-03',2,70),('RIBBON-03',8,30),('SCIS-02',13,20),('SCIS-02',15,80),('TOOL-05',14,100),('TOOL-07',15,100),('YRN-001',1,100),('YRN-003',2,100),('YRN-005',3,100),('YRN-007',4,100),('YRN-009',1,70),('YRN-009',5,30);
/*!40000 ALTER TABLE `товары_состав` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-16 17:21:45
