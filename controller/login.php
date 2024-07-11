<?php
require_once("../model/usuarioModel.php");

$login = $_POST['login'];
$senha = $_POST['senha'];
$senha = md5($senha);

$usuario = new usuario(null,$login,$senha,null,null,null,null,null);
$usuario->logar();

if ($usuario->logar() == null){
    header("Location: ../view/index.php?usuarioInvalido");
}
else{
    session_start();
    $_SESSION['logado'] = true;
    $_SESSION['nome'] = $usuario->getNome();
    $_SESSION['usuarioId'] = $usuario->getId();
    header("Location: ../index.php");
}