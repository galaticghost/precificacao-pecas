<?php
    require_once('../model/vendaModel.php');
    
    if ((strlen($_POST['valorOutros']) != 0) && (strlen($_POST['pecasOutros']) != 0)){
        $valorOutros = $_POST['valorOutros'];
        $pecasOutros = $_POST['pecasOutros'];
    } else {
        $valorOutros = 0;
        $pecasOutros = 1;
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
    for($x = 0; $x < $_GET['quantidadeCustoFixo']; $x++){
        ${'outro' . $x} = new CustosFixosOutro($_POST['outro' . $x],$_POST['valorOutro' . $x]);
        $totalOutros += ${'outro' . $x}->getValor();
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

    $qM = $_GET['quantidadeMateriais'];
    $idCV = $custosVariaveis->getId();
    $vP = $custosVariaveis->getTotalParcial();
    $e = $custosVariaveis->getEmbalagem();
    $c = $custosVariaveis->getCartoes();
    $et = $custosVariaveis->getEtiquetas();
    $f = $custosVariaveis->getFrete();
    $o = $custosVariaveis->getOutros();
    $vT = $custosVariaveis->getValorTotal();

    $sD = $horasTrabalhadas->getSalarioDesejado();
    $nH = $horasTrabalhadas->getNumeroHoras();
    $vH = $horasTrabalhadas->getValorHora();
    $vTH = $horasTrabalhadas->getValorTotalHoras();

    $qCFO = $_GET['quantidadeCustoFixo'];
    $idCF = $custosFixos->getId();
    $al = $custosFixos->getAluguel();
    $ag = $custosFixos->getAgua();
    $l = $custosFixos->getLuz();
    $t = $custosFixos->getTelefone();
    $in = $custosFixos->getInternet();
    $iptu = $custosFixos->getIptu();
    $vPF = $custosFixos->getValorParcial();
    $ppm = $custosFixos->getPPM();
    $vTF = $custosFixos->getValorTotal();

    $ml = $venda->getMargemLucro();
    $dc = $venda->getDespesaComercializacao();

    $tpv = $venda->getTotalParcial();
    $mlV = $venda->getValorLucro();
    $dcV = $venda->getValorDespesa();
    $tv = $venda->getValorTotal();

    header('Location: ../view/resultado.php?vP=' . $vP . '&e=' . $e[0] . '&c=' . $c[0] . '&et=' . $et[0] . '&f=' . $f[0] . '&o=' . $o[0] . '&vT=' . $vT . '&sD=' . $sD . '&nH=' . $nH . '&vH=' . $vH . '&vTH=' . $vTH . '&al=' . $al . '&ag=' . $ag . '&l=' . $l .'&t=' . $t . '&in=' . $in . '&iptu=' . $iptu . '&vPF=' . $vPF . '&ppm=' . $ppm . '&vTF=' . $vTF . '&ml=' . $ml . '&dc=' . $dc . '&tpv=' . $tpv . '&mlV=' . $mlV . '&dcV=' . $dcV . '&tv=' . $tv . '&eP=' . $e[1] . '&cP=' . $c[1] . '&etP=' . $et[1] . '&fP=' . $f[1] . '&oP=' . $o[1] . '&qM=' . $qM . '&idCV=' . $idCV . '&idCF=' . $idCF . '&qCFO=' . $qCFO);