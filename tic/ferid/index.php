<!DOCTYPE html>
<html>
<?php
// require head for styling
$_path = realpath( __DIR__ . '/layout/head.php');
if($_path) { require_once $_path; }

echo getHead('Cabinet Mahdia'); 
?>

<body>

<?php
// Display Navbar
$_path = realpath( __DIR__ . '/layout/navbar.php');
if($_path) { include $_path; }
?>  

<?php
  // Display Navbar
  $_path = realpath( __DIR__ . '/layout/banner.php');
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
  $_path = realpath( __DIR__ . '/layout/footer.php');
  if($_path) { include $_path; }
  ?>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
<html>

    
