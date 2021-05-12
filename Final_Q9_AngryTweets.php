
<head><title>Question 9: What is the proportion of tweets that show anger associated with each keyword?  </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>QQuestion 9: What is the proportion of tweets that show anger associated with each keyword? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL AngryTweets();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>keyword</td> <td>proportion_angry</td></tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["keyword"]."</td>"; 
                echo "<td>".$row["proportion_angry"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q9_AngryTweets.sql failed 	<br>"; 
        }

    $conn->close(); 
?>

</body>
