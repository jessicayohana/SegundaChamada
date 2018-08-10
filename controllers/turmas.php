<?php

include "../models/CrudPedido.php";

$con = mysqli_connect("localhost","root","","segundachamadateste");
// Check connection
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}


// Recuperamos a ação enviada pelo formulário
//$a = $_GET['a'];

// Verificamos se a ação é de busca

    if ($_GET['acao'] == "buscar") {

        // Pegamos a palavra
        $palavra = $_POST['dado'];

        // Verificamos no banco de dados produtos equivalente a palavra digitada
        $sql = "SELECT * FROM pedido WHERE curso LIKE '%" . $palavra . "%' ";
        $result=mysqli_query($con,$sql);

        ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <td>Curso</td>
        <td>Turma</td>
        <td>Disciplina</td>
        <td>Professor</td>
        <td>Data</td>
        <td>Motivo</td>
        <td>Aluno</td>
    </tr>
    <?php while ($dado = $result-> fetch_array()){?>
    <tr>
        <td><?php echo $dado['curso'];?></td>
        <td><?php echo $dado['turma'];?></td>
        <td><?php echo $dado['disciplina'];?></td>
        <td><?php echo $dado['professor'];?></td>
        <td><?php echo $dado['data'];?></td>
        <td><?php echo $dado['motivo'];?></td>
        <td><?php $sql="SELECT 'nome' FROM aluno "; echo $sql?>
        </td>

    </tr>
<?php }?>
</table>
</body>
</html>

<?php
            // Se não houver registros
        } else {
        echo "Nenhum produto foi encontrado com a palavra " . $palavra . "";
    }
?>