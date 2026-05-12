USE climate_analysis;

SELECT 
    FLOOR(Year/10)*10 AS Decade,
    ROUND(AVG(LandAverageTemperature), 2) AS Avg_Temperature,
    ROUND(MIN(LandAverageTemperature), 2) AS Min_Temperature,
    ROUND(MAX(LandAverageTemperature), 2) AS Max_Temperature,
    COUNT(*) AS Total_Months
FROM global_temperatures
GROUP BY Decade
ORDER BY Decade;
SELECT 
    Year,
    ROUND(AVG(LandAverageTemperature), 3) AS Avg_Temp
FROM global_temperatures
GROUP BY Year
ORDER BY Avg_Temp DESC
LIMIT 10;
SELECT 
    country_name,
    ROUND(SUM(co2_emissions_kt)/1000, 2) AS Total_CO2_Million_KT
FROM co2_emissions
WHERE co2_emissions_kt IS NOT NULL
GROUP BY country_name
ORDER BY Total_CO2_Million_KT DESC
LIMIT 10;
SELECT 
    `Disaster Type`,
    COUNT(*) AS Total_Events,
    SUM(`Total Deaths`) AS Total_Deaths,
    ROUND(AVG(`Total Deaths`), 0) AS Avg_Deaths
FROM natural_disasters
WHERE `Disaster Type` IS NOT NULL
GROUP BY `Disaster Type`
ORDER BY Total_Events DESC;
SELECT 
    FLOOR(Year/10)*10 AS Decade,
    COUNT(*) AS Total_Disasters,
    SUM(`Total Deaths`) AS Total_Deaths
FROM natural_disasters
GROUP BY Decade
ORDER BY Decade;
SELECT 
    `Disaster Type`,
    COUNT(*) AS Total_Events,
    COALESCE(SUM(`Total Deaths`), 0) AS Total_Deaths,
    ROUND(COALESCE(AVG(`Total Deaths`), 0), 0) AS Avg_Deaths
FROM natural_disasters
WHERE `Disaster Type` IS NOT NULL
GROUP BY `Disaster Type`
ORDER BY Total_Events DESC;

SELECT 
    country_name,
    ROUND(SUM(co2_emissions_kt)/1000, 2) AS Total_CO2_Million_KT
FROM co2_emissions
WHERE country_name NOT IN (
    'World', 'High income', 'Low & middle income',
    'Middle income', 'Upper middle income',
    'Lower middle income', 'Low income',
    'IDA & IBRD total', 'IDA total', 'IBRD only',
    'IDA only', 'OECD members', 'Europe & Central Asia',
    'East Asia & Pacific', 'North America',
    'Post-demographic dividend', 'Late-demographic dividend',
    'Early-demographic dividend', 'Pre-demographic dividend',
    'South Asia', 'Sub-Saharan Africa',
    'Latin America & Caribbean', 'Arab World',
    'European Union', 'Fragile and conflict affected situations'
)
AND co2_emissions_kt IS NOT NULL
GROUP BY country_name
ORDER BY Total_CO2_Million_KT DESC
LIMIT 10;
USE climate_analysis;

SELECT 
    country_name,
    ROUND(SUM(co2_emissions_kt)/1000, 2) AS Total_CO2_Million_KT
FROM co2_emissions
WHERE co2_emissions_kt IS NOT NULL
AND country_name NOT LIKE '%income%'
AND country_name NOT LIKE '%IDA%'
AND country_name NOT LIKE '%IBRD%'
AND country_name NOT LIKE '%Asia%'
AND country_name NOT LIKE '%Africa%'
AND country_name NOT LIKE '%Europe%'
AND country_name NOT LIKE '%America%'
AND country_name NOT LIKE '%Pacific%'
AND country_name NOT LIKE '%World%'
AND country_name NOT LIKE '%area%'
AND country_name NOT LIKE '%dividend%'
AND country_name NOT LIKE '%OECD%'
AND country_name NOT LIKE '%Middle East%'
AND country_name NOT LIKE '%Caribbean%'
AND country_name NOT LIKE '%members%'
AND country_name NOT LIKE '%situations%'
GROUP BY country_name
ORDER BY Total_CO2_Million_KT DESC
LIMIT 10;