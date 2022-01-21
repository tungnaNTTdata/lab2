WITH list_repo AS (
SELECT repo_name 
FROM `bigquery-public-data.github_repos.languages`, UNNEST (language) AS language
WHERE language.name = 'Java'
)
SELECT committer.name AS name,
COUNT (commit) AS count
FROM `bigquery-public-data.github_repos.sample_commits`AS samples
INNER JOIN list_repo ON list_repo.repo_name = samples.repo_name
WHERE committer.date >= TIMESTAMP("2016-01-01 00:00:00 UTC")
AND committer.date < TIMESTAMP("2017-01-01 00:00:00 UTC")
GROUP BY name
ORDER BY count DESC
LIMIT 10
