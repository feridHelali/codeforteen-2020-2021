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
    $patient_id;
    if(isset($_GET['id'])){
        echo('<h1 class="text bg-info" style="color:white;">Patient Id: '.$_GET['id'].'</h1>' );
        $patient_id = $_GET['id'];
    }

    if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
    }


    require_once dirname( ABSPATH ) . '/db/db.php';

    
    $database=new Database();
    $connection = $database->connect_to_database();
    $query ="DELETE FROM patient WHERE id = ". $patient_id.";"; 
    echo('<p class="info">'.$query.'</p>');
    $res=mysqli_query($connection,$query);
    if($res){
        echo('<p class="text-success"> Patient Deleted Succefully </p>');
        echo('<a class="btn btn-success" href="index.php"> Return To Patient List </a>');
    }else{
        echo('<p class="text text-worning"> Failure : Patient not Deleted for some reason :( </p>');
        echo('<a class="btn btn-success" href="index.php"> Return To Patient List </a>');
    }
    
    $database->close_database();
 ?>

        <script src="../assets/js/jquery.js"></script>
        <script src="../assets/js/bootstrap.js"></script>

    </body>
</html>