SELECT BusinessEntityID FROM Person.Person
WHERE BusinessEntityID >=0 AND BusinessEntityID <=200

SELECT * FROM Person.Person
WHERE BusinessEntityID BETWEEN 100 AND 200

SELECT * FROM Person.Person
WHERE FirstName LIKE '%e'

SELECT * FROM Person.Person
WHERE FirstName LIKE '[RA]%e'

SELECT * FROM Person.Person
WHERE FirstName LIKE '[RA]__e'

SELECT Person.BusinessEntityContact.* FROM 
	Person.BusinessEntityContact INNER JOIN Person.BusinessEntityAddress ON 
	Person.BusinessEntityContact.BusinessEntityID = Person.BusinessEntityAddress.BusinessEntityID
SELECT PersonID, COUNT(*) [PersonID Number]
FROM Person.BusinessEntityContact
WHERE PersonID LIKE '%2%'
GROUP BY ALL PersonID



SELECT * FROM Person.BusinessEntityContact
--GROUP BY VỚI HAVING	

SELECT PersonID, COUNT(*) [PersonID Number]
FROM Person.BusinessEntityContact
GROUP BY ALL PersonID
HAVING PersonID LIKE '%2'