--- Final_Q7_VaccinationByManufactorsql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS VaccinationByManufactor // 

CREATE PROCEDURE VaccinationByManufactor() 
BEGIN 
    SELECT M.vaccine_type, SUM(M.total_vaccinations) AS total_vaccinated
	FROM VaccinationByManufacturer AS M 
        	LEFT OUTER JOIN Vaccine AS V ON M.vaccine_type = V.vaccine_type
	GROUP BY M.vaccine_type;
END; // 

DELIMITER ; 
