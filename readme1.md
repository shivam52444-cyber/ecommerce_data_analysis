E-Commerce Marketplace Data Analysis (SQL)
📌 Project Overview

This project performs in-depth exploratory analysis of a large-scale e-commerce marketplace dataset using SQL to uncover operational, geographical, and revenue-driven insights.

The analysis focuses on understanding the structure and behavior of an online marketplace ecosystem, including customers, sellers, products, and orders.

The goal is to simulate the analytical workflow used by data scientists and product analysts in real-world marketplace companies by transforming raw relational data into actionable insights.

Dataset Source:
Brazilian E-Commerce Public Dataset by Olist
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

🎯 Objectives

The primary objective of this project is to answer critical business questions such as:

• Where are the marketplace customers concentrated?
• Which regions dominate seller participation?
• What product categories drive the most revenue?
• How does order lifecycle performance affect delivery timelines?
• What revenue patterns exist over time?

This type of analysis is foundational for:

• marketplace optimization
• logistics planning
• category management
• customer growth strategy

📊 Dataset Description

The dataset represents a real Brazilian e-commerce marketplace and contains transactional data covering orders, customers, sellers, and products.

Key dataset characteristics:

• ~100k orders
• ~30k sellers
• ~100k products
• Multiple relational tables
• Timestamp-based order lifecycle tracking

The dataset structure resembles production marketplace databases used in companies like Amazon, Flipkart, or Shopify.

Dataset Link
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

🗂 Data Model

The analysis integrates multiple relational tables to reconstruct marketplace activity.

Core tables used in this project:

Table	Description
customers	Customer demographic and geographic information
orders	Order lifecycle timestamps and status
order_items	Products contained in each order
products	Product metadata and category information
sellers	Seller geographic information
product_category_translation	Category name mapping

Relationship flow:

Customers
   │
   │ customer_id
   ▼
Orders
   │
   │ order_id
   ▼
Order Items
   │
   │ product_id
   ▼
Products
   │
   │ seller_id
   ▼
Sellers

This relational structure enables multi-dimensional marketplace analysis.

🔍 Analytical Areas Covered
Customer Analysis

Understanding the distribution of customers across geographical regions.

Key analyses:

• Unique customer counts
• Customer distribution by state
• Customer distribution by city
• Customer concentration by ZIP code

This helps identify high-demand regions within the marketplace.

Seller Marketplace Analysis

Analyzing the supply side of the marketplace.

Key analyses:

• Unique sellers across the platform
• Seller distribution by state and city
• Marketplace supply density

Understanding seller distribution helps explain regional product availability and logistics efficiency.

Product Intelligence

Exploration of product metadata and category structures.

Key analyses:

• Number of unique products
• Number of unique product categories
• Category-wise product distribution
• Product weight distribution across categories

This enables identification of high-diversity product categories.

Order Lifecycle Analysis

Analyzing the operational efficiency of order processing.

Key lifecycle metrics examined:

Purchase → Approval time
Carrier pickup → Customer delivery time
Estimated delivery vs actual delivery

These metrics are critical for evaluating logistics performance and operational reliability.

Revenue Analysis

Revenue metrics derived from order item prices.

Key analyses include:

• Revenue by product category
• Revenue by seller geography
• Total marketplace revenue
• High-performing categories

This analysis helps identify core revenue drivers of the marketplace.

Time-Series Revenue Analysis

Revenue was also analyzed over time using timestamp extraction.

Metrics analyzed:

• Daily revenue
• Monthly revenue
• Yearly revenue

Time-based analysis allows identification of growth patterns and marketplace activity trends.

🧠 SQL Techniques Used

This project demonstrates several important SQL concepts used in professional analytics workflows.

Aggregations

Used to compute metrics such as:

• total revenue
• seller counts
• product counts
• customer distribution

Multi-Table Joins

Multiple datasets are joined to reconstruct marketplace activity.

Example join flow:

orders
JOIN order_items
JOIN products
JOIN sellers

This enables cross-table analytical insights.

Timestamp Transformations

Timestamp fields were transformed using SQL extraction functions to analyze time-based trends.

Examples include:

• delivery duration
• order approval latency
• revenue by day/month/year

Data Cleaning

The dataset contains inconsistencies such as:

• empty timestamp values
• missing product categories

These were handled using filtering and null-safe logic to ensure accurate analysis.

📈 Example Analytical Query

Revenue analysis by product category.

WITH prop AS (
    SELECT 
        ooid.order_id,
        ooid.product_id,
        ooid.price,
        ooid.seller_id,
        ood.order_status
    FROM ecommerce.olist_order_items_dataset ooid
    LEFT JOIN ecommerce.olist_orders_dataset ood
    ON ooid.order_id = ood.order_id
),
prop2 AS (
    SELECT 
        opd.product_category_name,
        prop.price
    FROM prop
    LEFT JOIN ecommerce.olist_products_dataset opd
    ON prop.product_id = opd.product_id
)
SELECT 
    product_category_name,
    SUM(price) AS total_revenue
FROM prop2
GROUP BY product_category_name
ORDER BY total_revenue DESC;

This query identifies which product categories generate the highest marketplace revenue.

⚙️ Tools & Technologies

• SQL
• PostgreSQL
• Relational Database Analysis
• Exploratory Data Analysis

📂 Repository Structure
ecommerce-data-analysis
│
├── customers_analysis.sql
├── sellers_analysis.sql
├── products_analysis.sql
├── orders_analysis.sql
├── revenue_analysis.sql
│
└── README.md

Each SQL script focuses on a specific analytical component of the marketplace.

🚀 Future Enhancements

This project can be extended with advanced analytics and machine learning techniques.

Possible future work includes:

Customer Lifetime Value Modeling
Delivery Time Prediction Models
Customer Segmentation (RFM Analysis)
Demand Forecasting
Recommendation Systems
Seller Performance Scoring

These extensions would transform the project into a full-scale data science pipeline.

💡 Key Takeaways

This project demonstrates how structured SQL analysis can transform raw transactional data into meaningful insights about marketplace behavior.

The workflow reflects the typical analytical process used in data science and product analytics teams working with large-scale relational datasets.

👤 Author

Shivam
Data Scientist

Passionate about solving complex problems involving data analysis, machine learning, and large-scale systems.
