<?php
include_once('../classes/t_d_venta.class.php');
include_once('../classes/t_d_visita.class.php');
include_once('../classes/mysql.php');
$mysql=new MySQL();

if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
if(isset($_POST['departamento'])){
	$departamento=$_POST['departamento'];
}
if(isset($_GET['departamento'])){
	$departamento=$_GET['departamento'];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
if($departamento=='ventas'){
	$dep='venta';
}elseif($departamento=='visitas'){
	$dep='visita';
}
if(empty($ruta)){
	$sql=$mysql->consulta("SELECT id,nombre FROM prospecta_panel WHERE visible = 1 ");
	while($row=$mysql->fetch_array($sql)){
		echo '<div id="st">';
		echo 	'<div id="st_tit">'.$row[1].'</div>';
		$sql2=$mysql->consulta("SELECT c_0,c_1,c_2,c_3,c_4 FROM prospecta_panel WHERE visible = 1 AND id = ".$row[0]);
		while($row2=$mysql->fetch_array($sql2)){
			for($i=0;$i<4;$i++){
				if($row2[$i]=='ano'){
					$sus[$i]='a&ntilde;o';
				}else{
					$sus[$i]=$row2[$i];
				}
				echo 	'<div class="alba" id="alba">';
				echo 		'<a href="index.php?ruta='.$row2[$i].'&departamento='.$row[1].'">';
				echo 			'<span>'.$sus[$i];
				if($row[1]=='ventas'){
					$td_ve=new t_d_venta($row2[$i]);
					$tdve=$td_ve->td_Venta();
					echo 		'<br><object>($'.number_format($tdve,2).')</object>';
				}elseif($row[1]=='visitas'){
					$td_vi=new t_d_visita($row2[$i]);
					$tdvi=$td_vi->td_Visita();
					echo 		'<br><object>('.$tdvi.')</object>';
				}
				echo 			'</span>';
				echo 		'</a>';
				echo 	'</div>';
			}
		}
		echo '</div>';
	}
}elseif($ruta=='dia'){// Dia
	if(empty($form)){
		include("dis_status.php");
	}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
		include("dis_visita_ver.php");
	}elseif($form==3){
		include("ip_visita_g_a.php");
	}
}elseif($ruta=='semana'){// Semana
	if(empty($form)){
		include("dis_status.php");
	}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
		include("dis_visita_ver.php");
	}elseif($form==3){
		include("ip_visita_g_a.php");
	}
}elseif($ruta=='mes'){// Mes
	if(empty($form)){
		include("dis_status.php");
	}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
		include("dis_visita_ver.php");
	}elseif($form==3){
		include("ip_visita_g_a.php");
	}
}elseif($ruta=='ano'){// Año
	if(empty($form)){
		include("dis_status.php");
	}elseif(($form==1)&&($_SESSION['privilegioss_id']<5)){
		if($departamento=='visita'){
			include("dis_visita_ver.php");
		}elseif($departamento=='venta'){
			include("dis_venta_ver.php");
		}
	}elseif($form==3){
		include("ip_visita_g_a.php");
	}
}
?>