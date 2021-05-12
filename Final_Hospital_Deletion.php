
<head><title> Delete Data From Hospital Dataset </title> </head>
<body>
<?php
    //open a connection to dbase server 
    include 'open.php'; 

    echo "<h2>Delete Data From Hospital Dataset</h2><br>";

    echo "<br><br>"; 

    // $result = $conn->query("DELETE FROM Hospital WHERE reportID = '$input_reportID';");
    // $sql = "DELETE FROM Hospital WHERE reportID = " .$_POST[''];
    // $result = $conn->query("DELETE FROM Hospital WHERE reportID = $input_reportID;");
    // $myQuery = "DELETE FROM Hospital WHERE reportID = $input_reportID;";
    // if ($result) {
    //       echo "Deleted!"
    //	} else {
    //    echo "Call of query to delete  Hospital Data fails  <br>"; 
    //}

    // sql to delete a record
    $sql = "DELETE FROM Hospital WHERE reportID = 10;

    if ($conn->query($sql) === TRUE) {
      echo "Record deleted successfully";
      } else {
      echo "Error deleting record: " . $conn->error;
      }

    $conn->close(); 
?>

</body>