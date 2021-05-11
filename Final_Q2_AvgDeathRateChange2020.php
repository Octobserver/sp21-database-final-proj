
<head><title>Question 2:  How did the average death rate differ before and after June 2020 in the world?</title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 2: How did the average death rate differ before and after June 2020 in the world? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL AvgDeathRateChange2020();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>2020_to_2021_Change</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["2020_to_2021_Change"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q2_AvgDeathRateChange2020.sql failed 	<br>"; 
        }

    $conn->close(); 
?>

</body>