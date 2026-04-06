USE GismaBankPro;

-- Insert Branches
INSERT INTO Branches (branch_name, city, swift_code) VALUES 
('Potsdamer Platz', 'Berlin', 'POTSPLZ'),
('Frankfurt Central', 'FrankFurt', 'FRKFRTCT'),
('Munich', 'Munich', 'MCN');

-- Insert Customers
INSERT INTO Customers (first_name, last_name, email, phone, date_of_birth) VALUES 
('Lukas', 'Mueller', 'l.mueller@email.com', '+49151234567', '1990-05-15'),
('Elena', 'Schmidt', 'e.schmidt@email.com', '+49151987654', '1985-11-22'),
('Marcus', 'Weber', 'm.weber@email.com', '+49151555444', '1998-02-01'),
('Sophia', 'Fischer', 's.fischer@email.com', '+49151666777', '1993-07-10');

-- Insert Accounts
INSERT INTO Accounts (customer_id, branch_id, account_type, balance) VALUES 
(1, 1, 'Checking', 2500.50),
(1, 1, 'Savings', 15000.00),
(2, 2, 'Checking', 540.00),
(3, 3, 'Investment', 120000.00),
(4, 1, 'Checking', 3100.00);

-- Insert Transactions
INSERT INTO Transactions (sender_account_id, receiver_account_id, transaction_type, amount, reference_note) VALUES 
(NULL, 1, 'Deposit', 500.00, 'ATM Cash Deposit'),
(5, NULL, 'Withdrawal', 200.00, 'ATM Withdrawal'),
(1, 5, 'Transfer', 300.00, 'Rent share');

-- Insert Loans
INSERT INTO Loans (customer_id, loan_amount, interest_rate, status) VALUES
(1, 5000.00, 3.50, 'Active'),
(3, 25000.00, 2.90, 'Active');