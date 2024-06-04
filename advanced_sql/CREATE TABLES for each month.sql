CREATE TABLE jan23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 1
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE feb23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 2
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE mar23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 3
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE apr23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 4
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE may23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 5
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE jun23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 6
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE jul23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 7
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE aug23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 8
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE aug23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 8
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE sep23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 9
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE oct23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 10
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE nov23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 11
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
CREATE TABLE dec23_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 12
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023;
SELECT *
FROM feb23_jobs;
SELECT *
FROM dec23_jobs;