\# Phase 3 – ETL Pipeline using SQL and PySpark



\## Overview



Phase 3 focuses on building an ETL (Extract, Transform, Load) pipeline using SQL and PySpark. The objective is to read customer and sales datasets, clean and validate the data, perform business transformations, and generate analytical reports.



This phase demonstrates how SQL queries can be converted into PySpark DataFrame operations to build scalable data processing pipelines.



\---



\## Objectives



\- Load customer and sales datasets.

\- Perform data cleaning and validation.

\- Remove null and invalid records.

\- Build ETL pipelines using PySpark.

\- Generate business reports from transformed data.

\- Compare SQL queries with equivalent PySpark implementations.



\---



\## ETL Process



\### Extract



\- Read customer dataset from CSV.

\- Read sales dataset from CSV.

\- Create Spark Session.

\- Load data into PySpark DataFrames.



\### Transform



\- Remove null values.

\- Filter invalid records.

\- Validate customer and sales data.

\- Perform joins between datasets.

\- Apply grouping and aggregation.

\- Sort analytical results.



\### Load



\- Display processed reports.

\- Generate final reporting tables.

\- Prepare transformed datasets for analytics.



\---



\## Topics Covered



\### Data Loading



\- Spark Session Creation

\- Reading CSV Files

\- Loading Customer Dataset

\- Loading Sales Dataset



\---



\### Data Cleaning



\- Removing Null Values

\- Filtering Invalid Customer Records

\- Filtering Invalid Sales Records



\---



\### Data Transformation



\- Joins

\- Group By

\- Aggregate Functions

\- Sorting

\- Filtering

\- Business Calculations



\---



\## Business Pipeline Tasks



\### Task 1 – Daily Sales



Calculates total sales for each day after cleaning the sales dataset.



\---



\### Task 2 – City-wise Revenue



Generates total revenue for every city by joining customer and sales datasets.



\---



\### Task 3 – Repeat Customers



Identifies customers who placed more than two orders.



\---



\### Task 4 – Highest Spending Customer in Each City



Finds the customer with the highest spending in every city.



\---



\### Task 5 – Final Reporting Table



Generates a consolidated report containing:



\- Customer ID

\- Customer Name

\- City

\- Total Spending

\- Order Count



\---



\## SQL Concepts Used



\- INNER JOIN

\- GROUP BY

\- SUM()

\- COUNT()

\- ORDER BY

\- Filtering

\- Data Validation



\---



\## PySpark Concepts Used



\- SparkSession

\- DataFrame API

\- dropna()

\- filter()

\- join()

\- groupBy()

\- agg()

\- sum()

\- count()

\- orderBy()



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



\- phase3-sql.sql

\- phase3-pyspark.py

\- README.md

\- Output Screenshots



\---



\## Learning Outcomes



After completing this phase, the following concepts were learned:



\- ETL Pipeline Development

\- Data Cleaning Techniques

\- Data Validation

\- SQL to PySpark Conversion

\- DataFrame Transformations

\- Business Report Generation

\- Aggregation Functions

\- Customer Analytics

\- Revenue Analysis

\- Reporting using SQL and PySpark



\---



\## Author



\*\*Guttikonda Harshitha\*\*

