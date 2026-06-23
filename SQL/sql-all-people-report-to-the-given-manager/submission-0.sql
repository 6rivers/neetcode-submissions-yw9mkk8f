-- Write your query below
SELECT employee_id
FROM employees
WHERE manager_id = 1
AND employee_id != 1
UNION ALL
SELECT employee_id
FROM employees
WHERE manager_id IN (
    SELECT employee_id
    FROM employees
    WHERE manager_id = 1
    AND employee_id != 1
)
UNION ALL
SELECT employee_id
FROM employees
WHERE manager_id IN (
SELECT employee_id
FROM employees
WHERE manager_id IN (
    SELECT employee_id
    FROM employees
    WHERE manager_id = 1
    AND employee_id != 1
)
)
