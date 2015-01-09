<?php
function cambiaf_a_normal($fecha){ 
	$piezas = explode('-', $fecha);
	$nueva_fecha = $piezas[2].'-'.$piezas[1].'-'.$piezas[0];
   	return $nueva_fecha; 
}
?>
