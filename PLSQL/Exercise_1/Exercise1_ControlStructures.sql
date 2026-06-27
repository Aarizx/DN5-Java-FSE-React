CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER(10,2),
    IsVIP VARCHAR2(5)
);
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER(5,2),
    DueDate DATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);
INSERT INTO Customers VALUES (1,'John',65,12000,'FALSE');
INSERT INTO Customers VALUES (2,'David',45,8000,'FALSE');
INSERT INTO Customers VALUES (3,'Mary',70,15000,'FALSE');
INSERT INTO Customers VALUES (4,'Alice',55,5000,'FALSE');
INSERT INTO Customers VALUES (5,'Robert',62,18000,'FALSE');

COMMIT;
INSERT INTO Loans VALUES (101,1,10,SYSDATE+10);
INSERT INTO Loans VALUES (102,2,12,SYSDATE+40);
INSERT INTO Loans VALUES (103,3,9,SYSDATE+20);
INSERT INTO Loans VALUES (104,4,11,SYSDATE+5);
INSERT INTO Loans VALUES (105,5,13,SYSDATE+15);

COMMIT;
--Scenario 1
SELECT * FROM Loans;

BEGIN
    FOR rec IN (
        SELECT c.CustomerID,
               c.Age,
               l.InterestRate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
    )
    LOOP
        IF rec.Age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = rec.CustomerID;
        END IF;
    END LOOP;

    COMMIT;
END;
/

SELECT * FROM Loans;

--Scenario 2
SELECT * FROM Customers;

BEGIN
    FOR rec IN (
        SELECT CustomerID, Balance
        FROM Customers
    )
    LOOP
        IF rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = rec.CustomerID;
        END IF;
    END LOOP;

    COMMIT;
END;
/

SELECT * FROM Customers;

--Scenario 3

SELECT * FROM Loans;

BEGIN
    FOR rec IN (
        SELECT c.Name,
               l.DueDate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear '
            || rec.Name
            || ', your loan is due on '
            || TO_CHAR(rec.DueDate, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/