# 📊 Data Warehouse Analytics

An exploratory and advanced business analysis project built on a **SQL Server data warehouse**, using SQL to transform structured sales data into meaningful business insights.

---

## 🔎 Project Overview

This project explores customer, product, and sales data using a **Gold-layer analytical model** consisting of dimension and fact tables.

The analysis progresses from basic data exploration to advanced techniques such as ranking, trend analysis, cumulative analysis, performance comparison, part-to-whole analysis, and customer segmentation.

### Data Model

```text
              ┌──────────────────┐
              │  dim_customers   │
              └────────┬─────────┘
                       │
                       │
                ┌──────▼──────┐
                │  fact_sales │
                └──────┬──────┘
                       │
                       │
              ┌────────▼─────────┐
              │   dim_products   │
              └──────────────────┘
```

---

## 📈 Analysis Covered

### Exploratory Analysis

* Database and table exploration
* Dimension exploration
* Date range analysis
* Key business measures
* Customer, product, and category analysis

### Advanced Analysis

* **Magnitude Analysis** — comparing measures across categories
* **Ranking Analysis** — identifying top and bottom performing products
* **Change Over Time** — analyzing yearly and monthly trends
* **Cumulative Analysis** — running totals and moving averages
* **Performance Analysis** — comparing current performance with averages and previous years
* **Part-to-Whole Analysis** — measuring category contribution to overall sales
* **Data Segmentation** — grouping products and customers into meaningful segments

---

## 📊 Reports

### Customer Report

Analyzes customer purchasing behavior, spending, lifespan, and segmentation into:

* VIP
* Regular
* New

### Product Report

Analyzes product performance across revenue, sales, categories, rankings, costs, and year-over-year performance.

---

## 🛠️ Tools & Technologies

* **SQL Server**
* **SQL / T-SQL**
* **SQL Server Management Studio (SSMS)**
* **Git & GitHub**
* **CSV**

---

## 📁 Project Structure

```text
data-warehouse-analytics/
│
├── datasets/
│   └── csv-files/
│
├── scripts/
│   ├── 00_init_database.sql
│   ├── 01_database_exploration.sql
│   ├── 02_dimension_exploration.sql
│   ├── 03_date_exploration.sql
│   ├── 04_measures_exploration.sql
│   ├── 05_magnitude_analysis.sql
│   ├── 06_ranking_analysis.sql
│   ├── 07_change_over_time.sql
│   ├── 08_cumulative_analysis.sql
│   ├── 09_performance_analysis.sql
│   ├── 10_part_to_whole_analysis.sql
│   └── 11_data_segmentation.sql
│
├── reports/
│   ├── customer_report.sql
│   └── products_report.sql
│
└── README.md
```

---

## 🎯 Project Goal

The goal of this project is to demonstrate how SQL can be used to explore a data warehouse, analyze business performance, identify patterns, and generate actionable insights from customer, product, and sales data.

**Focus:** Data Warehouse • Exploratory Analysis • Advanced SQL • Business Analytics
