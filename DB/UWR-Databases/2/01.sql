GO
DROP FUNCTION dbo.findUser;
GO
CREATE FUNCTION dbo.findUser (@days_count int)  
RETURNS TABLE AS RETURN   
(  
    SELECT c.PESEL, COUNT(w.Egzemplarz_ID) AS LiczbaEgzemplarzy FROM Czytelnik c
		JOIN Wypozyczenie w
			ON c.Czytelnik_ID = w.Czytelnik_ID
		WHERE w.Liczba_Dni >= @days_count
	GROUP BY c.PESEL
);
GO
SELECT * FROM dbo.findUser (40)
GO