<?php
session_start();
header('Location: '.$_SERVER['PHP_SELF'].'?ruta=if_a.php&cancelar='.$_GET['cancelar']);
include_once("../classes/mysql.php");
$mysql=new MySQL();
if(isset($_GET['cancelar'])){
	$cancelar=$_GET['cancelar'];
}

date_default_timezone_set("US/Eastern");
$iden2= date("Y-m-d H:i:s");


$sql=$mysql->consulta("SELECT id FROM restaurante_consumo  WHERE estatus = 0 AND mesa = ".$_SESSION['mesa']);
$row=$mysql->num_rows($sql);
if($row<=1){

	$sql=$mysql->consulta("UPDATE restaurante_consumo  SET estatus = 2,cierra ='$iden2' WHERE id = '$cancelar' ");

}else{

	$sql=$mysql->consulta("UPDATE restaurante_consumo  SET estatus = 2 WHERE id = '$cancelar' ");

}
	



?>