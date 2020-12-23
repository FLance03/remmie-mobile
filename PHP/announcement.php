<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "GET"){
        $data = array();
        
        $id = $_GET['id'];

        $sql = "SELECT image,description FROM announcements WHERE id='{$id}'";

        $result = $conn->query($sql);
        if ($result->num_rows > 0){
            $row = $result->fetch_assoc();
            $data['imageUrl'] = $row['image'];
            $data['description'] = $row['description'];
            $data['success'] = 1;
            echo json_encode($data);
        }else{
            $data['success'] = 0;
            echo json_encode($data);
        }
    }
    $conn->close();
?>