-- -------------------------------------------------------------
-- TablePlus 6.7.3(640)
--
-- https://tableplus.com/
--
-- Database: mysql_baitap1
-- Generation Time: 2025-11-23 10:28:55.7060
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `food_types`;
CREATE TABLE `food_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `desc` varchar(255) NOT NULL,
  `type_id` int DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_types` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  `type_name` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` double NOT NULL,
  `code` varchar(255) NOT NULL,
  `arr_sub_id` varchar(150) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_foods`;
CREATE TABLE `sub_foods` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` float NOT NULL,
  `food_id` int DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_foods_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food_types` (`type_id`, `type_name`, `isDeleted`, `createdAt`, `updateAt`) VALUES
(1, 'Pizza', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(2, 'Burger', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(3, 'Drink', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(4, 'Sushi', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(5, 'BBQ', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(6, 'Ice Cream', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(7, 'Wraps', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(8, 'Fries', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(9, 'Noodles', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(10, 'Coffee', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41');

INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`, `isDeleted`, `createdAt`, `updateAt`) VALUES
(1, 'Pepperoni Pizza', 'pepperoni.jpg', 12.5, 'Spicy pizza', 1, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(2, 'Cheese Burger', 'cheeseburger.jpg', 8, 'Juicy burger', 2, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(3, 'Coke', 'coke.jpg', 2, 'Refreshing drink', 3, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(4, 'Salmon Sushi', 'sushi.jpg', 13.5, 'Fresh salmon', 4, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(5, 'BBQ Ribs', 'bbq.jpg', 18, 'Smoky ribs', 5, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(6, 'Vanilla Ice Cream', 'icecream.jpg', 3, 'Sweet dessert', 6, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(7, 'Chicken Wrap', 'wrap.jpg', 7.5, 'Grilled wrap', 7, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(8, 'French Fries', 'fries.jpg', 2.5, 'Crispy fries', 8, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(9, 'Beef Noodles', 'noodles.jpg', 9, 'Delicious noodles', 9, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(10, 'Cappuccino', 'coffee.jpg', 4, 'Hot coffee', 10, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `type_name`, `isDeleted`, `createdAt`, `updateAt`) VALUES
(1, 1, '2025-11-23 09:00:00', 'love', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(2, 4, '2025-11-24 09:00:00', 'love', 0, '2025-11-23 01:44:41', '2025-11-23 01:47:31'),
(3, 3, '2025-11-23 10:00:00', 'favorite', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(3, 6, '2025-11-24 09:30:00', 'favorite', 0, '2025-11-23 01:44:41', '2025-11-23 01:47:31'),
(4, 3, '2025-11-23 09:30:00', 'like', 0, '2025-11-23 01:44:41', '2025-11-23 01:47:31'),
(5, 2, '2025-11-24 10:30:00', 'love', 0, '2025-11-23 01:44:41', '2025-11-23 01:47:31'),
(5, 5, '2025-11-24 09:15:00', 'like', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(7, 7, '2025-11-24 09:45:00', 'love', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(8, 8, '2025-11-24 10:00:00', 'like', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(9, 3, '2025-11-24 10:15:00', 'favorite', 0, '2025-11-23 01:44:41', '2025-11-23 01:47:31');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `isDeleted`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 12.5, 'ORD001', '1', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(2, 2, 2, 8, 'ORD002', '2', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(3, 3, 3, 2, 'ORD003', '3', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(4, 2, 4, 13.5, 'ORD004', '4', 0, '2025-11-23 01:44:41', '2025-11-23 01:49:59'),
(5, 3, 5, 18, 'ORD005', '5', 0, '2025-11-23 01:44:41', '2025-11-23 01:50:42'),
(6, 6, 6, 3, 'ORD006', '6', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(7, 7, 7, 7.5, 'ORD007', '7', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(8, 2, 8, 2.5, 'ORD008', '8', 0, '2025-11-23 01:44:41', '2025-11-23 01:49:59'),
(9, 5, 9, 9, 'ORD009', '9', 0, '2025-11-23 01:44:41', '2025-11-23 01:49:59'),
(10, 4, 3, 4, 'ORD010', '10', 0, '2025-11-23 01:44:41', '2025-11-23 03:26:16');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `isDeleted`, `createdAt`, `updateAt`) VALUES
(1, 1, 5, '2025-11-23 10:00:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(1, 3, 4, '2025-11-24 12:00:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:45:50'),
(1, 7, 5, '2025-11-24 11:30:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:45:50'),
(2, 2, 4, '2025-11-23 11:00:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(2, 4, 4, '2025-11-24 10:00:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:45:50'),
(3, 3, 5, '2025-11-23 12:00:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(5, 2, 5, '2025-11-24 13:00:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:45:50'),
(5, 5, 5, '2025-11-24 10:30:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(6, 6, 4, '2025-11-24 11:00:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(9, 9, 5, '2025-11-24 12:30:00', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41');

INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `desc`, `isDeleted`, `createdAt`, `updateAt`) VALUES
(1, 'Pizza House', 'pizza_house.jpg', 'Best pizza', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(2, 'Burger King', 'burger_king.jpg', 'Tasty burgers', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(3, 'Drink Station', 'drink_station.jpg', 'Cold drinks', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(4, 'Sushi World', 'sushi_world.jpg', 'Fresh sushi', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(5, 'BBQ Heaven', 'bbq_heaven.jpg', 'Best BBQ', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(6, 'Ice Cream Corner', 'icecream_corner.jpg', 'Sweet treats', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(7, 'Wrap Station', 'wrap_station.jpg', 'Wraps to go', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(8, 'Fry House', 'fry_house.jpg', 'Fries & sides', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(9, 'Noodle Shop', 'noodle_shop.jpg', 'Noodles around the world', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(10, 'Coffee House', 'coffee_house.jpg', 'Specialty coffee', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41');

INSERT INTO `sub_foods` (`sub_id`, `sub_name`, `sub_price`, `food_id`, `isDeleted`, `createdAt`, `updateAt`) VALUES
(1, 'Extra Cheese', 1.5, 1, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(2, 'Bacon', 2, 2, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(3, 'Ice Cubes', 0.5, 3, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(4, 'Wasabi', 0.5, 4, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(5, 'BBQ Sauce', 1, 5, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(6, 'Chocolate Syrup', 0.8, 6, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(7, 'Extra Chicken', 1.5, 7, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(8, 'Ketchup', 0.3, 8, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(9, 'Extra Beef', 2, 9, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(10, 'Cinnamon', 0.5, 10, 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41');

INSERT INTO `users` (`user_id`, `fullName`, `email`, `password`, `isDeleted`, `createdAt`, `updateAt`) VALUES
(1, 'Nguyen Van A', 'a@example.com', '123456', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(2, 'Tran Thi B', 'b@example.com', 'abcdef', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(3, 'Le Van C', 'c@example.com', 'password', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(4, 'Nguyen Van K', 'k@example.com', '333333', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(5, 'Tran Thi L', 'l@example.com', '444444', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(6, 'Le Van M', 'm@example.com', '555555', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(7, 'Pham Van N', 'n@example.com', '666666', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(8, 'Hoang Thi O', 'o@example.com', '777777', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(9, 'Nguyen Van P', 'p@example.com', '888888', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41'),
(10, 'Tran Thi Q', 'q@example.com', '999999', 0, '2025-11-23 01:44:41', '2025-11-23 01:44:41');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;