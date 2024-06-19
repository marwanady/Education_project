<?php

$db_server = "localhost";
$user_name = "root";
$password = "";
$db = "education_website";

try {
    $conn = new PDO(
        "mysql:host=$db_server;dbname=$db",
        $user_name,
        $password

    );
    $conn->setAttribute(
        PDO::ATTR_ERRMODE,
        PDO::ERRMODE_EXCEPTION
    );
   // echo "Connected sucessfully";
}
catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}


?>