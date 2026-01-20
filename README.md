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
<img width="1122" height="510" alt="KPI_summary" src="https://github.com/user-attachments/assets/47ec12f6-94f1-4c90-bfe5-93f8b619805e" />


### Revenue Leakage Orders
<img width="1145" height="550" alt="Revenue_leakage" src="https://github.com/user-attachments/assets/61a4412a-4b19-469d-a90a-e660e6bc2ba0" />

---

## 🧠 Business Impact

* Prevents underreported revenue due to missing payments
* Ensures audit-safe and trustworthy financial reporting
* Demonstrates how SQL supports business decision-making, not just querying

---

## 🛠️ Tools & Skills Used

* PostgreSQL
* SQL (joins, aggregations)
* Data quality checks
* Business KPI design
* Audit-focused analysis

---

## ✅ Key Learnings

* Real-world data is messy and requires validation
* Raw data should not be tempered
* Cleaning decisions must be documented and auditable
* Business KPIs should be built on validated data
* SQL is a powerful analytical and auditing tool

---

