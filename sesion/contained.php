<?php
if(isset($_GET['ruta'])){
	$ruta=$_GET['ruta'];
}
if(empty($ruta)){
	$ruta='session.php';
}
		include($ruta);
?>
