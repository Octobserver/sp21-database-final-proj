
<head><title>Question 3: Which country has hospitals with most equipped handwashing facility? </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 3: Which country has hospitals with most equipped handwashing facility? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL MostHandwashingCountry();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>country_name</td> <td>max_handwashing_count</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["country_name"]."</td>"; 
                echo "<td>".$row["max_handwashing_count"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q3_MostHandwashingCountry.sql failed 	<br>"; 
        }

    $conn->close(); 
?>

</body>