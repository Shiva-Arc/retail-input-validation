# 🧪 Retail Input Validation Project

This beginner-friendly project demonstrates how to build a lightweight data validation pipeline using **Python, SQL, and SQLite**.

The goal is to simulate how raw retail or transactional data can be checked for:
- Missing values
- Duplicate records
- Price outliers

---

## 📌 Project Goals

- Practice real-world data validation techniques
- Learn how Python and SQL can work together in a data quality workflow
- Build a portfolio-ready data pipeline project

---

## 🗂️ Project Structure

```bash
retail-input-validation/
│
├── data/
│   └── raw_sales.csv          # Sample data file
│
├── sql/
│   ├── schema.sql             # (Optional) Table creation script
│   └── validation_queries.sql # SQL-based validation checks
│
├── src/
│   ├── extract_load.py        # Loads CSV into SQLite
│   ├── validate.py            # Executes SQL-based validations
│   └── report.py              # Summarizes validation results in Python
│
├── requirements.txt           # Python dependencies
└── README.md
