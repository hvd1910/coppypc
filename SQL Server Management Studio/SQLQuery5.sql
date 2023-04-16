CREATE TABLE PhongBan (
MaPB varchar(7) PRIMARY KEY,
TenPB nvarchar(50)
)

INSERT INTO PhongBan(MaPB, TenPB)
VAlUES ('ABC11','A11'), ('ABC22','A11'), ('ABC33','A22'), ('ABC44','A22'), ('ABC55','A11')



SELECT * FROM PhongBan

CREATE TABLE NhanVien (
MaNV varchar(7) PRIMARY KEY, 
TenNV nvarchar(50), 
NgaySinh DateTime ,
SoCMND char(9),
GioiTinh char(1),
DiaChi nvarchar (100),
NgayVaoLam Datetime,
MaPB varchar(7),
CONSTRAINT fk Foreign Key (MaPB) REFERENCES PhongBan(MaPB)
)



INSERT INTO  NhanVien(MaPB,TenNV,MaNV)
VALUES ('ABC55', 'Sy Duc','A26')

SELECT * FROM NhanVien



CREATE TABLE LuongDA (
MaDA varchar(8) Primary Key,
MaNV varchar(7) UNIQUE , 
NgayNhan Datetime,
SoTien Money CHECK (SoTien > 0),
CONSTRAINT fk_nv Foreign Key (MaNV) REFERENCES Nhanvien(MaNV)
)

SELECT * FROM LuongDA


INSERT INTO LuongDA (MaDA, MaNV, SoTien)
VALUES ('I1', 'A26','2000'), ('I2', 'A25','22000'), ('I3', 'A24','3000'), ('I4', 'A23','2000'), ('I5', 'A11','6000')



