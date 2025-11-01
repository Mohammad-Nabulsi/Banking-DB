-- 03_queries.sql

-- 1. Accounts per client
SELECT C.CFname, C.Cminit, C.CLname,
       A.ACID, A.currency, A.type_of,
       COUNT(A.ACID) AS num_accounts
FROM client C
LEFT JOIN account A ON C.CID = A.CID
GROUP BY C.CFname, C.Cminit, C.CLname, A.ACID, A.currency, A.type_of;

-- 2. Client + max balance (for clients with >1 account)
SELECT C.CID, C.CFname, MAX(A.balance) AS max_balance
FROM client C
JOIN account A ON C.CID = A.CID
WHERE C.CID IN (
    SELECT CID FROM account GROUP BY CID HAVING COUNT(*) > 1
)
GROUP BY C.CID, C.CFname;

-- 3. Total balance per client (fixed for SQLite)
SELECT 
    c.CID,
    c.CFname,
    c.Cminit,
    c.CLname,
    COUNT(a.ACID) AS number_of_accounts,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM client c
LEFT JOIN account a ON c.CID = a.CID
GROUP BY c.CID, c.CFname, c.Cminit, c.CLname;

-- 4. Active loans with payments
SELECT 
    L.INFOID,
    L.approved_loan_amount,
    C.CID,
    C.CFname,
    COALESCE(SUM(P.pay_amount),0) AS total_payments,
    COUNT(P.PID) AS num_payments
FROM loan L
JOIN client C ON L.CID = C.CID
LEFT JOIN payment_info P ON L.INFOID = P.INFOID
JOIN application A ON L.APPID = A.APPID
WHERE A.status = 'Active'
GROUP BY L.INFOID, L.approved_loan_amount, C.CID, C.CFname;

-- 5  Check employee salary changes (before/after maintenance)
SELECT 
    EFname, ELname, salary,
    CASE
        WHEN salary > 60000 THEN 'After Bonus (10%)'
        ELSE 'Before Bonus'
    END AS salary_status
FROM employee
ORDER BY salary DESC;