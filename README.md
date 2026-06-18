# 02.-SQL_Factory_Energy_Usage

Project overview

This project analyzes the energy consumption of a steel manufacturing facility during 2018.

The dataset contains measurements recorded every 15 minutes, including active energy consumption, reactive energy, power factor, CO₂ emissions, load type and time-related information.

The main focus of the project was to use SQL for data preparation and analysis before presenting the main findings in an interactive Power BI dashboard.

Project goals

The analysis was built around the following questions:

- How does energy consumption change throughout the year?
- During which days and time periods is energy demand highest?
- How is energy consumption distributed across different load types?
- How does the plant's power factor change over time?
- How closely are CO₂ emissions related to energy consumption?
- During which operating periods does electrical efficiency appear to decrease?


Tools used
Python
Pandas
SQLite
SQL
Power BI
Visual Studio Code
DAX

The dataset contains 35,040 observations recorded at 15-minute intervals throughout 2018.

The main variables include:

- Energy usage in kWh
- Lagging reactive energy in kVArh
- Leading reactive energy in kVArh
- Lagging power factor
- Leading power factor
- CO₂ emissions
- Day of the week
- Time of day
- Operating load type


Workflow
1. Imported the raw dataset using Pandas.
2. Converted the date column into a consistent datetime format.
3. Loaded the data into a SQLite database.
4. Used SQL to inspect and clean the dataset.
5. Created additional time-related features such as hour, month and time block.
6. Calculated additional metrics for CO₂ intensity and reactive energy.
7. Used SQL to analyze energy consumption by month, weekday, hour and load type.
7. Exported the cleaned table for use in Power BI.
8. Built an interactive dashboard to present the main findings.

Key findings
The facility consumed approximately 959.64 MWh of energy during the recorded period.
Total CO₂ emissions were approximately 403.81 tonnes.
The overall CO₂ intensity was approximately 0.42 kg CO₂ per kWh.
Average lagging power factor was approximately 80.6%.
Energy consumption is highest during weekday operating hours, especially between 09:00 and 18:00.
Thursday has the highest average daytime energy consumption, while Sunday has the lowest.
Maximum-load periods account for the largest share of total energy use.
Energy demand drops considerably during weekends and overnight periods.
Lagging power factor generally improves during the main operating hours and decreases during lower-demand periods.
Leading reactive energy becomes more noticeable during certain low-load and transitional periods, which may indicate capacitive overcompensation.
Dashboard

The dashboard contains:

Total energy consumption
Total CO₂ emissions
Average lagging power factor
CO₂ intensity
Monthly energy consumption and power factor
A day-and-time energy consumption heatmap
Energy consumption by load type

The visuals are interactive and can be used to filter the rest of the dashboard.

Repository structure
factory-energy-analysis/
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
├── sql/
├── images/
├── README.md
├── requirements.txt
└── .gitignore


Data source

Steel Industry Energy Consumption Dataset, available through the UCI Machine Learning Repository.