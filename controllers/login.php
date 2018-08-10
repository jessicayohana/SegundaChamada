<?php
include "../models/Login.php";
if (!empty($_GET['acao']) == 'logar'){
    require_once "../views/profile.html";
}
if(!empty($_GET['acao2']) == 'form'){

    $email_form = $_POST['email'];
    $password_form = $_POST['senha'];

    $login = new Login();
    $login->logar($email_form, $password_form);


}
if(!empty($_GET['acao3']) == 'logado'){
    require_once "../views/profile.html";
}
if(!empty($_GET['acao4']) == 'erro'){
    require_once "../views/login.html";
}
if(!empty($_GET['acao5']) == 'erro2'){
    require_once "../views/login.html";
}
if(!empty($_GET['acao6']) == 'deslogar'){
    $login = new Login();
    $login->deslogar();
}

?>
