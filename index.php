<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preço</title>
</head>
<body>
    <h1>Calcular Matéria Prima</h1>
<form method="POST" action="controller/produtoController.php">
    <label>Material</label>
    <input type="text" placeholder="Digite o material..." name="txtMaterial" required="">
    <br>
    <input type="number" step="0.01" placeholder="Digite o valor..." name="txtValor">
    <br>
    <input type="number" placeholder="Digite a quantidade de peças..." name="txtPecas">
    <br>
    <input type="submit" value="Calcular" />
    </form>
</body>
</html>