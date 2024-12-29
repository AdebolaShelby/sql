# Creating a SQL database and executing queries to analyze data and generate reports.

Using MySQL, I created three databases for an e-commerce company that stores inventory data, invoicing data, as well as customer and orders data, along with employee information: 

* sql_hr
* sql_inventory 
* sql_invoicing
* sql_store

After creating the database, I was able to query the data to analyze it and create reports. I utilized functions and clauses such as SELECT, FROM, INNER JOIN, OUTER JOIN, USING, WHERE, GROUP BY, WITH ROLLUP, HAVING, ORDER BY, EXISTS, ANY, IN, and subqueries.


# Analysis
## Aggregate function using union

* Create a report that summarizes total sales and payments for both halves of the year, including the remaining balance due.

    ## Query
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

    ## Output
    ![aoutput of aggregate functions using union](<Screenshot 2024-12-15 185959.png>)


## Group By & Order By Clause

* Create a report that summarizes the total payments  for each day as well as the payment method

    ## Query
    ![input Group By & Order By Clause](<Screenshot 2024-12-15 191802.png>)
    ## Output
    ![output Group By & Order By Clause](<Screenshot 2024-12-15 191809.png>)


## Inner Join
* Create a report of all the items that have been ordered along with the product name, unit price quatity, order_id, and product_id.

    ## Query
    ![Inner join](image-1.png)

    ## Output
    ![Inner join](image.png)

## Outer Join Multiple Tables
* Create a report of all payments made by each client along with their payment method
    ## Query
    ![Outer join mutiple tables](image-2.png)

    ## Output
    ![Outer join multiple tables](image-3.png)

## The USING clause

* create a report 

    ## Query 
    ![the using clause](image-4.png)

    ## Output
    ![the using clause](image-5.png)

## Having

* Create a report

## Query 
![the having clause](image-6.png)

## Output
![the having clause](image-7.png)


## Sub queries

* Create a report of all products that are more expensive than Lettuce(id = 3)
    ## Query
    ![Sub query](image-8.png)

    ## Output
    ![Sub query](image-9.png)

* In the sql_hr database: find emplyees who earn more than average 

    ## Query
    ![sub query](image-10.png)

    ## Output
    ![sub query](image-11.png)

* Create a report of all the products that have never been ordered

 ## Query
 ![sub query](image-12.png)

 ## Output
 ![sub query](image-13.png)

* Create a report of all the clients without invoices 

    ## Query
    ![Sub query](image-14.png)

    ## Output
    ![Sub query](image-15.png)

* Create a report of all customers who have ordered lettuce (id = 3) using subquery

    ## Query
    ![Sub query](image-16.png)

    ## Output
    ![Subquery](image-17.png)


* Create a report of invoices larger than all invoices of client 3 using the Max and ALL function 

    ## Query: Max
    ![max query](image-18.png)

    ## Query: ALL
    ![All query](image-19.png)

    ## Output
    ![output](image-20.png)

* Create a report of all clients with at least two invoices using the ANY and IN operator

    ## Query
    ![any and in operator](image-21.png)

    ## Output
    ![any and in operator](image-22.png)


## Correlated Subqueries

* Create a report of all employees whose salary is above the average in their office

    ## Query
    ![correlated subquery](image-23.png)

    ## Output
    ![correlated subquery](image-24.png)

* Create a report of all the invoices that are larger than the client's average invoice amount

    ## Query
    ![correlated subquery](image-25.png)

    ## Output
    ![correlated subquery](image-26.png)

* Create a report all the clients that have an invoice

    ## Query
    ![sub query](image-27.png)

    ## Output
    ![sub query](image-28.png)

* Create a report of all the clients that have an invoice using the exist operator



* Create a report of all the products that have never been ordered 
