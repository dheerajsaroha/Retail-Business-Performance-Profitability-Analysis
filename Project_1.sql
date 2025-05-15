create database project_1;
use project_1;

-- Select only complete records (no NULLs in key fields)
SELECT *
FROM retail_sample_data
WHERE Category IS NOT NULL
  AND Sub_Category IS NOT NULL
  AND Total_Sales IS NOT NULL
  AND Profit IS NOT NULL
  AND Quantity_Sold IS NOT NULL
  AND Cost_per_Unit IS NOT NULL;


-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

-- Now run your DELETE command
DELETE FROM retail_sample_data
WHERE Category IS NULL
   OR Sub_Category IS NULL
   OR Total_Sales IS NULL
   OR Profit IS NULL
   OR Quantity_Sold IS NULL
   OR Cost_per_Unit IS NULL;

-- (Optional) Re-enable safe updates for safety
SET SQL_SAFE_UPDATES = 1;

   
   
   SELECT
    Category,
    Sub_Category,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Total_Sales), 0) * 100, 2) AS Profit_Margin_Percentage
FROM retail_sample_data
GROUP BY Category, Sub_Category
ORDER BY Profit_Margin_Percentage DESC;


SELECT
    Region,
    Category,
    Sub_Category,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Total_Sales), 0) * 100, 2) AS Profit_Margin_Percentage
FROM retail_sample_data
GROUP BY Region, Category, Sub_Category;



