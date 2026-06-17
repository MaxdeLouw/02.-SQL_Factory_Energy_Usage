-- Metrics by hour of day

DROP TABLE IF EXISTS dashboard_hourly;
CREATE TABLE dashboard_hourly AS
SELECT
    hour,
    ROUND(AVG("usage_kwh"), 2) AS avg_usage_kwh,
    ROUND(AVG("co2_kg"), 2) AS avg_co2_kg,
    ROUND(AVG("lagging_power_factor"), 2) AS avg_lagging_pf,
    ROUND(AVG("leading_power_factor"), 2) AS avg_leading_pf,
    ROUND(AVG("co2_per_kwh"), 2) AS avg_co2_per_kwh,
    ROUND(AVG("reactive_power_percent"), 2) AS avg_reactive_power_percent
FROM energy_usage_clean
Group by hour
;

-- Metrics by weekday
DROP TABLE IF EXISTS dashboard_weekday;
CREATE TABLE dashboard_weekday AS
SELECT
    Day_of_week,
    ROUND(AVG("usage_kwh"), 2) AS avg_usage_kwh,
    ROUND(AVG("co2_kg"), 2) AS avg_co2_kg,
    ROUND(AVG("lagging_power_factor"), 2) AS avg_lagging_pf,
    ROUND(AVG("leading_power_factor"), 2) AS avg_leading_pf,
    ROUND(AVG("co2_per_kwh"), 2) AS avg_co2_per_kwh,
    ROUND(AVG("reactive_power_percent"), 2) AS avg_reactive_power_percent
FROM energy_usage_clean
Group by Day_of_week
;

-- Metrics by month
DROP TABLE IF EXISTS dashboard_month;
CREATE TABLE dashboard_month AS
SELECT
    month,
    ROUND(AVG("usage_kwh"), 2) AS avg_usage_kwh,
    Round(AVG("co2_kg"), 2) AS avg_co2_kg,
    Round(AVG("lagging_power_factor"), 2) AS avg_lagging_pf,
    Round(AVG("leading_power_factor"), 2) AS avg_leading_pf,
    Round(AVG("co2_per_kwh"), 2) AS avg_co2_per_kwh,
    round(avg("reactive_power_percent"), 2) as avg_reactive_power_percent
FROM energy_usage_clean
Group by month
;

-- Load type summary
DROP TABLE IF EXISTS dashboard_load_type;
CREATE TABLE dashboard_load_type AS
SELECT
    load_type,
    ROUND(AVG("usage_kwh"), 2) AS avg_usage_kwh,
    Round(AVG("co2_kg"), 2) AS avg_co2_kg,
    Round(AVG("lagging_power_factor"), 2) AS avg_lagging_pf,
    Round(AVG("leading_power_factor"), 2) AS avg_leading_pf,
    Round(AVG("co2_per_kwh"), 2) AS avg_co2_per_kwh,
    round(avg("reactive_power_percent"), 2) as avg_reactive_power_percent
FROM energy_usage_clean
Group by load_type
;

--KPI's
DROP TABLE IF EXISTS KPIs;

CREATE TABLE KPIs AS
SELECT
    ROUND(SUM("usage_kwh"), 2) AS total_energy_kwh,
    ROUND(SUM("co2_kg"), 2) AS total_co2_kg,
    ROUND(AVG("lagging_power_factor"), 2) AS avg_lagging_pf,
    ROUND(AVG("leading_power_factor"), 2) AS avg_leading_pf
FROM energy_usage_clean;
