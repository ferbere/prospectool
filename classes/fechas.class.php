<?php
function cambiaf_a_normal($fecha){ 
   	preg_match('/'."([0-9]{2,4})-([0-9]{1,2})-([0-9]{1,2})".'/', $fecha, $mifecha); 
   	$lafecha=$mifecha[3]."/".$mifecha[2]."/".$mifecha[1]; 
   	return $lafecha; 
}
function fecha_efe($fecha){ 
   	preg_match('/'."([0-9]{2,4})-([0-9]{1,2})-([0-9]{1,2})".'/', $fecha, $mifecha); 
   	$fecha_efe=$mifecha[3]."/".$mifecha[2]; 
   	return $fecha_efe; 
}

function delanio($fecha){ 
   	preg_match('/'."([0-9]{2,4})-([0-9]{1,2})-([0-9]{1,2})".'/', $fecha, $mifecha); 
   	$delanio=$mifecha[1]; 
   	return $delanio; 
}

?>
