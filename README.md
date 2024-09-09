# Pizza-Sales-Analysis

## Project Overview

This project involves analyzing pizza sales data to uncover trends and insights that can help the business optimize performance. The analysis focuses on key metrics such as total revenue, top-selling pizzas, sales by category and size, and order trends. The goal is to provide actionable insights for improving sales strategies and operational efficiency.

## Dataset

The dataset used for this analysis contains detailed information on pizza orders, including:

- order_id: Unique ID for each order
- order_date: Date of the order
- pizza_name: Name of the pizza sold
- pizza_category: Category of the pizza (e.g., Veg, Non-Veg)
- pizza_size: Size of the pizza (Small, Medium, Large)
- quantity: Number of pizzas sold
- total_price: Total price of the order

## Key Metrics and Queries

1. Total Revenue

- Query: SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

- Insight: Calculates the total revenue generated from pizza sales.

2. Average Order Value

- Query: SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales

- Insight: Measures the average revenue per order.

3. Total Pizza Sold

- Query: SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales

- Insight: Total number of pizzas sold across all orders.

4. Total Orders

-  Query: SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

- Insight: Provides the total number of distinct orders.

5. Average Pizza Per Order

- Query: Calculates the average number of pizzas per order.

6. Daily and Monthly Trends

- Query: Provides insights into total orders by day of the week and by month to identify peak periods.

7. Sales by Pizza Category and Size

-  Query: Analyzes the percentage of total sales by pizza category and size to identify which types of pizzas are most popular.

8. Top and Bottom Selling Pizzas

-  Queries: Returns the top 5 and bottom 5 pizzas by revenue, quantity, and total orders.

## Technologies Used

- SQL: All analysis is performed using SQL queries to explore and analyze the data.

- Database: Assumes the use of a relational database like SQL Server or MySQL to store and query the data.

## Conclusion

The Pizza Sales analysis reveals critical insights into customer preferences, peak sales periods, and the most and least popular pizzas. These findings can guide decisions related to inventory management, promotions, and product offerings, ultimately driving revenue growth.
