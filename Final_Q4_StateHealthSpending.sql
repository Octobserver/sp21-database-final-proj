--- Final_Q5_StateHealthSpending.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS StateHealthSpending // 

CREATE PROCEDURE StateHealthSpending() 
BEGIN 
    SELECT statefips, avg_health
	FROM (SELECT statefips, AVG(spend_healthcare_social_assistance) AS avg_health
      FROM Covid19RelatedSpending
      GROUP BY statefips) AS maxHealthIncrease; 
END; // 


DELIMITER ; 
