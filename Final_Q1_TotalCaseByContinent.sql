--- Final_Q1_TotalCaseByContinent.sql stored procedure 
--- You may have to call: mysql -h dbase.cs.jhu.edu -u 21sp_fxu13 -p < Final_Q1_TotalCaseByContinent.sql
DELIMITER //


DROP PROCEDURE IF EXISTS TotalCaseByContinent // 

CREATE PROCEDURE TotalCaseByContinent() 
BEGIN 
    SELECT continent, SUM(total_cases_per_million) AS total_cases
	FROM Hospital 
	GROUP BY continent;
END; // 


DELIMITER ; 
