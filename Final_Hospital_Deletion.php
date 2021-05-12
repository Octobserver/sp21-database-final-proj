
<head><title> Delete Data From Hospital Dataset </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Delete Data From Hospital Dataset</h2><br>";

    echo "<br><br>"; 
    $result = $conn->query("DELETE FROM Hospital WHERE reportID = '".$input_reportID."';");
    if ($result) {
        if (mysqli_num_rows($result) == 0) {
           echo "ERROR: tuple not found"; 
        }
    } else {
        echo "Call of query to delte Hospital Data fails  <br>"; 
    }

    $conn->close(); 
?>

</body>