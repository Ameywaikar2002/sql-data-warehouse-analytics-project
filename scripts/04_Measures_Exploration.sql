--4.MEASURES EXPLORATION(BIG NUMBERS)

--finding total sales
SELECT sum(sales_amount) as total_sales FROM gold.fact_sales

--how many items are sold
SELECT sum(quantity) as total_qauntity FROM gold.fact_sales

--avg selling price
SELECT avg(price) as avg_price FROM gold.fact_sales

--total number of orders
SELECT count(distinct order_number) FROM gold.fact_sales

--total number of products
SELECT count(distinct product_name) FROM gold.dim_products

--total number of customers
SELECT count(customer_key) FROM gold.dim_customers
--or
SELECT count(distinct customer_key) FROM gold.fact_sales

---NOW GENERATING A REPORT THAT SHOWS ALL THE KEY METRICS OF OUR BUSINESS
SELECT 'TOTAL SALES' AS measure_name,  sum(sales_amount) as measure_value FROM gold.fact_sales
UNION ALL
SELECT 'TOTAL QUANTITY' , sum(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'AVG PRICE', avg(price) FROM gold.fact_sales
UNION ALL
SELECT 'NUMBER OF ORDERS', COUNT(distinct order_number) FROM gold.fact_sales
UNION ALL
SELECT 'TOTAL NO OF PRODUCTS', COUNT(distinct product_name) FROM gold.dim_products
UNION ALL
SELECT 'TOTAL CUSTOMERS' , COUNT(distinct customer_key) FROM gold.dim_customers;
------------------------------------------------------------