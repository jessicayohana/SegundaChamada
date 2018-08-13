<?php
/**
 * Created by PhpStorm.
 * User: Jéssica Yohana Otto
 * Date: 13/08/2018
 * Time: 15:44
 */

class CrudCoordenador
{
    private $conexao;
    public $coordenador;

    public function __construct()
    {
        $this->conexao = Conexao::getConexao();
    }

    public function salvar( Coordenador $coordenador)
    {
        $sql = ("INSERT INTO coordenador (nome, email, senha, matricula) 

        VALUES ('{$coordenador->getNome()}', '{$coordenador->getEmail()}', '{$coordenador->getSenha()}',{$coordenador->getMatricula()})");
        $this->conexao->exec($sql);
    }

    public function editar(Coordenador $coordenador)
    {
        $sql = "UPDATE coordenador set nome = '{$coordenador->getNome()}', email = '{$coordenador->getEmail()}',
        senha = '{$coordenador->getSenha()}' WHERE matricula = '{$coordenador->getMatricula()}'";

        $this->conexao->exec($sql);
    }

    public function excluir(Coordenador $coordenador)
    {
        $sql = "DELETE  FROM aluno WHERE matricula ='{$coordenador->getMatricula}'";
        $this->conexao->exec($sql);
    }


    public function getCoordenador()
    {
        $consulta = $this->conexao->query("SELECT * FROM tipo_coordenador");
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public function login(Coordenador $coordenador)
    {
        $sql = $this->conexao->prepare("SELECT email, nome, senha, matricula FROM tipo_coordenador WHERE nome = '{$coordenador->getNome()}' AND senha = '{$coordenador->getSenha()}'");
        $sql->execute();
        $count = $sql->rowCount();
        try {
            if ($count == 1) {
                session_start();
                $_SESSION['logado'] = 'sim';
                $coordenador = new CrudCoordenador();
                $coordenador->login();
                header('location: ../views/profile.html');
            }
        } catch
        (PDOException $e) {
            return $e->getMessage();
        }

    }

}