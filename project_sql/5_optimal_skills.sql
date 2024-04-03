SELECT 
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    CAST(AVG(jp.salary_year_avg) AS DECIMAL(10, 0)) AS avg_salary
FROM 
    job_postings_fact jp
INNER JOIN 
    skills_job_dim sjd ON jp.job_id = sjd.job_id
INNER JOIN 
    skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    jp.job_title_short = 'Data Analyst'
    AND (jp.job_location LIKE '%, CA' OR jp.job_location = 'Anywhere')
    AND jp.salary_year_avg IS NOT NULL
    AND EXTRACT(YEAR FROM jp.job_posted_date) = 2023
    AND jp.job_schedule_type = 'Full-time'
GROUP BY
    sd.skill_id
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
[
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "11",
    "avg_salary": "142960"
  },
  {
    "skill_id": 25,
    "skills": "php",
    "demand_count": "11",
    "avg_salary": "140601"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "18",
    "avg_salary": "139604"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "14",
    "avg_salary": "135474"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "23",
    "avg_salary": "132269"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "32",
    "avg_salary": "128875"
  },
  {
    "skill_id": 141,
    "skills": "express",
    "demand_count": "35",
    "avg_salary": "127218"
  },
  {
    "skill_id": 216,
    "skills": "github",
    "demand_count": "13",
    "avg_salary": "124174"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "31",
    "avg_salary": "123829"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "11",
    "avg_salary": "120286"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "15",
    "avg_salary": "117930"
  },
  {
    "skill_id": 57,
    "skills": "postgresql",
    "demand_count": "11",
    "avg_salary": "117555"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "23",
    "avg_salary": "116987"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "70",
    "avg_salary": "115131"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "81",
    "avg_salary": "114215"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "73",
    "avg_salary": "113353"
  },
  {
    "skill_id": 112,
    "skills": "plotly",
    "demand_count": "14",
    "avg_salary": "112421"
  },
  {
    "skill_id": 23,
    "skills": "crystal",
    "demand_count": "15",
    "avg_salary": "112050"
  },
  {
    "skill_id": 15,
    "skills": "matlab",
    "demand_count": "24",
    "avg_salary": "111981"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "31",
    "avg_salary": "111128"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "483",
    "avg_salary": "110968"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "23",
    "avg_salary": "110692"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "57",
    "avg_salary": "110400"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "31",
    "avg_salary": "110100"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "31",
    "avg_salary": "109207"
  }
]
*/
