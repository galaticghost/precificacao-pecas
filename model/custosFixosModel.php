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

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
    }
    
    public function getAluguel(){
        return $this->aluguel;
    }

    public function setAluguel($aluguel){
        $this->aluguel = $aluguel;
    }

    public function getAgua(){
        return $this->agua;
    }

    public function setAgua($agua){
        $this->agua = $agua;
    }

    public function getLuz(){
        return $this->luz;
    }

    public function setLuz($luz){
        $this->luz = $luz;
    }

    public function getTelefone(){
        return $this->telefone;
    }

    public function setTelefone($telefone){
        $this->telefone = $telefone;
    }

    public function getInternet(){
        return $this->internet;
    }

    public function setInternet($internet){
        $this->internet = $internet;
    }

    public function getIptu(){
        return $this->iptu;
    }

    public function setIptu($iptu){
        $this->iptu = $iptu;
    }

    public function getValorOutros(){
        return $this->valorOutros;
    }

    public function setValorOutros($valorOutros){
        $this->valorOutros = $valorOutros;
    }

    public function getValorParcial(){
        return $this->valorParcial;
    }

    public function setValorParcial($valorParcial){
        $this->valorParcial = $valorParcial;
    }

    public function getPPM(){
        return $this->pecasProduzidasMes;
    }
    
    public function setPPM($PPM){
        $this->pecasProduzidasMes = $PPM;
    }

    public function getValorTotal(){
        return $this->valorTotal;
    }

    public function setValorTotal($valorTotal){
        $this->valorTotal = $valorTotal;
    }

    //ppm = Peças Produzidas por Mês    
    public function __construct($aluguel,$agua,$luz,$telefone,$internet,$iptu,$valorOutros,$ppm){
        parent::__construct();
        $this->aluguel = $aluguel;
        $this->agua = $agua;
        $this->luz = $luz;
        $this->telefone = $telefone;
        $this->internet = $internet;
        $this->iptu = $iptu;
        $this->valorOutros = $valorOutros;
        $this->valorParcial = $this->aluguel + $this->agua + $this->luz + $this->telefone +
        $this->internet + $this->iptu + $this->valorOutros;
        $this->pecasProduzidasMes = $ppm;
        $this->valorTotal = $this->valorParcial / $this->pecasProduzidasMes;
    }

    public function inserir(){
        $sql = "INSERT INTO custos_fixos(aluguel,agua,luz,telefone,internet,iptu,valor_outros,valor_parcial,pecas_produzidas_mes,
        valor_total) VALUES (?,?,?,?,?,?,?,?,?,?)";
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param("ddddddddid",$this->aluguel,$this->agua,$this->luz,$this->telefone,$this->internet,$this->iptu,$this->valorOutros,
        $this->valorParcial,$this->pecasProduzidasMes,$this->valorTotal);
        $stmt->execute();
        $stmt->close() or die('Falha na inserção');

        $sql = "SELECT id FROM custos_fixos ORDER BY id DESC LIMIT 1";
        $id = $this->conexao->query($sql);
        $id = mysqli_fetch_row($id);
        $this->id = $id[0];
    }

}