DROP TABLE IF EXISTS Prices;
GO

DROP TABLE IF EXISTS Products;
GO

DROP TABLE IF EXISTS ExchangeRate;
GO

CREATE TABLE Products(
	ProductID INT IDENTITY PRIMARY KEY,
	ProductName VARCHAR(50) NOT NULL
);
GO

CREATE TABLE ExchangeRate(
	Currency CHAR(3) NOT NULL PRIMARY KEY,
	PricePLN DECIMAL(10, 2)
);
GO

CREATE TABLE Prices(
	ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
	Currency CHAR(3) FOREIGN KEY REFERENCES ExchangeRate(Currency),
	Price DECIMAL(10, 2)
);
GO

INSERT INTO Products (ProductName) VALUES
	('Mountain Bike Cross'),
	('Apple MacBook Air 13'),
	('Dell XPS 13'),
	('iPhone X'),
	('LG QHD 42');
GO

INSERT INTO ExchangeRate VALUES
	('PLN', 1.00),
	('GBP', 4.82),
	('USD', 3.60),
	('CHF', 3.40);
GO

INSERT INTO Prices VALUES
	(1, 'PLN', 1500.00),
	(2, 'PLN', 4400.00),
	(3, 'PLN', 8000.00),
	(4, 'PLN', 8000.00),
	(5, 'PLN', 2500.00),
	(1, 'GBP', 0.00),
	(2, 'GBP', 0.00),
	(3, 'GBP', 0.00),
	(4, 'GBP', 0.00),
	(5, 'GBP', 0.00),
	(1, 'USD', 0.00),
	(2, 'USD', 0.00),
	(3, 'USD', 0.00),
	(4, 'USD', 0.00),
	(5, 'USD', 0.00),
	(1, 'CHF', 0.00),
	(2, 'CHF', 0.00),
	(3, 'CHF', 0.00),
	(4, 'CHF', 0.00),
	(5, 'CHF', 0.00);

GO

CREATE OR ALTER PROCEDURE Prices_status AS
SELECT * FROM Prices ORDER BY ProductID ASC;
GO

EXEC Prices_status;
GO

DECLARE c CURSOR FOR SELECT * FROM Prices;

OPEN c;

	DECLARE @ProductID INT, @Currency CHAR(3), @Price DECIMAL(10, 2);

	FETCH NEXT FROM c INTO @ProductID, @Currency, @Price;
	WHILE (@@FETCH_STATUS=0)
	BEGIN
		IF (@Currency NOT IN (SELECT Currency FROM ExchangeRate))
		BEGIN
			DELETE FROM Prices WHERE CURRENT OF c;
			FETCH NEXT FROM c INTO @ProductID, @Currency, @Price;
			CONTINUE;
		END

		UPDATE Prices SET Price=
			(SELECT Price FROM Prices WHERE ProductID=@ProductID AND Currency='PLN') *
			(SELECT PricePLN FROM ExchangeRate WHERE Currency=@Currency)
		WHERE CURRENT OF c;

		FETCH NEXT FROM c INTO @ProductID, @Currency, @Price;
	END

CLOSE c;
DEALLOCATE c;
GO

EXEC Prices_status;
GO