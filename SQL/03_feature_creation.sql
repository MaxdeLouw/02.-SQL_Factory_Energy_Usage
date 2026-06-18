-- Emissions per kWh
ALTER TABLE energy_usage_clean
ADD COLUMN co2_per_kwh REAL;

UPDATE energy_usage_clean
SET co2_per_kwh = co2_kg / Usage_kWh * 100
WHERE "Usage_kWh" != 0;


--Reactive power per kWh (%)
ALTER TABLE energy_usage_clean
ADD COLUMN reactive_power_percent REAL;

UPDATE energy_usage_clean
SET reactive_power_percent = (lagging_reactive_kvarh + leading_reactive_kvarh) / usage_kwh * 100
WHERE "usage_kwh" != 0;

--Use hour blocks next to hours for more effective visuals
ALTER TABLE energy_usage_clean
ADD COLUMN time_block text;

UPDATE energy_usage_clean
SET time_block=
    CASE
        WHEN hour BETWEEN 00 AND 02 THEN '00-03'
        WHEN hour BETWEEN 03 AND 05 THEN '03–06'
        WHEN hour BETWEEN 06 AND 08 THEN '06–09'
        WHEN hour BETWEEN 09 AND 11 THEN '09–12'
        WHEN hour BETWEEN 12 AND 14 THEN '12–15'
        WHEN hour BETWEEN 15 AND 17 THEN '15–18'
        WHEN hour BETWEEN 18 AND 20 THEN '18–21'
        ELSE '21–24'
    END;