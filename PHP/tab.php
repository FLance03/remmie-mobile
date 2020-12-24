<?php 
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "GET"){
	    $data = array();
        $name = ['Burger','Noodles','Fries','Pepsi','Royal'];
        $images = ['grilled_burger.PNG','noodles.PNG','fries.PNG','pepsi.png','royal.png'];
        $description = ['Good for 1 person','Good for 2/3 people','Good for 1 person','Good for 1 person','Good for 1 person'];
        $type = ['food','food','food','beverage','beverage'];
        $stock = [1,2,0,2,1];
        $price = [200.50,300.25,100.0,50,50];
        
        if (true){ // Requires access to hotel db so for now, assume that data is retrieved
            for ($size=0 ; $size<5 ; $size++){
                $data[$size]['id'] = $size + 1;
                $data[$size]['stock'] = $stock[$size];
                $data[$size]['name'] = $name[$size];
                $data[$size]['imageUrl'] = $images[$size];
                $data[$size]['description'] = $description[$size];
                $data[$size]['type'] = $type[$size];
                $data[$size]['price'] = $price[$size];
            }
            echo json_encode($data);
        }else{
            $data[] = array();
            $data[0]['success'] = 0;
            echo json_encode($data);
        }
    }
    $conn->close();
?>