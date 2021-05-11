
<head><title>Question 1: What is the total cases per million for hospitals in each continent?</title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 1: What is the total cases per million for hospitals in each continent? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL TotalCaseByContinent();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>continent</td> <td>total_cases</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["continent"]."</td>"; 
                echo "<td>".$row["total_cases"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q1_TotalCaseByContinent.sql failed <br>"; 
        }

    $conn->close(); 
?>

</body>