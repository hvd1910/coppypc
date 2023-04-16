USE master
GO 
IF(DB_ID('Exam9Test') IS NOT NULL)
	DROP DATABASE Exam9Test
ELSE 
	CREATE DATABASE Exam9Test 
GO
CREATE TABLE Classes
( 
	ClassID int, 
	ClassName nvarchar(10)
)
CREATE TABLE Students
(
	RollNo varchar(6), 
	FullName nvarchar(50),
	Email varchar(100)
)

ALTER TABLE Students ALTER COLUMN RollNo varchar(6) NOT NULL

ALTER TABLE Students ADD CONSTRAINT PK_Students PRIMARY KEY(RollNo)

ALTER TABLE Students ADD CONSTRAINT UQ_StudentsEmail UNIQUE(Email)
ALTER TABLE Classes ADD CONSTRAINT UQ_ClassesClassName UNIQUE(ClassName)

ALTER TABLE Classes DROP COLUMN ClassID
ALTER TABLE Classes ADD ClassID int IDENTITY
ALTER TABLE Classes ADD CONSTRAINT PK_Classes PRIMARY KEY(ClassID)

ALTER TABLE Students ADD ClassName nvarchar(10)
ALTER TABLE Students ADD CONSTRAINT FK_Students_Classes FOREIGN KEY (ClassName) REFERENCES Class(ClassName)


INSERT INTO Classes(ClassName) VALUES ('T1107G')

INSERT INTO Students(RolNo, FullName, Email, ClassName) VALUES ('A0001', 'xyz', 'xyz@gmail.com', 'T117G')
INSERT INTO Students(RolNo, FullName, Email, ClassName) VALUES ('A0002', 'xyz', 'xyz1@gmail.com','T1107X')

ALTER TABLE Students DROP CONSTRAINT FK_Students_Classes

ALTER TABLE Students ADD CONSTRAINT FK_Students_CLasses FOREIGN KEY (ClassName) REFERENCES Classes(ClassName) ON UPDATE CASCADE


UPDATE Classes SET ClassName = 'T1111G' WHERE ClassName = 'T1107G'
SELECT * FROM Classes
SELECT * FROM Students

GO 
DROP TABLE Students
DROP TABLE Classes

GO 
CREATE TABLE Classes
(
	ClassID int IDENTITY,
	ClassName nvarchar(10),
	CONSTRAINT PK_Classes PRIMARY KEY(ClassID),
	CONSTRAINT UQ_ClassesClassName UNIQUE(ClassName)
)

CREATE TABLE Students 
(
	RollNo varchar(6) CONSTRAINT PK_Students PRIMARY KEY,
	FullName nvarchar(50) NOT NULL,
	Email varchar(100) CONSTRAINT UQ_StudentsEmail UNIQUE,
	ClassName nvarchar(10) CONSTRAINT FK_Students_Classes FOREIGN KEY REFERENCES Classes(ClassName) ON UPDATE CASCADE 

