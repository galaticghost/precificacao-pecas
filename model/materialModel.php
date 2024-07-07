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
        $this->material = $material;
        $this->valor = $valor;
        $this->quantidadePecas = $quantidadePecas;
        $this->valorTotalMaterial = round(($this->valor / $this->quantidadePecas),2);
    }

    public function getValorTotalMaterial(){
        return $this->valorTotalMaterial;
    }

    //custos variáveis = cv
    public function setIdCv($idCv){
        $this->idCustosVariaveis = $idCv;
    }

    public function inserir(){
        $sql = "INSERT INTO material(id_custos_variaveis,material,valor,pecas) VALUES (?,?,?,?)";
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('isdi',$this->idCustosVariaveis,$this->material,$this->valor,$this->quantiadadePecas);
        $stmt->execute() or die('Falha na inserção');
        $stmt->close();  
    }

}