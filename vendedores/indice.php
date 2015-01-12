<?php
/* Es el indice de vendedores.php */
if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
if(!empty($ruta)){
	include($ruta.'.php');
}else{
	if($form=='if'){
		include("if_vendedor.php");
//		echo 'iguana';
	}else{
		echo 'Chale';
	}
}
?>