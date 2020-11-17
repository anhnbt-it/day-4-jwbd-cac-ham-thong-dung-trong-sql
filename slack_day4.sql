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
-- Chèn dữ liệu vào bảng `tbl_khoa`
INSERT INTO `tbl_khoa` (`makhoa`, `tenkhoa`, `dienthoai`) VALUES 
	('DIALY', 'DIA LY', '123'),
	('QLTN', 'QLTN', '321'),
    ('CNSH', 'CONG NGHE SINH HOC', '456'),
    ('TOAN', 'TOAN', '654');
SELECT * FROM `tbl_khoa`;

-- Chèn dữ liệu vào bảng `tbl_sinhvien`
INSERT INTO `tbl_sinhvien` (`masv`, `makhoa`, `hotensv`, `namsinh`, `quequan`) VALUES 
	(1, 'CNSH', 'Nguyễn Bá Tuấn Anh', '1995', 'Bắc Giang'),
    (2, 'DIALY', 'Nguyễn Bá Tùng Lâm', '2019', 'Hà Nội'),
    (3, 'QLTN', 'Nguyễn Thị Hồng', '1995', 'Thái Nguyên'),
    (4, 'TOAN', 'Nguyễn Bá Sơn', '1963', 'Bắc Giang'),
    (5, 'CNSH', 'Lê Văn Sơn', '1990', 'Lào Cai');
SELECT * FROM `tbl_sinhvien`;

-- Chèn dữ liệu vào bảng `tbl_giangvien`
INSERT INTO `tbl_giangvien` (`magv`, `makhoa`, `hotengv`, `luong`) VALUES 
	(1, 'CNSH', 'Mai Công Sơn', '500'),
    (2, 'DIALY', 'Vũ Thị Kiều Anh', '500'),
    (3, 'QLTN', 'LÊ THỊ CHÂU', '500'),
    (4, 'QLTN', 'NÔNG THỊ CHIẾN', '500');
-- Chèn dữ liệu vào bảng `tbl_detai` 
INSERT INTO `tbl_detai` (`madt`, `tendt`, `kinhphi`, `noithuctap`) VALUES
	('DETAI01', 'Đề tài phong cảnh', '100', 'Hà Nội'),
    ('DETAI02', 'Đề tài văn học', '200', 'TP. HCM'),
    ('DETAI03', 'Đề tài nghiên cứu khoa học', '300', 'Đà Nẵng');
-- Chèn dữ liệu vào bảng `tbl_huongdan`
INSERT INTO `tbl_huongdan` (`id`, `masv`, `madt`, `magv`, `ketqua`) VALUES 
	(1, 1, 'DETAI01', 1, '500'),
    (2, 2, 'DETAI02', 2, '500'),
    (3, 3, 'DETAI03', 3, '500'),
	(4, 4, 'DETAI01', 1, '100'),
    (5, 5, 'DETAI02', 1, '200');
-- Yêu cầu bài tập
-- 1: Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
SELECT `magv`, `hotengv`, `tenkhoa` 
	FROM `tbl_giangvien` 
		LEFT JOIN `tbl_khoa`
			ON `tbl_giangvien`.`makhoa` = `tbl_khoa`.`makhoa`;
-- 2: Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’
SELECT `magv`, `hotengv`, `tenkhoa`
	FROM `tbl_giangvien`
		LEFT JOIN `tbl_khoa` 
			ON `tbl_giangvien`.`makhoa` = `tbl_khoa`.`makhoa`
				WHERE `tenkhoa` = 'DIA LY' OR `tenkhoa` = 'QLTN';
-- 3: Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
SELECT `tenkhoa`, COUNT(*) AS `total`
	FROM `tbl_sinhvien`
		INNER JOIN `tbl_khoa`
			ON `tbl_sinhvien`.`makhoa` = `tbl_khoa`.`makhoa`
				WHERE `tbl_sinhvien`.`makhoa` = 'CNSH'
					GROUP BY `tbl_sinhvien`.`makhoa`;
-- 4: Đưa ra danh sách gồm mã số, họ tên và tuổi của các sinh viên khoa ‘TOAN’
SELECT `masv`, `hotensv`, `namsinh`
	FROM `tbl_sinhvien` 
		WHERE `makhoa` = 'TOAN';
-- 5: Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’
SELECT `tenkhoa`, COUNT(*) AS `total` 
	FROM `tbl_giangvien` 
		INNER JOIN `tbl_khoa` 
			ON `tbl_giangvien`.`makhoa` = `tbl_khoa`.`makhoa` 
				WHERE `tbl_giangvien`.`makhoa` = 'CNSH'
					GROUP BY `tbl_giangvien`.`makhoa`;
-- 6: Cho biết thông tin về sinh viên không tham gia thực tập
SELECT `tbl_sinhvien`.`masv`, `hotensv`, `namsinh`, `quequan` 
	FROM `tbl_sinhvien`
		LEFT JOIN `tbl_huongdan`
			ON `tbl_sinhvien`.`masv` = `tbl_huongdan`.`masv`
				WHERE `tbl_huongdan`.`masv` IS NULL;
-- 7: Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
SELECT `tbl_khoa`.`makhoa`, `tenkhoa`, COUNT(*) AS `total`
	FROM `tbl_khoa`
		INNER JOIN `tbl_giangvien` 
			ON `tbl_khoa`.`makhoa` = `tbl_giangvien`.`makhoa`
				GROUP BY `tbl_giangvien`.`makhoa`;
-- 8: Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học
SELECT `dienthoai`
	FROM `tbl_khoa` 
		INNER JOIN `tbl_sinhvien` 
			ON `tbl_khoa`.`makhoa` = `tbl_sinhvien`.`makhoa` 
				WHERE `tbl_sinhvien`.`hotensv` = 'Lê Văn Sơn';
-- 9: Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.
SELECT `tbl_huongdan`.`magv`, `tbl_giangvien`.`hotengv`, `tbl_khoa`.`tenkhoa`, COUNT(*) AS `total`
	FROM `tbl_huongdan` 
		LEFT JOIN `tbl_giangvien` 
			ON `tbl_huongdan`.`magv` = `tbl_giangvien`.`magv` 
				LEFT JOIN `tbl_khoa` 
					ON `tbl_khoa`.`makhoa` = `tbl_giangvien`.`makhoa`
						GROUP BY `tbl_huongdan`.`magv`
							HAVING `total` >= 3;
-- 10: Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
SELECT `tbl_huongdan`.`madt`, `tendt`, 
	COUNT(*) AS `total` 
		FROM `tbl_huongdan` 
			INNER JOIN `tbl_detai`.`tendt` 
				ON `tbl_huongdan`.`madt` = `tbl_detai`.`madt`
					GROUP BY `tbl_huongdan`.`madt` 
						HAVING `total` >= 2;