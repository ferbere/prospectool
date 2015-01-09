<?php
session_start();
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
}
if(isset($_POST['rubro'])){
	$rubro=$_POST['rubro'];
}
if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}
$sql=$mysql->consulta("SELECT observaciones_g,observaciones_dg FROM prospecta_visita WHERE id = '$rubro'");
while($row=$mysql->fetch_array($sql)){
	$g=$row[0];
	$dg=$row[1];
}

if($_SESSION['privilegioss_id']==3){
	$obs='Direcci&oacute;n General';
	$obs1='dg';
}elseif($_SESSION['privilegioss_id']==4){
	$obs='Gerencia de ventas';
	$obs1='g';
}else{
	$obs='Test';
}
echo '<label>Observaciones Gerencia de Ventas: <b>'.$g.'</b></label>';
echo '<label>Observaciones Direcci&oacute;n General: <b>'.$dg.'</b></label>';
$echo  = '<form action="visitas.php" method="post">';
$echo .= '<input type="hidden" name="ruta" value="dia" >';
$echo .= '<input type="hidden" name="form" value="3" >';
$echo .= '<input type="hidden" name="rubro" value="'.$rubro.'" >';
$echo .= '<label>Observaciones '.$obs.':</label>';
$echo .= '<textarea name="observaciones_'.$obs1.'"></textarea>';
$echo .= '<input type="submit" value="guardar" >';
$echo .= '</form>';
if(($_SESSION['privilegioss_id']==3)&&(empty($dg))){
	echo $echo;
}elseif(($_SESSION['privilegioss_id']==4)&&(empty($g))){
	echo $echo;
}else{
	
}
?>