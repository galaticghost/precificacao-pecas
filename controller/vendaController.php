<?php
    require_once('../model/vendaModel.php');
    
    if ((strlen($_POST['valorOutros']) != 0) && (strlen($_POST['pecasOutros']) != 0)){
        $valorOutros = $_POST['valorOutros'];
        $pecasOutros = $_POST['pecasOutros'];
    } else {
        $valorOutros = null;
        $pecasOutros = null;
    }        

    // Custos Variáveis
    
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
    $valorOutros,$pecasOutros);

    $custosVariaveis->inserirESetId();

    var_dump($custosVariaveis->getXina());

    $idCustosVariaveis = $custosVariaveis->getId();

    for($i = 0; $i < $_GET['quantidadeMateriais']; $i++){
        ${'material' . $i}->setIdCv($idCustosVariaveis);
        ${'material' . $i}->inserir();
    }
    
    // Horas Trabalhadas

    $horasTrabalhadas = new HorasTrabalhadas($_POST['salarioDesejado'],$_POST['numeroHoras']);
    $horasTrabalhadas->inserir();
    
    // Custos Fixos
    
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

    //Venda

    $venda = new venda($_POST['margemLucro'],$_POST['despesaComercializacao']);
    $venda->setIds($custosVariaveis->getId(),$horasTrabalhadas->getId(),$custosFixos->getId());
    $venda->consultarTotalParcial();
    $venda->calcularLucro();
    $venda->calcularDespesas();
    $venda->calcularTotalVenda();
    $venda->inserir();