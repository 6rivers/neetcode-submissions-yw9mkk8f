-- Write your query below
-- SELECT e1.employee_id
-- FROM employees e1
-- JOIN employees e2 ON e1.manager_id = e2.employee_id
-- JOIN employees e3 ON e2.manager_id = e3.employee_id
-- WHERE e1.employee_id != 1
-- AND (
--     e1.manager_id = 1
--     OR e2.manager_id = 1
--     OR e3.manager_id = 1
-- )

WITH RECURSIVE reports AS (
    SELECT employee_id
    FROM employees
    WHERE manager_id = 1
    AND employee_id != 1

    UNION

    SELECT e.employee_id
    FROM employees e
    JOIN reports r ON e.manager_id = r.employee_id
)

SELECT employee_id
FROM reports



-- SELECT employee_id
-- FROM employees
-- WHERE manager_id = 1
-- AND employee_id != 1
-- UNION ALL
-- SELECT employee_id
-- FROM employees
-- WHERE manager_id IN (
--     SELECT employee_id
--     FROM employees
--     WHERE manager_id = 1
--     AND employee_id != 1
-- )
-- UNION ALL
-- SELECT employee_id
-- FROM employees
-- WHERE manager_id IN (
-- SELECT employee_id
-- FROM employees
-- WHERE manager_id IN (
--     SELECT employee_id
--     FROM employees
--     WHERE manager_id = 1
--     AND employee_id != 1
-- )
-- )
