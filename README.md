# database-phase-d
Name: Fanbo Xu (fxu13)
Name: Weina Dai (wdai11)

Difficulties: 
foreign constraints when creating table and dropping table

Updates Since Phase C:
We changed the schema of some tables (Hospital and HospitalLocatedIn) to adapt the data we found better. 
We also continued to clean up tables that we thought were not clean enough from last time, removing tuples with null values and repeated values.
Finally, we decided to the tuples "date_stamp" in all tables type VARCHAR to make our queries work. 

Modification:
- Add new dataset of US State Name and State Fips code from US Census Bureau. With the new dataset, I change the sql command for Q4 and A5 so that the statefips code is replaced by state name, improving user experience.
