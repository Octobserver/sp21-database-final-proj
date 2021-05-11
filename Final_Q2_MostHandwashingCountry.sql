--- Final_Q2_MostHandwashingCountry.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS MostHandwashingCountry // 

CREATE PROCEDURE MostHandwashingCountry() 
BEGIN 
    SELECT country_name, MAX(avg_handwashing) AS max_handwashing_count
	FROM (SELECT country_name, AVG(handwashing_facilities) AS avg_handwashing
        FROM Hospital
        GROUP BY country_name) AS maxHandwashing; 
END; // 


DELIMITER ; 
