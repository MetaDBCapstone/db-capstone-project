-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.33

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
  `BookingID` int NOT NULL,
  `TableNumber` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `StaffID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `FK_Bookings_Customer_details` (`CustomerID`),
  KEY `FK_Bookings_Staff_information` (`StaffID`),
  CONSTRAINT `FK_Bookings_Customer_details` FOREIGN KEY (`CustomerID`) REFERENCES `customer_details` (`CustomerID`),
  CONSTRAINT `FK_Bookings_Staff_information` FOREIGN KEY (`StaffID`) REFERENCES `staff_information` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,'2023-05-24',1,1),(2,2,'2023-05-25',2,2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `CustomerID` int NOT NULL,
  `CustomerName` varchar(45) DEFAULT NULL,
  `CustomerPhone` varchar(45) DEFAULT NULL,
  `CustomerAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerPhone_UNIQUE` (`CustomerPhone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (1,'John Doe','1234567890','123 Main St'),(2,'Jane Smith','9876543210','456 Elm St'),(3,'Mary Johnson','987654321','789 Oak St'),(4,'Michael Smith','123456789','456 Maple Ave'),(5,'Emily Davis','555555555','123 Pine Ln'),(6,'Daniel Anderson','777777777','789 Elm Rd'),(7,'Olivia Wilson','999999999','321 Cedar St');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL,
  `Cuisine` varchar(45) DEFAULT NULL,
  `Starter` varchar(45) DEFAULT NULL,
  `Course` varchar(45) DEFAULT NULL,
  `Drink` varchar(45) DEFAULT NULL,
  `Dessert` varchar(45) DEFAULT NULL,
  `Cost` int DEFAULT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Italian','Bruschetta','Lasagna','Wine','Tiramisu',25),(2,'Mexican','Guacamole','Tacos','Margarita','Churros',15),(3,'Indian','Samosa','Butter Chicken','Mango Lassi','Gulab Jamun',19),(4,'Chinese','Spring Rolls','Sweet and Sour Chicken','Green Tea','Fortune Cookies',15),(5,'Greek','Tzatziki','Moussaka','Ouzo','Baklava',21),(6,'Japanese','Edamame','Sushi','Green Tea','Mochi Ice Cream',22),(7,'Thai','Tom Yum Soup','Pad Thai','Thai Iced Tea','Mango Sticky Rice',17);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_status`
--

DROP TABLE IF EXISTS `order_delivery_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_status` (
  `Order_delivery_statusID` int NOT NULL,
  `Delivery_Date` date DEFAULT NULL,
  `Delivery_Status` varchar(45) DEFAULT NULL,
  `OrderID` int DEFAULT NULL,
  PRIMARY KEY (`Order_delivery_statusID`),
  KEY `FK_Order_delivery_status_Orders` (`OrderID`),
  CONSTRAINT `FK_Order_delivery_status_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_status`
--

LOCK TABLES `order_delivery_status` WRITE;
/*!40000 ALTER TABLE `order_delivery_status` DISABLE KEYS */;
INSERT INTO `order_delivery_status` VALUES (3,'2023-05-26','Delivered',3),(4,'2023-05-27','Pending',4),(5,'2023-05-28','Delivered',5),(6,'2023-05-29','Pending',6),(7,'2023-05-30','Delivered',7);
/*!40000 ALTER TABLE `order_delivery_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `Order_Date` date DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_Orders_Customer_details` (`CustomerID`),
  KEY `FK_Orders_Menu` (`MenuID`),
  CONSTRAINT `FK_Orders_Customer_details` FOREIGN KEY (`CustomerID`) REFERENCES `customer_details` (`CustomerID`),
  CONSTRAINT `FK_Orders_Menu` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,'2023-05-26',3,1,2),(4,'2023-05-27',4,2,3),(5,'2023-05-28',5,3,1),(6,'2023-05-29',6,4,2),(7,'2023-05-30',7,5,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_information`
--

DROP TABLE IF EXISTS `staff_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_information` (
  `StaffID` int NOT NULL,
  `StaffName` varchar(45) DEFAULT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `Salary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE KEY `StaffName_UNIQUE` (`StaffName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_information`
--

LOCK TABLES `staff_information` WRITE;
/*!40000 ALTER TABLE `staff_information` DISABLE KEYS */;
INSERT INTO `staff_information` VALUES (1,'David Johnson','Manager',5000),(2,'Sarah Wilson','Waiter',2500);
/*!40000 ALTER TABLE `staff_information` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24  1:11:38