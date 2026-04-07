-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `изображения`
--

DROP TABLE IF EXISTS `изображения`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `изображения` (
  `id_изображение` int NOT NULL AUTO_INCREMENT,
  `id_рецепт` int NOT NULL,
  `ссылка` text NOT NULL,
  PRIMARY KEY (`id_изображение`),
  KEY `fk_Картинки_Рецепты1_idx` (`id_рецепт`),
  CONSTRAINT `fk_Картинки_Рецепты1` FOREIGN KEY (`id_рецепт`) REFERENCES `рецепты` (`id_рецепт`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `изображения`
--

LOCK TABLES `изображения` WRITE;
/*!40000 ALTER TABLE `изображения` DISABLE KEYS */;
INSERT INTO `изображения` VALUES (1,1,'https://i.ibb.co/VYPFCCB9/1.png'),(2,3,'https://i.ibb.co/5gG4NCy1/TMZyxds-DC38kr-GEz2-Rn-QFfo9c-YJYk83hn8-JMlua9nbby-Kl8-Qpm-XXh-INSVj3-S2-Aam72-RLEt-OS8-MDN-U-l-J6hgvk-CC.jpg'),(3,4,'https://i.ibb.co/PzgspBnD/1.png');
/*!40000 ALTER TABLE `изображения` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ингредиенты`
--

DROP TABLE IF EXISTS `ингредиенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ингредиенты` (
  `id_ингредиент` int NOT NULL AUTO_INCREMENT,
  `название` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ингредиент`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ингредиенты`
--

LOCK TABLES `ингредиенты` WRITE;
/*!40000 ALTER TABLE `ингредиенты` DISABLE KEYS */;
INSERT INTO `ингредиенты` VALUES (17,'Варёная колбаса'),(20,'Горошек зелёный '),(3,'Какао'),(15,'Лавровый лист'),(22,'Лук репчатый '),(21,'Майонез'),(4,'Морковь (мелко тёртая)'),(1,'Мука'),(18,'Огурцы свежие '),(11,'Печенье «Кофейное»'),(7,'Разрыхлитель'),(6,'Растительное масло'),(2,'Сахар'),(9,'Сахарная пудра'),(8,'Сметана 25%'),(10,'Соль'),(13,'Соль крупная, каменная'),(16,'Укроп сухой '),(12,'Чёрный кунжут'),(14,'Чеснок'),(5,'Яйца'),(19,'Яйца варёные ');
/*!40000 ALTER TABLE `ингредиенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `кухни`
--

DROP TABLE IF EXISTS `кухни`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `кухни` (
  `id_кухня` int NOT NULL AUTO_INCREMENT,
  `кухня_название` varchar(45) NOT NULL,
  PRIMARY KEY (`id_кухня`),
  UNIQUE KEY `название_UNIQUE` (`кухня_название`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `кухни`
--

LOCK TABLES `кухни` WRITE;
/*!40000 ALTER TABLE `кухни` DISABLE KEYS */;
INSERT INTO `кухни` VALUES (1,'Болотная'),(3,'Военная'),(2,'Прогребарская');
/*!40000 ALTER TABLE `кухни` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `рецепты`
--

DROP TABLE IF EXISTS `рецепты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `рецепты` (
  `id_рецепт` int NOT NULL AUTO_INCREMENT,
  `id_кухня` int NOT NULL,
  `название` varchar(45) NOT NULL,
  `шаги_приготовление` text NOT NULL,
  `описание` text,
  `время_готовки` int NOT NULL,
  PRIMARY KEY (`id_рецепт`),
  UNIQUE KEY `title_UNIQUE` (`название`),
  KEY `fk_Рецепты_Кухни1_idx` (`id_кухня`),
  CONSTRAINT `fk_Рецепты_Кухни1` FOREIGN KEY (`id_кухня`) REFERENCES `кухни` (`id_кухня`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `рецепты`
--

LOCK TABLES `рецепты` WRITE;
/*!40000 ALTER TABLE `рецепты` DISABLE KEYS */;
INSERT INTO `рецепты` VALUES (1,1,'Торт «Торфяник»','1. Смешайте яйца, сахар, масло, морковь.\n2. Добавьте муку, какао, разрыхлитель.\n3. Выпекайте в форме 20 см при 180°C 40 минут.\n4. Остудите, разрежьте на 2–3 коржа.\n5. Взбейте сметану с пудрой до густоты.\n6. Соберите торт: корж – крем – корж.\n7. Верх и бока густо обмажьте кремом.\n8. Посыпьте «торфяной крошкой» (печенье+мак).\n9. Уберите на ночь в холодильник.','Тёмный, влажный и слоистый, как болотная почва. Шоколадно-морковный торт с кислым кремом, имитирующим торфяную влагу.',90),(3,3,'Картошка в мундире Вакутагина','1. Картофель вымыть щёткой, но не чистить. На каждом клубне сделать неглубокий надрез крест-накрест (чтобы не «взорвалась» при варке от тоски по дому). \r\n2. В кастрюлю налить воды столько, чтобы чуть покрывала картошку. \r\n3. Всыпать всю соль — раствор должен стать рассолом, как в осенней грязи. Бросить лаврушку. \r\n4. Варить 25 минут после закипания. Слить воду, дать обсохнуть в дуршлаге (это минута «увольнения»). \r\n5. На сковороде разогреть масло, бросить зубчики чеснока в шелухе (они отдадут аромат, но не сгорят). \r\n6. Обжарить картофель до румяной «корки мундира». \r\n7. Перед подачей посыпать сухим укропом. Лозунг: «Ешь, Вакутагин, а то заставят мыть!»','«Мундир» здесь не просто кожура, а агрессивная «броня» из соли и чеснока, чтобы картошка точно не дезертировала.',60),(4,2,'Салат «Против ООП»','1. Нарушая инкапсуляцию, порежьте все продукты на куски одинаково хаотично (никаких отдельных классов для овощей).\r\n2. Лук нарежьте и залейте кипятком на 5 минут — это «обработка исключения».\r\n3. Смешайте всё в одной глобальной миске (единое пространство имён, как в Си).\r\n4. Заправьте майонезом — это ваш «божественный объект», который знает всё и про всё.\r\n5. Важное условие: Перемешивать строго против часовой стрелки — как знак протеста против наследования.','Этот салат отрицает инкапсуляцию, наследование и полиморфизм. Всё в одной миске, все ингредиенты имеют public доступ, а нож — это goto. Лозунг салата: «Нет методам — есть функции! Нет классам — есть структуры!»',5);
/*!40000 ALTER TABLE `рецепты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `рецепты_ингредиенты`
--

DROP TABLE IF EXISTS `рецепты_ингредиенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `рецепты_ингредиенты` (
  `id_рецепт` int NOT NULL,
  `id_ингредиент` int NOT NULL,
  `количество` double NOT NULL,
  PRIMARY KEY (`id_рецепт`,`id_ингредиент`),
  KEY `fk_Рецепты_has_Ингредиенты_Ингреди_idx` (`id_ингредиент`),
  KEY `fk_Рецепты_has_Ингредиенты_Рецепты_idx` (`id_рецепт`),
  CONSTRAINT `fk_Рецепты_has_Ингредиенты_Ингредие1` FOREIGN KEY (`id_ингредиент`) REFERENCES `ингредиенты` (`id_ингредиент`),
  CONSTRAINT `fk_Рецепты_has_Ингредиенты_Рецепты` FOREIGN KEY (`id_рецепт`) REFERENCES `рецепты` (`id_рецепт`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `рецепты_ингредиенты`
--

LOCK TABLES `рецепты_ингредиенты` WRITE;
/*!40000 ALTER TABLE `рецепты_ингредиенты` DISABLE KEYS */;
INSERT INTO `рецепты_ингредиенты` VALUES (1,1,200),(1,2,200),(1,3,3),(1,4,200),(1,5,2),(1,6,100),(1,7,1),(1,8,400),(1,9,100),(1,10,1),(1,11,50),(1,12,10),(3,13,3),(3,14,1),(3,15,5),(3,16,1),(4,17,100),(4,18,2),(4,19,2),(4,20,4),(4,21,1),(4,22,2);
/*!40000 ALTER TABLE `рецепты_ингредиенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `шаги_приготовления`
--

DROP TABLE IF EXISTS `шаги_приготовления`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `шаги_приготовления` (
  `id_шаг` int NOT NULL AUTO_INCREMENT,
  `id_рецепт` int NOT NULL,
  `номер_шага` int NOT NULL,
  `описание` text,
  PRIMARY KEY (`id_шаг`),
  UNIQUE KEY `номер_шага_UNIQUE` (`номер_шага`),
  KEY `fk_Шаги_Приготовление_Рецепты1_idx` (`id_рецепт`),
  CONSTRAINT `fk_Шаги_Приготовление_Рецепты1` FOREIGN KEY (`id_рецепт`) REFERENCES `рецепты` (`id_рецепт`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `шаги_приготовления`
--

LOCK TABLES `шаги_приготовления` WRITE;
/*!40000 ALTER TABLE `шаги_приготовления` DISABLE KEYS */;
/*!40000 ALTER TABLE `шаги_приготовления` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-07 20:58:37
