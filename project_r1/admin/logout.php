<?php


setcookie("user_data" , $_COOKIE['user_data'] , time() - (86400 *30) , "/");
setcookie("pw" , $_COOKIE['pw'] , time() - (86400 *30) , "/");

           
//echo "You  've loged out";

header("Location:./login.php");
exit();


?>