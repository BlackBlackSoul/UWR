-- PREP -- 
BEGIN
ALTER DATABASE SQLAuthority   
SET single_user WITH ROLLBACK IMMEDIATE
DROP DATABASE SQLAuthority
END
GO
CREATE DATABASE SQLAuthority
GO
USE SQLAuthority
GO
CREATE TABLE DemoTable(
i INT
,j VARCHAR(100)
)
GO
USE SQLAuthority
GO
INSERT INTO DemoTable VALUES (1, 'ONE')
GO
INSERT INTO DemoTable VALUES (2, 'TWO')
GO
INSERT INTO DemoTable VALUES (3, 'THREE')
GO

-- READ COMMITTED --
-- S1 --
GO
BEGIN TRAN
UPDATE DemoTable
SET i = 4
WHERE i = 1

-- S2 -- 
GO
BEGIN TRAN
SELECT *
FROM   DemoTable
WHERE i = 1
-- Query in Session 2 is blocked --

-- Read Committed Snapshot-- 
ALTER DATABASE SQLAuthority
SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK IMMEDIATE
GO

-- S1 --
BEGIN TRAN
UPDATE DemoTable
SET i = 4
WHERE i = 1

-- S2 --
BEGIN TRAN
SELECT *
FROM   DemoTable
WHERE i = 1

-- Query in Session 2 shows old value (1, ONE) because current transaction is NOT committed.
-- This is the way to avoid blocking and read committed data also