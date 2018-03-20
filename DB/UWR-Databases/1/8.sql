-- 8 --

ALTER TABLE SalesLT.Customer
ADD 
     CreditCardNumber2 int DEFAULT 0 NOT NULL
     CONSTRAINT CHK_CreditCardNumber2 CHECK (CreditCardNumber2 >= 0)  