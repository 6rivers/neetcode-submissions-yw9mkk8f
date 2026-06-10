-- Write your query below
-- SELECT person1, person2, COUNT(*) AS call_count, SUM(duration) as total_duration
-- FROM (SELECT 
--     CASE WHEN from_id < to_id THEN from_id 
--     ELSE to_id END AS person1,
--     CASE WHEN to_id > from_id THEN to_id 
--     ELSE from_id END AS person2, 
--     duration
-- FROM calls)
-- GROUP BY person1, person2


SELECT
    LEAST(from_id, to_id) AS person1,
    GREATEST(from_id, to_id) AS person2,
    COUNT(duration) AS call_count,
    SUM(duration) AS total_duration
FROM calls
GROUP BY person1, person2

