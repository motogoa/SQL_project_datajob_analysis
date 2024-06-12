SELECT
jpf.job_title,
c.name company,
jpf.salary_year_avg
FROM job_postings_fact jpf
NATURAL JOIN company_dim c
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
    --AND job_work_from_home IS NOT FALSE
ORDER BY salary_year_avg DESC
limit 10;