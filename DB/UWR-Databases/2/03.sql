CREATE OR ALTER PROCEDURE insert_user
	@PESEL char(11),
	@LAST_NAME varchar(30),
	@CITY varchar(30),
	@DATE_OF_BIRTH date
AS
	IF LEN(@PESEL) <> 11
		THROW 50000, 'PESEL is too long', 1;
	IF LEN(@LAST_NAME) <= 2
		THROW 50000, 'Last name is too short', 1;
	IF LEFT(@PESEL, 6) <> CONVERT(char(6), @DATE_OF_BIRTH, 12)
		THROW 50000, 'PESEL does not match birth date of user', 1;
	INSERT INTO Czytelnik (PESEL, LAST_NAME, CITY, DATE_OF_BIRTH)
		VALUES (@PESEL, @LAST_NAME, @CITY, @DATE_OF_BIRTH);
GO

EXEC insert_user '97110505974', 'Karol', 'Jawor', '1997-11-05'
GO

SELECT * FROM Czytelnik
GO