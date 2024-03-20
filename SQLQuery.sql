-- Set the database context to the "PROJECT" database
USE PROJECT;

-- View all data in the Employee_Salaries table
SELECT * FROM [PROJECT].[dbo].[Employee_Salaries];

-- Create a common table expression (CTE) to calculate department statistics
WITH Department_Stats AS (
 -- Select department, standard deviation, and average salary for each department
 SELECT
   Department,
   STDEV(Salary) AS Standard_Deviation,
   AVG(Salary) AS Average
 FROM
   [dbo].[Employee_Salaries]
 WHERE
   Salary >= 10000  -- Filter for salaries above 10,000
 GROUP BY
   Department
),
-- Create another CTE to identify outlier salaries within each department
DepartmentOutliers AS (
 SELECT
   emp.Department,
   emp.Salary,
   dt.Standard_Deviation,
   dt.Average,
   (emp.Salary - dt.Average) / dt.Standard_Deviation AS Z_score  -- Calculate Z-score
 FROM
   [dbo].[Employee_Salaries] emp
 JOIN
   Department_Stats dt ON emp.Department = dt.Department
 WHERE
   Salary >= 10000  -- Filter for salaries above 10,000
)
-- Retrieve final results, combining statistics and outlier counts
SELECT
 dt.Department,
 ROUND(dt.Standard_Deviation, 2) AS Standard_Deviation,
 ROUND(dt.Average, 2) AS Salary_Average,  -- Rename average for clarity
 ROUND(dt.Standard_Deviation / dt.Average, 2) * 100 AS Coefficient_of_Variation,
 SUM(CASE WHEN (do.Z_score > 1.96 OR do.Z_score < -1.96) THEN 1 ELSE 0 END) AS Outlier_Count
FROM
 Department_Stats dt
LEFT JOIN
 DepartmentOutliers do ON dt.Department = do.Department
GROUP BY
 dt.Department,
 dt.Standard_Deviation,
 dt.Average
ORDER BY
 Coefficient_of_Variation DESC;  -- Order by descending coefficient of variation
