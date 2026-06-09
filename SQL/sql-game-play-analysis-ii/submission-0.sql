-- Write your query below
SELECT player_id, device_id
FROM activity
WHERE event_date IN (
SELECT MIN(event_date)
FROM activity
GROUP BY player_id )