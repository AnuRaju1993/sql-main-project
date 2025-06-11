use main_project;
SELECT * FROM main_project.supplement_sales_weekly_expanded;
ALTER TABLE supplement_sales_weekly_expanded
RENAME TO suppliment;
ALTER TABLE suppliment
RENAME TO sales;
ALTER TABLE sales
CHANGE `Units Sold` unit_sold INT;
select * from the sales;
ALTER TABLE sales
CHANGE `Product Name` product_name VARCHAR(255);



######1
SELECT SUM(Revenue) AS total_revenue FROM sales;
####2
SELECT SUM(unit_sold) AS total_units_sold FROM sales;
###3
select avg(Revenue/unit_sold) as average_revenue_per_unit from sales;

#####4
SELECT AVG(Discount) AS avg_discount FROM sales;
#####5
SELECT YEAR(Date) AS year, SUM(Revenue) AS yearly_revenue
FROM sales
GROUP BY YEAR(Date)
order by sum(Revenue) desc;
#####6
select product_name,sum(Revenue)
from sales
group by product_name
order by sum(Revenue) desc;
#####7
select Category,sum(Revenue)
from sales
group by Category
order by sum(Revenue) desc;
####8
select Location,sum(Revenue)
from sales
group by Location
order by sum(Revenue) desc;
####9
select Platform,sum(Revenue)
from sales
group by Platform
order by sum(Revenue) desc;
####10
select sum(unit_sold),product_name
from sales
group by product_name
order by sum(unit_sold) desc;
###11
select sum(`Units Returned`),product_name
from sales
group by product_name
order by sum(`Units Returned`) desc;
####11
select product_name,avg(Discount)
from sales
group by product_name
order by avg(Discount) desc;
###12
SELECT DISTINCT Category FROM sales;
#####13
SELECT DISTINCT product_name AS unique_products FROM sales;
#######14
SELECT AVG(Revenue / NULLIF(unit_sold, 0)) AS avg_revenue_per_unit FROM sales;
######15
SELECT YEAR(Date) AS year, SUM(Revenue) AS yearly_revenue
FROM sales
GROUP BY YEAR(Date)
order by SUM(Revenue) desc ;
#####
SELECT YEAR(Date) AS year, MONTH(Date) AS month, SUM(Revenue) AS monthly_revenue
FROM sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY year, month;
######
SELECT product_name, SUM(Revenue) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC;


#####
SELECT product_name, SUM(Revenue) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
limit 5;
#######
SELECT Category, SUM(Revenue) AS category_revenue
FROM sales
GROUP BY Category
ORDER BY category_revenue DESC;
######
SELECT product_name, SUM(unit_sold) AS total_units
FROM sales
GROUP BY product_name
ORDER BY total_units DESC
LIMIT 1;
#######
SELECT product_name, AVG(Price) AS avg_price
FROM sales
GROUP BY product_name;
#####
SELECT product_name, SUM(`Units Returned`) AS total_returns
FROM sales
GROUP BY product_name
ORDER BY total_returns DESC;
#####
SELECT product_name,
       SUM(`Units Returned`) * 100.0 / SUM(unit_sold) AS return_rate_percent
FROM sales
GROUP BY product_name
ORDER BY return_rate_percent DESC;
####
SELECT product_name, AVG(Discount) AS avg_discount
FROM sales
GROUP BY product_name
ORDER BY avg_discount DESC;
####
SELECT Location, SUM(Revenue) AS location_revenue
FROM sales
GROUP BY Location
ORDER BY location_revenue DESC;
####
SELECT Location,
       SUM(`Units Returned`) * 100.0 / SUM(unit_sold) AS return_rate
FROM sales
GROUP BY Location
ORDER BY return_rate DESC;
#####
SELECT Location, product_name, SUM(unit_sold) AS total_units
FROM sales
GROUP BY Location, product_name
ORDER BY Location, total_units DESC;
######
SELECT Category, AVG(Discount) AS avg_discount
FROM sales
GROUP BY Category;
#####
SELECT Category, AVG(Price) AS avg_price
FROM sales
GROUP BY Category;
####
SELECT SUM(Price * unit_sold * Discount) AS discount_loss
FROM sales;
#######
SELECT product_name, SUM(Price * unit_sold * Discount) AS discount_given
FROM sales
GROUP BY product_name
ORDER BY discount_given DESC;
#####
SELECT YEAR(Date) AS year, product_name, SUM(unit_sold) AS total_units
FROM sales
GROUP BY YEAR(Date), product_name
ORDER BY year, total_units DESC;
####
SELECT 
  FORMAT(Date, 'yyyy-MM') AS month,
  SUM(Revenue) AS revenue
FROM sales
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY month;
######
SELECT 
  YEAR(Date) AS year,
  SUM(Revenue) AS total_revenue,
  LAG(SUM(Revenue)) OVER (ORDER BY YEAR(Date)) AS previous_year_revenue,
  (SUM(Revenue) - LAG(SUM(Revenue)) OVER (ORDER BY YEAR(Date))) * 100.0 
    / NULLIF(LAG(SUM(Revenue)) OVER (ORDER BY YEAR(Date)), 0) AS yoy_growth
FROM sales
GROUP BY YEAR(Date);
#####
SELECT Platform, YEAR(Date) AS year, SUM(Revenue) AS revenue
FROM sales
GROUP BY Platform, YEAR(Date)
ORDER BY year, revenue DESC;
######
SELECT Platform, SUM(Revenue) AS total_revenue
FROM sales
GROUP BY Platform
ORDER BY total_revenue DESC;
#####
SELECT Platform,
       SUM(`Units Returned`) * 100.0 / SUM(unit_sold) AS return_rate
FROM sales
GROUP BY Platform;
#####
SELECT product_name, SUM(`Units Returned`) AS returns
FROM sales
GROUP BY product_name
ORDER BY returns DESC
LIMIT 1;
######
SELECT Category, 
       SUM(`Units Returned`) * 100.0 / SUM(unit_sold) AS return_rate
FROM sales
GROUP BY Category
ORDER BY return_rate DESC;
####
SELECT product_name, 
       SUM(`Units Returned`) AS returns,
       SUM(unit_sold) AS sales,
       ROUND(SUM(`Units Returned`) * 1.0 / NULLIF(SUM(unit_sold), 0), 3) AS return_ratio
FROM sales
GROUP BY product_name;
#####
SELECT Category, 
       SUM(Revenue) / NULLIF(SUM(unit_sold), 0) AS revenue_per_unit
FROM sales
GROUP BY Category
ORDER BY revenue_per_unit DESC;
#####
SELECT AVG(Revenue / NULLIF(unit_sold, 0)) AS avg_revenue_per_unit,product_name,
 FROM sales
 group by product_name
 order by avg_revenue_per_unit desc;
#####
select product_name,avg(Revenue)
from sales
group by product_name
order by avg(Revenue)
desc;
#####
select product_name,avg(Price)
from sales
group by product_name
order by avg(Price)
desc;
####
select product_name,avg(Discount)
from sales
group by product_name
order by avg(Discount)
desc;
###
select Category,sum(Revenue)
from sales
group by Category
order by sum(Revenue) desc;
######
select Category,product_name
from sales
group by Category,product_name;
#####
select Location,sum(Revenue)
from sales
group by Location
order by sum(Revenue) desc;
select Location,sum(unit_sold)
from sales
group by Location
order by sum(unit_sold) desc;
#####
select Platform,sum(`Units Returned`)
from sales
group by Platform
order by sum(`Units Returned`);
#####
select Platform,sum(Revenue)
from sales
group by Platform
order by sum(Revenue) desc;
#####
select Platform,sum(unit_sold)
from sales
group by Platform
order by sum(unit_sold) desc;
####
select month(Date) AS month,sum(Revenue)
from sales
group by month
order by sum(Revenue) desc;

























