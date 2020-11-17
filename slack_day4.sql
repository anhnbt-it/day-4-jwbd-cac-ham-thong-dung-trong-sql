CREATE DATABASE `SLACK_DAY4`;
USE `SLACK_DAY4`;

-- Tạo bảng `tbl_khoa`
CREATE TABLE `tbl_khoa` (
	`makhoa` CHAR(10) NOT NULL,
    `tenkhoa` CHAR(30) NULL DEFAULT NULL,
    `dienthoai` CHAR(10) NULL DEFAULT NULL
);

-- Tạo bảng `tbl_sinhvien`
CREATE TABLE `tbl_sinhvien` (
	`masv` INT UNSIGNED NOT NULL,
    `makhoa` CHAR(10) NOT NULL,
    `hotensv` CHAR(40) NULL DEFAULT NULL,
    `namsinh` INT NULL DEFAULT NULL,
    `quequan` CHAR(30) NULL DEFAULT NULL
);

-- Tạo bảng `tbl_giangvien`
CREATE TABLE `tbl_giangvien` (
	`magv` INT SIGNED NOT NULL,
    `makhoa` CHAR(10) NOT NULL,
    `hotengv` CHAR(30) NULL DEFAULT NULL,
    `luong` DECIMAL(5,2) NULL DEFAULT NULL
);
-- Tạo bảng `tbl_detai`
CREATE TABLE `tbl_detai` (
	`madt` CHAR(10) NOT NULL,
    `tendt` CHAR(30) NULL DEFAULT NULL,
    `kinhphi` INT NULL DEFAULT NULL,
    `noithuctap` char(30) NULL DEFAULT NULL
);
-- Tạo bảng `tbl_huongdan`
CREATE TABLE `tbl_huongdan` (
	`id` INT UNSIGNED NOT NULL,
	`masv` INT UNSIGNED NOT NULL,
    `madt` CHAR(10) NOT NULL,
    `magv` INT UNSIGNED NOT NULL,
    `ketqua` DECIMAL(5,2) NOT NULL
);

-- Thêm KHÓA cho bảng `tbl_khoa`
ALTER TABLE `tbl_khoa`
	ADD PRIMARY KEY (`makhoa`);

-- Thêm KHÓA cho bảng `tbl_sinhvien`
ALTER TABLE `tbl_sinhvien`
	ADD PRIMARY KEY (`masv`),
    ADD KEY `sinhvien_makhoa_fk` (`makhoa`);
    
-- Thêm KHÓA cho bảng `tbl_giangvien`
ALTER TABLE `tbl_giangvien`
	ADD PRIMARY KEY (`magv`),
    ADD KEY `giangvien_makhoa_fk` (`makhoa`);

-- Thêm KHÓA cho bảng `tbl_detai`
ALTER TABLE `tbl_detai`
	ADD PRIMARY KEY (`madt`);

-- Thêm ràng buộc cho bảng `tbl_huongdan`
ALTER TABLE `tbl_huongdan`
	ADD PRIMARY KEY (`id`),
    ADD KEY `huongdan_masv_fk` (`masv`),
    ADD KEY `huongdan_madt_fk` (`madt`),
    ADD KEY `huongdan_magv_fk` (`magv`);


-- Thêm ràng buộc cho bảng `tbl_sinhvien`
ALTER TABLE `tbl_sinhvien`
	ADD CONSTRAINT `sinhvien_makhoa_fk`
		FOREIGN KEY (`makhoa`)
			REFERENCES `tbl_khoa` (`makhoa`);
            
-- Thêm ràng buộc cho bảng `tbl_giangvien`
ALTER TABLE `tbl_giangvien`
	ADD CONSTRAINT `giangvien_makhoa_fk`
		FOREIGN KEY (`makhoa`)
			REFERENCES `tbl_khoa` (`makhoa`);

-- Thêm ràng buộc cho bảng `tbl_huongdan`
ALTER TABLE `tbl_huongdan`
	ADD CONSTRAINT `huongdan_masv_fk`
		FOREIGN KEY (`masv`)
			REFERENCES `tbl_sinhvien` (`masv`);
ALTER TABLE `tbl_huongdan`
	ADD CONSTRAINT `huongdan_madt_fk`
		FOREIGN KEY (`madt`)
			REFERENCES `tbl_detai` (`madt`);
ALTER TABLE `tbl_huongdan`
	ADD CONSTRAINT `huongdan_magv_fk`
		FOREIGN KEY (`magv`)
			REFERENCES `tbl_giangvien` (`magv`);
-- Yêu cầu bài tập
-- 1: Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
