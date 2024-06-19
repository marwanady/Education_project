<?php

include('./db_connection.php');
echo "<br>";

$id=$_GET['id'];
$sql="DELETE FROM `categories` where `category_id`='$id'";
$stmt=$conn->prepare($sql);
$stmt->execute();
//echo "record deleted";
header("Location:./categories.php");
exit();



?>