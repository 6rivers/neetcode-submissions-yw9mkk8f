-- Write your query below
-- WITH ranked_employees AS (
--     SELECT p.project_id, p.employee_id,
--         RANK() OVER(PARTITION BY p.project_id ORDER BY e.experience_years DESC) as exp_rank
--     FROM project p
--     JOIN employee e ON p.employee_id = e.employee_id
-- )

-- SELECT project_id, employee_id
-- FROM ranked_employees
-- WHERE exp_rank = 1


SELECT p.project_id, p.employee_id
FROM project p
JOIN employee e ON p.employee_id = e.employee_id
WHERE e.experience_years = (
    SELECT MAX(experience_years)
    FROM employee e1
    JOIN project p1 ON e1.employee_id = p1.employee_id
    WHERE p1.project_id = p.project_id
)


