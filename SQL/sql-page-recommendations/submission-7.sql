-- Write your query below
-- SELECT DISTINCT page_id AS recommended_page
-- FROM likes
-- WHERE user_id IN (
-- SELECT user2_id AS user1_friends
-- FROM friendship 
-- WHERE user1_id = 1
-- UNION
-- SELECT user1_id AS user1_friends
-- FROM friendship
-- WHERE user2_id = 1
-- )
-- AND NOT EXISTS (
--     SELECT 1
--     FROM likes l2
--     WHERE l2.user_id = 1
--     AND l2.page_id = likes.page_id
-- )
-- AND page_id NOT IN (
-- SELECT page_id
-- FROM likes
-- WHERE user_id = 1)


SELECT DISTINCT l.page_id AS recommended_page
FROM likes l
JOIN (
SELECT user2_id AS user1_friends
FROM friendship 
WHERE user1_id = 1
UNION
SELECT user1_id AS user1_friends
FROM friendship
WHERE user2_id = 1
) f
ON l.user_id = f.user1_friends
WHERE NOT EXISTS (
    SELECT 1
    FROM likes l2
    WHERE l2.user_id = 1
    AND l2.page_id = l.page_id
)


-- WITH sorted_friendships AS (
--     SELECT LEAST(user1_id, user2_id) as user1_id, 
--         GREATEST(user1_id, user2_id) as user2_id
--     FROM friendship
-- )

-- SELECT user2_id
-- FROM sorted_friendships
-- WHERE user1_id = 1
