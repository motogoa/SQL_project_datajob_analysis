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
