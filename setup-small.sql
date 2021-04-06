DROP TABLE IF EXISTS Hospital;
CREATE TABLE Hospital (
  state                                                    VARCHAR(5),
  total_num_hospital                                       INT, 
  critical_staffing_shortage_anticipated_within_week_yes   INT,
  inpatient_beds                                           INT, 
  inpatient_beds_used                                      INT, 
  inpatient_beds_used_covid                                INT, 
  previous_day_admission_adult_covid_confirmed             INT,  
  total_adult_patients_hospitalized_confirmed_and_suspected_covid INT, 
  total_staffed_adult_icu_beds                             INT, 
  inpatient_beds_utilization                               DECIMAL(10,1), 
  percent_of_inpatients_with_covid                         DECIMAL(10,1), 
  PRIMARY KEY(state)
);

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Downloads/db_phasec/small-hospital.csv' 
INTO TABLE Hospital
COLUMNS TERMINATED BY ','
LINES STARTING BY '\n';

DROP TABLE IF EXISTS SpendingByState; 
CREATE TABLE SpendingByState (
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

LOAD DATA LOCAL INFILE '/Users/sophiaxu/Downloads/db_phasec/small-SpendingByState.csv' 
INTO TABLE SpendingByState
COLUMNS TERMINATED BY ','
LINES STARTING BY '\n';
