--- Final_Q5_StateHealthSpending.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS StateHealthSpending // 

CREATE PROCEDURE StateHealthSpending() 
BEGIN 
    SELECT stname, avg_health
	FROM (SELECT U.stname, AVG(spend_healthcare_social_assistance) AS avg_health
      FROM Covid19RelatedSpending AS C JOIN USStatefips AS U ON C.statefips = U.st 
      GROUP BY U.stname) AS HealthChange;
END; // 


DELIMITER ; 
