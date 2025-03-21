-- Kiểm tra version --
SELECT VERSION();

-- database
CREATE DATABASE IF NOT EXISTS db_test; -- tạo database
DROP DATABASE db_test; -- xóa database
USE db_cyber_community;
-- table template
CREATE TABLE `TABLE_TEMPLATE` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
-- table
-- PRIMARY KEY : kết hợp của UNIQUE và NULL
CREATE TABLE `Roles` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	`name` VARCHAR(255) ,
	`description` VARCHAR(255),
	`isActive` BOOL DEFAULT 1,
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Roles` (`name`, `description`) VALUES
('ROLE_ADMIN', 'Quản Trị Hệ Thống'),
('ROLE_USER', 'Người Dùng Hệ Thống')
-- Đổi kiểu 
ALTER TABLE `Roles`
MODIFY COLUMN `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT;
-- Thêm dữ liệu
INSERT INTO `Roles` (`name`,`description`) VALUES 
('ROLE_USER-VIEW','Người dùng xem')

DROP TABLE `Users` ; -- xóa table
CREATE TABLE `Users` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- mặc định luôn luôn có
	`email` VARCHAR(255) NOT NULL UNIQUE,
	`fullname` VARCHAR(255),
	`avatar` VARCHAR(255),
	`password` VARCHAR(255),
	`facebookId` VARCHAR(255) UNIQUE,
	`googleId` VARCHAR(255) UNIQUE,
	`roleId` INT NOT NULL DEFAULT 2,
	
	
	-- mặc định luôn luôn có
	`deletedBy` INT NOT NULL DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP  NULL DEFAULT NULL,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
INSERT INTO `Users` (`email`, `fullName`, `password`) VALUES
('A@gmail.com', 'Nguyen Van A', '1234'),
('B@gmail.com', 'Nguyen Van B', '1234'),
('C@gmail.com', 'Nguyen Van C', '1234'),
('D@gmail.com', 'Nguyen Van D', '1234'),
('E@gmail.com', 'Nguyen Van E', '1234')
-- Tìm 5 người đã like nhà hàng nhiều nhất (orders)
-- bước 1 : lấy ra tát cả orders
SELECT * FROM `Orders`

-- bước 2: lấy thêm thông tin user (email)
SELECT `userId`,`foodId`, `email`
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
-- nháp
SELECT `userId`,`foodId`, `email` as 'Người dùng mua', `foodName` as 'Món ăn là'
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
INNER JOIN `Foods` ON `Foods`.id = `Orders`.foodId
-- bước 3: nhóm các user Id giống nhau
-- GROUP BY là nhóm những giá trị của cột giống nhau, bắt buộc các hàng phải giống nhau
SELECT `userId`, `email`
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
GROUP BY `userId`
-- bước 4: Đếm số lượng đã được nhóm
SELECT COUNT(`userId`), `userId`, `email`
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
GROUP BY `userId`
-- bước 5: Sắp xếp giảm dần
-- DESC : giảm dần từ lớn tới thấp
-- ASC :  tăng dần từ thấp tới lớn
SELECT COUNT(`userId`) AS 'Số lần mua', `userId`, `email`
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
GROUP BY `userId`
ORDER BY `Số lần mua` DESC
-- bước 6: Giới hạn LIMIT
SELECT COUNT(`userId`) AS 'Số lần mua', `userId`, `email`
FROM `Orders`
INNER JOIN `Users` ON `Users`.id = `Orders`.userId
GROUP BY `userId`
ORDER BY `Số lần mua` DESC
LIMIT 1


