<?php
session_start();
include_once("../classes/mysql.php");
include_once("../classes/cambiaf_a_mysql.class.php");
$mysql=new MySQL();

if(isset($_POST['id'])){
	$id=($_POST['id']);
}
if(isset($_POST['edicion'])){
	$edicion=($_POST['edicion']);
}
if(isset($_POST['concrecion'])){
	$concrecion=($_POST['concrecion']);
}
if(isset($_POST['fecha'])){
	$fecha=$_POST['fecha'];
}
if(isset($_POST['empresa'])){
	$empresa=($_POST['empresa']);
}
if(isset($_POST['se_anuncia'])){
	$se_anuncia=($_POST['se_anuncia']);
}
if(isset($_POST['se_anuncia_d'])){
	$se_anuncia_d=($_POST['se_anuncia_d']);
}
if(isset($_POST['se_anuncia_so'])){
	$se_anuncia_so=($_POST['se_anuncia_so']);
}
if(isset($_POST['se_intereso'])){
	$se_intereso=($_POST['se_intereso']);
}
if(isset($_POST['resuelve'])){
	$resuelve=($_POST['resuelve']);
}
if(isset($_POST['observaciones_v'])){
	$observaciones_v=($_POST['observaciones_v']);
}
if(isset($_POST['observaciones_g'])){
	$observaciones_g=($_POST['observaciones_g']);
}
if(isset($_POST['observaciones_dg'])){
	$observaciones_dg=($_POST['observaciones_dg']);
}
if(isset($_POST['que_dijo'])){
	$que_dijo=($_POST['que_dijo']);
}
$sql=$mysql->consulta("INSERT INTO prospecta_visita (edicion,concrecion,fecha,vendedor,empresa,se_anuncia,se_anuncia_d,se_anuncia_so,se_intereso,resuelve,observaciones_v,observaciones_g,observaciones_dg,que_dijo) values ('{$edicion}','{$concrecion}','{cambiaf_a_mysql($fecha)}','{$_SESSION['id']}','{$empresa}','{$se_anuncia}','{$se_anuncia_d}','{$se_anuncia_so}','{$se_intereso}','{$resuelve}','{$observaciones_v}','{$observaciones_g}','{$observaciones_dg}','{$que_dijo}')");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
	echo '<script>window.location.href="index.php?ruta=visita.php&form=3";</script>';
}else{
	if($concrecion==0){
		echo '<script>window.location.href="index.php?ruta=visita.php&form=2";</script>';
	}elseif($concrecion==1){
		echo '<script>window.location.href="Sindex.php?ruta=visita.php&form=4&prospecto='.$empresa.'&edicion='.$edicion.'&fecha='.$fecha.'";</script>';
	}	
}
?>