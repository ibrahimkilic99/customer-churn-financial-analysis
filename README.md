# customer-churn-financial-analysis
# Customer Churn Financial Impact Analysis

## Project Overview

This project analyzes customer churn patterns in a telecommunications company to identify financial impact and provide actionable retention strategies. Using SQL, Python, and Tableau, I discovered that **month-to-month contract customers account for 88.6% of all churn**, resulting in **$1.45M annual revenue loss**.

## Key Findings

- **Total Churn Rate:** 26.5% (1,869 out of 7,043 customers)
- **Annual Revenue Loss:** $1,669,570
- **Highest Risk Segment:** Month-to-month contracts (42.7% churn rate)
- **Financial Impact:** Month-to-month contracts responsible for $1.45M annual loss

## Business Recommendation

**Action Plan:** Target 500 month-to-month customers for migration to 1-year contracts

**Expected Impact:**
- Churn rate reduction: 31.4%
- Potential annual savings: **$124,253**
- Implementation: 3-month pilot program with 15-20% discount incentive

## Tools & Technologies

- **Python:** Pandas, NumPy, Matplotlib, Seaborn, Plotly
- **SQL:** SQLite for data querying and cohort analysis
- **Tableau:** Interactive dashboard for stakeholder presentation
- **Jupyter Notebook:** Exploratory data analysis and visualization

##  Project Structure
├── customer_churn_financial_analysis.ipynb  # Main analysis notebook
├── sql_queries.sql                          # SQL queries for analysis
├── telco_churn.db                          # SQLite database
├── dashboard_summary.csv                   # KPI data for dashboard
├── dashboard_contract.csv                  # Contract analysis data
├── dashboard_revenue.csv                   # Revenue loss data
└── README.md                               # Project documentation

## Dashboard Preview

https://public.tableau.com/app/profile/ibrahim.kilic/viz/CustomerChurnFinancialAnalysis/Dashboard1?publish=yes

## Analysis Highlights

### 1. Contract Type Analysis
- Month-to-month: 42.7% churn rate
- One year: 11.3% churn rate
- Two year: 2.8% churn rate

### 2. Tenure Impact
- Churned customers average tenure: ~18 months
- Retained customers average tenure: ~38 months
- First 12 months = highest risk period

### 3. Revenue Impact by Contract
- Month-to-month: $1,450,165 annual loss
- One year: $169,421 annual loss
- Two year: $49,984 annual loss

## How to Run

1. Clone the repository:
```bash
git clone https://github.com/ibrahimkilic/customer-churn-financial-analysis.git
cd customer-churn-financial-analysis
```

2. Install required packages:
```bash
pip install pandas numpy matplotlib seaborn jupyter plotly sqlalchemy
```

3. Open Jupyter Notebook:
```bash
jupyter notebook customer_churn_financial_analysis.ipynb
```

## Key SQL Queries

**Churn Rate by Contract Type:**
```sql
SELECT 
    Contract,
    COUNT(*) as total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;
```

## Contact

**Ibrahim Kilic**
- LinkedIn: https://www.linkedin.com/in/ibrahim-kilic01/
- Email: ibrahimkilicit@gmail.com
- Portfolio: 

---

*Dataset: Telco Customer Churn (Kaggle)*
