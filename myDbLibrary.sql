-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: testlibrary
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `idAuthor` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `NPSurname` varchar(45) NOT NULL,
  PRIMARY KEY (`idAuthor`),
  UNIQUE KEY `idAuthor_UNIQUE` (`idAuthor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Alexandr','Pushkin','A. S. Pushkin'),(2,'Alexandr','Griboedov','A. S. Griboedov'),(3,'Nikolay','Gogol','N. V. Gogol'),(4,'Mikhail','Bulgakov','M. A. Bulgakov');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `idBook` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Author` int NOT NULL,
  PRIMARY KEY (`idBook`),
  KEY `fk_Book_Author_idx` (`Author`),
  CONSTRAINT `fk_Book_Author` FOREIGN KEY (`Author`) REFERENCES `author` (`idAuthor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Eugene Onegin',1),(2,'Woe from wit',2),(3,'Dead souls',3),(4,'The Master and Margarita',4),(5,'Boris Godunov',1),(6,'Taras Bulba',4);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copyofbook`
--

DROP TABLE IF EXISTS `copyofbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copyofbook` (
  `idcopyOfBook` int NOT NULL AUTO_INCREMENT,
  `yearOfPublication` varchar(2020) NOT NULL,
  `Book` int NOT NULL,
  `Publishing_idPublishing` int NOT NULL,
  PRIMARY KEY (`idcopyOfBook`),
  KEY `fk_copyOfBook_Book1_idx` (`Book`),
  KEY `fk_copyOfBook_Publishing1_idx` (`Publishing_idPublishing`),
  CONSTRAINT `fk_copyOfBook_Book1` FOREIGN KEY (`Book`) REFERENCES `book` (`idBook`),
  CONSTRAINT `fk_copyOfBook_Publishing1` FOREIGN KEY (`Publishing_idPublishing`) REFERENCES `publishing` (`idPublishing`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copyofbook`
--

LOCK TABLES `copyofbook` WRITE;
/*!40000 ALTER TABLE `copyofbook` DISABLE KEYS */;
INSERT INTO `copyofbook` VALUES (1,'2015',1,1),(2,'2017',1,1),(3,'2017',2,1),(4,'2018',2,1),(5,'2011',3,2),(6,'2012',3,2),(7,'2013',4,1),(8,'2017',5,2),(9,'2015',6,1);
/*!40000 ALTER TABLE `copyofbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `idOperation` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `typeOperation` varchar(10) NOT NULL,
  `copyOfBook` int NOT NULL,
  `Student` int NOT NULL,
  PRIMARY KEY (`idOperation`),
  KEY `fk_Operation_copyOfBook1_idx` (`copyOfBook`),
  KEY `fk_Operation_Student1_idx` (`Student`),
  CONSTRAINT `fk_Operation_copyOfBook1` FOREIGN KEY (`copyOfBook`) REFERENCES `copyofbook` (`idcopyOfBook`),
  CONSTRAINT `fk_Operation_Student1` FOREIGN KEY (`Student`) REFERENCES `student` (`idStudent`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES (1,'2019-02-20','take',1,1),(2,'2019-04-15','back',1,1),(3,'2019-04-20','take',3,3),(4,'2019-04-24','take',4,3),(5,'2019-04-28','back',3,3),(6,'2019-05-02','take',2,1),(7,'2019-05-07','back',4,3),(8,'2019-05-15','take',7,3),(9,'2019-05-17','back',2,1),(10,'2019-05-24','take',8,1),(11,'2019-05-29','take',9,3),(12,'2019-06-03','back',9,3),(13,'2019-06-05','take',9,1),(14,'2019-06-14','back',7,3),(15,'2019-06-17','take',7,2);
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishing`
--

DROP TABLE IF EXISTS `publishing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishing` (
  `idPublishing` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idPublishing`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishing`
--

LOCK TABLES `publishing` WRITE;
/*!40000 ALTER TABLE `publishing` DISABLE KEYS */;
INSERT INTO `publishing` VALUES (1,'Drofa'),(2,'Eksmo');
/*!40000 ALTER TABLE `publishing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idStudent` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  PRIMARY KEY (`idStudent`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Inav','Petrov'),(2,'Oleg','Sidorov'),(3,'Maksim','Petrenko');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testlibrary'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-01 11:57:54
