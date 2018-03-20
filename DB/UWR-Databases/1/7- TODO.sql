CREATE TABLE OrdersToProcess
(
    SalesOrderID INT,
    Delayed BIT
)

MERGE OrdersToProcess AS Target
USING SalesOrderHeader AS Source
ON Target.SalesOrderID = Source.SalesOrderID
    WHEN MATCHED AND Source.ShipDate IS NULL AND Source.DueDate > GETDATE() THEN 
    INSERT (SalesOrderID, Delayed)
        VALUES(Source.SalesOrderID, 1)
    WHEN MATCHED AND Source.ShipDate IS NULL AND Source.DueDate <= GETDATE() THEN
    INSERT (SalesOrderID, Delayed)
        VALUES(Source.SalesOrderID, 0);

