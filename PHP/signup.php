<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
	    $data = array();
        $json = file_get_contents("php://input");
        $post = json_decode($json, true);
        
        $firstName = $post['first_name'];
        $lastName = $post['last_name'];
        $email = strtolower($post['email']);
        $password = $post['password'];
        
        $sql = "SELECT * FROM users WHERE email='$email'";

        $result = $conn->query($sql);
        if($result->num_rows > 0){
            $data['success'] = false;
            $data['errorCode'] = 1;
            $data['error'] = 'Email already exists';
        }else{
            $sql = "INSERT INTO users(first_name,last_name,user_type,email,password) VALUES ('{$firstName}','{$lastName}','guest','{$email}','{$password}')";
            if ($conn->query($sql) == true){
                $data['success'] = true;
            }else {
                echo "Error: {$sql} : {$conn->error}";
            }
            
        }
        echo json_encode($data);
    }
    $conn->close();
?>