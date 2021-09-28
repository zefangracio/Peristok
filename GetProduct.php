<?php
$conn = mysqli_connect("localhost", "root", "", "peri");
$stock = array();
$isbn = '00084';//$_GET['isbn'];
if ($conn) {
    $getMaster = "SELECT * FROM peri_master WHERE isbn =$isbn";
    $getStock = "SELECT * FROM peri_stock WHERE isbn =$isbn";
    $resMaster = mysqli_query($conn, $getMaster);
    $resStock = mysqli_query($conn, $getStock);
    if($resMaster && $resStock){
    $row = mysqli_fetch_assoc($resMaster);
        header("content-Type:JSON");
        $response['isbn'] = $row['isbn'];
        $response['kdbrg'] = $row['kdbrg'];
        $response['judul'] = $row['judul'];
        $response['author'] = $row['author'];
        $response['publisher'] = $row['publisher'];
        $response['harga'] = $row['harga'];
        $response['sgroup'] = $row['sgroup'];
        $response['kelas'] = $row['kelas'];
        $response['umur'] = $row['umur'];
    $i=0;
    while($rowItem = mysqli_fetch_assoc($resStock)){
        $stock[$i]['isbn'] = $rowItem['isbn'];
        $stock[$i]['stock'] = $rowItem['stock'];
        $stock[$i]['location'] = $rowItem['location'];
        $stock[$i]['binloc'] = $rowItem['binloc'];
        $i++; 
    }
    $response['item'] = $stock;
     echo json_encode(array('status' => TRUE, 'product' => $response));   
     return json_encode(array('status' => TRUE, 'product' => $response));   
    }

}