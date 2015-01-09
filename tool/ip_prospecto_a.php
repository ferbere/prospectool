<?php
session_start();
include_once("../classes/mysql.php");
$mysql=new MySQL();

if(isset($_POST['xyo'])){
	$xyo=($_POST['xyo']);
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
$vendedor=$_SESSION['id'];

$sql=$mysql->consulta("UPDATE prospecta_directorio SET nombre = '$nombre',empresa = '$empresa',cargo = '$cargo',direccion = '$direccion',ciudad = '$ciudad',estado = '$estado',cp = '$cp',rfc = '$rfc',email = '$email',telefono = '$telefono',caracter = '$caracter',perspectiva = '$perspectiva',vendedor = '$vendedor' WHERE id = '$xyo'");
if(!$sql){
	die ("Pos no se capturó el contenido,	 parece que: " .mysql_error());
	echo '<script>window.location.href="index.php?ruta=prospecto.php&form=8";</script>';
}else{
	echo '<script>window.location.href="index.php?ruta=prospecto.php&form=7";</script>';
}
?>