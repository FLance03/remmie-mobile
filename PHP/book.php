<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();
        $json = file_get_contents("php://input");
        $post = json_decode($json, true);
        
        $user_id = $post['user_id'];
        $hotel_id = $post['hotel_id'];
        $room_type = $post['room_type'];
        $room_number = $post['room_number'];
        $room_floor = $post['room_floor'];
        $room_price = $post['room_price'];
        $payment_option = $post['payment_option'];
        $date_checkin = date("Y-m-d g:i:s", strtotime($post['date_checkin']));
        $date_checkout = date("Y-m-d g:i:s", strtotime($post['date_checkout']));
        
        $sql = "INSERT INTO reservations(user_id, hotel_id, room_type, room_number, room_floor, room_price, payment_option, date_checkin, date_checkout) VALUES ('$user_id', '$hotel_id', '$room_type', '$room_number', '$room_floor', '$room_price', '$payment_option', '$date_checkin', '$date_checkout')";

        if(mysqli_query($conn, $sql) == true){
            $data['msg'] = "SUCCESS";
        }else{
            $data['msg'] = "ERROR";
        }
        echo json_encode($data);
    }
    $conn->close();
?>