<?php
session_start();
include_once("../classes/mysql.php");
$mysql=new MySQL();
$user= $_SESSION['user'];
$sql=$mysql->consulta("SELECT usuario_index.nombre FROM usuario_index WHERE usuario_index.user = '$user' ");
while($row=$mysql->fetch_array($sql)){
	$vendedor=$row[0];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
if(empty($form)){
	include("if_visita.php");
}elseif($form==1){
	include("ip_visita.php");
}elseif($form==2){
	echo 'Registro existoso';
}elseif($form==3){
	echo 'Registro fallido';
}/*elseif($form==4){
	include("ip_concrecion.php");
}*/