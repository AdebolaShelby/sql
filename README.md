# Creating a SQL database and executing queries to analyze data and generate reports.

Using MySQL, I created a database for an e-commerce company that stores inventory data, invoicing data, as well as customer and orders data, along with employee information. After creating the database, I was able to query the data to analyze it and create reports. I utilized functions and clauses such as 
    SELECT,
    FROM,
    INNER JOIN,
    OUTER JOIN,
    USING,
    WHERE,
    GROUP BY,
    WITH ROLLUP,
    HAVING,
    ORDER BY,
    EXISTS,
    ANY,
    IN, and
    Subqueries.


# Analysis
## Aggregate function using union

* Create a report that summarizes total sales and payments for both halves of the year, including the remaining balance due.

    ## Query
    ![input of aggregate functions using union](<images/Screenshot 2024-12-15 190937.png>)
    
    ## Output
    ![aoutput of aggregate functions using union](<images/Screenshot 2024-12-15 185959.png>)


## Group By & Order By Clause

* Create a report that summarizes the total payments  for each day as well as the payment method

    ## Query
    ![input Group By & Order By Clause](<images/Screenshot 2024-12-15 191802.png>)
    ## Output
    ![output Group By & Order By Clause](<images/Screenshot 2024-12-15 191809.png>)


## Inner Join
* Create a report of all the items that have been ordered along with the product name, unit price quatity, order_id, and product_id.

    ## Query
    ![Inner join](images/image-1.png)

    ## Output
    ![Inner join](images/image.png)

## Outer Join Multiple Tables
* Create a report of all orders placed by each client along with the order status

    ## Query
    ![Outer join mutiple tables](images/image-29.png)

    ## Output
    ![Outer join multiple tables](images/image-30.png)

## The USING clause

* create a report of all payments mmade by each client along with the payment date and payment type

    ## Query 
    ![the using clause](images/image-31.png)

    ## Output
    ![the using clause](images/image-32.png)

## Having

* Create a report of all customers located in Virginia who have spent more than $100

    ## Query 
    ![the having clause](images/image-6.png)

    ## Output
    ![the having clause](images/image-7.png)

## Sub queries

* Create a report of all products that are more expensive than Lettuce(id = 3)
    ## Query
    ![Sub query](images/image-8.png)

    ## Output
    ![Sub query](images/image-9.png)

* In the sql_hr database: find emplyees who earn more than average 

    ## Query
    ![sub query](images/image-10.png)

    ## Output
    ![sub query](images/image-11.png)

* Create a report of all the products that have never been ordered

 ## Query
 ![sub query](images/image-12.png)

 ## Output
 ![sub query](images/image-13.png)

* Create a report of all the clients without invoices 

    ## Query
    ![Sub query](images/image-14.png)

    ## Output
    ![Sub query](images/image-15.png)

* Create a report of all customers who have ordered lettuce (id = 3) using subquery

    ## Query
    ![Sub query](images/image-16.png)

    ## Output
    ![Subquery](images/image-17.png)


* Create a report of invoices larger than all invoices of client 3 using the Max and ALL function 

    ## Query: Max
    ![max query](images/image-18.png)

    ## Query: ALL
    ![All query](images/image-19.png)

    ## Output
    ![output](images/image-20.png)

* Create a report of all clients with at least two invoices using the ANY and IN operator

    ## Query
    ![any and in operator](images/image-21.png)

    ## Output
    ![any and in operator](images/image-22.png)


## Correlated Subqueries

* Create a report of all employees whose salary is above the average in their office

    ## Query
    ![correlated subquery](images/image-23.png)

    ## Output
    ![correlated subquery](images/image-24.png)

* Create a report of all the invoices that are larger than the client's average invoice amount

    ## Query
    ![correlated subquery](images/image-25.png)

    ## Output
    ![correlated subquery](images/image-26.png)

* Create a report all the clients that have an invoice

    ## Query
    ![sub query](images/image-27.png)

    ## Output
    ![sub query](images/image-28.png)

* Create a report of all the clients that have an invoice using the exist operator



* Create a report of all the products that have never been ordered 
