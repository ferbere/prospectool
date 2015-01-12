<?php
session_start();
include_once('classes/dis_data.class.php');
if(isset($_POST['ruta'])){
	$ruta=$_POST['ruta'];
}
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
if(isset($_GET['orden'])){
	$orden=$_GET['orden'];
}
if(isset($_GET['xyo'])){
	$xyo=$_GET['xyo'];
}
if(isset($_GET['date'])){
	$date=$_GET['date'];
}
$depart='Ranking de vendedores';
$priv=$_SESSION['privilegioss_id'];


/*** Los querys y/o arrays { ***/
include_once("classes/dis_data.class.php");

$sql_tits=array(0=>"Vendedor",1=>"Visitas");
//mysql_query('set @numero=0');
$sql="SELECT prospecta_usuario.nombre,COUNT(prospecta_visita.id) AS visitas,prospecta_usuario.id FROM prospecta_usuario INNER JOIN prospecta_visita ON prospecta_visita.vendedor = prospecta_usuario.id ";

$pez=" GROUP BY prospecta_usuario.nombre ";

$query=' order by prospecta_usuario.nombre DESC';


/*** } Los querys y/o arrays ***/
/*** Las variables { ***/
$query_long=3;
$sql_ord_long=count($sql_tits);
if(empty($date)){
	$date='anyo';
}
if($date=='anyo'){
	$sys='a&ntilde;o';
}else{
	$sys=$date;
}
switch ($this) {// Rellena el título para la navegación atrás y adelante;
	case 4:
		$thus=' que pasó';
		break;
	case 5:
		$thus=' que transcurre';
		break;
	case 6:
		$thus=' que viene';
		break;
	default:
		$thus=' que transcurre';
		break;
}
/*** } Las variables ***/
/**** El objeto instanciado { ****/
$dis=new disData($priv,$depart);//(privilegios,departamento: vistas)
$dis1=$dis->dD1($date);//fecha(dia,mes,semana y año)
$dis2=$dis->dD2($sql,$pez,$query,$query_long);//
	
/**** } El objeto instanciado ****/
/*** El objeto vivo {***/
		echo '<div>';
		echo 	'<div>';
		echo 		'<h1>'.$depart.'</h1>';
		echo 		'<h3>'.$sys.$thus.'</h3>';
		echo 	'</div>';
		echo '<table id="dis_visita">';
		echo '<tr>';
			for($h=0;$h<=($sql_ord_long);$h++){
		echo	 '<td id="Sdis_visita_tit"><a href="?ruta='.$ruta.'&form=4&xyo='.$xyo.'&orden='.$h.'">'.$sql_tits[$h].'</a></td>';
			}
		echo '</tr>';
		for($a=1;$a<=$dis2[1];$a++){
			$sfecha=date($dis2[2][$a][9]);
			$fecha_pactada=strtotime('+'.$dis2[2][$a][6].' day',strtotime($sfecha));
			$fecha_pactada = date ('Y-m-d',$fecha_pactada);
			$rEstaf=rEstaf($fecha_pactada);
			$dfecha=$rEstaf[1];
			$ruta_lki='<td id="dis_visita_cont"><a href="vendedores.php?ruta=directorio&form=4&xyo='.$dis2[2][$a][2].'">';
			$ruta_lkf='</a></td>';
		echo '<tr>';
			for($i=0;$i<=($sql_ord_long-1);$i++){
				if($dis2[2][$a][$i]!=$dis2[2][$a][6]){
		echo 		$ruta_lki.$dis2[2][$a][$i].$ruta_lkf;			
				}elseif($dis2[2][$a][$i]==$dis2[2][$a][6]){
					if($dis2[2][$a][10]==0){
		echo 			$ruta_lki.$dfecha.$ruta_lkf;
					}else{
		echo 		$ruta_lki.'vendido'.$ruta_lkf;
					}
				}
			}
		echo '</tr>';
		}
		echo '</table>';
		echo '</div>';
		
/*** } El objeto vivo ***/
?>