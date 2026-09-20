
# Question 7: How many customers are repeat buyers vs. one-time buyers?


USE olist;

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM customers AS c
    JOIN orders AS o
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
),

customer_segments AS (
    SELECT
        CASE
            WHEN total_orders = 1 THEN 'One-Time Buyer'
            ELSE 'Repeat Buyer'
        END AS customer_type
    FROM customer_orders
)

SELECT
    customer_type,
    COUNT(*) AS num_customers,
    ROUND(
        COUNT(*) * 100.0
        / SUM(COUNT(*)) OVER (),
        2
    ) AS pct_of_customers
FROM customer_segments
GROUP BY customer_type
ORDER BY num_customers DESC;



