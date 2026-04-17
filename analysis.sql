-- ECOMMERCE SQL ANALYSIS PROJECT
-- Author: Srujana Mudunuru

-- 1. Total Revenue
SELECT 
    SUM(quantity * unitprice) AS total_revenue
FROM retail_data;

-- 2. Top 10 Customers by Spending
SELECT 
    customerid,
    SUM(quantity * unitprice) AS total_spent
FROM retail_data
WHERE customerid IS NOT NULL
GROUP BY customerid
ORDER BY total_spent DESC
LIMIT 10;

-- 3. Most Purchased Products
SELECT 
    description,
    SUM(quantity) AS total_quantity
FROM retail_data
GROUP BY description
ORDER BY total_quantity DESC
LIMIT 10;

-- 4. Revenue by Country
SELECT 
    country,
    SUM(quantity * unitprice) AS revenue
FROM retail_data
GROUP BY country
ORDER BY revenue DESC;

-- 5. Average Order Value
SELECT 
    ROUND(AVG(quantity * unitprice), 2) AS avg_order_value
FROM retail_data;
-- Customer Segmentation (High / Medium / Low Spenders)
SELECT 
    customerid,
    SUM(quantity * unitprice) AS total_spent,
    CASE 
        WHEN SUM(quantity * unitprice) > 10000 THEN 'High Value'
        WHEN SUM(quantity * unitprice) BETWEEN 5000 AND 10000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM retail_data
WHERE customerid IS NOT NULL
GROUP BY customerid;
