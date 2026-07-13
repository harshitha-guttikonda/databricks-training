
from pyspark.sql import SparkSession
from pyspark.sql.functions import sum, avg, count, desc, col,     when


# ===========================================================
# Create Spark Session
# ===========================================================

spark = SparkSession.builder \
    .appName("Phase4_Mini_Project") \
    .getOrCreate()
# =======================================
spark = SparkSession.builder.appName('Spark Playground').getOrCreate()

# ===========================================================
# Load CSV Files
# ===========================================================

customers = spark.read.format("csv") \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .load("/samples/customers.csv")

sales = spark.read.format("csv") \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .load("/samples/sales.csv")
# =================================================
# customers = spark.read.format('csv').option('header','true').load('/samples/customers.csv')
# sales= spark.read.format('csv').option('header', 'true').load('/samples/sales.csv')



customers.printSchema()
sales.printSchema()
customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])


# ===========================================================
# Display Data
# ===========================================================

print("Customers Table")
customers.show(customers.count(), truncate=False)

print("Sales Table")
sales.show(sales.count(), truncate=False)


# ==========================================================
# Data Cleaning
# ==========================================================

customers_clean = customers.dropna() \
    .dropDuplicates() \
    .filter(col("customer_id") > 0)

sales_clean = sales.dropna() \
    .dropDuplicates() \
    .filter(col("total_amount") >= 0)

# ===========================================================
# Display Clean Data
# ==========================================================

print("Clean Customers")

customers_clean.orderBy("customer_id") \
    .show(customers_clean.count(), truncate=False)

print("Clean Sales")

sales_clean.orderBy("sale_id") \
    .show(sales_clean.count(), truncate=False)


# ==========================================================
# Record Count
# ==========================================================

print("Original Customers :", customers.count())
print("Clean Customers    :", customers_clean.count())

print("Original Sales     :", sales.count())
print("Clean Sales        :", sales_clean.count())

# ==========================================================
# Task 1 : Daily Sales
# Output : sale_date, total_sales
# ==========================================================

print("Task 1 : Daily Sales")

daily_sales = sales_clean.groupBy("sale_date") \
    .agg(
        sum("total_amount").alias("total_sales")
    ) \
    .orderBy("sale_date")

daily_sales.show(daily_sales.count(), truncate=False)

# ==========================================================
# Task 2 : City-wise Revenue
# Output : city, total_revenue
# ==========================================================

print("Task 2 : City-wise Revenue")

city_revenue = customers_clean.join(
    sales_clean,
    "customer_id"
).groupBy("city") \
 .agg(
     sum("total_amount").alias("total_revenue")
 ) \
 .orderBy(desc("total_revenue"))

city_revenue.show(city_revenue.count(), truncate=False)

# ==========================================================
# Task 3 : Top 5 Customers
# Output : customer_name, total_spend
# ==========================================================

print("Task 3 : Top 5 Customers")

top5_customers = customers_clean.join(
    sales_clean,
    "customer_id"
).groupBy(
    "customer_id",
    "first_name",
    "last_name"
).agg(
    sum("total_amount").alias("total_spend")
).orderBy(
    desc("total_spend")
).limit(5)

top5_customers.show(top5_customers.count(), truncate=False)

# ==========================================================
# Task 4 : Repeat Customers (>1 Order)
# Output : customer_id, order_count
# ==========================================================

print("Task 4 : Repeat Customers (>1 Order)")

repeat_customers = sales_clean.groupBy(
    "customer_id"
).agg(
    count("sale_id").alias("order_count")
).filter(
    col("order_count") > 1
).orderBy(
    "customer_id"
)

repeat_customers.show(repeat_customers.count(), truncate=False)

# ==========================================================
# Task 5 : Customer Segmentation
# Output : customer_name, total_spend, segment
# ==========================================================

print("Task 5 : Customer Segmentation")

customer_segment = customers_clean.join(
    sales_clean,
    "customer_id"
).groupBy(
    "customer_id",
    "first_name",
    "last_name"
).agg(
    sum("total_amount").alias("total_spend")
)

customer_segment = customer_segment.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when((col("total_spend") >= 5000) &
          (col("total_spend") <= 10000), "Silver")
    .otherwise("Bronze")
).orderBy("customer_id")

customer_segment.show(customer_segment.count(), truncate=False)

# ==========================================================
# Task 6 : Final Reporting Table
# Output :
# customer_name, city, total_spend, order_count, segment
# ==========================================================

print("Task 6 : Final Reporting Table")

final_df = customers_clean.join(
    sales_clean,
    "customer_id"
).groupBy(
    "customer_id",
    "first_name",
    "last_name",
    "city"
).agg(
    sum("total_amount").alias("total_spend"),
    count("sale_id").alias("order_count")
)

final_df = final_df.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when((col("total_spend") >= 5000) &
          (col("total_spend") <= 10000), "Silver")
    .otherwise("Bronze")
).orderBy("customer_id")

final_df.show(final_df.count(), truncate=False)

# ==========================================================
# Task 7 : Save Output
# ==========================================================
final_df.write \
    .mode("overwrite") \
    .option("header", "true") \
    .csv("/tmp/report")
saved_df = spark.read \
    .option("header", "true") \
    .csv("/tmp/report")

saved_df.show(saved_df.count(), truncate=False)

# ==========================================================
# Phase 4 Completed
# ==========================================================

print("=========================================")
print("Phase 4 Mini Project Completed Successfully")
print("=========================================")