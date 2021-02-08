--This is intresting. I'm not sure why you would ever want to format data in this way, but I tried write a very streamlined query.
--In practice I would actually perform this type of transposing/pivot through my data application whether it be Excel, Python or Tableau/Power BI

SELECT 
*
FROM
(
SELECT 
AVG(gdp_per_capita) AS North_America -- 'GROUP BY' statement note needed because we are returnnig a single value
FROM `portfolio-304103.sql_challenge.per_capita` as base
LEFT JOIN `portfolio-304103.sql_challenge.map` as map on map.country_code = base.country_code
INNER JOIN `portfolio-304103.sql_challenge.continents` as cont on cont.continents_code = map.continent_code
WHERE year = 2012 AND cont.continents_name = 'North America'
) NA,
(
SELECT 
AVG(gdp_per_capita) AS Europe -- 'GROUP BY' statement note needed because we are returnnig a single value
FROM `portfolio-304103.sql_challenge.per_capita` as base
LEFT JOIN `portfolio-304103.sql_challenge.map` as map on map.country_code = base.country_code
INNER JOIN `portfolio-304103.sql_challenge.continents` as cont on cont.continents_code = map.continent_code
WHERE year = 2012 AND cont.continents_name = 'Europe'
) EU,
(
SELECT 
AVG(gdp_per_capita) AS Rest_of_the_World -- 'GROUP BY' statement note needed because we are returnnig a single value
FROM `portfolio-304103.sql_challenge.per_capita` as base
LEFT JOIN `portfolio-304103.sql_challenge.map` as map on map.country_code = base.country_code
INNER JOIN `portfolio-304103.sql_challenge.continents` as cont on cont.continents_code = map.continent_code
WHERE year = 2012 AND cont.continents_name != 'Europe' AND cont.continents_name != 'North America'
) Rest_of_the_World 
