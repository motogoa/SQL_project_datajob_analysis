/* compare with using CTEs for this task, query in advanced_sql/CTEs.sql */

SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_sal
FROM job_postings_fact jpf
NATURAL JOIN skills_job_dim sjd
NATURAL JOIN skills_dim sd
WHERE
    job_title_short = 'Data Analyst' --IN ('Data Scientist', 'Data Analyst') --OR job_title LIKE '%Business%'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = true
GROUP BY sd.skill_id
HAVING COUNT(sjd.job_id)>10  --cannot use demand_count>10 here ; this filters out high-paying but low demand skills
ORDER BY
    avg_sal DESC,
    demand_count DESC
LIMIT 25;

/* ChatGPT analysis:

Executive Summary
The analysis of the top 25 highest-paying skills for Data Analysis specialists reveals significant insights into the skills that command the highest salaries and their demand in the job market.
The following key findings and recommendations can guide skill development to enhance career prospects and earning potential.

Key Findings

Top 5 Highest-Paying Skills:
    Go: $115,320 (27 demand count)
    Confluence: $114,210 (11 demand count)
    Hadoop: $113,193 (22 demand count)
    Snowflake: $112,948 (37 demand count)
    Azure: $111,225 (34 demand count)

High-Demand Skills (Demand count > 30):
    Python: $101,397 (236 demand count)
    R: $100,499 (148 demand count)
    Tableau: $99,288 (230 demand count)
    SAS: $98,902 (63 demand count)
    SQL Server: $97,786 (35 demand count)
    AWS: $108,317 (32 demand count)

Moderate-Paying Skills ($100,000 - $110,000):
    BigQuery: $109,654 (13 demand count)
    AWS: $108,317 (32 demand count)
    Java: $106,906 (17 demand count)
    SSIS: $106,683 (12 demand count)
    Jira: $104,918 (20 demand count)
    Oracle: $104,534 (37 demand count)
    Looker: $103,795 (49 demand count)

Skills with Average Salaries Just Below $100,000:
    NoSQL: $101,414 (13 demand count)
    Redshift: $99,936 (16 demand count)
    Qlik: $99,631 (13 demand count)
    SSRS: $99,171 (14 demand count)
    Spark: $99,077 (13 demand count)
    C++: $98,958 (11 demand count)
    JavaScript: $97,587 (20 demand count)

Insights:

Emerging Technologies: Skills like Go, Hadoop, and Snowflake are among the highest-paying, indicating their importance in modern DA environments.

Cloud Platforms: Azure, AWS, and BigQuery are highly valued, highlighting the growing reliance on cloud infrastructure in DA.

Data Analysis and Visualization: Tools like Looker, Tableau, and Qlik are in high demand, emphasizing their critical role in DA for data visualization and reporting.

Programming and Database Management: Python, R, SQL Server, and JavaScript are essential skills, reflecting their foundational role in data manipulation, analysis, and application development.


Recommendations:

1. Focus on High-Paying Skills: Prioritize learning and mastering Go, Confluence, and Hadoop to maximize earning potential.
2. Enhance Cloud Competency: Develop skills in Azure, AWS, and Snowflake to stay relevant in cloud-based BI solutions.
3. Improve Data Visualization Proficiency: Gain expertise in tools like Looker, Tableau, and Qlik to enhance data presentation and decision-making capabilities.
4. Strengthen Programming Skills: Focus on Python, R, and JavaScript to improve data analysis and application development capabilities.
5. Keep up with Database Management: Develop skills in SQL Server, BigQuery, and Redshift to manage and query large datasets effectively.

These insights and recommendations can help align skill development with market demands, ensuring better career opportunities and higher salaries in the Data Analysis field.

*/