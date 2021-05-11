--- ShowRawScores.sql stored procedure 
--- You may have to call: mysql -h dbase.cs.jhu.edu -u 21sp_fxu13 -p < Hw4_ShowRawScores.sql
DELIMITER //


DROP PROCEDURE IF EXISTS ShowRawScores // 

CREATE PROCEDURE ShowRawScores(IN SSN VARCHAR(4)) 
BEGIN 
    IF EXISTS(SELECT * FROM Hw4_rawscores WHERE SSN = Hw4_rawscores.SSN) THEN
        SELECT SSN, LName, FName, Section, Quiz1, Quiz2, Quiz3, Quiz4, Test1, Test2, Test3
        FROM Hw4_rawscores
        WHERE SSN = Hw4_rawscores.SSN; 
    END IF; 
END; // 


DELIMITER ; 
