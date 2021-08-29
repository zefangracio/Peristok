<?php
// echo json_encode(array('status'=>1));
// exit;
$conn = mysqli_connect("localhost","root","","peri");
$response = array();
$action = "GET_ITEM";
$isbn ='00084';

if($conn){
  //echo "Behasil konek";
  if("GET_ALL_MASTER" == $action){
    $sql = "SELECT * FROM peri_master";
    $result = mysqli_query($conn,$sql);
    if($result){
        header("content-Type:JSON");
        $i = 0;
        while($row = mysqli_fetch_assoc($result)){
            $response[$i]['isbn'] = $row['isbn'];
            $response[$i]['kdbrg'] = $row['kdbrg'];
            $response[$i]['judul'] = $row['judul'];
            $response[$i]['author'] = $row['author'];
            $response[$i]['publisher'] = $row['publisher'];
            $response[$i]['harga'] = $row['harga'];
            $response[$i]['sgroup'] = $row['sgroup'];
            $response[$i]['kelas'] = $row['kelas'];
            $response[$i]['umur'] = $row['umur'];
            $i++;
        }
        echo json_encode(array('status'=> TRUE, 'products'=> $response));
        return json_encode(array('status'=> TRUE, 'products'=> $response));
    }
  }
  else if("GET_ITEM" == $action){
    $sql = "SELECT * FROM peri_stock WHERE isbn =$isbn";
    $result = mysqli_query($conn,$sql);
    if($result){
        header("content-Type:JSON");
        $i = 0;
        while($row = mysqli_fetch_assoc($result)){
            $response[$i]['isbn'] = $row['isbn'];
            $response[$i]['stock'] = $row['stock'];
            $response[$i]['location'] = $row['location'];
            $response[$i]['binloc'] = $row['binloc'];
            $i++;
        }
        echo json_encode(array('status'=>TRUE, 'products'=> $response));
        return json_encode(array('status'=>TRUE, 'products'=> $response));
    }
  } 
    else{
      echo json_encode(array('status'=>FALSE,'Description'=>'gagal get'));
  }
  return;
}
else{
    echo "Database Gagal Konek";
}


?>