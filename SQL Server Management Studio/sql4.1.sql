USE AdventureWorks2019
GO

CREATE VIEW V_Contact_Info AS
SELECT FirstName, MiddleName, LastName
FROM Person.Person
GO

SELECT * FROM V_Contac_Info
SELECT * FROM Person.Person

ALTER VIEW V_Contac_Info AS
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
GO
SELECT * FROM V_Contac_Info
GO

DROP VIEW V_Contac_Info

CREATE VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
GO 

ALTER VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName like '%B%';
GO

DROP VIEW V_Contact_Info
GO

sp_helptext 'V_Contact_Info'

sp_depends 'V_Employee_Contact'
GO

CREATE VIEW OrderRejects WITH ENCRYPTION
AS
SELECT PurchaseOrderID, ReceivedQty, RejectedQty, RejectedQty / ReceivedQty AS RejectRatio, DueDate
FROM Purchasing.PurchaseOrderDetail
WHERE RejectedQty / ReceivedQty > 0
AND DueDate > CONVERT(DATETIME, '20010630', 101);

sp_helptext 'OrderRejects'
GO

ALTER VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
WHERE p.FirstName like 'A%'
WITH CHECK OPTION
GO
SELECT * FROM V_Employee_Contact 
UPDATE V_Employee_Contact SET FirstName='Atest' WHERE LastName='Amy'
UPDATE V_Employee_Contact SET FirstName='BCD' WHERE LastName='Atest'
GO

DROP VIEW V_Contact_Info
GO

CREATE VIEW V_Contact_Info WITH SCHEMABINDING AS
SELECT FirstName, MiddleName, LastName, EmailAddress
FROM Person.Contact_Info

CREATE UNIQUE CLUSTERED INDEX IX_Contact_Email
ON V_Contact_Info(EmailAddress)
GO

exec sp_rename V_Contact_Info, V_Contact_Infomation

SELECT * FROM V_Contact_Infomation

INSERT INTO V_Contact_Infomation VALUES ('ABC', 'DEF', 'GHI', 'abc@yahoo.com')

DELETE FROM V_Contact_Infomation WHERE LastName='Gilbert' and FirstName='Guy'