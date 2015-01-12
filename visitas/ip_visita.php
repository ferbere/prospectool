<?php
session_start();
include_once("classes/mysql.php");
include_once("classes/cambiaf_a_mysql.class.php");
$mysql=new MySQL();

if(isset($_POST['rubro'])){
	$rubro=$_POST['rubro'];
}
if(isset($_POST['edicion'])){
	$edicion=($_POST['edicion']);
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
if(isset($_POST['que_dijo'])){
	$que_dijo=($_POST['que_dijo']);
}
if(isset($_POST['concrecion'])){
	$concrecion=($_POST['concrecion']);
}

$vendedor=$_SESSION['id'];

$sql=$mysql->consulta("INSERT INTO prospecta_visita (edicion,empresa,se_anuncia,se_anuncia_d,se_anuncia_so,se_intereso,resuelve,observaciones_v,que_dijo,concrecion,vendedor) VALUES ('{$edicion}','{$empresa}','{$se_anuncia}','{$se_anuncia_d}','{$se_anuncia_so}','{$se_intereso}','{$resuelve}','{$observaciones_v}','{$que_dijo}','{$concrecion}','{$vendedor}')");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
	echo '<script>window.location.href="visita.php?&form=3";</script>';
	echo 'Algo indecible ha ocurrido.';
}else{
	if($concrecion==0){
		echo '<script>window.location.href="visitas.php?&form=8";</script>';
	}elseif($concrecion==1){
		$_SESSION['empresa']=$empresa;
		$_SESSION['edicion']=$edicion;
		$_SESSION['rubro']=$rubro;
		echo '<script>window.location.href="visitas.php?form=5"</script>';
	}
	break;
}
?>