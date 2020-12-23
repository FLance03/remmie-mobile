<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "GET"){
	    $data = array();
        $size = 0;

        if (isset($_GET['id'])){
            $id = $_GET['id'];
            $sql = "SELECT * FROM hotels WHERE id='{$id}' LIMIT 1";
        }else {
            $sql = "SELECT * FROM hotels";
        }

        $result = $conn->query($sql);
        if ($result->num_rows > 0){
            while ($row = $result->fetch_assoc()){
                $data[$size]['id'] = $row['id'];
                $data[$size]['imageUrl'] = $row['image'];
                $data[$size]['name'] = $row['name'];
                $data[$size]['description'] = $row['description'];
                $data[$size]['stars'] = $row['star'];
                $size++;
            }
            echo json_encode($data);
        }else{
            $data[] = array();
            $data[0]['success'] = 0;
            echo json_encode($data);
        }
    }
    $conn->close();
?>