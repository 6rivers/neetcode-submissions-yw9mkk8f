-- Write your query below
SELECT p.player_id, p.player_name,
    SUM(
        CASE
            WHEN wimbledon = player_id
            THEN 1
            ELSE 0
        END
    )  +
    SUM(
        CASE
            WHEN fr_open = player_id
            THEN 1
            ELSE 0
        END
    )  +
    SUM(
        CASE
            WHEN us_open = player_id
            THEN 1
            ELSE 0
        END
    ) +
    SUM(
        CASE
            WHEN au_open = player_id
            THEN 1
            ELSE 0
        END
    ) AS grand_slams_count

FROM players p
JOIN championships c ON p.player_id = c.wimbledon
OR p.player_id = c.fr_open
OR p.player_id = us_open
OR p.player_id = au_open
GROUP BY p.player_id
ORDER BY p.player_id