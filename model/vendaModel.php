<?php
require_once('conexaoModel.php');
require_once('custosVariaveisModel.php');
require_once('horasTrabalhadasModel.php');
require_once('custosFixosModel.php');
require_once('custosFixosOutroModel.php');

class Venda extends Conexao{
    
    private $id;
    private $idCustosVariavel;
    private $idHorasTrabalhadas;
    private $idCustosFixos;
    private $totalParcial;
    private $margemLucro;
    private $valorLucro;
    private $despesaComercializacao;
    private $valorDespesa;
    private $valorTotal;
    
    public function __construct($margemLucro,$despesaComercializacao){
        parent::__construct();
        $this->margemLucro = $margemLucro;
        $this->despesaComercializacao = $despesaComercializacao;
    }

    public function setIds($idCV,$idHT,$idCF){
        $this->idCustosVariavel = $idCV;
        $this->idHorasTrabalhadas = $idHT;
        $this->idCustosFixos = $idCF;
}
    //valores dos custos variáveis, horas trabalhadas e custos fixos
    public function consultarTotalParcial(){
        $sql = 'SELECT valor_total FROM custos_variaveis WHERE id = ? ;';
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('i',$this->idCustosVariavel);
        $stmt->execute() or die('Falha na consulta');
        $valorVariaveis = $stmt->get_result();
        $valorVariaveis = mysqli_fetch_row($valorVariaveis);
        $stmt->close();

        $sql = 'SELECT valor_total_horas FROM horas_trabalhadas WHERE id = ?;';
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('i',$this->idHorasTrabalhadas);
        $valorHora = $stmt->execute() or die('Falha na consulta');
        $valorHora = $stmt->get_result();
        $valorHora = mysqli_fetch_row($valorHora);
        $stmt->close();

        $sql = 'SELECT valor_total FROM custos_fixos WHERE id = ?';
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('i',$this->idCustosFixos);
        $totalFixos = $stmt->execute() or die('Falha na consulta');
        $valorFixos = $stmt->get_result();
        $valorFixos = mysqli_fetch_row($valorFixos);
        $stmt->close();

        $this->totalParcial = $valorVariaveis[0] + $valorHora[0] + $valorFixos[0];
    }

    public function calcularLucro(){
        $this->valorLucro = round(($this->totalParcial * $this->margemLucro / 100),2);
    }

    public function calcularDespesas(){
        $this->valorDespesa = round(($this->totalParcial * $this->despesaComercializacao / 100),2);
    }

    public function calcularTotalVenda(){
        $this->valorTotal = $this->totalParcial + $this->valorLucro + $this->valorDespesa;
    }

    public function inserir(){
        $sql = 'INSERT INTO venda(id_custos_variaveis,id_horas_trabalhadas,id_custos_fixos,total_parcial,margem_lucro,
        despesas_comercializacao,total_venda) VALUES (?,?,?,?,?,?,?)';
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('iiidiid',$this->idCustosVariavel,$this->idHorasTrabalhadas,$this->idCustosFixos,
        $this->totalParcial,$this->margemLucro,$this->despesaComercializacao,$this->valorTotal);
        $stmt->execute() or die('Falha na inserção');
        $stmt->close();

        $sql = "SELECT id FROM venda ORDER BY id DESC LIMIT 1";
        $id = $this->conexao->query($sql);
        $id = mysqli_fetch_row($id);
        $this->id = $id[0]; 
    }

	public function getId() {
		return $this->id;
	}

	public function setId($value) {
		$this->id = $value;
	}

	public function getIdCustosVariavel() {
		return $this->idCustosVariavel;
	}

	public function setIdCustosVariavel($value) {
		$this->idCustosVariavel = $value;
	}

	public function getIdHorasTrabalhadas() {
		return $this->idHorasTrabalhadas;
	}

	public function setIdHorasTrabalhadas($value) {
		$this->idHorasTrabalhadas = $value;
	}

	public function getIdCustosFixos() {
		return $this->idCustosFixos;
	}

	public function setIdCustosFixos($value) {
		$this->idCustosFixos = $value;
	}

	public function getTotalParcial() {
		return $this->totalParcial;
	}

	public function setTotalParcial($value) {
		$this->totalParcial = $value;
	}

	public function getMargemLucro() {
		return $this->margemLucro;
	}

	public function setMargemLucro($value) {
		$this->margemLucro = $value;
	}

	public function getValorLucro() {
		return $this->valorLucro;
	}

	public function setValorLucro($value) {
		$this->valorLucro = $value;
	}

	public function getDespesaComercializacao() {
		return $this->despesaComercializacao;
	}

	public function setDespesaComercializacao($value) {
		$this->despesaComercializacao = $value;
	}

	public function getValorDespesa() {
		return $this->valorDespesa;
	}

	public function setValorDespesa($value) {
		$this->valorDespesa = $value;
	}

	public function getValorTotal() {
		return $this->valorTotal;
	}

	public function setValorTotal($value) {
		$this->valorTotal = $value;
	}
}