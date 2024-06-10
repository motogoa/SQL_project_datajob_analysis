/* Find optimal skills */
/* compare with using single query for this task, see project_sql/5_optimal_skills.sql */


/* CTE 1, see project_sql/3_top_in_demand_skills, notice no LIMIT and ORDER BY */
WITH skills_demand AS(
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS demand_count
    FROM job_postings_fact jpf
    NATURAL JOIN skills_job_dim sjd
    NATURAL JOIN skills_dim sd
    WHERE
        job_title_short = 'Data Analyst' /* IN ('Data Scientist', 'Data Analyst') OR job_title LIKE '%Business%' */
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = true
    GROUP BY sd.skill_id
),

/*CTE 2, see project_sql/4_avg_skill_value, notice no WITH (!!!) or LIMIT and ORDER BY */
average_salary AS(
    SELECT
        sjd.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_sal
    FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
    WHERE job_title_short = 'Data Analyst' --IN ('Data Scientist', 'Data Analyst') OR job_title LIKE '%Business%'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = true
    GROUP BY sjd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.Skills,
    demand_count,
    avg_sal
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count>10  --this filters out high-paying but low demand skills
ORDER BY
    avg_sal DESC,
    demand_count DESC
LIMIT 25;