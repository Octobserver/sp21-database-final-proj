--- Final_Q6_USSpendingChange.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS USSpendingChange // 

CREATE PROCEDURE USSpendingChange() 
BEGIN 
    SELECT stname, AVG(spend_accomodation_food) AS avg_food, AVG(spend_healthcare_social_assistance) AS avg_health, AVG(spend_arts_entertainment) AS avg_entertain, AVG(spend_grocery_food_store) AS avg_grocery
	FROM Covid19RelatedSpending AS C JOIN USStatefips AS U ON C.statefips = U.st 
	GROUP BY U.stname;
END; // 


DELIMITER ; 
