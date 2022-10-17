-- CREATING DATABASES

CREATE DATABASE testDB;

-- CREATING TABLES

USE testDB;
CREATE TABLE students (
Roll_No INT, 
Name VARCHAR(10), 
Age INT, 
Phone INT);

SELECT * FROM students;

-- INSERTING DATA INTO TABLE

INSERT INTO students
VALUES(1, 'Arya', 21, 749000000),
	(2, 'Bran', 19, 749000002),
    (3, 'John', 24, 749000003),
    (4, 'Max', 24, 749000004);

SELECT * FROM students;
SELECT Name, Roll_No FROM students;

-- CONSTRAINTS
-- NOT NULL CONSTRAINT

CREATE DATABASE new_database;
USE new_database;
CREATE TABLE persons(
			ID INT NOT NULL,
            First_name VARCHAR(8) NOT NULL,
            Last_name VARCHAR(8) NULL,
            Age INT NULL);
            
SELECT * FROM persons;

DROP TABLE persons;

-- UNIQUE CONSTRAINT

DROP TABLE persons;
CREATE TABLE persons(
			ID INT NOT NULL,
            First_name VARCHAR(19),
            Last_name VARCHAR(20),
            Age INT NULL,
            UNIQUE(ID));
            
SELECT * FROM persons;

INSERT INTO persons(First_name, Last_name, Age)
VALUES('Arya', 'Grande', 20);

-- DEFAULT CONSTRAINT

DROP TABLE persons;
CREATE TABLE persons(
			ID INT NULL DEFAULT 100,
            First_name VARCHAR(19),
            Last_name VARCHAR(20),
            Age INT NULL,
            UNIQUE(ID));
            
SELECT * FROM persons;

INSERT INTO persons(First_name, Last_name, Age)
VALUES('John', 'Mason', 29);

SELECT * FROM persons;

-- PRIMARY KEY

DROP TABLE customers;
CREATE TABLE customers(
			name VARCHAR(7),
            product VARCHAR(13),
            product_id INT PRIMARY KEY);
            
            
-- ALTERING EXISTING TABLE (ADDING A CONSTRAINT)

ALTER TABLE persons
ADD PRIMARY KEY(ID);

-- ALTERING EXISTING TABLE (DROPPING A CONSTRAINT)

CREATE TABLE passengers(
			first_name VARCHAR(10),
            last_name VARCHAR(10),
            mobile INT,
            ticket_number VARCHAR(5));
            
SELECT * FROM passengers;

ALTER TABLE passengers
ADD CONSTRAINT UC_passengers UNIQUE(mobile, ticket_number);

ALTER TABLE passengers
DROP INDEX UC_passengers;

-- FOREIGN KEY

DROP TABLE customers;

CREATE TABLE customers(
			customer_id INT NOT NULL PRIMARY KEY,
            first_name VARCHAR(20),
            last_name VARCHAR(20),
            Age INT);
            
CREATE TABLE orders(
			order_id INT NOT NULL,
            order_number INT NOT NULL,
            customer_id INT,
            PRIMARY KEY(order_id),
            FOREIGN KEY(customer_id) REFERENCES customers(customer_id));

