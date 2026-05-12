CREATE DATABASE climate_analysis;
USE climate_analysis;
CREATE TABLE global_temperatures (
    dt DATE,
    LandAverageTemperature FLOAT,
    LandAverageTemperatureUncertainty FLOAT,
    LandMaxTemperature FLOAT,
    LandMinTemperature FLOAT,
    LandAndOceanAverageTemperature FLOAT
);
CREATE TABLE co2_emissions (
    country_name VARCHAR(100),
    country_code VARCHAR(10),
    year INT,
    emissions_kt FLOAT
);
CREATE TABLE natural_disasters (
    Year INT,
    Disaster_Type VARCHAR(100),
    Country VARCHAR(100),
    Total_Deaths INT,
    Total_Affected INT,
    Total_Damage FLOAT
);
USE climate_analysis;

SHOW TABLES;

SELECT COUNT(*) AS temp_rows      FROM global_temperatures;
SELECT COUNT(*) AS co2_rows       FROM co2_emissions;
SELECT COUNT(*) AS disaster_rows  FROM natural_disasters;