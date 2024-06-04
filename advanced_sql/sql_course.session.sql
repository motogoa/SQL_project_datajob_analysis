SELECT job_work_from_home as A,
    job_no_degree_mention AS B,
    job_health_insurance AS C,
    (
        job_work_from_home::INT + job_no_degree_mention::INT + job_health_insurance::INT
    ) AS Score,
    CASE
        WHEN (
            job_work_from_home::INT + job_no_degree_mention::INT + job_health_insurance::INT
        ) > 0 THEN 'VIP'
        ELSE ''
    END AS "Status"
FROM apr23_jobs
LIMIT 25
SELECT job_title_short,
    job_posted_date::DATE,
    salary_year_avg::INTEGER
FROM (
        SELECT *
        FROM jan23_jobs
        WHERE salary_year_avg IS NOT NULL
        UNION ALL
        SELECT *
        FROM feb23_jobs
        WHERE salary_year_avg IS NOT NULL
        UNION ALL
        SELECT *
        FROM mar23_jobs
        WHERE salary_year_avg IS NOT NULL
    ) AS q1jp
WHERE q1jp.salary_year_avg > 70000
    AND q1jp.job_title_short LIKE '%Data%'
    OR q1jp.job_title_short LIKE '%Business%'
order by q1jp.salary_year_avg DESC;