<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();
        $json = file_get_contents("php://input");
        $post = json_decode($json, true);
        
        $userid = $post['userid'];
        
        $sql = "SELECT * FROM reservations WHERE user_id='$userid'";

        $query = mysqli_query($conn, $sql);
        echo $conn->error;
        $result = mysqli_fetch_array($query);

        if(isset($result) && $result != null){
            $data['msg'] = "SUCCESS";
            echo json_encode($data);
        }else{
            $data['msg'] = "ERROR";
            echo json_encode($data);
        }
    }
    $conn->close();
?>