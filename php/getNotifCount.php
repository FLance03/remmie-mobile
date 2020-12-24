<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();
        $data['notifs'] = [];
        $json = file_get_contents("php://input");
        $post = json_decode($json, true);
        
        $userid = $post['userid'];
        $sql = "SELECT * FROM notifications WHERE user_id='$userid'";

        $count = 0;
        $query = mysqli_query($conn, $sql);
        echo $conn->error;
        // $result = mysqli_fetch_assoc($query);
        
        while ($result = mysqli_fetch_assoc($query)) {
            array_push($data['notifs'], (object)[
                'id' => $result['id'],
                'type' => $result['type'],
                'message' => $result['message'],
            ]);
            $count++;
        }

        if(isset($data) && count($data) != 0){
            $data['msg'] = "SUCCESS";
            $data['notifCount'] = $count;
            echo json_encode($data);
        }else{
            $data['msg'] = "ERROR";
            echo json_encode($data);
        }
    }
    $conn->close();
?>