<?php
session_start();
include_once("classes/mysql.php");
$mysql=new MySQL();

if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
if(empty($form)){
include("bus_prospectos.php");
}elseif($form=='if'){
	include("if_prospecto.php");		
}elseif($form==1){
	include("ip_prospecto.php");
}elseif($form==2){
	echo 'Registro existoso';
}elseif($form==3){
	echo 'Registro fallido';
}elseif($form==4){
	include("dis_prospecto.php");
}elseif($form==6){
	include("ip_prospecto_a.php");
}elseif($form==7){
	echo 'Registro modificado';
}elseif($form==8){
	echo 'Registro no modificado';
}