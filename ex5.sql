SELECT owner_user_id AS id_user, 
COUNT (id) AS count
FROM `bigquery-public-data.stackoverflow.posts_answers`
GROUP BY owner_user_id
ORDER BY count DESC
LIMIT 10
