-- 10 -- 

CREATE TABLE new_employees
(  
 id_num int IDENTITY(1000,10),
 first_name varchar (20),
 last_name varchar(30)
)

INSERT new_employees
   (first_name, last_name)
VALUES  
   ('Karol', 'Test'),
   ('Jan', 'Nowak');

-- drop --
DROP TABLE new_employees

-- select --
SELECT * FROM new_employees

-- links 
-- http://www.c-sharpcorner.com/UploadFile/8911c4/different-between-scope-identity-ident-current-and-identit/
-- https://stackoverflow.com/questions/13838945/difference-among-identity-scope-identity-and-ident-current
-- https://www.codeproject.com/Articles/103610/Difference-between-IDENTITY-SCOPE-IDENTITY-IDENT-C
