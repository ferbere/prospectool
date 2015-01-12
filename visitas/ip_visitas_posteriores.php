<?php
session_start();
include_once("classes/mysql.php");
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

/*if(isset($_POST['concrecion'])){
	$concrecion=($_POST['concrecion']);
}*/
$sql=$mysql->consulta("INSERT INTO prospecta_visita_seg (visita,resultado,resuelve) VALUES ('{$rubro}','{$resultado}','{$resuelve}')");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
	echo 'Algo indecible ha ocurrido.';
}else{
	if($concrecion==0){
		echo '<script>window.location.href="visitas.php?ruta=&form=1&rubro='.$rubro.'";</script>';
	}elseif($concrecion==1){
		$_SESSION['empresa']=$empresa;
		$_SESSION['edicion']=$edicion;
		$_SESSION['rubro']=$rubro;
		echo '<script>window.location.href="visitas.php?ruta=&form=5"</script>';
	}	
	echo '<script>window.location.href="index.php?ruta=visitas.php&form=8"</script>';
	break;
}
?>