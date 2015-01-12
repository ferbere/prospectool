<?php
session_start();
include_once("classes/mysql.php");
include_once("classes/cambiaf_a_mysql.class.php");
$mysql=new MySQL();

$sql=$mysql->consulta("INSERT INTO prospecta_concrecion (id,empresa,edicion,vendedor) values ('{$_SESSION['rubro']}','{$_SESSION['empresa']}','{$_SESSION['edicion']}','{$_SESSION['id']}')");
if(!$sql){
	die ("Pos no se capturó el contenido, parece que: " .mysql_error());
	echo '<script>window.location.href="index.php?ruta=visita.php&form=3";</script>';
}else{
	echo '<script>window.location.href="index.php?ruta=ver_visita.php&form=6";</script>';
	break;
}
?>