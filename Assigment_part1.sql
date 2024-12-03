
-- Query 1, page 3
/*
USE sql_store;

SELECT *
FROM customers;
*/
-- Query 1 conti...page 4

/*
USE sql_store;
SELECT *
FROM customers
-- WHERE CUSTOMER_ID =1
order by first_name;
*/

-- Query 2, page 5
/*
SELECT last_name, first_name,points,points+10
FROM CUSTOMERS;
*/

-- Page 6 [(Points x 10) +100]
/*
SELECT last_name, first_name,points,(points*10 + 100)
FROM CUSTOMERS;
*/
-- Page 6 Create new column called 'discount_factor' which has formular (points+10)*100
/*
SELECT last_name, first_name,points,(points+10)*100 AS discount_factor 
FROM CUSTOMERS;
*/

-- TASK 2 page 7, PPT 1
/*
Return all products. Columns shown are name, unit price and a new column called 'new price' which is = unit price *1.1. 
i.e. You are increasing prices by 10%
New query returns all products with new price column
*/
/*
USE sql_store;
SELECT name,  unit_price, unit_price*1.1 AS 'new_price'
FROM products;
*/

-- Task 3
/*
SELECT*
FROM customers
WHERE birth_date> '1990-01-01';
*/

-- Task 4
Use sql_inventory;
SELECT name, quantity_in_stock
FROM products
ORDER BY quantity_in_stock DESC
Limit 1
;

-- Task 5
SELECT name, unit_price
FROM products
ORDER BY unit_price DESC
limit 1
;

-- Task 6
SELECT 
first_name,
last_name,
address,
birth_date
FROM customers
ORDER BY birth_date
limit 1
;
