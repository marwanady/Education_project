<?php

include('./db_connection.php');
echo "<br>";

$id = $_GET['id'];
$sql = "DELETE FROM meetings where meeting_id='$id'";
$stmt=$conn->prepare($sql);
$stmt->execute();

 echo "record deleted";


 header("Location:./meetings.php");
 exit();
 




?>