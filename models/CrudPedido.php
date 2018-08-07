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
        $sql = ("INSERT INTO pedido (curso,turma,disciplina,professor,data,
                                motivo) 
        VALUES ('{$pedido->getCurso()}', '{$pedido->getTurma()}', '{$pedido->getDisciplina()}','{$pedido->getProfessor()}','{$pedido->getData()}', '{$pedido->getMotivo()}')");

        $this->conexao->exec($sql);
    }

    public function editar(Pedido $pedido)
    {
        $sql = "UPDATE pedido set curso = '{$pedido->getCurso()}', turma= '{$pedido->getTurma()}',
        disciplina = '{$pedido->getDisciplina()}',professor = '{$pedido->getProfessor()}', data = '{$pedido->getData()}',motivo = '{$pedido->getMotivo()}'  WHERE curso = '{$pedido->getCurso()}'";
        $this->conexao->exec($sql);
    }

}
/*    public function excluir(Pedido $pedido)
    {
        $sql = "DELETE  FROM pedido WHERE cod_pedido ='{$pedido->getcod_pedido}'";
        $this->conexao->exec($sql);
    }
} */