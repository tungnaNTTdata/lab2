WITH raw_table AS (
SELECT EXTRACT(YEAR FROM Release_Date) AS year , Movie_Title, Production_Budget,
RANK() OVER(PARTITION BY (EXTRACT(YEAR FROM Release_Date)) ORDER BY Production_Budget DESC) AS rank
FROM `nttdata-c4e-bde.uc1_10.Movie`
)
SELECT year, Movie_Title, Production_Budget, rank
FROM raw_table
WHERE raw_table.year  >= 2016 AND raw_table.year  <= 2020 AND rank <= 10
ORDER BY year DESC , rank
