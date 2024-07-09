<?php
require_once('../model/vendaModel.php');

$conexao = mysqli_connect('localhost','root','','app_precificacao');

$qM = $_GET['qM'];
$idCV = $_GET['idCV'];
$valorParcialCV = $_GET['vP'];
$embalagem = $_GET['e'];
$embalagemP = $_GET['eP'];
$cartoes = $_GET['c'];
$cartoesP = $_GET['cP'];
$etiquetas = $_GET['et'];
$etiquetasP = $_GET['etP'];
$frete = $_GET['f'];
$freteP = $_GET['fP'];
$outros = $_GET['o'];
$outrosP = $_GET['oP'];
$valorTotalCV = $_GET['vT'];

$salarioDesejado = $_GET['sD'];
$numeroHoras = $_GET['nH'];
$valorHoras = $_GET['vH'];
$valorTotalHoras = $_GET['vTH'];

$qCFO = $_GET['qCFO'];
$idCF = $_GET['idCF'];
$aluguel = $_GET['al'];
$agua = $_GET['ag'];
$luz = $_GET['l'];
$telefone = $_GET['t'];
$internet = $_GET['in'];
$iptu = $_GET['iptu'];
$valorParcialFixo = $_GET['vPF'];
$ppm = $_GET['ppm'];
$vTF = $_GET['vTF'];

$margemLucro = $_GET['ml'];
$despesaComercializacao = $_GET['dc'];

$totalParcialVenda = $_GET['tpv'];
$mlValor = $_GET['mlV'];
$dcValor = $_GET['dcV'];
$totalVenda = $_GET['tv'];

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado</title>
</head>
<body>
    <h1>Resultado</h1>
        <table border="1">
            <tr>
                <th>Custos Variáveis</th>
            </tr>

            <tr>
                <th>Material</th>
                <th>Valor</th>
                <th>Peças</th>
                <th>Valor final</th>
            </tr>

            <?php
            /*for($y = 0; $y < $qM; $y++){
                echo "<tr>
                        <td>" . ${'material' . $y}->getMaterial() . "</td>
                        <td>" . ${'material' . $y}->getValor() . "</td>
                        <td>" . ${'material' . $y}->getPecas() . "</td>
                        <td>" . ${'material' . $y}->getValorTotal() . "</td>
                    </tr>";
            }*/
            ?>
        
            <tr>
                <th>Total parcial</th>
                <td></td>
                <td></td>
                <td><?php echo "R$:" .number_format($valorParcialCV,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Embalagem por peça</th>
                <td><?php echo "R$:" .number_format($embalagem,2, ',', '.');?></td>
                <td><?php echo $embalagemP;?></td>
                <td><?php echo "R$:" .number_format($embalagem / $embalagemP,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Cartões</th>
                <td><?php echo "R$:" .number_format($cartoes,2, ',', '.');?></td>
                <td><?php echo $cartoesP;?></td>
                <td><?php echo "R$:" .number_format($cartoes / $cartoesP,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Etiqueta</th>
                <td><?php echo "R$:" .number_format($etiquetas,2, ',', '.');?></td>
                <td><?php echo $etiquetasP;?></td>
                <td><?php echo "R$:" .number_format(($etiquetas / $etiquetasP),2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Frete por peça</th>
                <td><?php echo "R$:" .number_format($frete,2, ',', '.');?></td>
                <td><?php echo $freteP;?></td>
                <td><?php echo "R$:" .number_format($frete / $freteP,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Outros</th>
                <td><?php echo "R$:" .number_format($outros,2, ',', '.');?></td>
                <td><?php echo $outrosP;?></td>
                <td><?php echo "R$:" .number_format($outros / $outrosP,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Total</th>
                <th></th>
                <th></th>
                <th><?php echo "R$:" .number_format($valorTotalCV,2, ',', '.');?></th>
            </tr>

            <tr>
                <th>Horas Trabalhadas</th>
            </tr>

            <tr>
                <th>Salário desejado</th>
                <td><?php echo "R$:" .number_format($salarioDesejado,2, ',', '.');?></td>
                <th>Número de horas</th>
                <td><?php echo "      " . $numeroHoras;?></td>
            </tr>
            
            <tr>
                <th>Valor da hora</th>
                <td><?php echo "R$:" .number_format($valorHoras,2, ',', '.');?></td>
                <th>À Receber</th>
                <td><?php echo "R$:" .number_format($valorTotalHoras,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Custos Fixos</th>
            </tr>

            <tr>
                <th>Aluguel</th>
                <td><?php echo "R$:" .number_format($aluguel,2, ',', '.');?></td>
            </tr>
            
            <tr>
                <th>Água</th>
                <td><?php echo "R$:" .number_format($agua,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Luz</th>
                <td><?php echo "R$:" .number_format($luz,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Telefone</th>
                <td><?php echo "R$:" .number_format($telefone,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Internet</th>
                <td><?php echo "R$:" .number_format($internet,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>IPTU</th>
                <td><?php echo "R$:" .number_format($iptu,2, ',', '.');?></td>
            </tr>

            <?php 
            ?>

            <tr>
                <th>Total</th>
                <td><?php echo "R$:" .number_format($valorParcialFixo,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Peças Produzidas por Mês</th>
                <td><?php echo "       " . $ppm;?></td>
            </tr>

            <tr>
                <th>Custo Fixo Peça</th>
                <td><?php echo "R$:" .number_format($vTF,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Margem de Lucro</th>
                <td><?php echo "      " .$margemLucro . "%";?></td>
            </tr>

            <tr>
                <th>Despesas de Comercialização</th>
                <td><?php echo "      " .$despesaComercializacao . "%";?></td>
            </tr>

            <tr>
                <th>Cálculo Final de Venda Por Peça</th>
            </tr>
            
            <tr>
                <th>Custos variáveis</th>
                <td><?php echo "R$:" . number_format($valorTotalCV,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Horas trabalhadas(à receber)</th>
                <td><?php echo "R$:" . number_format($valorTotalHoras,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Custos fixos</th>
                <td><?php echo "R$:" .number_format($vTF,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Total Parcial da Venda</th>
                <td><?php echo "R$:" .number_format($totalParcialVenda,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Margem de Lucro</th>
                <td><?php echo "R$:" .number_format($mlValor,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Despesas de Comercialização</th>
                <td><?php echo "R$:" .number_format($dcValor,2, ',', '.');?></td>
            </tr>

            <tr>
                <th>Total de Venda</th>
                <td><?php echo "R$:" .number_format($totalVenda,2, ',', '.');?></td>
            </tr>
        </table>
</body>
</html>