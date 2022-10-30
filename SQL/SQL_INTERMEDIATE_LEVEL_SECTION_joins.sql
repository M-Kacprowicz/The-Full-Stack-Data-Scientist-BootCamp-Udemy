

-- JOINS

USE sql_store;

SELECT *
FROM sql_store.customers;

SELECT *
FROM sql_store.orders;

SELECT *
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

SELECT *
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;

SELECT order_id, first_name, last_name, orders.customer_id
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

SELECT order_id, first_name, last_name, o.customer_id
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;
    
-- EXERCISE
SELECT p.product_id, p.name, oi.quantity AS quantity_purchased, p.unit_price AS products_unit_price, 
	oi.unit_price AS orders_items_unit_price, oi.quantity * oi.unit_price AS total_price_purchased
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id;
    
-- JOINS ACROSS MULTIPLE DATABASES

SELECT p.name, oi.unit_price, p.product_id
FROM order_items oi
JOIN sql_inventory.products p
	ON oi.product_id = p.product_id;
    
-- EXERCISE
SELECT p.client_id, p.amount, p.payment_method, pm.name AS payment_method_name,
	c.name AS client_name, c.address, c.city
FROM sql_invoicing.payments p
JOIN sql_invoicing.payment_methods pm
	ON p.payment_method = pm.payment_method_id
		JOIN sql_invoicing.clients c
			ON p.client_id = c.client_id;
            
-- JOINING TABLE BY ITSELF

SELECT *
FROM sql_hr.employees;

USE sql_hr;


SELECT *
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;
    
SELECT e.employee_id, e.first_name, e.last_name, m.first_name AS manager
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;
    
-- JOINING ACROSS MULTIPLE TABLES
USE sql_store;
SELECT *
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
		JOIN order_statuses os
			ON o.status = os.order_status_id;


SELECT o.order_id, o.order_date, c.first_name, c.last_name, o.status, os.name AS status_meaning
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
		JOIN order_statuses os
			ON o.status = os.order_status_id;
            
-- OUTER JOIN

USE sql_store;

SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id;
    
SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
RIGHT JOIN orders o
	ON c.customer_id = o.customer_id;
    
-- EXERCISE
USE sql_store;
SELECT p.product_id, p.name AS product_name, oi.quantity AS ordered_quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;
    

USE sql_invoicing;

SELECT i.invoice_id, i.invoice_date, i.invoice_total, c.client_id, c.name AS client_name, 
	pm.name AS payment_method
FROM invoices i
LEFT JOIN clients c USING(client_id)
	LEFT JOIN payments p USING(invoice_id)
		LEFT JOIN payment_methods pm
			ON p.payment_method = pm.payment_method_id;