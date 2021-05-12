--- Final_Q9_AngryTweets stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS AngryTweets // 

CREATE PROCEDURE AngryTweets() 
BEGIN 
    CREATE VIEW TotalTweetsByKeyword AS ( SELECT keyword, COUNT(*) as kw_count
                                      FROM Covid19RelatedTweets
                                      GROUP BY keyword
	);


	CREATE VIEW AngryTweetsByKeyword AS (SELECT A.keyword, COUNT(*) as ang_count
	                                     FROM (SELECT * 
	                                           FROM Covid19RelatedTweets
	                                           WHERE emotion LIKE "anger") AS A
	                                     GROUP BY keyword
	);


	SELECT keyword, A.ang_count/T.kw_count AS proportion_angry
	FROM AngryTweetsByKeyword AS A
	     INNER JOIN TotalTweetsByKeyword AS T USING (keyword);
	     
END; // 

DELIMITER ; 


