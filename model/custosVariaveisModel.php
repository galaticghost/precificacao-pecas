<?php
require_once('conexaoModel.php');
require_once('materialModel.php');

class CustosVariaveis extends conexao {
    private $valorParcial;
    private $embalagem;
    private $cartoes;
    private $etiquetas;
    private $frete;
    private $outros;
    private $valorTotal;


    public function __construct($valorParcial,$embalagem,$embalagemPecas,$cartoes,$cartoesPecas,$etiquetas,$etiquetasPecas,$frete,$fretePecas,$outros,$outrosPecas){
        $this->valorParcial = $valorParcial;
        $this->embalagem = array($embalagem,$embalagemPecas);
        $this->cartoes = array($cartoes,$cartoesPecas);
        $this->etiquetas = array($etiquetas,$etiquetasPecas);
        $this->frete = array($frete,$fretePecas);
        if($outros != null) {
            $this->outros = array($outros,$outrosPecas);
        }
        $this->valorTotal = ($this->embalagem[0] / $this->embalagem[1]) + ($this->cartoes[0] + $this->cartoes[1]) +
        ($this->etiquetas[0] / $this->etiquetas[1]) + ($this->frete[0] / $this->frete[1]) + ($this->outros[0] / $this->outros[1]) + $this->valorParcial;
    }


}