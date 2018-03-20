-- 6 --

SELECT c.LastName, c.FirstName, SUM(sod.UnitPrice) FROM SalesLT.Customer c
    JOIN SalesLT.SalesOrderHeader soh 
        ON soh.CustomerID = c.CustomerID
    JOIN SalesLT.SalesOrderDetail sod
        ON sod.SalesOrderID = soh.SalesOrderID
    GROUP BY c.LastName, c.FirstName 
    HAVING SUM(sod.UnitPrice) > AVG(sod.UnitPrice)