--3.DATE EXPLORATION

--checking the earliest and the latest date(boundaries)
--date of first and last order
select MIN(order_date) as first_order_date,
MAX(order_date) as last_order_date,
DATEDIFF(YEAR, min(order_date), max(order_date)) as order_range_years,
DATEDIFF(MONTH, min(order_date), max(order_date)) as order_range_months
from gold.fact_sales

--finding the youngest and the oldest customer
select MAX(birthdate) as youngest_customer, 
MIN(birthdate) as oldest_customer,
DATEDIFF(YEAR, max(birthdate), GETDATE()) as age_of_youngest,
DATEDIFF(YEAR, min(birthdate), GETDATE()) as age_of_oldest
from gold.dim_customers
------------------------------------------------------------