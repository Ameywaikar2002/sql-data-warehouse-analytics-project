--8.CUMULATIVE ANALYSIS(AGGREGATING THE DATA PROGRESSIVELY OVER TIME)
--IT HELPS TO UNDERSTAND WHETHER OUR BUSINESS IS GROWING OR DECLINING
--FORMULA :- CUMULATIVE MEASURE BY DATE DIMENSION

--calculating the total sales per month and running total sales over time
SELECT 
order_date,
total_sales,
SUM(total_sales) over(partition  by order_date order by order_date) as running_total_sales
FROM(
SELECT DATETRUNC(month ,order_date) as order_date,
SUM(sales_amount) as total_sales
FROM gold.fact_sales	
where order_date is not null
GROUP BY DATETRUNC(month ,order_date)
)t

--or---
--(SPECIFIALLY BY YEAR)...ALSO CHECKING THE MOVING AVG
SELECT 
order_date,
total_sales,
avg_price,
SUM(total_sales) over(order by order_date) as running_total_sales,
AVG(avg_price) over(order by order_date) as moving_avg_price
FROM(
SELECT DATETRUNC(year ,order_date) as order_date,
SUM(sales_amount) as total_sales,
AVG(price) as avg_price
FROM gold.fact_sales	
where order_date is not null
GROUP BY DATETRUNC(year ,order_date)
)t;
--****************************************************************************
