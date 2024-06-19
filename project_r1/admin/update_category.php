<?php
include('./db_connection.php');

if(isset($_POST['update'])){
	$cat=$_POST['category'];
    $id=$_POST['id'];

	if(!empty($cat)){
		$sql="UPDATE `categories` SET `category_name`='$cat' WHERE `category_id`='$id'";
		$stmt=$conn->prepare($sql);
		$stmt->execute();
		echo "Record updated successfully";
	}
}

header("Location:./categories.php");
exit();

?>
