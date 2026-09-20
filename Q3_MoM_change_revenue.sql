# Q3: What is the Month-over-Month (MoM) change in revenue?

/*
Note:
- No source data exists for 2016-11.
- The month was added using a calendar CTE to preserve continuity
    in the monthly revenue trend analysis.
*/

USE olist;


WITH RECURSIVE calendar_months AS (
    SELECT DATE('2016-09-01') AS month_start

    UNION ALL

    SELECT DATE_ADD(month_start, INTERVAL 1 MONTH)
    FROM calendar_months
    WHERE month_start < (
        SELECT DATE_FORMAT(
            MAX(order_purchase_timestamp),
            '%Y-%m-01'
        )
        FROM orders
    )
),

monthly_revenue AS (
    SELECT
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS month_start,
        ROUND(SUM(op.payment_value), 2) AS revenue
    FROM orders o
    JOIN `order payments` op
        ON o.order_id = op.order_id
    GROUP BY month_start
),

complete_revenue AS (
    SELECT
        DATE_FORMAT(c.month_start, '%Y-%m') AS month,
        COALESCE(mr.revenue, 0) AS revenue
    FROM calendar_months c
    LEFT JOIN monthly_revenue mr
        ON c.month_start = mr.month_start
)

SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,

    ROUND(
        revenue - LAG(revenue) OVER (ORDER BY month),
        2
    ) AS revenue_change,

    ROUND(
        (
            (revenue - LAG(revenue) OVER (ORDER BY month))
            / NULLIF(LAG(revenue) OVER (ORDER BY month), 0)
        ) * 100,
        2
    ) AS mom_revenue_pct_change

FROM complete_revenue
ORDER BY month;

