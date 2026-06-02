-- Write your query below
SELECT u.name, 
    CASE 
        WHEN rd.travelled_distance != 0 THEN rd.travelled_distance
        ELSE 0
    END AS travelled_distance
FROM users u
LEFT JOIN (
    SELECT r.user_id, SUM(r.distance) AS travelled_distance
    FROM rides r
    GROUP BY r.user_id
) AS rd
ON u.id = rd.user_id
ORDER BY rd.travelled_distance DESC NULLS LAST, u.name ASC;
