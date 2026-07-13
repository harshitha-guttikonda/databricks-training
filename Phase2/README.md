\# Phase 2 – SQL Queries and PySpark Data Analysis



\## Overview



Phase 2 focuses on analyzing customer and sales data using SQL and PySpark. The objective of this phase is to understand how SQL queries can be implemented using PySpark DataFrame operations while performing common business analytics tasks.



This phase introduces data loading, data exploration, joins, filtering, aggregation, sorting, and reporting techniques using real-world customer and sales datasets.



\---



\## Objectives



\- Load customer and sales datasets.

\- Understand SQL to PySpark conversion.

\- Perform data analysis using DataFrames.

\- Generate business reports using aggregation functions.

\- Practice joins and filtering techniques.

\- Compare SQL queries with equivalent PySpark code.



\---



\## Dataset Used



\### Customers Dataset

Contains customer information such as:



\- Customer ID

\- First Name

\- Last Name

\- Email

\- Phone Number

\- Address

\- City

\- State

\- ZIP Code



\### Sales Dataset

Contains sales transaction details including:



\- Sale ID

\- Customer ID

\- Product

\- Quantity

\- Unit Price

\- Total Amount

\- Order Date



\---



\## Topics Covered



\### Data Loading



\- Creating a Spark Session

\- Reading CSV files

\- Loading customer dataset

\- Loading sales dataset

\- Displaying complete datasets



\---



\### Data Exploration



\- Displaying schemas

\- Viewing complete datasets

\- Understanding column data types



\---



\### SQL and PySpark Concepts



\- DataFrame Operations

\- Inner Join

\- Left Anti Join

\- Group By

\- Aggregate Functions

\- Sorting

\- Filtering

\- Column Selection



\---



\## Exercises Implemented



\### Exercise 1

\*\*Total Order Amount for Each Customer\*\*



Calculates the total spending of every customer by joining customer and sales datasets and applying the SUM aggregation.



\---



\### Exercise 2

\*\*Top 3 Customers by Total Spend\*\*



Finds the top three customers based on the highest purchase amount.



\---



\### Exercise 3

\*\*Customers with No Orders\*\*



Uses a Left Anti Join to identify customers who have not placed any orders.



\---



\### Exercise 4

\*\*City-wise Total Revenue\*\*



Calculates the total revenue generated from each city.



\---



\### Exercise 5

\*\*Average Order Amount per Customer\*\*



Computes the average purchase amount for every customer.



\---



\### Exercise 6

\*\*Customers with More Than One Order\*\*



Identifies repeat customers by counting the number of orders placed.



\---



\### Exercise 7

\*\*Sort Customers by Total Spend\*\*



Displays customers ordered from highest spender to lowest spender.



\---



\## Technologies Used



\- SQL

\- PySpark

\- Apache Spark

\- CSV Files

\- Microsoft SQL Server (SSMS)

\- Git

\- GitHub



\---



\## Files Included



\- phase2-sql.sql

\- phase2-pyspark.py

\- README.md

\- Output Screenshots



\---



\## Learning Outcomes



After completing this phase, the following concepts were understood:



\- Reading CSV files using PySpark

\- Creating Spark Sessions

\- SQL to PySpark conversion

\- DataFrame transformations

\- Joining multiple datasets

\- Aggregate functions

\- Business analytics using customer and sales data

\- Reporting using SQL and PySpark



\---



\## Author



\*\*Guttikonda Harshitha\*\*

