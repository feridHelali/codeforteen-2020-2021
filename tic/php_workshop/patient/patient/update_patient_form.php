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
    if(isset($_GET['id']) && isset($_GET['patient_name']) && isset($_GET['gender'])){
        $patient_id=$_GET['id'];
        $patient_name=$_GET['patient_name'];
        $gender = $_GET['gender'];
        echo( $patient_id . '</br>'.$patient_name.'</br>'.$gender);
    }else{
        die('We cant update the patient without info');
    }
  ?>

  <h1 class="text text-primary">Update Patient # <?= $patient_id ?></h1>
    <div class="row">
    <div class="col-4"></div>
    <div class="col-4">
    <form action="update_patient.php"  method="get">

    <div class="form-group">
        <label for="patient_name">Patient Name</label>
        <input type="text" 
            class="form-control" 
            name="patient_name" 
            placeholder="Type Paient Name" 
            value="<?=$patient_name?>"
            required>
    
        <label for="gender">Gender</label>
        <input type="text" 
            name="gender" 
            class="form-control" 
            placeholder="Gender" 
            value="<?=$gender?>"
            required>
            <input hidden name="id" value=<?=$patient_id ?> >
    </div>
    <input class="btn btn-success" type="submit" value="Update">
</form>
    </div>
    <div class="col-4"></div>

</div>
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap.js"></script>
</body>
</html>