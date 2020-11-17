CREATE DATABASE `baitap4_db`;
-- Tạo bảng `students`
CREATE TABLE `students` (
	`id` INT UNSIGNED NOT NULL,
    `ten` VARCHAR(50) NOT NULL,
    `tuoi` TINYINT NULL DEFAULT NULL,
    `khoahoc` VARCHAR(10) NULL DEFAULT NULL,
    `sotien` DECIMAL(10,2) NULL DEFAULT NULL
);