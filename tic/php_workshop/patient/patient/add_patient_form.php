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
  <h1 class="text text-primary">Add New Patient</h1>
    <div class="row">
    <div class="col-4"></div>
    <div class="col-4">
    <form action="./add_patient.php" method="post">
    <div class="form-group">
        <label for="patient_name">Patient Name</label>
        <input type="text" 
            class="form-control" 
            name="patient_name" 
            placeholder="Type Paient Name" 
            required>
    
        <label for="gender">Gender</label>
        <input type="text" 
            name="gender" 
            class="form-control" 
            placeholder="Gender" 
            required>
    </div>
    <input class="btn btn-success" type="submit" value="Send">
</form>
    </div>
    <div class="col-4"></div>

</div>
    <script src="../assets/js/jquery.js"></script>
        <script src="../assets/js/bootstrap.js"></script>
</body>
</html>