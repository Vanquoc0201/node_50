CREATE TABLE `Users` (
	`user_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`email` VARCHAR(255) NOT NULL UNIQUE,
	`fullname` VARCHAR(255),
	`password` VARCHAR(255),
	
	
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Users` (`email`,`fullname`,`password`) VALUES
("nvf@gmail.com","nguyen van f","1234"),
("nvg@gmail.com","nguyen van g","12345"),
("nvh@gmail.com","nguyen van h","123456"),
("nvi@gmail.com","nguyen van i","1234567"),
("nvj@gmail.com","nguyen van j","12345678")
DROP TABLE `Users`
CREATE TABLE `Restaurant` (
	`res_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`image` VARCHAR(255),
	`res_name` VARCHAR(255),
	`desc` VARCHAR(255),
	
	
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Restaurant` (`image`,`res_name`,`desc`) VALUES
("http://image6","nha hang f","tot"),
("http://image7","nha hang g","tuyet"),
("http://image8","nha hang h","ngon"),
("http://image9","nha hang i","an duoc"),
("http://image10","nha hang j","an tam")
CREATE TABLE `Rate_res` (
	`user_id` INT,
	`res_id` INT,
	`amount` INT,
	`date_rate` DATETIME,
	FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`),
	FOREIGN KEY (`res_id`) REFERENCES `Restaurant`(`res_id`) ,
	
	
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 2, 3, '2023-08-12 02:35:11'),
(2, 3, 4, '2023-09-03 08:48:44'),
(4, 7, 2, '2023-06-20 19:02:18'),
(1, 5, 7, '2023-07-05 03:01:55'),
(3, 7, 9, '2023-08-26 11:06:14'),
(4, 5, 1, '2023-08-26 11:06:14'),
(3, 6, 4, '2023-08-26 11:06:14'),
(6, 7, 2, '2023-08-26 11:06:14'),
(8, 1, 9, '2023-08-26 11:06:14'),
(9, 4, 8, '2023-08-26 11:06:14')
CREATE TABLE `Like_res` (
	`user_id` INT,
	`res_id` INT,
	`date_like` DATETIME,
	PRIMARY KEY (`user_id`,`res_id`),
	FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`),
	FOREIGN KEY (`res_id`) REFERENCES `Restaurant`(`res_id`) ,
	
	
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2023-04-05 19:51:59'),
(3, 3, '2023-06-03 21:57:56'),
(5, 4, '2022-11-30 13:05:09'),
(2, 7, '2023-03-17 04:53:24'),
(7, 6, '2023-06-17 17:54:28'),
(8, 2, '2022-12-22 05:35:31'),
(2, 1, '2023-02-17 19:44:42'),
(6, 7, '2023-09-01 16:32:38'),
(9, 1, '2023-06-22 06:06:37'),
(7, 2, '2022-10-03 06:50:25')
CREATE TABLE `Food_type` (
	`type_id` INT  PRIMARY KEY AUTO_INCREMENT,
	`type_name` VARCHAR(255),
	
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Food_type` (`type_id`, `type_name`) VALUES
(1, 'sit'),
(2, 'dolorem'),
(3, 'libero'),
(4, 'minus'),
(5, 'ipsam'),
(6, 'omnis'),
(7, 'repellat'),
(8, 'sit'),
(9, 'et'),
(10, 'explicabo')
CREATE TABLE `Food` (
	`food_id` INT  PRIMARY KEY AUTO_INCREMENT,
	`food_name` VARCHAR(255),
	`image` VARCHAR(255),
	`price` FLOAT,
	`desc` VARCHAR(255),
	`type_id` INT,
	FOREIGN KEY (`type_id`) REFERENCES `Food_type`(`type_id`),
	
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Bubo virginianus', 'http://dummyimage.com/136x100.png/ff4444/ffffff', 100, 'Uhzveeduplzgdjqpzryypjlvcfturqvtmjubemihpqnoyso', 9),
(2, 'Madoqua kirkii', 'http://dummyimage.com/242x100.png/5fa2dd/ffffff', 80, 'Tbjwngnduwkqucetaqtrjgimluiboeqketmpwluemwzjqqw', 8),
(3, 'Lamprotornis nitens', 'http://dummyimage.com/171x100.png/dddddd/000000', 31, 'Qizrhagojuegjzdxrsilhjnolnjxonnfrusoislypgloxqw', 4),
(4, 'Plegadis falcinellus', 'http://dummyimage.com/201x100.png/5fa2dd/ffffff', 4, 'Gamhnwvcanphzwgfjuynpzfjmwziqaaqzjwpreirnpxlkhn', 9),
(5, 'Panthera leo persica', 'http://dummyimage.com/230x100.png/dddddd/000000', 90, 'Jplekderdgfoglhicmtowdrdhqqbhodbelwvgdfwkfbggry', 1),
(6, 'Meles meles', 'http://dummyimage.com/211x100.png/cc0000/ffffff', 88, 'Ieffxecwwpxhcaexaaasdvvknwhgkkdjygjcreqvanhyqke', 5),
(7, 'Bison bison', 'http://dummyimage.com/208x100.png/cc0000/ffffff', 92, 'Ziegykvqampdkiitlixhkbtcqzaqxrpunaxbvrtanrdusgz', 7),
(8, 'Sceloporus magister', 'http://dummyimage.com/157x100.png/5fa2dd/ffffff', 86, 'Disowabhnsznyucnjjdjutnhvoqihjodvueflztdxohbadu', 3),
(9, 'Cynictis penicillata', 'http://dummyimage.com/227x100.png/cc0000/ffffff', 65, 'Ufwbelwpwnntztjykfpkbifyzvfkscqpkebxdciniohhcrj', 7),
(10, 'Macropus fuliginosus', 'http://dummyimage.com/239x100.png/5fa2dd/ffffff', 20, 'Rofggmbyuglbhwmberyxphkewvfwudnfpgnyenctsebmyzf',10)

CREATE TABLE `Sub_food` (
	`sub_id` INT  PRIMARY KEY AUTO_INCREMENT,
	`sub_name` VARCHAR(255),
	`sub_price` FLOAT,
	`food_id` INT,
	FOREIGN KEY (`food_id`) REFERENCES `Food`(`food_id`),
	
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Damaliscus lunatus', 75, 1),
(2, 'Geochelone elegans', 5, 2),
(3, 'Coluber constrictor', 50, 3),
(4, 'Callorhinus ursinus', 3, 4),
(5, 'Bassariscus astutus', 29, 5),
(6, 'Bettongia penicillata', 80, 6),
(7, 'Papilio canadensis', 28, 7),
(8, 'Alectura lathami', 83, 8),
(9, 'Phalaropus fulicarius', 50, 9),
(10, 'Trichoglossus haematodus moluccanus', 56, 10)
CREATE TABLE `Order` (
	`user_id` INT ,
	`food_id` INT,
	`amount` INT,
	`code` VARCHAR(255),
	`arr_sub_id` VARCHAR(255),
	PRIMARY KEY (`user_id`,`food_id`),
	FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`),
	FOREIGN KEY (`food_id`) REFERENCES `Food`(`food_id`) ,
	
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 25, 'anux', 'qntzcadvwzjcmiqeyxkm'),
(2, 4, 5, 'xafe', 'fhpbsqkensiniuasknja'),
(9, 5, 9, 'qilf', 'fxlsdsjlyrdpnfzbsxkj'),
(7, 7, 33, 'vjxc', 'xplslbsnegvuxcbzlpob'),
(2, 5, 38, 'kyoc', 'tqwrprjqvmfktqkjmfbx'),
(8, 6, 25, 'dpyt', 'biqoflwyxbdwyxupslfv'),
(4, 6, 50, 'nzjb', 'thbmbyyncaejvzktolqs'),
(8, 4, 13, 'rypq', 'ccmwnfkiyhnmkcdebool'),
(10, 9, 15, 'ixvw', 'ihovrsspxvubvptnlhpv'),
(8, 9, 47, 'vrkh', 'woozcbufmzpfpbnjutnx')
*------------ Tìm ra 5 người đã like nhà hàng nhiều nhất --------------
SELECT `user_id`, COUNT(*) AS total_likes FROM `Like_res`
GROUP BY `user_id`
ORDER BY total_likes DESC
LIMIT 5;
*------------ Tìm ra 2 nhà hàng có lượt like nhiều nhất ------------
SELECT `res_id`, COUNT(*) AS total_likes FROM `Like_res`
GROUP BY `res_id`
ORDER BY total_likes DESC
LIMIT 2;
*------------------ Tìm người đã đặt hàng nhiều nhất ----------------
SELECT `user_id`, COUNT(*) AS total_orders FROM `Order`
GROUP BY `user_id`
ORDER BY total_orders DESC
LIMIT 1;
*------------------ Tìm người dùng không hoạt động ( không đặt hàng, không like, không đánh giá nhà hàng) --------------------
SELECT `Users`.user_id, `Users`.fullname FROM `Users`
LEFT JOIN `Order` ON `Users`.user_id = `Order`.user_id
LEFT JOIN `Like_res` ON `Users`.user_id = `Like_res`.user_id
LEFT JOIN `Rate_res` ON `Users`.user_id = `Rate_res`.user_id
WHERE `Order`.user_id IS NULL AND `Like_res`.user_id IS NULL AND `Rate_res`.user_id IS NULL



