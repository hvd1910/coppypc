CREATE DATABASE EmployeeDB
use EmployeeDB

CREATE TABLE Department (
DepartId Int Primary key,
DepartName varchar(50) not null,
Description varchar(100) not null
)

INSERT INTO Department(DepartId, DepartName, Description)
VALUES (1, 'Devoloper', 'Phat Trien Phan Mem'), 
(2, 'Marketing', 'Quang cao SEO'),
(3, 'Editer', 'Chinh sua cat ghep anh va video')


CREATE TABLE Employee (
EmpCode char(6) Primary key,
FirstName varchar(30) not null,
LastName varchar(30) not null,
Birthday smalldatetime not null,
Gender Bit Default 1,
Address varchar(100),
DepartID int Foreign key references Department(DepartId),
Salary Money
)

INSERT INTO Employee(EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary)
VALUES ('A00001','Le','Thi Huyen', '2002-10-27 15:24:32', '0', 'Cau Giay', '2', '200000'),
('A00002','Nguyen','Huy Hoang', '2000-05-10 05:12:16', '1', 'My Dinh', '1', '300000'),
('A00003','Hoang','Van Quyen', '1999-10-27 22:46:26', '1', 'Hoang Mai', '3', '400000')


UPDATE Employee 
SET Salary = Salary/100 *(100+10)


ALTER TABLE Employee 
ADD CONSTRAINT CHECK_Salary CHECK ( Salary > 0)

SELECT * FROM Department
SELECT * FROM Employee