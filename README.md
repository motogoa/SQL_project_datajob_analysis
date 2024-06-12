# Project "Salaries and Top-paying Skills in Data Analysis"
## Introduction
The aim of this study was to find corelations between skills and salaries in the contemporary Data Analyst job market, including Data Science and Business Intelligence.
The goal here, eventually, was to provide a data-based foundation for a learning path.
### The Questions posed
1. What are the top-paying Data Analyst jobs?
2. Which skills are required in these top-paying job opennings?
3. Which skills are in high demand?
4. How are these skills valued on average?
5. Which skills are optimal specifically for Data Analysts, Data Scientist, and Business Inteligence specialists?
### Queries
The SQL  queries used in this study are located here: [project_sql](/project_sql/)
## Tool Box
- Language: 100% manually written (by me) **SQL** with **PostgreSQL** for a database management system
- IDE: **Visual Studio Code** editor
- Version Control: **Git** & **GitHub**
- Report writer: custom-tuned == prompt-engineered (by me) **ChatGPT 4o** data analysis template
## The Analyis
### Top-paying Jobs on the market
Based on the scraped raw data from various hiring sources, the highest-paying job titles at the moment of research, which included the words 'Data Analyst', were identified with this query:
```sql
SELECT
jpf.job_title,
c.name company,
jpf.salary_year_avg
FROM job_postings_fact jpf
NATURAL JOIN company_dim c
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC
limit 10;
```

No insights here, except that there are various outliers at the top which are probably C-level administrative jobs, beyond the scope of this study.

![Top-10 salaries](Assets\2024-06-11_13-53-58.png)

### Top-paying Skills
This analysis provides insights into the frequency of various skills associated with the 10 top-paying jobs.
The data reveals that SQL and Python are the most prevalent skills, indicating high demand and value in the job market.

#### Key Findings
1. **Most Frequent Skills**:
   - **SQL**: 8 occurrences
   - **Python**: 7 occurrences
   - **Tableau**: 6 occurrences
   - **R**: 4 occurrences

2. **Moderately Frequent Skills** (3 occurrences each):
   - Snowflake
   - Pandas
   - Excel

3. **Less Frequent Skills** (2 occurrences each):
   - Azure
   - Bitbucket
   - Go
   - Oracle
   - Power BI
   - Confluence
   - GitLab
   - Atlassian
   - Jira
   - AWS
   - NumPy

4. **Rare Skills** (1 occurrence each):
   - Jenkins
   - SAP
   - Crystal
   - Flow
   - Hadoop
   - PowerPoint
   - Jupyter
   - PySpark
   - Databricks
   - Git

#### Insights
- **High Demand Skills**: SQL and Python are essential for many top-paying jobs, suggesting a strong market demand.
- **Data Visualization Tools**: Tableau and Power BI are frequently mentioned, highlighting their importance in data visualization roles.
- **Cloud Platforms**: Skills like Azure and AWS are also notable, reflecting the industry's shift towards cloud-based solutions.
- **Programming Languages and Libraries**: Apart from Python, languages like R and libraries like Pandas and NumPy are valuable.

#### Recommendations
1. **Skill Development**: Focus on acquiring and mastering SQL and Python as they are highly sought after.
2. **Broaden Knowledge**: Gain proficiency in data visualization tools like Tableau and Power BI.
3. **Cloud Expertise**: Develop skills in cloud platforms such as Azure and AWS to stay relevant in the evolving job market.
4. **Continuous Learning**: Keep updating knowledge with emerging tools and technologies like Snowflake.

### Top 10 in-demand Data Analysis Skills
This analysis provides insights into the demand for various skills required for Data Analyst job positions.
#### The SQL query
```sql
SELECT
    skills,
    COUNT(skills) AS demand_count
FROM job_postings_fact jpf
NATURAL JOIN skills_job_dim sjd
NATURAL JOIN skills_dim sd
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;
```
#### Key Findings
1. **Top 3 Most In-Demand Skills**:
   - **SQL**: 3,083 demand count
   - **Excel**: 2,143 demand count
   - **Python**: 1,840 demand count

2. **Other Highly Demanded Skills**:
   - **Tableau**: 1,659 demand count
   - **R**: 1,073 demand count
   - **Power BI**: 1,044 demand count
   - **SAS**: 1,000 demand count

3. **Moderate Demand**:
   - **Word**: 527 demand count
   - **PowerPoint**: 524 demand count
   - **SQL Server**: 336 demand count

#### Insights
1. **Programming and Database Management**:
   - **SQL** is the most in-demand skill, highlighting its essential role in querying and managing databases.
   - **Python** is also highly demanded, reflecting its importance in data manipulation, analysis, and automation.

2. **Data Manipulation and Analysis Tools**:
   - **Excel** is the second most in-demand skill, underscoring its continued relevance in data analysis tasks.
   - **R** and **SAS** are critical for statistical analysis and data modeling.

3. **Data Visualization**:
   - **Tableau** and **Power BI** are highly valued for creating interactive dashboards and reports, essential for translating data insights into visual formats that support decision-making.

4. **General Office Tools**:
   - **Word** and **PowerPoint** are moderately demanded, indicating the need for presenting findings and creating documentation.

5. **Specific Database Management**:
   - **SQL Server** is specifically mentioned, showing its particular importance in certain job roles.

#### Recommendations
1. **Prioritize Learning SQL and Python**:
   - Focus on developing strong proficiency in SQL and Python as they are the most in-demand skills for Data Analysts.

2. **Enhance Skills in Data Visualization**:
   - Gain expertise in Tableau and Power BI to improve your ability to create compelling data visualizations and reports.

3. **Develop Proficiency in Statistical Tools**:
   - Invest time in learning R and SAS to enhance your capabilities in statistical analysis and data modeling.

4. **Maintain Competency in General Office Tools**:
   - Ensure proficiency in Excel, Word, and PowerPoint for efficient data manipulation, presentation, and documentation.

5. **Consider Specific Database Management Skills**:
   - Develop skills in SQL Server to cater to specific job roles that require this expertise.

### Average Skill Value
The following analysis highlights the top 25 highest-paying skills for Data Analysts, showcasing their average annual salaries.
#### The SQL query
```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_sal
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_sal DESC
LIMIT 25;
```
#### Key Findings
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

#### Insights
1. **Emerging Technologies**: PySpark stands out as the highest-paying skill, indicating its critical role in big data processing and analysis.
2. **Version Control Systems**: Skills like Bitbucket and GitLab command high salaries, reflecting the importance of version control in collaborative data projects.
3. **Specialized Tools**: Data-specific tools like Couchbase, Watson, and DataRobot are highly valued, suggesting a premium for expertise in these advanced platforms.
4. **Programming and Libraries**: Proficiency in languages and libraries such as Swift, Pandas, NumPy, and Scikit-learn is crucial for data analysis and machine learning tasks.
5. **Cloud and DevOps**: Skills in cloud platforms (GCP, Kubernetes) and DevOps tools (Jenkins, Airflow) are also highly compensated, underscoring the industry's shift towards cloud-based and automated workflows.

#### Recommendations
1. **Focus on High-Value Skills**: Prioritize learning PySpark, Bitbucket, and Couchbase to maximize earning potential.
2. **Develop Advanced Tool Proficiency**: Gain expertise in tools like Watson, DataRobot, and Elasticsearch to stand out in the job market.
3. **Strengthen Programming and Library Skills**: Enhance your skills in Pandas, NumPy, and Scikit-learn to improve data analysis and machine learning capabilities.
4. **Adopt Cloud and DevOps Practices**: Invest time in learning cloud platforms (GCP, Kubernetes) and DevOps tools (Jenkins, Airflow) to stay relevant in the evolving tech landscape.
5. **Continuous Learning**: Keep abreast of new technologies and tools to maintain a competitive edge and adapt to industry trends.
### Optimal skills for Data Analysts
The following analysis highlights the top 25 highest-paying skills for Data Analysts, showcasing their average annual salaries.
#### The SQL query
```sql
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
    ORDER BY salary_year_avg DESC
    limit 10
)

SELECT
    tpj.*,
    skills
FROM top_paying_jobs tpj
INNER JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id;
```
#### Key Findings
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

#### Insights
1. **Emerging Technologies**: PySpark stands out as the highest-paying skill, indicating its critical role in big data processing and analysis.
2. **Version Control Systems**: Skills like Bitbucket and GitLab command high salaries, reflecting the importance of version control in collaborative data projects.
3. **Specialized Tools**: Data-specific tools like Couchbase, Watson, and DataRobot are highly valued, suggesting a premium for expertise in these advanced platforms.
4. **Programming and Libraries**: Proficiency in languages and libraries such as Swift, Pandas, NumPy, and Scikit-learn is crucial for data analysis and machine learning tasks.
5. **Cloud and DevOps**: Skills in cloud platforms (GCP, Kubernetes) and DevOps tools (Jenkins, Airflow) are also highly compensated, underscoring the industry's shift towards cloud-based and automated workflows.

#### Recommendations
These recommendations can help you align your skill development with market demands, ensuring better career opportunities and higher salaries.
1. **Focus on High-Value Skills**: Prioritize learning PySpark, Bitbucket, and Couchbase to maximize earning potential.
2. **Develop Advanced Tool Proficiency**: Gain expertise in tools like Watson, DataRobot, and Elasticsearch to stand out in the job market.
3. **Strengthen Programming and Library Skills**: Enhance your skills in Pandas, NumPy, and Scikit-learn to improve data analysis and machine learning capabilities.
4. **Adopt Cloud and DevOps Practices**: Invest time in learning cloud platforms (GCP, Kubernetes) and DevOps tools (Jenkins, Airflow) to stay relevant in the evolving tech landscape.
5. **Continuous Learning**: Keep abreast of new technologies and tools to maintain a competitive edge and adapt to industry trends.

### Business Intelligence optimal skills
This analysis provides insights into the highest-paying skills for Business Intelligence (BI) specialists, highlighting the demand and average salaries for key skills.
#### The SQL query
```sql
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
HAVING COUNT(sjd.job_id)>10  --this filters out high-paying but low demand skills
ORDER BY
    avg_sal DESC,
    demand_count DESC
LIMIT 25;
```
#### Key Findings
1. **Top 2 Highest-Paying Skills**:
   - **Python**: $120,827 (21 demand count)
   - **SQL**: $118,582 (48 demand count)

2. **Data Visualization Tools**:
   - **Tableau**: $108,340 (32 demand count)
   - **Power BI**: $100,768 (16 demand count)

3. **General BI Tools**:
   - **Excel**: $104,488 (23 demand count)

#### Insights
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

#### Recommendations
1. **Prioritize Learning Python and SQL**:
   - Focus on developing strong proficiency in Python and SQL, as they are the highest-paying and most demanded skills in the BI field.

2. **Enhance Data Visualization Skills**:
   - Gain expertise in Tableau and Power BI to improve your ability to create compelling data visualizations and reports.

3. **Maintain Proficiency in Excel**:
   - Continue to refine your Excel skills, as it remains a critical tool for various BI tasks.

These insights can help guide skill development efforts to align with market demands, ensuring better career opportunities and higher salaries in the Business Intelligence domain.
### Optimal skills for Data Scientists
This analysis provides insights into the top 25 highest-paying skills for Data Science specialists, highlighting the demand and average salaries for key skills.
#### The SQL query
```sql
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_sal
FROM job_postings_fact jpf
NATURAL JOIN skills_job_dim sjd
NATURAL JOIN skills_dim sd
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
GROUP BY sd.skill_id
HAVING COUNT(sjd.job_id)>10  --this filters out high-paying but low demand skills
ORDER BY
    avg_sal DESC,
    demand_count DESC
LIMIT 25;
```
#### Key Findings
1. **Top 5 Highest-Paying Skills**:
   - **C**: $164,865 (48 demand count)
   - **Go**: $164,691 (57 demand count)
   - **Qlik**: $164,485 (15 demand count)
   - **Looker**: $158,715 (57 demand count)
   - **Airflow**: $157,414 (23 demand count)

2. **High-Demand Skills (Demand count > 50)**:
   - **Snowflake**: $152,687 (72 demand count)
   - **PyTorch**: $152,603 (115 demand count)
   - **TensorFlow**: $151,536 (126 demand count)
   - **Spark**: $150,188 (149 demand count)
   - **AWS**: $149,630 (217 demand count)
   - **NumPy**: $149,089 (73 demand count)
   - **Scikit-learn**: $148,964 (81 demand count)
   - **Tableau**: $146,970 (219 demand count)
   - **Python**: $143,828 (763 demand count)

3. **Notable Skills with High Salaries**:
   - **BigQuery**: $157,142 (36 demand count)
   - **GCP**: $155,811 (59 demand count)
   - **Redshift**: $151,708 (36 demand count)
   - **Java**: $145,706 (64 demand count)
   - **Pandas**: $144,816 (113 demand count)
   - **Kubernetes**: $144,498 (25 demand count)

#### Insights
1. **Programming Languages**:
   - **C** and **Go** are among the highest-paying skills, indicating their importance in Data Science projects requiring performance and concurrency.
   - **Python** is highly demanded (763 occurrences) with an average salary of $143,828, highlighting its dominance in the Data Science field.

2. **Machine Learning Frameworks**:
   - **PyTorch** and **TensorFlow** are critical for developing and deploying machine learning models, with significant demand and high average salaries ($152,603 and $151,536, respectively).

3. **Big Data and Cloud Technologies**:
   - **Spark**, **AWS**, and **GCP** are essential for handling large-scale data processing and cloud infrastructure, reflecting their substantial demand and competitive salaries.

4. **Data Visualization and BI Tools**:
   - **Tableau** and **Looker** are valuable for data visualization and business intelligence, with Tableau showing high demand (219 occurrences) and Looker offering a substantial average salary ($158,715).

5. **Essential Data Science Libraries**:
   - **NumPy** and **Pandas** are fundamental for data manipulation and analysis, with significant demand and competitive salaries.

#### Recommendations
1. **Prioritize Learning High-Paying Skills**:
   - Focus on developing proficiency in **C**, **Go**, and **Qlik** to maximize earning potential.

2. **Strengthen Machine Learning Capabilities**:
   - Gain expertise in frameworks like **PyTorch** and **TensorFlow** to enhance machine learning and deep learning skills.

3. **Embrace Big Data and Cloud Technologies**:
   - Develop skills in **Spark**, **AWS**, and **GCP** to manage and process large datasets efficiently.

4. **Improve Data Visualization Proficiency**:
   - Enhance your ability to use tools like **Tableau** and **Looker** for creating impactful data visualizations and BI reports.

5. **Continue Building Fundamental Skills**:
   - Maintain and deepen your knowledge in essential programming languages like **Python**, and data science libraries like **NumPy** and **Pandas**.

These insights and recommendations can help align skill development with market demands, ensuring better career opportunities and higher salaries in the Data Science domain.
## Conclusions
For all jobs in the intersection of Data Analysis, Data Science and Business Intelligence this skill set appears to be the optimal effort-to-benefit time investment in education to land a high-paying Data Analytics related job:
1. **Skill Development**: Focus on acquiring and mastering **SQL** and **Python**, **Pandas** and **NumPy** libraries as they are highly sought after. Gain proficiency in data visualization tools like **Looker**, **Tableau** or **Power BI**.
2. **Cloud Expertise**: Develop skills in *cloud* platforms such as **BigQuery** and **GCP** or **Azure** and **AWS**.
3. **Continuous Learning**: Keep updating knowledge to stay relevant in the evolving job market with streaming tools and technologies like (in order of pay/demand optimality) **Spark**, **Couchbase**, **WatsonX** or **Snowflake**, **TensorFlow** or **PyTorch**.
