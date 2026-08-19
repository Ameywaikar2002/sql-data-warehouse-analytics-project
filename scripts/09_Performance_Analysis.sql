--9.PERFROMANCE ANALYSIS(COMPARING CURRENT VALUE WITH TARGET VALUE)
--IT HELPS MEASURE SUCCESS AND COMPARE PERFORMANCE
--FORMULA:- CURRENT MEASURE - TARGET MEASURE

--analysing the yearly performance of products by comparing each product's sales to both its avg sales performance and the previous year's sales(USING CTE)
WITH yearly_product_sales as(
SELECT 
YEAR(f.order_date) as order_year,
p.product_name,
SUM(f.sales_amount) as current_sales
FROM gold.fact_sales f
LEFT  JOIN
gold.dim_products p
on f.product_key = p.product_key
WHERE f.order_date is not null
GROUP BY YEAR(f.order_date), p.product_name)

--(COMPARING THE CURRENT SALES WITH THE AVG SALES)
SELECT
product_name,
order_year,
current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) as avg_sales,
current_sales - AVG(current_sales) OVER(PARTITION BY product_name) as difference_in_avg,
CASE WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) > 0 THEN 'ABOVE AVERAGE'
	 WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) < 0 THEN 'BELOW AVERAGE'
	 ELSE 'AVERAGE'
END as avg_change
FROM yearly_product_sales
ORDER BY product_name, order_year;
----&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

--(COMPARING THE CURRENT SALES WITH THE PREVIOUS YEAR'S SALES)
WITH yearly_product_sales as(
SELECT 
YEAR(f.order_date) as order_year,
p.product_name,
SUM(f.sales_amount) as current_sales
FROM gold.fact_sales f
LEFT  JOIN
gold.dim_products p
on f.product_key = p.product_key
WHERE f.order_date is not null
GROUP BY YEAR(f.order_date), p.product_name)

SELECT
product_name,
order_year,
current_sales,
LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) as previous_year_sales,
current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) as diff_in_previous_sales,
CASE WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) > 0 THEN 'INCREASING'
	 WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) < 0 THEN 'DECREASING'
	 ELSE 'NO CHANGE'
END as previous_year_change
FROM yearly_product_sales
WHERE order_year is not null
ORDER BY product_name, order_year;
--****************************************************************************