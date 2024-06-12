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
    AND job_work_from_home = true
GROUP BY sd.skill_id
HAVING COUNT(sjd.job_id)>10  --cannot use demand_count>10 here ; this filters out high-paying but low demand skills
ORDER BY
    avg_sal DESC,
    demand_count DESC
LIMIT 25;


/* Data Analysis:

## Executive Summary

This analysis provides insights into the top 25 highest-paying skills for Data Science specialists, highlighting the demand and average salaries for key skills.
These findings offer valuable guidance for skill development to maximize career prospects and earning potential in the field of Data Science.

## Key Findings

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

## Insights

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

## Recommendations

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

*/