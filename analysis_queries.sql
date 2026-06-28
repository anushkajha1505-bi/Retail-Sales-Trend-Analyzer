-- ============================================
-- File: top_products_by_region.sql
-- Description: Revenue and profit by product sub-category per region
-- ============================================

SELECT 
    Region,
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Discount) * 100, 1) AS Avg_Discount_Pct,
    COUNT(*) AS Order_Count
FROM sales
GROUP BY Region, "Sub-Category"
ORDER BY Region, Total_Revenue DESC;


-- ============================================
-- File: monthly_revenue_breakdown.sql
-- Description: Monthly and quarterly revenue rollup
-- ============================================

SELECT 
    strftime('%Y', "Order Date") AS Year,
    strftime('%m', "Order Date") AS Month,
    CASE 
        WHEN CAST(strftime('%m', "Order Date") AS INTEGER) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN CAST(strftime('%m', "Order Date") AS INTEGER) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN CAST(strftime('%m', "Order Date") AS INTEGER) BETWEEN 7 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END AS Quarter,
    ROUND(SUM(Sales), 2) AS Monthly_Revenue,
    ROUND(SUM(Profit), 2) AS Monthly_Profit,
    COUNT(DISTINCT "Order ID") AS Orders
FROM sales
GROUP BY Year, Month
ORDER BY Year, Month;


-- ============================================
-- File: discount_impact_analysis.sql
-- Description: Analyze how discount levels affect profit margin
-- ============================================

SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.1 THEN 'Low (1-10%)'
        WHEN Discount <= 0.2 THEN 'Medium (11-20%)'
        WHEN Discount <= 0.3 THEN 'High (21-30%)'
        ELSE 'Very High (>30%)'
    END AS Discount_Bucket,
    COUNT(*) AS Transactions,
    ROUND(AVG(Sales), 2) AS Avg_Sale_Value,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct
FROM sales
GROUP BY Discount_Bucket
ORDER BY Profit_Margin_Pct DESC;
