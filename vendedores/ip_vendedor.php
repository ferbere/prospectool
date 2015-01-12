<?php
session_start();
include_once("classes/mysql.php");
$mysql=new MySQL();

if(isset($_POST['user'])){
	$user=addslashes(trim($_POST['user']));
}
if(isset($_POST['contrasenya'])){
	$passwd=md5(addslashes(trim($_POST['contrasenya'])));
}
if(isset($_POST['nombre'])){
	$nombre=($_POST['nombre']);
}
if(isset($_POST['imagen'])){
	$imagen=($_POST['imagen']);
}
if(isset($_POST['nombramiento'])){
	$nombramiento=($_POST['nombramiento']);
}
if(isset($_POST['email'])){
	$email=($_POST['email']);
}
if(isset($_POST['telefono'])){
	$telefono=($_POST['telefono']);
}
if(isset($_POST['celular'])){
	$celular=($_POST['celular']);
}
if(isset($_POST['domicilio'])){
	$domicilio=($_POST['domicilio']);
}
if(isset($_POST['poblacion'])){
	$poblacion=($_POST['poblacion']);
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

$sql=$mysql->consulta("INSERT INTO prospecta_usuario (user,passwd,nombre,imagen,nombramiento,email,telefono,celular,domicilio,poblacion,estado,cp,rfc) values ('{$user}','{$passwd}','{$nombre}','{$imagen}','{$nombramiento}','{$email}','{$telefono}','{$celular}','{$domicilio}','{$poblacion}','{$estado}','{$cp}','{$rfc}')");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
	echo '<script>window.location.href="vendedores.php?ruta=directorio&form=3";</script>';
}else{
	echo '<script>window.location.href="vendedores.php?ruta=directorio&form=2";</script>';
	break;
}
?>