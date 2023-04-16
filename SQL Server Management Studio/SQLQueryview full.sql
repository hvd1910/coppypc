Select * from PhongBan

CREATE INDEX IX_MaPB on PhongBan(MaPB)


DROP IX_MaPB ON PhongBan

CREATE CLUSTERED INDEX IX_MaPB on PhongBan(MaPB) WITH(FILLFACTOR = 40)



--Đặt chỉ mục (index) cho cột Tên hàng và Người đặt hàng
CREATE INDEX IX_Tenhang ON Product(TenSanPham)
CREATE INDEX IX_Nguoidathang ON Customer (MaKhachHang, Ten)

--View_KhachHang
 SELECT Ten, DiaChi, ĐT FROM Customer

 --View_SanPham
 SELECT TenSanPham, GiaBanHienTai FROM Product

 --View_KhachHang_SanPham
 
 CREATE VIEW view_sanpham AS
 SELECT od.TenDonHang, od.SoLuongMua, oi.NgayOrder,oi.MaKhachHang
 FROM OrderId oi JOIN OrderDetails AS od ON od.MaDonHang = oi.MaDonHang

 SELECT * FROM view_sanpham 
CREATE VIEW view_khachhang_sanpham AS
SELECT c.Ten, c.ĐT, sp.TenDonHang, sp.SoLuongMua, sp.NgayOrder 
FROM  Customer c JOIN view_sanpham AS sp ON c.MaKhachHang = sp.MaKhachHang








SELECT * FROM view_khachhang_sanpham 
Select * from OrderId
select * from Customer
select * from OrderDetails
select * from Product;
