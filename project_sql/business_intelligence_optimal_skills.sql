SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_sal
FROM job_postings_fact jpf
NATURAL JOIN skills_job_dim sjd
NATURAL JOIN skills_dim sd
WHERE
    job_title LIKE '%Business%'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = true
GROUP BY sd.skill_id
HAVING COUNT(sjd.job_id)>10  --cannot use demand_count>10 here ; this filters out high-paying but low demand skills
ORDER BY
    avg_sal DESC,
    demand_count DESC
LIMIT 25;


/* Data analysis:

## Executive Summary

This analysis provides insights into the highest-paying skills for Business Intelligence (BI) specialists, highlighting the demand and average salaries for key skills.
The findings will help prioritize skill development to enhance career prospects and earning potential.

## Key Findings

1. **Top 2 Highest-Paying Skills**:
   - **Python**: $120,827 (21 demand count)
   - **SQL**: $118,582 (48 demand count)

2. **Data Visualization Tools**:
   - **Tableau**: $108,340 (32 demand count)
   - **Power BI**: $100,768 (16 demand count)

3. **General BI Tools**:
   - **Excel**: $104,488 (23 demand count)

## Insights

1. **Programming Skills**:
   - **Python** is the highest-paying skill, with an average salary of $120,827 and a demand count of 21.
   Python's versatility and extensive libraries make it a critical skill for data analysis and automation in BI.

2. **Database Management**:
   - **SQL** is highly demanded (48 occurrences) with an average salary of $118,582.
   Proficiency in SQL is essential for querying and managing databases, making it a foundational skill in BI.

3. **Data Visualization**:
   - **Tableau** and **Power BI** are crucial for creating interactive dashboards and reports.
   Tableau commands an average salary of $108,340 with a demand count of 32, while Power BI offers an average salary of $100,768 with a demand count of 16.
   These tools are vital for translating data insights into visual formats that support decision-making.

4. **General Analytical Tools**:
   - **Excel** remains a fundamental tool in BI, with an average salary of $104,488 and a demand count of 23.
   It's widespread use for data manipulation, analysis, and visualization underscores its ongoing importance.

## Recommendations

1. **Prioritize Learning Python and SQL**:
   - Focus on developing strong proficiency in Python and SQL, as they are the highest-paying and most demanded skills in the BI field.

2. **Enhance Data Visualization Skills**:
   - Gain expertise in Tableau and Power BI to improve your ability to create compelling data visualizations and reports.

3. **Maintain Proficiency in Excel**:
   - Continue to refine your Excel skills, as it remains a critical tool for various BI tasks.

These insights can help guide skill development efforts to align with market demands, ensuring better career opportunities and higher salaries in the Business Intelligence domain.

*/