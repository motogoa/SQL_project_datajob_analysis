WITH top_paying_jobs AS (
    SELECT
    jpf.job_id,
    jpf.job_title,
    c.name company,
    jpf.salary_year_avg
    FROM job_postings_fact jpf
    NATURAL JOIN company_dim c
    WHERE salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
        --AND job_work_from_home IS NOT FALSE
    ORDER BY salary_year_avg DESC
    limit 10
)

SELECT
    tpj.*,
    skills
FROM top_paying_jobs tpj
INNER JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id;


/* Data analysis

Executive Summary
This analysis provides insights into the frequency of various skills associated with top-paying jobs.
The data reveals that SQL and Python are the most prevalent skills, indicating high demand and value in the job market.

Key Findings

Most Frequent Skills:
    SQL: 8 occurrences
    Python: 7 occurrences
    Tableau: 6 occurrences
    R: 4 occurrences

Moderately Frequent Skills (3 occurrences each):
    Snowflake
    Pandas
    Excel

Less Frequent Skills (2 occurrences each):
    Azure
    Bitbucket
    Go
    Oracle
    Power BI
    Confluence
    GitLab
    Atlassian
    Jira
    AWS
    NumPy

Rare Skills (1 occurrence each):
    Jenkins
    SAP
    Crystal
    Flow
    Hadoop
    PowerPoint
    Jupyter
    PySpark
    Databricks
    Git

Insights
High Demand Skills: SQL and Python are essential for many top-paying jobs, suggesting a strong market demand.
Data Visualization Tools: Tableau and Power BI are frequently mentioned, highlighting their importance in data visualization roles.
Cloud Platforms: Skills like Azure and AWS are also notable, reflecting the industry's shift towards cloud-based solutions.
Programming Languages and Libraries: Apart from Python, languages like R and libraries like Pandas and NumPy are valuable.

Recommendations
Skill Development: Focus on acquiring and mastering SQL and Python as they are highly sought after.
Broaden Knowledge: Gain proficiency in data visualization tools like Tableau and Power BI.
Cloud Expertise: Develop skills in cloud platforms such as Azure and AWS to stay relevant in the evolving job market.
Continuous Learning: Keep updating knowledge with emerging tools and technologies like Snowflake, Databricks, and PySpark.
These insights can help in aligning skill development efforts with market demands, enhancing employability and potential earnings. ​​

*/