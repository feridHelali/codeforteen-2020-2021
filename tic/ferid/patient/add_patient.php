<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="../assets/css/bootstrap.css">
      <title>Patient</title>
  </head>
<body class="container">
<?php
    if(isset($_POST['patient_name'])){
        $patient_name = $_POST['patient_name'];
    }
    if(isset($_POST['gender'])){
       $gender = $_POST['gender'];

    }

    if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
    }


    require_once dirname( ABSPATH ) . '/db/db.php';

    
    $database=new Database();
    $connection = $database->connect_to_database();
    $query ="INSERT INTO patient (patient_name,gender) values ('".$patient_name."','".$gender."');" ; 
    $res=mysqli_query($connection,$query);
    if($res){
        echo('<p class="success"> Patient Added Succefully </p>');
        echo('<a class="btn btn-success" href="index.php"> Return To Patient List </a>');
    }else{
        echo('<p class="danger"> Failure : Patient not Added for some reason :( </p>');
        echo('<a class="btn btn-success" href="index.php"> Return To Patient List </a>');
    }
    
    $database->close_database();
    
  

?>