--- Final_Q8_VaccinationByCountry.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS VaccinationByCountry // 

CREATE PROCEDURE VaccinationByCountry() 
BEGIN 
    SELECT country_name, SUM(total_vaccinations) AS total_vaccinations, SUM(people_fully_vaccinated) AS people_fully_vaccinated
	FROM VaccinationByCountry
	GROUP BY country_name;
END; // 

DELIMITER ; 
