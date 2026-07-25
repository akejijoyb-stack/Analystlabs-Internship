## Global Healthcare Investment & Life Expectancy Dynamics (2000–2023)

Capstone Project — AnalystLab Africa Data Analytics Internship Program (Batch B)
An end-to-end data analytics project exploring global healthcare expenditure, preventative care interventions, and population health outcomes using the World Bank's World Development Indicators (WDI) dataset — from raw data cleaning through exploratory analysis to an interactive Power BI dashboard.

## Project Objective
To analyze how global healthcare spending and preventative care (measles immunization) influence child mortality and life expectancy between 2000 and 2023, evaluate regional health disparities, and assess spending efficiency across different income tiers.

## Executive Dashboard Summary

| Metric | Value | Baseline Reference / Target |
| :--- | :--- | :--- |
| **Avg Life Expectancy** | **70.5 Years** | Global 23-Year Average |
| **Avg Health Spend % GDP** | **6.2%** | National GDP Share |
| **Avg Annual Under-5 Deaths** | **355K** | Aggregated Headcount |
| **Measles Coverage %** | **85.0%** | **95.0% WHO Herd Immunity Target** |

---

## Dataset
Source: World Bank World Development Indicators (WDI)
Indicators selected (4 core healthcare indicators):
* Life expectancy at birth, total (years) [SP.DYN.LE00.IN]
* Current health expenditure (% of GDP) [SH.XPD.CHEX.GD.ZS]
* Mortality rate, under-5 (number of deaths) [SH.DTH.MORT]
* Immunization, measles (% of children ages 12-23 months) [SH.IMM.MEAS]

Scope after cleaning: 200+ countries and regional aggregates across 2000–2023.

---

## Data Cleaning Summary

| Issue Found | Action Taken |
| :--- | :--- |
| **Missing values in early years** | Left as NaN; scoped analysis timeframe to 2000–2023. |
| **Duplicate records** | Verified on Country Code + Indicator Code + Year; zero duplicates found. |
| **Aggregate regions mixed with countries** | Filtered individual country records and maintained regional/income aggregates for macro comparisons. |
| **Scale mismatch on percentages** | Handled scale formatting in DAX (`/100`) so Power BI displays `85.0%` for measles coverage and `6.2%` for health spend. |
| **Under-5 mortality metric structure** | Classified metric as aggregated annual headcount (`355K Avg Annual Under-5 Deaths`) rather than a ratio to maintain statistical accuracy. |

---

## Key Insights
* **Global Life Expectancy & Spend Baseline:** Between 2000 and 2023, average global life expectancy reached **70.5 years**, supported by an average national health spend of **6.2% of GDP**.
* **Immunization Target Gap:** Global measles immunization coverage averages **85.0%**—falling 10.0% short of the **95% WHO Herd Immunity Target**—contributing to an average of **355,000 under-5 child deaths** annually across analyzed regions.
* **Preventative Care ROI:** High-performing regions meeting the 95% immunization threshold (Europe & Central Asia, North America) report minimal child mortality, whereas lagging regions (Sub-Saharan Africa, South Asia) bear the largest burden of child deaths.
* **Expenditure Efficiency:** Scatter plot analysis shows diminishing returns on expenditure above 8–10% of GDP. Several middle-income nations achieve strong longevity (>72 years) on modest expenditure budgets (<6% of GDP).
* **Pandemic Impact & Recovery:** Life expectancy trend lines show steady progress from 2000 to 2019, followed by a visible pandemic-related drop in 2020 and a steady recovery through 2023.

---

## Dashboard

An interactive single-page Power BI dashboard including:
* **4 KPI Cards:** Avg Life Expectancy (70.5), Avg Annual Under-5 Deaths (355K), Avg Health Spend % GDP (6.2%), and Measles Coverage % (85.0% vs 0.95 WHO Target)
* **Health Spend % GDP vs Life Expectancy:** Scatter plot evaluating spending efficiency across income groups
* **Life Expectancy Trend over Time:** Line chart tracking longevity progress from 2000 to 2023
* **Top and Bottom 10 Countries by Measles Coverage:** Bar chart highlighting highest and lowest performing countries
* **Measles Coverage % and Avg Annual Under-5 Deaths by Region:** Dual-axis chart with a constant reference line for the 95% WHO Target
* **Income Group, Year, and Region Slicers**

---

## Dashboard Screenshots & Analytical Deep Dives

### 1. Executive Banner & Core Dashboard Layout
<img width="774" height="442" alt="Dashboard_Overview" src="https://github.com/user-attachments/assets/85dd0594-a312-4065-ba61-e0aa20f7aaa1" />

### 2. Analytical Deep Dives

| Health Spend vs. Life Expectancy | Life Expectancy Trend (2000–2023) |
| :---: | :---: |
| <img width="318" height="214" alt="Health_Spend_vs_Life_Expectancy" src="https://github.com/user-attachments/assets/df4d1129-bf02-48ed-9564-f0f6f480d3f9" /> | <img width="402" height="218" alt="Life_Expectancy_Trend_overtime" src="https://github.com/user-attachments/assets/8f641721-188b-414f-80ba-707b0e0cdf18" /> |
| *Evaluates spending efficiency across income groups.* | *Tracks longevity progress and pandemic rebound.* |

| Top & Bottom Countries (Measles Coverage) | Regional Immunization vs Child Mortality |
| :---: | :---: |
| <img width="315" height="208" alt="Top_10_and_Bottom_10 Countries_by_Measles_Coverage" src="https://github.com/user-attachments/assets/c328074a-506c-45ad-9efc-fdccdfe1049a" /> | <img width="406" height="210" alt="Measles_Coverage_vs_Avg_Annual_Under_5_Death" src="https://github.com/user-attachments/assets/31441789-60f3-4e34-bc3d-16bea08ad73b" /> |
| *Highlights highest and lowest performing territories.* | *Compares coverage against the 95% WHO Target line.* |

---

## Tools Used
* **Python (Jupyter Notebook):** pandas for cleaning, reshaping, and exploratory data analysis
* **Power BI Desktop:** interactive dashboard, DAX measures, KPI cards, custom visual analytics
* **Data Source:** World Bank WDI bulk download dataset

---

## How to Reproduce
1. Download the World Bank WDI dataset CSV files.
2. Place the cleaned dataset in the `data/` folder.
3. Open `Global_Healthcare_and_Life_Expectancy.pbix` in Power BI Desktop to explore the interactive dashboard.

---

## Author
Joy — AnalystLab Africa Data Analytics Internship Program — Batch B (June–August 2026)
#AnalystLabAfrica #DataAnalytics #PowerBI #Python
"""
