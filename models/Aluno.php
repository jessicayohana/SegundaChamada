<?php
/**
 * Created by PhpStorm.
 * User: Jéssica Yohana Otto
 * Date: 18/04/2018
 * Time: 12:47
 */

require_once 'Conexao.php';

class Aluno
{
    public  $nome;
    public  $email;
    public  $senha;
    public  $matricula;


    public function __construct($nome, $email, $senha, $matricula)
    {
        $this->nome      = $nome;
        $this->email     = $email;
        $this->senha     = $senha;
        $this->matricula = $matricula;
    }

    /**
     * @return string
     */
    public function getNome(): string
    {
        return $this->nome;
    }

    /**
     * @param string $nome
     */
    public function setNome(string $nome)
    {
        $this->nome = $nome;
    }


    /**
     * @return string
     */
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail(string $email)
    {
        $this->email = $email;
    }

    /**
     * @return string
     */
    public function getSenha(): string
    {
        return $this->senha;
    }

    /**
     * @param string $senha
     */
    public function setSenha(string $senha)
    {
        $this->senha = $senha;
    }


    /**
     * @return string
     */
    public function getMatricula(): string
    {
        return $this->matricula;
    }

    /**
     * @param string $matricula
     */
    public function setMatricula(string $matricula)
    {
        $this->matricula = $matricula;
    }

}