-- Write your query below
SELECT employee_id,
    COUNT(employee_id) OVER(PARTITION BY team_id) as team_size
FROM employee;