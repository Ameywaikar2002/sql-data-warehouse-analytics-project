--11.DATA SEGMENTATION (GROUPING THE DATA BASED ON SPECIFIC RANGE)
--IT HELPS TO UNDERSTAND THE CORRELATION BETWEEN TWO MEASURES
--FORMULA:- MEASURE BY MEASURE

--segmenting products into cost ranges and counting how many products fall into each segment(USING CTE)
WITH product_segments AS (
SELECT 
product_key,
product_name,
cost,
CASE WHEN cost < 100 THEN 'BELOW 100'
	 WHEN cost between 100 and 500 THEN '100-500'
	 WHEN cost between 500 and 1000 THEN '500-1000'
	 ELSE 'ABOVE 1000'
END as cost_range
FROM gold.dim_products)

SELECT 
cost_range,
count(product_key) as total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

--grouping customers into three segments based on their spending behavior
--VIP:- at least 12 months
--REGULAR:- at least 12 months of history but spending 5000 or less
--NEW:- lifespan less than 12 months
--and finding the total number of customers by each group
--(USING CTE)
WITH customer_spending AS(
SELECT
c.customer_key,
SUM(f.sales_amount) as total_spending,
MIN(order_date) as first_order,
MAX(order_date) as last_order,
DATEDIFF(month, min(order_date) , max(order_date) ) as lifespan
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
on f.customer_key = c.customer_key
GROUP BY c.customer_key
)

--(selecting from my cte but also a subquery for better readability)
SELECT customer_segment ,  
count(customer_key) as total_customers
FROM(
SELECT
customer_key,
CASE WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
     WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'REGULAR' 
	 ELSE 'NEW'
END as customer_segment
FROM customer_spending)t
GROUP BY customer_segment
ORDER BY total_customers desc;
--****************************************************************************************
--****************************************************************************************