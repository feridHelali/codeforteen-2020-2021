<?php
$a = 1; /* global scope */

function test()
{
    $a = "Ferid";
    /* reference to local scope variable */
    echo $a;
}

test();

include 'included_script.php';

echo $name;
