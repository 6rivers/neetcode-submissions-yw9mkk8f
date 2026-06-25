-- Write your query below
WITH events AS (
    SELECT fail_date AS event_date, 'failed' AS state
    FROM failed
    WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
    UNION
    SELECT success_date AS event_date, 'succeeded' AS state
    FROM succeeded
    WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
),
ranked AS (
    SELECT event_date, state,
        ROW_NUMBER() OVER(ORDER BY event_date) AS rnk,
        ROW_NUMBER() OVER(PARTITION BY state ORDER BY event_date) AS state_rnk
    FROM events
),
grouped AS (
    SELECT event_date, state, rnk - state_rnk AS grp
    FRom ranked
)

SELECT state AS period_state, MIN(event_date) AS start_date, MAX(event_date) AS end_date
FROM grouped
GROUP BY state, grp
ORDER BY start_date

















-- WITH failures AS (
--     SELECT fail_date, 'failed' AS period_state,
--         (fail_date::date - ROW_NUMBER() OVER(ORDER BY fail_date ASC)) AS f_rnk
--     FROM failed
--     WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
-- ), successes AS (
--     SELECT success_date, 'succeeded' AS period_state,
--         (success_date::date - ROW_NUMBER() OVER(ORDER BY success_date ASC)) AS s_rnk
--     FROM succeeded
--     WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
-- )

-- SELECT period_state, 
--     MIN(fail_date) AS start_date, MAX(fail_date) AS end_date
-- FROM failures
-- GROUP BY period_state, f_rnk
-- UNION
-- SELECT period_state,
--     MIN(success_date) AS start_date, MAX(success_date) AS end_date
-- FROM successes
-- GROUP BY period_state, s_rnk
-- ORDER BY start_date



















-- WITH RECURSIVE rowcount_cte AS (
--     SELECT COUNT(*) AS  total_rows
--     FROM failed
-- ),
-- failures AS (
--     SELECT fail_date, '2018-01-01'::date AS temp_date, 1 AS loop_count
--     FROM failed

--     UNION ALL

--     SELECT fail_date, temp_date + 1, loop_count + 1
--     FROM failures
--     WHERE loop_count < (SELECT total_rows FROM rowcount_cte)
-- )

-- SELECT * 
-- FROM failures;


