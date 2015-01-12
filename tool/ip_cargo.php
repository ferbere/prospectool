<?php
session_start();
include_once('classes/conex.php');
$link=Conectarse();
if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_POST['nombre'])){
	$nombre=$_POST['nombre'];
}
if(isset($_POST['visible'])){
	$visible=$_POST['visible'];
}
$que=mysql_query("INSERT INTO prospecta_cargo (nombre,visible) VALUES ('{$nombre}','{$visible}') ",$link);
if(!$que){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
}else{
	echo '<script>window.location.href="tool.php?ruta=if_cargo.php&capturado=1";</script>';
	break;
}
?>