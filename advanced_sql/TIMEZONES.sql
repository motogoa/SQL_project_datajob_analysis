/* https://en.wikipedia.org/wiki/List_of_tz_database_time_zones */

SELECT LOCALTIME(0) AT TIME ZONE 'Asia/Tbilisi';  --only time 17:25:44+04

SELECT NOW() AT TIME ZONE '-04';  --timestamp 2024-05-24 17:24:47.97989


SELECT job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE '-04'
FROM job_postings_fact
LIMIT 5;
