<?php

require_once "esqueceurecupera.html";

print_r($_POST);

if (isset($_POST['email']) AND !empty($_POST['email'])) {
    print_r($_POST);

    echo $_POST['email'];

} else {
    echo "ainda nao tem nada";
}
