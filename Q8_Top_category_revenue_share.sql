
# Question 8: What percent of total revenue comes from the top category?

#Notes:
# Revenue by category.
# Calculates overall revenue across categories.
# Shows the top category's share of total revenue.
# Returns only the highest-revenue category.

USE olist;

WITH category_revenue AS (
    SELECT
        p.product_category_name,
        ROUND(SUM(oi.price), 2) AS total_revenue
    FROM `order items` AS oi
    JOIN products AS p
        ON oi.product_id = p.product_id
    GROUP BY p.product_category_name
)

SELECT
    product_category_name,
    total_revenue,
    ROUND(
        total_revenue * 100.0
        / SUM(total_revenue) OVER (),
        2
    ) AS revenue_percentage
FROM category_revenue
ORDER BY total_revenue DESC
LIMIT 1;

