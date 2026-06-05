-- Write your query below
WITH time_at_office AS (
    SELECT event_day AS day, emp_id, (out_time - in_time) AS total_time
    FROM employees
)

SELECT day, emp_id, SUM(total_time) AS total_time
FROM time_at_office
GROUP BY emp_id, day;
