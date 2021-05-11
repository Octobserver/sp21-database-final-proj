<head><title>Question 4: List decrease in spending on healthcare and social assistance spending for each US State? </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 4: List decrease in spending on healthcare and social assistance spending for each US State? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL StateHealthSpending();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>statefips</td> <td>avg_health</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>";
                echo "<td>".$row["statefips"]."</td>"; 
                echo "<td>".$row["avg_health"]."</td>"; 
                echo "</tr>";
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q5_StateHealthSpending.sql failed <br>"; 
        }

    $conn->close(); 
?>

</body>

