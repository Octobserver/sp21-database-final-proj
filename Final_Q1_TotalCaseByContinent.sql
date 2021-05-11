--- Final_Q1_TotalCaseByContinent.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS TotalCaseByContinent // 

CREATE PROCEDURE TotalCaseByContinent() 
BEGIN 
    SELECT continent, SUM(total_cases_per_million) AS total_cases
    FROM Hospital
    GROUP BY continent;
END; // 


DELIMITER ; 
