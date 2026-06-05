-- Write your query below
-- WITH time_at_office AS (
--     SELECT event_day AS day, emp_id, (out_time - in_time) AS total_time
--     FROM employees
-- )

SELECT event_day AS day, emp_id, SUM(out_time - in_time) AS total_time
FROM employees
GROUP BY emp_id, event_day;
