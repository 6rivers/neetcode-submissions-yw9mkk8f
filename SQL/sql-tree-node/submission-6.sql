-- Write your query below
-- SELECT DISTINCT t2.id, 
--     CASE
--         WHEN t2.p_id IS NULL THEN 'Root'
--         WHEN t1.p_id IS NOT NULL AND t2.p_id IS NOT NULL THEN 'Inner'
--         WHEN t1.p_id IS NULL AND t2.p_id IS NOT NULL THEN 'Leaf'
--     END AS type
-- FROM tree t1
-- FULL JOIN tree t2 ON t1.p_id = t2.id
-- WHERE t2.id IS NOT NULL


SELECT id,
    CASE
        WHEN p_id IS NULL THEN 'Root' 
        WHEN id IN (SELECT p_id FROM tree WHERE p_id IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf' 
    END AS type
FROM tree









