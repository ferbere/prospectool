<?php
include_once("classes/cambiaf_a_normal.class.php");
include_once("classes/restaFechasD.class.php");
include_once("classes/mysql.php");
$mysql=new MySQL();
session_start();
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
$sino=array(0=>"No",1=>"S&iacute;");
$sql=$mysql->consulta("SELECT prospecta_visita.edicion,prospecta_directorio.empresa,prospecta_visita.se_anuncia,prospecta_visita.se_anuncia_d,prospecta_visita.se_anuncia_so,prospecta_visita.se_intereso,prospecta_perspectiva.nombre,prospecta_visita.que_dijo,prospecta_visita.resuelve,prospecta_visita.observaciones_v,usuario_index.nombre,date_format(prospecta_visita.createtime,'%Y-%m-%d'),usuario_index.id,prospecta_visita.concrecion FROM prospecta_visita INNER JOIN prospecta_directorio ON prospecta_visita.empresa = prospecta_directorio.id INNER JOIN prospecta_perspectiva ON prospecta_directorio.perspectiva = prospecta_perspectiva.id INNER JOIN usuario_index ON prospecta_visita.vendedor = usuario_index.id WHERE prospecta_visita.id = ".$rubro.$muestra );
while($row=$mysql->fetch_array($sql)){
	$edicion = $row[0];
	$empresa = $row[1];
	if($row[2]==0){
		$se_anuncia=$sino[0];	
	}else{
		$se_anuncia=$sino[1];
	}
	$se_anuncia_d=$row[3];
	if($row[4]==0){
		$se_anuncia_so=$sino[0];	
	}else{
		$se_anuncia_so=$sino[1];
	}
	if($row[5]==0){
		$se_intereso=$sino[0];
	}else{
		$se_intereso=$sino[1];
	}
	$perspectiva=$row[6];
	$que_dijo=$row[7];
	$resuelve=$row[8];	
	$observaciones_v=$row[9];
	$vendedor_v=$row[10];
	$fecha=$row[11];
	$vendedor_id=$row[12];
	$concrecion=$row[13];
}
	$hoy=date('Y-m-d');
	$fecha_d=cambiaf_a_normal($fecha);
	$sfecha=date($fecha);
	$fecha_pactada=strtotime('+'.$resuelve.' day',strtotime($sfecha));
	$fecha_pactada = date ('Y-m-d',$fecha_pactada);
	$rEstaf=rEstaf($fecha_pactada);
	if($resuelve==0){
		$resuelve_m='';
	}else{
		$resuelve_m=' Es decir el pr&oacute;ximo '.cambiaf_a_normal($fecha_pactada).'. <b>&iexcl;Faltan '.$rEstaf[1].' d&iacute;as!</b>';
	}
	if($concrecion==1){
		echo '<div id="vendido">Vendido</div>';
	}else{

	}
if(($_SESSION['id']!=$vendedor_id)&&($_SESSION['privilegioss_id']>4)){
	echo 'No es un contenido que usted pueda ver. Pero com&eacute;ntele sin pena a su jefe inmediato para obtener las licencias necesarias.';
}else{
	echo '<h1>Visita</h2>';
	echo '<label>Nombre del ejecutivo: <b><i>'.$vendedor_v.'</b></i></label>';
	echo '<label>Edicion: <b>'.$edicion.'</b> <small>(realizada el d&iacute;a: '.$fecha_d.')</small></label>';
	echo '<label>Empresa: <b>'.$empresa.'</b></label>';
	echo '<label>Se anuncia: <b>'.$se_anuncia.'</b></label>';
	echo '<label>D&oacute;nde: <b>'.$se_anuncia_d.'</b></label>';
	echo '<label>En Solo Ofertas: <b>'.$se_anuncia_so.'</b></label>';
	echo '<label>Se interes&oacute;: <b>'.$se_intereso.'</b></label>';
	echo '<label>Perspectiva: <b>'.$perspectiva.'</b></label>';
	echo '<label>Qu&eacute; dijo: <b>'.$que_dijo.'</b></label>';
	echo '<label>Cu&aacute;ndo resuelve: <b>Se qued&oacute; que en ('.$resuelve.') d&iacute;as.</b>'.$resuelve_m.'</label>';
	echo '<label>Observaciones vendedor: <b>'.$observaciones_v.'</b></label>';
}
include("if_visita_g_a.php");
?>