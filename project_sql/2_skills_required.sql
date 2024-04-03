/* 
Question: What are the skills required for these top_paying roles?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT 
        jp.job_id,
        jp.job_title,
        jp.salary_year_avg,
        cd.name AS company_name
    FROM 
        job_postings_fact jp
    LEFT JOIN company_dim cd ON jp.company_id = cd.company_id
    WHERE 
        jp.job_title_short = 'Data Analyst'
        AND (jp.job_location LIKE '%, CA' OR jp.job_location = 'Anywhere')
        AND jp.salary_year_avg IS NOT NULL
        AND EXTRACT(YEAR FROM jp.job_posted_date) = 2023
        AND jp.job_schedule_type = 'Full-time'
    ORDER BY 
        jp.salary_year_avg DESC
    LIMIT 10
)

SELECT 
    tpj.*,
    sd.skills
FROM 
    top_paying_jobs tpj
INNER JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
ORDER BY
    tpj.salary_year_avg DESC;


/*
[
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "salary_year_avg": "285000.0",
    "company_name": "OpenAI",
    "skills": "github"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "salary_year_avg": "240000.0",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "salary_year_avg": "240000.0",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "sql"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "snowflake"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "salary_year_avg": "235000.0",
    "company_name": "Asana",
    "skills": "asana"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "sql"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "r"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "sas"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "tableau"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "sas"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "salary_year_avg": "230000.0",
    "company_name": "Genentech",
    "skills": "qlik"
  },
  {
    "job_id": 1145894,
    "job_title": "E-commerce Data Analyst",
    "salary_year_avg": "224500.0",
    "company_name": "TikTok",
    "skills": "sql"
  },
  {
    "job_id": 1145894,
    "job_title": "E-commerce Data Analyst",
    "salary_year_avg": "224500.0",
    "company_name": "TikTok",
    "skills": "tableau"
  }
]
*/