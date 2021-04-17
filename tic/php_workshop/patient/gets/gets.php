<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Document</title>
</head>
<body class="container">

<?php
    echo('<h1>From index</h1>');

    var_dump($_GET);
    
    //echo('<ul><li>');
    //echo("name: " . $_GET["name"] . "</li>");
    //echo("<li>gender: " . $_GET["gender"] . "</li></ul>");
    $dbhost = '192.168.1.16';
    $dbuser = 'badie';
    $dbpass = 'toto';
    $db_name = 'ferid_db';
    $conn = mysqli_connect($dbhost, $dbuser, $dbpass,$db_name);
    
    if(! $conn ) {
       die('Could not connect: ' . mysqli_error());
    }
    //$name = $_GET["name"];
    //$gender = $_GET["gender"];
    //$command = "Insert Into patient (patient_name,gender) values ('$name', '$gender');";
   // $execute=mysqli_query($conn,$command);
    $query = "Select * From patient";
    $execute=mysqli_query($conn,$query);
    var_dump($execute);
    echo("<br><code><ul class ul='list-group-item>'");
    foreach($execute as $row){
        echo("<li class='list-group-item>'");
        var_dump($row);
        echo('<li>');
    }
    
    echo("</code><hr>");
    echo("<table class='table'
    <thead>
        <tr>
            <th scope='col'>#</th>
            <th scope='col'>Patient Name</th>
            <th scope='col'>Gender</th>
        </tr>
    </thead>
    <tbody>");

    foreach($execute as $row){
        echo("
        <tr>
            <th scope='row'>" .$row['id'].'<th>
            <td>' . $row['patient_name'] . '</td>
            <td>' . $row['gender'] .'</td>
            </tr>');
    }

    echo("
    </tbody>
    </table>");

    mysqli_close($conn);
?>
</body>
</html>