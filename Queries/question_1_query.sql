--Purpose: to test candidates data integrity and clean-up skills
--Task: Alphabetically list all the country codes ase when country_code IS NULL THEN 'N/A' ELSE country_code END country_code2in the continent map table that appear more than once. 
-- Task cont.: For countries with no country code make them display as "N/A" and display them first in the list.

SELECT 
CASE WHEN country_code IS NULL THEN 'N/A' ELSE country_code END country_code2
--,COUNT(CASE WHEN country_code IS NULL THEN 'N/A' ELSE country_code END) Number_of_occurances [This Line was used to check results. I imagine the final list should be a single array]

FROM `portfolio-304103.sql_challenge.map`

GROUP BY country_code2
HAVING COUNT(country_code2) > 1
ORDER BY CASE WHEN country_code2 = 'N/A' THEN 1 else 2 end -- Never knew could apply conditional logic to a ORDER BY Clause!
