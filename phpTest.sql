-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for php_test
CREATE DATABASE IF NOT EXISTS `php_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `php_test`;

-- Dumping structure for table php_test.employeedetails
CREATE TABLE IF NOT EXISTS `employeedetails` (
  `empid` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`empid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table php_test.employeedetails: ~0 rows (approximately)
INSERT INTO `employeedetails` (`empid`, `fullname`, `manager_id`, `date_of_joining`, `city`) VALUES
	(11, 'John Smith', 2, '2015-01-26', 'Chicago'),
	(12, 'Raj Kumar', 3, '2015-01-30', 'Mumbai'),
	(13, 'Kuldeep Rana', 5, '2020-11-27', 'New Delhi');

-- Dumping structure for table php_test.employeesalary
CREATE TABLE IF NOT EXISTS `employeesalary` (
  `empid` int NOT NULL AUTO_INCREMENT,
  `salary` int DEFAULT NULL,
  `variable` int DEFAULT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table php_test.employeesalary: ~0 rows (approximately)
INSERT INTO `employeesalary` (`empid`, `salary`, `variable`) VALUES
	(11, 8000, 500),
	(12, 10000, 1000),
	(13, 12000, 0);

-- Dumping structure for table php_test.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table php_test.projects: ~8 rows (approximately)
INSERT INTO `projects` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(9, 'abcd', '2024-02-13 13:48:17', '2024-02-13 13:48:17'),
	(10, 'test', '2024-02-13 14:07:29', '2024-02-13 14:07:29'),
	(11, 'dummy', '2024-02-13 14:07:42', '2024-02-13 14:07:42'),
	(12, 'dummy', '2024-02-13 14:11:07', '2024-02-13 14:11:07'),
	(13, 'dummy', '2024-02-13 14:11:26', '2024-02-13 14:11:26'),
	(14, 'test task', '2024-02-13 14:31:06', '2024-02-13 14:31:06'),
	(15, 'dummy', '2024-02-13 14:38:46', '2024-02-13 14:38:46');

-- Dumping structure for table php_test.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `hours` int DEFAULT NULL,
  `project_code` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_code` (`project_code`) USING BTREE,
  CONSTRAINT `fk_project_code` FOREIGN KEY (`project_code`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_code`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table php_test.tasks: ~1 rows (approximately)
INSERT INTO `tasks` (`id`, `name`, `hours`, `project_code`, `created_at`, `updated_at`) VALUES
	(2, 'dummy', 2, 10, '2024-02-13 15:09:17', '2024-02-13 15:09:17'),
	(3, 'juug', 4, 14, '2024-02-13 15:10:50', '2024-02-13 15:10:50');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
