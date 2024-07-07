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

    public function handleRequest(){
        if (isset($_GET['quantidadeMateriais'])){
            $this->inserirCustosVariaveis();
        }
    }
}

$vendaController = new VendaController();
$vendaController->handleRequest();
