CREATE TEMP VIEW d_s AS  /*  VIEW is a stored query, not the result set like CTE's are */
SELECT DISTINCT  /* no parentheses to open or close view! */
    EXTRACT(YEAR FROM job_posted_date) AS year,
    job_title,
    job_title_short,
    job_location,
    job_posted_date,
    salary_year_avg
FROM
	job_postings_fact
WHERE
    job_title_short IN ('Data Scientist', 'Data Analyst') OR job_title LIKE '%Business%';
    /* !!! VIEW / TEMPORARY TABLE syntax MUST HAVE ; at end of SELECT statement, but no parentheses !!! */


SELECT *
FROM d_s
WHERE d_s.salary_year_avg IS NOT NULL
LIMIT 10;
