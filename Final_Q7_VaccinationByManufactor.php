
<head><title>Question 7: For each different COVID vaccine, how many people have gotten it? </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 7: For each different COVID vaccine, how many people have gotten it? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL VaccinationByManufactor();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>vaccine_type</td> <td>total_vaccinated</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["vaccine_type"]."</td>"; 
                echo "<td>".$row["total_vaccinated"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q7_VaccinationByManufactor.sql failed 	<br>"; 
        }

    $conn->close(); 
?>

</body>
