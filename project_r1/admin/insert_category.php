<?php
include('./db_connection.php');
echo "<br>";

if(isset($_POST['add'])){
    $category=$_POST['category'];
    if(!empty($category)){
        $sql="INSERT INTO `categories`(category_name)
        VALUES('$category')";
        $stmt=$conn->prepare($sql);
        $stmt->execute();
        echo "Record inserted successfully";
    }
}
header("Location:./categories.php");
exit();
?>