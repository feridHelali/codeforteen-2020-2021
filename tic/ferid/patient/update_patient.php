<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-responsive.css">
        <title>Patient</title>
    </head>

    <body class="container">
<?php
    if(isset($_GET['id']) && isset($_GET['patient_name']) && isset($_GET['gender'])){
        $patient_id=$_GET['id'];
        $patient_name=$_GET['patient_name'];
        $gender =$_GET['gender'];
        echo($patient_id.'</br>'.$patient_name.'</br>'.$gender);
    }else{
        die('We cant update the patient without info');
    }

    if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
    }


    require_once dirname( ABSPATH ) . '/db/db.php';

    
    $database=new Database();
    $connection = $database->connect_to_database();
    $query ="UPDATE patient  SET  `patient_name`='".$patient_name."' , `gender`='".$gender."' WHERE `id` = ". $patient_id.";"; 
    echo('<p class="bg-info" style="color=red;">'.$query.'</p>');
    $res=mysqli_query($connection,$query);
    if($res){
        echo('<p class="text-success"> Patient Updated Succefully </p>');
        echo('<a class="btn btn-success" href="index.php"> Return To Patient List </a>');
    }else{
        echo('<p class="text text-worning"> Failure : Patient not Updated for some reason :( </p>');
        echo('<a class="btn btn-success" href="index.php"> Return To Patient List </a>');
    }
    
    $database->close_database();
 ?>

        <script src="../assets/js/jquery.js"></script>
        <script src="../assets/js/bootstrap.js"></script>

    </body>
</html>