-- AGGREGATION FUNCTIONS

USE sql_hr;
DROP TABLE new_employee;
CREATE TABLE new_employee(
						name varchar(45) NOT NULL,    
						occupation varchar(35) NOT NULL,    
						working_date date,  
						working_hours INT(5)  
);

    
INSERT INTO new_employee
VALUES
	('Robin', 'Scientist', '2020-10-04', 5),
    ('Warner', 'Engineer', '2020-10-04', 7),
    ('Peter', 'Actor', '2020-10-04', 13),
    ('Marco', 'Engineer', '2020-10-04', 11),
    ('Brayden', 'Teacher', '2020-10-04', 9),
    ('Antonio', 'Business', '2020-10-04', 11);

SELECT * FROM new_employee;

SELECT COUNT(name) FROM new_employee;
SELECT SUM(working_hours) FROM new_employee;
SELECT AVG(working_hours) FROM new_employee;
SELECT MIN(working_hours) FROM new_employee;
SELECT MAX(working_hours) FROM new_employee;

SELECT COUNT(name) AS count,
	MIN(working_hours) AS min_hours, 
    MAX(working_hours) AS max_hours,
    AVG(working_hours) AS avarage_hours
FROM new_employee;

-- COUNT FUNCTION IN DETAILS

-- COUNT WITH WHERE AND DISTINCT

SELECT COUNT(*) FROM new_employee
WHERE working_hours > 10;

SELECT DISTINCT occupation FROM new_employee;
SELECT COUNT(DISTINCT occupation) FROM new_employee;
SELECT COUNT(occupation) FROM new_employee;

-- HAVING
USE sql_store;
SELECT first_name, last_name, points, phone FROM customers
HAVING points > 1000;

USE sql_store;
SELECT first_name, last_name, points, phone FROM customers
WHERE points > 1000;


-- LENGTH()
USE sql_hr;
SELECT first_name, LENGTH(first_name) AS length_of_name FROM employees;

SELECT first_name, 
	LENGTH(first_name), 
    CHAR_LENGTH(first_name),
    CHARACTER_LENGTH(first_name) FROM employees;
    
-- CONCAT()

SELECT CONCAT(first_name, last_name)
FROM employees;

SELECT CONCAT(first_name, ' ', last_name, ': ', salary)
FROM employees;

-- FORMAT()
SELECT salary, FORMAT(salary, 0)
FROM employees;

-- INSERT()
SELECT INSERT('abcegf', 4, 3, 'def');

SELECT job_title, INSERT(job_title, 8, 9, 'General')
FROM employees;
SELECT job_title, INSERT(job_title, 9, 9, 'General')
FROM employees
WHERE job_title LIKE 'Account Executive';

SELECT job_title, INSERT(job_title, 9, 9, 'General')
FROM employees
WHERE employee_id = 33391;

-- LOCATE ()

SELECT employee_id, job_title, LOCATE('Executive', job_title) FROM employees;

SELECT employee_id, job_title, INSERT(job_title, 8, 9, 'Manager') FROM employees
WHERE employee_id = 80529;

-- UCASE() - upper case
-- LCASE() - lower case

SELECT job_title, first_name, last_name, LCASE(job_title), UCASE(first_name) FROM employees;

