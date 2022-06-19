/*
SECTION 1: Create the database and tables
*/

CREATE DATABASE IF NOT EXISTS jaunty_coffee_co;

USE jaunty_coffee_co;

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
SECTION 2: Insert 3 lines of data into each table
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
	VALUES (3, 3, 2, 'Really Bad Coffee', 1.50);

SELECT * FROM COFFEE;
-- DELETE FROM COFFEE;


/*
 SECTION 3: CREATE VIEW
*/

CREATE VIEW EMPLOYEE_VIEW AS
	SELECT employee_id, CONCAT(first_name, ' ', last_name) AS employee_full_name, hire_date, job_title, shop_id
    FROM EMPLOYEE;

DROP VIEW employee_view;
SELECT * FROM EMPLOYEE;
/*
 DROP TABLES / DB
*/

-- DROP TABLE IF EXISTS COFFEE;
-- DROP TABLE IF EXISTS SUPPLIER;
-- DROP TABLE IF EXISTS EMPLOYEE;
-- DROP TABLE IF EXISTS COFFEE_SHOP;
DROP DATABASE IF EXISTS jaunty_coffee_co 

