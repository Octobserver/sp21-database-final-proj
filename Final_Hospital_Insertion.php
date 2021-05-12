
<head><title> Adding report: Insert Data To Hospital Dataset </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Adding report: Insert Data To Hospital Dataset</h2><br>";

    echo "<br><br>"; 

    // INSERT INTO Hospital VALUES
    // we need to be sure that inserted tuple's country_name already exists in Country table!!! 
    // $sql = "INSERT INTO Hospital VALUES ('6999','CHE', 'Europe', 'Switzerland', '2020-10-19', 83159, 8737, 2138, 15, 9608.627, 1009.519, 1278530, 147.728, 0.163, NULL, 4.53)";
    
    $qry="SELECT * FROM Country WHERE country_name = '".$input_country."'"; 
//    $qry="SELECT * FROM Country WHERE country_name = 'Japan'";
    
    $result = $conn->query($qry);
    if (mysqli_num_rows($result) > 0) {
        $sql = "INSERT INTO Hospital VALUES(".$_POST['inputs'].")";

        if ($conn->query($sql) === TRUE) {
            echo "Record inserted successfully";
        } else {
            echo "Error inserting record: " . $conn->error;
        }
    } else {
        echo "Foreign Constriants country_name is not valid!!!";
    }

    
    $conn->close(); 
?>

</body>
