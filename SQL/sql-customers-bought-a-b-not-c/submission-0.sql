-- Write your query below
-- SELECT c.customer_id, c.customer_name 
-- FROM customers c
-- JOIN orders o ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id, c.customer_name
-- HAVING SUM(CASE WHEN o.pr)
-- ORDER BY c.customer_name;

SELECT c.customer_id, c.customer_name 
FROM customers c
WHERE c.customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE product_name = 'A'
)
AND c.customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE product_name = 'B'
)
AND c.customer_id NOT IN (
    SELECT customer_id
    FROM orders
    WHERE product_name = 'C'
)