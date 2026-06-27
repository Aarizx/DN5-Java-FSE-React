-- Scenario 1: Process Monthly Interest

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

INSERT INTO Accounts VALUES (101,1,'Savings',10000);
INSERT INTO Accounts VALUES (102,2,'Savings',15000);
INSERT INTO Accounts VALUES (103,3,'Current',20000);
INSERT INTO Accounts VALUES (104,4,'Savings',8000);
INSERT INTO Accounts VALUES (105,5,'Current',12000);

COMMIT;

SELECT * FROM Accounts;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;
END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM Accounts;

-- Scenario 2
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER(10,2)
);
INSERT INTO Employees VALUES (1,'John','IT',50000);
INSERT INTO Employees VALUES (2,'David','HR',40000);
INSERT INTO Employees VALUES (3,'Mary','IT',60000);
INSERT INTO Employees VALUES (4,'Alice','Finance',55000);
INSERT INTO Employees VALUES (5,'Robert','IT',70000);

COMMIT;
SELECT * FROM Employees;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_Department IN VARCHAR2,
    p_BonusPercent IN NUMBER
)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_BonusPercent / 100)
    WHERE Department = p_Department;

    COMMIT;
END;
/
BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/
SELECT * FROM Employees;

--Scenario 3

SELECT * FROM Accounts;

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_FromAccount IN NUMBER,
    p_ToAccount   IN NUMBER,
    p_Amount      IN NUMBER
)
AS
    v_Balance NUMBER;
BEGIN
    SELECT Balance
    INTO v_Balance
    FROM Accounts
    WHERE AccountID = p_FromAccount;

    IF v_Balance >= p_Amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_Amount
        WHERE AccountID = p_FromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_Amount
        WHERE AccountID = p_ToAccount;

        COMMIT;

    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
    END IF;
END;
/
BEGIN
    TransferFunds(101,102,2000);
END;
/
SELECT * FROM Accounts;