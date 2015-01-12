<?php
session_start();
header("Location: ".$_SERVER['HTTP_REFERER']);
include_once('classes/conex.php');
$link=Conectarse();
if(isset($_GET['rubro'])){
	$rubro=$_GET['rubro'];
}
if(isset($_GET['borra'])){
	$borra=$_GET['borra'];
}
switch ($borra) {
	case 1:
		mysql_query("DELETE FROM prospecta_edicion WHERE id = '$rubro' ", $link);
		break;
	case 2:
		mysql_query("DELETE FROM prospecta_temporadas WHERE id = '$rubro' ", $link);
		break;
	case 3:
		mysql_query("DELETE FROM prospecta_cargo WHERE id = '$rubro' ", $link);
		break;
	case 4:
		mysql_query("DELETE FROM prospecta_perspectiva WHERE id = '$rubro' ", $link);
		break;
	case 5:
		mysql_query("DELETE FROM prospecta_anuncio WHERE id = '$rubro' ", $link);
		break;
	default:
		header("Location: ".$_SERVER['HTTP_REFERER']);
		break;
}
?>