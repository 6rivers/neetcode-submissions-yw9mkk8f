-- Write your query below
SELECT id, name
FROM students
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_id IS NOT NULL
);

-- SELECT s.id, s.name
-- FROM students s
-- LEFT JOIN departments d ON s.department_id = d.id
-- WHERE d.name is NULL