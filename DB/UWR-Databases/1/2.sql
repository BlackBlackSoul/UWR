-- 2 --

SELECT pm.Name, COUNT(pm.Name) FROM SalesLT.ProductModel pm 
    INNER JOIN SalesLT.Product p
        ON pm.ProductModelID = p.ProductModelID
    GROUP BY (pm.Name)
    HAVING COUNT(pm.Name) > 1
