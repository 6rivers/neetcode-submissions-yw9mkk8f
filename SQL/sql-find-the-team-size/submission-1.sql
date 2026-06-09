-- Write your query below
-- SELECT employee_id,
--     COUNT(employee_id) OVER(PARTITION BY team_id) as team_size
-- FROM employee;


SELECT employee_id, team_counts.team_size
FROM employee e
JOIN (
    SELECT team_id, COUNT(employee_id) as team_size 
    FROM employee
    GROUP BY team_id) AS team_counts
ON e.team_id = team_counts.team_id
