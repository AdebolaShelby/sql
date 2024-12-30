# Creating a SQL database and executing queries to analyze data and generate reports.

I created a MySQL database for an e-commerce company that stores various types of data, including inventory information, invoicing details, customer records, order data, and employee information. After establishing the database, I performed queries to analyze the data and generate reports. 
I utilized several functions and clauses, such as SELECT, FROM, INNER JOIN, OUTER JOIN, USING, WHERE, GROUP BY, WITH ROLLUP, HAVING, ORDER BY, CASE, EXISTS, ANY, IN, and Subqueries.

# Analysis
## Aggregate function using union

* Create a report that summarizes total sales and payments for both halves of the year, including the remaining balance due.

    ## Query
    ![input of aggregate functions using union](<images/Screenshot 2024-12-15 190937.png>)
    
    ## Output
    ![aoutput of aggregate functions using union](<images/Screenshot 2024-12-15 185959.png>)


## Group By & Order By Clause

* Create a report that summarizes the total payments  for each day as well as the payment method.

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
* Create a report of all orders placed by each client along with the order status.

    ## Query
    ![Outer join mutiple tables](images/image-29.png)

    ## Output
    ![Outer join multiple tables](images/image-30.png)

## The USING Clause

* create a report of all payments mmade by each client along with the payment date and payment type.

    ## Query 
    ![the using clause](images/image-31.png)

    ## Output
    ![the using clause](images/image-32.png)

## The Having Clause

* Create a report of all customers located in Virginia who have spent more than $100.

    ## Query 
    ![the having clause](images/image-6.png)

    ## Output
    ![the having clause](images/image-7.png)

## The Roll Up Operator

* Create a reprt that summarizes the total payment made for each payment method.

    ## Query
    ![WITH ROLLUP](images/image-33.png)

    ## Output
    ![with roll up output](images/image-34.png)

## The Case Operator

* Generate a report of all customers and categorize them based on their points. Customers with more than 3000 points should be labeled as "Gold." Those with points ranging from 2000 to 3000 should be labeled as "Silver," and customers with fewer than 2000 points should be labeled as "Bronze."
    ## Query
    ![alt text](images/image-50.png)

    ## Output
    ![alt text](images/image-51.png)

## Subqueries

* Create a report of all products that are more expensive than Lettuce(id = 3).
    ## Query
    ![alt text](images/image-35.png)

    ## Output
    ![alt text](images/image-36.png)
    

* In the sql_hr database, find the employees who earn more than average.

    ## Query
    ![alt text](images/image-10.png)

    ## Output
    ![alt text](images/image-11.png)

* Create a report of all the products that have never been ordered.

 ## Query
 ![alt text](images/image-12.png)

 ## Output
 ![alt text](images/image-13.png)

* Create a report of all the clients without an invoice.

    ## Query
    ![alt text](images/image-14.png)

    ## Output
    ![Sub query](images/image-15.png)

* Create a report of all customers who have ordered lettuce (id = 3) using subquery.

    ## Query
    ![alt text](images/image-16.png)

    ## Output
    ![Subquery](images/image-17.png)


* Create a report of invoices larger than all invoices of client 3 using the Max and ALL function.

    ## Query: Max
    ![max query](images/image-18.png)

    ## Query: ALL
    ![All query](images/image-19.png)

    ## Output
    ![output](images/image-20.png)

* Create a report of all clients with at least two invoices using the ANY and IN operator.

    ## Query
    ![any and in operator](images/image-21.png)

    ## Output
    ![any and in operator](images/image-22.png)


## Correlated Subqueries

* Create a report of all employees whose salary is above the average in their office.

    ## Query
    ![correlated subquery](images/image-23.png)

    ## Output
    ![correlated subquery](images/image-24.png)

* Create a report of all the invoices that are larger than the client's average invoice amount.

    ## Query
    ![correlated subquery](images/image-25.png)

    ## Output
    ![correlated subquery](images/image-26.png)

* Create a report all the clients that have an invoice.

    ## Query
    ![sub query](images/image-27.png)

    ## Output
    ![sub query](images/image-28.png)

* Create a report of all the clients that have an invoice using the exist operator.

    ## Query
    ![alt text](images/image-37.png)

    ## Output
    ![alt text](images/image-38.png)

* Create a report of the total sales, and avarege sale for each client.

    ## Query
    ![alt text](images/image-39.png)

    ## Output
    ![alt text](images/image-40.png)

* Create a report for all orders placed in the current year.

    ## Query
    ![alt text](images/image-41.png)

* Extract the date of the most recent order.
 
    ## Query
    ![alt text](images/image-42.png)

    ## Output
    ![alt text](images/image-43.png)

* Create a report of all customers and their phone numbers, combine first name and last name in one column, if they don't have a phone number, assign 'unknown'.
    ## Query
    ![alt text](images/image-44.png)

    ## Output
    ![alt text](images/image-45.png)

* Create a report of all orders. Label as active if the order was placed in the current year, if not label as archived
    ## Query
    ![alt text](images/image-46.png)

    ## Output
    ![alt text](images/image-47.png)

* Create a report of all products along with the number of time they have been orders and the frequecy, if they have been oredered more than once, lalel frequency as 'many times'.
    ## Query
    ![alt text](images/image-48.png)

    ## Output
    ![alt text](images/image-49.png)