--10.PART TO WHOLE ANALYSIS(PROPORTIONAL)
--IT HELPS TO ANALYSE HOW AN INDIVIDUAL PART IS PERFORMING COMPARED TO THE OVERALL, ALLOWING US TO UNDERSTAND WHICH CATEGORY HAS THE GREATEST IMPACT ON BUSINESS
--FORMULA:- (MEASURE / TOTAL MEASURE) * 100    BY CATEGORY

--category that contributes the most to overall sales(USING CTE)
WITH category_sales AS(
SELECT 
p.category,
SUM(f.sales_amount) as total_sales
FROM gold.fact_sales f
LEFT JOIN
gold.dim_products p
ON f.product_key = p.product_key
GROUP BY category)

SELECT 
category,
total_sales,
SUM(total_sales) OVER() as overall_sales,
CONCAT(ROUND((CAST (total_sales as FLOAT)/ SUM(total_sales) OVER() )* 100, 2), '%') as percentage_of_total
FROM category_sales
ORDER BY total_sales desc;
--****************************************************************************************