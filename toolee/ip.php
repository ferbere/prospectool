<?php
session_start();
header("Location: ".$_SERVER['PHP_SELF'].'?ruta=if_a.php&rubro='.$_SESSION['mesa']);
include_once("../classes/mysql.php");
$mysql=new MySQL();

if($_SESSION['cliente_e']=='pedidos.php'){
	$estatus=10;
}

$i=$_GET['i']-1;
$r=$_GET;
for($f=0;$f<=$i;$f++){
	$p='producto'.$f;
	$c='cantidad'.$f;
	$producto[$f]=$r[$p];
	$cantidad[$f]=$r[$c];
	if($cantidad[$f]==''){
	}else{
		$sql=$mysql->consulta("INSERT INTO restaurante_consumo (mesa,consumo,cantidad,iden,cliente,personas) values ('{$_SESSION['mesa']}','{$producto[$f]}','{$cantidad[$f]}','{$_SESSION['id']}','{$_SESSION['cliente_id']}','{$_SESSION['mesa_personas']}' )");
		if(!$mysql){
			die ("Pos no se capturó el contenido, parece que: " .mysql_error());
		}else{
//			echo "exito";
		}
	}
}
			break;
?>
