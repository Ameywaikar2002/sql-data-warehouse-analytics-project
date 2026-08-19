--6.RANKING ANALYSIS
--ordering the values of dimensions by measures
--FORMULA:- ranking(dimension) by measure

--top 5 products generating the highest revenue
SELECT TOP 5
p.product_name, sum(f.sales_amount) as total_revenue FROM gold.fact_sales f
LEFT JOIN
gold.dim_products p
on f.product_key = p.product_key
group by p.product_name
order by total_revenue desc

--using window function row_number
SELECT * FROM(
SELECT
p.product_name, sum(f.sales_amount) as total_revenue,
ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) desc) as rank_products
FROM gold.fact_sales f
LEFT JOIN
gold.dim_products p
on f.product_key = p.product_key
group by p.product_name)t
where rank_products <=5


--*****************************************************************


--worst 5 performing products in terms of sales
SELECT TOP 5
p.product_name, sum(f.sales_amount) as total_revenue FROM gold.fact_sales f
LEFT JOIN
gold.dim_products p
on f.product_key = p.product_key
group by p.product_name
order by total_revenue asc


--using window function row_number
SELECT * FROM(
SELECT
p.product_name, sum(f.sales_amount) as total_revenue,
ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) asc) as rank_products
FROM gold.fact_sales f
LEFT JOIN
gold.dim_products p
on f.product_key = p.product_key
group by p.product_name)t
where rank_products <=5

----******************************************************************************************************
----******************************************************************************************************