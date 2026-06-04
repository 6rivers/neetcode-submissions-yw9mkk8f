-- Write your query below
-- SELECT s.seller_name
-- FROM seller s
-- LEFT JOIN orders o ON s.seller_id = o.seller_id
-- AND o.sale_date BETWEEN '2020-01-01' AND '2020-12-31'
-- WHERE o.order_id IS NULL
-- ORDER BY s.seller_name;


SELECT s.seller_name
FROM seller s
WHERE s.seller_id NOT IN (
    SELECT seller_id
    FROM orders
    WHERE sale_date BETWEEN '2020-01-01' AND '2020-12-31'
)
ORDER BY s.seller_name;