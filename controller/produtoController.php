<?php

$material = $_POST['txtMaterial'];
$valor = $_POST['txtValor'];
$quantidade = $_POST['txtQuantidade'];
$valorEmbalagem = $_POST['txtPecas'];
$quantidadeEmbalagem = $_POST['txtQuantidadeE'];
$valorCartoes = $_POST['txtCartoes'];
$quantidadeCartoes = $_POST['txtQuantidadeC'];
$valorEtiquetas = $_POST['txtEtiquetas'];
$quantidadeEtiqueta = $_POST['txtQuantidadeEtiquetas'];
$valorFrete = $_POST['txtFrete'];
$quantidadeFrete = $_POST['txtQuantidadeFrete'];

$materialValor = $valor/$quantidade;
$materialValor = round($materialValor,2,PHP_ROUND_HALF_UP);

echo $material;
echo "<br>Valor material: " . $materialValor;

$embalagem = $valorEmbalagem / $quantidadeEmbalagem;
$cartoes = $valorCartoes / $quantidadeCartoes;
$etiquetas = $valorEtiquetas / $quantidadeEtiqueta;
$frete = $valorFrete / $quantidadeFrete;

$valorTotalCustosVariaveis = $materialValor + $embalagem + $cartoes + $etiquetas + $frete;
echo "<br> Valor total dos custos variáveis: " . round($valorTotalCustosVariaveis,2,PHP_ROUND_HALF_UP);

$horas = $_POST['txtHoras'];
$salario = $_POST['txtSalario'];

$valorHora = $salario / 176;
$valorTotalHorasTrabalhadas = $horas * round($valorHora, 3, PHP_ROUND_HALF_UP);

echo "<br> Horas trabalhadas: " . round($valorTotalHorasTrabalhadas,2,PHP_ROUND_HALF_UP);

$aluguel = $_POST['txtAluguel'];
$agua = $_POST['txtAgua'];
$luz = $_POST['txtLuz'];
$telefone = $_POST['txtTelefone'];
$internet = $_POST['txtInternet'];
$iptu = $_POST['txtIptu'];

$custosFixosTotal = $aluguel + $agua + $luz + $telefone + $internet + $iptu;
echo "<br>Custos fixos total: " . $custosFixosTotal;

$valorParcial = $custosFixosTotal + $valorTotalHorasTrabalhadas + $valorTotalCustosVariaveis;


$margemLucro = $valorParcial * $_POST['txtMargemLucro'] / 100;

echo "<br>Margem de lucro: " . round($margemLucro,2,PHP_ROUND_HALF_UP);

$despesasComercialização = $valorParcial * $_POST['txtDespesas'] / 100;

echo "<br>Despesas de comercialização: " . round($despesasComercialização,2,PHP_ROUND_HALF_UP);
