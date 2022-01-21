SELECT owner_user_id AS id_user, 
COUNT (id) AS count
FROM `bigquery-public-data.stackoverflow.posts_answers`
WHERE owner_user_id IS NOT NULL 
  AND creation_date >= TIMESTAMP("2010-01-01 00:00:00 UTC")
  AND creation_date < TIMESTAMP("2011-01-01 00:00:00 UTC")
GROUP BY owner_user_id
ORDER BY count DESC
LIMIT 10
