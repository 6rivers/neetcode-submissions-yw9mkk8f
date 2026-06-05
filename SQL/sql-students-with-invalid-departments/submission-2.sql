-- Write your query below
SELECT id, name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.id = s.department_id
);

-- SELECT s.id, s.name
-- FROM students s
-- LEFT JOIN departments d ON s.department_id = d.id
-- WHERE d.name is NULL