--Monthly Revenue Trend
SELECT 
	YEAR(order_date) AS order_year,
	MONTH(order_date) AS order_month,
	SUM(total_price) AS montly_revenue
FROM vw_Sales_view
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year,order_month;

--Monthly Order Volume
SELECT 
	YEAR(order_date) AS order_year,
	MONTH(order_date) AS order_month,
	COUNT(DISTINCT order_id) AS total_orders
FROM vw_Sales_view
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY order_year,order_month;

--Revenue by Product Category
SELECT 
	category,
	SUM(total_price) AS total_revenue,
	COUNT(DISTINCT order_id) AS total_orders
FROM vw_Sales_view
GROUP BY category
ORDER BY total_revenue DESC;

--Top 5 Best-Selling Products
SELECT TOP 5
	product_name,
	SUM(quantity) AS total_quantity,
	SUM(total_price) AS total_revenue
FROM vw_Sales_view
GROUP BY product_name
ORDER BY total_revenue DESC;

--Sales by Country
SELECT 
	country,
	SUM(total_price) AS total_revenue,
	COUNT(DISTINCT order_id) AS total_orders
FROM vw_Sales_view
GROUP BY country
ORDER BY total_revenue DESC;

--Average order value per Month.
SELECT
	YEAR(order_date) AS order_year,
	MONTH(order_date) AS order_month,
	SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM vw_Sales_view
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY order_year,order_month;

--Customer Lifetime Value (TOP 10)
SELECT TOP 10
	customer_id,
	first_name,
	last_name,
	SUM(total_price) AS lifetime_value,
	COUNT(DISTINCT order_id) AS total_orders
FROM vw_Sales_view
GROUP BY customer_id,first_name,last_name
ORDER BY lifetime_value DESC;

--Average Rating by Product
SELECT 
	product_name,
	AVG(CAST(rating AS FLOAT)) AS avg_rating,
	COUNT(review_id) AS total_reviews
FROM vw_Sales_view
WHERE rating IS NOT NULL
GROUP BY product_name
ORDER BY avg_rating DESC;

--Top 3 Months by Sales
SELECT TOP 3
	YEAR(order_date) AS order_year,
	MONTH(order_date) AS order_month,
	SUM(total_price) AS monthly_revenue
FROM vw_Sales_view
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY monthly_revenue DESC;
