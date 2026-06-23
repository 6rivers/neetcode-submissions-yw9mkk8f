-- Write your query below
-- 2, 3, 2
WITH student_ranks AS (
    SELECT e.exam_id, e.student_id, s.student_name,
        RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) as student_rank
    FROM student s
    JOIN exam e ON s.student_id = e.student_id
    ORDER BY e.exam_id
)

-- SELECT student_id, student_name
-- FROM student_ranks
-- WHERE student_rank NOT IN (1, 3)

SELECT DISTINCT student_id, student_name
FROM student_ranks
WHERE (student_id, student_name) NOT IN (
    SELECT student_id, student_name
    FROM student_ranks
    WHERE student_rank IN (1, 3)
)
ORDER BY student_id

-- SELECT *
-- FROM student_ranks