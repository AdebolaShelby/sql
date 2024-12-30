-- insert multiple values into a table--
INSERT INTO sql_inventory.products (name, quantity_in_stock, unit_price)
VALUES
('Deby Jingle', 9, 1.99),
('Disco Rider', 90, 5.99),
('Wider View', 10, 2.99);

-- create a copy of a table--
USE sql_invoicing;
CREATE TABLE invoices_archived AS
SELECT 
	number,
	invoice_id,  
	invoice_total, 
	payment_total, 
	invoice_date, 
	due_date, 
	payment_date,
	name
FROM invoices
JOIN clients
USING (client_id)
WHERE payment_date is not null;


-- update a table --
UPDATE invoices
SET
	payment_total = invoices_total * 0.5,
    payment_date = due_date
WHERE invoice_id = 3;

-- update multiple records in a table --
UPDATE invoices
SET
	payment_total = invoices_total * 0.5,
    payment_date = due_date
WHERE client_id = 3;

-- give any customers borth before 1990 50 extra points --
USE sql_store;
UPDATE customers 
SET points = points + 50
WHERE birth_date <'1990-01-01';

-- subqueries --
USE sql_store;
UPDATE orders
SET comments = 'Gold'
WHERE customer_id IN
		(SELECT customer_id
		FROM customers
		WHERE points > 3000);
        
-- DELETE A TABLE --

-- restore database --


-- aggregate functions using union --
USE sql_invoicing;
SELECT 
    'First_half of the year' AS date_range,
    sum(invoice_total) AS total_sales,
    sum(payment_total) AS total_payments,
    sum(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date < '2019-07-01'
UNION
SELECT 
    'Second half of the year' AS date_range,
    sum(invoice_total) AS total_sales,
    sum(payment_total) AS total_payments,
    sum(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date > '2019-06-30';

-- groupby --
USE sql_invoicing;
SELECT 
	date,
	pm.name AS payment_method,
	sum(amount) AS total_payments 
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY date, payment_method
ORDER BY date;

-- inner join --

USE sql_store;
SELECT 
p.name AS product_name,
oi.order_id,
oi.product_id,
oi.quantity,
oi.unit_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- join multiple tables --
USE sql_invoicing;
SELECT 
c.client_id,
c.name,
p.date,
p.amount,
pm.name as payment_method
FROM clients c
JOIN payments p
	ON c.client_id = p.client_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;

-- outer join --
USE sql_store;
SELECT 
p.product_id,
p.name,
oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;
    
-- outer join multiple tables --

USE sql_store;
SELECT 
o.order_date,
o.order_id,
c.first_name,
c.last_name,
os.name AS status,
s.name AS shipper
FROM orders o
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id
LEFT JOIN shippers s
	ON o.shipper_id = s.shipper_id
LEFT JOIN customers c
	ON o.customer_id = c.customer_id;
    
-- using clause --

USE sql_invoicing;
SELECT 
	p.date,
	c.name AS client,
	p.amount,
	pm.name AS payment_type
FROM clients c
LEFT JOIN payments p
	USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;
    
-- cross join --
SELECT * 
FROM products p
CROSS JOIN shippers s;

SELECT * 
FROM products p, shippers s;

-- union --
USE sql_store;
SELECT 
customer_id,
first_name,
points,
'Bronze' AS type
FROM customers
WHERE points <= '2000'
UNION
SELECT 
customer_id,
first_name,
points,
'Silver' AS type
FROM customers
WHERE points BETWEEN '2000' AND '3000'
UNION
SELECT 
customer_id,
first_name,
points,
'Gold' AS type
FROM customers
WHERE points > '3000'
ORDER BY first_name;


-- group by --
USE sql_invoicing;
SELECT 
p.date,
sum(amount) AS total_payments,
pm.name
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY date, pm.name
order by total_payments desc;

-- having --

USE sql_store;
SELECT
	c.first_name,
	c.last_name,
	c.state,
	sum(oi.unit_price * oi.quantity) AS 'total'
FROM customers c
JOIN orders o
	USING (customer_id)
JOIN order_items oi
	USING(order_id)
WHERE state = 'VA'
GROUP BY c.first_name, c.last_name, c.state
HAVING total >= 100;

-- roll up to summarize data --

USE sql_invoicing;
SELECT 
	pm.name AS payment_method,
	sum(amount) as total
FROM payments p
JOIN payment_methods pm
 ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP;

-- complex queries --
-- find all products that are more expensive than Lettuce(id = 3) using sub query --

USE sql_store;
SELECT *
FROM products
WHERE unit_price > (
	SELECT unit_price
	FROM products
	WHERE product_id = 3);
    
-- In the sql_hr database, find emplyees who earn more than average using sub query --
USE sql_hr;
SELECT 
	first_name,
	last_name,
	job_title,
	salary
FROM employees
WHERE salary > (
	SELECT 
    AVG(salary)
    FROM employees);
    
-- Find the products that have never been ordered using sub query--

USE sql_store;
SELECT * 
FROM products
WHERE product_id NOT IN (
	SELECT DISTINCT product_id
	FROM order_items
    );

-- Find all the clients without invoices using subquery --

USE sql_invoicing;
SELECT 
	name,
	city,
	phone
FROM clients
WHERE client_id NOT IN
	(SELECT DISTINCT client_id 
	FROM invoices);
    
-- Find all customers who have ordered lettuce (id = 3) using subquery and join. selct customer_id, first_name, last_name --

USE sql_store;
SELECT
	customer_id,
    first_name,
	last_name
FROM customers
WHERE customer_id IN
(
	SELECT o.customer_id
	FROM order_items oi
	JOIN orders o
	USING (order_id)
	WHERE product_id = 3);

USE sql_store;
select distinct
	c.customer_id,
	c.first_name,
	c.last_name
from customers c
left join orders o
using (customer_id)
join order_items oi
using (order_id)
where product_id = 3;

-- find invoices larger than all invoices of client 3 using Max and ALL function --

USE sql_invoicing;
SELECT invoice_total
FROM invoices
WHERE invoice_total >
	(SELECT
	MAX(invoice_total)
	FROM invoices
	WHERE client_id = 3);

USE sql_invoicing;
SELECT invoice_total
FROM invoices
WHERE invoice_total > ALL
	(SELECT
	invoice_total
	FROM invoices
	WHERE client_id = 3);

-- find all clients with at least two invoices using any and in operator--

USE sql_invoicing;
SELECT c.client_id, c.name, c.city, c.state
FROM clients c
WHERE c.client_id = ANY (
	SELECT i.client_id
	FROM invoices i
	GROUP BY i.client_id
	HAVING count(*) >= 2);

USE sql_invoicing;
SELECT c.client_id, c.name, c.city, c.state
FROM clients c
WHERE c.client_id IN (
	SELECT i.client_id
	FROM invoices i
	GROUP BY i.client_id
	HAVING count(*) >= 2);

-- correlated subqueries --
-- find all employees whose salary is above the average in their office --

USE sql_hr;
SELECT *
FROM employees e
WHERE salary > (
	SELECT AVG(salary)
	FROM employees
	WHERE office_id = e.office_id);

-- Find all the invoices that are larger than the client's average invoice amount --
USE sql_invoicing;
SELECT
client_id,
invoice_total
FROM invoices i
WHERE invoice_total > ANY (
	SELECT 
	AVG(invoice_total)
	FROM invoices
	WHERE client_id = i.client_id);

-- find all the clients that have an invoice --

USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id in (
	SELECT
	client_id
	FROM invoices
	WHERE invoice_id IS NOT NULL);

SELECT * FROM clients
WHERE client_id IN (
	SELECT DISTINCT client_id
	FROM invoices);

-- find all the clients that have an invoice using the exist operator --
USE sql_invoicing;
SELECT *
FROM clients c
WHERE EXISTS
	(SELECT client_id FROM invoices 
	WHERE client_id = c.client_id);

-- Find the products that have never been ordered --
USE sql_store;
SELECT *
FROM products p
WHERE NOT EXISTS
	(
	SELECT DISTINCT product_id
	FROM order_items
	WHERE product_id = p.product_id
	);

USE sql_store;
select *
from products p
where product_id not in
(
select distinct product_id
from order_items); 

-- use a subquery in the selct clause to produce a report of total sales, avarege sale for each client --

USE sql_invoicing;
SELECT
c.client_id,
c.name,
	(SELECT sum(invoice_total) FROM invoices
	WHERE client_id = c.client_id) AS total_sales,
	(SELECT AVG(invoice_total) FROM invoices) AS average,
	(SELECT total_sales - average) AS difference
	FROM clients c;

-- find all orders placed in the current year--

USE sql_store;
SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(now());

-- extract the date of the most recent order -- 

USE sql_store;
SELECT MAX(order_date) AS most_recent_order_date
FROM orders;

-- create a report of all customers and their phone numbers, combine first name and last name in one column, if they don't have a phone number, assign 'unknown' --

USE sql_store;
SELECT CONCAT(first_name, ' ', last_name) AS Fullname,
IFNULL(phone, 'unknown') AS Phone
FROM customers;

-- create  a report of all orders, if the orders were placed in 2019, label as active, if not label as archived--
USE sql_store;
SELECT
order_id,
order_date,
IF (
	YEAR(order_date) = YEAR(NOW()),
	'Active',
	'Archived') AS Status
FROM orders;

-- create a report of all products along with the number of time they have been orders and the frequecy--
-- if they have been oredered more than once, lable frequency as many times--

USE sql_store;
SELECT
product_id,
count(product_id) AS orders,
IF (
	count(product_id) > 1,
	'Many Times',
	'Once') AS frequency,
p.name
FROM order_items
JOIN products p
USING (product_id)
GROUP BY product_id;





































 

    




	











