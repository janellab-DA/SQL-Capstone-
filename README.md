# Olist SQL Analysis

## Overview

This project analyzes the Olist Brazilian E-Commerce dataset using SQL to evaluate customer behavior, revenue performance, product category profitability, and customer retention. The dataset covers transactions from September 2016 to September 2018 and includes customer, order, payment, and product information. Data preparation included correcting invalid column headers, removing duplicate header records, and generating a complete monthly timeline to support accurate trend analysis. 

---

## Business Questions

1. Who are the top 10 customers by total amount spent?
2. What is the monthly revenue trend across the dataset?
3. What is the month-over-month (MoM) change in revenue?
4. Which product categories generate the most revenue?
5. Which products rank among the top 3 within each category by revenue?
6. How can customers be segmented into spending tiers?
7. How many customers are repeat buyers versus one-time buyers?
8. What percentage of total revenue comes from the top product category?

---

## Key Findings

### Revenue Growth

Revenue increased significantly throughout the analysis period. Monthly revenue grew from **252.24 in September 2016** to more than **1 million per month during much of 2018**, demonstrating strong business expansion and growing customer demand. A brief decline occurred in November 2016, followed by a rapid recovery and continued growth. 

### Product Category Performance

The highest-performing category was **beleza_saude**, generating approximately **1.26 million** in revenue and accounting for **9.26% of total category revenue**. Other top-performing categories included **relogios_presentes**, **cama_mesa_banho**, and **esporte_lazer**. Revenue is concentrated within a relatively small group of categories. 

### Customer Retention

Customer purchasing behavior is heavily skewed toward one-time purchases. The analysis identified **93,099 one-time buyers (96.88%)** and only **2,997 repeat buyers (3.12%)**, indicating substantial room for improving customer retention and customer lifetime value. 

### Customer Segmentation

Customers were segmented using percentile-based spending tiers:

| Tier | Customer Share |
|--------|--------|
| High | Top 10% |
| Medium | Next 40% |
| Low | Bottom 50% |

The High spend tier generated substantially higher average spending per customer than the Medium and Low groups, highlighting the importance of retaining high-value customers. 

---

## Recommendations

### 1. Improve Customer Retention

Implement loyalty programs, personalized promotions, and post-purchase engagement campaigns to encourage repeat purchases. With only 3.12% of customers making multiple purchases, even small improvements in retention could generate meaningful revenue growth. 

### 2. Invest in Top Revenue-Generating Categories

Prioritize inventory management, promotional activity, and cross-selling opportunities for high-performing categories such as **beleza_saude**, **relogios_presentes**, **cama_mesa_banho**, and **esporte_lazer**. These categories currently contribute a significant portion of total revenue and represent the strongest growth opportunities. 

---

## Tools & Skills

### Tools
- MySQL
- SQL
- Microsoft Excel (Data Validation)
- Microsoft Word (Reporting)

### SQL Skills Demonstrated
- Data Cleaning
- JOIN Operations
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- LAG()
- Recursive CTEs
- CASE Statements
- Customer Segmentation# SQL-Capstone-
SQL capstone project analyzing the Olist e-commerce dataset to deliver actionable business insights. 

## Files

| File | Description |
|--------|--------|
| Q1_Top10_customers.sql | Identifies the top 10 customers by total amount spent |
| Q2_Monthly_revenue_trend.sql | Analyzes monthly revenue trends across the dataset |
| Q3_MoM_change_revenue.sql | Calculates month-over-month revenue changes |
| Q4_Top_product_category_revenue.sql | Identifies the highest revenue-generating product categories |
| Q5_Top3_products_by_revenue.sql | Ranks the top 3 products within each category by revenue |
| Q6_Customer_spend_tiers.sql | Segments customers into Low, Medium, and High spending tiers |
| Q7_RepeatBuyers_VS_OneTimeBuyers.sql | Compares repeat buyers and one-time buyers |
| Q8_Top_category_revenue_share.sql | Calculates the revenue contribution of the top product category |
| DASP-B04-JanellaBuban.docx | Complete capstone report including SQL queries, findings, and recommendations |
`
