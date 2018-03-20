-- 1 --

SELECT DISTINCT a.City FROM SalesLT.SalesOrderHeader soh 
    INNER JOIN SalesLT.Address a 
        ON soh.ShipToAddressID = a.AddressID
    ORDER BY a.City

-- Count number of results
-- SELECT COUNT(a.City) FROM SalesLT.SalesOrderHeader soh INNER JOIN SalesLT.Address a 
-- ON soh.ShipToAddressID = a.AddressID