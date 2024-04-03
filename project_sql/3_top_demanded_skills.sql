SELECT 
    sd.skills,
    COUNT(sjd.job_id) AS demand_count
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
    demand_count DESC
LIMIT 10;

/*
[
  {
    "skills": "sql",
    "demand_count": "781"
  },
  {
    "skills": "excel",
    "demand_count": "518"
  },
  {
    "skills": "python",
    "demand_count": "483"
  },
  {
    "skills": "tableau",
    "demand_count": "452"
  },
  {
    "skills": "r",
    "demand_count": "291"
  },
  {
    "skills": "sas",
    "demand_count": "230"
  },
  {
    "skills": "power bi",
    "demand_count": "218"
  },
  {
    "skills": "powerpoint",
    "demand_count": "129"
  },
  {
    "skills": "word",
    "demand_count": "118"
  },
  {
    "skills": "oracle",
    "demand_count": "83"
  }
]
*/