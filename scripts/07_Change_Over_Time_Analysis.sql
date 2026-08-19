-- ADVANCE DATA ANALYSIS

--7. CHANGE OVER TIME ANALYSIS(IT GIVES A HIGH-LEVEL OVERVIEW INSIGHTS THAT HELPS WITH STRATEGIC DECISION MAKING)
--ANALYSING HOW MEASURE EVOLVES OVER TIME
--IT HELPS TO TRACK TRENDS AND IDENTIFY SEASONALITY OVER DATA
--FORMULA:- MEASURE BY DATE DIMENSION

--analyse the sales performance, customers, quantity over time(years)
SELECT YEAR(order_date) as order_year ,
SUM(sales_amount) as total_sales,
COUNT(distinct customer_key) as total_customers,
COUNT(distinct product_key) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)

--analyse the sales performance, customers, quantity over time(months)
SELECT MONTH(order_date) as order_year ,
SUM(sales_amount) as total_sales,
COUNT(distinct customer_key) as total_customers,
COUNT(distinct product_key) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date)

--OR-----

SELECT DATENAME(month,order_date) as order_year ,
SUM(sales_amount) as total_sales,
COUNT(distinct customer_key) as total_customers,
COUNT(distinct product_key) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATENAME(month,order_date)
ORDER BY DATENAME(month,order_date)

--OR BOTH(months and year) in one

SELECT DATETRUNC(month ,order_date) as order_year ,
SUM(sales_amount) as total_sales,
COUNT(distinct customer_key) as total_customers,
COUNT(distinct product_key) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month ,order_date)
ORDER BY DATETRUNC(month ,order_date);
--*************************************************************************