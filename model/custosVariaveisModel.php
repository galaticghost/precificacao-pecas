<?php

require_once('materialModel.php');

class CustosVariaveis extends Conexao {
    private $id;
    private $totalParcial;
    private $embalagem;
    private $cartoes;
    private $etiquetas;
    private $frete;
    private $outros;
    private $valorTotal;

    public function getId(){
        return $this->id;
    }

    public function __construct($totalParcial,$embalagem,$embalagemPecas,$cartoes,$cartoesPecas,$etiquetas,$etiquetasPecas,$frete,$fretePecas,$outros,$outrosPecas){
        $this->totalParcial = $totalParcial;
        $this->embalagem = array($embalagem,$embalagemPecas);
        $this->cartoes = array($cartoes,$cartoesPecas);
        $this->etiquetas = array($etiquetas,$etiquetasPecas);
        $this->frete = array($frete,$fretePecas);
        if($outros != null) {
            $this->outros = array($outros,$outrosPecas);
        }
        
        $this->valorTotal = ($this->embalagem[0] / $this->embalagem[1]) + ($this->cartoes[0] + $this->cartoes[1]) +
        ($this->etiquetas[0] / $this->etiquetas[1]) + ($this->frete[0] / $this->frete[1]) + $this->totalParcial;

        if($this->outros != null){
            $this->valorTotal += $this->outros[0] / $this->outros[1];
        }

    }

    public function inserirESetId(){
        $sql = "INSERT INTO custos_variaveis(total_parcial,valor_embalagem,pecas_embalagem,valor_cartoes,
        pecas_cartoes,valor_etiquetas,pecas_etiquetas,valor_frete,pecas_frete,valor_outros,pecas_outros,valor_total) VALUES
        (?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $this->conexao->prepare($sql);
        $stmt->prepare($sql);
        $stmt->bind_param('ddididididid',$this->totalParcial,$this->embalagem[0],$this->embalagem[1],$this->cartoes[0],$this->cartoes[1],
        $this->etiquetas[0],$this->etiquetas[1],$this->frete[0],$this->frete[1],$this->outros[0],$this->outros[1],$this->valorTotal);
        $stmt->execute() or die('Falha na inserção');
        $stmt->close();
        
        $sql = "SELECT TOP 1 id FROM custos_variaveis ORDER BY id DESC";
        $id = $this->conexao->query($sql);
        $id = mysqli_fetch_row($id);
        $this->id = $id[0];
        $id->close();
    }

}