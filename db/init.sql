-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: formation_management
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Directeur Othmen','Directeur'),(2,'Responsable Soufienne','Responsable'),(3,'Etudiant Ahmed','Etudiant');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiant`
--

LOCK TABLES `etudiant` WRITE;
/*!40000 ALTER TABLE `etudiant` DISABLE KEYS */;
/*!40000 ALTER TABLE `etudiant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `groupe` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `groupeSpecialite` varchar(255) DEFAULT NULL,
  `sexe` varchar(10) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `niveaux` varchar(255) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `departement` varchar(255) DEFAULT NULL,
  `etat` enum('en attente','accepté','refusé') DEFAULT 'en attente',
  `classe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cin` (`cin`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
INSERT INTO `etudiants` VALUES (139,'Jane','Doe',NULL,NULL,'password','jane.doe@example.com',NULL,NULL,'123456789','1',NULL,'Informatique','en attente',NULL),(140,'Doe','John',NULL,'unique-cin-by795iwxt','password123','john.doe@example.com',NULL,NULL,'1234567890','Undergraduate',NULL,'CS','en attente',NULL),(141,'Doe','John',NULL,'unique-cin-wir75k41z','password123','john.doe@example.com',NULL,NULL,'1234567890','Undergraduate',NULL,'CS','en attente',NULL),(142,'v','c',NULL,'unique-cin-d4musfccv','0000','09720775',NULL,NULL,'c','c',NULL,'c','en attente',NULL),(143,'Doe','John',NULL,'unique-cin-ovz9vo51t','password123','john.doe@example.com',NULL,NULL,'1234567890','Undergraduate',NULL,'CS','en attente',NULL),(144,'Doe','John',NULL,'unique-cin-6jru81436','password123','john.doe@example.com',NULL,NULL,'1234567890','Undergraduate',NULL,'CS','en attente',NULL),(145,'Doe','John',NULL,'unique-cin-vsg4wgzcm','password123','john.doe@example.com',NULL,NULL,'1234567890','Undergraduate',NULL,'CS','en attente',NULL),(146,'Doe','John',NULL,'unique-cin-xu42xk1fv','password123','john.doe@example.com',NULL,NULL,'1234567890',NULL,NULL,'CS','en attente',NULL),(147,'Doe','John',NULL,'unique-cin-mf6cnxlki','password123','john.doe@example.com',NULL,NULL,'1234567890','Undergraduate',NULL,'CS','en attente',NULL),(148,'Doe','John',NULL,'unique-cin-pstgzo0rc','password123','john.doe@example.com',NULL,NULL,'1234567890',NULL,NULL,'CS','en attente',NULL),(149,'Doe','John',NULL,'unique-cin-4cahj4x5w','password123','john.doe@example.com',NULL,NULL,'1234567890',NULL,NULL,'CS','en attente',NULL),(150,'Doe','John',NULL,'unique-cin-8o7456wom','password123','john.doe@example.com',NULL,NULL,'1234567890','Undergraduate',NULL,'CS','en attente',NULL),(151,'Doe','John',NULL,'unique-cin-42l8945dp','password123','john.doe@example.com',NULL,NULL,'1234567890',NULL,NULL,'CS','en attente',NULL);
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (2,'hac','Description de l\'événement','2024-05-15','18:00:00','Lieu de l\'événement','Catégorie de l\'événement'),(3,'Titre de l\'événement','Description de l\'événement','2024-05-15','18:00:00','Lieu de l\'événement','Catégorie de l\'événement'),(5,'d','s','2024-05-16',NULL,'s','s'),(6,'ttt','ttt','2024-05-30','12:00:00','tozeur','hac'),(7,'ttt','ttt','2024-05-30','12:00:00','tozeur','hac'),(8,'ttt','ss','2024-05-05',NULL,'tozeur','hac'),(9,'ttt','ss','2024-05-05',NULL,'tozeur','hac'),(10,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(11,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(12,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(13,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(14,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(15,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(16,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(17,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(18,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(19,'ttt','qq','2024-05-04',NULL,'tozeur','hac'),(20,'ttt','x','2024-05-25',NULL,'tozeur','hac'),(21,'ttt','tyy','2024-05-30','12:05:00','tozeur','ô'),(22,'ttt','tyy','2024-05-30','12:05:00','tozeur','ô'),(23,'ttt','tyy','2024-05-30','12:05:00','tozeur','ô'),(24,'ttt','tyy','2024-05-30','12:05:00','tozeur','ô'),(25,'ttt','ggg','2024-06-04',NULL,'tozeur','ô'),(26,'ttt','ggg','2024-06-04',NULL,'tozeur','ô'),(27,'ttt','ggg','2024-06-04',NULL,'tozeur','ô'),(28,'ttt','fff','2024-06-07',NULL,'tozeur','ô'),(29,'ttt','lll','2024-05-02','14:01:00','tozeur','p'),(30,'ttt','lll','2024-05-02','14:01:00','tozeur','p'),(31,'ttt','lll','2024-05-02','14:01:00','tozeur','p'),(32,'ttt','lll','2024-05-02','14:01:00','tozeur','p'),(33,'ttt','lll','2024-05-02','14:01:00','tozeur','p'),(34,'ttt','dd','2024-06-09',NULL,'i','i'),(35,'mmm','i','2024-05-03',NULL,'i','i'),(36,'mmm','i','2024-05-03',NULL,'i','i'),(37,'mmm','i','2024-05-03',NULL,'i','i'),(38,'w','ww','2024-06-01',NULL,'o','i'),(40,'evenement 1','Description de l\'événement','2024-05-20','10:00:00','iset','Catégorie de l\'événement');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `description` text,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `lieu` varchar(100) DEFAULT NULL,
  `capacite_max` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formations`
--

DROP TABLE IF EXISTS `formations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `description` text,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formations`
--

LOCK TABLES `formations` WRITE;
/*!40000 ALTER TABLE `formations` DISABLE KEYS */;
INSERT INTO `formations` VALUES (9,'Formation 4','Description de la formation 4','2024-06-01','2024-06-15','4C ISET Tozeur'),(10,'Formation 5','Description de la formation 5','2024-07-01','2024-07-15','4C ISET Tozeur'),(11,'Formation 1','Description de la formation 1','2024-03-01','2024-03-15','4C ISET Tozeur'),(12,'Formation 2','Description de la formation 2','2024-04-01','2024-04-15','4C ISET Tozeur'),(13,'Formation 3','Description de la formation 3','2024-05-01','2024-05-15','4C ISET Tozeur'),(14,'Formation 4','Description de la formation 4','2024-06-01','2024-06-15','4C ISET Tozeur'),(15,'Formation 5','Description de la formation 5','2024-07-01','2024-07-15','4C ISET Tozeur'),(18,'Formation 1','Description de la formation 1','2024-03-01','2024-03-15','4C ISET Tozeur'),(19,'Formation 2','Description de la formation 2','2024-04-01','2024-04-15','4C ISET Tozeur'),(20,'Formation 3','Description de la formation 3','2024-05-01','2024-05-15','4C ISET Tozeur'),(21,'Formation 4','Description de la formation 4','2024-06-01','2024-06-15','4C ISET Tozeur'),(22,'Formation 5','Description de la formation 5','2024-07-01','2024-07-15','4C ISET Tozeur'),(23,'Formation 1','Description de la formation 1','2024-03-01','2024-03-15','4C ISET Tozeur'),(24,'Formation 2','Description de la formation 2','2024-04-01','2024-04-15','4C ISET Tozeur'),(25,'Formation 3','Description de la formation 3','2024-05-01','2024-05-15','4C ISET Tozeur'),(26,'Formation 4','Description de la formation 4','2024-06-01','2024-06-15','4C ISET Tozeur'),(28,'Formation 1','Description de la formation 1','2024-03-01','2024-03-15','4C ISET Tozeur'),(35,'Formation en développement web','Formation complète sur les technologies web modernes','2024-05-01','2024-06-30','En ligne'),(38,'react','formation 1','2024-04-03','2024-04-19','tozeur'),(39,'scrum',NULL,'2024-04-19','2024-05-11','tozeur'),(40,'scrum2','formation 1',NULL,NULL,'tozeur'),(42,'cisco3','dd','2024-05-29','2024-06-09','tozeur'),(43,'New Formation','Description','2024-01-01','2024-01-31','Paris'),(44,NULL,'Description de l\'événement',NULL,NULL,NULL),(45,NULL,'Description de l\'événement',NULL,NULL,NULL);
/*!40000 ALTER TABLE `formations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formation_id` int DEFAULT NULL,
  `etudiant_id` int DEFAULT NULL,
  `participation` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `formation_id` (`formation_id`),
  KEY `etudiant_id` (`etudiant_id`),
  CONSTRAINT `inscriptions_ibfk_1` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`),
  CONSTRAINT `inscriptions_ibfk_2` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptions`
--

LOCK TABLES `inscriptions` WRITE;
/*!40000 ALTER TABLE `inscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `responsible_person_id` int NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `responsible_person_id` (`responsible_person_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`responsible_person_id`) REFERENCES `responsible_persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participations`
--

DROP TABLE IF EXISTS `participations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idFormation` int DEFAULT NULL,
  `idEtudiant` int DEFAULT NULL,
  `date_participation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idFormation` (`idFormation`),
  KEY `idEtudiant` (`idEtudiant`),
  CONSTRAINT `participations_ibfk_1` FOREIGN KEY (`idFormation`) REFERENCES `formations` (`id`),
  CONSTRAINT `participations_ibfk_2` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participations`
--

LOCK TABLES `participations` WRITE;
/*!40000 ALTER TABLE `participations` DISABLE KEYS */;
/*!40000 ALTER TABLE `participations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsible_persons`
--

DROP TABLE IF EXISTS `responsible_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsible_persons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsible_persons`
--

LOCK TABLES `responsible_persons` WRITE;
/*!40000 ALTER TABLE `responsible_persons` DISABLE KEYS */;
INSERT INTO `responsible_persons` VALUES (1,'John Doe','john@example.com','1234567890',NULL),(2,'Jane Smith','jane@example.com','0987654321',NULL),(3,'Directeur Othmen','othmen@example.com','123-456-7890','path/to/othmen.jpg'),(4,'Responsable Soufienne','soufienne@example.com','098-765-4321','path/to/soufienne.jpg');
/*!40000 ALTER TABLE `responsible_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistiques`
--

DROP TABLE IF EXISTS `statistiques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistiques` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_formation` varchar(255) NOT NULL,
  `nombre_inscriptions` int NOT NULL,
  `taux_participation` float DEFAULT NULL,
  `date_statistique` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistiques`
--

LOCK TABLES `statistiques` WRITE;
/*!40000 ALTER TABLE `statistiques` DISABLE KEYS */;
INSERT INTO `statistiques` VALUES (1,'Formation A',50,0.8,'2024-04-15'),(2,'Formation A',50,0.8,'2024-04-15'),(3,'Formation A',50,0.8,'2024-04-15'),(4,'Formation B',60,0.7,'2024-04-16'),(5,'Formation C',70,0.9,'2024-04-17');
/*!40000 ALTER TABLE `statistiques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cin` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'09720775','09720775');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cin` varchar(20) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cin` (`cin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'09720775','0000','nour','lassaid','nourlassaid505@gmail.com','2024-03-12 21:25:16');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22  8:54:45
