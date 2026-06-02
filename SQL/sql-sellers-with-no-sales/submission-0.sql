-- Write your query below

-- SELECT s.seller_name
-- FROM seller s
-- LEFT JOIN orders o ON s.seller_id = o.seller_id
-- WHERE (o.sale_date BETWEEN '2020-01-01' AND '2020-12-31') AND o.order_id is NULL

-- ORDER BY ;

SELECT s.seller_name
FROM seller s
WHERE s.seller_id NOT IN (
    SELECT o.seller_id 
    FROM orders o
    WHERE o.sale_date BETWEEN '2020-01-01' AND '2020-12-31'
    )
ORDER BY s.seller_name;