import os

# Define the README content
readme_content = """# Global Healthcare Investment & Life Expectancy Dynamics (2000–2023)

![Power BI Banner](docs/screenshots/dashboard_overview.png) <!-- 👈 PLACE YOUR FULL DASHBOARD SCREENSHOT HERE -->

## 📌 Project Overview
This project delivers an end-to-end data analytics evaluation of how healthcare expenditure and preventative care interventions influence global population health outcomes across 200+ countries from 2000 through 2023.

By processing data from the **World Bank Development Indicators (WDI)** database, this interactive Power BI dashboard examines the relationships between **Life Expectancy**, **Under-5 Child Mortality**, **Health Expenditure (% of GDP)**, and **Measles Immunization Coverage**.

---

## 📊 Executive Dashboard Summary

| Metric | Value | Baseline Reference / Target |
| :--- | :--- | :--- |
| **Avg Life Expectancy** | **70.5 Years** | Global 23-Year Average |
| **Avg Health Spend % GDP** | **6.2%** | National GDP Share |
| **Avg Annual Under-5 Deaths** | **355K** | Aggregated Headcount |
| **Measles Coverage %** | **85.0%** | **95.0% WHO Herd Immunity Target** |

---

## 📸 Dashboard Screenshots

### 1. Executive Banner & Core Dashboard Layout
> *Place your main Power BI canvas screenshot showing all four KPI cards and charts here.*

![Full Dashboard Overview](docs/screenshots/dashboard_overview.png) 
<!-- 👈 PLACE SCREENSHOT OF YOUR FULL DASHBOARD CANVAS HERE -->

---

### 2. Analytical Deep Dives

| Health Spend vs. Life Expectancy | Life Expectancy Trend (2000–2023) |
| :---: | :---: |
| ![Scatter Plot](docs/screenshots/scatter_plot.png) | ![Trend Chart](docs/screenshots/trend_chart.png) |
| *Evaluates spending efficiency across income groups.* | *Tracks longevity progress and pandemic rebound.* |

| Top & Bottom Countries (Measles Coverage) | Regional Immunization vs Child Mortality |
| :---: | :---: |
| ![Bar Chart](docs/screenshots/bar_chart.png) | ![Dual Axis Chart](docs/screenshots/dual_axis_chart.png) |
| *Highlights highest and lowest performing territories.* | *Compares coverage against the 95% WHO Target line.* |

---

## 💡 Key Findings

1. **Preventative Care Drives Survival:** Regions achieving or exceeding the **95% WHO Measles Target** (e.g., Europe & North America) maintain near-zero under-5 mortality. Sub-Saharan Africa and South Asia bear the largest share of child mortality due to immunization coverage deficits.
2. **Spending Efficiency Varies:** Higher health expenditure (% of GDP) generally correlates with longer life expectancy, but several lower-middle-income nations achieve high longevity (>72 years) on modest budgets (<6% of GDP).
3. **Resilience & Recovery:** Life expectancy trend lines show steady upward growth from 2000 to 2019, followed by a visible pandemic dip in 2020 and a rapid recovery through 2023.

---

## 🛠️ Data Architecture & DAX Measures Reference

All core metrics were constructed in Power BI using custom DAX measures to ensure proper aggregation across aggregated multi-year country records:

```dax
// 1. Average Life Expectancy
Avg Life Expectancy = 
CALCULATE(
    AVERAGE('WDI_Healthcare_Cleaned'[Value]), 
    'WDI_Healthcare_Cleaned'[Indicator Code] = "SP.DYN.LE00.IN"
)

// 2. Average Health Spend % GDP (Divided by 100 for true percentage scaling)
Avg Health Spend % GDP = 
DIVIDE(
    CALCULATE(
        AVERAGE('WDI_Healthcare_Cleaned'[Value]), 
        REMOVEFILTERS('WDI_Healthcare_Cleaned'[Indicator Code]),
        'WDI_Healthcare_Cleaned'[Indicator Code] = "SH.XPD.CHEX.GD.ZS"
    ),
    100
)

// 3. Average Annual Under-5 Child Deaths
Avg Annual Under 5 Deaths = 
CALCULATE(
    AVERAGE('WDI_Healthcare_Cleaned'[Value]), 
    'WDI_Healthcare_Cleaned'[Indicator Code] = "SH.DTH.MORT"
)

// 4. Measles Immunization Coverage %
Measles Coverage % = 
DIVIDE(
    CALCULATE(
        AVERAGE('WDI_Healthcare_Cleaned'[Value]), 
        REMOVEFILTERS('WDI_Healthcare_Cleaned'[Indicator Code]),
        'WDI_Healthcare_Cleaned'[Indicator Code] = "SH.IMM.MEAS"
    ),
    100
)