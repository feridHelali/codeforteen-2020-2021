<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="assets/css/bootstrap.css">
      <title>Patient</title>
  </head>
<body>

<?php
  if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
  }
// Display Navbar
$_path = realpath( ABSPATH . '/layout/navbar.php');
if($_path) { include $_path; }
?>  

<?php
  // Display Navbar
  $_path = realpath( ABSPATH . '/layout/banner.php');
  if($_path) { include $_path; }
  ?>
<div class="container">
<div class="row">
  <div class="col-8">
    <h1>Title</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt
    sit dolorem, quibusdam omnis similique vel totam eaque magnam modi ab
     illo, quas atque aspernatur! Eum corporis sequi quam distinctio nam?
    </p>
  </div>
  <div class="col-4"><a class="btn btn-primary" href="./patient/index.php"> Login  </a></div>
</div>
</div>
<?php
  // Display Navbar
  $_path = realpath( ABSPATH . '/layout/footer.php');
  if($_path) { include $_path; }
  ?>
<script src="./assets/js/jquery.js"></script>
<script src="./assets/js/bootstrap.js"></script>
</body>
<html>

    
