<?php
session_start();
include_once("classes/cambiaf_a_normal.class.php");
include_once("classes/restaFechasD.class.php");
include_once("classes/mysql.php");
$mysql=new MySQL();
if(isset($_POST['rubro'])){
	$rubro=$_POST['rubro'];
}
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
}
if($_SESSION['privilegioss_id']<=4){
	$muestra='';
}else{
	$muestra=" AND prospecta_visita.vendedor = ".$_SESSION['id'];
}
$sql=$mysql->consulta("SELECT prospecta_concrecion.id,prospecta_directorio.empresa,usuario_index.nombre,prospecta_concrecion.edicion,prospecta_anuncio.nombre,general_sino.nombre,prospecta_concrecion.createtime FROM prospecta_concrecion INNER JOIN prospecta_directorio ON prospecta_concrecion.empresa = prospecta_directorio.id INNER JOIN usuario_index ON prospecta_concrecion.vendedor = usuario_index.id INNER JOIN prospecta_anuncio ON prospecta_concrecion.anuncio = prospecta_anuncio.id INNER JOIN general_sino ON prospecta_concrecion.pagado = general_sino.id ");
while($row=$mysql->fetch_array($sql)){
	$id=$row[0];
	$empresa=$row[1];
	$vendedor_v=$row[2];
	$edicion=$row[3];
	$anuncio=$row[4];
	$pagado=$row[5];
}

if(($_SESSION['id']!=$vendedor_id)&&($_SESSION['privilegioss_id']>4)){
	echo 'No es un contenido que usted pueda ver. Pero com&eacute;ntele sin pena a su jefe inmediato para obtener las licencias necesarias.';
}else{
	echo '<h1>Venta</h2>';
	echo '<label>Nombre del ejecutivo: <b><i>'.$vendedor_v.'</b></i></label>';
	echo '<label>Edicion: <b>'.$edicion.'</b></label>';
	echo '<label>Empresa: <b>'.$empresa.'</b></label>';
	echo '<label>Anuncio vendido: <b>'.$anuncio.'</b></label>';
	echo '<label>Pagado: <b>'.$pagado.'</b></label>';
}
?>