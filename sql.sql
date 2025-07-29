ALTER TABLE superstore_cleaned
  ALTER COLUMN "Order Date" TYPE timestamp USING "Order Date"::timestamp,
  ALTER COLUMN "Ship Date" TYPE timestamp USING "Ship Date"::timestamp;


-- 1. Total Rows
SELECT count(*)FROM superstore_cleaned;

-- 2.Total Sales by Product;
SELECT "Product Name", SUM("Sales") AS total_sales
FROM superstore_cleaned
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;

-- 3. Monthly Revenue Trend
SELECT DATE_TRUNC('month', "Order Date") AS month, SUM("Sales") AS monthly_sales
FROM superstore_cleaned
GROUP BY month
ORDER BY month;

-- 4. Sales by Region and Category
SELECT "Region", "Category", SUM("Sales") AS total_sales
FROM superstore_cleaned
GROUP BY "Region", "Category"
ORDER BY "Region", total_sales DESC;
