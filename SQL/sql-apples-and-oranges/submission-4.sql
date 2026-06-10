-- Write your query below
-- SELECT sale_date, diff
-- FROM (
-- SELECT sale_date, fruit, sold_num -
--     LEAD(sold_num, 1, 0) OVER(PARTITION BY sale_date ORDER BY fruit) AS diff
-- FROM sales)
-- WHERE fruit = 'apples'


-- SELECT a.sale_date,
--     a.sold_num - o.sold_num AS diff
-- FROM sales a
-- JOIN sales o ON a.sale_date = o.sale_date
-- WHERE a.fruit = 'apples' AND o.fruit = 'oranges'
-- ORDER BY a.sale_date


SELECT sale_date,
    SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE 0 END) - SUM(CASE WHEN fruit = 'oranges' THEN sold_num ELSE 0 END) AS diff
FROM sales
GROUP BY sale_date
ORDER BY sale_date;









