CREATE TABLE company ( 
MaSoHang varchar(5) NOT NULL PRIMARY KEY,
TenHang varchar(30) ,
DiaChi varchar (150),
DienThoai varchar(10)
)

SELECT * FROM company

INSERT INTO company(MaSoHang, TenHang, DiaChi, DienThoai)
VALUES ('A04', 'ACER', 'USA','48891'), ('A02', 'NOKIA', 'VIETNAM','686868'),('A0001', 'Xiaomi', 'China','36773')

CREATE TABLE productSP(
MaSoHang varchar(5) NOT NULL FOREIGN KEY REFERENCES company(MaSoHang),
MaSoSanPham varchar(7) NOT NULL PRIMARY KEY,
TenSanPham nvarchar (50),
MoTa nvarchar(300),
DonVi nvarchar(20),
Gia Money, 
SoLuongHienCo int
)


SELECT * FROM productSP

INSERT INTO productSP( MaSoHang, MaSoSanPham, TenSanPham, MoTa, DonVi, Gia, SoLuongHienCo)
VALUES ('A01','P1', N'Máy Tính T450', N'Máy nhập cũ', N'Chiếc', '1000', '10'),
('A01','P2', N'Điện Thoại Nokia5670', N'Hot', N'Chiếc', '200', '200'),
('A01','P3', N'Máy In Samsung 450', N'Máy in đang loại bình', N'Chiếc', '100', '10'),
('A02','P4', N'Điện Thoại 1280', N'Cục Gạch', N'Chiếc', '500', '10'),
('A03','P5', N'Điện Thoại Xiaomi C3', N'Pin Siêu Trâu ', N'Chiếc', '1000', '50')



--Hiện thị tất cả các hãng sản xuất 
SELECT TenHang FROM company

--Hiển thị tất cả các sản phẩm
SELECT TenSanPham FROM productSP

--Liệt kê danh sách hãng theo thứ thự ngược với alphabet của tên

SELECT TenHang FROM company
ORDER BY TenHang DESC

--iệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.

SELECT * FROM productSP
ORDER BY Gia DESC

--Hiển thị thông tin của hãng Asus
SELECT* FROM company
WHERE TenHang = 'Asus'

--Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
SELECT TenSanPham FROM productSP
WHERE SoLuongHienCo <= 11
 -- Liệt kê danh sách sản phẩm của hãng Asus
 SELECT TenSanPham from productSP
 WHERE MaSoHang = 'A01'

 --Số hãng sản phẩm mà cửa hàng có.
 SELECT MaSoHang, COUNT(*) [Number Hang]
 FROM company
 GROUP BY MaSoHang WITH CUBE 
--  Số mặt hàng mà cửa hàng bán.
SELECT TenSanPham, COUNT(*) [Number Spham]
FROM productSP
GROUP BY TenSanPham WITH CUBE

-- Tổng số loại sản phẩm của mỗi hãng có trong cửa hàng.

SELECT MaSoHang, COUNT(*) [Number SoHANG]
FROM productSP
GROUP BY MaSoHang 
--Tổng số đầu sản phẩm của toàn cửa hàng

SELECT SUM(SoLuongHienCo) AS "Tong So Luong" FROM productSP

--Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
ALTER TABLE productSP
ADD CONSTRAINT Check_Pice CHECK ( Gia > 0)

--Viết câu lệnh để thay đổi số điện thoại phải bắt đầu bằng 0.

ALTER TABLE company
ADD CONSTRAINT Check_phone CHECK (DienThoai LIKE '0%')

UPDATE  company
set DienThoai = '036161'

--Viết câu lệnh để thay đổi số điện thoại phải bắt đầu bằng 0.




E

--Thiết lập chỉ mục (Index) cho các cột sau: Tên hàng và Mô tả hàng để tăng hiệu suất truy vấn dữ liệu từ 2 cột này

CREATE INDEX IX_Ten_MoTa ON productSP(TenSanPham, MoTa)

--View_SanPham: với các cột Mã sản phẩm, Tên sản phẩm, Giá bán

SELECT MaSoSanPham, TenSanPham, Gia FROM productSP
--View_SanPham_Hang: với các cột Mã SP, Tên sản phẩm, Hãng sản xuất


CREATE VIEW View_SanPham_Hang AS
SELECT p.MaSoSanPham, p.TenSanPham, c.TenHang
FROM productSP p JOIN company AS c ON p.MaSoHang = c.MaSoHang


SELECT * FROM View_SanPham_Hang




SELECT * FROM productSP
SELECT * FROM company
