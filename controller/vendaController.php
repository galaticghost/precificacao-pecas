<?php
require_once('vendaModel.php');

class VendaController {
    
    public function inserirCustosVariaveis(){
        for($i = 0; $i < $_GET['quantidadeMateriais']; $i++){
            ${'material' . $i} = new Material($_POST['material' . $i],$_POST['valor' . $i],$_POST['pecas' . $i]);
            $totalParcial += ${'material' . $i}->valorTotalMaterial;
        }
        $custosVariaveis = new CustosVariaveis($totalParcial,
        $_POST['valorEmbalagem'],$_POST['quantidadeEmbalagem'],
        $_POST['valorCartoes'],$_POST['quantidadeCartoes'],
        $_POST['valorEtiquetas'],$_POST['quantidadeEtiquetas'],
        $_POST['valorFrete'],$_POST['quantidadeFrete'],
        $_POST['valorOutros'],$_POST['quantidadeOutros']);
    }

    public function handleRequest(){
        if (isset($_GET['quantidadeMateriais'])){
            $this->inserirCustosVariaveis();
        }
    }
}

$vendaController = new VendaController();
$vendaController->handleRequest();
