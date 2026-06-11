-- Write your query below
SELECT DISTINCT page_id AS recommended_page
FROM likes
WHERE user_id IN (
SELECT user2_id AS user1_friends
FROM friendship 
WHERE user1_id = 1
UNION
SELECT user1_id AS user1_friends
FROM friendship
WHERE user2_id = 1
)
AND page_id NOT IN (
SELECT DISTINCT page_id
FROM likes
WHERE user_id = 1)


-- WITH sorted_friendships AS (
--     SELECT LEAST(user1_id, user2_id) as user1_id, 
--         GREATEST(user1_id, user2_id) as user2_id
--     FROM friendship
-- )

-- SELECT user2_id
-- FROM sorted_friendships
-- WHERE user1_id = 1
