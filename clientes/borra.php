<?php
session_start();
if(isset($_GET['s'])){
	$s=$_GET['s'];
}
header("Location: clientes.php?ruta=".$s."&criterio=+");
include_once('classes/mysql.php');
$mysql=new MySQL();
if(isset($_GET['xyo'])){
	$xyo=$_GET['xyo'];
}
if(isset($_GET['borra'])){
	$borra=$_GET['borra'];
}
if($borra==1){
	mysql_query("DELETE FROM prospecta_directorio WHERE id = '$xyo' ");
}
?>