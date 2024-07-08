<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Precificação - Peças</title>
</head>
<body>
    <h1>Precificação Peças</h1>
    <form method='POST' action='../controller/vendaController.php?quantidadeMateriais=<?php echo $_GET['quantidadeMateriais'] . "&quantidadeCustoFixo=" . $_GET['quantidadeCustoFixo'];?>'>
        <table border=1>    
            <tr>
                <th>Custos Variáveis</th>
            </tr>
            
            <tr>
                <th>Material</th>
                <th>Valor</th>
                <th>Peças</th>
            </tr>
            
            <?php            
            for($i = 0;$i < $_GET['quantidadeMateriais'];$i++){
                echo "
                <tr>
                    <td><input type='text' placeholder='Digite o material...' name='material" . $i . "' required></td>
                    <td><input type='number' step='0.01' min='0' placeholder='Digite o valor...' name='valor" . $i . "' required></td>
                    <td><input type='number' min='1' placeholder='Digite a quantidade de peças...' name='pecas" . $i . "' required></td>                
                </tr>";
            }
            ?>
            
            <tr>
                <th>Embalagem por peça</th>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor da embalagem...' name='valorEmbalagem' required></td>
                <td><input type='number' min='1' placeholder='Digite a quantidade de peças...' name='pecasEmbalagem' required></td>
            </tr>
            
            <tr>
                <th>Cartões</th>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor do cartão...' name='valorCartao' required></td>
                <td><input type='number' min='1' placeholder='Digite a quantidade de peças...' name='pecasCartao' required></td>
            </tr>
            
            <tr>
                <th>Etiquetas</th>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor da etiqueta...' name='valorEtiqueta' required></td>
                <td><input type='number' min='1' placeholder='Digite a quantidade de peças...' name='pecasEtiqueta' required></td>
            </tr>
            
            <tr>
                <th>Frete</th>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor do frete...' name='valorFrete' required></td>
                <td><input type='number' min='1' placeholder='Digite a quantidade de peças...' name='pecasFrete' required></td>
            </tr>
            
            <tr>
                <th>Outros</th>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor...' name='valorOutros' ></td>
                <td><input type='number' min='1' placeholder='Digite a quantidade de peças...' name='pecasOutros' ></td>
            </tr>
            
            <tr>
                <th>Horas Trabalhadas</th>
                <th>Salário Desejado</th>
                <th>Número de Horas</th>
            </tr>
            
            <tr>
                <td></td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o salário desejado...' name='salarioDesejado' required></td>
                <td><input type='number' min='0' placeholder='Digite o número de horas...' name='numeroHoras' required></td>
            </tr>

            <tr>
                <th>Custos Fixos</th>
            </tr>
            
            <tr>
                <th>Custos</th>
                <th>Valor</th>
            </tr>
            
            <tr>
                <td>Aluguel</td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor do aluguel...' name='valorAluguel' required></td>
            </tr>
            
            <tr>
                <td>Água</td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor da água...' name='valorAgua' required></td>
            </tr>

            <tr>
                <td>Luz</td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor da luz...' name='valorLuz' required></td>
            </tr>

            <tr>
                <td>Telefone</td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor do telefone...' name='valorTelefone' required></td>
            </tr>            

            <tr>
                <td>Internet</td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor da internet...' name='valorInternet' required></td>
            </tr>

            <tr>
                <td>Iptu</td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor do iptu...' name='valorIptu' required></td>
            </tr>
            <?php
            for($i = 0;$i < $_GET['quantidadeCustoFixo'];$i++){
                echo "<tr>
                <td><input type='text' placeholder='Digite o nome do custo...' name='outro" . $i . "' required</td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor...' name='valorOutro" . $i . "' required></td>
            </tr>";
            }
            ?>
            <tr>
                <td>Peças produzidas/mês</td>
                <td><input type='number' min='1' placeholder='Peças produzidas por mês...' name='ppm' required></td>
            </tr>

            <tr>
                <th>Margem de lucros</th>
                <td><input type='number' min='0' max='100' placeholder='Digite a porcentagem da margem de lucro...' name='margemLucro' required></td>
            </tr>

            <tr>
                <th>Despesas de Comercialização</th>
                <td><input type='number' min='0' max='100' placeholder='Digite a porcentagem das despesas de comercialização...' name='despesaComercializacao' required></td>
            </tr>

            <tr>
                <th></th>
                <th><input type='submit' value='Calcular'></th>
                <th></th>
            </tr>
        </table>
    </form>
</body>
</html>