<?php
session_start();
if(isset($_POST['estatus'])){
	$estatus=$_POST['estatus'];
}
if(isset($_GET['estatus'])){
	$estatus=$_GET['estatus'];
}
if(($estatus==1)||($_SESSION['privilegioss_id']==6)){
	header('Location: '.$_SERVER['PHP_SELF']);	
}else{
	header('Location: '.$_SERVER['PHP_SELF'].'?ruta=if_a.php');	
}

include_once("../classes/mysql.php");
$mysql=new MySQL();

if(isset($_GET['cliente'])){
	$cliente=$_GET['cliente'];
}
if(isset($_POST['cliente'])){
	$cliente=$_POST['cliente'];
}
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
}
if(!empty($cliente)){
	$mesa=0;
	$pagante=' AND cliente ='.$cliente;
}else{
	$mesa=$_SESSION['mesa'];
	$pagante='';
}

date_default_timezone_set("America/Mexico_City");
$iden2= date("Y-m-d H:i:s");

if($estatus==1){
	$sql=$mysql->consulta("UPDATE restaurante_consumo SET estatus = '$estatus' WHERE mesa = ".$mesa.$pagante." AND estatus = 0 AND cierra IS NULL");
	if(!$sql){
		die ("Pos no cambió el estatus, parece que: " .mysql_error());
	}else{
		echo 'Ya cambió el estatus. ¡Bien!';
	}

	$sql2=$mysql->consulta("UPDATE restaurante_consumo SET cierra ='$iden2' WHERE mesa = ".$mesa.$pagante." AND cierra IS NULL");
	if(!$sql2){
		die ('Pos no cerró el campo "cierra". ¿Ya estaría cerrado? ');
	}else{
		echo 'Bien, ya se cerró el campo "cierra".';
	}	
}elseif($estatus==2){
	$sql=$mysql->consulta("SELECT id FROM restaurante_consumo  WHERE estatus = 0 AND mesa = ".$_SESSION['mesa']);
	$row=$mysql->num_rows($sql);
	if($row<=1){

		$sql=$mysql->consulta("UPDATE restaurante_consumo  SET estatus = 2,cierra ='$iden2' WHERE id = '$rubro' ");

	}else{

		$sql=$mysql->consulta("UPDATE restaurante_consumo  SET estatus = 2 WHERE id = '$rubro' ");

	}
	
}elseif($estatus==3){
	$sql=$mysql->consulta("UPDATE restaurante_consumo SET estatus = '$estatus' WHERE mesa = ".$mesa.$pagante." AND estatus = 0 AND cierra IS NULL");
	if(!$sql){
		die ("Pos no cambió el estatus, parece que: " .mysql_error());
	}else{
		echo 'Ya cambió el estatus. ¡Bien!';
	}

	$sql2=$mysql->consulta("UPDATE restaurante_consumo SET cierra ='$iden2' WHERE mesa = ".$mesa.$pagante." AND cierra IS NULL");
	if(!$sql2){
		die ('Pos no cerró el campo "cierra". ¿Ya estaría cerrado? ');
	}else{
		echo 'Bien, ya se cerró el campo "cierra".';
	}	
}else{
	$entrega=date("Y-m-d H:i:s");
	$sql=$mysql->consulta("UPDATE restaurante_entrega SET estatus = '$estatus',entrega = '$entrega'  WHERE cliente = '$cliente' AND estatus = 4");
	if(!$sql){
		die ("Pos no cambió el estatus, parece que: " .mysql_error());
	}else{
		echo 'Ya cambió el estatus. ¡Bien!';
	}	
}


?>