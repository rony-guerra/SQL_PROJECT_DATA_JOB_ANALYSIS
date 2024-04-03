/* 
Question: What are the top_paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available in California.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top_paying opportunnities for Data Analysts, offering insights into employment opportunities.
*/

SELECT 
    jp.job_id,
    jp.job_title,
    jp.job_location,
    jp.job_schedule_type,
    jp.salary_year_avg,
    jp.job_posted_date,
    cd.name AS company_name
FROM 
    job_postings_fact jp
    LEFT JOIN company_dim cd 
    ON jp.company_id = cd.company_id
WHERE 
    jp.job_title_short = 'Data Analyst'
    AND (jp.job_location LIKE '%, CA' OR jp.job_location = 'Anywhere')
    AND jp.salary_year_avg IS NOT NULL
    AND EXTRACT(YEAR FROM jp.job_posted_date) = 2023
    AND jp.job_schedule_type = 'Full-time'
ORDER BY 
    jp.salary_year_avg DESC
LIMIT 10;

/*
[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "company_name": "Mantys"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-06-22 07:00:59",
    "company_name": "Anthropic"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "company_name": "Meta"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "285000.0",
    "job_posted_date": "2023-04-19 18:04:21",
    "company_name": "OpenAI"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T"
  },
  {
    "job_id": 144450,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "240000.0",
    "job_posted_date": "2023-06-21 13:00:59",
    "company_name": "Anthropic"
  },
  {
    "job_id": 560874,
    "job_title": "Data & Intelligence Manager, Finance",
    "job_location": "San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "235000.0",
    "job_posted_date": "2023-07-05 11:01:16",
    "company_name": "Asana"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 840299,
    "job_title": "Analytics Director - Cross Ecosystem",
    "job_location": "South San Francisco, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "230000.0",
    "job_posted_date": "2023-07-13 08:00:30",
    "company_name": "Genentech"
  },
  {
    "job_id": 1145894,
    "job_title": "E-commerce Data Analyst",
    "job_location": "San Jose, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "224500.0",
    "job_posted_date": "2023-05-02 10:01:32",
    "company_name": "TikTok"
  }
]
*/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                