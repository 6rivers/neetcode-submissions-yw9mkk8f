-- Write your query below
WITH exam_stats AS (
    SELECT exam_id, MIN(score) AS least_score, MAX(score) AS highest_score
    FROM student s
    JOIN exam e ON s.student_id = e.student_id
    GROUP BY e.exam_id
),
loud_students AS (
    SELECT s.student_id, s.student_name
    FROM student s
    JOIN exam e ON s.student_id = e.student_id
    JOIN exam_stats es ON e.exam_id = es.exam_id
    WHERE e.score = es.least_score 
    OR e.score = es.highest_score
)

SELECT s.student_id, s.student_name
FROM student s
WHERE s.student_id NOT IN (
    SELECT student_id
    FROM loud_students
)
AND s.student_id IN (SELECT student_id FROM exam)
