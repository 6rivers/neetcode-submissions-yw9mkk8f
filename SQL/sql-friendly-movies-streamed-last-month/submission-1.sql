-- Write your query below
SELECT distinct(c.title)
FROM tv_program t
JOIN content c ON t.content_id = c.content_id
WHERE c.kids_content = 'Y' 
AND (t.program_date >= '2020-06-01' AND t.program_date < '2020-07-01') 
AND c.content_type = 'Movies';