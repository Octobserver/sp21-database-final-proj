
<head><title>Question 3: Find tested % of population given country name</title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    //collect the posted 'Country' 
    $Country = $_POST['Country']; 
    echo "<h2>Question 3: Find tested % of population given country name </h2><br>";

    if (!empty($SSN)) { 
        echo "<br><br>"; 
    	$result = $conn->query("CALL TestedPercentage();");
    	if ($result) {
    	    if (mysqli_num_rows($result) == 0) {
    	       echo "ERROR: result table not found"; 
    	    }
    	    else {
                echo "<table border=\"2px solid black\">"; 
                echo "<tr> <td>country_name</td> <td>tested_percentage</td> </tr>"; 
                foreach($result as $row) {
                    echo "<tr>"; 
                    echo "<td>".$row["country_name"]."</td>"; 
                    echo "<td>".$row["tested_percentage"]."</td>"; 
                    echo "</tr>"; 
                }
                echo "</table>";
    	    }
            } else {
                echo "Call to Final_Q4_TestedPercentage.sql failed 	<br>"; 
            }
        } else {
        echo "not set"; 
    }
    $conn->close(); 
?>

</body>

