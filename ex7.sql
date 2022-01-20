SELECT l.name AS language_name,
COUNT (repo_name) AS count
FROM `bigquery-public-data.github_repos.languages`, UNNEST (language) AS l
GROUP BY language_name
ORDER BY count DESC
LIMIT 1
