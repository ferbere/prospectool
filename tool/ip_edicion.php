<?php
session_start();
include_once('classes/conex.php');
$link=Conectarse();
if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_POST['numero'])){
	$numero=$_POST['numero'];
}
if(isset($_POST['desde'])){
	$desde=$_POST['desde'];
}
if(isset($_POST['hasta'])){
	$hasta=$_POST['hasta'];
}
if(isset($_POST['visible'])){
	$visible=$_POST['visible'];
}
$que=mysql_query("INSERT INTO prospecta_edicion (numero,desde,hasta,visible) VALUES ('{$numero}','{$desde}','{$hasta}','{$visible}') ",$link);
if(!$que){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
}else{
	echo '<script>window.location.href="tool.php?ruta=if_edicion.php&capturado=1";</script>';
	break;
}
?>