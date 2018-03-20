DROP TABLE IF EXISTS Imiona;
GO

DROP TABLE IF EXISTS Nazwiska;
GO

DROP TABLE IF EXISTS Dane;
GO

CREATE TABLE Imiona
(
	id_name INT IDENTITY,
	first_name VARCHAR(20),
	CONSTRAINT Imie_PK PRIMARY KEY (id_name)
);
GO

CREATE TABLE Nazwiska
(
	id_name INT IDENTITY,
	last_name VARCHAR(30),
	CONSTRAINT Nazwisko_PK PRIMARY KEY (id_name)
);
GO

CREATE TABLE Dane
(
	first_name VARCHAR(20),
	last_name VARCHAR(30),
	CONSTRAINT Dane_PK PRIMARY KEY (first_name, last_name)
);
GO

INSERT INTO Imiona
	(first_name)
VALUES
	('Karol'),
	('Jan'),
	('Marcin'),
	('Aleksander'),
	('Maciej'),
	('Oleg')
GO

INSERT INTO Nazwiska
	(last_name)
VALUES
	('Tic'),
	('Tac'),
	('Toe'),
	('Doe'),
	('Nowak'),
	('Kowalski')
GO

CREATE OR ALTER PROCEDURE generate_names
	@n int
AS
DECLARE @imiona_count int = (SELECT COUNT(id_name) FROM Imiona)
DECLARE @nazwiska_count int = (SELECT COUNT(id_name) FROM Nazwiska)
IF (@n > @imiona_count * @nazwiska_count / 2)
		THROW 50000, 'n too large', 1
DELETE FROM Dane;

DECLARE @i int = 0;
DECLARE @random_imie_id int;
DECLARE @random_nazwisko_id int;

DECLARE @first_name VARCHAR(20);
DECLARE @last_name VARCHAR(30);

WHILE @i < @n
	BEGIN
	SELECT @random_imie_id = ROUND(((@imiona_count - 2) * RAND() + 1), 0);
	SELECT @random_nazwisko_id = ROUND(((@nazwiska_count - 2) * RAND() + 1), 0);

	SET @first_name = (SELECT first_name
	FROM Imiona
	WHERE id_name = @random_imie_id);
	SET @last_name = (SELECT last_name
	FROM Nazwiska
	WHERE id_name = @random_nazwisko_id);

	BEGIN TRY
			INSERT INTO Dane
		(first_name, last_name)
	VALUES
		(@first_name, @last_name);
		END TRY
		BEGIN CATCH
			CONTINUE;
		END CATCH

	SET @i = @i + 1
END;
GO

EXEC generate_names 40
GO

SELECT *
FROM Dane
GO