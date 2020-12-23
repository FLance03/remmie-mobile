<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();
        $json = file_get_contents("php://input");
        $post = json_decode($json, true);
        
        $email = $post['email'];
        $password = $post['password'];
        
        $sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";

        $query = mysqli_query($conn, $sql);
        $result = mysqli_fetch_array($query);
        if(isset($result) && $result != null){
            $data['id'] = $result['id'];
            $data['email'] = $result['email'];
            $data['password'] = $result['password'];
            $data['user_type'] = $result['user_type'];
            $data['first_name'] = $result['first_name'];
            $data['last_name'] = $result['last_name'];
            $data['msg'] = "SUCCESS";
            echo json_encode($data);
        }else{
            $data['msg'] = "ERROR";
            echo json_encode($data);
        }
    }
    $conn->close();
?>