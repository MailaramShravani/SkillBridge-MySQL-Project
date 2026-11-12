-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: skillbridge
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `APPLICATION_ID` int NOT NULL AUTO_INCREMENT,
  `STUDENT_ID` int DEFAULT NULL,
  `OPPORTUNITY_ID` int DEFAULT NULL,
  `APPLICATION_DATE` date DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`APPLICATION_ID`),
  KEY `OPPORTUNITY_ID` (`OPPORTUNITY_ID`),
  KEY `IDX_APPLICATIONS_STUDENT` (`STUDENT_ID`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `students` (`STUDENT_ID`),
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`OPPORTUNITY_ID`) REFERENCES `opportunities` (`OPPORTUNITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,1,'2026-11-12','SELECTED'),(2,2,2,'2026-11-13','PENDING'),(3,3,3,'2026-11-16','SELECTED'),(4,1,4,'2026-11-20','APPLIED'),(5,2,5,'2026-11-27','REJECTED');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifications` (
  `CERTIFICATION_ID` int NOT NULL AUTO_INCREMENT,
  `STUDENT_ID` int DEFAULT NULL,
  `CERTIFICATION_NAME` varchar(100) DEFAULT NULL,
  `ISSUING_ORGANIZATION` varchar(100) DEFAULT NULL,
  `ISSUE_DATE` date DEFAULT NULL,
  PRIMARY KEY (`CERTIFICATION_ID`),
  KEY `IDX_CERTIFICATION_STUDENT` (`STUDENT_ID`),
  CONSTRAINT `certifications_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `students` (`STUDENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
INSERT INTO `certifications` VALUES (1,1,'JAVA PROGRAMMING','CODEGNAN','2026-11-09'),(2,2,'PYTHON BASICS','UDEMY','2026-09-04'),(3,3,'MYSQL','COURSERA','2026-08-28'),(4,1,'WB DEVELOPER','INFOSYS SPRINGBOARD','2026-10-03'),(5,1,'DATABASE MANAGEMENT','NPTEL','2026-11-01');
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `COMPANY_ID` int NOT NULL AUTO_INCREMENT,
  `COMPANY_NAME` varchar(100) NOT NULL,
  `LOCATION` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COMPANY_ID`),
  KEY `INX_COMPANY_NAME` (`COMPANY_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'TCS','HYDERABAD','TCS@GMAIL.COM'),(2,'INFOSYS','BANGALORE','INFOSYS@GMAIL.COM'),(3,'WIPRO','HYDERABAD','WIPRO@GMAIL.COM');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `company_opportunities_view`
--

DROP TABLE IF EXISTS `company_opportunities_view`;
/*!50001 DROP VIEW IF EXISTS `company_opportunities_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `company_opportunities_view` AS SELECT 
 1 AS `COMPANY_ID`,
 1 AS `COMPANY_NAME`,
 1 AS `OPPORTUNITY_ID`,
 1 AS `OPPORTUNITY_TITLE`,
 1 AS `OPPORTUNITY_TYPE`,
 1 AS `STIPEND`,
 1 AS `DEADLINE`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opportunities` (
  `OPPORTUNITY_ID` int NOT NULL AUTO_INCREMENT,
  `COMPANY_ID` int DEFAULT NULL,
  `OPPORTUNITY_TITLE` varchar(100) DEFAULT NULL,
  `OPPORTUNITY_TYPE` varchar(50) DEFAULT NULL,
  `STIPEND` decimal(10,2) DEFAULT NULL,
  `DEADLINE` date DEFAULT NULL,
  PRIMARY KEY (`OPPORTUNITY_ID`),
  KEY `IDX_OPPORTUNITY_COMPANY` (`COMPANY_ID`),
  CONSTRAINT `opportunities_ibfk_1` FOREIGN KEY (`COMPANY_ID`) REFERENCES `companies` (`COMPANY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
INSERT INTO `opportunities` VALUES (1,1,'JAVA DEVELOPER INTERN','INTERNSHIP',20000.00,'2027-01-20'),(2,2,'PYTHON DEVELOPER','JOB',15000.00,'2026-11-28'),(3,3,'WEB DEVELOPER INTERN','INTERNSHIP',10000.00,'2026-12-25'),(4,1,'DATA ANALYST INTERN  ','INTERNSHIP',70000.00,'2026-12-13'),(5,2,'SOFTWARE DEVELOPER','JOB',80000.00,'2027-02-15');
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `SKILL_ID` int NOT NULL AUTO_INCREMENT,
  `SKILL_NAME` varchar(50) NOT NULL,
  `SKILL_CATEGORY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SKILL_ID`),
  UNIQUE KEY `SKILL_NAME` (`SKILL_NAME`),
  KEY `INX_SKILL_NAME` (`SKILL_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'JAVA','PROGRAMMING'),(2,'PYTHON','PROGRAMMING'),(3,'MYSQL','DATABASE'),(4,'HTML','WEB DEVELOPMENT'),(5,'EXCEL','DATA ANALYTICS');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_skills`
--

DROP TABLE IF EXISTS `student_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_skills` (
  `STUDENT_SKILL_ID` int NOT NULL AUTO_INCREMENT,
  `STUDENT_ID` int DEFAULT NULL,
  `SKILL_ID` int DEFAULT NULL,
  `PROFICIENCY` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`STUDENT_SKILL_ID`),
  KEY `SKILL_ID` (`SKILL_ID`),
  KEY `IDX_STUDENT_SKILLS` (`STUDENT_ID`),
  CONSTRAINT `student_skills_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `students` (`STUDENT_ID`),
  CONSTRAINT `student_skills_ibfk_2` FOREIGN KEY (`SKILL_ID`) REFERENCES `skills` (`SKILL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_skills`
--

LOCK TABLES `student_skills` WRITE;
/*!40000 ALTER TABLE `student_skills` DISABLE KEYS */;
INSERT INTO `student_skills` VALUES (1,1,1,'ADVANCED'),(2,1,3,'INTERMEDIATE'),(3,2,2,'BEGINNER'),(4,3,4,'INTERMEDIATE'),(5,4,5,'ADVANCED');
/*!40000 ALTER TABLE `student_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_skills_view`
--

DROP TABLE IF EXISTS `student_skills_view`;
/*!50001 DROP VIEW IF EXISTS `student_skills_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_skills_view` AS SELECT 
 1 AS `STUDENT_ID`,
 1 AS `STUDENT_NAME`,
 1 AS `SKILL_NAME`,
 1 AS `PROFICIENCY`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `STUDENT_ID` int NOT NULL,
  `STUDENT_NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `COLLEGE` varchar(100) DEFAULT NULL,
  `DEPARTMENT` varchar(50) DEFAULT NULL,
  `STUDY_YEAR` int DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  KEY `IDX_STUDENT_NAME` (`STUDENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'SHRAVANI','SHRAVANI@GMAIL.COM','OU COLLEGE','BCA',2),(2,'KALA','KALA@GMAIL.COM','JNTU ','BCA',3),(3,'SAI','SAI@GMAIL.COM','ANURAG UNIVERCITY','BCA',4),(4,'SWATHI','SWATHI@GMAIL.COM','VJIT','BCA',2),(5,'SANDHYA','SANDHYA@GMAIL.COM','ST.MARY COLLEGE','BCA',3);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `company_opportunities_view`
--

/*!50001 DROP VIEW IF EXISTS `company_opportunities_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `company_opportunities_view` AS select `c`.`COMPANY_ID` AS `COMPANY_ID`,`c`.`COMPANY_NAME` AS `COMPANY_NAME`,`o`.`OPPORTUNITY_ID` AS `OPPORTUNITY_ID`,`o`.`OPPORTUNITY_TITLE` AS `OPPORTUNITY_TITLE`,`o`.`OPPORTUNITY_TYPE` AS `OPPORTUNITY_TYPE`,`o`.`STIPEND` AS `STIPEND`,`o`.`DEADLINE` AS `DEADLINE` from (`companies` `c` join `opportunities` `o` on((`c`.`COMPANY_ID` = `o`.`COMPANY_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_skills_view`
--

/*!50001 DROP VIEW IF EXISTS `student_skills_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_skills_view` AS select `s`.`STUDENT_ID` AS `STUDENT_ID`,`s`.`STUDENT_NAME` AS `STUDENT_NAME`,`sk`.`SKILL_NAME` AS `SKILL_NAME`,`ss`.`PROFICIENCY` AS `PROFICIENCY` from ((`students` `s` join `student_skills` `ss` on((`s`.`STUDENT_ID` = `ss`.`STUDENT_ID`))) join `skills` `sk` on((`ss`.`SKILL_ID` = `sk`.`SKILL_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-13  1:06:18
