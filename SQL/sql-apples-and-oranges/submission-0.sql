-- Write your query below
SELECT sale_date, diff
FROM (
SELECT sale_date, fruit, ABS(sold_num -
    LEAD(sold_num, 1, 0) OVER(PARTITION BY sale_date ORDER BY fruit)) AS diff
FROM sales)
WHERE fruit = 'apples'
