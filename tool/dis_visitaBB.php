<?php
session_start();
include_once("../classes/cambiaf_a_normal.class.php");
include_once("../classes/restaFechasD.class.php");
include_once("../classes/mysql.php");
$mysql=new MySQL();

$sql_array=array(0=>"Id",1=>"Empresa",2=>"Ciudad",3=>"Car&aacute;cter",4=>"Se interes&oacute;",5=>"Perspectiva de venta",6=>"Regresar en... (d&iacute;as)",7=>"Fecha",8=>"Vendedor");
$s_a=array(0=>"prospecta_directorio.id",1=>"prospecta_directorio.empresa",2=>"general_municipios.nombre",3=>"prospecta_caracter.nombre",4=>"general_sino.nombre",5=>"prospecta_perspectiva.nombre",6=>"prospecta_visita.resuelve",7=>"prospecta_visita.fecha",8=>"usuario_index.nombre");
if(isset($_GET['orden'])){
	$orden=$_GET['orden'];
}
if(empty($orden)){
	$query=" ";
}else{
	$query=' ORDER BY '.$s_a[$orden].' ASC ';
}
if($_SESSION['privilegioss_id']<=4){
	$muestra='';
}else{
	$muestra=" WHERE prospecta_visita.vendedor = ".$_SESSION['id'];
}
	$hoy=date('Y-m-d');

$sql=$mysql->consulta("SELECT prospecta_visita.id,prospecta_directorio.empresa,general_municipios.nombre,prospecta_caracter.nombre,general_sino.nombre,prospecta_perspectiva.nombre,prospecta_visita.resuelve,date_format(prospecta_visita.createtime,'%W %d, %M %Y'),usuario_index.nombre,prospecta_visita.createtime,prospecta_visita.concrecion FROM prospecta_visita INNER JOIN prospecta_directorio ON prospecta_visita.empresa = prospecta_directorio.id INNER JOIN general_municipios ON prospecta_directorio.ciudad = general_municipios.id INNER JOIN prospecta_caracter ON prospecta_directorio.caracter = prospecta_caracter.id INNER JOIN general_sino ON prospecta_visita.se_intereso = general_sino.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN usuario_index ON prospecta_visita.vendedor = usuario_index.id ".$muestra.$query);
echo '<table id="dis_visita">';
	echo '<tr>';
	for($h=0;$h<=8;$h++){
		echo '<td id="Sdis_visita_tit"><a href="index.php?ruta=ver_visita.php&orden='.$h.'">'.$sql_array[$h].'</a></td>';
	}
	echo '</tr>';
while($row=$mysql->fetch_array($sql)){
	$sfecha=date($row[9]);
	$fecha_pactada=strtotime('+'.$row[6].' day',strtotime($sfecha));
	$fecha_pactada = date ('Y-m-d',$fecha_pactada);
	$dfecha=rEstaf($fecha_pactada);
	echo '<tr>';
	for($i=0;$i<=8;$i++){
		if($row[$i]!=$row[6]){
			echo '<td id="dis_visita_cont"><a href="index.php?ruta=ver_visita.php&form=1&rubro='.$row[0].'">'.$row[$i].'</a></td>';			
		}elseif($row[$i]==$row[6]){
			if($row[10]==0){
				echo '<td id="dis_visita_cont"><a href="index.php?ruta=ver_visita.php&form=1&rubro='.$row[0].'">'.$dfecha.'</a></td>';
			}else{
				echo '<td id="dis_visita_cont"><a href="index.php?ruta=ver_visita.php&form=1&rubro='.$row[0].'">Vendido</a></td>';
			}
		}
	}
	echo '</tr>';
}
echo '</table>';
?>