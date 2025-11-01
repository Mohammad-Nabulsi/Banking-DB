-- 02_sample_data.sql

INSERT INTO employee VALUES (101232, 'John', 'M', 'Doe', 50000, 'Manager', '1111111111', NULL);
INSERT INTO branch VALUES (1, 'Branch A', 1000000, 'Location A', '1234567890', NULL);
INSERT INTO branch VALUES (2, 'Branch B', 1200000, 'Location B', '2345678901', NULL);
INSERT INTO employee VALUES (102785, 'Jane', 'F', 'Doe', 55000, 'Supervisor', '2222222222', NULL);
INSERT INTO branch VALUES (3, 'Branch C', 800000, 'Location C', '3456789012', NULL);
INSERT INTO employee VALUES (103006, 'Bob', 'M', 'Smith', 48000, 'Associate', '3333333333', NULL);
INSERT INTO branch VALUES (4, 'Branch D', 1500000, 'Location D', '4567890123', NULL);
INSERT INTO employee VALUES (104968, 'Alice', 'F', 'Johnson', 60000, 'Manager', '4444444444', NULL);
INSERT INTO branch VALUES (5, 'Branch E', 1300000, 'Location E', '5678901234', NULL);
INSERT INTO employee VALUES (105420, 'Eva', 'F', 'Williams', 55000, 'Supervisor', '5555555555', NULL);

UPDATE employee SET BID = 1 WHERE EID = 101232;
UPDATE branch   SET MEID = 101232 WHERE BID = 1;
UPDATE branch   SET MEID = 102785 WHERE BID = 2;
UPDATE branch   SET MEID = 103006 WHERE BID = 3;
UPDATE branch   SET MEID = 104968 WHERE BID = 4;
UPDATE employee SET BID = 4 WHERE EID = 104968;
UPDATE employee SET BID = 3 WHERE EID = 103006;
UPDATE employee SET BID = 2 WHERE EID = 102785;
UPDATE employee SET BID = 5 WHERE EID = 105420;
UPDATE branch   SET MEID = 105420 WHERE BID = 5;

INSERT INTO client VALUES (5678123, 'Eva', 'D', 'Williams', '654 Birch St', '5678901234', 1, '1998-07-12');
INSERT INTO client VALUES (7890456, 'Diana', 'C', 'Miller', '987 Elm St', '4567890123', 1, '1982-11-30');
INSERT INTO client VALUES (1634789, 'Charlie', 'B', 'Brown', '789 Pine St', '3456789012', 0, '1995-02-10');
INSERT INTO client VALUES (4567234, 'Bob', 'A', 'Smith', '456 Oak St', '2345678901', 0, '1985-08-21');
INSERT INTO client VALUES (9012345, 'Alice', 'M', 'Johnson', '123 Main St', '1234567890', 1, '1990-05-15');

INSERT INTO account VALUES (1234567, 'Savings', 'alice123', 'pass123', 1000.00, 'USD', 'junior', 5678123, 1, 1);
INSERT INTO account VALUES (2345678, 'Checking', 'bob456', 'pass456', 500.50, 'USD', 'kids', 7890456, 2, 1);
INSERT INTO account VALUES (3456789, 'Investment', 'charlie789', 'pass789', 10000.75, 'elite', 'Investment', 1634789, 3, 1);
INSERT INTO account VALUES (4567890, 'Savings', 'diana321', 'pass321', 2500.25, 'USD', 'junior', 4567234, 4, 1);
INSERT INTO account VALUES (5678901, 'Checking', 'eva567', 'pass567', 750.80, 'USD', 'elite', 9012345, 5, 0);
INSERT INTO account VALUES (5678901, 'Savings', 'diana211', 'pass321', 2500.25, 'USD', 'elite', 9012345, 4, 1);

INSERT INTO loan_offer VALUES (100378, 'Home Loan', 4.25, '2023-01-01', '2023-12-31', 1);
INSERT INTO loan_offer VALUES (200486, 'Auto Loan', 3.75, '2023-02-01', '2023-11-30', 2);
INSERT INTO loan_offer VALUES (300783, 'Personal Loan', 6.50, '2023-03-01', '2023-10-31', 3);
INSERT INTO loan_offer VALUES (400219, 'Business Loan', 5.00, '2023-04-01', '2023-09-30', 4);
INSERT INTO loan_offer VALUES (500774, 'Student Loan', 3.00, '2023-05-01', '2023-08-31', 5);

INSERT INTO application VALUES (100001, 1, 'Pending', '2023-01-01', 'Loan application', 7890456, 2345678, 'Checking');
INSERT INTO application VALUES (100201, 1, 'Due', '2021-01-01', 'Loan application', 7890456, 2345678, 'Checking');
INSERT INTO application VALUES (100002, 0, 'Due', '2023-02-15', 'Mortgage application', 1634789, 3456789, 'Investment');
INSERT INTO application VALUES (100003, 1, 'Active', '2023-03-20', 'Credit card application', 4567234, 2345678, 'Checking');
INSERT INTO application VALUES (100004, 1, 'Pending', '2023-04-10', 'Personal loan application', 5678123, 4567890, 'Savings');
INSERT INTO application VALUES (100005, 0, 'Active', '2023-05-05', 'Auto loan application', 9012345, 1234567, 'Savings');

INSERT INTO loan VALUES (1111, '2023-12-01', '2023-01-15', 50000, 5678123, 100001);
INSERT INTO loan VALUES (2222, '2023-11-15', '2023-02-28', 30000, 7890456, 100002);
INSERT INTO loan VALUES (3333, '2023-10-20', '2023-03-10', 10000, 1634789, 100003);
INSERT INTO loan VALUES (4444, '2023-09-10', '2023-04-05', 20000, 4567234, 100004);
INSERT INTO loan VALUES (5555, '2023-08-05', '2023-05-20', 75000, 9012345, 100005);

INSERT INTO payment_info VALUES (1, 5555, '2023-01-05', 1500.00, 'Credit Card', 1234567, 'Savings');
INSERT INTO payment_info VALUES (3, 4444, '2023-02-20', 1000.50, 'Bank Transfer', 2345678, 'Checking');
INSERT INTO payment_info VALUES (2, 5555, '2023-03-25', 500.75, 'Cash', 3456789, 'Investment');
INSERT INTO payment_info VALUES (1, 3333, '2023-04-15', 2000.25, 'Check', 4567890, 'Savings');
INSERT INTO payment_info VALUES (6, 1111, '2023-05-10', 750.80, 'PayPal', 5678901, 'Checking');

INSERT INTO report VALUES (16666, '2023-01-10', 'Client meeting went well', 101232, 5678123, 1, 5555, 100378);
INSERT INTO report VALUES (36666, '2023-03-30', 'Positive feedback from customer', 103006, 1634789, 6, 1111, 300783);
INSERT INTO report VALUES (41111, '2023-04-20', 'Client satisfied with services', 104968, 9012345, 1, 3333, 400219);
INSERT INTO report VALUES (50000, '2023-05-15', 'Loan offer presented to client', 105420, 1634789, 2, 5555, 500774);
INSERT INTO report VALUES (50001, '2023-05-10', NULL, 105420, 1634789, 3, 4444, 500774);

INSERT INTO collateral VALUES (100001, 'Diamond Necklace');
INSERT INTO collateral VALUES (100002, 'Diamond Necklace');
INSERT INTO collateral VALUES (100001, 'Luxury Car');
INSERT INTO collateral VALUES (100001, 'Beachfront Property');
INSERT INTO collateral VALUES (100004, 'High-end Electronics');
INSERT INTO collateral VALUES (100005, 'Original Art Piece');
