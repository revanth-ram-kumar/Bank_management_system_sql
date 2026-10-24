CREATE DATABASE BankingDB;

USE BankingDB;
SELECT DATABASE();
-- 1. Branches table
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

ALTER TABLE Branches
ADD COLUMN ifsc_code VARCHAR(20) NOT NULL DEFAULT '';

select * from Branches;

-- 2. Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);

-- 3. Account types table
CREATE TABLE Account_Types (
    account_type_id INT PRIMARY KEY,
    account_type_name VARCHAR(50) NOT NULL
);

-- 4. Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    branch_id INT NOT NULL,
    customer_id INT NOT NULL,
    account_type_id INT NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    opening_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',

    FOREIGN KEY (branch_id)
        REFERENCES Branches(branch_id),

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    FOREIGN KEY (account_type_id)
        REFERENCES Account_Types(account_type_id),

    CHECK (balance >= 0),
    CHECK (status IN ('Active', 'Inactive'))
);

-- 5. Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATE NOT NULL,
    description VARCHAR(255),

    FOREIGN KEY (account_id)
        REFERENCES Accounts(account_id),

    CHECK (amount > 0),
    CHECK (
        transaction_type IN ('Deposit', 'Withdrawal', 'Transfer')
    )
);

-- Insert values to the tables
INSERT INTO Branches VALUES (1,'MG Road','Bengaluru','IFSC001'),(2,'Banjara
Hills','Hyderabad','IFSC002'),(3,'Governorpet','Vijayawada','IFSC003'),(4,'Dwaraka
Nagar','Vizag','IFSC004'),(5,'Brodipet','Guntur','IFSC005');
INSERT INTO Branches (branch_id, branch_name, location, ifsc_code)
VALUES
(6, 'Nellore Branch', 'Nellore', 'IFSC006'),
(7, 'Kurnool Branch', 'Kurnool', 'IFSC007'),
(8, 'Ongole Branch', 'Ongole', 'IFSC008'),
(9, 'Warangal Branch', 'Warangal', 'IFSC009'),
(10, 'Chennai Branch', 'Chennai', 'IFSC010');
select * from Branches;

INSERT INTO Customers VALUES
(1,'Aarav','9000000001','aarav@mail.com','Bengaluru'),(2,'Bhavya','9000000002','bhavya@
mail.com','Hyderabad'),(3,'Charan','9000000003','charan@mail.com','Vijayawada'),(4,'Deep
ika','9000000004','deepika@mail.com','Vizag'),(5,'Esha','9000000005','esha@mail.com','Gu
ntur'),(6,'Farhan','9000000006','farhan@mail.com','Nellore'),(7,'Gopi','9000000007','gopi@
mail.com','Kurnool'),(8,'Hari','9000000008','hari@mail.com','Ongole'),(9,'Isha','900000000
9','isha@mail.com','Warangal'),(10,'John','9000000010','john@mail.com','Chennai');
SELECT * FROM CUstomers;

INSERT INTO Account_Types VALUES (1,'Savings'),(2,'Current');
select * from account_types;

INSERT INTO Accounts VALUES
(101,1,1,1,'100000001',25000,'2025-01-01','Active'),
(102,2,2,1,'100000002',50000,'2025-01-02','Active'),
(103,2,2,2,'200000003',120000,'2025-01-03','Active'),
(104,3,3,1,'100000004',35000,'2025-01-04','Active'),
(105,4,4,1,'100000005',65000,'2025-01-05','Active'),
(106,4,4,2,'200000006',150000,'2025-01-06','Active'),
(107,5,5,2,'200000007',90000,'2025-01-07','Active'),
(108,6,1,1,'100000008',18000,'2025-01-08','Inactive'),
(109,7,2,1,'100000009',27000,'2025-01-09','Active'),
(110,8,3,2,'200000010',78000,'2025-01-10','Active'),
(111,9,4,1,'100000011',45000,'2025-01-11','Active'),
(112,9,4,2,'200000012',99000,'2025-01-12','Active'),
(113,10,5,1,'100000013',60000,'2025-01-13','Active'),
(114,1,1,2,'200000014',85000,'2025-01-14','Active'),
(115,3,3,2,'200000015',110000,'2025-01-15','Active');
select * from accounts;

INSERT INTO Transactions VALUES
(1001,101,'Deposit',1000,'2025-07-01','Sample Deposit'),
(1002,102,'Withdrawal',6000,'2025-07-02','Sample Withdrawal'),
(1003,103,'Transfer',11000,'2025-07-03','Sample Transfer'),
(1004,104,'Deposit',16000,'2025-07-04','Sample Deposit'),
(1005,105,'Withdrawal',21000,'2025-07-05','Sample Withdrawal'),
(1006,106,'Transfer',26000,'2025-07-06','Sample Transfer'),
(1007,107,'Deposit',31000,'2025-07-07','Sample Deposit'),
(1008,108,'Withdrawal',36000,'2025-07-08','Sample Withdrawal'),
(1009,109,'Transfer',41000,'2025-07-09','Sample Transfer'),
(1010,110,'Deposit',46000,'2025-07-10','Sample Deposit'),
(1011,111,'Withdrawal',1000,'2025-07-11','Sample Withdrawal'),
(1012,112,'Transfer',6000,'2025-07-12','Sample Transfer'),
(1013,113,'Deposit',11000,'2025-07-13','Sample Deposit'),
(1014,114,'Withdrawal',16000,'2025-07-14','Sample Withdrawal'),
(1015,115,'Transfer',21000,'2025-07-15','Sample Transfer'),
(1016,101,'Deposit',26000,'2025-07-16','Sample Deposit'),
(1017,102,'Withdrawal',31000,'2025-07-17','Sample Withdrawal'),
(1018,103,'Transfer',36000,'2025-07-18','Sample Transfer'),
(1019,104,'Deposit',41000,'2025-07-19','Sample Deposit'),
(1020,105,'Withdrawal',46000,'2025-07-20','Sample Withdrawal'),
(1021,106,'Transfer',1000,'2025-07-21','Sample Transfer'),
(1022,107,'Deposit',6000,'2025-07-22','Sample Deposit'),
(1023,108,'Withdrawal',11000,'2025-07-23','Sample Withdrawal'),
(1024,109,'Transfer',16000,'2025-07-24','Sample Transfer'),
(1025,110,'Deposit',21000,'2025-07-25','Sample Deposit'),
(1026,111,'Withdrawal',26000,'2025-07-26','Sample Withdrawal'),
(1027,112,'Transfer',31000,'2025-07-27','Sample Transfer'),
(1028,113,'Deposit',36000,'2025-07-28','Sample Deposit'),
(1029,114,'Withdrawal',41000,'2025-07-29','Sample Withdrawal'),
(1030,115,'Transfer',46000,'2025-07-30','Sample Transfer');
select * from Transactions;



-- 1. List all customer details
SELECT * FROM Customers;

-- 2. Display all active bank accounts
SELECT *
FROM Accounts
WHERE status = 'Active';

-- 3. Change an account status from Active to Inactive
UPDATE Accounts
SET status = 'Inactive'
WHERE account_id = 101
  AND status = 'Active';
  
-- 4. Display customer names with account numbers and account types
SELECT
    c.customer_name,
    a.account_number,
    at.account_type_name
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
JOIN Account_Types at
    ON a.account_type_id = at.account_type_id;
    
    
-- 5. Display account number, branch name, and branch city
SELECT
    a.account_number,
    b.branch_name,
    b.location AS branch_city
FROM Accounts a
JOIN Branches b
    ON a.branch_id = b.branch_id;
    
    
-- 6. Find customers with the highest account balance
SELECT
    c.customer_name,
    a.account_number,
    a.balance
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
WHERE a.balance = (
    SELECT MAX(balance)
    FROM Accounts
);


-- 7. Concatenate customer name with account number
SELECT CONCAT(
    c.customer_name, ' - ', a.account_number
) AS customer_account
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id;


-- Example format: Aarav - 100000001.
-- 8. Display the ceiling and floor of every transaction amount
SELECT
    transaction_id,
    amount,
    CEILING(amount) AS ceiling_value,
    FLOOR(amount) AS floor_value
FROM Transactions;


-- 9. Find the absolute difference between opening balance and current balance


-- 10. Display all customers and the branches where they hold accounts
SELECT
    c.customer_name,
    a.account_number,
    at.account_type_name AS account_type,
    b.branch_name,
    b.location AS branch_city
FROM Customers c
LEFT JOIN Accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN Account_Types at
    ON a.account_type_id = at.account_type_id
LEFT JOIN Branches b
    ON a.branch_id = b.branch_id;

-- 11. Calculate total deposits by branch
SELECT
    b.branch_name,b.branch_id,
    SUM(t.amount) AS total_deposits
FROM Branches b
JOIN Accounts a
    ON b.branch_id = a.branch_id
JOIN Transactions t
    ON a.account_id = t.account_id
WHERE t.transaction_type = 'Deposit'
GROUP BY b.branch_id, b.branch_name;

-- 12. Find the total balance available across all accounts.
select SUM(balance) AS total_balance from Accounts;

-- 13. Find the highest, lowest, and average account balance
SELECT
    MAX(balance) AS highest_balance,
    MIN(balance) AS lowest_balance,
    ROUND(AVG(balance), 2) AS average_balance
FROM Accounts;

-- 14. Calculate total deposits and withdrawals
SELECT
    SUM(CASE
        WHEN transaction_type = 'Deposit' THEN amount
        ELSE 0
    END) AS total_deposits,
    SUM(CASE
        WHEN transaction_type = 'Withdrawal' THEN amount
        ELSE 0
    END) AS total_withdrawals
FROM Transactions;

-- 15. Show branch-wise customer count
-- This counts distinct customers who have accounts in each branch.
SELECT
    b.branch_name,
    COUNT(DISTINCT a.customer_id) AS customer_count
FROM Branches b
LEFT JOIN Accounts a
    ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name;

-- 16. Count Savings and Current accounts
SELECT
    at.account_type_name,
    COUNT(a.account_id) AS account_count
FROM Account_Types at
LEFT JOIN Accounts a
    ON at.account_type_id = a.account_type_id
GROUP BY at.account_type_id, at.account_type_name;

-- 17. Find customers who own more than one account
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(a.account_id) AS total_accounts
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(a.account_id) > 1;

-- 18. Find the latest transaction for each account
SELECT t.*
FROM Transactions t
WHERE t.transaction_date = (
    SELECT MAX(t2.transaction_date)
    FROM Transactions t2
    WHERE t2.account_id = t.account_id
);

-- 19. Find the customer(s) having the highest account balance
SELECT
    c.customer_id,
    c.customer_name,
    a.account_number,
    a.balance
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id
WHERE a.balance = (
    SELECT MAX(balance)
    FROM Accounts
);

-- 20. Display accounts whose balance exceeds the average balance
SELECT
    account_id,
    account_number,
    balance
FROM Accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM Accounts
);

-- 21. Show monthly transaction totals with month name and rounded total
SELECT
    YEAR(transaction_date) AS transaction_year,
    MONTHNAME(transaction_date) AS month_name,
    ROUND(SUM(amount), 2) AS monthly_total
FROM Transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date),
    MONTHNAME(transaction_date)
ORDER BY
    transaction_year,
    MONTH(transaction_date);

-- 22. Find customers who have never made any transaction
SELECT
    c.customer_id,
    c.customer_name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Accounts a
    JOIN Transactions t
        ON a.account_id = t.account_id
    WHERE a.customer_id = c.customer_id
);

-- 23. Display inactive accounts
SELECT *
FROM Accounts
WHERE status = 'Inactive';

-- 24. List the top 5 accounts by balance
SELECT
    account_id,
    account_number,
    balance
FROM Accounts
ORDER BY balance DESC
LIMIT 5;

-- 25.COUNT TRANSCATION BY TYPE
SELECT  transaction_type,count(*) AS transcation_count
FROM Transactions
GROUP BY transaction_type;

-- 26. Generate monthly transaction summaries
-- This version provides transaction count, deposits, withdrawals, and total recorded transaction amounts for each month.
SELECT
    YEAR(transaction_date) AS transaction_year,
    MONTHNAME(transaction_date) AS month_name,
    COUNT(*) AS transaction_count,
    SUM(CASE
        WHEN transaction_type = 'Deposit' THEN amount
        ELSE 0
    END) AS total_deposits,
    SUM(CASE
        WHEN transaction_type = 'Withdrawal' THEN amount
        ELSE 0
    END) AS total_withdrawals,
    SUM(CASE
        WHEN transaction_type = 'transfer' THEN amount
        ELSE 0
    END) AS total_transfers,
    ROUND(SUM(amount), 2) AS total_transaction_amount
FROM Transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date),
    MONTHNAME(transaction_date)
ORDER BY
    transaction_year,
    MONTH(transaction_date);
    
-- 27. Display account balances branch-wise
SELECT
    b.branch_name,
    b.location AS branch_city,
    COUNT(a.account_id) AS account_count,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM Branches b
LEFT JOIN Accounts a
    ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name, b.location;

-- 28. Display customer names in uppercase with rounded account balance
SELECT
    UPPER(c.customer_name) AS customer_name,
    a.account_number,
    ROUND(a.balance, 0) AS rounded_balance
FROM Customers c
JOIN Accounts a
    ON c.customer_id = a.customer_id;
    
-- 29. Create a view for active accounts with customer and branch details
CREATE OR REPLACE VIEW Active_Account_Details AS
SELECT
    a.account_id,
    a.account_number,
    c.customer_id,
    c.customer_name,
    at.account_type_name,
    a.balance,
    a.opening_date,
    a.status,
    b.branch_name,
    b.location AS branch_city,
    b.ifsc_code
FROM Accounts a
JOIN Customers c
    ON a.customer_id = c.customer_id
JOIN Account_Types at
    ON a.account_type_id = at.account_type_id
JOIN Branches b
    ON a.branch_id = b.branch_id
WHERE a.status = 'Active';

SELECT * FROM Active_Account_Details;

-- Task 30: Transfer ₹10,000 between two accounts
-- This example transfers ₹10,000 from account 101 to account 102. The procedure checks the available balance and rolls back if the transfer cannot be completed.
CALL Transfer_Money(101, 102, 10000.00);

SELECT account_id, account_number, balance
FROM Accounts
WHERE account_id IN (101, 102);

-- Task 31: Procedure to display accounts for a customer
CALL Get_Customer_Accounts(1);

-- Task 32: Procedure to display transactions for an account
CALL Get_Account_Transactions(101);

-- Task 33: Create a trigger to log new transactions
-- First, create the log table:
CREATE TABLE IF NOT EXISTS Transaction_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATE NOT NULL,
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Transaction_Log;
INSERT INTO Transactions VALUES
(1031,101,'Deposit',1000,'2025-07-01','Sample Transfer');


-- Task 34: Create a trigger to prevent negative account balances

UPDATE Accounts
SET balance = -500
WHERE account_id = 101;