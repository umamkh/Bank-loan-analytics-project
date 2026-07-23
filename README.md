# 🏦 Bank Loan Analysis

An end-to-end data analytics project analyzing bank loan data to uncover trends in loan amounts, borrower verification status, credit behavior, and repayment patterns — built as part of a Data Analytics Bootcamp Program.

---

## 📌 Project Overview

This project analyzes customer bank loan data to help a lending business understand loan performance, borrower risk profiles, and repayment trends. The analysis was carried out using four different tools — **Excel, MySQL, Tableau, and Power BI** — to demonstrate the same KPIs across multiple platforms.

**Domain:** Finance
**Project:** Bank Loan Analysis of Customers

---

## 🗂️ Dataset

| Detail | Description |
|---|---|
| Files | `Finance_1.csv`, `Finance_2.xlsx` |
| Type | Excel / CSV data |
| Size | ~39,000+ records per file |
| Content | Loan details, borrower demographics, credit history, and repayment/collection data |

**Key columns include:**
- `loan_amnt`, `funded_amnt`, `term`, `int_rate`, `installment`
- `grade`, `sub_grade`, `emp_title`, `emp_length`
- `home_ownership`, `annual_inc`, `verification_status`
- `issue_d`, `loan_status`, `purpose`, `addr_state`, `dti`
- `revol_bal`, `revol_util`, `total_pymnt`, `last_pymnt_d`, `last_pymnt_amnt`

---

## 🎯 KPIs Analyzed

- 📅 Year-wise loan amount statistics
- 🏷️ Grade and sub-grade wise `revol_bal` (revolving balance) analysis
- ✅ Total payment for Verified status vs ❌ Non-Verified status
- 🗺️ State-wise and month-wise loan status trends
- 🏠 Home ownership vs last payment date trends

---

## 🛠️ Tools & Technologies Used

| Tool | Purpose |
|---|---|
| **Excel** | Initial data cleaning, exploration, and KPI calculation using formulas & pivot tables |
| **MySQL** | Structured querying, data validation, and KPI extraction using SQL |
| **Tableau** | Interactive dashboards for state-wise, grade-wise, and status-wise visualizations |
| **Power BI** | Business dashboards for loan performance and borrower insights |

---

## 🧭 Project Workflow / Timeline

| Week | Task |
|---|---|
| Week 1 | Project kick-off meeting |
| Week 2 | Implementation of KPIs using Excel |
| Week 3 | Implementation of KPIs using Tableau / MySQL |
| Week 4 | Implementation of KPIs using Power BI / MySQL |
| Week 5 | Final project presentation |

---

## 📁 Repository Structure

```
bank-loan-analysis/
│
├── data/
│   ├── Finance_1.csv
│   └── Finance_2.xlsx
│
├── excel/
│   └── (Excel workbook with pivot tables & KPI calculations)
│
├── sql/
│   └── (MySQL queries used for KPI extraction)
│
├── tableau/
│   └── (Tableau workbook / .twbx file)
│
├── powerbi/
│   └── (Power BI .pbix file)
│
├── screenshots/
│   ├── excel_dashboard.png
│   ├── tableau_dashboard.png
│   ├── powerbi_dashboard.png
│   └── sql_output.png
│
└── README.md
```

---

## 📊 Dashboard Screenshots

> Screenshots below showcase KPI outputs across each tool used in this project.

**Excel Dashboard**
![Excel Dashboard](screenshots/excel_dashboard.png)

**Tableau Dashboard**
![Tableau Dashboard](screenshots/tableau_dashboard.png)

**Power BI Dashboard**
![Power BI Dashboard](screenshots/powerbi_dashboard.png)

**MySQL Query Output**
![SQL Output](screenshots/sql_output.png)

---

## 🔑 Key Insights

- Loan amounts show a clear upward trend year-over-year, reflecting growing loan demand.
- Verified applicants show different total payment behavior compared to non-verified applicants, useful for assessing risk.
- Certain states and months show higher concentrations of specific loan statuses (Fully Paid / Charged Off / Current).
- Revolving balance varies significantly across loan grades and sub-grades, indicating a link between credit grade and revolving credit usage.
- Home ownership status correlates with patterns in last payment dates, hinting at repayment reliability differences across ownership types.

---

## 🚀 How to Use

1. Clone the repository
   ```bash
   git clone https://github.com/<your-username>/bank-loan-analysis.git
   ```
2. Explore the raw data in the `data/` folder
3. Open the Excel workbook in `excel/` to see formula-based KPI calculations
4. Run the SQL scripts in `sql/` against a MySQL instance to reproduce query-based KPIs
5. Open `.twbx` (Tableau) or `.pbix` (Power BI) files in their respective tools to explore interactive dashboards

---

## 👤 Author

**Umam Khan**
Data Analytics Intern — AI Variant (ExcelR Academy)
Bachelor of Arts, Shri Ram Autar Singh Mahavidyalaya, Fatehpur, UP

---

⭐ If you found this project useful, feel free to star this repository!
