<?php

$total = 3;
$valor = array(10,20,30);
$pecas = array(1,2,4);
$i = 0;
$valorTotal = 0;

while($i < $total){
    $valorTotal = $valor[$i] / $pecas[$i] + $valorTotal;
    $i++;
    echo $valorTotal . "<br>";
}

