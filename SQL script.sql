/*
	Create Database
*/
CREATE DATABASE IF NOT EXISTS jaunty_coffee_co;
USE jaunty_coffee_co;

/*
	DROP TABLES / DB
*/

DROP TABLE IF EXISTS COFFEE;
DROP TABLE IF EXISTS SUPPLIER;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS COFFEE_SHOP;

/*
----------------------------------
	SECTION 1: Create Tables
----------------------------------
*/


CREATE TABLE COFFEE_SHOP(
	shop_id INT,
    shop_name VARCHAR(50),
    city VARCHAR(50),
    state CHAR(2),
    
    PRIMARY KEY(shop_id)
);


CREATE TABLE EMPLOYEE(
	employee_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    hire_date DATE,
    job_title VARCHAR(30),
    shop_id INT,
    
    PRIMARY KEY(employee_id),
    FOREIGN KEY(shop_id) REFERENCES COFFEE_SHOP(shop_id)
);

CREATE TABLE SUPPLIER (
	supplier_id INT,
    company_name VARCHAR(50),
    country VARCHAR(30),
    sales_contact_name VARCHAR(60),
    email VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(supplier_id)
);

CREATE TABLE COFFEE(
	coffee_id INT,
    shop_id INT,
    supplier_id INT,
    coffee_name VARCHAR(30),
    price_per_pound NUMERIC(5,2),
    
    PRIMARY KEY(coffee_id),
    FOREIGN KEY(shop_id) REFERENCES COFFEE_SHOP(shop_id),
    FOREIGN KEY(supplier_id) REFERENCES SUPPLIER(supplier_id)
);

-- DESCRIBE COFFEE_SHOP;
-- DESCRIBE EMPLOYEE;
-- DESCRIBE SUPPLIER;
-- DESCRIBE COFFEE;

/*
---------------------------------------------------------
	SECTION 2: Insert 3 data points into each table
---------------------------------------------------------
*/

-- COFFEE SHOP TABLE

INSERT INTO COFFEE_SHOP 
	VALUES (1, 'Starbucks', 'Pittsburgh', 'PA');
INSERT INTO COFFEE_SHOP
	VALUES (2, 'Cupka Joes', 'Pittsburgh', 'PA');
INSERT INTO COFFEE_SHOP
	VALUES (3, 'Some Coffee Shop', 'Pittsburgh', 'PA');

SELECT * FROM COFFEE_SHOP;    
-- DELETE FROM COFFEE_SHOP;    


-- EMPLOYEE TABLE 

INSERT INTO EMPLOYEE
	VALUES (1, 'Eddie', 'Blanciak', '2022-06-19', 'Developer', 1);
INSERT INTO EMPLOYEE
	VALUES (2, 'Joe', 'Smith', '2022-06-19', 'Java Developer', 2);
INSERT INTO EMPLOYEE
	VALUES (3, 'Mary', 'Toy', '2022-06-19', 'C++ Developer', 3);
INSERT INTO EMPLOYEE
	VALUES (4, 'Jon', 'Doe', '2022-06-19', 'Android Developer', 3);
INSERT INTO EMPLOYEE
	VALUES (5, 'Henry', 'Watt', '2022-06-19', 'Barista', 3);
    
SELECT * FROM EMPLOYEE;
-- DELETE FROM EMPLOYEE;

-- SUPPLIER TABLE --

INSERT INTO SUPPLIER 
	VALUES (1, 'Big Coffee Supplier', 'USA', 'Salesman Joe', 'joe@bigcoffeesupplier.com');
INSERT INTO SUPPLIER 
	VALUES (2, 'Medium Coffee Supplier', 'USA', 'Salesman Ed', 'ed@mediumcoffeesupplier.com');
INSERT INTO SUPPLIER 
	VALUES (3, 'Small Coffee Supplier', 'USA', 'Salesman Tim', 'tim@smallcoffeesupplier.com');

SELECT * FROM SUPPLIER;
-- DELETE FROM SUPPLIER;

-- COFFEE TABLE --

INSERT INTO COFFEE 
	VALUES (1, 1, 1, 'Really Good Coffee', 10.50);
INSERT INTO COFFEE 
	VALUES (2, 2, 2, 'Really Okay Coffee', 5.50);
INSERT INTO COFFEE 
	VALUES (3, 3, 3, 'Really Bad Coffee', 1.50);

SELECT * FROM COFFEE;
DELETE FROM COFFEE;


/*
----------------------------------
	SECTION 3: Create View
 ---------------------------------
*/

CREATE VIEW EMPLOYEE_VIEW AS
	SELECT employee_id, CONCAT(first_name, ' ', last_name) AS employee_full_name, hire_date, job_title, shop_id
    FROM EMPLOYEE;

-- DROP VIEW employee_view;
-- SELECT * FROM EMPLOYEE;

/*
----------------------------------
	SECTION 4: Create Index
 ---------------------------------
*/

CREATE INDEX coffee_name
	ON COFFEE (coffee_name);
    
SHOW INDEX FROM COFFEE;

-- DROP INDEX coffee_name ON COFFEE;-- 
/*
----------------------------------
	SECTION 5: Create an SELECT-FROM-WHERE
 ---------------------------------
*/

SELECT first_name AS 'First Name', last_name AS 'Last Name', job_title AS 'Job Title'
	FROM EMPLOYEE
    WHERE job_title LIKE '%developer';

/*
----------------------------------
	SECTION 6: Create Join (3 tables)
 ---------------------------------
*/

SELECT COFFEE_SHOP.shop_name AS 'Shop Name', COFFEE.coffee_name AS 'Coffee Brand Name', COFFEE.price_per_pound AS 'Price Per LB', SUPPLIER.company_name AS 'Coffee Supplier'
	FROM ((COFFEE
    INNER JOIN COFFEE_SHOP ON  COFFEE.shop_id = COFFEE_SHOP.shop_id)
    INNER JOIN SUPPLIER ON COFFEE.supplier_id = SUPPLIER.supplier_id);
