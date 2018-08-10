<?php
/**
 * Created by PhpStorm.
 * User: Jéssica Yohana Otto
 * Date: 18/04/2018
 * Time: 13:24
 */

require_once 'Conexao.php';
require_once 'Aluno.php';

class CrudAluno
{
    private $conexao;
    public $aluno;

    public function __construct()
    {
        $this->conexao = Conexao::getConexao();
    }

    public function salvar(Aluno $aluno)
    {
        $sql = ("INSERT INTO aluno (nome, email, senha, matricula) 

        VALUES ('{$aluno->getNome()}', '{$aluno->getEmail()}', '{$aluno->getSenha()}',{$aluno->getMatricula()})");
        $this->conexao->exec($sql);
    }

    public function editar(Aluno $aluno)
    {
        $sql = "UPDATE aluno set nome = '{$aluno->getNome()}', email = '{$aluno->getEmail()}',
        senha = '{$aluno->getSenha()}' WHERE matricula_aluno = '{$aluno->getMatricula()}'";

        $this->conexao->exec($sql);
    }

    public function excluir(Aluno $aluno)
    {
        $sql = "DELETE  FROM aluno WHERE matricula_aluno ='{$aluno->getMatricula}'";
        $this->conexao->exec($sql);
    }


    public function getAluno()
    {
        $consulta = $this->conexao->query("SELECT * FROM tipo_aluno");
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }

    public function login(Aluno $aluno)
    {
        $sql = $this->conexao->prepare("SELECT email, nome, senha, matricula FROM tipo_aluno WHERE nome = '{$aluno->getNome()}' AND senha = '{$aluno->getSenha()}'");
        $sql->execute();
        $count = $sql->rowCount();
        try {
            if ($count == 1) {
                session_start();
                $_SESSION['logado'] = 'sim';
                $aluno = new CrudAluno();
                $aluno->login();
                header('location: ../views/profile.html');
            }
        } catch
        (PDOException $e) {
            return $e->getMessage();
        }

    }
}

/*                switch ($obj->verificaTipo($user)) {
                    case 'comum':
                        header('location: ../../index.php');
                        break;
                    case 'admin':
                        $_SESSION['tipo'] = 'admin';
                        header('location: ../../index.php');
                        break;
                }
            } else {
                header('location: ../../index.php?acao=login&erro=1');
            }
*/