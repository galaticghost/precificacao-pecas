<?php

abstract class Conexao {
    private $localhost = 'localhost';
    private $usuario = 'root';
    private $senha = '';
    private $banco = 'app_precificacao';
    public $conexao;

protected function __construct(){
    $this->conexao();
}

private function conexao(){
    $this->conexao = mysqli_connect($this->localhost,$this->usuario,$this->senha,$this->banco);
}

}