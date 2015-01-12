<?php
session_start();
include_once('classes/dis_data.class.php');
if(isset($_POST['ruta'])){
	$date=$_POST['ruta'];
}
if(isset($_GET['ruta'])){
	$date=$_GET['ruta'];
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
$depart='visitas';
$priv=$_SESSION['privilegioss_id'];


/*** Los querys y/o arrays { ***/
include_once("classes/dis_data.class.php");

$sql_tits=array(0=>"Orden",1=>"Empresa",2=>"Ciudad",3=>"Car&aacute;cter",4=>"Se interes&oacute;",5=>"Perspectiva de venta",6=>"Regresar en... (d&iacute;as)",7=>"Fecha",8=>"Vendedor");
$sql_ord=array(0=>"prospecta_directorio.id",1=>"prospecta_directorio.empresa",2=>"general_municipios.nombre",3=>"prospecta_caracter.nombre",4=>"general_sino.nombre",5=>"prospecta_perspectiva.nombre",6=>"prospecta_visita.resuelve",7=>"prospecta_visita.fecha",8=>"prospecta_usuario.nombre");
mysql_query('set @numero=0');
$sql="SELECT @numero:=@numero+1 AS enum,prospecta_directorio.empresa,general_municipios.nombre,prospecta_caracter.nombre,general_sino.nombre,prospecta_perspectiva.nombre,prospecta_visita.resuelve,date_format(prospecta_visita.createtime,'%W %d, %M %Y'),prospecta_usuario.nombre,prospecta_visita.createtime,prospecta_visita.concrecion,prospecta_visita.id FROM prospecta_visita INNER JOIN prospecta_directorio ON prospecta_visita.empresa = prospecta_directorio.id INNER JOIN general_municipios ON prospecta_directorio.ciudad = general_municipios.id INNER JOIN prospecta_caracter ON prospecta_directorio.caracter = prospecta_caracter.id INNER JOIN general_sino ON prospecta_visita.se_intereso = general_sino.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN prospecta_usuario ON prospecta_visita.vendedor = prospecta_usuario.id";
	
//$pez=" AND prospecta_visita.vendedor = ".$xyo;

if(empty($orden)){
	$query=" ";
}else{
	$query=' ORDER BY '.$sql_ord[$orden].' ASC ';
}

/*** } Los querys y/o arrays ***/
/*** Las variables { ***/
$query_long=11;
$sql_ord_long=count($sql_ord);
if(empty($date)){
	$date='mes';
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
		echo 		'<h1>Las '.$depart.'</h1>';
		echo 		'<h3>'.$sys.$thus.'</h3>';
		echo 	'</div>';
		echo '<table id="dis_visita">';
		echo '<tr>';
			for($h=0;$h<=($sql_ord_long-1);$h++){
		echo	 '<td id="Sdis_visita_tit"><a href="?ruta='.$ruta.'&form=4&xyo='.$xyo.'&orden='.$h.'">'.$sql_tits[$h].'</a></td>';
			}
		echo '</tr>';
//		while($row=$this->mysql->fetch_array($sql)){
		for($a=1;$a<=$dis2[1];$a++){
			$sfecha=date($dis2[2][$a][9]);
			$fecha_pactada=strtotime('+'.$dis2[2][$a][6].' day',strtotime($sfecha));
			$fecha_pactada = date ('Y-m-d',$fecha_pactada);
			$rEstaf=rEstaf($fecha_pactada);
			$dfecha=$rEstaf[1];
//			$ruta_lki='<td id="dis_visita_cont"><a href="?ruta=prospectos&form=4&rubro='.$dis2[2][$a][11].'">';
			$ruta_lki='<td id="dis_visita_cont"><a href="visitas.php?ruta=&form=1&rubro='.$dis2[2][$a][11].'">';
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