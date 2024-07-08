<?php

require_once('conexaoModel.php');

class CustosFixosOutro extends Conexao {
    private $id;
    private $idCustosFixos;
    private $custoFixo;
    private $valor;

    public function __construct($custoFixo,$valor){
        parent::__construct();
        $this->custoFixo = $custoFixo;
        $this->valor = $valor;
    }

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
    }

    public function getIdCustosFixos(){
        return $this->idCustosFixos;
    }

    public function setIdCustosFixos($idCustosFixos){
        $this->idCustosFixos = $idCustosFixos;
    }

    public function getCustoFixo(){
        return $this->custoFixo;
    }

    public function setCustoFixo($custoFixo){
        $this->custoFixo = $custoFixo;
    }

    public function getValor(){
        return $this->valor;
    }

    public function setValor($valor){
        $this->valor = $valor;
    }
    public function inserir(){
        $sql = "INSERT INTO ";
    }
}