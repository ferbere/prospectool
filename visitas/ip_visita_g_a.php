<?php
session_start();
include_once("classes/mysql.php");
include_once("classes/cambiaf_a_mysql.class.php");
$mysql=new MySQL();

if($_SESSION['privilegioss_id']==3){
	$obs1='observaciones_dg';
	if(isset($_POST['observaciones_dg'])){
		$obser=($_POST['observaciones_dg']);
	}
}elseif($_SESSION['privilegioss_id']==4){
	$obs1='observaciones_g';
	if(isset($_POST['observaciones_g'])){
		$obser=($_POST['observaciones_g']);
	}
}

if(isset($_POST['rubro'])){
	$rubro=$_POST['rubro'];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}

$sql=$mysql->consulta("UPDATE prospecta_visita SET ".$obs1." ='$obser' WHERE id = '$rubro' ");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
//	echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=3";</script>';
	echo 'Algo indecible ha ocurrido.';
}else{
	echo '<script>window.location.href="visitas.php?ruta=dia&form=1&rubro='.$rubro.'";</script>';
}
?>