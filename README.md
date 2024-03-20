## Project: Analyzing Departmental Salary Disparities

**Context:** As a data analyst intern, I tackled the challenge of analyzing salary disparities within departments for a company.

**Objective:** To identify departments with a high variation in employee salaries, potentially indicating discrepancies or outliers.

**Method:** I constructed an SQL query utilizing various concepts:

* **Common Table Expressions (CTEs):** I structured complex calculations into smaller, reusable segments.
* **CASE Statements:** I dynamically assigned scores based on salary deviation from the departmental average.
* **JOINs:** I combined data from employee salary and department tables.
* **Aggregation Functions:** I calculated averages, standard deviations, and outlier counts for each department.
* **Filtering and Sorting:** I focused on departments with high variation scores and outliers.

**Key Deliverables:**

* **SQL Script:** A documented and commented SQL query for departmental salary analysis.
* **Departmental Disparity Report:** A detailed report, with visualizations, identifying departments with:
    * High coefficient of variation (CV) in salaries.
    * High standard deviation in salaries.
    * Significant numbers of outliers.

**Findings:**

The analysis revealed several departments with notable salary discrepancies:

1. **CMD:** High CV, high standard deviation, and several outliers.
2. **AGR:** High CV, moderate standard deviation, and some outliers.
3. **CCC:** High CV, numerous outliers but moderate standard deviation.
4. **PWD:** High number of outliers and moderate CV.
5. **CWA:** Moderate standard deviation, high CV, and a fair number of outliers.

**Impact:** My analysis provided valuable insights for managerial decision-making, potentially leading to strategies for addressing salary disparities and promoting internal equity.

**Skills Demonstrated:**

* SQL query development and optimization.
* Data analysis and interpretation.
* Communication of findings through reports and visualizations.
