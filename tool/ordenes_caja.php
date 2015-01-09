<?php
session_start();
include_once("../classes/mysql.php");
$mysql=new MySQL();
include_once("../classes/mesa.class.php");
$mes=new meSa(null,null);

$unset = $mes->meS_unset();//Borra las sesiones activas de mesa y cliente
?>
<head>
<script>
function validateForm() {
    var x = document.forms["form_mesas"]["personas"].value;
    if (x == null || x == "") {
        alert("First name must be filled out");
        return false;
    }
}
</script></head>
<div id="caja">
	<div id="caja_titulo">
		Control de mesas
	</div>
<?php
$sql2=$mysql->consulta("SELECT restaurante_consumo.mesa,SUM(restaurante_consumo.cantidad*restaurante_index.precio) as total,restaurante_consumo.personas FROM restaurante_consumo INNER JOIN restaurante_index ON restaurante_consumo.consumo = restaurante_index.id WHERE restaurante_consumo.estatus = 0 GROUP BY restaurante_consumo.mesa " );

while($row2=$mysql->fetch_array($sql2)){
	if($row2[0]!=''){
		$ocupado[$row2[0]]	=	"ocupado-si";
	}
	$lacuenta[$row2[0]]		=	$row2[1];
	$pers_mesa[$row2[0]]	=	$row2[2];
}
$mes1=$mes->meS_mesas();
$mes1a=$mes1[0];//cantidad de mesas habidas
$mes1b=$mes1[1];//array con los ID's de las mesas
$mes1c=$mes1[2];//array con los nombres de las mesas

for($i=0;$i<$mes1a;$i++){
	if(($ocupado[$mes1b[$i]]=='')&&($mes1b[$i]>1)){
		$pesos='';
		$sait='ocupado-no';
		$ruta='ordenes_mesa.php';
		$pers='';
		$onas='<br><span>(personas)</span><br>';
		
		$dev  = '<form name="form_mesas" action="index.php" onsubmit="return validateForm()" method="get">';
		$dev .= '<input type="hidden" name="ruta" value="'.$ruta.'">';
		$dev .= '<input type="hidden" name="rubro" value="'.$mes1b[$i].'">';
		$dev .= '<input id="mesas_submit" type="submit" value="'.$mes1c[$i].'">';
		$dev .= '<input type="text" name="personas" size="2" placeholder="0">';
		$dev .= '</form>';
	}elseif(($ocupado[$mes1b[$i]]=='')&&($mes1b[$i]==1)){
		$sait='ocupado-no';
		$pesos='';
		$ruta='ordenes_mesa.php';
		$pers='';
		$onas='';
		
		$dev  =	'<div id="ca_oc_si">';
		$dev .=	'<a href="index.php?ruta='.$ruta.'&rubro='.$mes1b[$i].'">';
		$dev .= $mes1c[$i];
		$dev .= '</a>';
		$dev .= '</div>';
	}else{
		$sait='ocupado-si';
		$pesos='$';
		$ruta='if_a.php';
		$pers=$pers_mesa[$mes1b[$i]];
		$onas='<br><span>(personas)</span><br>';
		
		$dev  =	'<div id="ca_oc_si">';
		$dev .=	'<a href="index.php?ruta='.$ruta.'&rubro='.$mes1b[$i].'">';
		$dev .= $mes1c[$i];
		$dev .= '</a>';
		$dev .= '</div>';
	}
	echo '<div id="caja_int" class="caja_'.$sait.'">';
	echo 	$dev;
	echo 	$pers.$onas;
	echo 	$pesos.$lacuenta[$mes1b[$i]];
	echo '</div>';
}
?>
</div>