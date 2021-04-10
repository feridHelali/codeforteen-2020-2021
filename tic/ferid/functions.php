<?php

    $pation="Sami";

    function checkBloodPressure($args)
    {
        $nurse = "Leila";
        echo ($nurse . ' take care of ' . $args);
    }


    checkBloodPressure($pation);
   
    echo('<br>');

    var_dump($GLOBALS);

?>