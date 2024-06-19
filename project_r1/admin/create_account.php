<?php
include('./db_connection.php');

if (isset($_POST['signup'])) {
    $fullname = $_POST['fullname'];
    $user = $_POST['username'];
    $email = $_POST['email']; 
    $PW = $_POST['password']; 
    $role = $_POST['role'];

    if (!empty($fullname) && !empty($user) && !empty($email) && !empty($PW) && !empty($role)) {
        
        $hashed_password = password_hash($PW, PASSWORD_DEFAULT);

        
        $query = "INSERT INTO users(full_name, user_name, email, password, user_role, register_date)
                  VALUES('$fullname', '$user', '$email', '$hashed_password', '$role', NOW())";
        $stmt = $conn->prepare($query);
        $stmt->execute();

        $msg = "<mark>Your account created successfully</mark>";
    }
}

if (!empty($msg)) {
    header("Refresh: 3; URL=./login.php"); 
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Account</title>
</head>
<body>
  <?php if(!empty($msg)) {
    echo "$msg;";
  }?>
</body>
</html>