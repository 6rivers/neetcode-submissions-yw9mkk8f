-- Write your query below
WITH order_counts AS (
    SELECT customer_number, COUNT(order_number) as total_orders
    FROM orders
    GROUP BY customer_number
)

SELECT customer_number
FROM order_counts
ORDER BY total_orders DESC
LIMIT 1;
