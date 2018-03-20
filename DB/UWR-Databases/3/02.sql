DROP TABLE IF EXISTS SalaryHistory;
GO

DROP TABLE IF EXISTS Employees;
GO

CREATE TABLE Employees(
	ID INT IDENTITY PRIMARY KEY,
	SalaryGross DECIMAL(15,2)
);
GO

CREATE TABLE SalaryHistory(
	ID INT IDENTITY PRIMARY KEY,
	EmployeeID INT FOREIGN KEY REFERENCES Employees(ID),
	YearNo INT,
	MonthNo INT,
	SalaryNet DECIMAL(15, 2),
	SalaryGross DECIMAL(15, 2)
);
GO

INSERT INTO Employees (SalaryGross) VALUES
(1000),
(2500),
(7000),
(6000),
(9999.99),
(1000.11);
GO


CREATE OR ALTER PROCEDURE GetSalariesForGivenMonth
	@month INT
AS
	DECLARE @income_tax_threshold DECIMAL(15, 2) = 85528.00;
	DECLARE @last_known_month INT = ISNULL((SELECT MAX(MonthNo) FROM SalaryHistory), 0);
	DECLARE @SalarySums TABLE(
		EmployeeID INT,
		SalaryGrossSum DECIMAL(10, 2) DEFAULT 0.0
	);
	IF (@last_known_month = 0)
		INSERT INTO @SalarySums (EmployeeID)
			SELECT ID FROM Employees;
	ELSE
		INSERT INTO @SalarySums
			SELECT EmployeeID, SUM(SalaryGross)
			FROM SalaryHistory
			WHERE YearNo = YEAR(GETDATE()) AND MonthNo < @month
			GROUP BY EmployeeID;


	DECLARE c CURSOR FOR
		SELECT * FROM @SalarySums;
	OPEN c;
		DECLARE
			@EmployeeID INT,
			@SalaryGrossSum DECIMAL(15, 2),
			@SalaryGross DECIMAL(15, 2),
			@SalaryNet DECIMAL(15, 2),
			@current_month INT,
			@tax_cut_lower DECIMAL(15,2)=0.82,
			@tax_cut_upper DECIMAL(15,2)=0.68;

		FETCH NEXT FROM c INTO @EmployeeID, @SalaryGross;
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			SET @SalaryGross = (SELECT SalaryGross FROM Employees WHERE ID=@EmployeeID);
			SET @SalaryGrossSum = (SELECT SalaryGrossSum FROM @SalarySums WHERE EmployeeID=@EmployeeID);
			SET @current_month = @last_known_month + 1

			WHILE (@current_month <= @month)
			BEGIN
				IF (@SalaryGrossSum > @income_tax_threshold)
					SET @SalaryNet = @SalaryGross * @tax_cut_upper
				ELSE IF (@SalaryGrossSum + @SalaryGross <= @income_tax_threshold)
					SET @SalaryNet = @SalaryGross * @tax_cut_lower
				ELSE
					SET @SalaryNet = (@income_tax_threshold - @SalaryGrossSum) * @tax_cut_lower
						+ (@SalaryGrossSum + @SalaryGross - @income_tax_threshold) * @tax_cut_upper;
				SET @SalaryGrossSum = @SalaryGrossSum + @SalaryGross

				INSERT INTO SalaryHistory
					(EmployeeID, YearNo, MonthNo, SalaryNet, SalaryGross) VALUES
					(@EmployeeID, YEAR(GETDATE()), @current_month, @SalaryNet, @SalaryGross);

					SET @current_month = @current_month + 1
			END
			FETCH NEXT FROM c INTO @EmployeeID, @SalaryGross;
		END
	CLOSE c;
	DEALLOCATE c;
GO

EXEC GetSalariesForGivenMonth 3;
GO

SELECT * FROM SalaryHistory 
	ORDER BY EmployeeID ASC, MonthNo ASC;
GO