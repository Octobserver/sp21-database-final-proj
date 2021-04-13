-- Question 1: What is the total_cases_per_million for hospitals in each continent? 
SELECT continent, AVG(total_cases_per_million)
FROM Hospital 
GROUP BY continent;

-- Question 2:  How did the average death rate change before and after June 2020 in the world?
SELECT AVG2020.avg_2020 - AVG2021.avg_2021 
FROM 
        (SELECT AVG(total_cases_per_million) AS avg_2020
        FROM Hospital 
        WHERE DATEDIFF('2020-12-30', date) > 0) AS AVG2020, 
        (SELECT AVG(total_cases_per_million) AS avg_2021
        FROM Hospital 
        WHERE DATEDIFF('2020-12-30', date) < 0) AS AVG2021; 

-- Question 3: Which country has hospitals with most equipped handwashing facility? 
SELECT country_name, MAX(avg_handwashing)
FROM (SELECT country_name, AVG(handwashing_facilities) AS avg_handwashing
        FROM Hospital
        GROUP BY country_name) AS maxHandwashing; 


-- Question 4: List tested % of population in each country
SELECT H.country_name, H.total_tests / C.population 
FROM Hospital AS H JOIN 
     Country AS C ON H.country_name = C.country_name; 


-- Question 5: Which US state has gereatest decrease in spending on spend_healthcare_social_assistance? 
SELECT statefips, MIN(avg_health)
FROM (SELECT statefips, AVG(spend_healthcare_social_assistance) AS avg_health
      FROM Covid19RelatedSpending
      GROUP BY statefips) AS maxHealthIncrease;

-- Question 6: List the average change rate in each spending category in US? 
SELECT statefips, AVG(spend_accomodation_food) AS avg_food, AVG(spend_healthcare_social_assistance) AS avg_health, AVG(spend_arts_entertainment) AS avg_entertain, AVG(spend_grocery_food_store) AS avg_grocery
FROM Covid19RelatedSpending
GROUP BY statefips;

-- Question 7: Does low, middle or high income population in US change their spending habit the most in 2020? 
SELECT SUM(spend_all_inchigh) AS change_inchigh, SUM(spend_all_incmiddle) AS change_incmiddle, SUM(spend_all_inclow) as change_inclow
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
