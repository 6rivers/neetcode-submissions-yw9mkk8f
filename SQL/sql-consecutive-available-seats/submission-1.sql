-- Write your query below
-- SELECT seat_id
-- FROM (SELECT seat_id, free,
--     LAG(free) OVER(ORDER BY seat_id) as prev_free,
--     LEAD(free) OVER(ORDER BY seat_id) as next_free
-- FROM cinema)
-- WHERE free = 1 AND (prev_free = 1 OR next_free = 1)
-- ORDER BY seat_id


SELECT DISTINCT c1.seat_id
FROM cinema c1
JOIN cinema c2 ON c1.seat_id = c2.seat_id + 1
OR c1.seat_id = c2.seat_id - 1
WHERE c1.free = 1
AND c2.free = 1
ORDER BY c1.seat_id;
