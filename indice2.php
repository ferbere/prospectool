<?php
include_once('classes/t_d_venta.class.php');
include_once('classes/t_d_visita.class.php');
include_once('classes/mysql.php');
$mysql=new MySQL();

$sql=$mysql->consulta("SELECT id,nombre FROM menus_submenu WHERE id > 1 ");
while($row=$mysql->fetch_array($sql)){
	echo '<div id="st">';
	echo 	'<div id="st_tit">'.$row[1].'</div>';
	$sql2=$mysql->consulta("SELECT nombre,ruta,imagen FROM menus_botones WHERE visible = 1 AND posicion = 1 AND submenu = ".$row[0]);
	while($row2=$mysql->fetch_array($sql2)){
		echo 	'<div class="alba" id="alba">';
		echo 		'<a href="'.$row2[1].'">';
		echo 			'<span>'.$row2[0];
		if($row[1]=='ventas'){
			$td_ve=new t_d_venta($row2[2]);
			$tdve=$td_ve->td_Venta();
			echo 		'<br><object>($'.number_format($tdve,2).')</object>';
		}elseif($row[1]=='visitas'){
			$td_vi=new t_d_visita($row2[2]);
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