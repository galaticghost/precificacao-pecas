<?php
require_once('conexaoModel.php');

class HorasTrabalhadas extends Conexao{
    private $id;
    private $numeroHoras;
    private $salarioDesejado;
    private $valorHora;
    private $valorTotalHoras;

    public function setId($id){
        $this->id = $id;
    }

    public function getId(){
        return $this->id;
    }
    
    public function setNumeroHoras($numeroHoras){
        $this->numeroHoras = $numeroHoras;
    }

    public function getNumeroHoras(){
        return $this->numeroHoras;
    }    
    public function setSalarioDesejado($salarioDesejado){
        $this->salarioDesejado = $salarioDesejado;
    }

    public function getSalarioDesejado(){
        return $this->salarioDesejado;
    }
    public function setValorHora($valorHora){
        $this->valorHora = $valorHora;
    }

    public function getValorHora(){
        return $this->valorHora;
    }
    public function setValorTotalHoras($valorTotalHoras){
        $this->valorTotalHoras = $valorTotalHoras;
    }

    public function getValorTotalHoras(){
        return $this->valorTotalHoras;
    }        

    public function __construct($salarioDesejado,$numeroHoras){
        parent::__construct();
        $this->salarioDesejado = $salarioDesejado;
        $this->valorHora = round(($salarioDesejado / 176),2);
        $this->numeroHoras = $numeroHoras;
        $this->valorTotalHoras = round(($this->valorHora * $this->numeroHoras),2);
    }
    
    public function inserir(){
        $sql = "INSERT INTO horas_trabalhadas(numero_horas,salario_desejado,
        valor_hora,valor_total_horas) VALUES (?,?,?,?);";
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('iddd',$this->numeroHoras,$this->salarioDesejado,
        $this->valorHora,$this->valorTotalHoras);
        $stmt->execute() or
        die('Falha na inserção');

        $sql = "SELECT id FROM horas_trabalhadas ORDER by id DESC LIMIT 1";
        $id = $this->conexao->query($sql);
        $id = mysqli_fetch_row($id);
        $this->id = $id[0];
    } 
}