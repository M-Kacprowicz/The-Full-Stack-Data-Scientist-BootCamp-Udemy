-- SQL VIEW

USE sql_hr;

CREATE VIEW employee_query AS
SELECT * FROM employees
WHERE job_title NOT LIKE '%VP%' AND reports_to IS NOT NULL;

-- USING SQL VIEWS


SELECT * FROM employee_query;
SELECT first_name, last_name, salary, FORMAT((salary*0.05)+salary,2) AS salary_increase
FROM employee_query;

-- ALTER SQL VIEWS

ALTER VIEW employee_query AS
SELECT * FROM employees
WHERE job_title NOT LIKE '%VP%';

SELECT * FROM employee_query;

ALTER VIEW employee_query AS
SELECT * FROM employees
WHERE job_title NOT LIKE '%VP%' AND reports_to IS NOT NULL AND salary > 70000;

SELECT * FROM employee_query;

-- DROP SQL VIEWS

DROP VIEW employee_query;