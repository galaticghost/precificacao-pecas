<?php

$total = 3;
$valor = array(73,89,29);
$pecas = array(1,2,3);
$i = 0;
$valorTotal = 0;

while($i < $total){
    $valorTotal = $valor[$i] / $pecas[$i] + $valorTotal;
    $i++;
    echo $valorTotal . "<br>";
}