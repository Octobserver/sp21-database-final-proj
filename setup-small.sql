-- clean up the tables
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS VaccinationByCountry;
DROP TABLE IF EXISTS VaccinationByManufacturer;
DROP TABLE IF EXISTS CasesByCountry;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS Vaccine;
DROP TABLE IF EXISTS PublishedIn;
DROP TABLE IF EXISTS Covid19RelatedTweets;
DROP TABLE IF EXISTS Hospital;
DROP TABLE IF EXISTS HospitalLocatedIn;
DROP TABLE IF EXISTS SpendingByState;
DROP TABLE IF EXISTS Covid19RelatedSpending; 
DROP TABLE IF EXISTS Covid19RelatedSpendingByCountry; 
DROP TABLE IF EXISTS USStatefips; 
SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE Country(
 country_name   VARCHAR(50),
 location       VARCHAR(30),
 continent      VARCHAR(30), 
 population     LONG,
 PRIMARY KEY(country_name)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/Country-small.txt' 
INTO TABLE Country
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Hospital;
CREATE TABLE Hospital (
  reportID                            VARCHAR(30),
  continent                           VARCHAR(30),
  country_name                        VARCHAR(30),
  date                                DATETIME DEFAULT CURRENT_TIMESTAMP(), 
  total_cases_per_million             DECIMAL(10,1), 
  total_tests                         DECIMAL(10,1), 
  handwashing_facilities              DECIMAL(10,1),
  PRIMARY KEY(reportID), 
  FOREIGN KEY(country_name) REFERENCES Country(country_name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE HospitalLocatedIn (
  reportID                             VARCHAR(30),
  country_name                         VARCHAR(30),
  PRIMARY KEY(reportID),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);


LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/hospital-small.txt' 
INTO TABLE Hospital
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Covid19RelatedSpending; 
CREATE TABLE Covid19RelatedSpending(
  reportID                                VARCHAR(30),
  month                                   INT,
  day                                     INT, 
  statefips                               INT,
  spend_accomodation_food                 DECIMAL(10,1),
  spend_arts_entertainment                DECIMAL(10,1),
  spend_all                               DECIMAL(10,1),
  spend_general_merchandise               DECIMAL(10,1),
  spend_grocery_food_store                DECIMAL(10,1), 
  spend_healthcare_social_assistance      DECIMAL(10,1), 
  spend_transportation_warehousing        DECIMAL(10,1), 
  spend_all_inchigh                       DECIMAL(10,1), 
  spend_all_inclow                        DECIMAL(10,1), 
  spend_all_incmiddle                     DECIMAL(10,1),
  PRIMARY KEY(reportID)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/Covid19RelatedSpending-small.txt' 
INTO TABLE Covid19RelatedSpending
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Covid19RelatedSpendingByCountry; 
CREATE TABLE Covid19RelatedSpendingByCountry(
  reportID                                 VARCHAR(30),
  country_name                             VARCHAR(30),
  PRIMARY KEY(reportID),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);


DROP TABLE IF EXISTS USStatefips; 
CREATE TABLE USStatefips(
  stname                                 VARCHAR(30),
  st                                     INT,
  stusps                                 VARCHAR(5),
  PRIMARY KEY(st)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/us-state-ansi-fips-small.txt' 
INTO TABLE USStatefips
IGNORE 1 ROWS;

CREATE TABLE Covid19RelatedTweets(
  tweetID  VARCHAR(30),
  userID    VARCHAR(30) NOT NULL,
  anger_intensity       DECIMAL(5,3),
  fear_intensity       DECIMAL(5,3),
  sadness_intensity       DECIMAL(5,3),
  joy_intensity       DECIMAL(5,3),
  sentiment     VARCHAR(30),
  emotion       VARCHAR(30),
  keyword       VARCHAR(30),
  date_stamp    DATETIME DEFAULT CURRENT_TIMESTAMP(), 
  PRIMARY KEY(tweetID)
);


LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/Covid19RelatedTweets-small.txt' 
INTO TABLE Covid19RelatedTweets
IGNORE 1 ROWS;


CREATE TABLE PublishedIn (
  tweetID       VARCHAR(30),
  country_name    VARCHAR(30),
  PRIMARY KEY(tweetID),
  FOREIGN KEY(tweetID) REFERENCES Covid19RelatedTweets(tweetID),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/PublishedIn-small.txt' 
INTO TABLE PublishedIn
IGNORE 1 ROWS;


CREATE TABLE Vaccine(
 vaccine_type VARCHAR(30),
 PRIMARY KEY(vaccine_type)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/Vacc-small.txt' 
INTO TABLE Vaccine
IGNORE 1 ROWS;

CREATE TABLE CasesByCountry(
 date_stamp 	VARCHAR(30), 
 country_name	VARCHAR(30), 
 new_cases	INTEGER,
 new_deaths	INTEGER,
 total_cases	INTEGER,
 total_deaths   INTEGER,
 PRIMARY KEY(country_name, date_stamp),
 FOREIGN KEY(country_name) REFERENCES Country(country_name)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/CaseByCountry-small.txt' 
INTO TABLE CasesByCountry
IGNORE 1 ROWS;

CREATE TABLE VaccinationByManufacturer(
  country_name       VARCHAR(30),
  date_stamp        VARCHAR(30),
  vaccine_type      VARCHAR(30),
  total_vaccinations       LONG,
  PRIMARY KEY(country_name, vaccine_type, date_stamp),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/VaccByManufacturer-small.txt' 
INTO TABLE VaccinationByManufacturer
IGNORE 1 ROWS;

select * from VaccinationByManufacturer;

CREATE TABLE VaccinationByCountry(
  country_name       VARCHAR(30),
  date_stamp     VARCHAR(30),
  total_vaccinations    INTEGER,	
  people_fully_vaccinated       INTEGER,	
  daily_vaccinations    INTEGER,
  total_vaccinations_per_hundred        DECIMAL(5,2),
  people_fully_vaccinated_per_hundred   DECIMAL(5,2),	
  daily_vaccinations_per_million        INTEGER,
  PRIMARY KEY(country_name, date_stamp),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/VaccByCountry-small.txt' 
INTO TABLE VaccinationByCountry
IGNORE 1 ROWS;