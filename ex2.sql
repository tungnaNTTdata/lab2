SELECT visitId, visitStartTime, h.page.pageTitle as pageTitle, h.page.pagePath as pagePath 
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`, UNNEST(hits) as h
WHERE date = '20170801' 
LIMIT 1000
