
#Question 5: Rank the top 3 products within each category by revenue

USE olist;

# Q5: Rank the Top 3 Products Within Each Category by Revenue

USE olist;

WITH product_revenue AS (
    SELECT
        p.product_category_name,
        oi.product_id,
        ROUND(SUM(oi.price), 2) AS revenue
    FROM `order items` AS oi
    JOIN products AS p
        ON oi.product_id = p.product_id
    GROUP BY
        p.product_category_name,
        oi.product_id
),

ranked_products AS (
    SELECT
        product_category_name,
        product_id,
        revenue,
        ROW_NUMBER() OVER (
            PARTITION BY product_category_name
            ORDER BY revenue DESC
        ) AS product_rank
    FROM product_revenue
)

SELECT
    product_category_name,
    product_id,
    revenue,
    product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY
    product_category_name,
    product_rank;


