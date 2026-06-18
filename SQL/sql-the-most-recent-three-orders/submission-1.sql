-- Write your query below
WITH ranked_orders AS (
    SELECT c.name AS customer_name, c.customer_id, o.order_id, o.order_date,
        ROW_NUMBER() OVER(PARTITION BY c.customer_id ORDER BY o.order_date DESC) as latest_order_rankings
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    -- GROUP BY c.customer_id, c.name
    ORDER BY c.customer_id DESC
)

SELECT customer_name, customer_id, order_id, order_date
FROM ranked_orders
WHERE latest_order_rankings IN (1, 2, 3)
ORDER BY customer_name ASC, customer_id ASC, order_date DESC