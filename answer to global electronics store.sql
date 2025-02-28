set search_path = global_electronics_retail;

--Customer Insights:
--Write a SQL query to count the number of customers per country and continent.
select country, continent, count(*)
from customers
group by country, continent;


--Identify the top 5 countries with the highest number of customers.
select country, count(*) as no_customers
from customers
group by country
order by no_customers desc
limit 5 ;



--Store Performance:
--Write a SQL query to find the total number of stores in each country.
select country, count(*) as no_customer
from stores
group by country;



--Calculate the average size (Square Meters) of stores in each country.
select country, avg(square_meters) as avg_size
from stores
group by country;



--Identify the store that has the largest square meters in Australia.
select *
from stores
where country ='Australia'
order by square_meters desc;



--Sales Analysis:
--Write a SQL query to find the total sales quantity per product.
select product_name, sum(quantity) as total_quantity
from sales
join products
using(product_key)
group by product_name;

update products --change/update to remove $ and the comma sign
set unit_price_usd = replace (replace(unit_price_usd, '$', ''),',', '' ):: decimal

ALTER TABLE products --- change datatype to decimal
ALTER COLUMN unit_price_usd TYPE decimal USING unit_price_usd::DECIMAL;

select *
from products;

select product_name,
sum(unit_price_usd) as total_sales_quantity
from products
group by product_name;


--Identify the top 3 best-selling products by quantity.
select product_name, sum(quantity) as total_quantity
from sales
join products
using(product_key)
group by product_name
order by total_quantity desc
limit 3;



--Write a SQL query to find the total revenue generated from each store,
--converting the sales values to USD using the exchange rate data.--


select --something wrong with the code



--Determine the average number of items sold per order.
select order_number, avg(quantity)
from sales
group by order_number
order by order_number;



--Product Analysis:
--Write a SQL query to find the number of unique products available in each category.
select category, count(product_name) as no_of_unique_product
from products
group by category;



--Find the product with the highest unit price.
select product_name,
unit_price_usd 
from products
order by unit_price_usd desc;




--Identify the most common product color in the sales data.
select color, count(order_number) most_color
from products
join sales
using(product_key)
group by color
order by most_color desc


--Currency Exchange Impact:
--Write a SQL query to calculate the total sales revenue in each currency and
--its equivalent in USD.---- 
select unit_price_usd * quantity ---- something wronq with the code
unit_price * quantity * exchange
from products
join sales
using(product_key)
join exchange_rates
using()


--Determine the date with the highest exchange rate for EUR.
select *
from exchange_rates
where currency = 'EUR'
order by exchange desc
limit 1



--Customer Behavior:
--Analyze how many orders were placed by each customer.
select named,
count(order_number)
from customers
join sales
using(customer_key)
group by named



--Identify customers who have made more than 5 purchases.
select named,
count(order_number) as no_purchases
from customers
join sales
using(customer_key)
group by named
having count(order_number) > 5


--Find customers whose first order was placed in 2016.
select named,
min(order_date) as first_order
from customers
join sales
using(customer_key)
where order_date between '2016-01-01' and '2016-12-31'
group by named

