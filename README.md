# AnalystLab Africa Internship – Week 1 & 2 Project

## 📊 Project Title
Data Cleaning & Exploratory Data Analysis (EDA)

## 📌 Overview
This project is part of the AnalystLab Africa Internship Program. It focuses on cleaning raw datasets and performing exploratory data analysis to extract meaningful insights.

The goal is to demonstrate skills in:
- Data cleaning
- Data preprocessing
- Exploratory data analysis (EDA)
- Data visualization
- Insight generation

## 📁 Datasets Used

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

## 📊 Exploratory Data Analysis (EDA)

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
├── images/
│   └── (your charts/screenshots if you want)
│
├── README.md
