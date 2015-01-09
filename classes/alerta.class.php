<?php
function aLerta($f,$r,$c){
	include_once("cambiaf_a_normal.class.php");
	include_once("restaFechasD.class.php");
	$hoy=date('Y-m-d');
	$sfecha=date($f);
	$fecha_pactada=strtotime('+'.$r.' day',strtotime($sfecha));
	$fecha_pactada = date ('Y-m-d',$fecha_pactada);
	$un=rEstaf($fecha_pactada);
	if($r==0){
		$resuelve_m='';
	}else{
		$resuelve_m=' Contactar el '.cambiaf_a_normal($fecha_pactada).'. <b>'.$un[0].'</b>';
	}
	if($c==0){
		$catch = '<div id="alerta">'.$resuelve_m.'</div>';
	}else{
		$catch = '<div id="vendido">vendido</div>';
	}
	return($catch);
}
?>