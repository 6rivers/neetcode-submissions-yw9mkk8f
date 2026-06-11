-- Write your query below
-- SELECT 
-- FROM person p
-- JOIN calls c ON p.id = c.caller_id
-- OR p.id = c.callee_id



SELECT c.name AS country
FROM country c
JOIN (
SELECT p.name, p.phone_number, SPLIT_PART(p.phone_number, '-', 1) AS country_code, total_calls.duration AS call_duration
FROM person p
JOIN (SELECT caller_id AS person_id, duration
FROM calls
UNION ALL
SELECT callee_id AS person_id, duration
FROM calls) total_calls
ON p.id = total_calls.person_id
) country_wise
ON c.country_code = country_wise.country_code
GROUP BY c.country_code, c.name
HAVING AVG(country_wise.call_duration) > 
(
    SELECT AVG(duration) * 2
    FROM calls
)






