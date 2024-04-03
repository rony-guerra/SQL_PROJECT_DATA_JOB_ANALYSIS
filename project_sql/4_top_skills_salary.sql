
SELECT 
    sd.skills,
    CAST(AVG(jp.salary_year_avg) AS DECIMAL(10, 2)) AS avg_salary
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
    sd.skills
ORDER BY 
    avg_salary DESC
LIMIT 25;

/*
[
  {
    "skills": "asana",
    "avg_salary": "235000.00"
  },
  {
    "skills": "mxnet",
    "avg_salary": "198000.00"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189154.50"
  },
  {
    "skills": "node",
    "avg_salary": "180000.00"
  },
  {
    "skills": "keras",
    "avg_salary": "174040.00"
  },
  {
    "skills": "cassandra",
    "avg_salary": "168694.83"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "165000.00"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.00"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.00"
  },
  {
    "skills": "puppet",
    "avg_salary": "159640.00"
  },
  {
    "skills": "ansible",
    "avg_salary": "159640.00"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.50"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500.00"
  },
  {
    "skills": "swift",
    "avg_salary": "153750.00"
  },
  {
    "skills": "pytorch",
    "avg_salary": "153226.17"
  },
  {
    "skills": "perl",
    "avg_salary": "152623.89"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "152135.70"
  },
  {
    "skills": "pyspark",
    "avg_salary": "146095.28"
  },
  {
    "skills": "golang",
    "avg_salary": "145000.00"
  },
  {
    "skills": "scala",
    "avg_salary": "143502.14"
  },
  {
    "skills": "numpy",
    "avg_salary": "142960.23"
  },
  {
    "skills": "php",
    "avg_salary": "140601.36"
  },
  {
    "skills": "pandas",
    "avg_salary": "139604.25"
  },
  {
    "skills": "databricks",
    "avg_salary": "135473.79"
  },
  {
    "skills": "jupyter",
    "avg_salary": "134254.21"
  }
]
*/