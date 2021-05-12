--- Final_Q10_NegTweetChange.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS NegTweetChange // 

CREATE PROCEDURE NegTweetChange() 
BEGIN 
    SELECT P.date_stamp, COUNT(*) AS neg_tweet_count
	FROM (SELECT * 
	      FROM Covid19RelatedTweets
	      WHERE sentiment LIKE "negative") AS P
	GROUP BY P.date_stamp
	ORDER BY P.date_stamp;
END; // 

DELIMITER ; 
