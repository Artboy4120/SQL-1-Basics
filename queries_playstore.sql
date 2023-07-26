-- Task 1: Find the app with an ID of 1880
SELECT * FROM analytics WHERE id = 1880;

-- Task 2: Find the ID and app name for all apps that were last updated on August 01, 2018
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- Task 3: Count the number of apps in each category
SELECT category, COUNT(*) FROM analytics GROUP BY category;

-- Task 4: Find the top 5 most-reviewed apps and the number of reviews for each
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- Task 5: Find the app that has the most reviews with a rating greater than or equal to 4.8
SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- Task 6: Find the average rating for each category ordered by the highest rated to lowest rated
SELECT category, AVG(rating) AS average_rating FROM analytics GROUP BY category ORDER BY average_rating DESC;

-- Task 7: Find the name, price, and rating of the most expensive app with a rating that’s less than 3
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- Task 8: Find all apps with a min install not exceeding 50, that have a rating. Order your results by the highest rated first
SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

-- Task 9: Find the names of all apps that are rated less than 3 with at least 10000 reviews
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- Task 10: Find the top 10 most-reviewed apps that cost between 10 cents and a dollar
SELECT * FROM analytics WHERE price >= 0.1 AND price <= 1.0 ORDER BY reviews DESC LIMIT 10;

-- Task 11: Find the most out of date app
SELECT * FROM analytics ORDER BY last_updated ASC LIMIT 1;

-- Task 12: Find the most expensive app
SELECT * FROM analytics ORDER BY price DESC LIMIT 1;

-- Task 13: Count all the reviews in the Google Play Store
SELECT SUM(reviews) FROM analytics;

-- Task 14: Find all the categories that have more than 300 apps in them
SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;

-- Task 15: Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion
SELECT app_name, reviews, min_installs, min_installs::FLOAT / reviews AS proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;


---Furhter Study---

SELECT category, app_name, rating
FROM analytics
WHERE (category, rating) IN (
    SELECT category, MAX(rating) AS max_rating
    FROM analytics
    WHERE min_installs >= 50000
    GROUP BY category
);

SELECT *
FROM analytics
WHERE app_name ILIKE '%facebook%';

SELECT *
FROM analytics
WHERE 'Education' = ANY (genres);

