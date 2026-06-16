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

-- USING NOT IN, but NOT Exists is better, which handles NULLs
-- AND page_id NOT IN (
-- SELECT page_id
-- FROM likes
-- WHERE user_id = 1)


-- SELECT DISTINCT l.page_id AS recommended_page
-- FROM likes l
-- JOIN (
-- SELECT user2_id AS user1_friends
-- FROM friendship 
-- WHERE user1_id = 1
-- UNION
-- SELECT user1_id AS user1_friends
-- FROM friendship
-- WHERE user2_id = 1
-- ) f
-- ON l.user_id = f.user1_friends
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM likes l2
--     WHERE l2.user_id = 1
--     AND l2.page_id = l.page_id
-- )


WITH user1_friends AS (
    SELECT 
        CASE WHEN user1_id = 1 THEN user2_id 
             WHEN user2_id = 1 THEN user1_id
        END AS friend
    FROM friendship
)

SELECT DISTINCT page_id AS recommended_page
FROM likes l
JOIN user1_friends f ON l.user_id = f.friend
WHERE NOT EXISTS ( 
    SELECT 1
    FROM likes l2
    WHERE l2.user_id = 1
    AND l2.page_id = l.page_id
)

-- SELECT user2_id
-- FROM sorted_friendships
-- WHERE user1_id = 1
