--- Final_Q3_TestedPercentage.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS TestedPercentage // 

CREATE PROCEDURE TestedPercentage(IN Country VARCHAR(50)) 
BEGIN 
	IF EXISTS(SELECT * FROM Hospital WHERE Country = Hospital.country_name) THEN
	    SELECT H.country_name, H.total_tests / C.population AS tested_percentage
	    FROM Hospital AS H JOIN 
	    	 Country AS C ON H.country_name = C.country_name
	    WHERE Country =  H.country_name;  
	END IF; 
END; // 


DELIMITER ; 
