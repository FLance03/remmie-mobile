<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "GET"){
        $data = array();
        $size = 0;
        
        $hotel_id = $_GET['hotel_id'];

        $sql = "SELECT id,image,title FROM announcements WHERE hotel_id='{$hotel_id}'";

        $result = $conn->query($sql);
        if ($result->num_rows > 0){
            while ($row = $result->fetch_assoc()){
                $data[$size]['id'] = $row['id'];
                $data[$size]['imageUrl'] = $row['image'];
                $data[$size]['title'] = $row['title'];
                $size++;
            }
            $data[0]['success'] = 1;
            echo json_encode($data);
        }else{
            $data['success'] = 0;
            echo json_encode($data);
        }
    }
    $conn->close();
?>