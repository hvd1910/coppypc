CREATE TABLE ProductDT(
MaKhachHang int NOT NULL PRIMARY KEY,
TenKhanhHang nvarchar(50),
SoCMND varchar(9),
DiaChi nvarchar(50)
)

INSERT INTO ProductDT(MaKhachHang, TenKhanhHang, SoCMND, DiaChi)
VALUES ('111', N'Nguyễn Nguyệt Nga', '123456789', N'Hà Nội'),
('222', N'Nguyễn Hoàng', '123456666', N'Hà Nội'),
('333', N'Hiếu Nguyễn', '123456999', N'HCM')
		


CREATE TABLE ContactSDT(
MaKhachHang int FOREIGN KEY REFERENCES ProductDT(MaKhachHang),
SoThueBao int NOT NULL PRIMARY KEY,
LoaiThueBao nvarchar(20),
NgayDangKy Date,
)

INSERT INTO ContactSDT(MaKhachHang, SoThueBao, LoaiThueBao, NgayDangKy)
VALUES('222', '0123456789', N'Trả Trước', '11/12/02'), 
('111', '123456288', N'Trả Trước', '12/11/02'),
('222', '123456868', N'Trả Trước', '12/05/02'),
('333', '123456868', N'Trả Trước', '28/06/02')


--Hiển thị toàn bộ thông tin của các khách hàng của công ty.
SELECT * FROM ProductDT

--Hiển thị toàn bộ thông tin của các số thuê bao của công ty.
SELECT * FROM ContactSDT

--Hiển thị toàn bộ thông tin của thuê bao có số: 0123456789
SELECT * FROM ContactSDT
WHERE SoThueBao = '123456789'

--Hiển thị thông tin về khách hàng có số CMTND: 123456789
SELECT * FROM ProductDT
WHERE SoCMND = '123456789'

--Hiển thị các số thuê bao của khách hàng có số CMTND:123456789
SELECT SoThueBao FROM ProductDT p INNER JOIN  ContactSDT AS c
ON p.MaKhachHang = c.MaKhachHang
WHERE SoCMND = '123456789'


-- Liệt kê các thuê bao đăng ký vào ngày 12/12/09
SELECT * FROM ContactSDT
WHERE NgayDangKy = '12/12/09'

--Liệt kê các thuê bao có địa chỉ tại Hà Nội
SELECT SoThueBao FROM ProductDT p INNER JOIN  ContactSDT AS c
ON p.MaKhachHang = c.MaKhachHang
WHERE DiaChi = N'Hà Nội'

--Tổng số khách hàng của công ty.
SELECT MaKhachHang, COUNT(*) [Number client]
FROM ProductDT
GROUP BY MaKhachHang WITH CUBE


-- Tổng số thuê bao của công ty.

SELECT SoThueBao, COUNT(*) [Number Phone]
FROM ContactSDT
WHERE NgayDangKy = '2002-11-12'
GROUP BY SoThueBao WITH CUBE

 --Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao.
 SELECT TenKhanhHang, SoCMND, DiaChi, SoThueBao, LoaiThueBao, NgayDangKy FROM ProductDT p INNER JOIN  ContactSDT AS c
ON p.MaKhachHang = c.MaKhachHang


--Viết câu lệnh để thay đổi trường ngày đăng ký là not null.

alter table ContactSDT
ALTER COLUMN NgayDangKy Date NOT NULL 

-- Viết câu lệnh để thay đổi trường ngày đăng ký là trước hoặc bằng ngày hiện tại.

Update ContactSDT Set NgayDangKy = '10-12-22'

--Viết câu lệnh để thay đổi số điện thoại phải bắt đầu 09

alter table ContactSDT
 ADD CONSTRAINT SoThueBao Check_SDT CHECK (SoThueBao like '09%' ) 
 
 
 -- Viết câu lệnh để thêm trường số điểm thưởng cho mỗi số thuê bao

 alter table ContactSDT
 ADD DiemThuong int;
 -- Đặt chỉ mục (Index) cho cột Tên khách hàng của bảng chứa thông tin khách hàng

 CREATE INDEX IX_TenKhachHang ON ProductDT(TenKhanhHang)

 --◦ View_KhachHang: Hiển thị các thông tin Mã khách hàng, Tên khách hàng, địa chỉ

 SELECT MaKhachHang, TenKhanhHang, DiaChi FROM ProductDT

 create VIEW View_KhachHang_ThueBao AS
select p.MaKhachHang, p.TenKhanhHang, c.SoThueBao
 FROM ProductDT AS p  JOIN  ContactSDT AS c
ON p.MaKhachHang = c.MaKhachHang

SELECT * from View_KhachHang_ThueBao

SELECT * FROM ProductDT
SELECT * FROM ContactSDT