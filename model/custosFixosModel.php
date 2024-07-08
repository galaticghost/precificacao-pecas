<?php
require_once('conexaoModel.php');

class CustosFixos extends Conexao {
    private $id;
    private $aluguel;
    private $agua;
    private $luz;
    private $telefone;
    private $internet;
    private $iptu;
    private $valorOutros;
    private $valorParcial;
    private $pecasProduzidasMes;
    private $valorTotal;

    //ppm = Peças Produzidas por Mês    
    public function __construct($aluguel,$agua,$luz,$telefone,$internet,$iptu,$ppm){
        
        $this->aluguel = $aluguel;
        $this->agua = $agua;
        $this->luz = $luz;
        $this->telefone = $telefone;
        $this->internet = $internet;
        $this->iptu = $iptu;
        $this->pecasProduzidasMes = $ppm;
    }

    public function getValorOutros(){
     //   $this->valorOutros += $x;
    }


}