CREATE DATABASE bank_db;
USE bank_db;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Balance DECIMAL(10,2),
    IsVIP BOOLEAN DEFAULT FALSE
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    InterestRate DECIMAL(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers
VALUES
(1,'John',65,12000,FALSE),
(2,'David',45,8000,FALSE),
(3,'Mary',70,15000,FALSE),
(4,'Alice',55,5000,FALSE),
(5,'Robert',62,18000,FALSE);
INSERT INTO Loans
VALUES
(101,1,10.0,DATE_ADD(CURDATE(),INTERVAL 10 DAY)),
(102,2,12.0,DATE_ADD(CURDATE(),INTERVAL 40 DAY)),
(103,3,9.0,DATE_ADD(CURDATE(),INTERVAL 20 DAY)),
(104,4,11.0,DATE_ADD(CURDATE(),INTERVAL 5 DAY)),
(105,5,13.0,DATE_ADD(CURDATE(),INTERVAL 15 DAY));
SELECT * FROM Customers;

SELECT * FROM Loans;
UPDATE Loans l
JOIN Customers c
ON l.CustomerID=c.CustomerID
SET l.InterestRate=l.InterestRate-1
WHERE c.Age>60;
SELECT * FROM Loans;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET IsVIP = TRUE
WHERE Balance > 10000;

SELECT * FROM Customers;

SET SQL_SAFE_UPDATES = 1;

SELECT
    c.CustomerID,
    c.Name,
    l.LoanID,
    l.DueDate,
    CONCAT('Reminder: Dear ', c.Name,
           ', your loan is due on ',
           DATE_FORMAT(l.DueDate, '%d-%m-%Y')) AS Reminder
FROM Customers c
JOIN Loans l
ON c.CustomerID = l.CustomerID
WHERE l.DueDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);
