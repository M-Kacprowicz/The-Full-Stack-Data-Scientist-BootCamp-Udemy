-- STORED PROCEDURE
USE sql_store;

CREATE PROCEDURE test()
SELECT *
FROM orders
WHERE order_date > '2018-01-01';

CALL test;

-- STORED PROCEDURE WITH PARAMETERS
DROP PROCEDURE test1;
CREATE PROCEDURE test1(office_id_w INT)
SELECT office_id, first_name, last_name, salary
FROM sql_hr.employees
WHERE office_id = office_id_w;

CALL test1(1);


DROP PROCEDURE test2;
CREATE PROCEDURE test2(id INT, sal DECIMAL)
SELECT office_id, first_name, last_name, salary
FROM sql_hr.employees
WHERE office_id = id AND salary > sal;

CALL test2(2, 65000);

