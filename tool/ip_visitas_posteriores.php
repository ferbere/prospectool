<?php
session_start();
include_once("../classes/mysql.php");
$mysql=new MySQL();

if(isset($_POST['rubro'])){
	$rubro=$_POST['rubro'];
}
if(isset($_POST['resuelve'])){
	$resuelve=$_POST['resuelve'];
}
if(isset($_POST['resultado'])){
	$resultado=$_POST['resultado'];
}
$sql=$mysql->consulta("INSERT INTO prospecta_visita_seg (visita,resultado,resuelve) VALUES ('{$rubro}','{$resultado}','{$resuelve}')");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
	echo 'Algo indecible ha ocurrido.';
}else{
	echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=8"</script>';
}
?>