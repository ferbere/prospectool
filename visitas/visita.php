<?php
session_start();

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