
from pyspark.sql import SparkSession
from pyspark.sql.functions import sum, avg, count, desc, col

# ===========================================================
# Create Spark Session
# ===========================================================

spark = SparkSession.builder \
    .appName("Spark Playground") \
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
# ===========================================================
# Exercise 1
# Total Order Amount for Each Customer
# ===========================================================
print("Exercise 1 :  Total Order Amount for Each Customer")


#result = customers.join(sales, "customer_id") \
 #   .groupBy("customer_id", "first_name", "last_name") \
  #  .agg(sum("total_amount").alias("total_spend")) \
  #  .orderBy("customer_id")

# result.show(result.count(), truncate=False)

# =========================================================


result = customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(sum("total_amount").alias("total_spend")) \
    .orderBy(col("customer_id").cast("int").asc())

result.show(result.count(), truncate=False)

# ===========================================================
# Exercise 2
# Top 3 Customers by Total Spend
# ===========================================================
print("Exercise 2 : Top 3 Customers by Total Spend")


result = customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(sum("total_amount").alias("total_spend")) \
    .orderBy(desc("total_spend")) \
    .limit(3)

result.show()

# ===========================================================
# Exercise 3
# Customers with No Orders
# ===========================================================
print("Exercise 3 :Customers with No Orders")


result = customers.join(sales, "customer_id", "left_anti")

result.show()

# ===========================================================
# Exercise 4
# City-wise Total Revenue
# ===========================================================
print("Exercise 4 : City-wise Total Revenue")


result = customers.join(sales, "customer_id") \
    .groupBy("city") \
    .agg(sum("total_amount").alias("total_revenue")) \
    .orderBy(desc("total_revenue"))

result.show()

# ===========================================================
# Exercise 5
# Average Order Amount per Customer
# ===========================================================

print("Exercise 5 : Average Order Amount per Customer")

result = customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(avg("total_amount").alias("average_order")) \
    .orderBy("customer_id")

result.show()

# ===========================================================
# Exercise 6
# Customers with More Than One Order
# ===========================================================
print("Exercise 6: Customers with More Than One Order")


result = customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(count("sale_id").alias("total_orders")) \
    .filter("total_orders > 1")

result.show()

# ===========================================================
# Exercise 7
# Sort Customers by Total Spend Descending
# ===========================================================


print("Exercise 7: Sort Customers by Total Spend Descendingr")

result = customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "last_name") \
    .agg(sum("total_amount").alias("total_spend")) \
    .orderBy(desc("total_spend"))

result.show()

