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

-- SELECT DISTINCT(location) as state, AVG(star_rating) as avg_rating
-- FROM data_analyst_jobs
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


-- 9a.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT DISTINCT(company), AVG(star_rating) as avg_star_rating, review_count
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company, review_count


-- 9b. How many companies are there with more that 5000 reviews across all locations?

SELECT DISTINCT(company), AVG(star_rating) as avg_star_rating, review_count
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company, review_count


-- ANSWER = There are 46 companies with more than 5000 reviews across all locations.



