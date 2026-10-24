# Bank Management System – Database Design

## 📌 Project Overview

The **Bank Management System** is a database project designed to manage banking operations, including bank branches, customers, account types, bank accounts, and financial transactions.

The database uses a relational model to organize data efficiently and maintain relationships between tables using primary keys and foreign keys.

## 🎯 Objectives

- Store and manage bank branch information.
- Maintain customer details.
- Manage different types of bank accounts.
- Track account balances and account status.
- Record deposits, withdrawals, and other transactions.
- Maintain data integrity through primary and foreign keys.

## 🗄️ Database Schema

The database consists of five tables:

### 1. Branches
Stores information about bank branches.

| Column | Description |
|---|---|
| `branch_id` (PK) | Unique branch identifier |
| `branch_name` | Name of the branch |
| `location` | Branch location |

### 2. Customers
Stores customer information.

| Column | Description |
|---|---|
| `customer_id` (PK) | Unique customer identifier |
| `customer_name` | Customer's full name |
| `phone` | Contact number |
| `email` | Email address |
| `address` | Residential address |

### 3. Account_Types
Stores the types of bank accounts available.

| Column | Description |
|---|---|
| `account_type_id` (PK) | Unique account type identifier |
| `account_type_name` | Type of account, such as Savings or Current |

### 4. Accounts
Stores bank account information.

| Column | Description |
|---|---|
| `account_id` (PK) | Unique account identifier |
| `branch_id` (FK) | References the `Branches` table |
| `customer_id` (FK) | References the `Customers` table |
| `account_type_id` (FK) | References the `Account_Types` table |
| `account_number` | Unique account number |
| `balance` | Current account balance |
| `opening_date` | Date the account was opened |
| `status` | Account status, such as Active or Closed |

### 5. Transactions
Stores financial transaction details.

| Column | Description |
|---|---|
| `transaction_id` (PK) | Unique transaction identifier |
| `account_id` (FK) | References the `Accounts` table |
| `transaction_type` | Type of transaction, such as Deposit or Withdrawal |
| `amount` | Transaction amount |
| `transaction_date` | Date and time of the transaction |
| `description` | Additional transaction details |

## 🔗 Entity Relationships

The database contains the following relationships:

- **Branches → Accounts:** One-to-many relationship.
- **Customers → Accounts:** One-to-many relationship.
- **Account_Types → Accounts:** One-to-many relationship.
- **Accounts → Transactions:** One-to-many relationship.

### ER Diagram

The Entity-Relationship (ER) diagram represents the tables, their attributes, primary keys, foreign keys, and relationships.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Database Concepts:** Relational modeling, primary keys, foreign keys, constraints, and relationships.

## ⚙️ Installation and Setup

### Prerequisites

- MySQL Server
- MySQL Workbench or another MySQL client

### Steps

1. Install and start MySQL Server.
2. Open MySQL Workbench or your preferred SQL client.
3. Create the database:

   ```sql
   CREATE DATABASE BankManagement;
   USE BankManagement;
   ```

4. Create the five tables using the SQL statements provided in the project.
5. Insert sample records into the tables to test the database.
6. Execute SQL queries to retrieve and manage banking data.

## 💡 Example Operations

The database can support operations such as:

- Adding new customers.
- Registering bank branches.
- Creating customer accounts.
- Retrieving account details.
- Checking account balances.
- Recording deposits and withdrawals.
- Viewing transaction histories.

## 🔒 Data Integrity

The database uses primary keys to uniquely identify records and foreign keys to maintain relationships between tables.

The `account_number` field is defined as unique to prevent duplicate account numbers.

For a production system, additional safeguards would be needed for transaction processing, balance updates, access control, and sensitive customer information.

## 🚀 Future Enhancements

- Add user authentication and role-based access control.
- Implement stored procedures for deposits and withdrawals.
- Add transaction rollback and balance validation.
- Support joint accounts.
- Generate account statements and transaction reports.
- Add indexes for frequently searched columns.
- Develop a web-based or desktop application interface.

## 👨‍💻 Project Status

**Status:** Database design completed; implementation and testing can be extended.

## 📄 License

This project is intended for educational and learning purposes. Add an appropriate license if you plan to distribute or publish the project.
