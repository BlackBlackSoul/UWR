-- 4 --

SELECT DISTINCT c.Name Category, p.Name Product FROM SalesLT.ProductCategory c
    JOIN SalesLT.ProductCategory c2
        ON c.ProductCategoryID = c2.ParentProductCategoryID
    JOIN SalesLT.Product 
        ON c.ProductCategoryID = p.productCategoryID 
