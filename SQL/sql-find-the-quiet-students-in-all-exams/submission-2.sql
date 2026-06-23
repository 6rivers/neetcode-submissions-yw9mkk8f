-- Write your query below
WITH exam_stats AS (
    SELECT exam_id, MIN(score) AS least_score, MAX(score) AS highest_score
    FROM exam
    GROUP BY exam_id
),
loud_students AS (
    SELECT student_id
    FROM exam e
    JOIN exam_stats es ON e.exam_id = es.exam_id
    WHERE e.score = es.highest_score
    OR e.score = es.least_score
)

SELECT s.student_id, s.student_name
FROM student s
WHERE s.student_id NOT IN (SELECT DISTINCT student_id FROM loud_students)
AND s.student_id IN (SELECT student_id FROM exam)
ORDER BY s.student_id