USE GismaBankPro;

-- 1. Complex Join: Customer Portfolio Overview
SELECT 
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    a.balance,
    b.branch_name
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
JOIN Branches b ON a.branch_id = b.branch_id
WHERE a.status = 'Active';

-- 2. Aggregation: Branch Liquidity Audit
SELECT 
    b.branch_name,
    COUNT(a.account_id) AS total_accounts,
    SUM(a.balance) AS total_branch_holdings
FROM Branches b
LEFT JOIN Accounts a ON b.branch_id = a.branch_id
GROUP BY b.branch_id
HAVING total_branch_holdings > 5000;

-- 3. FIXED Advanced Query: Customers with active loans and their account totals
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    l.loan_amount,
    SUM(a.balance) AS current_total_balance
FROM Customers c
JOIN Loans l ON c.customer_id = l.customer_id
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE l.status = 'Active'
GROUP BY c.customer_id, l.loan_amount;

-- 4. UPDATE Operation: Monthly Account Maintenance Fee
UPDATE Accounts 
SET balance = balance - 5.00 
WHERE account_type = 'Checking' AND balance >= 5.00;

-- 5. DELETE Operation: Safe cleanup of closed, empty accounts
DELETE FROM Accounts 
WHERE status = 'Closed' AND balance = 0;