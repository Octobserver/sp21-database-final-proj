--- Final_Q2_AvgDeathRateChange2020.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS AvgDeathRateChange2020 // 

CREATE PROCEDURE AvgDeathRateChange2020() 
BEGIN 
    SELECT AVG2020.avg_2020 - AVG2021.avg_2021 AS 2020_to_2021_Change
	FROM
        (SELECT AVG(total_cases_per_million) AS avg_2020
        FROM Hospital 
        WHERE DATEDIFF('2020-12-30', date) > 0) AS AVG2020, 
        (SELECT AVG(total_cases_per_million) AS avg_2021
        FROM Hospital 
        WHERE DATEDIFF('2020-12-30', date) < 0) AS AVG2021; 
END; // 


DELIMITER ; 
