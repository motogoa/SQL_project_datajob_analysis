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
    --AND job_work_from_home = true
GROUP BY sd.skill_id
HAVING COUNT(sjd.job_id)>10  --cannot use demand_count>10 here ; this filters out high-paying but low demand skills
ORDER BY
    avg_sal DESC,
    demand_count DESC
LIMIT 25;

/* Data analysis:

## Executive Summary

The following analysis highlights the top 25 highest-paying skills for Data Analysts, showcasing their average annual salaries.
These insights can guide skill development strategies to maximize earning potential in the data analytics field.

## Key Findings

1. **Top 5 Highest-Paying Skills**:
   - **PySpark**: $208,172
   - **Bitbucket**: $189,155
   - **Couchbase**: $160,515
   - **Watson**: $160,515
   - **DataRobot**: $155,486

2. **Highly Valued Skills (Average Salary > $150,000)**:
   - GitLab: $154,500
   - Swift: $153,750
   - Jupyter: $152,777
   - Pandas: $151,821

3. **Moderately Valued Skills (Average Salary $140,000 - $150,000)**:
   - Elasticsearch: $145,000
   - Golang: $145,000
   - NumPy: $143,513
   - Databricks: $141,907

4. **Valuable Skills (Average Salary $120,000 - $140,000)**:
   - Linux: $136,508
   - Kubernetes: $132,500
   - Atlassian: $131,162
   - Twilio: $127,000
   - Airflow: $126,103
   - Scikit-learn: $125,781
   - Jenkins: $125,436
   - Notion: $125,000
   - Scala: $124,903
   - PostgreSQL: $123,879
   - GCP: $122,500
   - MicroStrategy: $121,619

## Insights

1. **Emerging Technologies**: PySpark stands out as the highest-paying skill, indicating its critical role in big data processing and analysis.
2. **Version Control Systems**: Skills like Bitbucket and GitLab command high salaries, reflecting the importance of version control in collaborative data projects.
3. **Specialized Tools**: Data-specific tools like Couchbase, Watson, and DataRobot are highly valued, suggesting a premium for expertise in these advanced platforms.
4. **Programming and Libraries**: Proficiency in languages and libraries such as Swift, Pandas, NumPy, and Scikit-learn is crucial for data analysis and machine learning tasks.
5. **Cloud and DevOps**: Skills in cloud platforms (GCP, Kubernetes) and DevOps tools (Jenkins, Airflow) are also highly compensated, underscoring the industry's shift towards cloud-based and automated workflows.

## Recommendations

1. **Focus on High-Value Skills**: Prioritize learning PySpark, Bitbucket, and Couchbase to maximize earning potential.
2. **Develop Advanced Tool Proficiency**: Gain expertise in tools like Watson, DataRobot, and Elasticsearch to stand out in the job market.
3. **Strengthen Programming and Library Skills**: Enhance your skills in Pandas, NumPy, and Scikit-learn to improve data analysis and machine learning capabilities.
4. **Adopt Cloud and DevOps Practices**: Invest time in learning cloud platforms (GCP, Kubernetes) and DevOps tools (Jenkins, Airflow) to stay relevant in the evolving tech landscape.
5. **Continuous Learning**: Keep abreast of new technologies and tools to maintain a competitive edge and adapt to industry trends.

These recommendations can help you align your skill development with market demands, ensuring better career opportunities and higher salaries.
*/