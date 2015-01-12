<?php
session_start();
include_once("classes/mysql.php");
$mysql=new MySQL();

if(isset($_POST['xyo'])){
	$xyo=($_POST['xyo']);
}
if(isset($_POST['user'])){
	$user=($_POST['user']);
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
if(isset($_POST['privilegios'])){
	$privilegios=($_POST['privilegios']);
}
$vendedor=$_SESSION['id'];

$sql=$mysql->consulta("UPDATE prospecta_usuario SET user = '$user',nombre = '$nombre',imagen = '$imagen',nombramiento = '$nombramiento',email = '$email',telefono = '$telefono',celular= '$celular',domicilio = '$domicilio',poblacion= '$poblacion',estado = '$estado',cp = '$cp',rfc = '$rfc',privilegios = '$privilegios' WHERE id = '$xyo'");
if(!$sql){
	die ("Pos no se capturó el contenido,	 parece que: " .mysql_error());
	echo '<script>window.location.href="vendedores.php?ruta=directorio&form=8";</script>';
}else{
	echo '<script>window.location.href="vendedores.php?ruta=directorio&form=7";</script>';
}
?>