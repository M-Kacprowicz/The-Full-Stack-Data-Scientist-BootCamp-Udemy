-- INSERTING INTO A SINGLE ROW
USE sql_store;
SELECT *
FROM customers;

INSERT INTO customers
VALUES(DEFAULT, 'Jhon', 'Smith', '1990-01-01', NULL, 'address', 'city', 'CA', DEFAULT);

-- INSERTING INTO MULTIPLE RECORDS
INSERT INTO shippers
VALUES(DEFAULT, 'shipper1'),
		(DEFAULT, 'shipper2'),
        (DEFAULT, 'shipper3'),
        (DEFAULT, 'shipper4');

SELECT *
FROM shippers;

-- CREATING A COPY OF A TABLE

CREATE TABLE new_orders AS
SELECT * FROM orders;

SELECT * FROM new_orders;

SELECT *
FROM orders
WHERE order_date < '2019-01-01';

INSERT INTO new_orders
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

-- UPDATING EXISTING TABLES

USE sql_invoicing;

UPDATE payments
SET date = '2018-08-01', amount = 40.02, payment_method = 1
WHERE payment_id = 2;

SELECT * FROM payments;

UPDATE invoices
SET payment_total = 10, payment_date = due_date
WHERE invoice_id =5;

SELECT * FROM invoices;

-- UPDATING MULTIPLE RECORDS

UPDATE invoices
SET payment_total = 40
WHERE client_id = 5;

SELECT * FROM invoices;


UPDATE invoices
SET payment_total = 100
WHERE client_id IN (5, 3);
