<?php 

    session_start();

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "remmie";
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $query = "INSERT INTO users(first_name) VALUES('555')";
    if($results = $conn->query($query))
    {
        echo "user added successfully";
    }else {
        echo $conn->error;
    }
    
    
?>