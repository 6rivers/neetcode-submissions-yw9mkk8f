-- Write your query below

WITH RECURSIVE total_tasks AS (
    SELECT task_id, subtasks_count, 1 AS subtask
    FROM tasks

    UNION ALL

    SELECT task_id, subtasks_count, subtask + 1 
    FROM total_tasks
    WHERE subtask < subtasks_count
)

SELECT t.task_id, t.subtask AS subtask_id
FROM total_tasks t
LEFT JOIN executed e ON t.task_id = e.task_id
AND t.subtask = e.subtask_id
WHERE e.task_id IS NULL
ORDER BY t.task_id, t.subtask

-- WITH RECURSIVE counter AS (
--     SELECT 1 AS count

--     UNION ALL

--     SELECT count + 1 FROM counter
--     WHERE count < 5
-- )

-- SELECT * FROM counter