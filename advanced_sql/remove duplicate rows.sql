/* remove all duplicate rows */
-- step 1
CREATE TABLE _temp (LIKE skills_job_dim);
-- step 2
INSERT INTO _temp
SELECT DISTINCT ON (job_id) --uniq_id, --serial
    job_id,
    --INT
    application_sent_date,
    --DATE
    custom_resume,
    --BOOLEAN
    resume_file_name,
    --VARCHAR(255)
    cover_letter_sent,
    --BOOLEAN
    cover_letter_file_name,
    --VARCHAR(255)
    status --VARCHAR(50) 
FROM job_applied;
-- step 3
DROP TABLE job_applied;
-- step 4
ALTER TABLE _temp
    RENAME TO job_applied;
-- check
SELECT *
FROM job_applied;