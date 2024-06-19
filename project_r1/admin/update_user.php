<?php

include('./db_connection.php');
echo "<br>";

if(isset($_POST['update'])){
	$full=$_POST['fullname'];
	$user=$_POST['user_name'];
	$email=$_POST['email'];
	$pw=$_POST['password'];
    $id=$_POST['id'];
	$active=isset($_POST['active'])?1:0;
	if(!empty($full) && !empty($user) && !empty($email) && !empty($pw)){

		$hashed_password = password_hash($pw, PASSWORD_DEFAULT);

		$sql="UPDATE `users` SET `full_name`='$full',`user_name`='$user',`email`='$email',`password`='$hashed_password',`active_status`='$active'
		WHERE `user_id`='$id'";
		$stmt=$conn->prepare($sql);
		$stmt->execute();
		//echo "Record updated successfully";
		}
}


  header("Location:./users.php");
  exit();  
?>
