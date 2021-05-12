
<head><title> Adding report: Insert Data To Hospital Dataset </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Adding report: Insert Data To Hospital Dataset</h2><br>";

    echo "<br><br>"; 

    // $sql = "DELETE FROM Hospital WHERE reportID =".$_POST['input_reportID'];
    // $sql = "DELETE FROM Hospital WHERE reportID = '$input_reportID' ";
    // INSERT INTO Hospital VALUES
    // $sql = "INSERT INTO Hospital VALUES ('6999','CHE', 'Europe', 'Switzerland', '2020-10-19', 83159, 8737, 2138, 15, 9608.627, 1009.519, 1278530, 147.728, 0.163, NULL, 4.53)";
    $sql = "INSERT INTO Hospital VALUES(".$_POST['inputs'].);

    if ($conn->query($sql) === TRUE) {
        echo "Record inserted successfully";
    } else {
        echo "Error inserting record: " . $conn->error;
    }
    $conn->close(); 
?>

</body>

===
