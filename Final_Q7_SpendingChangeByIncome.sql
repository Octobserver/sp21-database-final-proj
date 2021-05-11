--- Final_Q7_SpendingChangeByIncome.sql stored procedure 

DELIMITER //

DROP PROCEDURE IF EXISTS USSpendingChange // 

CREATE PROCEDURE USSpendingChange() 
BEGIN 
    SELECT SUM(spend_all_inchigh) AS change_high_income, SUM(spend_all_incmiddle) AS change_middle_income, SUM(spend_all_inclow) as change_low_income
	FROM Covid19RelatedSpending;

	SELECT MAX(change_spending) AS max_change_spending
	FROM (
        SELECT SUM(spend_all_inchigh) AS change_spending
        FROM Covid19RelatedSpending
        UNION 
        SELECT SUM(spend_all_incmiddle) AS change_spending
        FROM Covid19RelatedSpending
        UNION 
        SELECT SUM(spend_all_inclow) AS change_spending
        FROM Covid19RelatedSpending ) AS T;
END; // 


DELIMITER ; 
