\# Phase 4A – Bucketing and Customer Segmentation



\## Overview



Phase 4A focuses on implementing customer bucketing and segmentation techniques using SQL and PySpark. The objective is to classify customers into meaningful categories based on their purchasing behavior using both fixed threshold and quantile-based segmentation methods.



This phase demonstrates how customer analytics can be used to support business decision-making by identifying high-value, medium-value, and low-value customers.



\---



\## Objectives



\- Load customer and sales datasets.

\- Calculate customer spending.

\- Perform customer segmentation.

\- Implement fixed threshold bucketing.

\- Implement quantile-based bucketing.

\- Compare segmentation techniques.

\- Generate business insights from customer data.



\---



\## Workflow



\### Step 1 – Data Loading



\- Create Spark Session

\- Load Customer Dataset

\- Load Sales Dataset

\- Display Customer and Sales Data

\- Print Dataset Schema



\---



\### Step 2 – Customer Spend Analysis



\- Join Customer and Sales datasets

\- Calculate Total Spend per Customer

\- Display Customer Spending Report



\---



\### Step 3 – Customer Segmentation



Customers are classified into different spending categories.



\### Segments



\- Gold Customers

\- Silver Customers

\- Bronze Customers



Segmentation is performed using business rules based on customer spending.



\---



\### Step 4 – Count Customers by Segment



Calculates the total number of customers belonging to each customer segment.



Outputs:



\- Gold Customer Count

\- Silver Customer Count

\- Bronze Customer Count



\---



\### Step 5 – Quantile-based Segmentation



Implements customer bucketing using the NTILE() function.



Customers are divided into equal-sized groups based on spending.



Outputs:



\- Bronze

\- Silver

\- Gold



\---



\### Step 6 – Fixed Threshold Segmentation



Implements segmentation using predefined spending ranges.



Example:



\- Gold : Spending greater than 10000

\- Silver : Spending between 5000 and 10000

\- Bronze : Spending less than 5000



\---



\### Step 7 – Reflection



The project concludes with reflections on:



\- Importance of Bucketing

\- Business Segmentation

\- Technical Segmentation

\- Fixed Threshold Method

\- Quantile-based Method

\- Real-world Applications



\---



\## SQL Concepts Used



\- INNER JOIN

\- GROUP BY

\- SUM()

\- COUNT()

\- CASE Statement

\- NTILE()

\- Common Table Expressions (CTE)

\- ORDER BY

\- Aggregation Functions



\---



\## PySpark Concepts Used



\- SparkSession

\- DataFrame API

\- join()

\- groupBy()

\- agg()

\- sum()

\- count()

\- when()

\- orderBy()

\- DataFrame Transformations

\- Customer Segmentation



\---



\## Technologies Used



\- SQL

\- PySpark

\- Apache Spark

\- Microsoft SQL Server (SSMS)

\- CSV Files

\- Git

\- GitHub



\---



\## Files Included



\- phase4a-sql.sql

\- phase4a-pyspark.py

\- README.md

\- Output Screenshots



\---



\## Learning Outcomes



After completing this phase, the following concepts were learned:



\- Customer Bucketing

\- Customer Segmentation

\- Business Analytics

\- Fixed Threshold Classification

\- Quantile-based Segmentation

\- SQL Window Functions

\- SQL to PySpark Conversion

\- Customer Spending Analysis

\- Business Reporting

\- Data Analytics Techniques



\---



\## Author



\*\*Guttikonda Harshitha\*\*

