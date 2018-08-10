<?php
include "../models/CrudPedido.php";

function registrarPedido(){

    $curso         = $_POST['curso'];
    $turma         = $_POST['turma'];
    $disciplina    = $_POST['disciplina'];
    $professor     = $_POST['professor'];
    $dataAusencia  = $_POST['data'];
    $motivoAusencia= $_POST['motivo'];


    $pedido = new Pedido($curso, $turma, $disciplina, $professor, $dataAusencia, $motivoAusencia);

    $crudAluno = new CrudPedido();
    $crudAluno->salvar($pedido);

    header('location:../views/profile.html');

}

if ($_GET['acao'] == 'registrar'){
    registrarPedido();
}

else{
    echo 'ERRO';
}
