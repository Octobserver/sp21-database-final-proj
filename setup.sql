DROP TABLE IF EXISTS Country;
CREATE TABLE Country(
 country_name   VARCHAR(50),
 location       VARCHAR(30),
 continent      VARCHAR(30), 
 population     LONG,
 PRIMARY KEY(country_name)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Downloads/db_phasec/Country.txt' 
INTO TABLE Country
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Hospital;
CREATE TABLE Hospital (
  iso_code                            VARCHAR(30),
  continent                           VARCHAR(30),
  location                            VARCHAR(30),
  date                                DATETIME DEFAULT CURRENT_TIMESTAMP(), 
  total_cases                         INTEGER, 
  new_cases                           INTEGER, 
  total_deaths                        INTEGER,  
  new_deaths                          INTEGER, 
  total_cases_per_million             DECIMAL(10,1), 
  new_cases_per_million               DECIMAL(10,1), 
  total_tests                         DECIMAL(10,1), 
  total_tests_per_thousand            DECIMAL(10,1),
  positive_rate                       DECIMAL(10,1),
  handwashing_facilities              DECIMAL(10,1),
  hospital_beds_per_thousand          DECIMAL(10,1),
  PRIMARY KEY(iso_code)
);

DROP TABLE IF EXISTS HospitalLocatedIn;
CREATE TABLE HospitalLocatedIn (
  iso_code                             VARCHAR(30),
  location                             VARCHAR(30),
  PRIMARY KEY(iso_code),
  FOREIGN KEY(location) REFERENCES Country(location)
);


LOAD DATA LOCAL INFILE '/Users/sophiaxu/Downloads/db_phasec/hospital.txt' 
INTO TABLE Hospital
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Covid19RelatedSpending; 
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

DROP TABLE IF EXISTS Covid19RelatedSpendingByCountry; 
CREATE TABLE Covid19RelatedSpendingByCountry(
  statefips                            INT,
  location                             VARCHAR(30),
  PRIMARY KEY(statefips),
  FOREIGN KEY(location) REFERENCES Country(location)
);
