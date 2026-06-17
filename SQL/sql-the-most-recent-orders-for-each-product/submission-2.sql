-- Write your query below

-- WITH latest_orders AS (
--     SELECT p.product_id, MAX(o.order_date) as latest_orderdate
--     FROM products p
--     JOIN orders o ON p.product_id = o.product_id
--     GROUP BY p.product_id
-- )

-- SELECT p.product_name, p.product_id, o.order_id, o.order_date
-- FROM products p
-- JOIN orders o ON p.product_id = o.product_id
-- JOIN latest_orders lo ON p.product_id = lo.product_id
-- AND o.order_date = lo.latest_orderdate
-- ORDER BY product_name ASC, product_id ASC, order_id ASC;

WITH latest_orders AS (
    SELECT p.product_id, MAX(o.order_date) as latest_orderdate
    FROM products p
    JOIN orders o ON p.product_id = o.product_id
    GROUP BY p.product_id
)

SELECT p.product_name, p.product_id, o.order_id, o.order_date
FROM products p
JOIN orders o ON p.product_id = o.product_id
JOIN latest_orders lo ON p.product_id = lo.product_id
WHERE o.order_date = lo.latest_orderdate
ORDER BY product_name ASC, product_id ASC, order_id ASC;


-- SELECT p.product_name, p.product_id, o.order_id, o.order_date
-- FROM products p
-- JOIN orders o ON p.product_id = o.product_id
-- WHERE o.order_date = (
--     SELECT MAX(order_date)
--     FROM orders
--     WHERE product_id = p.product_id
-- )
-- ORDER BY product_name ASC, product_id ASC, order_id ASC;

