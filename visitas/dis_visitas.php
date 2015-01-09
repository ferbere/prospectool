<?php
if($ruta=='anyo'){
	$sys='a&ntilde;o';
}else{
	$sys=$ruta;
}
$dep='visita';
include_once("classes/dis_".$dep.".class.php");
$dis=new dis_visita('visitas.php',$ruta,$dep,'masuno');
$disp=$dis->dV();
//$disp2=$dis->dvB();
echo '<div id="status_tit">';
echo 	'<a href="'.$_SERVER["PHP_SELF"].'?otra=menosuno">';
echo 		'<<';
echo 	'</a>';
echo 	$dep.'s del '.$sys;
echo 	'<a href="'.$_SERVER["PHP_SELF"].'?otra=masuno">';
echo 		'>>';
echo 	'</a>';
echo '</div>';
echo $disp;
?>