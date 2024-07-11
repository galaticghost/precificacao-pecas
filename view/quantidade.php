<?php
session_start();
if (!isset($_SESSION['logado']) || $_SESSION == false){
    header("Location: ../index.php");
}
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quantidade</title>
</head>
<body>
    <form method="GET" action ="precificacao.php">
        <label>Quantidade de materiais</label>
        <input type="number" min="1" placeholder="Digite a quantidade de materiais" name="quantidadeMateriais" required>
        <br>
        <label>Custo fixos outros</label>
        <input type="number" min="0" placeholder="Digite a quantidade de outros" name="quantidadeCustoFixo">
        <input type="submit" value="Continuar" />
    </form>
</body>
</html>