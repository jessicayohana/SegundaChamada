<?php

$con = mysqli_connect("localhost","root","","segundachamada");
// Check connection
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$sql="SELECT * FROM pedido";
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
    </tr>
    <?php while ($dado = $result-> fetch_array()){?>
    <tr>
        <td><?php echo $dado['curso'];?></td>
        <td><?php echo $dado['turma'];?></td>
        <td><?php echo $dado['disciplina'];?></td>
        <td><?php echo $dado['professor'];?></td>
        <td><?php echo $dado['data'];?></td>
        <td><?php echo $dado['motivo'];?></td>
    </tr>
    <?php }?>
</table>
</body>
</html>