# Nigeria States Real-Time Weather ETL Pipeline

## Project Overview
This project is an automated ETL (Extract, Transform, Load) pipeline built as part of the **AnalystLab Africa Data Analytics Internship Program**. The pipeline connects to the OpenWeather API, extracts live meteorological data for 16 selected Nigerian states, cleans and structures the data using Python and Pandas, and loads it into a CSV file for analytical reporting.

## Data Source
- **Source:** [OpenWeatherMap API](https://openweathermap.org/)
- **Geographic Scope:** 16 Nigerian States (Lagos, Kaduna, Abuja, Maiduguri, Kano, Enugu, Plateau, Yobe, Benue, Ondo, Ogun, Edo, Anambra, Bauchi, Delta, Oyo)
- **Key Metrics Collected:** State Name, Country, Temperature (°C), Humidity (%), Weather Condition, Wind Speed (m/s), and Timestamp.

## Tools Used
- **Language:** Python 3
- **Libraries:** Pandas (Data Manipulation), Requests (API Connection), Datetime (Timestamp formatting)
- **IDE:** VS Code / Jupyter Notebook

## ETL Process Steps
1. **Extract:** Python queries the OpenWeather API endpoints using a verified API key to fetch real-time JSON payloads for all 16 states.
2. **Transform:** Raw JSON data is parsed. The nested wind speed, temperatures, humidity, and weather conditions are mapped into a structured Pandas DataFrame. UNIX timestamps are converted to local readable datetime formats.
3. **Load:** The clean, structured DataFrame is written and stored locally as a CSV file (`cleaned_weather_data.csv`).

## Key Findings (Task 4 Analysis)
Based on the data extracted on July 17, 2026:
* **Temperature Comparison:** **Maiduguri** recorded the highest temperature at **28.41°C**, while **Oyo** was the coolest state at **21.83°C**.
* **Humidity Levels:** **Edo** recorded the highest humidity level at **98%**, while **Plateau** had the lowest at **47%**.
* **Wind & Weather Conditions:** All 16 states experienced cloudy conditions. **Maiduguri** observed the strongest winds at **5.86 m/s**, and **Benue** had the calmest air at **0.46 m/s**.

---
*Developed by Joy - AnalystLab Africa Batch B Intern*