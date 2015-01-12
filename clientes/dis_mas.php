<?php

$dep='mas';
include_once("classes/dis_rank.class.php");
$dis=new dis_visita('clientes.php',$ruta,$dep,'masuno');
$disp=$dis->dV();
//$disp2=$dis->dvB();
echo '<div id="status_tit">';
echo 	'<a href="'.$_SERVER["PHP_SELF"].'?otra=menosuno">';
echo 		'<<';
echo 	'</a>';
echo 	'Ranking de Clientes';
echo 	'<a href="'.$_SERVER["PHP_SELF"].'?otra=masuno">';
echo 		'>>';
echo 	'</a>';
echo '</div>';
echo $disp;
?>