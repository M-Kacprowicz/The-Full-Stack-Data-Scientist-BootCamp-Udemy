USE sql_store;
SELECT * FROM customers;
-- ORDER BY clause
SELECT points, first_name, last_name  FROM customers;


SELECT first_name, last_name, points FROM customers
ORDER BY points DESC;

SELECT *
FROM customers;

-- WHERE clause
SELECT first_name, last_name, points, birth_date
FROM customers
WHERE birth_date < '1990-01-01'
ORDER BY points DESC;

-- always SFWO, never order before where

-- DESC orders from highest to lowest

-- aliasing
SELECT first_name,
		last_name,
        points,
        (points*10)-5,
        (points*10)-5 AS operations
FROM customers;

SELECT *
FROM order_items;

SELECT product_id, 
		quantity, 
		unit_price, 
        quantity*unit_price AS price, 
        ROUND((quantity*unit_price)-(quantity*unit_price)*0.05, 2) AS discount
FROM order_items;

-- EXERCISE 1
SELECT *
FROM products;

SELECT name, 
		unit_price,
        ROUND(unit_price-(unit_price*0.05), 2) AS price_discounted_by_5_percent
FROM products;

-- SELECT DISTINCT
SELECT *
FROM customers;

SELECT DISTINCT state
FROM customers;

SELECT *
FROM customers
WHERE state = 'VA';

SELECT *
FROM customers
WHERE birth_date > '1990-01-01';

-- EXERCISE 2
SELECT *
FROM orders;

SELECT *
FROM orders
WHERE order_date < '2019-01-01'; 

-- AND, OR and NOT operators

SELECT *
FROM customers
WHERE birth_date > '1990-01-01' AND city = 'Chicago';

SELECT *
FROM customers
WHERE birth_date > '1990-01-01' OR city = 'Chicago';

SELECT *
FROM customers
WHERE birth_date > '1990-01-01' AND city = 'Chicago' OR points > 1000;

SELECT *
FROM customers
WHERE NOT(birth_date > '1990-01-01' OR city = 'Chicago' AND points < 1000);

SELECT *
FROM customers
WHERE NOT(birth_date <= '1990-01-01' AND points <= 500);

-- EXERCISE 3

SELECT *, quantity*unit_price AS total_price
FROM order_items
WHERE order_id = 6 AND quantity*unit_price > 20;

-- IN operator

SELECT *
FROM customers
WHERE state = 'VA' OR state = 'FL' OR state = 'GA';

SELECT *
FROM customers
WHERE state IN('VA', 'FL', 'GA');

-- EXERCISE 4

SELECT *
FROM products
WHERE quantity_in_stock IN(49, 38, 72);

-- BETWEEN operator
SELECT *
FROM customers
WHERE points >= 100 AND points<=3000;

SELECT *
FROM customers
WHERE points BETWEEN 100 AND 3000;

-- EXERCISE 5
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- LIKE operator

SELECT *
FROM customers
WHERE last_name LIKE 'b%';

SELECT *
FROM customers
WHERE last_name LIKE 'brush%';

SELECT *
FROM customers
WHERE last_name LIKE '%b';

SELECT *
FROM customers
WHERE last_name LIKE '%y';

SELECT *
FROM customers
WHERE phone LIKE '7%';

SELECT *
FROM customers
WHERE last_name LIKE '%b%';

SELECT *
FROM customers
WHERE last_name LIKE 'b%y';

SELECT *
FROM customers
WHERE last_name LIKE 'b______y';

-- EXERCISE 6
SELECT *
FROM customers
WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

SELECT *
FROM customers
WHERE phone LIKE '%9';

-- REGEXP
SELECT *
FROM customers
WHERE last_name REGEXP 'b';

SELECT *
FROM customers
WHERE last_name REGEXP '^b';

SELECT *
FROM customers
WHERE last_name REGEXP 'y$';

SELECT *
FROM customers
WHERE last_name REGEXP 'y|s';

SELECT *
FROM customers
WHERE last_name REGEXP 'brus|mac|se';

SELECT *
FROM customers
WHERE last_name REGEXP '[gsi]e';

SELECT *
FROM customers
WHERE last_name REGEXP '[g-m]e';

-- REGEXP
-- ^ begining of a string
-- $ to indicate the end of a string
-- | pipe sign, to indicate logical OR
-- [a,d,b] to indicate combination of characters before or after a letter
-- [a-i] to indicate combination of characters before or after a letter

-- EXERCISE 7
SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur';

SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

SELECT *
FROM customers
WHERE last_name REGEXP '^my|se';

SELECT *
FROM customers
WHERE last_name REGEXP 'b[r|u]';

-- IS NULL and IS NOT NULL

SELECT *
FROM customers
WHERE phone IS NULL;

SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- EXERCISE 8
SELECT *
FROM orders
WHERE shipped_date IS NULL;

-- ORDER BY operator

SELECT *
FROM customers
ORDER BY first_name DESC;

SELECT *
FROM customers
ORDER BY points DESC;

SELECT *
FROM customers
ORDER BY state, first_name;

SELECT first_name, state
FROM customers
ORDER BY 1, 2;

-- LIMIT clause

SELECT *
FROM customers
LIMIT 5;


SELECT *
FROM customers
LIMIT 5, 5;

-- EXERCISE 9

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;