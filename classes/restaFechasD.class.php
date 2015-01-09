<?php
function rEstaf($viene){
	$segundos=strtotime($viene) - strtotime('now');
	$diferencia_dias=intval($segundos/60/60/24);
	if($diferencia_dias<0){
		$excede=($diferencia_dias-($diferencia_dias)*2);
		$devuelve='¡El término se venció hace '.$excede.' días!';
	}else{
		$devuelve='¡Faltan '.$diferencia_dias.' días!';
	}
	$catch[0]=$devuelve;
	$catch[1]=$diferencia_dias;
	return $catch;
}
?>