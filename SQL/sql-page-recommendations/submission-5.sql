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
SELECT page_id
FROM likes
WHERE user_id = 1)

-- Honestly, your solution is arguably cleaner and more readable here. 
-- The IN subquery reads almost like plain English — "give me pages liked by users 
-- who are friends of user 1, excluding pages user 1 already likes." The intent is immediately obvious.
-- The one thing worth keeping in mind (as I mentioned earlier) is the NOT IN + NULL
--  trap — if page_id could ever be NULL in the likes table, your query would silently return zero rows. 
-- NeetCode's solution has the same vulnerability. In production SQL, NOT EXISTS is the safer habit for exclusion logic. But for this problem where the schema is clean, your approach is perfectly fine.
-- Also, I can see you have a commented-out CTE approach using LEAST / GREATEST at the bottom — that's a clever idea for normalising bidirectional friendships into a canonical form. Good exploratory thinking!

-- WITH sorted_friendships AS (
--     SELECT LEAST(user1_id, user2_id) as user1_id, 
--         GREATEST(user1_id, user2_id) as user2_id
--     FROM friendship
-- )

-- SELECT user2_id
-- FROM sorted_friendships
-- WHERE user1_id = 1
