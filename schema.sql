DROP DATABASE IF EXISTS GismaBankPro;
CREATE DATABASE GismaBankPro;
USE GismaBankPro;

-- 1. Branches Table
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    swift_code VARCHAR(11) UNIQUE NOT NULL
);

-- 2. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_of_birth DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Accounts Table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type ENUM('Checking', 'Savings', 'Investment') NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    status ENUM('Active', 'Closed', 'Frozen') DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id),
    CONSTRAINT chk_minimum_balance CHECK (balance >= 0)
);

-- 4. Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_account_id INT NULL,
    receiver_account_id INT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer', 'Fee') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reference_note VARCHAR(255),
    FOREIGN KEY (sender_account_id) REFERENCES Accounts(account_id) ON DELETE SET NULL,
    FOREIGN KEY (receiver_account_id) REFERENCES Accounts(account_id) ON DELETE SET NULL,
    CONSTRAINT chk_positive_amount CHECK (amount > 0)
);

-- 5. Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    loan_amount DECIMAL(15, 2) NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL,
    status ENUM('Active', 'Paid', 'Defaulted') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    CONSTRAINT chk_positive_loan CHECK (loan_amount > 0)
);

-- Optimization Indexes
CREATE INDEX idx_accounts_customer ON Accounts(customer_id);
CREATE INDEX idx_transactions_date ON Transactions(transaction_date);

-- Advanced View
CREATE VIEW v_customer_financial_summary AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    COUNT(DISTINCT a.account_id) AS active_accounts,
    SUM(DISTINCT a.balance) AS total_on_deposit,
    IFNULL(SUM(DISTINCT l.loan_amount), 0.00) AS total_debt
FROM Customers c
LEFT JOIN Accounts a ON c.customer_id = a.customer_id AND a.status = 'Active'
LEFT JOIN Loans l ON c.customer_id = l.customer_id AND l.status = 'Active'
GROUP BY c.customer_id;