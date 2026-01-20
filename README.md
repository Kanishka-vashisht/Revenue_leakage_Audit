# Revenue Leakage Audit using PostgreSQL

## 📌 Project Overview

This project simulates a real-world **revenue leakage audit** performed by an aspiring data analyst on messy e-commerce transactional data.

The goal was to validate data quality, identify inconsistencies across related tables, and quantify potential revenue leakage using **pure SQL (PostgreSQL)**.

The project follows an industry-style workflow:
Raw data → Validation → Fixes → Business KPIs

---

## 🗂️ Dataset Description

The dataset contains transactional e-commerce data including:

* Orders
* Order items
* Payments
* Products
* Customers

The data intentionally contains inconsistencies such as missing values and broken relationships to mimic real business scenarios.

---

## 🔍 Key Analysis Steps

### 1. Raw Data Ingestion

* Imported CSV files into **raw tables**
* No constraints applied initially to preserve original data

### 2. Data Quality Checks

* Null value analysis across all tables
* Referential integrity validation between related tables
* Identified one order without a corresponding payment record

### 3. Data Fixes

* Handled missing product categories using business-safe defaults
* Inserted a placeholder record for the unpaid order to preserve audit traceability

### 4. Revenue Leakage Identification

* Flagged delivered orders with zero or missing payments
* Created a dedicated leakage table for audit transparency

### 5. Business KPI Enhancement

* Built a KPI summary table including:

  * Total orders
  * Delivered orders
  * Total revenue
  * Average order value
  * Leakage count
  * Leakage percentage

---

## 📊 Key Outputs

### KPI Summary

<img
### Revenue Leakage Orders

![Revenue Leakage](screenshots/revenue_leakage.png)

---

## 🧠 Business Impact

* Prevents underreported revenue due to missing payments
* Ensures audit-safe and trustworthy financial reporting
* Demonstrates how SQL supports business decision-making, not just querying

---

## 🛠️ Tools & Skills Used

* PostgreSQL
* SQL (joins, CTEs, aggregations, CASE logic)
* Data quality checks
* Business KPI design
* Audit-focused analysis

---

## 📎 Project Structure

```
Revenue-Leakage-Audit-PostgreSQL
│
├── sql/
│   ├── raw_table_creation.sql
│   ├── data_validation.sql
│   ├── referential_integrity_checks.sql
│   ├── data_fixes.sql
│   ├── revenue_leakage_detection.sql
│   └── enhancement_1_kpi_summary.sql
│
├── screenshots/
│   ├── kpi_summary.png
│   └── revenue_leakage.png
│
└── README.md
```

---

## ✅ Key Learnings

* Real-world data is messy and requires validation
* Cleaning decisions must be documented and auditable
* Business KPIs should be built on validated data
* SQL is a powerful analytical and auditing tool

---

## 📌 Note

This project focuses on **SQL-based analysis only**.
Visualization tools were intentionally not used to emphasize data quality, logic, and business reasoning.

