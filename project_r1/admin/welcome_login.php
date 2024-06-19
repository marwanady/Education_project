<?php
include('./db_connection.php');

$msg = "";
if (isset($_POST['login'])) { 
  $user = $_POST['user_name'];
  $PW = $_POST['password'];

  if (!empty($user) && !empty($PW)) {
    $stmt = $conn->prepare("SELECT user_role, password FROM users WHERE user_name = ?");
    $stmt->execute([$user]);

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($row) {
      $password = $row['password']; 
      if (password_verify($PW, $password)) { 
        $role = $row['user_role'];
        setcookie("user_data" ,$_POST['user_name'] ,time() + (86400 *30) , "/");
        setcookie("pw" , $_POST['password'] , time() + (86400 *30) , "/");
        $msg = "Welcome " . $_COOKIE['user_data'] . " , You logged in successfully ";
        // echo "<h1><ins> $msg </ins></h1>";

        if ($role == 'admin') {
          header("Location:./users.php");
          exit();
        } elseif ($role == 'student' or $role == 'instructor') {
          header("Location: http://localhost/project_r1/index.php");
          exit();
        } else {
          echo "Unknown role."; 
          exit();
        }
      } else {
        echo "<mark>Invalid password.</mark>"; 
        exit();
      }
    } else {
      echo "<mark>Invalid information.</mark>";
      exit();
    }
  }
}
?>

