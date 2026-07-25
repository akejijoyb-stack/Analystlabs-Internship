# Global Healthcare Investment & Life Expectancy Dynamics (2000–2023)

## Project Overview
This project delivers an end-to-end data analytics evaluation of how healthcare expenditure and preventative care interventions influence global population health outcomes across 200+ countries from 2000 through 2023.

By processing data from the **World Bank Development Indicators (WDI)** database, this interactive Power BI dashboard examines the relationships between **Life Expectancy**, **Under-5 Child Mortality**, **Health Expenditure (% of GDP)**, and **Measles Immunization Coverage**.

---

## Executive Dashboard Summary

| Metric | Value | Baseline Reference / Target |
| :--- | :--- | :--- |
| **Avg Life Expectancy** | **70.5 Years** | Global 23-Year Average |
| **Avg Health Spend % GDP** | **6.2%** | National GDP Share |
| **Avg Annual Under-5 Deaths** | **355K** | Aggregated Headcount |
| **Measles Coverage %** | **85.0%** | **95.0% WHO Herd Immunity Target** |

---

## Dashboard Screenshots

### 1. Executive Banner & Core Dashboard Layout

<img width="774" height="442" alt="Global Health   Life Expectancy" src="https://github.com/user-attachments/assets/3f47abcf-a797-4f34-966a-8129949448e1" />
 

---


### 2. Analytical Deep Dives

| Health Spend vs. Life Expectancy | Life Expectancy Trend (2000–2023) |
| :---: | :---: |
| (<img width="318" height="214" alt="Health_Spend_vs_Life_Expectancy" src="https://github.com/user-attachments/assets/e99e9394-4fa2-4460-9926-015354cf41ed" />)
)| ![Trend Chart](<img width="402" height="218" alt="Life_Expectancy_Trend_overtime" src="https://github.com/user-attachments/assets/a1775774-c671-41d4-ad5f-79b01a7899cf" />) |
| *Evaluates spending efficiency across income groups.* | *Tracks longevity progress and pandemic rebound.* |

| Top & Bottom Countries (Measles Coverage) | Regional Immunization vs Child Mortality |
| :---: | :---: |
| (<img width="315" height="208" alt="Top_10_and_Bottom_10 Countries_by_Measles_Coverage" src="https://github.com/user-attachments/assets/b2ee9c43-868e-4ae6-b295-0e226dfc3b91" />) (<img width="406" height="210" alt="Measles_Coverage_vs_Avg_Annual_Under_5_Death" src="https://github.com/user-attachments/assets/dc6a361b-3f4e-4e3c-bb7f-470975b20979" />) |
| *Highlights highest and lowest performing territories.* | *Compares coverage against the 95% WHO Target line.* |

---
---

## Key Findings

1. **Preventative Care Drives Survival:** Regions achieving or exceeding the **95% WHO Measles Target** (e.g., Europe & North America) maintain near-zero under-5 mortality. Sub-Saharan Africa and South Asia bear the largest share of child mortality due to immunization coverage deficits.
2. **Spending Efficiency Varies:** Higher health expenditure (% of GDP) generally correlates with longer life expectancy, but several lower-middle-income nations achieve high longevity (>72 years) on modest budgets (<6% of GDP).
3. **Resilience & Recovery:** Life expectancy trend lines show steady upward growth from 2000 to 2019, followed by a visible pandemic dip in 2020 and a rapid recovery through 2023.

---

## Data Architecture & DAX Measures Reference

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
