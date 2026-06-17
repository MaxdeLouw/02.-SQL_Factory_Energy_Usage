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
    strftime('%Y', date) AS year,
    strftime('%m', date) AS month,
    strftime('%d', date) AS day,
    strftime('%H', date) AS hour
FROM energy_usage;
