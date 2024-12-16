# Creating a sql Database and running queries to analyse data and create reports

Using MySQL, I created three databases for an e-commerce company that stores inventory data, invoicing data, as well as customer and orders data, along with employee information: sql_hr, sql_inventory, sql_invoicing, and sql_store.

After creating the database, I was able to query the data to analyze it and create reports. I utilized functions and clauses such as SELECT, FROM, INNER JOIN, OUTER JOIN, USING, WHERE, GROUP BY, WITH ROLLUP, HAVING, ORDER BY, EXISTS, ANY, IN, and subqueries.


# Analysis
## Aggregate function using union

Create a report that aggregates total sales and total payments for the first half of the year and the second half of the year
* Query
![input of aggregate functions using union](<Screenshot 2024-12-15 183822.png>)
    USE sql_invoicing;
    SELECT 
        'first_half' as date_range,
        sum(invoice_total) AS total_sales,
        sum(payment_total) AS total_payments,
        sum(invoice_total - payment_total) AS what_we_expect
    FROM invoices
    WHERE invoice_date < '2019-07-01'
    union
    SELECT 
        'second half' AS date_range,
        sum(invoice_total) AS total_sales,
        sum(payment_total) AS total_payments,
        sum(invoice_total - payment_total) AS what_we_expect
    FROM invoices
    WHERE invoice_date > '2019-06-30';

* Output
![output of aggregate functions using union](<Screenshot 2024-12-15 184025.png>)


