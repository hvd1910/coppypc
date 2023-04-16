CREATE TABLE User_4(
MaNguoiDung int NOT NULL PRIMARY KEY,
TenNguoiDung nvarchar(50),
MaLoaiSanPham varchar(7) not null Unique
)


CREATE TABLE product_4(
MaLoaiSanPham varchar(7) not null FOREIGN KEY REFERENCES User_4(MaLoaiSanPham),
MaSanPham varchar(10) NOT NULL PRIMARY KEY,
TenSanPham nvarchar(50),
NgaySanXuat Date
)

insert User_4(MaNguoiDung, TenNguoiDung, MaLoaiSanPham)
values('111',N'Nguyễn Văn A', 'A111'),('222',N'Nguyễn Văn B', 'A222'), ('333',N'Nguyễn Văn C', 'A333')

insert product_4(MaLoaiSanPham, MaSanPham, TenSanPham, NgaySanXuat)
values ('A111', 'C1', N'Máy Tính Xách Tay', '12-11-04'),
('A111', 'C2', N'Điện ThoạiMáy Tính Xách Tay', '12-11-04'),
('A222', 'C3', N'Đồng Hồ', '12-11-03'),
	   ('A333', 'C5', N'Tai Nghe', '12-11-04'),
	   ('A111', 'C6', N'LapTop', '12-11-04')
	  







SELECT * FROM User_4
SELECT * FROM product_4

INSERT INTO 