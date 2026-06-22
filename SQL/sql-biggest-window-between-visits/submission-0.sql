-- Write your query below
SELECT user_id, MAX(visit_window) AS biggest_window
FROM (
    SELECT user_id, 
        (LEAD(visit_date, 1, '2021-1-1'::DATE) OVER(PARTITION BY user_id ORDER BY visit_date ASC) - visit_date) AS visit_window
    FROM user_visits
)
GROUP BY user_id
ORDER BY user_id