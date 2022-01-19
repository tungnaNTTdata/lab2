SELECT date, h.page.pagePath as pagePath,
COUNT (h.page.pagePath) as counter
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170701`, UNNEST (hits) as h 
WHERE date = '20170701'
GROUP BY pagePath, date
LIMIT 1000
