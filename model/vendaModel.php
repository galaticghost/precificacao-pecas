<?php
require_once('conexaoModel.php');
require_once('custosVariaveisModel.php');
require_once('horasTrabalhadasModel.php');
require_once('custosFixosModel.php');

class Venda extends Conexao{
    
    private $idCustosVariavel;
    private $idHorasTrabalhadas;
    private $idCustosFixos;
    private $totalParcial;
    private $margemLucro;
    private $valorLucro;
    private $despesaComercializacao;
    private $valorDespesa;
    private $valorTotal;

    public function setIds(){
    //    $this->idCustosVariavel = 
        $this->idHorasTrabalhadas = 8;
}

    public function consultarTotalParcial(){
        $sql = 'SELECT valor_total FROM custos_variaveis WHERE id = ? ;';
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('i',$this->idCustosVariavel);
        $totalVariaveis = $stmt->execute();
        $stmt->close();

        $sql = 'SELECT valor_total_horas FROM horas_trabalhadas WHERE id = ?;';
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('i',$this->idHorasTrabalhadas);
        $valorHora = $stmt->execute();
        $stmt->close();

        $sql = 'SELECT valor_total FROM custos_fixos WHERE id = ?';
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('i',$this->idCustosFixos);
        $totalFixos = $stmt->execute();
        $stmt->close();

        $this->totalParcial = $totalVariaveis + $valorHora + $totalFixos;
    }

    public function calcularLucro($margemLucro){
        $valorLucro = $this->totalParcial * $margemLucro;
    }

    public function calcularDespesas($despesaComercializacao){
        $valorDespesa = $this->totalParcial * $despesaComercializacao;
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
    }
}