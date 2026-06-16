-- Write your query below

-- SELECT t.department, e.name AS employee, e.salary
-- FROM employee e
-- JOIN (
-- SELECT d.id AS department_id, d.name AS department, MAX(e.salary) AS top_salary
-- FROM employee e
-- JOIN department d ON e.department_id = d.id
-- GROUP BY d.id, d.name ) t ON e.department_id = t.department_id
-- AND e.salary = t.top_salary

-- SELECT d.name AS department, e.name AS employee, e.salary
-- FROM employee e
-- JOIN department d ON e.department_id = d.id
-- WHERE e.salary = (
--     SELECT MAX(e2.salary)
--     FROM employee e2
--     WHERE e2.department_id = e.department_id
-- )

WITH ranking_employees AS (
    SELECT d.name AS department, e.name AS employee, e.salary,
        RANK() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC) as salary_rank
    FROM employee e
    JOIN department d ON e.department_id = d.id
)

SELECT department, employee, salary
FROM ranking_employees
WHERE salary_rank = 1



