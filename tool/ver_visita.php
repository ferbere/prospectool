<?php
session_start();
include_once("../classes/mysql.php");
$mysql=new MySQL();
$user= $_SESSION['user'];
$sql=$mysql->consulta("SELECT usuario_index.nombre FROM usuario_index WHERE usuario_index.user = '$user' ");
while($row=$mysql->fetch_array($sql)){
	$vendedor=$row[0];
}
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
}
if(isset($_POST['rubro'])){
	$rubro=$_POST['rubro'];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
if(isset($_GET['visita'])){
	$visita=$_GET['visita'];
}
if(empty($form)){
	include("dis_visita.php");
}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
	include("ls_visita.php");
//	include("../status/dis_visita_ver.php");
}elseif(($form==1)&&($_SESSION['privilegioss_id']==5)){
//	include("if_visita_a.php");
	include("ls_visita.php");
}elseif($form==2){
	include("if_visita_a.php");
}elseif($form==3){
	include("ip_visita_g_a.php");
}elseif($form==4){
	include("ip_visita_a.php");
}elseif($form==5){
	include("ip_concrecion.php");
}elseif($form==6){
	include("if_concrecion_a.php");
}elseif($form==7){
	include("ip_concrecion_a.php");
}elseif($form==8){
	echo 'Registro existoso';
}elseif($form==9){
	include("ip_visitas_posteriores.php");
}elseif($form==10){
	include("ip_visitas_posteriores_a.php");
}

?>