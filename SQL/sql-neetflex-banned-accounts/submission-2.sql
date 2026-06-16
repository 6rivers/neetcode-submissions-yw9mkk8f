-- Write your query below
-- SELECT account_id, 
--     LAG(logout) OVER(PARTITION BY account_id ORDER BY ip_address) AS prev_logout
-- FROM log_info
SELECT account_id
FROM (
SELECT 
    CASE
        WHEN login <= LAG(logout, 1, '1970-01-01 00:00:00'::timestamp) OVER(PARTITION BY account_id ORDER BY ip_address)
        THEN account_id
    END AS account_id
FROM log_info )
WHERE account_id IS NOT NULL
-- WHERE account_id IS NOT NULL


-- SELECT *,
--     LAG(logout, 1, '1970-01-01 00:00:00'::timestamp) OVER(PARTITION BY account_id ORDER BY ip_address)
-- FROM log_info

