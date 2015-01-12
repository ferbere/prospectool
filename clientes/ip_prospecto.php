<?php
session_start();
include_once("../classes/mysql.php");
$mysql=new MySQL();

if(isset($_POST['id'])){
	$id=($_POST['id']);
}
if(isset($_POST['nombre'])){
	$nombre=($_POST['nombre']);
}
if(isset($_POST['empresa'])){
	$empresa=($_POST['empresa']);
}
if(isset($_POST['cargo'])){
	$cargo=($_POST['cargo']);
}
if(isset($_POST['direccion'])){
	$direccion=($_POST['direccion']);
}
if(isset($_POST['ciudad'])){
	$ciudad=($_POST['ciudad']);
}
if(isset($_POST['estado'])){
	$estado=($_POST['estado']);
}
if(isset($_POST['pais'])){
	$pais=($_POST['pais']);
}
if(isset($_POST['cp'])){
	$cp=($_POST['cp']);
}
if(isset($_POST['rfc'])){
	$rfc=($_POST['rfc']);
}
if(isset($_POST['email'])){
	$email=($_POST['email']);
}
if(isset($_POST['telefono'])){
	$telefono=($_POST['telefono']);
}
if(isset($_POST['caracter'])){
	$caracter=($_POST['caracter']);
}
if(isset($_POST['perspectiva'])){
	$perspectiva=($_POST['perspectiva']);
}
$sql=$mysql->consulta("INSERT INTO prospecta_directorio (nombre,empresa,cargo,direccion,ciudad,estado,pais,cp,rfc,email,telefono,caracter,perspectiva,vendedor) values ('{$nombre}','{$empresa}','{$cargo}','{$direccion}','{$ciudad}','{$estado}','{$pais}','{$cp}','{$rfc}','{$email}','{$telefono}','{$caracter}','{$perspectiva}','{$_SESSION['id']}')");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
	echo '<script>window.location.href="index.php?ruta=prospecto.php&form=3";</script>';
}else{
	echo '<script>window.location.href="index.php?ruta=prospecto.php&form=2";</script>';
}
?>