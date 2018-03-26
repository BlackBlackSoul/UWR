/*
Odczyty widmo
Wyobraź sobie taką sekwencję czynności:
   - Sesje A i B rozpoczynają swoje transakcję
   - Sesja A wykonuje UPDATE na wszystkich wierszach tabeli PRODUKTY
   - Sesja B dodaje nowy wiersz do tabeli PRODUKTY
   - Sesje A i B zatwierdzają swoje transakcje.
Czy zmiana wykonana przez sesję A będzie dotyczyła również wiersza dodanego przez sesję B? 
Nie! Dzieje się tak ponieważ  w momencie określania przez sesję A które wiersze należy zaktualizować,
nowo dodany przez sesję A wiersz dla sesji B jeszcze nie istnieje.
Sesja A zobaczy nowy wierz dopiero po zatwierdzeniu transakcji przez sesję B.
*/

--Window 1
 
BEGIN TRAN
 
SELECT TOP (6) *
FROM Person.Person
WHERE LastName LIKE 'A%'
ORDER BY LastName
 
WAITFOR DELAY '00:00:10.000'
 
SELECT TOP (6) *
FROM Person.Person
WHERE LastName LIKE 'A%'
ORDER BY LastName
 
COMMIT TRAN

 -- window 2
 
INSERT INTO [Person].[Person]([BusinessEntityID],[PersonType],[NameStyle],[Title],[FirstName],[MiddleName],[LastName]
,[Suffix],[EmailPromotion],[AdditionalContactInfo],[Demographics],[rowguid],[ModifiedDate])
 
VALUES
( 992229,'SP','0','DR','Arun','Aaaron','A',Null,0,Null,Null,NEWID(),GETDATE() )

/*
- In my first query window I have 2 select statements separated with a 10 second delay within a transaction.
I will execute this and during the execution I will execute an insert statement in query window 2.
- I flip over to query window 2 to run the insert statement.
I go back to window 1 and wait until the second SELECT statement has finished. As you can see
in the screenshot below, the second execution of the exact same query returned a different result:
the row I just inserted is visible even though the entire batch ran in a single transaction.
*/