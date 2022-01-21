SELECT date, h.page.pagePath as pagePath,
COUNT (h.page.pagePath) as counter
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017070*`, UNNEST (hits) as h 
GROUP BY pagePath, date
LIMIT 1000
