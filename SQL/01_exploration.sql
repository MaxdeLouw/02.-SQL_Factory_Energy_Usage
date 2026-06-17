-- Get a slice of the data
SELECT *
FROM energy_usage
LIMIT 10;

-- Count the amount of rows
SELECT COUNT(*) AS total_rows
FROM energy_usage;

-- Get table information 
PRAGMA table_info(energy_usage);

-- See if we fixed the dates
SELECT
    date,
    CAST(strftime('%Y', date) AS INTEGER) AS year,
    CAST(strftime('%m', date) AS INTEGER) AS month,
    CAST(strftime('%d', date) AS INTEGER) AS day,
    CAST(strftime('%H', date) AS INTEGER) AS hour
FROM energy_usage
group by date
LIMIT 10
;

-- Metrics per month
SELECT
    CAST(strftime('%Y', date) AS INTEGER) AS year,
    CAST(strftime('%m', date) AS INTEGER) AS month,
    ROUND(SUM("Usage_kWh"), 2) AS total_energy_usage,
    Round(SUM("Lagging_Current_Reactive.Power_kVarh"), 2) AS total_reactive_power,
    Round(SUM("Leading_Current_Reactive_Power_kVarh"), 2) AS total_leading_power,
    Round(SUM("CO2(kg)"), 2) AS total_co2_emissions,
    Round(AVG("Lagging_Current_Power_Factor"), 2) AS Avg_Lagging_Current_Power_Factor,
    Round(AVG("Leading_Current_Power_Factor"), 2) AS Avg_Leading_Current_Power_Factor
FROM energy_usage
GROUP BY year, month
ORDER BY year, month
;

-- Metrics by day of week
SELECT
    Day_of_week,
    ROUND(SUM("Usage_kWh"), 2) AS total_energy_usage,
    Round(SUM("Lagging_Current_Reactive.Power_kVarh"), 2) AS total_reactive_power,
    Round(SUM("Leading_Current_Reactive_Power_kVarh"), 2) AS total_leading_power,
    Round(SUM("CO2(kg)"), 2) AS total_co2_emissions,
    Round(AVG("Lagging_Current_Power_Factor"), 2) AS Avg_Lagging_Current_Power_Factor,
    Round(AVG("Leading_Current_Power_Factor"), 2) AS Avg_Leading_Current_Power_Factor
FROM energy_usage
GROUP BY Day_of_week
ORDER BY total_energy_usage DESC
;

-- Metrics by hour of day
SELECT
    strftime('%H', date) AS hour_of_day,
    ROUND(SUM("Usage_kWh"), 2) AS total_energy_usage,
    Round(SUM("Lagging_Current_Reactive.Power_kVarh"), 2) AS total_reactive_power,
    Round(SUM("Leading_Current_Reactive_Power_kVarh"), 2) AS total_leading_power,
    Round(SUM("CO2(kg)"), 2) AS total_co2_emissions,
    Round(AVG("Lagging_Current_Power_Factor"), 2) AS Avg_Lagging_Current_Power_Factor,
    Round(AVG("Leading_Current_Power_Factor"), 2) AS Avg_Leading_Current_Power_Factor
FROM energy_usage
GROUP BY strftime('%H', date)
ORDER BY Hour_of_day
;

-- Emissions by load type
SELECT
    load_type,
    Round(AVG("CO2(kg)"), 4) AS Avg_CO2_Emissions
FROM energy_usage
GROUP BY load_type
ORDER BY Avg_CO2_Emissions DESC
;

-- AVERAGE emmissions by day of week
SELECT
    Day_of_week,
    Round(AVG("CO2(kg)"), 4) AS Avg_CO2_Emissions
FROM energy_usage
GROUP BY Day_of_week
ORDER BY Avg_CO2_Emissions DESC
;

-- Average emmission by hour of the day
SELECT
    strftime('%H', date) AS hour_of_day,
    Round(AVG("CO2(kg)"), 4) AS Avg_CO2_Emissions
FROM energy_usage
GROUP BY strftime('%H', date)
ORDER BY hour_of_day
;

-- Emissions per kWh
SELECT
    Round(AVG("CO2(kg)" / "Usage_kWh"), 4) AS CO2_per_kWh
FROM energy_usage;