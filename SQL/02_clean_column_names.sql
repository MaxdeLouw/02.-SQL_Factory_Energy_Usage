DROP TABLE IF EXISTS energy_usage_clean;

CREATE TABLE energy_usage_clean AS
SELECT
    date,
    Usage_kWh AS usage_kwh,
    "CO2(kg)" AS co2_kg,
    "Lagging_Current_Reactive.Power_kVarh" AS lagging_reactive_kvarh,
    "Leading_Current_Reactive_Power_kVarh" AS leading_reactive_kvarh,
    "Lagging_Current_Power_Factor" AS lagging_power_factor,
    "Leading_Current_Power_Factor" AS leading_power_factor,
    Day_of_week,
    Load_Type,
    CAST(strftime('%Y', date) AS integer) AS year,
    CAST(strftime('%m', date) AS integer) AS month,
    CAST(strftime('%d', date) AS integer) AS day,
    CAST(strftime('%H', date) AS integer) AS hour
FROM energy_usage;
