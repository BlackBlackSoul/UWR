-- 9 --

;WITH RES AS (SELECT TOP 3 * FROM SalesLT.SalesOrderHeader ORDER BY NEWID()) 
UPDATE RES
SET CreditCardApprovalCode = N'Random'

;WITH RES AS (SELECT * FROM SalesLT.SalesOrderHeader soh 
    JOIN SalesLT.Customer c
    ON c.CustomerID = soh.CustomerID
    WHERE soh.CreditCardApprovalCode IS NOT NULL)
UPDATE RES 
SET CreditCardApprovalCode = N'X'