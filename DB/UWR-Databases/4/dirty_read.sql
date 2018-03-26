/*
Brudny odczyt
Domyślnie inne sesje nie będą widziały zmian które wykonami a nie zatwierdzimy (jawnie lub nie).
Gdyby mogły – mielibyśmy do czynienia z brudnym odczytem
*/

-- PRE -- 
CREATE TABLE products
(
    Id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    ItemsinStock INT NOT NULL

)

INSERT into products

VALUES
    (1, 'Laptop', 12),
    (2, 'iPhone', 15),
    (3, 'Tablets', 10)

-- 1 -- 

SELECT *
FROM products

-- Transaction 1

BEGIN Tran

UPDATE products set ItemsInStock = 11
WHERE Id = 1

-- Billing the customer
WaitFor Delay '00:00:10'
Rollback Transaction

-- Transaction 2

SELECT *
FROM products
WHERE Id = 1

-- RESULT --
/*
Now, first run the first transaction, i.e.
execute the script
in the first instance of SSMS, and then immediately
execute the script
in the second instance of the SSMS.

You will see that both transactions will keep executing for 10 seconds and after that,
you will see that the value for the ‘ItemsInStock’ column for the record
with Id 1 is still 12 as shown by the second transaction.
Though the first transaction updated it to 11, waited for 10 seconds and then
rolled it back to 12, the value shown by the second transaction is 12 rather than 11.
*/