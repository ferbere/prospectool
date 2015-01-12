<?php
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
//echo 'Memoria usada en bytes '.memory_get_usage().'<br>';
//print_r($_SESSION);
if(empty($ruta)){
	if(empty($_SESSION['privilegioss_id'])){
		include("enruta_admin.php");
	}elseif($_SESSION['privilegioss_id']==1){
		include("visita.php");
	}elseif($_SESSION['privilegioss_id']==2){
		include("visita.php");	
	}elseif($_SESSION['privilegioss_id']==3){
//		include("ver_visita.php");	
		echo '<script>window.location.href="../status/index.php";</script>';
	}elseif($_SESSION['privilegioss_id']==4){
		echo '<script>window.location.href="../status/index.php";</script>';
	}elseif($_SESSION['privilegioss_id']==5){
		include("visita.php");
	}else{
		include("");
	}

}else{
	include($ruta);
}
?>
