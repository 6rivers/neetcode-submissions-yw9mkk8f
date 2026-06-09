-- Write your query below
-- SELECT player_id, device_id
-- FROM activity
-- WHERE event_date IN (
-- SELECT MIN(event_date)
-- FROM activity
-- GROUP BY player_id )

SELECT a.player_id, a.device_id
FROM activity a
JOIN (
SELECT player_id, MIN(event_date) as first_login
FROM activity
GROUP BY player_id ) AS player_logins
ON a.player_id = player_logins.player_id
AND a.event_date = player_logins.first_login