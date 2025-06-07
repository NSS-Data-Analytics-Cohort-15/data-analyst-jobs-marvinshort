-- 1.	How many rows are in the data_analyst_jobs table?

-- SELECT COUNT(*)
-- FROM data_analyst_jobs

-- ANSWER = 1793






-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10

-- ANSWER = ExxonMobil






-- 3a.	How many postings are in Tennessee? 

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE location = 'TN'

-- ANSWER = There are 21 job postings in Tennessee.





-- 3b.	How many are there in either Tennessee or Kentucky?

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE location = 'TN' OR location = 'KY'

-- ANSWER = 27 job postings are in either Tennessee or Kentucky.





-- 4.	How many postings in Tennessee have a star rating above 4?

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE location = 'TN' AND star_rating > 4

-- ANSWER = 3 postings have a star rating above 4.



-- 5.	How many postings in the dataset have a review count between 500 and 1000?

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE review_count BETWEEN 500 AND 1000

-- ANSWER = 151 postings have a review count between 500 and 1000.



-- 6a.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`.

-- SELECT location as state, AVG(star_rating) as avg_rating
-- FROM data_analyst_jobs
-- WHERE star_rating IS NOT NULL
-- GROUP BY location



-- 6b.	Which state shows the highest average rating?

-- SELECT DISTINCT(location) as state, AVG(star_rating) as avg_rating
-- FROM data_analyst_jobs
-- GROUP BY location
-- ORDER BY avg_rating DESC

-- ANSWER = NE (Nebraska) is the state with the highest average rating.




-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs




-- ANSWER = There are 881 unique job titles.



-- 8.	How many unique job titles are there for California companies?
-- SELECT location, COUNT(DISTINCT(title)) as unique_job_titles
-- FROM data_analyst_jobs
-- WHERE location = 'CA'
-- GROUP BY location


-- ANSWER = There are 230 unique job titles for California companies.


-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

-- SELECT company, ROUND(AVG(star_rating),2) as avg_star_rating
-- FROM data_analyst_jobs
-- WHERE review_count >5000 AND COMPANY IS NOT NULL
-- GROUP BY company


-- ANSWER = There are 40 companies with more than 5000 reviews across all locations.



-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- SELECT company, ROUND(AVG(star_rating),4) as avg_star_rating
-- FROM data_analyst_jobs
-- WHERE review_count >5000 AND COMPANY IS NOT NULL
-- GROUP BY company
-- ORDER BY avg_star_rating DESC


-- ANSWER = Unilever has the highest average star rating. The rating is 4.2000. However, it's really a 6-way tie between Unilever, General Motors, NIke, American Express, Microsoft, Kaiser Permanente, Lockheed Martin Corporation, and Siemens.



--11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

-- SELECT Distinct(title)
-- FROM data_analyst_jobs
-- WHERE title ILIKE '%Analyst%'


-- ANSWER = There are 774 jobs with Analyst in their description



--12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%'


-- ANSWER = There are 4 job titles  that do not contain the words Analyst or Analytics. They all have the word Tableau in common.



-- BONUS
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--Disregard any postings where the domain is NULL. 
-- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
-- Which three industries are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of the top  3?


-- SELECT DISTINCT(domain), count(title) as number_of_jobs_with_sql
-- FROM data_analyst_jobs
-- WHERE skill ILIKE '%SQL%'
-- AND days_since_posting > 21
-- AND domain is not null
-- GROUP BY domain
-- ORDER BY number_of_jobs_with_sql DESC
-- limit 3


-- ANSWER = Internet and Software, Banks and Financial Services, Consulting and Business Services are the Top 3 Industries with SQL as a skill requirement.
-- Internet and Software = 62 Jobs
-- Banks and Financial Services = 61 Jobs
-- Consulting and Business Services = 57 Jobs