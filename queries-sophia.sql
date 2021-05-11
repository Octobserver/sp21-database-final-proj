-- Question 1: What is the total_cases_per_million for hospitals in each continent? 
SELECT continent, SUM(total_cases_per_million) AS total_cases
FROM Hospital 
GROUP BY continent;

-- Question 2: Which country has hospitals with most equipped handwashing facility? 
SELECT country_name, MAX(avg_handwashing) AS max_handwashing_count
FROM (SELECT country_name, AVG(handwashing_facilities) AS avg_handwashing
        FROM Hospital
        GROUP BY country_name) AS maxHandwashing; 

-- Question 3: List tested % of population in each country
SELECT H.country_name, H.total_tests / C.population AS tested_percentage
FROM Hospital AS H JOIN 
     Country AS C ON H.country_name = C.country_name; 


-- Question 4: List decrease in spending on healthcare and social assistance spending for each US State? 
SELECT stname, avg_health
FROM (SELECT U.stname, AVG(spend_healthcare_social_assistance) AS avg_health
      FROM Covid19RelatedSpending AS C JOIN USStatefips AS U ON C.statefips = U.st 
      GROUP BY U.stname) AS HealthChange;

-- Question 5: List the average change rate in each spending category in US? 
SELECT stname, AVG(spend_accomodation_food) AS avg_food, AVG(spend_healthcare_social_assistance) AS avg_health, AVG(spend_arts_entertainment) AS avg_entertain, AVG(spend_grocery_food_store) AS avg_grocery
FROM Covid19RelatedSpending AS C JOIN USStatefips AS U ON C.statefips = U.st 
GROUP BY U.stname;

-- Question 6: Does low, middle or high income population in US change their spending habit the most in 2020? 
SELECT SUM(spend_all_inchigh) AS change_high_income, SUM(spend_all_incmiddle) AS change_middle_income, SUM(spend_all_inclow) as change_low_income
FROM Covid19RelatedSpending;


SELECT MAX(change_spending) AS max_change_spending
FROM (
        SELECT SUM(spend_all_inchigh) AS change_spending
        FROM Covid19RelatedSpending
        UNION 
        SELECT SUM(spend_all_incmiddle) AS change_spending
        FROM Covid19RelatedSpending
        UNION 
        SELECT SUM(spend_all_inclow) AS change_spending
        FROM Covid19RelatedSpending ) AS T;
        
        
-- 8. For each different COVID vaccine, how many people have gotten it? 
SELECT M.vaccine_type, SUM(M.total_vaccinations) AS total_vaccinated
FROM VaccinationByManufacturer AS M 
        LEFT OUTER JOIN Vaccine AS V ON M.vaccine_type = V.vaccine_type
GROUP BY M.vaccine_type;

-- 9. What is the total number of vaccinations and total number of people fully vaccinated, in each different country? 
SELECT country_name, SUM(total_vaccinations) AS total_vaccinations, SUM(people_fully_vaccinated) AS people_fully_vaccinated
FROM VaccinationByCountry
GROUP BY country_name;


-- 10. What is the proportion of tweets that show anger associated with each keyword?
DROP VIEW IF EXISTS TotalTweetsByKeyword;
CREATE VIEW TotalTweetsByKeyword AS ( SELECT keyword, COUNT(*) as kw_count
                                      FROM Covid19RelatedTweets
                                      GROUP BY keyword
);


DROP VIEW IF EXISTS AngryTweetsByKeyword;
CREATE VIEW AngryTweetsByKeyword AS (SELECT A.keyword, COUNT(*) as ang_count
                                     FROM (SELECT * 
                                           FROM Covid19RelatedTweets
                                           WHERE emotion LIKE "anger") AS A
                                     GROUP BY keyword
);


SELECT keyword, A.ang_count/T.kw_count AS proportion_angry
FROM AngryTweetsByKeyword AS A
     INNER JOIN TotalTweetsByKeyword AS T USING (keyword);

-- 11. What are the top ten keywords related to “covid” in covid-related tweets?
SELECT keyword, COUNT(*) as kw_count
FROM Covid19RelatedTweets
GROUP BY keyword
ORDER BY kw_count DESC;

-- 12. What is the proportion of people who hold negative attitude toward covid in each country?
DROP VIEW IF EXISTS TotalTweetsByCountry;
CREATE VIEW TotalTweetsByCountry AS ( SELECT A.country_name, COUNT(*) AS total_tweets
                                      FROM ( SELECT * 
                                             FROM PublishedIn
                                             WHERE country_name NOT LIKE "%-%") AS A
                                      GROUP BY country_name
);


DROP VIEW IF EXISTS NegTweetsByCountry;
CREATE VIEW NegTweetsByCountry AS (SELECT P.country_name, COUNT(*) as neg_count
                                   FROM (SELECT * 
                                         FROM Covid19RelatedTweets INNER JOIN PublishedIn USING(tweetID)
                                         WHERE sentiment LIKE "negative" AND  country_name NOT LIKE "%-%") AS P
                                   GROUP BY country_name
);

SELECT country_name, N.neg_count/T.total_tweets AS proportion_negative
FROM TotalTweetsByCountry AS T INNER JOIN NegTweetsByCountry AS N USING(country_name);

-- 13. How does the number of people who hold negative attitude toward covid change?
SELECT P.date_stamp, COUNT(*)
FROM (SELECT * 
      FROM Covid19RelatedTweets
      WHERE sentiment LIKE "negative") AS P
GROUP BY P.date_stamp
ORDER BY P.date_stamp;


-- 14. What is the average new cases per day of each country? What about the average new deaths per day?
SELECT country_name, AVG(new_cases) AS new_cases_per_day, AVG(new_deaths) AS new_deaths_per_day
FROM CasesByCountry
GROUP BY country_name;

-- 15. What is the total deaths divided by population of each country?
SELECT country_name, MAX(C1.total_deaths)/C.population AS death_divided_by_population
FROM CasesByCountry AS C1 LEFT OUTER JOIN Country AS C USING(country_name)
GROUP BY country_name;



