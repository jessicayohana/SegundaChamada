<?php

require_once 'Conexao.php';
require_once 'Pedido.php';

class CrudPedido
{
    private $conexao;
    public $pedido;

    public function __construct()
    {
        $this->conexao = Conexao::getConexao();
    }

    public function salvar(Pedido $pedido)
    {
        $sql = ("INSERT INTO pedido (cod_pedido,cod_coordenador,matricula_aluno,data_prova,data_pedido,
                                observacao, motivo, anexo, status) 

        VALUES ('{$pedido->getcod_pedido()}', '{$pedido->getcod_coordenador()}', '{$pedido->getmatricula_aluno()}','{$pedido->getdata_prova()}', '{$pedido->getdata_pedido()}', '{$pedido->getobservacao()}', '{$pedido->getmotivo()}', '{$pedido->getanexo()}', '{$pedido->getstatus()}')";
        
        $this->conexao->exec($sql);
    }

    public function editar(Pedido $pedido)
    {
        $sql = "UPDATE pedido set cod_pedido = '{$pedido->getcod_pedido()}', cod_coordenador = '{$pedido->getcod_coordenador()}',
        matricula_aluno = '{$pedido->getmatricula_aluno()}', data_prova = '{$pedido->getdata_prova()}', data_pedido = '{$pedido->getdata_pedido()}', observacao = '{$pedido->getobservacao()}', motivo = '{$pedido->getmotivo()}', anexo = '{$pedido->getanexo()}'        WHERE cod_pedido = '{$pedido->getcod_pedido()}'";

        $this->conexao->exec($sql);
    }

    public function excluir(Pedido $pedido)
    {
        $sql = "DELETE  FROM pedido WHERE cod_pedido ='{$pedido->getcod_pedido}'";
        $this->conexao->exec($sql);
    }


}

