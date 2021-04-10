<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Document</title>
</head>
<body>
    <?php
        echo('<h1>Get All patients</h1>');
    ?>
   <form action="addpatient.php" method="POST">
       <input type="text" name="name" placeholder="Patient's name" ><br>
       <input type="text" name="gender" placeholder="Gender"><br>
       <input type="submit" value="Send"> 
   </form> 
</body>
</html>