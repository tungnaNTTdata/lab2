SELECT repo_name, difference.new_path AS file, committer.date AS date, 
LAG(commit)
OVER (PARTITION BY difference.new_path ORDER BY committer.date ASC) AS previous_commit,
commit,
LEAD(commit)
OVER(PARTITION BY difference.new_path ORDER BY committer.date ASC) AS next_commit
FROM `bigquery-public-data.github_repos.sample_commits`, UNNEST (difference) AS difference
WHERE difference.new_path LIKE 'kernel/%.c' AND repo_name LIKE '%linux'
