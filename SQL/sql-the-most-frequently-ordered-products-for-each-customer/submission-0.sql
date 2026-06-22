-- Write your query below
WITH customer_total_orders AS (
    SELECT c.customer_id, p.product_id, p.product_name, COUNT(*) AS product_order_count
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN products p ON o.product_id = p.product_id
    GROUP BY c.customer_id, p.product_id, p.product_name
    ORDER BY c.customer_id
),
order_rankings AS (
    SELECT customer_id, product_id, product_name, product_order_count, 
    RANK() OVER(PARTITION BY customer_id ORDER BY product_order_count DESC) AS product_ranking
    FROM customer_total_orders
)

SELECT customer_id, product_id, product_name
FROM order_rankings
WHERE product_ranking = 1