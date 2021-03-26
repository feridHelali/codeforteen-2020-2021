<!DOCTYPE html>
<html lang="en">

<body class="container">
    
<?php
    echo('<h1> from Index </h1>');

    var_dump($_GET);
    
    echo('<hr>');

    echo('<ul class="list-group">');
    echo("<li class='list-group-item'> Patient Name : "  . $_GET["patient_name"] . "</li>");
    echo("<li class='list-group-item'> Patient Gender : "  . $_GET["gender"] . "</li>");
    echo("</ul>");

   
    $dbhost = '192.168.1.16';
    $dbuser = 'ferid';
    $dbpass = 'toto';
    $dbname = 'ferid_db';
   
    $conn = mysqli_connect($dbhost, $dbuser, $dbpass,$dbname);

    if(! $conn ) {
         die('Could not connect: ');
    }
    
    echo 'Connected successfully';
    
    $name = $_GET["patient_name"];
    $gender = $_GET["gender"];

    /* $command ="INSERT INTO patient (patient_name,gender) values ('".$name."','".$gender."');" ;
    echo($command);
    mysqli_query($conn,$command);*/
    $query="Select * From patient;";
   
    
    var_dump($res);  
    echo('<br><code><ul class="list-group-item">');
    foreach($res as $row){
        echo("<li class='list-group-item'>");
        var_dump($row);
        echo('</li>');

    } 
    echo("</code><hr>");

    echo('<table class="table">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Patient Name</th>
        <th scope="col">Gender</th>
      </tr>
    </thead>
    <tbody>');

    foreach($res as $row){
         echo('
         <tr>
         <th scope="row">' . $row["id"] .' </th>
            <td>' . $row["patient_name"] . '</td>
            <td>' . $row["gender"] .'</td>
         </tr>');

    } 
    echo("
    </tbody>
    </table>");
    
    
    
    mysqli_close($conn);
      

?>
</body>
</html>