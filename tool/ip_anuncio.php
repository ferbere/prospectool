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
if(isset($_POST['medidas'])){
	$medidas=$_POST['medidas'];
}
if(isset($_POST['precio'])){
	$precio=$_POST['precio'];
}
if(isset($_POST['visible'])){
	$visible=$_POST['visible'];
}
$que=mysql_query("INSERT INTO prospecta_anuncio (nombre,medidas,precio,visible) VALUES ('{$nombre}','{$medidas}','{$precio}','{$visible}')");
if(!$que){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
}else{
	echo '<script>window.location.href="tool.php?ruta=if_anuncio.php&capturado=1";</script>';
	break;
}
?>