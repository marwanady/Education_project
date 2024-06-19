<?php
include('./db_connection.php');
echo "<br>";

if(isset($_POST['add'])){
  $full=$_POST['fullname'];
  $user=$_POST['user_name'];
  $email=$_POST['email'];
  $pw=$_POST['password'];
  $active=isset($_POST['active'])?1:0;
  if(!empty($full) && !empty($user) && !empty($email) && !empty($pw)){
    $hashed_password = password_hash($pw, PASSWORD_DEFAULT);

    $sql="INSERT INTO `users`(full_name,user_name,email,password,active_status,register_date)
    VALUES('$full','$user','$email','$hashed_password','$active', NOW())";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    //echo "Record insert successfully";
  
  }
}
header("Location:./users.php");
exit();
?>