<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $json = file_get_contents("php://input");
        $data2 = json_decode($json, true);
        $data = array();



        $firstname = $data2['firstname'];
        $password = $data2['password'];
        
        $sql = "SELECT * FROM users WHERE firstname='$firstname' AND password='$password'";

        $query = mysqli_query($conn, $sql);
        $result = mysqli_fetch_array($query);

        if(isset($result) && $result != null){
            $data['first_name'] = $result['first_name'];
            $data['last_name'] = $result['last_name'];
            $data['last_name'] = $result['last_name'];
            $data['password'] = $result['password'];
            echo json_encode($data);
        }else{
            $data['msg'] = "i guess it failed";
            echo json_encode($data);
        }
    }
    
?>