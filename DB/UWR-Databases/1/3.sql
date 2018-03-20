-- 3 --

SELECT a.City, COUNT(c.CustomerID), COUNT(DISTINCT c.SalesPerson) FROM SalesLT.Address a 
    INNER JOIN SalesLT.CustomerAddress ca
        ON a.AddressID = ca.AddressID
    INNER JOIN SalesLT.Customer c
        ON c.CustomerID = ca.CustomerID
GROUP BY a.City