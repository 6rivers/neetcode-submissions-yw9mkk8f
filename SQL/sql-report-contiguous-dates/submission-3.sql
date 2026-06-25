-- Write your query below
-- WITH events AS (
--     SELECT fail_date AS event_date, 'failed' AS state
--     FROM failed
--     WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
--     UNION ALL
--     SELECT success_date AS event_date, 'succeeded' AS state
--     FROM succeeded
--     WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
-- ),
-- ranked AS (
--     SELECT event_date, state,
--         ROW_NUMBER() OVER(ORDER BY event_date) AS rnk,
--         ROW_NUMBER() OVER(PARTITION BY state ORDER BY event_date) AS state_rnk
--     FROM events
-- ),
-- grouped AS (
--     SELECT event_date, state, rnk - state_rnk AS grp
--     FRom ranked
-- )

-- SELECT state AS period_state, MIN(event_date) AS start_date, MAX(event_date) AS end_date
-- FROM grouped
-- GROUP BY state, grp
-- ORDER BY start_date












WITH events AS (
    SELECT fail_date AS event_date, 'failed' AS period_state,
        (fail_date::date - ROW_NUMBER() OVER(ORDER BY fail_date ASC)::int) AS rnk
    FROM failed
    WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
    UNION ALL
    SELECT success_date AS event_date, 'succeeded' AS period_state,
        (success_date::date - ROW_NUMBER() OVER(ORDER BY success_date ASC)::int) AS rnk
    FROM succeeded
    WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
)

SELECT period_state, 
    MIN(event_date) AS start_date, MAX(event_date) AS end_date
FROM events
GROUP BY period_state, rnk
ORDER BY start_date
-- UNION
-- SELECT period_state,
--     MIN(event_date) AS start_date, MAX(event_date) AS end_date
-- FROM events
-- GROUP BY period_state, s_rnk
-- ORDER BY start_date



