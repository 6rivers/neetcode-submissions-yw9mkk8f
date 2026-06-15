-- Write your query below
SELECT player_id, event_date,
    SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
    -- LAG(games_played, 1, 0) OVER(PARTITION BY player_id ORDER BY event_date) AS prev_games,
    -- LEAD(games_played, 1, 0) OVER(PARTITION BY player_id ORDER BY event_date) AS next_games
FROM activity
GROUP BY player_id, event_date