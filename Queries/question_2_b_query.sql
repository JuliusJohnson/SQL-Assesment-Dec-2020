--List the Top 10 Countries by year over year % GDP per capita growth between 2011 & 2012.
SELECT 
rank() OVER (ORDER BY PctGrowth DESC) Rank
,country.country_name Country_Name
,base.country_code Country_Code
,cont.continents_name
,PctGrowth Growth_Percent

FROM(
select 
p.country_code
,(c.gdp_per_capita / p.gdp_per_capita)-1 PctGrowth
--,p.gdp_per_capita gdp2011 [Used to check results]
--,c.gdp_per_capita gdp2012 [Used to check results]
from `portfolio-304103.sql_challenge.per_capita` as p
FULL OUTER JOIN (
select 
country_code
,gdp_per_capita
from `portfolio-304103.sql_challenge.per_capita`
WHERE year = 2012
) AS c on c.country_code = p.country_code 
WHERE p.YEAR = 2011 
) base
LEFT JOIN `portfolio-304103.sql_challenge.countries` as country on country.country_code = base.country_code
LEFT JOIN `portfolio-304103.sql_challenge.map` as map on map.country_code = base.country_code
INNER JOIN `portfolio-304103.sql_challenge.continents` as cont on cont.continents_code = map.continent_code
ORDER BY pctGrowth dESC
LIMIT 10 -- Alternatively if we want to be sure this was correct we could add a filter that finds where 'Rank >= 10' 
--This method would probably be slower on extremely large data sets, but more robust with more dynamic data.
