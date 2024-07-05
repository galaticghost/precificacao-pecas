<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preço</title>
</head>
<body>
    <h1>Matéria Prima</h1>
    <form method="POST" action="../controller/produtoController.php">
    <label>Material:</label>
    <input type="text" placeholder="Digite o material..." name="txtMaterial" required="">
    <br>
    <label>Valor:</label>
    <input type="number" step="0.01" min="0" placeholder="Digite o valor..." name="txtValor" required>
    <br>
    <label>Quantidade:</label>
    <input type="number" min="0" placeholder="Digite a quantidade..." name="txtQuantidade" required>
    <br>
    <label>Embalagem por peça:</label>
    <input type="number" step="0.01" min="0" placeholder="Digite o valor das Embalagem..." name="txtPecas" required>
    <br>
    <label>Quantidade:</label>
    <input type="number" min="0" placeholder="Digite a quantidade..." name="txtQuantidadeE" required>
    <br>
    <label>Cartões:</label>
    <input type="number" step="0.01" min="0" placeholder="Digite o valor dos Cartões
    ..." name="txtCartoes" required>
    <br>
    <label>Quantidade:</label>
    <input type="number" min="0" placeholder="Digite a quantidade..." name="txtQuantidadeC" required>
    <br>
    <label>Etiquetas:</label>
    <input type="number" step="0.01" min="0" placeholder="Digite o valor das etiquetas..." name="txtEtiquetas" required>
    <br>
    <label>Quantidade:</label>
    <input type="number" min="0" placeholder="Digite a quantidade..." name="txtQuantidadeEtiquetas" required>
    <br>
    <label>Frete por peça:</label>
    <input type="number" step="0.01" min="0" placeholder="Digite o valor do frete..." name="txtFrete" required>
    <br>
    <label>Quantidade:</label>
    <input type="number" min="0" placeholder="Digite a quantidade..." name="txtQuantidadeFrete" required>
    <br>
    <hr>
    <h1>Horas Trabalhadas</h1>
    <label>Número de horas:</label>
    <input type="number" min="0" placeholder="Digite o total de horas" name="txtHoras" >
    <br>
    <label>Salário desejado por mês:</label>
    <input type="number" step='0.01' min="0" placeholder="Digite o Salário desejado" name="txtSalario" >
    <br>
    <hr>
    <h1>Custos Fixos</h1>
    <label>Aluguel:</label>
    <input type="number" step='0.01' min="0" placeholder="Digite o valor do aluguel..." name="txtAluguel" required>
    <br>
    <label>Água:</label>
    <input type="number" step='0.01' min="0" placeholder="Digite o valor da água..." name="txtAgua" required="">
    <br>
    <label>Luz:</label>
    <input type="number" step='0.01' min="0" placeholder="Digite o valor da luz..." name="txtLuz" required="">
    <br>
    <label>Telefone:</label>
    <input type="number" step='0.01' min="0" placeholder="Digite o valor do telefone..." name="txtTelefone" required="">
    <br>
    <label>Internet:</label>
    <input type="number" step='0.01' min="0" placeholder="Digite o valor da internet..." name="txtInternet" required="">
    <br>
    <label>Iptu:</label>
    <input type="number" step='0.01' min="0" placeholder="Digite o valor do iptu..." name="txtIptu" required="">
    <br>
    <label>Peças produzidas por mês: </label>
    <input type="number" min="0" placeholder="Digite a quantidade de peças..." name="txtPecasCF" required="">
    <br>
    <hr>
    <h1>Margem de lucro</h1>
    <input type="number" min="0" placeholder="Digite a margem de lucro..." name="txtMargemLucro" required="">
    <hr>
    <h1>Despesas de comercialização</h1>
    <input type="number" min="0" placeholder="Digite as Despesas..." name="txtDespesas" required="">
    <input type="submit" value="Calcular" />
    </form>

</body>
</html>
