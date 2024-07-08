<?php

abstract Class Conexao {
    private $localhost = 'localhost';
    private $usuario = 'root';
    private $senha = '';
    private $banco = 'app_precificacao';
    public $conexao;

public function __construct(){
    $this->conexao();
}

private function conexao(){
    $this->conexao = new mysqli($this->localhost,$this->usuario,$this->senha,$this->banco);
}

}