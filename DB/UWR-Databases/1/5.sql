-- 5 --

SELECT c.FirstName, c.LastName, SUM(sod.UnitPriceDiscount) FROM SalesLT.SalesOrderDetail sod
    JOIN SalesLT.SalesOrderHeader soh 
        ON sod.SalesOrderID = soh.SalesOrderID
    JOIN SalesLT.Customer c
        ON soh.CustomerID = c.CustomerID 
    GROUP BY c.FirstName, c.LastName