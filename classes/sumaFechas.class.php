<?php
function sUmaf($viene,$cuanto){
	$nuevafecha = strtotime ( $cuanto , strtotime ( $viene ) ) ;
	$nuevafecha = date ( 'd-m-Y' , $nuevafecha );
	return $nuevafecha;
}
?>