-- Write your query below
-- SELECT d.name as department, e.name as employee, e.salary
-- FROM employee e
-- JOIN department d ON e.department_id = d.id
-- GROUP BY d.id, d.name
-- HAVING e.salary = MAX(e.salary)


SELECT t.department, e.name AS employee, e.salary
FROM employee e
JOIN (
SELECT d.id AS department_id, d.name AS department, MAX(e.salary) AS top_salary
FROM employee e
JOIN department d ON e.department_id = d.id
GROUP BY d.id, d.name ) t ON e.department_id = t.department_id
AND e.salary = t.top_salary
-- GROUP BY d.id, d.name