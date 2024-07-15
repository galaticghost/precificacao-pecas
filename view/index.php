<!DOCTYPE html>
<html lang="pt">
<head>
    <link rel="icon" href="http://localhost/precificacao-pecas/img/FGTAS.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Início</title>
</head>
<body>
    <?php
    if(session_status() != PHP_SESSION_ACTIVE ){
        session_start();
    }

    if(isset($_SESSION['logado']) && $_SESSION['logado']){
    ?>    

    <a href="quantidade.php">
        <button>Cadastrar venda</button></a>
    <a href="../controller/sair.php">
        <button>Sair</button></a>
    <?php echo "Olá " . $_SESSION['nome'];?>
    
    <center><img src ="../img/FGTAS.png" /></center>
    <?php
    } else {
    ?>

    <form action="../controller/login.php" method="POST">
        <label>Login:</label>
        <input type="text" name="login" placeholder="Login: " required/>
        <label>Senha:</label>
        <input type="password" name="senha" placeholder="Senha: " required>
        <input type="submit" value="Entrar">
    </form>

    <br>
    
    <a href="cadastrar.php">
        <button>Cadastrar</button></a>
</body>
</html>

<?php
    }