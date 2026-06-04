-- Write your query below
-- SELECT u.name, 
--     CASE 
--         WHEN rd.travelled_distance != 0 THEN rd.travelled_distance
--         ELSE 0
--     END AS travelled_distance
-- FROM users u
-- LEFT JOIN (
--     SELECT r.user_id, SUM(r.distance) AS travelled_distance
--     FROM rides r
--     GROUP BY r.user_id
-- ) AS rd
-- ON u.id = rd.user_id
-- ORDER BY rd.travelled_distance DESC NULLS LAST, u.name ASC;

-- SELECT u.name, COALESCE(rd.travelled_distance, 0) AS travelled_distance
-- FROM users u
-- LEFT JOIN (
--     SELECT user_id, SUM(distance) AS travelled_distance
--     FROM rides
--     GROUP BY user_id
-- ) AS rd
-- ON rd.user_id = u.id
-- ORDER BY COALESCE(rd.travelled_distance, 0) DESC, u.name ASC;

SELECT u.name, COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM users u
LEFT JOIN rides r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;


