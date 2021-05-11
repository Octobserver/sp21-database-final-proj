<head><title>Q1: Show Raw Scores</title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    //collect the posted 'SSN' 
    $SSN = $_POST['SSN']; 
    echo "<h2>Q1: Show Raw Scores</h2><br>";

    if (!empty($SSN)) {
        echo "<br><br>"; 

        // ?
	$result = $conn->query("CALL ShowRawScores('".$SSN."');");
	if ($result) {
        //if ($result = $conn->query("CALL ShowRawScores('".$SSN."');")) {
	    if (mysqli_num_rows($result) == 0) {
	       echo "ERROR: SSN ".$SSN." not found"; 
	    }
	    else {
            echo "<table border=\"2px solid black\">"; 
            echo "<tr> <td>SSN</td> <td>lname</td> <td>fname</td> <td>section</td> <td>quiz1</td> <td>quiz2</td> <td>quiz3</td> <td>quiz4</td> <td>test1</td> <td>test2</td> <td>test3</td> </tr>"; 
            foreach($result as $row) {
                echo "<tr>"; 
                echo "<td>".$row["SSN"]."</td>"; 
                echo "<td>".$row["LName"]."</td>"; 
                echo "<td>".$row["FName"]."</td>"; 
                echo "<td>".$row["Section"]."</td>"; 
                echo "<td>".$row["Quiz1"]."</td>"; 
                echo "<td>".$row["Quiz2"]."</td>"; 
                echo "<td>".$row["Quiz3"]."</td>"; 
                echo "<td>".$row["Quiz4"]."</td>"; 
                echo "<td>".$row["Test1"]."</td>"; 
                echo "<td>".$row["Test2"]."</td>"; 
                echo "<td>".$row["Test3"]."</td>"; 
                echo "</tr>"; 
            }
            echo "</table>";
	    }
        } else {
            echo "Call to ShowRawScores.sql failed <br>"; 
        }
    } else {
        echo "not set"; 
    }
    $conn->close(); 
?>

</body>