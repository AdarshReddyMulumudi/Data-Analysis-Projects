--Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

--Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;

--Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales ;

--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

--Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /  
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizzas_per_order 
FROM pizza_sales ;

--Daily Trend for Total Orders
SELECT DATENAME(DW,order_date) as order_day, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales GROUP BY  DATENAME(DW,order_date);


--Monthly Trend For Total ORders
SELECT DATENAME(MONTH,order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales GROUP BY  DATENAME(MONTH,order_date) ORDER BY Total_Orders DESC;

--Percentage of Sales By Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT 
FROM pizza_sales 
GROUP BY pizza_category ;

--Percentage of Sales By Pizza Size
SELECT pizza_size , CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT 
FROM pizza_sales 
GROUP BY pizza_size ORDER BY PCT DESC;

--Top 5 Best Seller by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Revenue DESC 

----Top 5 Best Seller by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Quantity DESC

--Top 5 Best Seller by Total Orders
SELECT Top 5 pizza_name,COUNT(DISTINCT order_id)  AS Total_Orders
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Orders DESC

----Bottom 5 Best Seller by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Revenue

----Bottom 5 Best Seller by Quanttity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Quantity


----Bottom 5 Best Seller by total orders
SELECT Top 5 pizza_name,COUNT(DISTINCT order_id)  AS Total_Orders
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Orders

