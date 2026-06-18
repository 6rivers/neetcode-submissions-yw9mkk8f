-- Write your query below
WITH top_transactions AS (
    SELECT transaction_id,  day, amount,
        RANK() OVER(PARTITION BY day::date ORDER BY amount DESC) AS amount_rank
    FROM transactions
    -- ORDER BY day DESC
)

-- SELECT *
-- FROM top_transactions


SELECT transaction_id
FROM top_transactions
WHERE amount_rank = 1
ORDER BY transaction_id ASC;