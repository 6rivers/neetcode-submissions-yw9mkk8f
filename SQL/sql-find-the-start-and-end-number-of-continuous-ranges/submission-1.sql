-- Write your query below
-- SELECT l1.log_id, l2.log_id
-- FROM logs l1
-- JOIN logs l2
-- ON l1.log_id = l2.log_id + 1

-- WITH intermediate AS (
--     SELECT log_id,
--         LAG(log_id) OVER(ORDER BY log_id ASC) AS prev_logid,
--         LEAD(log_id) OVER(ORDER BY log_id ASC) AS next_logid,
--         (log_id - LAG(log_id) OVER(ORDER BY log_id ASC)) AS diff1,
--         (LEAD(log_id) OVER(ORDER BY log_id ASC) - log_id) AS diff
--     FROM logs
-- )

-- ,starters AS (
--     SELECT log_id AS start_id,
--         ROW_NUMBER() OVER (ORDER BY log_id ASC) AS rn
--     FROM intermediate
--     WHERE diff1 IS NULL or diff1 > 1
-- ),
-- enders AS (
--     SELECT log_id AS end_id,
--         ROW_NUMBER() OVER (ORDER BY log_id ASC) AS rn
--     FROM intermediate
--     WHERE diff > 1 or diff IS NULL
-- )

-- SELECT start_id, end_id
-- FROM starters
-- FULL OUTER JOIN enders ON starters.rn = enders.rn

-- SELECT *
-- FROM intermediate





WITH intermediate AS (
    SELECT log_id, ROW_NUMBER() OVER(ORDER BY log_id ASC) AS ranks,
        (log_id - ROW_NUMBER() OVER(ORDER BY log_id ASC)) AS diff
    FROM logs
)



SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id
FROM intermediate
GROUP BY diff
ORDER BY start_id












