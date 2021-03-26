<!DOCTYPE html>
<html lang="en">
<?php
   $_path = realpath( __DIR__ . '/../layout/head.php');
   if($_path) { require_once $_path; }

   echo getHead('Patient'); 
?>

<body class="container">
    <?php
        echo('<h1> Get All Patients</h1>');
    ?>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
        <form action="addPatient.php" method="get">
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
</body>
</html>