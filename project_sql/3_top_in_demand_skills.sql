SELECT
    skills,
    COUNT(skills) AS demand_count
FROM job_postings_fact jpf
NATURAL JOIN skills_job_dim sjd
NATURAL JOIN skills_dim sd
WHERE jpf.job_title_short IN ('Data Scientist', 'Data Analyst') OR jpf.job_title LIKE '%Business%' AND
    jpf.salary_year_avg IS NOT NULL AND
    jpf.job_work_from_home = true
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;