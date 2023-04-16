--Thông tin đơn hàng
create table OrderId
(
MaDonHang varchar(50),
MaKhachHang varchar (50),
NgayOrder date
)
go

select * from OrderId

insert OrderId(MaDonHang, MaKhachHang, NgayOrder)
values(125, 'A01', '2022-11-20'),(124, 'A00', '2022-11-15'),(123, 01, '2022-11-11')

--Thông tin khách hàng
create table Customer
(
MaKhachHang varchar(50),
Ten nvarchar(50),
DiaChi nvarchar (200),
ĐT varchar(12),
MaDonHang varchar(20)
)
go

select * from Customer

insert Customer(MaKhachHang, Ten, DiaChi, ĐT)
values('A00', N'Nguyễn Văn An', N'Hà Nội', '098765'), ('A01', N'Hồ Việt Đức', N'Nghệ An', '0345655'),('A00', N'HVD', N'Hà Tĩnh', '0345666')


--Thông tin chi tiết đơn hàng
create table OrderDetails
(
MaDonHang varchar(20),
TenDonHang nvarchar (50),
GiaBanLucMua money,
SoLuongMua int
)
select * from OrderDetails

insert OrderDetails(MaDonHang, TenDonHang, GiaBanLucMua, SoLuongMua)
values(123, N'Mua máy tính', '20000', 1),(125, N'Mua điện thoại', '10000', 1),(124, N'Mua đồng hồ', '5000', 1)

--Thông tin chi tiết các sản phẩm
create table Product 
(
MaSanPham varchar(20),
TenSanPham nvarchar (100),
MoTa nvarchar(50),
SoLuongTrongKho int,
GiaBanHienTai money,
)
select * from Product;

insert Product(MaSanPham, TenSanPham, MoTa, SoLuongTrongKho, GiaBanHienTai)
values(1, N'Máy Tính', N'Đẹp', 20, '20000'),(2, N'Điện Thoại', N'Nhỏ gọn', 15, '10000'),(3, N'Đồng Hồ', N'Đẹp', 15, '4500')

--Liệt kê danh sách khách hàng đã mua
select Ten
from Customer;
--Liệt kê danh sách sản phẩm của cửa hàng
select TenSanPham
from Product;
--Liệt kê các đơn đặt hàng
select * from OrderId
--Liệt kê danh sách khách hàng theo thứ tự
select Ten
from Customer
order by Ten desc
--Liệt kê danh sách sản phẩm của cửa hàng
select TenSanPham
from Product
order by TenSanPham desc
go
--Liệt kê danh sách sản phẩm mà Nguyễn Văn An đã mua
select *
from Customer as C
	inner join OrderDetails as D
	on C.Ten = D.TenDonHang
	

select * from OrderId
select * from Customer
select * from OrderDetails
select * from Product;

