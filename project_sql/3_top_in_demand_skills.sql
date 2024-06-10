SELECT
    skills,
    COUNT(skills) AS demand_count
FROM job_postings_fact jpf
NATURAL JOIN skills_job_dim sjd
NATURAL JOIN skills_dim sd
WHERE job_title_short IN ('Data Scientist', 'Data Analyst') OR job_title LIKE '%Business%' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = true
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;