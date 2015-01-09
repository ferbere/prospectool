<?php
session_start();
include_once("../classes/mysql.php");
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
$sql=$mysql->consulta("UPDATE prospecta_visita_seg SET resuelve='$resuelve',resultado='$resultado' WHERE visita ='$rubro'");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
//	echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=3";</script>';
	echo 'Algo indecible ha ocurrido.';
}else{
/*	if($concrecion==0){
		echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=1&rubro='.$rubro.'";</script>';
	}elseif($concrecion==1){
		$_SESSION['empresa']=$empresa;
		$_SESSION['edicion']=$edicion;
		$_SESSION['rubro']=$rubro;*/
		echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=8"</script>';

	//}	
}
?>