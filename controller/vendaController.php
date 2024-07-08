<?php
require_once('../model/vendaModel.php');

class VendaController {
    
    private $valorOutros;
    private $pecasOutros;

    public function __construct(){
        if ((strlen($_POST['valorOutros']) != 0) && (strlen($_POST['pecasOutros']) != 0)){
            $this->valorOutros = $_POST['valorOutros'];
            $this->pecasOutros = $_POST['pecasOutros'];
        } else {
            $this->valorOutros = null;
            $this->pecasOutros = null;
        }        
    }
    
    public function inserirCustosVariaveis(){
        $totalParcial = 0;
        for($i = 0; $i < $_GET['quantidadeMateriais']; $i++){
            ${'material' . $i} = new Material($_POST['material' . $i],$_POST['valor' . $i],$_POST['pecas' . $i]);
            $totalParcial += ${'material' . $i}->getValorTotalMaterial();
        }
        
        $custosVariaveis = new CustosVariaveis($totalParcial,
        $_POST['valorEmbalagem'],$_POST['pecasEmbalagem'],
        $_POST['valorCartao'],$_POST['pecasCartao'],
        $_POST['valorEtiqueta'],$_POST['pecasEtiqueta'],
        $_POST['valorFrete'],$_POST['pecasFrete'],
        $this->valorOutros,$this->pecasOutros);

        $custosVariaveis->inserirESetId();

        $idCustosVariaveis = $custosVariaveis->getId();

        for($i = 0; $i < $_GET['quantidadeMateriais']; $i++){
            ${'material' . $i}->setIdCv($idCustosVariaveis);
            ${'material' . $i}->inserir();
        }
    }

    public function inserirHorasTrabalhadas(){
        
    }

    public function inserirCustosFixos(){
        $totalOutros = 0;
        for($i = 0; $i < $_GET['quantidadeCustoFixo']; $i++){
            ${'outro' . $i} = new CustosFixosOutro($_POST['outro' . $i],$_POST['valorOutro' . $i]);
            $totalOutros += ${'outro' . $i}->getValor();
        }

        $custosFixos = new CustosFixos($_POST['valorAluguel'],$_POST['valorAgua'],
        $_POST['valorLuz'], $_POST['valorTelefone'], $_POST['valorInternet'],
        $_POST['valorIptu'],$totalOutros,$_POST['ppm']);

        $custosFixos->inserir();

        $idCustosFixos = $custosFixos->getId();

        for($i = 0; $i < $_GET['quantidadeCustoFixo']; $i++){
            ${'outro' . $i}->setIdCustosFixos($idCustosFixos);
            ${'outro' . $i}->inserir();
        }
    }

    public function inserirVenda(){

    }

    public function handleRequest(){
        if (isset($_GET['quantidadeMateriais'])){
            $this->inserirCustosVariaveis();
            $this->inserirHorasTrabalhadas();
            $this->inserirCustosFixos();
            $this->inserirVenda();
        }
    }
}

$vendaController = new VendaController();
$vendaController->handleRequest();
