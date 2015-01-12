<?php
session_start();
include_once('classes/t_d_venta.class.php');
include_once('classes/t_d_visita.class.php');
include_once('classes/mysql.php');
$mysql=new MySQL();

include_once("classes/navbar.class.php");

$sql=$mysql->consulta("SELECT id,nombre FROM menus_submenu WHERE id > 1 ");
while($row=$mysql->fetch_array($sql)){
	$eje=new navBar(1,null,$row[0]);
	$dame_eje=$eje->dBin($_SESSION['privilegioss_id']);
	$dame_eje2=$eje->bTn();
	echo '<div id="st">';
	if(($_SESSION['privilegioss_id']==5)&&($row[0]==6)){

	}else{
		echo 	'<div id="st_tit">'.$row[1].'</div>';
	}
	for($i=1;$i<=$dame_eje2[0];$i++){
		echo 	'<div class="alba" id="alba">';
		echo 		'<a href="'.$dame_eje2[4][$i].'">';
		echo 			'<span>'.$dame_eje2[1][$i];
		if(($row[1]=='ventas')&&($_SESSION['privilegioss_id']<=4)){
			$td_ve=new t_d_venta($dame_eje2[3][$i]);
			$tdve=$td_ve->td_Venta();
			echo 		'<br><object>($'.number_format($tdve,2).')</object>';
		}if(($row[1]=='ventas')&&($_SESSION['privilegioss_id']==5)){
			$td_vi=new t_d_visita($dame_eje2[3][$i]);
			$tdvi=$td_vi->td_Visita();
			echo 		'<br><object>('.$tdvi.')</object>';
		}elseif($row[1]=='visitas'){
			$td_vi=new t_d_visita($dame_eje2[3][$i]);
			$tdvi=$td_vi->td_Visita();
			echo 		'<br><object>('.$tdvi.')</object>';
		}
		echo 			'</span>';
		echo 		'</a>';
		echo 	'</div>';
	}
	echo '</div>';
}
?>