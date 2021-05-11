
<head><title>Question 5: List the average change rate in each spending category in US? </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 5: List the average change rate in each spending category in US? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL USSpendingChange();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>statefips</td> <td>avg_food</td> <td>avg_health</td> <td>avg_entertain</td> <td>avg_grocery</td></tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["statefips"]."</td>"; 
                echo "<td>".$row["avg_food"]."</td>"; 
                echo "<td>".$row["avg_health"]."</td>"; 
                echo "<td>".$row["avg_entertain"]."</td>"; 
                echo "<td>".$row["avg_grocery"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q6_USSpendingChange.sql failed 	<br>"; 
        }

    $conn->close(); 
?>

</body>
