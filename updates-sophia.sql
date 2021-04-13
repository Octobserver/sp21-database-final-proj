
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