-- Write your query below
-- Solution 1
SELECT c.name AS country
FROM country c
JOIN (
SELECT SPLIT_PART(p.phone_number, '-', 1) AS country_code, total_calls.duration AS call_duration
FROM person p
JOIN (SELECT caller_id AS person_id, duration
FROM calls
UNION ALL
SELECT callee_id AS person_id, duration
FROM calls) total_calls
ON p.id = total_calls.person_id
) country_wise
ON c.country_code = country_wise.country_code
GROUP BY c.country_code
HAVING AVG(country_wise.call_duration) > 
(
    SELECT AVG(duration)
    FROM calls
)


-- Solution 2
-- SELECT c.name AS country
-- FROM person p
-- JOIN country c ON SPLIT_PART(p.phone_number, '-', 1) = c.country_code
-- JOIN calls cl ON p.id = cl.caller_id
-- OR p.id = cl.callee_id
-- GROUP BY c.name
-- HAVING AVG(cl.duration) > (SELECT AVG(duration) FROM calls)





