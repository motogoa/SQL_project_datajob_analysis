/* For PostgreSQL use this notation: */

SELECT
    job_posted_date::DATE AS posted_on,  --casts to 'date' type
    EXTRACT(DAY FROM job_posted_date) AS day,
    EXTRACT(ISODOW FROM job_posted_date) AS d_o_w,
    EXTRACT(WEEK FROM job_posted_date) AS week_No,
    EXTRACT(DOY FROM job_posted_date) AS d_o_y,
    EXTRACT(MONTH FROM job_posted_date) AS month,
    EXTRACT(QUARTER FROM job_posted_date) AS qtr,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    EXTRACT(CENTURY FROM job_posted_date) AS century
FROM job_postings_fact
LIMIT 3;