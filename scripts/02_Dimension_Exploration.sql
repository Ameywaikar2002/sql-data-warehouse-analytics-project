-- 2.DIMENSION EXPLORATION

--exploring all the countries where from customers come from
select distinct country from gold.dim_customers;

--exploring all the categories-"THE MAJOR DIVISIONS"
select distinct category, subcategory, product_name from gold.dim_products
order by 1,2,3;
-------------------------------------------------------