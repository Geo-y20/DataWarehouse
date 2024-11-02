-- 1. Check total number of records in Sales table
SELECT COUNT(*) AS total_records
FROM Sales;

-- 2. View a sample of records from Sales table
SELECT *
FROM Sales
LIMIT 10;

-- 3. Calculate total sales by region
SELECT r.region_name, SUM(s.sales) AS total_sales
FROM Sales s
JOIN Region r ON s.region_id = r.region_id
GROUP BY r.region_name;

-- 4. Calculate total profit by product category
SELECT p.category, SUM(s.profit) AS total_profit
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
GROUP BY p.category;

-- 5. Sales and profit over time (yearly)
SELECT t.year, SUM(s.sales) AS total_sales, SUM(s.profit) AS total_profit
FROM Sales s
JOIN Time t ON s.time_id = t.time_id
GROUP BY t.year
ORDER BY t.year;

-- 6. Top 5 customers by total sales
SELECT c.customer_name, SUM(s.sales) AS total_sales
FROM Sales s
JOIN Customer_Details c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC
LIMIT 5;

-- 7. Average discount by product category
SELECT p.category, AVG(s.discount) AS avg_discount
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
GROUP BY p.category;

-- 8. Monthly sales trends for a specific year (e.g., 2021)
SELECT t.month, SUM(s.sales) AS monthly_sales
FROM Sales s
JOIN Time t ON s.time_id = t.time_id
WHERE t.year = 2021
GROUP BY t.month
ORDER BY t.month;

-- 9. Total sales and profit by region and product category
SELECT r.region_name, p.category, SUM(s.sales) AS total_sales, SUM(s.profit) AS total_profit
FROM Sales s
JOIN Region r ON s.region_id = r.region_id
JOIN Product p ON s.product_id = p.product_id
GROUP BY r.region_name, p.category
ORDER BY r.region_name, total_sales DESC;

-- 10. Yearly growth in sales
SELECT 
    t1.year AS current_year,
    SUM(s1.sales) AS current_sales,
    SUM(s1.sales) - COALESCE(SUM(s2.sales), 0) AS sales_growth
FROM Sales s1
JOIN Time t1 ON s1.time_id = t1.time_id
LEFT JOIN Sales s2 ON s1.customer_id = s2.customer_id
LEFT JOIN Time t2 ON s2.time_id = t2.time_id AND t1.year = t2.year + 1
GROUP BY t1.year
ORDER BY t1.year;
