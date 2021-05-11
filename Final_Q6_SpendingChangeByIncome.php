
<head><title>Question 6: Does low, middle or high income population in US change their spending habit the most in 2020?  </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Question 6: Does low, middle or high income population in US change their spending habit the most in 2020? </h2><br>";

    echo "<br><br>"; 
	$result = $conn->query("CALL USSpendingChange();");
	if ($result) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: result table not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>change_high_income</td> <td>change_middle_income</td> <td>change_low_income</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["change_high_income"]."</td>"; 
                echo "<td>".$row["change_middle_income"]."</td>"; 
                echo "<td>".$row["change_low_income"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to Final_Q6_SpendingChangeByIncome.sql failed 	<br>"; 
        }

    $conn->close(); 
?>

</body>
