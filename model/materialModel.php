<?php
require_once('conexaoModel.php');

class Material extends Conexao {
    private $id;
    private $idCustosVariaveis;
    private $material;
    private $valor;
    private $quantidadePecas;
    private $valorTotalMaterial;

    public function __construct($material,$valor,$quantidadePecas) {
        parent::__construct();
        $this->material = $material;
        $this->valor = $valor;
        $this->quantidadePecas = $quantidadePecas;
        $this->valorTotalMaterial = round(($this->valor / $this->quantidadePecas),2);
    }

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
    }

    public function getMaterial(){
        return $this->material;
    }

    public function setMaterial($material){
        $this->material = $material;
    }

    public function getValor(){
        return $this->valor;
    }

    public function setValor($valor){
        $this->valor  = $valor;
    }
    
    public function getQuantidadePecas(){
        return $this->quantidadePecas;
    }

    public function setQuantidadePecas($quantidadePecas){
        $this->quantidadePecas = $quantidadePecas;
    }


    public function getValorTotalMaterial(){
        return $this->valorTotalMaterial;
    }

    public function setValorTotalMaterial($valorTotalMaterial){
        $this->valorTotalMaterial = $valorTotalMaterial;
    }

    public function getIdCv(){
        return $this->idCustosVariaveis;
    }

    //custos variáveis = cv
    public function setIdCv($idCv){
        $this->idCustosVariaveis = $idCv;
    }

    public function inserir(){
        $sql = "INSERT INTO material(id_custos_variaveis,material,valor,quantidade_pecas) VALUES (?,?,?,?)";
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('isdi',$this->idCustosVariaveis,$this->material,$this->valor,$this->quantidadePecas);
        $stmt->execute() or die('Falha na inserção');
        $stmt->close();  
    }
}