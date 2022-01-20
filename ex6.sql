WITH list_answer_on_2010 AS (
SELECT accepted_answer_id FROM `bigquery-public-data.stackoverflow.stackoverflow_posts`
WHERE creation_date >= TIMESTAMP("2010-01-01 00:00:00 UTC")
  AND creation_date <= TIMESTAMP("2011-01-01 00:00:00 UTC")
LIMIT 1000)
SELECT owner_user_id AS id_user,
COUNT (id) AS COUNT
FROM `list_answer_on_2010`
INNER JOIN `bigquery-public-data.stackoverflow.posts_answers`
ON list_answer_on_2010.accepted_answer_id = id
GROUP BY owner_user_id
ORDER BY count DESC
LIMIT 10
