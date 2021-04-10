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
            echo('<h1> Get All Patients </h1>');
            if ( ! defined( 'ABSPATH' ) ) {
                define( 'ABSPATH', __DIR__ . '/' );
              }
              require_once dirname( ABSPATH ) . '/db/db.php';
           
              
              $database=new Database();
              $connection = $database->connect_to_database();
              $query="Select * From patient;";
              $res=mysqli_query($connection,$query);
              echo('</br>');

              echo ('<a class="btn btn-primary" href="add_patient_form.php'.'">Add New Patient</a>');
              echo('<table class="table">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Patient Name</th>
                  <th scope="col">Gender</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>');
          
              foreach($res as $row){
                   echo('
                   <tr>
                        <th scope="row">' . $row["id"] .' </th>
                            <td>' . $row["patient_name"] . '</td>
                            <td>' . $row["gender"] .'</td>
                            <td>' . '<a class="btn btn-danger" href="delete_patient.php?id='.$row["id"].'"> Delete </a>'.
                                    '<a class="btn btn-primary" 
                                        href="update_patient_form.php?id='.$row["id"].'&patient_name='.$row['patient_name'].'&gender='.$row['gender'].'"> Update </a>'. 
                                    '</td>'.
                    '</tr>');
          
              } 
              echo("
              </tbody>
              </table>");
              
              
              
             $database->close_database();
        ?>
        <script src="../assets/js/jquery.js"></script>
        <script src="../assets/js/bootstrap.js"></script>

    </body>
</html>