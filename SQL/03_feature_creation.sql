-- Emissions per kWh
--ALTER TABLE energy_usage_clean
--ADD COLUMN co2_per_kwh REAL;

UPDATE energy_usage_clean
SET co2_per_kwh = co2_kg / Usage_kWh * 100
WHERE "Usage_kWh" != 0;


--Reactive power per kWh (%)
--ALTER TABLE energy_usage_clean
--ADD COLUMN reactive_power_percent REAL;

UPDATE energy_usage_clean
SET reactive_power_percent = (lagging_reactive_kvarh + leading_reactive_kvarh) / usage_kwh * 100
WHERE "usage_kwh" != 0;
