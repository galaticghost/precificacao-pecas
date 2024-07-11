<?php
require_once('../model/usuarioModel.php');

$senha = md5($_POST['senha']);

$usuario = new Usuario($_POST['nome'],$_POST['login'],$senha,$_POST['email'],
$_POST['estado'],$_POST['municipio'],$_POST['endereco'],$_POST['perfil']);
$usuario->cadastrarESetId();

header('Location: ../view/index.php');