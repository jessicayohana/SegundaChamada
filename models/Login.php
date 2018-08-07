<?php
session_start();
require_once 'Conexao.php';

class Login
{
    private $conexao;
    public $email_form;
    public $password_form;

    public function __construct() {
        $this->conexao = Conexao::getConexao();
    }
    public function logar($email_form, $password_form){
        $sql = ("SELECT count(matricula_aluno) AS linhas, matricula_aluno, nome FROM aluno WHERE email='$email_form' AND senha='$password_form'");
        $result = $this->conexao->query($sql);
        if ($result == null){
            header("location:../controllers/login.php?acao4=erro");
        }
        else{
            $row = $result->fetch(PDO::FETCH_ASSOC);
            $matricula_aluno = $row['matricula'];
            $nome = $row['nome'];
            $quantidadelinhas = $row['linhas'];
            if ($quantidadelinhas == 1){
                $_SESSION['matricula'] = $matricula_aluno;
                $_SESSION['nome'] = $nome;
                header("location:../controllers/login.php?acao3=logado");
            }
            else{
                header("location:../controllers/login.php?acao5=erro2");
            }
        }
    }

    public function deslogar(){

        session_destroy();
        header("location:../controllers/login.php?acao=logar");
    }
}
?>