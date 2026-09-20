
# Question 2: What is the monthly revenue trend across the dataset?

# Revenue is calculated using payment_value from the order_payments table.
# Orders are grouped by purchase month to observe trends over time.
USE olist;

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(op.payment_value), 2) AS monthly_revenue
FROM orders as o
JOIN `order payments` as op
    ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;





