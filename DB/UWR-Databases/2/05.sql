CREATE OR ALTER PROCEDURE books
	@TITLE varchar(300) = null,
	@AUTHOR varchar(200) = null,
	@ESTABLISH_YEAR int = null
AS
	DECLARE @sql nvarchar(MAX);
	DECLARE @paramlist nvarchar(4000);
	DECLARE @n1 char(2) = char(13) + char(10);

	SELECT @sql =
		'SELECT e.* ' +
		'FROM Egzemplarz AS e ' +
		'INNER JOIN Ksiazka AS k ON e.Ksiazka_ID = k.Ksiazka_ID ' +
		'WHERE 1 = 1 ';

	IF @TITLE IS NOT NULL
		SELECT @sql = @sql + 'AND k.TITLE = @TITLE';

	IF @AUTHOR IS NOT NULL
		SELECT @sql = @sql + 'AND k.AUTHOR = @AUTHOR';

	IF @ESTABLISH_YEAR IS NOT NULL
		SELECT @sql = @sql + 'AND k.ESTABLISH_YEAR = + @ESTABLISH_YEAR';

	SELECT @paramlist =
		'@TITLE varchar(300), @AUTHOR varchar(200), @ESTABLISH_YEAR int';

	EXEC sp_executesql @sql, @paramlist, @TITLE, @AUTHOR, @ESTABLISH_YEAR;
GO

EXEC books 'Morderstwo w Orient Expressie'
