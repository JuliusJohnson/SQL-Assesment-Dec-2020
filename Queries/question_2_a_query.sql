--List the Top 10 Countries by year over year % GDP per capita growth between 2011 & 2012.

SELECT
  RANK() OVER (ORDER BY Growth_Percent DESC ) AS rank,
  country_name,
  country_code,
  continents_name as continent,
  growth_percent
FROM (
  SELECT
    country.country_name,
    capita.country_code,
    continent.continents_name
    ,ROUND(SAFE_DIVIDE(gdp_per_capita,LAG(gdp_per_capita, 1) OVER (ORDER BY capita.country_code, capita.year))-1,4) AS growth_percent
    ,capita.year
  FROM
    `salesloft-123.salesloft.per_capita` AS capita
  LEFT JOIN `salesloft-123.salesloft.countries` AS country ON country.country_code = capita.country_code
  LEFT JOIN `salesloft-123.salesloft.map` AS map ON map.country_code = capita.country_code
  LEFT JOIN `salesloft-123.salesloft.continents` AS continent ON continent.continents_code = map.continent_code
  WHERE year IN(2011, 2012)
    ) AS Growth_task
WHERE year = 2012
  LIMIT 10
