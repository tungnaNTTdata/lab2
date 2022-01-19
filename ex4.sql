SELECT geoNetwork.country as country, device.operatingSystem as operatingSystem, device.browser as browser,
RANK() OVER (PARTITION BY device.operatingSystem ORDER BY COUNT(device.operatingSystem) DESC ) as rank
-- COUNT(device.operatingSystem) as rank
-- ARRAY_AGG(STRUCT(device.operatingSystem as operatingSystem,device.browser as browser, r) 
-- IGNORE NULLS
-- ORDER BY
-- rank) AS country_rank

FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
WHERE date = '20170801'
GROUP BY country, operatingSystem, browser
-- ORDER BY COUNT(operatingSystem) DESC 

LIMIT 1000
