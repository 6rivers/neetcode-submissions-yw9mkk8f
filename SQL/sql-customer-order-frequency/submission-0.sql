-- Write your query below
-- SELECT *
-- FROM customers c
-- JOIN (

WITH june_orders AS (
SELECT customer_id, SUM(o.quantity * p.price) AS june_total_spend
FROM product p
JOIN orders o ON p.product_id = o.product_id
WHERE (o.order_date >= '2020-06-01' AND o.order_date < '2020-07-01')
GROUP BY customer_id
HAVING SUM(o.quantity * p.price) >= 100
),
july_orders AS (
SELECT customer_id, SUM(o.quantity * p.price) AS july_total_spend
FROM product p
JOIN orders o ON p.product_id = o.product_id
WHERE (o.order_date >= '2020-07-01' AND o.order_date < '2020-08-01')
GROUP BY customer_id
HAVING SUM(o.quantity * p.price) >= 100
)

SELECT c.customer_id, c.name
FROM customers c
JOIN june_orders jn ON c.customer_id = jn.customer_id
JOIN july_orders jl ON c.customer_id = jl.customer_id





-- HAVING o.order_date >= '2020-06-01' AND o.order_date < '2020-07-01'



-- AND (o.order_date >= '2020-07-01' AND o.order_date < '2020-08-01')
-- GROUP BY o.customer_id
-- HAVING SUM(o.quantity * p.price) >= 100
-- ) agg_orders
-- ON c.customer_id = agg_orders.customer_id

-- DATE_TRUNC('month', o.order_date) AS month
-- , SUM(o.quantity * p.price) as total_spend

