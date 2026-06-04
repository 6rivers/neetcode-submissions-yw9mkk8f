-- Write your query below
-- SELECT student_id, 
--     CASE 
--         WHEN COUNT(MAX(score)) > 1 THEN MIN(exam_id)
--         ELSE exam_id
--     END AS exam_id,
--     score
-- FROM exam_results
-- GROUP BY student_id
-- ORDER BY student_id ASC;

WITH top_scores AS (
    SELECT student_id, MAX(score) as top_score
    FROM exam_results er
    GROUP BY student_id
)

SELECT ts.student_id, MIN(er.exam_id) AS exam_id, ts.top_score AS score
FROM top_scores ts
JOIN exam_results er ON ts.student_id = er.student_id
AND ts.top_score = er.score
GROUP BY ts.student_id, ts.top_score
ORDER BY student_id



