<?php
session_start();

if($_GET['cliente']){
	$cliente=$_GET['cliente'];
}
if($_GET['reparte']){
	$reparte=$_GET['reparte'];
}
include_once("../classes/mysql.php");
$mysql=new MySQL();
if(empty($reparte)){//Si está vacío reparte
	$sql=$mysql->consulta("SELECT id,user FROM usuario_index WHERE privilegios = 6");
	while($row=$mysql->fetch_array($sql)){
		echo '<a href="'.$_SERVER['PHP_SELF'].'?ruta=asignar.php&reparte='.$row[0].'&cliente='.$cliente.'">';
		echo 	$row[1].'<br>';
		echo '</a>';
	}
}else{//(!empty($reparte))
	header("Location: ".$_SERVER['PHP_SELF'].'?ruta=domicilio.php');
	$sql=$mysql->consulta("SELECT concat(abre,'->',cierra) AS pedido,cliente FROM restaurante_consumo WHERE cliente = '$cliente' ");
	while($row=$mysql->fetch_array($sql)){
		$pedido=$row[0];
		$cliente=$row[1];
//		$domicilio=$row[2];
		if($reparte==2){
			$estatus=7;
		}else{
			$estatus=4;			
		}
	}
	$sql2=$mysql->consulta("INSERT INTO restaurante_entrega (pedido,cliente,repartidor,estatus) VALUES ('{$pedido}','{$cliente}','{$reparte}','{$estatus}')");
	exit;
}

?>