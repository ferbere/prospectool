<?php /* estamos dentro de Vendedores */
session_start();

if(isset($_POST['form'])){
	$form=$_POST['form'];
}
if(isset($_GET['form'])){
	$form=$_GET['form'];
}	
switch ($form) {
	case 1:
		include("ip_vendedor.php");
		break;
	case 2:
		echo 'Registro existoso';
		break;
	case 3:
		echo 'Registro fallido';
		break;
	case 4:
		include("dis_usuario.php");
		break;
	case 5:
		include("if_vendedor_a.php");
		break;
	case 6:
		include("ip_vendedor_a.php");
		break;
	case 7:
		echo 'Registro modificado';
		break;
	case 8:
		echo 'Registro no modificado';
		break;
	default:
		include("bus_vendedores.php");
		break;
}