-- Hw4_grades.sql

DROP TABLE IF EXISTS Hw4_rawscores;

CREATE TABLE Hw4_rawscores(
        SSN	VARCHAR(4) PRIMARY KEY,
        LName   VARCHAR(11),
        FName   VARCHAR(11),
        Section VARCHAR(2),
	Quiz1   DECIMAL(5,2),
	Quiz2	DECIMAL(5,2),
	Quiz3	DECIMAL(5,2),
	Quiz4   DECIMAL(5,2),
	Test1   DECIMAL(5,2),
	Test2   DECIMAL(5,2),
	Test3 	DECIMAL(5,2)
);

INSERT INTO Hw4_rawscores VALUES ('9176', 'Epp',     'Eric',   '02',   30,   27,   39, NULL,  99, 79,  93);
INSERT INTO Hw4_rawscores VALUES ('5992', 'Lundin',  'Klaraa', '01',   30,   27,   36,   48,  98, 71,  82);
INSERT INTO Hw4_rawscores VALUES ('3774', 'Adamu',   'Musa',   '01',   28, NULL,   37,   37,  85, 76,  91); 
INSERT INTO Hw4_rawscores VALUES ('1212', 'Farooqi', 'Nasrin', '01',   26,   25,   35,   36,  86, 77,  86);
INSERT INTO Hw4_rawscores VALUES ('4198', 'Wilson',  'Amanda', '02',   30,   26,   32, NULL,  84, 73,  79);
INSERT INTO Hw4_rawscores VALUES ('1006', 'Nielsen', 'Rowan',  '02',   29,   19, NULL,   29,  93, 76,  95);
INSERT INTO Hw4_rawscores VALUES ('8213', 'Navarro', 'Zoila',  '03',   29,   30,    0,   45, 100, 80,  97);
INSERT INTO Hw4_rawscores VALUES ('1180', 'Qin',     'Dongmei','03',   20,   29,   40,   42,  50, 40,  88);
INSERT INTO Hw4_rawscores VALUES ('8888', 'Skipper', 'ImaQuiz','02', NULL, NULL, NULL, NULL, 100, 80, 100);

INSERT INTO Hw4_rawscores VALUES ('TOTL', 'TOTAL',   'POINTS', 'TP', 30,   30,   40,   50, 100, 80, 100);


DROP TABLE IF EXISTS Hw4_passwords;
CREATE TABLE Hw4_passwords (
  CurPasswords  VARCHAR(15)
);

INSERT INTO Hw4_passwords VALUES ('OpenSesame');
INSERT INTO Hw4_passwords VALUES ('GuessMe');
INSERT INTO Hw4_passwords VALUES ('ImTheTA');
