<?php /* estamos dentro de visitas */
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
if($ruta=='dia'){// Dia
	if(empty($form)){
		include("dis_visitas.php");
	}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
		include("dis_visita_ver.php");
	}elseif($form==3){
		include("ip_visita_g_a.php");
	}
}elseif($ruta=='semana'){// Semana
	if(empty($form)){
		include("dis_visitas.php");
	}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
		include("dis_visita_ver.php");
	}elseif($form==3){
		include("ip_visita_g_a.php");
	}
}elseif($ruta=='mes'){// Mes
	if(empty($form)){
		include("dis_visitas.php");
	}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
		include("dis_visita_ver.php");
	}elseif($form==3){
		include("ip_visita_g_a.php");
	}
}elseif($ruta=='anyo'){// Año
	if(empty($form)){
		include("dis_visitas.php");
	}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
			include("dis_visita_ver.php");
	}elseif($form==3){
		include("ip_visita_g_a.php");
	}
}
?>