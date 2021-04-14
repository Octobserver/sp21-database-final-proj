
-- INSERTION To Hospital --- 


INSERT INTO Hospital VALUES
('1000', 'ALB', 'North America', 'US', '2020-12-13', 48530, 788, 1003, 14, 16863.576, 273.82, 206292, 71.684, 0.314, NULL, 2.89), 
('69676','CHE', 'Europe', 'Switzerland', '2020-10-19', 83159, 8737, 2138, 15, 9608.627, 1009.519, 1278530, 147.728, 0.163, NULL, 4.53); 


-- INSERTION To HospitalLocatedIn --- 

INSERT INTO HospitalLocatedIn VALUES 
('1000', 'US'); 


INSERT INTO Country VALUES
('Switzerland', 'Switzerland', 'Europe', 8654618); 	
INSERT INTO HospitalLocatedIn VALUES 
('69676', 'Switzerland'); 

-- DELETE from Hopstial -- 

DELETE FROM Hospital 
WHERE reportID = '1000'; 

-- DELETE from HospitalLocatedIn -- 
DELETE FROM HospitalLocatedIn
WHERE reportID = '1000'; 

DELETE FROM HospitalLocatedIn
WHERE reportID = '69676'; 

DELETE FROM Country 
WHERE country_name = 'Switzerland'; 


--- Insert to Covid19RelatedSpending --- 
--- Insert to Covid19RelatedSpending (only US since Spending Data is US only)--- 

INSERT INTO Covid19RelatedSpending VALUES
('110', 1, 15, 13, -0.00277, 0.141, 0.00596, -0.0207, -0.0101, 0.026, -0.0116, -0.00348, 0.021, 0.00762);
INSERT INTO Covid19RelatedSpendingByCountry VALUES 
('110', 'US'); 

-- Delete from Covid19RelatedSpending ---
DELETE FROM Covid19RelatedSpending 
WHERE reportID = '110'; 

-- Delete from Covid19RelatedSpending ---
DELETE FROM Covid19RelatedSpendingByCountry 
WHERE reportID = '110'; 


-- Insert into Covid19RelatedTweets 
INSERT INTO Covid19RelatedTweets VALUES
('1222120727333220011', '2811354678', 0.335, 0.678, 0.612, 0.233, 'negative', 'fear', 'wuhan', '2020-04-30'); 
-- Insert into Covid19RelatedTweets with at least one of the values in the new tuple doesn’t reference an existing tuple in another table.

-- Insert into PublishedIn with all values in the new tuple corresponding to foreign keys reference existing tuples in the other tables.
INSERT INTO PublishedIn VALUES
('1222120727333220011', 'Switzerland');

-- Insert into PublishedIn with at least one of the values in the new tuple doesn’t reference an existing tuple in another table.
INSERT INTO Covid19RelatedTweets VALUES
('8222120727333220011', '5911354678', 0.375, 0.571, 0.692, 0.254, 'negative', 'fear', 'wuhan', '2020-04-30'); 
INSERT INTO PublishedIn VALUES
('8222120727333220011', 'Neverland'); 

--  Insert into CasesByCountry with all values in the new tuple corresponding to foreign keys reference existing tuples in the other tables.
INSERT INTO CasesByCountry VALUES
('4/28/21', 'Afghanistan', 100, 28, 10000,568);

--  Insert into CasesByCountry with with at least one of the values in the new tuple doesn’t reference an existing tuple in another table.
-- I have to make up a country because the Country table contains all real countries in the world.
INSERT INTO Country VALUES
('Funland', 'Funland', 'Fun', 2500);
INSERT INTO CasesByCountry VALUES
('3/28/21', 'Funland', 100, 28, 10000,568);

--  Insert into VaccinationByCountry with all values in the new tuple corresponding to foreign keys reference existing tuples in the other tables.
INSERT INTO VaccinationByCountry VALUES
('Australia',	'2021-04-26', 182437, 12504, 0.72, 490, 2.73, 267);

--  Insert into VaccinationByCountry with at least one of the values in the new tuple doesn’t reference an existing tuple in another table.
-- I have to make up a country because the Country table contains all real countries in the world
INSERT INTO Country VALUES
('Dreamland', 'Dreamland', 'Dream', 6500);
INSERT INTO VaccinationByCountry VALUES
('Dreamland',	'2021-03-26', 182437, 12504, 0.72, 490, 2.73, 267);

--  Insert into VaccinationByManufacturer with all values in the new tuple corresponding to foreign keys reference existing tuples in the other tables.
INSERT INTO VaccinationByManufacturer VALUES
('Australia',	'2021-04-26', 'Pfizer/BioNTech', 9650);

--  Insert into VaccinationByManufacturer with at least one of the values in the new tuple doesn’t reference an existing tuple in another table.
-- I have to make up a country because the Country table contains all real countries in the world
INSERT INTO Country VALUES
('Goldland', 'Goldland', 'Gold', 6500);
INSERT INTO VaccinationByManufacturer VALUES
('Goldland', '2021-03-26', 'Pfizer/BioNTech', 9650);

INSERT INTO Vaccine VALUES
('newVacc');
INSERT INTO VaccinationByManufacturer VALUES
('Goldland', '2021-03-26', 'newVacc', 9650);


-- Delete (first from tables with foreign key contraints then from tables without)
DELETE FROM VaccinationByManufacturer
WHERE country_name = 'Germany' OR vaccine_type = 'Pfizer/BioNTech';

DELETE FROM VaccinationByCountry 
WHERE country_name = 'Germany';

DELETE FROM CasesByCountry
WHERE country_name = 'Germany';

DELETE FROM PublishedIn
WHERE country_name = 'Germany' OR tweetID = '1342716218566910000';

DELETE FROM Country
WHERE country_name = 'Germany';

DELETE FROM Covid19RelatedTweets
WHERE tweetID = '1342716218566910000';

DELETE FROM Vaccine
WHERE vaccine_type = 'Pfizer/BioNTech';

