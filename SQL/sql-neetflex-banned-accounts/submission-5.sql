-- Write your query below

SELECT DISTINCT account_id
FROM (
SELECT 
    CASE
        WHEN login <= LAG(logout, 1, '1970-01-01 00:00:00'::timestamp) OVER(PARTITION BY account_id ORDER BY ip_address)
        AND ip_address != LAG(ip_address, 1, 0) OVER(PARTITION BY account_id ORDER BY ip_address)
        THEN account_id
    END AS account_id
FROM log_info )
WHERE account_id IS NOT NULL

