
-- Query 1: Overall Churn Rate
SELECT 
    Churn,
    COUNT(*) as customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) as percentage
FROM customers
GROUP BY Churn;

-- Query 2: Churn Rate by Contract Type
SELECT 
    Contract,
    COUNT(*) as total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Query 3: Revenue Loss by Contract Type
SELECT 
    Contract,
    COUNT(*) as churned_customers,
    ROUND(SUM(MonthlyCharges), 2) as monthly_revenue_loss,
    ROUND(SUM(MonthlyCharges) * 12, 2) as annual_revenue_loss
FROM customers
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY annual_revenue_loss DESC;

-- Query 4: High-Risk Customers
SELECT 
    customerID,
    Contract,
    tenure,
    MonthlyCharges
FROM customers
WHERE Churn = 'No'
    AND Contract = 'Month-to-month'
    AND tenure < 12
    AND MonthlyCharges > 70
ORDER BY MonthlyCharges DESC;
