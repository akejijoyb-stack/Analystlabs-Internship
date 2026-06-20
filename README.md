# ANALYSTLAB AFRICA INTERNSHIP
## Overview
This repository project focuses on cleaning raw datasets and performing exploratory data analysis to extract meaningful insights.
# Week 1 & 2 DATA CLEANING AND EXPLORATORY DATA ANALYSIS (EDA)

The goal is to demonstrate skills in:
- Data cleaning
- Data preprocessing
- Exploratory data analysis (EDA)
- Data visualization
- Insight generation

### 1. Online Retail Dataset
A transactional dataset containing sales records from a UK-based online retail store.

### 2. Netflix Movies & TV Shows Dataset
A dataset containing information about movies and TV shows available on Netflix.

## 🛠 Tools & Libraries Used
- Python
- Pandas
- Matplotlib
- Seaborn
- Jupyter Notebook (VS Code)

## 🧹 Data Cleaning Process

### Online Retail Dataset:
- Handled missing values
- Removed duplicate records
- Standardized column names
- Converted date columns to datetime format
- Created a Revenue column (Quantity × UnitPrice)

### Netflix Dataset:
- Filled missing values in key columns
- Removed duplicate records
- Standardized date formats
- Converted date_added to datetime
- Cleaned and structured categorical fields
# TASK 2 
## Exploratory Data Analysis (EDA)

### Online Retail Insights:
- Top-selling products identified
- Revenue by country analysis performed
- Monthly sales trends analyzed
- Customer purchasing behavior explored

### Netflix Insights:
- Movies dominate TV Shows in content distribution
- The United States and India are the top content producers
- Content growth has increased over the years
- Drama is the most common genre category

## ⚠️ Challenges Faced
- File path errors (FileNotFoundError)
- Encoding issues (UnicodeDecodeError)
- Undefined variables (NameError)
- Column mismatch issues (KeyError)
- Date formatting inconsistencies

These were resolved through debugging and proper data preprocessing techniques.

## 📈 Key Learnings
- Importance of data cleaning before analysis
- Handling real-world messy datasets
- Debugging Python errors in Jupyter notebooks
- Building structured EDA workflows
- Creating meaningful data visualizations

## 📂 Project Structure
AnalystLab-Week1-2-EDA-Project/
│
├── notebooks/
│   └── analystlab_week1_2_project.ipynb
│
├── data/
│   ├── online_retail_cleaned.csv
│   ├── netflix_cleaned.csv
│
├── reports/
│   └── Week1_2_Project_Report.pdf
│
├── README.md

## WEEK 3
## SQL ANALYSIS
# Data Analysis Project: E-Commerce Sales & Digital Music Insights
This project evaluates two distinct transactional environments: an enterprise E-Commerce Sales dataset and the relational Chinook Music Store database. The analysis focused on database schema configuration, data optimization, and extracting strategic business insights using SQL Server Management Studio (SSMS). 

## Key Technical Accomplishments
* **Data Type Optimization:** Resolved file-import truncation errors by mapping raw flat-file source configurations to scalable types (e.g., overriding defaults to `nvarchar(250)` for unstructured text inputs like customer details and phone strings).
* **Advanced Analytical Querying:** Developed multi-table `INNER JOIN` operations, aggregate trend tracking, and advanced window functions to partition corporate data cleanly.

---

## 📊 Dataset 1: E-Commerce Sales Analysis
This analysis focuses on operational metrics, transactional volumes, and high-value revenue trends.

### 1. Top Performing Products by Revenue
* **Business Intent:** Identifies which inventory items drive the highest gross revenue to optimize stock levels and manufacturing priority.
* **Key SQL Features:** `SUM()`, `CAST()` for data type safety, `GROUP BY`, `ORDER BY DESC`.

### 2. Historical Revenue Trends (Year-over-Year & Monthly)
* **Business Intent:** Visualizes seasonal demand and tracks macro-level business growth over time. 
* **Key SQL Features:** Multi-column aggregation (`YEAR_ID`, `MONTH_ID`).

### 3. Customer Purchasing Behavior by Deal Size
* **Business Intent:** Determines if profitability relies on high-volume small transactions or low-volume enterprise agreements, directly shaping marketing strategy.
* **Key SQL Features:** Disparate category classification and string grouping.

---

## 🎵 Dataset 2: Chinook Relational Music Store
This analysis evaluates customer engagement and product-line performance across a structured relational schema.

### 1. VIP Customer Spend Tracking
* **Business Intent:** Isolates the top-spending global clients to assist customer relationship management (CRM) teams with loyalty outreach.
* **Key SQL Features:** Two-table `INNER JOIN` on `CustomerId`.

### 2. Genre Popularity & Sales Metrics
* **Business Intent:** Pinpoints which musical categories generate the most sales, identifying core consumer preferences.
* **Key SQL Features:** Complex 3-way `INNER JOIN` connecting `InvoiceLine` ➔ `Track` ➔ `Genre`.

### 3. Advanced Concept: Category Ranking via Window Functions
```sql
WITH RankedTracks AS (
    SELECT 
        m.Name AS MediaType,
        t.Name AS TrackName,
        t.UnitPrice,
        ROW_NUMBER() OVER (PARTITION BY t.MediaTypeId ORDER BY t.UnitPrice DESC) AS PriceRank
    FROM 
        Track t
    INNER JOIN 
        MediaType m ON t.MediaTypeId = m.MediaTypeId
)
SELECT * FROM RankedTracks 
WHERE PriceRank <= 5;

## Technical Explanation:
To demonstrate mastery of window functions, this query utilizes ROW_NUMBER(). Rather than sorting globally, the PARTITION BY t.MediaTypeId clause isolates each media format into its own independent group. The ranking counter resets to 1 for every distinct media type, returning the top 5 most expensive assets per category instead of a flat global filter.

##📈Summary of Business Insights
Seasonality: Sales data shows distinct cyclical spikes during specific monthly blocks, suggesting targeted holiday marketing campaigns are highly effective.

Product Viability: A minority of core products generate a disproportionate share of aggregate sales revenue, highlighting a strong opportunity to cross-sell companion items.

Media Performance: Relational tracking shows that consumer acquisition heavily favors specific audio formats, signaling where infrastructure costs should be focused.
