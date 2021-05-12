CREATE TABLE Country(
 country_name   VARCHAR(30),
 location       VARCHAR(30),
 continent      VARCHAR(30), 
 population     LONG,
 PRIMARY KEY(country_name)
);

LOAD DATA LOCAL INFILE '/Users/Weina/Desktop/DB Project/Country.txt' 
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

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Downloads/db_phasec/hospital.txt' 
INTO TABLE Hospital
IGNORE 1 ROWS;

CREATE TABLE HospitalLocatedIn (
  iso_code                             VARCHAR(30),
  country_name                             VARCHAR(30),
  PRIMARY KEY(iso_code),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);

CREATE TABLE Covid19RelatedSpending(
  month                                   INT,
  day                                     INT, 
  statefips                               INT,
  spend_accomodation_food                 DECIMAL(10,1),
  spend_arts_entertainment                DECIMAL(10,1),
  spend_all                               DECIMAL(10,1),
  spend_general_merchandise               DECIMAL(10,1),
  spend_grocery_food_store                DECIMAL(10,1), 
  spend_healthcare_social_assistance      DECIMAL(10,1), 
  spend_all_inchigh                       DECIMAL(10,1), 
  spend_all_inclow                        DECIMAL(10,1), 
  spend_all_incmiddle                     DECIMAL(10,1),
  PRIMARY KEY(statefips)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Downloads/db_phasec/Covid19RelatedSpending.txt' 
INTO TABLE Covid19RelatedSpending
IGNORE 1 ROWS;

CREATE TABLE Covid19RelatedSpendingByCountry(
  statefips                            INT,
  country_name                         VARCHAR(30),
  PRIMARY KEY(statefips),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);


DROP TABLE IF EXISTS USStatefips; 
CREATE TABLE USStatefips(
  stname                                 VARCHAR(30),
  st                                     INT,
  stusps                                 VARCHAR(5),
  PRIMARY KEY(st)
);
LOAD DATA LOCAL INFILE '/Users/sophiaxu/Desktop/Database/sp21-database-final-proj/us-state-ansi-fips.txt' 
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


LOAD DATA LOCAL INFILE '/Users/Weina/Desktop/DB Project/Covid19RelatedTweets.txt' 
INTO TABLE Covid19RelatedTweets
IGNORE 1 ROWS;


CREATE TABLE PublishedIn (
  tweetID       VARCHAR(30),
  country_name    VARCHAR(30),
  PRIMARY KEY(tweetID),
  FOREIGN KEY(tweetID) REFERENCES Covid19RelatedTweets(tweetID),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);

LOAD DATA LOCAL INFILE '/Users/Weina/Desktop/DB Project/PublishedIn.txt' 
INTO TABLE PublishedIn
IGNORE 1 ROWS;


CREATE TABLE Vaccine(
 vaccine_type VARCHAR(30),
 PRIMARY KEY(vaccine_type)
);

LOAD DATA LOCAL INFILE '/Users/Weina/Desktop/DB Project/Vacc.txt' 
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

LOAD DATA LOCAL INFILE '/Users/Weina/Desktop/DB Project/CaseByCountry.txt' 
INTO TABLE CasesByCountry
IGNORE 1 ROWS;

CREATE TABLE VaccinationByManufacturer(
  country_name       VARCHAR(30),
  date_stamp     VARCHAR(30),
  vaccine_type      VARCHAR(30),
  total_vaccinations       LONG,
  PRIMARY KEY(country_name, vaccine_type, date_stamp),
  FOREIGN KEY(vaccine_type) REFERENCES Vaccine(vaccine_type),
  FOREIGN KEY(country_name) REFERENCES Country(country_name)
);

LOAD DATA LOCAL INFILE '/Users/Weina/Desktop/DB Project/VaccByManufacturer.txt' 
INTO TABLE VaccinationByManufacturer
IGNORE 1 ROWS;


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

LOAD DATA LOCAL INFILE '/Users/Weina/Desktop/DB Project/VaccByCountry.txt' 
INTO TABLE VaccinationByCountry
IGNORE 1 ROWS;
