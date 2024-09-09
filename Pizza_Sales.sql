
SELECT * 
FROM pizza_sales

--1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

--2. Avg order value
SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales

--3. Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales

--4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales

--5. Avg Pizza Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order
FROM pizza_sales



-- 1. Daily Trends for Total Order
	-- First Method
SELECT Order_Day, Total_Order
FROM (
	SELECT 
		DATENAME(DW, order_date) AS Order_Day, 
		COUNT(DISTINCT order_id) AS Total_Order,
		DATEPART(DW, order_date) AS Day_Number
	FROM pizza_sales
	GROUP BY 
		DATENAME(DW, order_date),
		DATEPART(DW, order_date)
) AS Ordered_Day
ORDER BY 
	Day_Number

	-- Second Method
SELECT DATENAME(DW, order_date) AS Order_Day, 
COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY Total_Order



-- 2. Monthly Trend for Orders
	-- First Method
SELECT 
    Order_Month,
    Total_Order
FROM (
    SELECT 
        DATENAME(MONTH, order_date) AS Order_Month,
        COUNT(DISTINCT order_id) AS Total_Order,
        MONTH(order_date) AS Month_Number
    FROM pizza_sales
    GROUP BY 
        DATENAME(MONTH, order_date),
        MONTH(order_date)
) AS Ordered_Months
ORDER BY 
    Month_Number

	-- Second Method
SELECT DATENAME(MONTH, order_date) AS Order_Month,
COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_order


--3. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS Percent_Pizza_Category
FROM pizza_sales
GROUP BY pizza_category

	-- Here MONTH(order_date)=1 is filter which indicates that the output is for month of January and can apply to each above and below codes
SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS Percent_Pizza_Category
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category


--4. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL (10,2))AS Total_Sales, CAST(SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2))AS Percent_Pizza_Size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percent_Pizza_Size DESC

	-- Here DATEPART(QUARTER, order_date)=1 isfilter which indicates that the output is for 1st quarter and can apply to each codes
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL (10,2))AS Total_Sales, CAST(SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1) AS DECIMAL (10,2))AS Percent_Pizza_Size
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY Percent_Pizza_Size DESC



--5. Total Pizza Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Pizza_Sold DESC 



--6. Top 5 Pizza by Revenue
SELECT TOP 5 pizza_name, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC



--7. Top 5 Pizza by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC



--8. Top 5 Pizza by Total_Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC



--9. Bottom 5 Pizza by Revenue
SELECT TOP 5 pizza_name, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue



--10. Bottom 5 Pizza by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity 



--11. BOTTOM 5 Pizza by Total_Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order 























