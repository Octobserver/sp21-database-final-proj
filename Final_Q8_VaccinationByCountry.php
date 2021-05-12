
<head><title>Question 8: What is the total number of vaccinations and total number of people fully vaccinated, in each different country?  </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 8: What is the total number of vaccinations and total number of people fully vaccinated, in each different country? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL VaccinationByCountry();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>country_name</td> <td>total_vaccinations</td> <td>people_fully_vaccinated</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["country_name"]."</td>"; 
                echo "<td>".$row["total_vaccinations"]."</td>"; 
                echo "<td>".$row["people_fully_vaccinated"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q8_VaccinationByCountry.sql failed 	<br>"; 
        }

    $conn->close(); 
?>

</body>
