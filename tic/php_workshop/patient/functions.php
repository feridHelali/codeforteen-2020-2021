<?php
    $_patient = "Sami";
    
    function checkBP($_args)
    {
       $_nurse = "Leila";
        echo ($_nurse . ' is taking care of ' . $_args.'<br>');
    }

    checkBP($_patient);
    
    
    var_dump($GLOBALS);
?>