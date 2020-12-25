<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
	    $data = array();
        $json = file_get_contents("php://input");
        $post = json_decode($json, true);

        $size = 0;

        $user_id = $post['user_id'];
        $reservation_id = $post['reservation_id'];
        $cart = $post['cart'];
        $sql = "INSERT INTO room_services(user_id,reservation_id,service_type) VALUES ({$user_id},{$reservation_id},1)";
        
        if ($conn->query($sql) === TRUE) {
            $last_id = $conn->insert_id;
            foreach ($cart as $product_id=>$data){
                $sql = "INSERT INTO line_items(room_service_id,product_id,price,quantity) VALUES ({$last_id},{$product_id},{$data['price']},{$data['quantity']})";
                $conn->query($sql);
            }
            echo true;
        }else {
            echo false;
        }
        // if ($conn->query($sql) == true){
        //     $data['success'] = true;
        //     echo json_encode($data);
        // }else {
        //     echo "Error: {$sql} : {$conn->error}";
        // };
    }
    $conn->close();
?>