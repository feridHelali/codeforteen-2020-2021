<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
    <title>Document</title> 
    </head>
<body>


<?php
    if(! defined('MYAPP')){
        define("MYAPP","PATIENT");
    }

    if(! defined('ABSPATH')){
        define('ABSPATH',__DIR__ . '/');
    }

//display navbar
$_path = realpath( ABSPATH . 'layout/navbar.php');
if ($_path) {
    include $_path;
};
?>
<?php

//display jubmotron
$_path = realpath(ABSPATH. 'layout/banner.php');
if ($_path) {
    include $_path;
};
?>

<div class="container">
<h1>Title</h1>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Consequuntur consectetur, dolorem, rem tempora numquam dignissimos</p>
<p>
    <a class="btn btn-primary" href="./patient/index.php">Login</a>
</p>
</div>
<?php
$_path = realpath(__DIR__ . '/layout/footer.php');
if ($_path) {
    include $_path;
};
?>
<script src="./assets/js/jquery.js"></script>
<script src="./assets/js/bootstrap.js"></script>

</body>
</html>