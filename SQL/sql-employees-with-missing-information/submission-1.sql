-- Write your query below
-- SELECT e.employee_id
-- FROM employees e
-- FULL JOIN salaries s ON e.employee_id = s.employee_id
-- WHERE e.name IS NULL 
-- OR s.salary IS NULL
-- ORDER BY e.employee_id ASC;

SELECT e.employee_id
FROM employees e
LEFT JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.salary IS NULL
UNION
SELECT s.employee_id
FROM salaries s
LEFT JOIN employees e ON s.employee_id = e.employee_id
WHERE e.name IS NULL
ORDER BY employee_id ASC;