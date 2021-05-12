
<head><title>Question 10: How does the number of people who hold negative attitude toward covid change? </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 10: How does the number of people who hold negative attitude toward covid change? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL NegTweetChange();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>date_stamp</td> <td>neg_tweet_count</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["date_stamp"]."</td>"; 
                echo "<td>".$row["neg_tweet_count"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q10_NegTweetChange.sql failed 	<br>"; 
        }

    $conn->close(); 
?>

</body>
