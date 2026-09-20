
# Question 6: Segment customers into spend tiers (Low / Medium / High)

USE olist;


# Q6: Segment Customers into Spend Tiers (Low / Medium / High)

USE olist;


WITH customer_totals AS (
    SELECT
        c.customer_id,
        SUM(op.payment_value) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN `order payments` op
        ON o.order_id = op.order_id
    WHERE o.order_status IN ('delivered', 'approved', 'shipped', 'invoiced')
    GROUP BY c.customer_id
),
ranked AS (
    SELECT
        customer_id,
        total_spend,
        ROW_NUMBER() OVER (ORDER BY total_spend) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM customer_totals
)
SELECT
    customer_id,
    total_spend,
    CASE
        WHEN row_num <= total_count * 0.5 THEN 'Low'       -- bottom 50%
        WHEN row_num <= total_count * 0.9 THEN 'Medium'    -- next 40%
        ELSE 'High'                                       -- top 10%
    END AS spend_tier
FROM ranked
ORDER BY total_spend DESC;


#Totals per tier

WITH customer_totals AS (
    SELECT
        c.customer_id,
        SUM(op.payment_value) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN `order payments` op
        ON o.order_id = op.order_id
    WHERE o.order_status IN ('delivered', 'approved', 'shipped', 'invoiced')
    GROUP BY c.customer_id
),
ranked AS (
    SELECT
        customer_id,
        total_spend,
        ROW_NUMBER() OVER (ORDER BY total_spend) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM customer_totals
),
segmented AS (
    SELECT
        customer_id,
        total_spend,
        CASE
            WHEN row_num <= total_count * 0.5 THEN 'Low'       -- bottom 50%
            WHEN row_num <= total_count * 0.9 THEN 'Medium'    -- next 40%
            ELSE 'High'                                       -- top 10%
        END AS spend_tier
    FROM ranked
)
SELECT
    spend_tier,
    COUNT(*) AS customer_count,
    SUM(total_spend) AS total_spend_sum,
    MIN(total_spend) AS min_spend,
    MAX(total_spend) AS max_spend,
    AVG(total_spend) AS avg_spend
FROM segmented
GROUP BY spend_tier
ORDER BY spend_tier;


