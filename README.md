# 🏦 Banking Database (SQLite Version)

A complete **banking management database** originally written for **Oracle LiveSQL**, now fully ported to **SQLite 3** for local and cross-platform use.  
It models **branches, employees, clients, accounts, loans, applications, and reports** — and includes real-world business logic scripts.

---

## 📁 Project Structure

```text
Banking-DB-SQL/
├── 01_schema.sql         # Database schema (tables, constraints, relationships)
├── 02_sample_data.sql    # Inserts + setup updates for sample data
├── 03_queries.sql        # Functional requirement queries (SELECTs)
├── 04_maintenance.sql    # Data maintenance operations (UPDATE, DELETE, etc.)
├── .gitignore            # Ignore DB file and local clutter
└── README.md             # This file
```

---

## 🧰 Requirements

- **SQLite 3** (any OS)  
- Command-line / terminal access  
- *(Optional)* GUI tool such as **DB Browser for SQLite**  

> 💡 **Windows users:** Ensure `sqlite3.exe` is in your **PATH** or in the same folder as this project.

---

## ⚙️ Setup and Run Instructions

### 1️⃣ Create or Reset the Database

If a previous version of the database exists, delete it:

```bash
# Windows
del banking.db

# macOS / Linux
rm banking.db
```

---

### 2️⃣ Create the Schema

Run:

```bash
sqlite3 banking.db ".read 01_schema.sql"
```

This creates all tables, foreign keys, and relationships.

---

### 3️⃣ Insert the Sample Data

Run:

```bash
sqlite3 banking.db ".read 02_sample_data.sql"
```

This populates branches, employees, clients, accounts, loans, and applications.

---

### 4️⃣ Run Functional Queries (Reports)

Run:

```bash
sqlite3 banking.db ".read 03_queries.sql"
```

This file contains example business queries such as:

- Clients and their accounts  
- Clients with multiple accounts  
- Total balance per client  
- Active loans and total payments  

---

### 5️⃣ Apply Maintenance Operations (Optional)

Run:

```bash
sqlite3 banking.db ".read 04_maintenance.sql"
```

This performs scheduled database updates and cleanups (details below).

---

### 6️⃣ Verify Changes (Optional)

Run the following in terminal: 
```bash
sqlite3 banking.db
```

then run any of the following inside:

Run a few quick checks:

```sql
-- Check new salaries (+10%)
SELECT EFname, ELname, salary FROM employee;

-- Check renamed Business Loan and increased interest
SELECT LID, loan_name, interest_rate FROM loan_offer;

-- Confirm Student Loan extended by 1 year
SELECT loan_name, loan_range_end FROM loan_offer WHERE loan_name='Student Loan';

-- Check inactive accounts removed
SELECT ACID, subaccount, Active FROM account;

-- Check old "Due" applications deleted
SELECT APPID, status, application_date FROM application WHERE status='Due';
```

---

## 🧾 Notes on Porting from Oracle → SQLite

This project was originally built for **Oracle LiveSQL** and rewritten for **SQLite**.  
Below are key syntax changes and simplifications:

| Oracle Syntax | SQLite Equivalent | Purpose |
|----------------|------------------|----------|
| `TO_DATE('2023-01-01','YYYY-MM-DD')` | `'2023-01-01'` | SQLite stores dates as text |
| `ADD_MONTHS(date, 12)` | `date(column, '+1 year')` | Extend date by 12 months |
| `SYSDATE` | `date('now')` | Current system date |
| `SYSDATE - INTERVAL '1' YEAR` | `date('now','-1 year')` | One year before today |
| `CONCAT(a,b)` | `a || b` | String concatenation |
| `NUMBER(7)` / `VARCHAR2(50)` | `INTEGER` / `TEXT` / `REAL` | Simplified types |
| Foreign keys disabled by default | `PRAGMA foreign_keys = ON;` | Enables FK enforcement |

---
