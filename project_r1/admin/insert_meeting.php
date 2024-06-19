<?php

include('./db_connection.php');
echo "<br>";

if (isset($_POST['add'])) {
    $date=$_POST['date'];
    $title=$_POST['title'];
    $content=$_POST['content'];
    $location=$_POST['location'];
    $price=$_POST['price'];
    $active=isset($_POST['active'])?1:0;
    $category_name=$_POST['category']; // Assuming this is the category name for the meeting
    $image=$_POST['image'];
  
    if (!empty($date) && !empty($title) && !empty($content) && !empty($location) && !empty($price) && !empty($image)) {
        
        $category_query = "SELECT category_id FROM categories WHERE category_name = '$category_name'";
        $category_stmt = $conn->prepare($category_query);
        $category_stmt->execute();
        $category_result = $category_stmt->fetch(PDO::FETCH_ASSOC);
        $category_id = $category_result['category_id'];

        
        $query = "INSERT INTO meetings(meeting_date,meeting_title,meeting_content,meeting_location,meeting_price,active,meeting_image, category_id)
        VALUES('$date','$title','$content','$location','$price','$active','$image', '$category_id')";
        $stmt=$conn->prepare($query);
        $stmt->execute();
        
        echo "Record added successfully";
    }
}
header("Location:./meetings.php");
exit();
?>