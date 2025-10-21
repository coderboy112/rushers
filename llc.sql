-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.40 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for llc
CREATE DATABASE IF NOT EXISTS `llc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `llc`;

-- Dumping structure for table llc.dish
CREATE TABLE IF NOT EXISTS `dish` (
  `dish_id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.dish: ~3 rows (approximately)
INSERT INTO `dish` (`dish_id`, `dish_name`, `status`, `created_date_time`, `created_by`, `modified_date`, `modified_by`) VALUES
	(1, 'seafood pasta', 'active', '2025-10-16 23:47:44', 'chef', NULL, NULL),
	(2, 'vegetable curry', 'active', '2025-10-16 23:47:44', 'chef', NULL, NULL),
	(3, 'spicy shrimp stir fry', 'active', '2025-10-16 23:47:44', 'chef', NULL, NULL);

-- Dumping structure for table llc.inventory
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_item_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `available_quantity` float DEFAULT NULL,
  `unit_of_measurement` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cost_per_unit` bigint DEFAULT NULL,
  PRIMARY KEY (`inventory_item_id`),
  KEY `FK__items` (`item_id`),
  CONSTRAINT `FK__items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.inventory: ~0 rows (approximately)
INSERT INTO `inventory` (`inventory_item_id`, `item_id`, `available_quantity`, `unit_of_measurement`, `cost_per_unit`) VALUES
	(1, 1, 30, 'KG', 20),
	(2, 2, 5, 'KG', 500),
	(3, 3, 1, 'KG', 150);

-- Dumping structure for table llc.items
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `type_id` int NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `item_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.items: ~3 rows (approximately)
INSERT INTO `items` (`item_id`, `item_name`, `type_id`, `status`, `created_date_time`, `created_by`, `modified_date`, `modified_by`) VALUES
	(1, 'tomato', 1, 'active', '2025-10-16 23:47:44', 'chef', '2025-10-18 14:46:26', NULL),
	(2, 'shrimp', 2, 'active', '2025-10-16 23:47:44', 'chef', '2025-10-18 14:46:37', NULL),
	(3, 'cumin powder', 3, 'active', '2025-10-16 23:47:44', 'chef', '2025-10-18 14:46:43', NULL);

-- Dumping structure for table llc.item_dish_mapping
CREATE TABLE IF NOT EXISTS `item_dish_mapping` (
  `item_dish_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `dish_id` int NOT NULL,
  PRIMARY KEY (`item_dish_id`),
  KEY `item_id` (`item_id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `item_dish_mapping_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_dish_mapping_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.item_dish_mapping: ~3 rows (approximately)
INSERT INTO `item_dish_mapping` (`item_dish_id`, `item_id`, `dish_id`) VALUES
	(1, 1, 2),
	(2, 2, 1),
	(3, 3, 3);

-- Dumping structure for table llc.item_type
CREATE TABLE IF NOT EXISTS `item_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.item_type: ~3 rows (approximately)
INSERT INTO `item_type` (`type_id`, `type_name`, `status`, `created_date_time`, `created_by`, `modified_date`, `modified_by`) VALUES
	(1, 'vegetables', 'active', '2025-10-16 23:47:44', 'admin', NULL, NULL),
	(2, 'seafood', 'active', '2025-10-16 23:47:44', 'admin', NULL, NULL),
	(3, 'spices', 'active', '2025-10-16 23:47:44', 'admin', NULL, NULL);

-- Dumping structure for table llc.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL,
  `order_total_cost` decimal(10,2) DEFAULT '0.00',
  `status` enum('pending','processing','completed','cancelled') DEFAULT 'pending',
  `payment_method` enum('cash','card','bank_transfer','upi') DEFAULT 'cash',
  `placed_date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `delivery_date_time` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_number` (`order_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.orders: ~3 rows (approximately)
INSERT INTO `orders` (`order_id`, `order_number`, `order_total_cost`, `status`, `payment_method`, `placed_date_time`, `delivery_date_time`, `created_by`, `modified_date`, `modified_by`, `remarks`) VALUES
	(1, 'ORD-1001', 250.50, 'completed', 'card', '2025-10-18 15:00:53', NULL, 'admin', NULL, NULL, 'Delivered successfully'),
	(2, 'ORD-1002', 480.00, 'processing', 'upi', '2025-10-18 15:00:53', NULL, 'admin', NULL, NULL, 'Awaiting supplier confirmation'),
	(3, 'ORD-1003', 300.00, 'pending', 'cash', '2025-10-18 15:00:53', NULL, 'chef', NULL, NULL, 'Urgent restock needed');

-- Dumping structure for table llc.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) GENERATED ALWAYS AS ((`quantity` * `unit_price`)) STORED,
  `instructions` text,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.order_items: ~5 rows (approximately)
INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_id`, `supplier_id`, `quantity`, `unit_price`, `instructions`) VALUES
	(1, 1, 1, 1, 10, 5.00, 'Fresh tomatoes only'),
	(2, 1, 3, 3, 2, 25.25, 'Ground spice, fine texture'),
	(3, 2, 2, 2, 5, 40.00, 'Medium-sized shrimp'),
	(4, 3, 1, 1, 20, 5.00, 'For curry base tomorrow'),
	(5, 2, 1, 1, 2, 5.00, 'Reddish tomatoes only');

-- Dumping structure for table llc.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_type` varchar(50) DEFAULT NULL,
  `phn_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.supplier: ~3 rows (approximately)
INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_type`, `phn_no`, `email`, `status`, `created_date_time`, `created_by`, `modified_date`, `modified_by`) VALUES
	(1, 'fresh farms ltd', 'multi supplier', 'PIN001', 'contact@freshfarms.com', 'active', '2025-10-16 23:47:44', 'admin', '2025-10-19 00:17:35', NULL),
	(2, 'ocean catch', 'seafood supplier', 'PIN002', 'info@oceancatch.com', 'active', '2025-10-16 23:47:44', 'admin', NULL, NULL),
	(3, 'spice world', 'spices supplier', 'PIN003', 'sales@spiceworld.com', 'active', '2025-10-16 23:47:44', 'admin', NULL, NULL);

-- Dumping structure for table llc.supplier_type_mapping
CREATE TABLE IF NOT EXISTS `supplier_type_mapping` (
  `supplier_type_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`supplier_type_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `supplier_type_mapping_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_type_mapping_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `item_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table llc.supplier_type_mapping: ~4 rows (approximately)
INSERT INTO `supplier_type_mapping` (`supplier_type_id`, `supplier_id`, `type_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 1, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
