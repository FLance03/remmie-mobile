<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "GET"){
	    $data = array();
        $size = 0;

        $id = $_GET['id'];
        $sql = "SELECT image FROM preview_images WHERE hotel_id='{$id}'";

        $result = $conn->query($sql);
        if ($result->num_rows > 0){
            while ($row = $result->fetch_assoc()){
                $data[$size]['imageUrl'] = $row['image'];
                $size++;
            };
        }else{
            for ($i=0 ; $i<5 ; $i++){
                $data[$size]['imageUrl'] = 'noimage.jpg';
                $size++;
            }
        }
        echo json_encode($data);
    }
    $conn->close();
?>