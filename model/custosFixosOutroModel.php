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
        $sql = "INSERT INTO outros_fixos(id_custos_fixos,custo_fixo,valor) VALUES
        (?,?,?)";
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('isd',$this->idCustosFixos,$this->custoFixo,$this->valor);
        $stmt->execute() or die('Falha na inserção');
        $stmt->close();
    }
}