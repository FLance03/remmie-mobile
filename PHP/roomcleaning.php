<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
	    $data = array();
        $json = file_get_contents("php://input");
        $post = json_decode($json, true);

        $size = 0;

        $user_id = $post['user_id'];
        $reservation_id = $post['reservation_id'];
        $sql = "INSERT INTO room_services(user_id,reservation_id,service_type) VALUES ({$user_id},{$reservation_id},0)";
        
        if ($conn->query($sql) == true){
            $data['success'] = true;
            echo json_encode($data);
        }else {
            echo "Error: {$sql} : {$conn->error}";
        };
    }
    $conn->close();
?>