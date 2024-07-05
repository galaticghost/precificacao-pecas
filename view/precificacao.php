<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Precificação - Peças</title>
</head>
<body>
    <table border=1>
        <h1>Matéria Prima</h1>    
        <tr>
            <th>Material</th>
            <th>Valor</th>
            <th>Peças</th>
        </tr>
        <?php
        $quantidadeTabelas = $_GET['quantidadeMateriais'];
        for($i=0;$i < $quantidadeTabelas;$i++){
            echo "<form method='post' action='../controller/produtoController.php'>
            <tr>
                <td><input type='text' placeholder='Digite o material...' name='material' required></td>
                <td><input type='number' step='0.01' min='0' placeholder='Digite o valor...' name='valor' required></td>
                <td><input type='number' min='1' placeholder='Digite a quantidade de peças...' name='pecas' required></td>                
            </tr>" ;
        }
        ?>
        


    </table>
</body>
</html>