SELECT TOP  5 
P.BusinessEntityID,
P.FirstName,
P.LastName,
RH.JobTitle,
EA.EmailAddress,
RH.HireDate
FROM 
	PERSON.Person                  AS P
INNER JOIN PERSON.EmailAddress     AS EA
	ON P.BusinessEntityID = EA.BusinessEntityID
INNER JOIN HumanResources.Employee AS RH
	ON P.BusinessEntityID = RH.BusinessEntityID

WHERE 
	JOBTITLE LIKE '%SALES%' AND OrganizationLevel BETWEEN 2 AND 4
ORDER BY 
	HIREDATE ASC;