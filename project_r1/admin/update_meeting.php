<?php
include('./db_connection.php');
echo "<br>";
if (isset($_POST['update'])) {
    $date=$_POST['date'];
    $title=$_POST['title'];
    $content=$_POST['content'];
    $location=$_POST['location'];
    $price=$_POST['price'];
    $active=isset($_POST['active'])?1:0;
    $category_name=$_POST['category']; 
    $image=$_POST['image'];
    $id = $_POST['id'];

  
    if (!empty($date) && !empty($title) && !empty($content) && !empty($location) && !empty($price) && !empty($image)) {
        
        $category_query = "SELECT category_id FROM categories WHERE category_name = '$category_name'";
        $category_stmt = $conn->prepare($category_query);
        $category_stmt->execute();
        $category_result = $category_stmt->fetch(PDO::FETCH_ASSOC);
        $category_id = $category_result['category_id'];

        
        $query = "UPDATE meetings SET meeting_date='$date', meeting_title='$title', meeting_content='$content', meeting_location='$location', 
		meeting_price='$price', active='$active', meeting_image='$image', category_id='$category_id' WHERE meeting_id='$id'";
        $stmt=$conn->prepare($query);
        $stmt->execute();
        
        echo "Record updated successfully";
    }
}
header("Location:./meetings.php");
exit();
?>