SELECT EXTRACT(YEAR FROM Release_Date) AS year , Movie_Title, Production_Budget,
RANK() OVER(PARTITION BY Release_Date ORDER BY Production_Budget ASC) AS rank
FROM `nttdata-c4e-bde.uc1_10.Movie`
WHERE Release_Date >= DATE("2016-01-01") AND Release_Date <= DATE("2020-12-31")
ORDER BY year DESC 
LIMIT 10
