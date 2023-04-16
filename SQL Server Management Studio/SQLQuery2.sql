CREATE TABLE student2 (
StudentID int,
FullName nvarchar(300),
Email varchar(150),
Status tinyint 
);
INSERT INTO student2 (StudentID, FullName, Email, Status)
VALUE (1,'Ho Viet Duc', 'tenducql@gmail.com','');
INSERT INTO student2 (StudentID, FullName, Email, Status)
VALUE (2,'HVD', 'shinducql@gmail.com','');
INSERT INTO student2 (StudentID, FullName, Email, Status)
VALUE (3,'DVH', 'tenducql2@gmail.com','');