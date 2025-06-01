DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );

SELECT * FROM retail_sales
LIMIT 10
--Data cleaning
DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    
--Data exploration
--1.Total sales, Average Sales
SELECT 
  SUM("total_sale") AS total_sales,
  AVG("total_sale") AS avg_sales,
  SUM("total_sale" - "cogs") AS total_profit
FROM retail_sales;
--2.Trend
SELECT "sale_date",SUM("total_sale") AS total_sales
FROM retail_sales
GROUP BY "sale_date"
ORDER BY "sale_date";
--3.High-value customers
SELECT "customer_id",
count(*)  as total_transactions,
sum("total_sale")as total_sales,
avg("total_sale")as avg_sales
	FROM retail_sales
	GROUP BY "customer_id"
	Order by "total_sales";
--4. Unique customers
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales;
-- Data Analysis questions and answers

--1.What is the total revenue generated?

SELECT 
  SUM("total_sale") AS total_sales,
  SUM("total_sale" - "cogs") AS total_profit
FROM retail_sales;

--2.Which dates had the highest sales?

SELECT "sale_date",SUM("total_sale") as total_sales
FROM retail_sales
Group by "sale_date"
order by total_sales desc
LIMIT 5;

--3.Which products/categories contribute the most to total sales?

SELECT "category",SUM("total_sale") as total_sales
FROM retail_sales
group by category
order by total_sales desc;

--4.Which customers are the highest spenders?

SELECT "customer_id",SUM("total_sale")as total_sales
from retail_sales
group by "customer_id"
order by total_sales DESC;
--5. Are lower-priced items sold more frequently?
--What is the correlation between price and quantity?
SELECT "price_per_unit",avg("quantity") as avg_quantity
from retail_sales
group by "price_per_unit"
order by "price_per_unit";

--6.What time of day has the highest sales?
--Are weekends busier than weekdays?
--What are peak shopping hours?

SELECT 
  CASE 
    WHEN "sale_time"::time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN "sale_time"::time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
    WHEN "sale_time"::time BETWEEN '18:00:00' AND '21:59:59' THEN 'Evening'
    ELSE 'Night'
  END AS time_of_day,
  SUM("total_sale") AS total_sales
FROM retail_sales
GROUP BY time_of_day
ORDER BY total_sales DESC;

SELECT 
  TO_CHAR("sale_date", 'Day') AS day_of_week,
  COUNT(*) AS num_sales,
  SUM("total_sale") AS total_sales
FROM retail_sales
GROUP BY day_of_week
ORDER BY total_sales DESC;

--7.Do males or females buy more?
SELECT Gender, SUM("total_sale") AS total_sales
FROM retail_sales
GROUP BY Gender;

--8.Which age group is spending the most?

SELECT 
  CASE 
    WHEN Age < 20 THEN 'Under 20'
    WHEN Age BETWEEN 20 AND 29 THEN '20s'
    WHEN Age BETWEEN 30 AND 39 THEN '30s'
    WHEN Age BETWEEN 40 AND 49 THEN '40s'
    ELSE '50+'
  END AS age_group,
  COUNT(*) AS num_transactions,
  SUM("total_sale") AS total_sales
FROM retail_sales
GROUP BY age_group
ORDER BY total_sales DESC;

--9. Which categories are most profitable?
SELECT 
  category, 
  SUM("total_sale" - "cogs") AS total_profit
FROM retail_sales
GROUP BY category
ORDER BY total_profit DESC;

--10.Are there any negative prices or sales?

SELECT * 
FROM retail_sales
WHERE "price_per_unit" < 0 OR "total_sale"<0;
    
