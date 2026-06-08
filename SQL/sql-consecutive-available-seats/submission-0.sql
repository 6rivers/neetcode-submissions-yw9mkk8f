-- Write your query below
SELECT seat_id
FROM (SELECT seat_id, free,
    LAG(free) OVER(ORDER BY seat_id) as prev_free,
    LEAD(free) OVER(ORDER BY seat_id) as next_free
FROM cinema)
WHERE free = 1 AND (prev_free = 1 OR next_free = 1)
ORDER BY seat_id
