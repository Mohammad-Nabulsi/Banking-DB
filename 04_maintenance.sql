-- 04_maintenance.sql

-- rename Business Loan and increase interest
UPDATE loan_offer
SET loan_name = 'Professional Business Loan_' || LID,
    interest_rate = interest_rate + 2
WHERE loan_name = 'Business Loan';

-- extend Student Loan by 1 year (SQLite: use date(...,'+1 year'))
UPDATE loan_offer
SET loan_range_end = date(loan_range_end, '+1 year')
WHERE loan_name = 'Student Loan';

-- 10% bonus for all employees
UPDATE employee
SET salary = CAST(salary * 1.1 AS INTEGER);

-- delete collaterals for applications that became 'Due'
DELETE FROM collateral
WHERE APPID IN (
    SELECT c.APPID
    FROM collateral c
    JOIN application a ON c.APPID = a.APPID
    WHERE a.status = 'Due'
);

-- delete inactive accounts
DELETE FROM account
WHERE Active = 0;

-- delete applications older than 1 year AND status = 'Due'
-- SQLite version: compare string dates
DELETE FROM application
WHERE status = 'Due'
  AND application_date < date('now','-1 year');

-- delete home loans
DELETE FROM loan_offer
WHERE loan_name = 'Home Loan';
