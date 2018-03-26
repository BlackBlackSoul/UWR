/*
Domyślnie jeśli zatwierdzisz (jawnie lub nie) jakąś operację, inne sesje będą widziały Twoje zmiany zmiany. 
Nie jest to zależne od tego czy inna sesja ma w tej chwili trwającą transakcję czy nie. 
Nazywamy to odczytem nie dającym się powtórzyć.
Gdyby taki odczyt był zabroniony, inne sesje widziałyby zmiany dopiero po zakończeniu swoich transakcji –
o ile oczywiście mają jakieś trwające.
*/

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--REPEATABLE READ;

/*SESSION 1*/
BEGIN TRANSACTION;
SELECT TOP 5 FirstName, MiddleName, LastName, Suffix FROM Person.Person
    ORDER BY LastName;
WAITFOR DELAY '00:00:10.000';
SELECT TOP 5 FirstName, MiddleName, LastName, Suffix FROM Person.Person
    ORDER BY LastName;
COMMIT TRANSACTION;

/*SESSION 2*/
BEGIN TRANSACTION;
UPDATE Person.Person
SET Suffix = 'Junior'
WHERE LastName = 'Abbas'
AND FirstName = 'Syed';
COMMIT TRANSACTION;