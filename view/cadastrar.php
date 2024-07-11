<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar</title>
</head>
<body>
    <form action="../controller/cadastrarController.php" method="POST">
        <label>Nome Completo:</label>
        <input type="text" name="nome" placeholder="Digite o seu nome completo: " required>
        <br>
        <label>Login:</label>
        <input type="text" name="login" placeholder="Digite o login: " required>
        <br>
        <label>Senha:</label>
        <input type="password" name="senha" placeholder="Digite a sua senha: " required>
        <br>
        <label>Email:</label>
        <input type="email" name="email" placeholder="Digite o seu email: " required>
        <br>
        <label>Endereço:</label>
        <input type="text" name="endereco" placeholder="Digite o seu endereço: " required>
        <br>
        <label>Estado:</label>
        <select name="estado">
            <option value = "0">Selecione...</option>
        <?php
        $sql = "SELECT * FROM estado ORDER BY estado ASC";
        $conexao = mysqli_connect('localhost','root','','app_precificacao');
        $estados = mysqli_query($conexao,$sql);
        foreach($estados as $estado){
            echo '<option value="' . $estado['id'] . '">' . $estado['estado'] . '</option>';
        }
        ?>
        </select>
        <br>
        <label>Município:</label>
        <input type="text" name="municipio" placeholder="Digite o seu município" required>
        <br>
        <label>Perfil:</label>
        <select name="perfil">
            <option value="0">Selecione...</option>
        <?php
        $sql = "SELECT * FROM perfil ORDER BY nome_perfil ASC";
        $conexao = mysqli_connect('localhost','root','','app_precificacao');
        $perfis = mysqli_query($conexao,$sql);
        foreach($perfis as $perfil){
        echo '<option value="' . $perfil['id'] . '">' . $perfil['nome_perfil'] . '</option>';
        }
        ?>
        </select>
        <br>
        <input type="submit" value="Cadastrar">
    </form>
</body>
</html>