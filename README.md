# GismaBankPro - Relational Database System
**Module:** B103 Databases & Big Data  
**Student:** [Your Name] | **ID:** [Your ID]

## 📌 Project Description
This project is a custom-built relational database for a banking application called **GismaBankPro**. It is designed to handle everything a small bank needs: managing customer profiles, multiple account types (Savings, Checking, Investment), tracking every transaction, and managing loans.

The goal was to create a system that is "normalized" (3NF) to prevent data errors and "optimized" so it stays fast even with a lot of data.

---

## 📂 What's in this Repository?
1.  **`schema.sql`**: The "blueprint" of the database. It creates the tables, sets up the rules (Constraints), and adds performance tools (Indexes and Views).
2.  **`data_import.sql`**: A script that adds realistic sample data so you can test the system immediately.
3.  **`queries.sql`**: Five specific scripts that show how to pull useful information out of the data (like calculating total bank holdings or checking customer debt).
4.  **`ER_Diagram.png`**: The visual map of how all the tables connect.

---

## 🚀 How to Run the Project
To see the database in action, follow these steps in **MySQL Workbench**:

1.  **Run `schema.sql`**: This builds the empty database structure.
2.  **Run `data_import.sql`**: This fills the database with customers and accounts.
3.  **Run `queries.sql`**: Run these one by one to see the results in the grid.

---

## 🛠 Technical Highlights (Why it works)
* **Data Safety:** I used `CHECK` constraints to make sure no one can have a negative bank balance—the database stops the error before it happens.
* **Smart Ledger:** The `Transactions` table can handle deposits, withdrawals, and transfers using a "dual-account" logic.
* **Speed:** I added **Indexes** on `customer_id` and `transaction_date`. This means the bank doesn't have to search the whole table to find one customer's history.
* **Reporting:** I created a **Database View** (`v_customer_financial_summary`) which automatically calculates a customer's total wealth and debt without writing long code every time.

---

## 📚 Practical Resources
I used these real-world documents and tutorials to build and troubleshoot the system:
* [MySQL 8.0 Official Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/)
* [W3Schools SQL Joins & Aggregates](https://www.w3schools.com/sql/)
* [GeeksforGeeks Database Normalization Guide](https://www.geeksforgeeks.org/dbms-normalization/)
* [Stack Overflow - Fixing Group By Errors](https://stackoverflow.com/questions/36257200/mysql-8-0-only-full-group-by-error)
