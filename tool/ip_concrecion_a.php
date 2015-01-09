<?php
session_start();
include_once("../classes/mysql.php");
include_once("../classes/cambiaf_a_mysql.class.php");
$mysql=new MySQL();

if(isset($_POST['rubro'])){
	$rubro=$_POST['rubro'];
}
/*
if(isset($_POST['empresa'])){
	$empresa=($_POST['empresa']);
}
if(isset($_SESSION['vendedor'])){
	$vendedor=($_SESSION['vendedor']);
}
if(isset($_POST['edicion'])){
	$edicion=($_POST['edicion']);
}*/
if(isset($_POST['anuncio'])){
	$anuncio=($_POST['anuncio']);
}
if(isset($_POST['pagado'])){
	$pagado=($_POST['pagado']);
}

$sql=$mysql->consulta("UPDATE prospecta_concrecion SET anuncio='$anuncio',pagado='$pagado' WHERE id = '$rubro' ");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
//	echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=3";</script>';
	echo 'Algo indecible ha ocurrido.';
}else{
		echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=1&rubro='.$rubro.'";</script>';

		unset($_SESSION['empresa']);
		unset($_SESSION['edicion']);
		unset($_SESSION['rubro']);
		echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=8"</script>';
}
?>