WITH raw_table AS (
    SELECT geoNetwork.country AS country, device.operatingSystem AS operatingSystem, device.browser AS browser,
    RANK() OVER (PARTITION BY geoNetwork.country ORDER BY COUNT (visitId) DESC) AS rank
    FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
    WHERE device.deviceCategory = 'mobile'AND geoNetwork.country !='(not set)' AND device.operatingSystem !='(not set)' 
    GROUP BY device.operatingSystem, device.browser, geoNetwork.country
    ORDER BY geoNetwork.country, device.browser, geoNetwork.country
)

SELECT country, 
ARRAY_AGG(STRUCT (operatingSystem, browser, rank) 
IGNORE NULLS
ORDER BY rank) AS country_rank
FROM raw_table 
WHERE rank <= 3
GROUP BY country 
ORDER BY country 
